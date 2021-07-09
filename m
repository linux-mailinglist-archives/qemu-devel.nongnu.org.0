Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F0A3C22F0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:36:41 +0200 (CEST)
Received: from localhost ([::1]:34086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ooC-0005ah-Gm
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oTs-0008SE-Mh
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:40 -0400
Received: from mga06.intel.com ([134.134.136.31]:37176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oTq-0005Av-V7
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800828"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730271"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:14:55 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/33] hostmem-epc: Add the reset interface for EPC backend
 reset
Date: Fri,  9 Jul 2021 19:09:44 +0800
Message-Id: <20210709110955.73256-23-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
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
index b512a68cb0..3bd1535d82 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -16,6 +16,7 @@
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
+#include "hw/i386/pc.h"
 
 #define TYPE_MEMORY_BACKEND_EPC "memory-backend-epc"
 
@@ -55,6 +56,21 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
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
index c22f5eded6..f603e2f75a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -202,6 +202,8 @@ extern const size_t pc_compat_6_0_len;
 
 /* sgx-epc.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
+void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
+                              Error **errp);
 
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
-- 
2.29.2.334.gfaefdd61ec


