Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D252231C568
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:20:50 +0100 (CET)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBpyr-0002x5-R5
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptE-0005vo-DY
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:00 -0500
Received: from mga17.intel.com ([192.55.52.151]:25635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptC-0001ZH-QC
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:00 -0500
IronPort-SDR: f2yqq0ViZHTh2sQVKmmexwhgoPuUe1fJ1rT1ezpUHpzkTWrhgpHJE2w4sxaAuWjm2Dg8jrQcAe
 /Kb9uQ3oR/ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558756"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558756"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:51 -0800
IronPort-SDR: x998+QN+qsZQSDZtQ8EZL80B4rh+IhI/vkQfEaN30yn/Zy6zy6KpWrvRvxdKIOr71I+VRwFkyF
 rBBFk+x65wpQ==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705401"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:51 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 07/23] i386/kvm: Squash getting/putting guest state for
 TDX VMs
Date: Mon, 15 Feb 2021 18:13:03 -0800
Message-Id: <ef3c6b6127b5a6442df69fcd9269ff414181c61a.1613188118.git.isaku.yamahata@intel.com>
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

From: Sean Christopherson <sean.j.christopherson@intel.com>

Ignore get/put state of TDX VMs as accessing/mutating guest state of
producation TDs is not supported.
Allow kvm_arch_get_registers() to run as normal, except for MSRs, for
debug TDs, and silently ignores attempts to read guest state for
non-debug TDs.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 target/i386/kvm/kvm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ab7a896bd2..9c5f669b7c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2565,6 +2565,11 @@ void kvm_put_apicbase(X86CPU *cpu, uint64_t value)
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
@@ -4019,6 +4024,11 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
+    /* TODO: Allow accessing guest state for debug TDs. */
+    if (vm_type == KVM_X86_TDX_VM) {
+        return 0;
+    }
+
     /* must be before kvm_put_nested_state so that EFER.SVME is set */
     ret = kvm_put_sregs(x86_cpu);
     if (ret < 0) {
@@ -4129,9 +4139,11 @@ int kvm_arch_get_registers(CPUState *cs)
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
2.17.1


