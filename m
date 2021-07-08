Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7EC3BF357
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:12:17 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IaO-0000fm-8a
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKt-0002B3-0X
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:19099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKq-0007Mo-II
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="209461999"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="209461999"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770010"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:54 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 07/44] i386/kvm: Squash getting/putting guest state for
 TDX VMs
Date: Wed,  7 Jul 2021 17:54:37 -0700
Message-Id: <7194a76cfb8541d4f7a5b6a04fb3496bc14eab15.1625704980.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=isaku.yamahata@intel.com; helo=mga03.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Sean Christopherson <sean.j.christopherson@intel.com>

Ignore get/put state of TDX VMs as accessing/mutating guest state of
producation TDs is not supported.
Allow kvm_arch_get_registers() to run as normal, except for MSRs, for
debug TDs, and silently ignores attempts to read guest state for
non-debug TDs.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/kvm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a3d5b334d1..27b64dedc2 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2641,6 +2641,11 @@ void kvm_put_apicbase(X86CPU *cpu, uint64_t value)
 {
     int ret;
 
+    /* TODO: Allow accessing guest state for debug TDs. */
+    if (vm_type == KVM_X86_TDX_VM) {
+            return;
+    }
+
     ret = kvm_put_one_msr(cpu, MSR_IA32_APICBASE, value);
     assert(ret == 1);
 }
@@ -4099,6 +4104,11 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
+    /* TODO: Allow accessing guest state for debug TDs. */
+    if (vm_type == KVM_X86_TDX_VM) {
+        return 0;
+    }
+
     /* must be before kvm_put_nested_state so that EFER.SVME is set */
     ret = kvm_put_sregs(x86_cpu);
     if (ret < 0) {
@@ -4209,9 +4219,11 @@ int kvm_arch_get_registers(CPUState *cs)
     if (ret < 0) {
         goto out;
     }
-    ret = kvm_get_msrs(cpu);
-    if (ret < 0) {
-        goto out;
+    if (vm_type != KVM_X86_TDX_VM) {
+        ret = kvm_get_msrs(cpu);
+        if (ret < 0) {
+            goto out;
+        }
     }
     ret = kvm_get_apic(cpu);
     if (ret < 0) {
-- 
2.25.1


