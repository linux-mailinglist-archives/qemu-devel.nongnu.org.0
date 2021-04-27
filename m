Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F4636C467
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:53:00 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLKt-0002KK-4a
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbLIq-0001V3-9r
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:50:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:42638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbLIj-0002Tj-Gr
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:50:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lbLIg-0008TD-TD
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:50:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DBF7C2E804C
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:50:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Apr 2021 10:35:55 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1926277@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: dvpe evpe mips mt
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hansni philmd
X-Launchpad-Bug-Reporter: Hansni Bu (hansni)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161951518027.9817.15696784713381088226.malonedeb@soybean.canonical.com>
Message-Id: <20210427103555.112652-1-f4bug@amsat.org>
Subject: [Bug 1926277] Re: MIPS MT dvpe does not regard VPEConf0.MVP  
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 87fbdd091ca10f0b176ade60e0a1baf54353ffb8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1926277 <1926277@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the 'MIPS MT Application-Speci=EF=AC=81c Extension' manual:

  If the VPE executing the instruction is not a Master VPE,
  with the MVP bit of the VPEConf0 register set, the EVP bit
  is unchanged by the instruction.

Add the VPEConf0.MVP bit and modify the DVPE/EVPE opcodes to only
update the MVPControl.EVP bit if executed on a master VPE.

Reported-by: Hansni Bu
Buglink: https://bugs.launchpad.net/qemu/+bug/1926277
Fixes: f249412c749 ("mips: Add MT halting and waking of VPEs")
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 target/mips/cpu.h        |  1 +
 target/mips/cp0_helper.c | 32 ++++++++++++++++++--------------
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 075c24abdad..bd22fac6959 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -114,6 +114,7 @@ struct CPUMIPSMVPContext {
 #define CP0MVPC0_PTLBE  16
 #define CP0MVPC0_TCA    15
 #define CP0MVPC0_PVPE   10
+#define CP0MVPC0_MVP    1
 #define CP0MVPC0_PTC    0
     int32_t CP0_MVPConf1;
 #define CP0MVPC1_CIM    31
diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index aae2af6eccc..1e39e28808a 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -1635,12 +1635,14 @@ target_ulong helper_dvpe(CPUMIPSState *env)
     CPUState *other_cs =3D first_cpu;
     target_ulong prev =3D env->mvp->CP0_MVPControl;
 =

-    CPU_FOREACH(other_cs) {
-        MIPSCPU *other_cpu =3D MIPS_CPU(other_cs);
-        /* Turn off all VPEs except the one executing the dvpe.  */
-        if (&other_cpu->env !=3D env) {
-            other_cpu->env.mvp->CP0_MVPControl &=3D ~(1 << CP0MVPCo_EVP);
-            mips_vpe_sleep(other_cpu);
+    if (env->mvp->CP0_MVPConf0 & (1 << CP0MVPC0_MVP)) {
+        CPU_FOREACH(other_cs) {
+            MIPSCPU *other_cpu =3D MIPS_CPU(other_cs);
+            /* Turn off all VPEs except the one executing the dvpe.  */
+            if (&other_cpu->env !=3D env) {
+                other_cpu->env.mvp->CP0_MVPControl &=3D ~(1 << CP0MVPCo_EV=
P);
+                mips_vpe_sleep(other_cpu);
+            }
         }
     }
     return prev;
@@ -1651,15 +1653,17 @@ target_ulong helper_evpe(CPUMIPSState *env)
     CPUState *other_cs =3D first_cpu;
     target_ulong prev =3D env->mvp->CP0_MVPControl;
 =

-    CPU_FOREACH(other_cs) {
-        MIPSCPU *other_cpu =3D MIPS_CPU(other_cs);
+    if (env->mvp->CP0_MVPConf0 & (1 << CP0MVPC0_MVP)) {
+        CPU_FOREACH(other_cs) {
+            MIPSCPU *other_cpu =3D MIPS_CPU(other_cs);
 =

-        if (&other_cpu->env !=3D env
-            /* If the VPE is WFI, don't disturb its sleep.  */
-            && !mips_vpe_is_wfi(other_cpu)) {
-            /* Enable the VPE.  */
-            other_cpu->env.mvp->CP0_MVPControl |=3D (1 << CP0MVPCo_EVP);
-            mips_vpe_wake(other_cpu); /* And wake it up.  */
+            if (&other_cpu->env !=3D env
+                /* If the VPE is WFI, don't disturb its sleep.  */
+                && !mips_vpe_is_wfi(other_cpu)) {
+                /* Enable the VPE.  */
+                other_cpu->env.mvp->CP0_MVPControl |=3D (1 << CP0MVPCo_EVP=
);
+                mips_vpe_wake(other_cpu); /* And wake it up.  */
+            }
         }
     }
     return prev;
-- =

2.26.3


** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926277

Title:
  MIPS MT dvpe does not regard VPEConf0.MVP

Status in QEMU:
  Confirmed

Bug description:
  Hi,

  According to MIPS32=C2=AE Architecture for Programmers VolumeIV-f: The
  MIPS=C2=AE MT Application-Speci=EF=AC=81c Extension to the MIPS32=C2=AE A=
rchitecture,
  for instruction: dvpe, evpe:

  If the VPE executing the instruction is not a Master VPE, with the MVP
  bit of the VPEConf0 register set, the EVP bit is unchanged by the
  instruction.

  The pseudo code is:

  data =E2=86=90  MVPControl
  GPR[rt] =E2=86=90  data
  if(VPEConf0.MVP =3D 1) then
    MVPControl.EVP =E2=86=90  sc
  endif

  However the helper functions of dvpe, evpe does not regard the
  VPEConf0.MVP bit, namely, it does not check if the VPE is a master
  VPE. Code is copied below as:

  target_ulong helper_dvpe(CPUMIPSState *env)
  {
      CPUState *other_cs =3D first_cpu;
      target_ulong prev =3D env->mvp->CP0_MVPControl;

      CPU_FOREACH(other_cs) {
          MIPSCPU *other_cpu =3D MIPS_CPU(other_cs);
          /* Turn off all VPEs except the one executing the dvpe.  */
          if (&other_cpu->env !=3D env) {
              other_cpu->env.mvp->CP0_MVPControl &=3D ~(1 << CP0MVPCo_EVP);
              mips_vpe_sleep(other_cpu);
          }
      }
      return prev;
  }

  Is this a bug?

  QEMU head commit: 0cef06d18762374c94eb4d511717a4735d668a24 is checked.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926277/+subscriptions

