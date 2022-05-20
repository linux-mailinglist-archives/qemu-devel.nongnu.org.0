Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20652F2FF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:35:14 +0200 (CEST)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns7So-0005a2-UC
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1ns7R9-0004O4-Fk
 for qemu-devel@nongnu.org; Fri, 20 May 2022 14:33:19 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:46096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1ns7R7-0000pg-Ka
 for qemu-devel@nongnu.org; Fri, 20 May 2022 14:33:19 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1ns7Qs-0008MU-2p; Fri, 20 May 2022 20:33:02 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: kvm@vger.kernel.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/i386/kvm: Fix disabling MPX on "-cpu host" with
 MPX-capable host
Date: Fri, 20 May 2022 20:32:56 +0200
Message-Id: <be14c1e895a2f452047451f050d269217dcee6d9.1653071510.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

Since KVM commit 5f76f6f5ff96 ("KVM: nVMX: Do not expose MPX VMX controls when guest MPX disabled")
it is not possible to disable MPX on a "-cpu host" just by adding "-mpx"
there if the host CPU does indeed support MPX.
QEMU will fail to set MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS MSRs in this case
and so trigger an assertion failure.

Instead, besides "-mpx" one has to explicitly add also
"-vmx-exit-clear-bndcfgs" and "-vmx-entry-load-bndcfgs" to QEMU command
line to make it work, which is a bit convoluted.

Sanitize MPX-related bits in MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS after
setting the vCPU CPUID instead so such workarounds are no longer necessary.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---
 target/i386/kvm/kvm.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a9ee8eebd7..435cb18753 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2934,6 +2934,17 @@ static uint64_t make_vmx_msr_value(uint32_t index, uint32_t features)
     return must_be_one | (((uint64_t)can_be_one) << 32);
 }
 
+static void kvm_msr_entry_add_if_supported(X86CPU *cpu, uint32_t msr,
+                                           uint32_t mask, uint32_t features,
+                                           uint64_t value_or)
+{
+    uint32_t supported =
+        kvm_arch_get_supported_msr_feature(kvm_state, msr) >> 32;
+    uint32_t feat_eff = features & (~mask | (mask & supported));
+
+    kvm_msr_entry_add(cpu, msr, make_vmx_msr_value(msr, feat_eff) | value_or);
+}
+
 static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
 {
     uint64_t kvm_vmx_basic =
@@ -2996,12 +3007,23 @@ static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
     kvm_msr_entry_add(cpu, MSR_IA32_VMX_TRUE_PINBASED_CTLS,
                       make_vmx_msr_value(MSR_IA32_VMX_TRUE_PINBASED_CTLS,
                                          f[FEAT_VMX_PINBASED_CTLS]));
-    kvm_msr_entry_add(cpu, MSR_IA32_VMX_TRUE_EXIT_CTLS,
-                      make_vmx_msr_value(MSR_IA32_VMX_TRUE_EXIT_CTLS,
-                                         f[FEAT_VMX_EXIT_CTLS]) | fixed_vmx_exit);
-    kvm_msr_entry_add(cpu, MSR_IA32_VMX_TRUE_ENTRY_CTLS,
-                      make_vmx_msr_value(MSR_IA32_VMX_TRUE_ENTRY_CTLS,
-                                         f[FEAT_VMX_ENTRY_CTLS]));
+
+    /*
+     * When disabling MPX on a host that supports this function it is not
+     * enough to clear the relevant CPUID bit, MPX-related bits in
+     * MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS have to be cleared, too.
+     *
+     * Otherwise setting these MSRs will fail.
+     */
+    kvm_msr_entry_add_if_supported(cpu, MSR_IA32_VMX_TRUE_EXIT_CTLS,
+                                   VMX_VM_EXIT_CLEAR_BNDCFGS,
+                                   f[FEAT_VMX_EXIT_CTLS],
+                                   fixed_vmx_exit);
+    kvm_msr_entry_add_if_supported(cpu, MSR_IA32_VMX_TRUE_ENTRY_CTLS,
+                                   VMX_VM_ENTRY_LOAD_BNDCFGS,
+                                   f[FEAT_VMX_ENTRY_CTLS],
+                                   0);
+
     kvm_msr_entry_add(cpu, MSR_IA32_VMX_PROCBASED_CTLS2,
                       make_vmx_msr_value(MSR_IA32_VMX_PROCBASED_CTLS2,
                                          f[FEAT_VMX_SECONDARY_CTLS]));

