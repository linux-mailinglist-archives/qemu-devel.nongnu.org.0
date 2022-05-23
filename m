Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A25314F1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 18:30:52 +0200 (CEST)
Received: from localhost ([::1]:58468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAxH-00017C-S6
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 12:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1ntAtj-00060D-3F
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:27:11 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:37202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1ntAth-0005cm-Jb
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:27:10 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1ntAtc-0007jX-GQ; Mon, 23 May 2022 18:27:04 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: kvm@vger.kernel.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386/kvm: Fix disabling MPX on "-cpu host" with
 MPX-capable host
Date: Mon, 23 May 2022 18:26:58 +0200
Message-Id: <51aa2125c76363204cc23c27165e778097c33f0b.1653323077.git.maciej.szmigiero@oracle.com>
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

Make the MPX-related bits in FEAT_VMX_{EXIT,ENTRY}_CTLS dependent on MPX
being actually enabled so such workarounds are no longer necessary.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---

Changes from v1:
    Use feature_dependencies instead of sanitizing MPX-related bits in
    MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS when setting them.

 target/i386/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35c3475e6c..385691458f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1355,6 +1355,14 @@ static FeatureDep feature_dependencies[] = {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INVPCID },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_ENABLE_INVPCID },
     },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_MPX },
+        .to = { FEAT_VMX_EXIT_CTLS,         VMX_VM_EXIT_CLEAR_BNDCFGS },
+    },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_MPX },
+        .to = { FEAT_VMX_ENTRY_CTLS,        VMX_VM_ENTRY_LOAD_BNDCFGS },
+    },
     {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },

