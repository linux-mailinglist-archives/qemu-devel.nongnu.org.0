Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BB374CFC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:45:00 +0200 (CEST)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT4V-0007Dh-7R
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0u-0002fq-KK
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:16 -0400
Received: from mga17.intel.com ([192.55.52.151]:23062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0s-0007db-3W
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:16 -0400
IronPort-SDR: JFBVeWNp5iIlwE54fXnRXOuMBdL9x6/G0f3jwnwjj0A2v+joGJdQf7VK+R2DC+PqgxzrJXQxkJ
 DGYzOk8j3OXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178579148"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="178579148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:11 -0700
IronPort-SDR: +aGY4EzyJD9S1GtGVUkEkdSKjoINddR0rLoGI2JG83jpe49jZ+WiJo9TCVl8LJzPPIZcsk8Ea0
 QgqzRgq49FlQ==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220373"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:08 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 04/10] Implements the common
 MemoryRegion::ram_debug_ops for encrypted guests
Date: Thu,  6 May 2021 09:40:31 +0800
Message-Id: <20210506014037.11982-5-yuan.yao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506014037.11982-1-yuan.yao@linux.intel.com>
References: <20210506014037.11982-1-yuan.yao@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=yuan.yao@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Thomas.Lendacky@amd.com, ashish.kalra@amd.com,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, mtosatti@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 yuan.yao@intel.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuan Yao <yuan.yao@intel.com>

The new functions are added into target/i386/kvm/kvm.c as common functions
to support encrypted guest for KVM on x86.

Now we enable these only for INTEL TD guests.

Signed-off-by: Yuan Yao <yuan.yao@intel.com>

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 05bf4f8b8b..5050b2a82f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -134,6 +134,9 @@ static struct kvm_msr_list *kvm_feature_msrs;
 
 static int vm_type;
 
+void kvm_encrypted_guest_set_memory_region_debug_ops(void *handle,
+                                                     MemoryRegion *mr);
+
 int kvm_set_vm_type(MachineState *ms, int kvm_type)
 {
     if (kvm_type == KVM_X86_LEGACY_VM ||
@@ -2228,6 +2231,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         return ret;
     }
 
+    if (kvm_tdx_enabled())
+        kvm_setup_memory_region_debug_ops(s,
+                                          kvm_encrypted_guest_set_memory_region_debug_ops);
+
     if (!kvm_check_extension(s, KVM_CAP_IRQ_ROUTING)) {
         error_report("kvm: KVM_CAP_IRQ_ROUTING not supported by KVM");
         return -ENOTSUP;
@@ -4917,3 +4924,62 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return !sev_es_enabled();
 }
+
+static int kvm_encrypted_guest_read_memory(uint8_t *dest,
+                                           const uint8_t *hva_src, hwaddr gpa_src,
+                                           uint32_t len, MemTxAttrs attrs)
+{
+    struct kvm_rw_memory rw;
+
+    /*
+      TODO:
+      Can we check SEV/TDX state to decide use
+      gpa_dest or hva_dest here ?
+
+      Also how shall we handle the kvm_vm_ioctl failure case ?
+      Some user like cpu_physical_memory_{read,write}() doesn't handle such
+      failure, because for non-encrypted guest these functions may do memory
+      reading/wrting with memcpy() dirctly before.
+      May memset() the buffer to a bad pattern (all 0x0 or 0xff)
+      for indicating this ?
+    */
+    rw.addr = gpa_src;
+    rw.buf = dest;
+    rw.len = len;
+
+    return kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_READ_MEMORY, &rw);
+}
+
+static int kvm_encrypted_guest_write_memory(uint8_t *hva_dest, hwaddr gpa_dest,
+                                            const uint8_t *src,
+                                            uint32_t len, MemTxAttrs attrs)
+{
+    struct kvm_rw_memory rw;
+
+    /*
+      TODO:
+      Can we check SEV/TDX state to decide use
+      gpa_dest or hva_dest here ?
+
+      Also how shall we handle the kvm_vm_ioctl failure case ?
+      Some user like cpu_physical_memory_{read,write}() doesn't handle such
+      failure, because for non-encrypted guest these functions may do memory
+      reading/wrting with memcpy() dirctly before.
+     */
+    rw.addr = gpa_dest;
+    rw.buf = (void*)src;
+    rw.len = len;
+
+    return kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_WRITE_MEMORY, &rw);
+}
+
+static MemoryRegionRAMReadWriteOps kvm_encrypted_guest_mr_debug_ops = {
+    .read = kvm_encrypted_guest_read_memory,
+    .write = kvm_encrypted_guest_write_memory,
+};
+
+void kvm_encrypted_guest_set_memory_region_debug_ops(void *handle,
+                                                     MemoryRegion *mr)
+{
+    memory_region_set_ram_debug_ops(mr, &kvm_encrypted_guest_mr_debug_ops);
+}
-- 
2.20.1


