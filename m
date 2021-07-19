Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52723CD401
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:38:25 +0200 (CEST)
Received: from localhost ([::1]:35156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5RbM-0008Cd-QZ
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RRt-0006nI-1M
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:28:37 -0400
Received: from mga09.intel.com ([134.134.136.24]:16180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RRr-000613-D0
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:28:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211035303"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="211035303"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 04:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="656813719"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 04:27:51 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/33] hostmem-epc: Make prealloc consistent with qemu
 cmdline during reset
Date: Mon, 19 Jul 2021 19:21:28 +0800
Message-Id: <20210719112136.57018-26-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

If qemu cmdline set the prealloc property for sgx epc and VM do the
reset the prealloc property will be different with cmdline settings.
This patch can make sure same prealloc property setting with cmdline.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 backends/hostmem-epc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 3bd1535d82..9836358841 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -60,6 +60,8 @@ void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
                               Error **errp)
 {
     MemoryRegion *mr = &backend->mr;
+    void *ptr;
+    uint64_t sz;
 
     mr->enabled = false;
 
@@ -69,6 +71,14 @@ void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
     }
 
     sgx_epc_backend_memory_alloc(backend, errp);
+
+    ptr = memory_region_get_ram_ptr(&backend->mr);
+    sz = memory_region_size(&backend->mr);
+
+    if (backend->prealloc) {
+        os_mem_prealloc(memory_region_get_fd(&backend->mr), ptr, sz,
+                        backend->prealloc_threads, errp);
+    }
 }
 
 static void sgx_epc_backend_instance_init(Object *obj)

