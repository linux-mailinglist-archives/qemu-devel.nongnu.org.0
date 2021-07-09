Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167CB3C22C8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:25:11 +0200 (CEST)
Received: from localhost ([::1]:58740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1od4-0007FY-3V
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oU4-0000oJ-SY
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:37176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oU3-0005Av-2q
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800843"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800843"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730300"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:15:01 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/33] hostmem-epc: Make prealloc consistent with qemu
 cmdline during reset
Date: Fri,  9 Jul 2021 19:09:47 +0800
Message-Id: <20210709110955.73256-26-yang.zhong@intel.com>
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
-- 
2.29.2.334.gfaefdd61ec


