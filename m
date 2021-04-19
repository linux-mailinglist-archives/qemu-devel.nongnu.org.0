Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F81B363FB6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:40:41 +0200 (CEST)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRKa-00078q-GG
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4N-0005Zq-BL
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:55 -0400
Received: from mga17.intel.com ([192.55.52.151]:24096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4L-000256-HX
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:55 -0400
IronPort-SDR: YRm0piIJEgbph+a3iUhNxM69y1THg1RTUG6AtkFF0/2phhBW0UN4fy1Tmh27oBGgAR1gqDq0Oo
 xrx3BAvnnUmA==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409318"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409318"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:23:08 -0700
IronPort-SDR: gaLT3Up4IDkW1r6B4Kc7NsDc3oi15fgpH9iK4LwbqIsOIPI2KeT0jZHf/omEDR/VSTzlB2bWhx
 5EsefbT4ZStA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947480"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:23:07 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/32] hostmem: Add the reset interface for EPC backend reset
Date: Mon, 19 Apr 2021 18:01:47 +0800
Message-Id: <20210419100156.53504-24-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the sgx_memory_backend_reset() interface to handle EPC backend
reset when VM is reset. This reset function will destroy previous
backend memory region and re-mmap the EPC section for guest.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 backends/hostmem-epc.c | 16 ++++++++++++++++
 include/hw/i386/pc.h   |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 627318c0a6..c193bf6133 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -16,6 +16,7 @@
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
+#include "hw/i386/pc.h"
 
 #define TYPE_MEMORY_BACKEND_EPC "memory-backend-epc"
 
@@ -53,6 +54,21 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     g_free(name);
 }
 
+void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
+                              Error **errp)
+{
+    MemoryRegion *mr = &backend->mr;
+
+    mr->enabled = false;
+
+    /* destroy the old memory region if it exist */
+    if (fd > 0 && mr->destructor) {
+        mr->destructor(mr);
+    }
+
+    sgx_epc_backend_memory_alloc(backend, errp);
+}
+
 static void sgx_epc_backend_instance_init(Object *obj)
 {
     HostMemoryBackend *m = MEMORY_BACKEND(obj);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 71e2fc6f26..44b8c5d271 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -202,6 +202,8 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 
 /* sgx-epc.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
+void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
+                              Error **errp);
 
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
-- 
2.29.2.334.gfaefdd61ec


