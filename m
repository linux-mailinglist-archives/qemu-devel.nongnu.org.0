Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A49831C590
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:34:39 +0100 (CET)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqCE-0006yp-3x
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpu7-0006kn-17
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:55 -0500
Received: from mga17.intel.com ([192.55.52.151]:25639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpu3-0001Zp-FW
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:54 -0500
IronPort-SDR: we8iy6bg12f7spCkDUikYMeUvt1VWfS4SeZ2pXrDOnxlmcUbtMfrUFZjsESOsL6DNoxISHdPhB
 sr4OhFakxrkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558775"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558775"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:53 -0800
IronPort-SDR: EWfpFLeWP33SB+MsXpK3VvYQ5ivgrXW4hOPO7hw/pMaqdefliQA9zagfa45zwJDwYRrh6aCb0t
 QLU1aXgpJKDg==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705447"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:53 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 20/23] i386/tdx: Add TDVF memory via INIT_MEM_REGION
Date: Mon, 15 Feb 2021 18:13:16 -0800
Message-Id: <e6a374b5ac3f08fbd4227080d607f8b17640cac8.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
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
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add, and optionally measure, TDVF memory via KVM_TDX_INIT_MEM_REGION as
part of finalizing the TD.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 target/i386/kvm/tdx.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 8e4bf98735..49b4355849 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -83,10 +83,26 @@ static void tdx_finalize_vm(Notifier *notifier, void *unused)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     TdxGuest *tdx = TDX_GUEST(ms->cgs);
+    TdxFirmwareEntry *entry;
 
     tdvf_hob_create(tdx, tdx_get_hob_entry(tdx));
 
+    for_each_fw_entry(&tdx->fw, entry) {
+        struct kvm_tdx_init_mem_region mem_region = {
+            .source_addr = (__u64)entry->mem_ptr,
+            .gpa = entry->address,
+            .nr_pages = entry->size / 4096,
+        };
+
+        __u32 metadata = entry->attributes & TDVF_SECTION_ATTRIBUTES_EXTENDMR ?
+                         KVM_TDX_MEASURE_MEMORY_REGION : 0;
+
+        tdx_ioctl(KVM_TDX_INIT_MEM_REGION, metadata, &mem_region);
+    }
+
     tdx_ioctl(KVM_TDX_FINALIZE_VM, 0, NULL);
+
+    tdx->parent_obj.ready = true;
 }
 
 static Notifier tdx_machine_done_late_notify = {
@@ -288,9 +304,6 @@ static void tdx_guest_init(Object *obj)
     tdx->debug = false;
     object_property_add_bool(obj, "debug", tdx_guest_get_debug,
                              tdx_guest_set_debug);
-
-    /* TODO: move this after fully TD initialized */
-    tdx->parent_obj.ready = true;
 }
 
 static void tdx_guest_finalize(Object *obj)
-- 
2.17.1


