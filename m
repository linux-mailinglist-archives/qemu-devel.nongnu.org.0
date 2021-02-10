Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EBA316DCD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 19:05:23 +0100 (CET)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tre-0004r9-8o
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 13:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muellerd@devvm1718.prn0.facebook.com>)
 id 1l9tkc-0000cR-3f
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:58:06 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com ([66.220.144.178]:35447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <muellerd@devvm1718.prn0.facebook.com>)
 id 1l9tka-0004BP-IN
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:58:05 -0500
Received: by devvm1718.prn0.facebook.com (Postfix, from userid 221162)
 id 46DF4A6F731; Wed, 10 Feb 2021 09:41:27 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>
Subject: [PATCH v2] target/arm: Correctly initialize MDCR_EL2.HPMN
Date: Wed, 10 Feb 2021 09:41:22 -0800
Message-Id: <20210210174122.410690-1-muellerd@fb.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.220.144.178;
 envelope-from=muellerd@devvm1718.prn0.facebook.com;
 helo=66-220-144-178.mail-mxout.facebook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>
From:  =?UTF-8?q?Daniel=20M=C3=BCller?= via <qemu-devel@nongnu.org>

When working with performance monitoring counters, we look at
MDCR_EL2.HPMN as part of the check whether a counter is enabled. This
check fails, because MDCR_EL2.HPMN is reset to 0, meaning that no
counters are "enabled" for < EL2.
That's in violation of the Arm specification, which states that

> On a Warm reset, this field [MDCR_EL2.HPMN] resets to the value in
> PMCR_EL0.N

That's also what a comment in the code acknowledges, but the necessary
adjustment seems to have been forgotten when support for more counters
was added.
This change fixes the issue by setting the reset value to PMCR.N, which
is four.
---
 target/arm/helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38cd35c049..4a5d512b51 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -37,6 +37,7 @@
 #endif
=20
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
+#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
=20
 #ifndef CONFIG_USER_ONLY
=20
@@ -5662,13 +5663,11 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
       .writefn =3D gt_hyp_ctl_write, .raw_writefn =3D raw_write },
 #endif
     /* The only field of MDCR_EL2 that has a defined architectural reset=
 value
-     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; b=
ut we
-     * don't implement any PMU event counters, so using zero as a reset
-     * value for MDCR_EL2 is okay
+     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
      */
     { .name =3D "MDCR_EL2", .state =3D ARM_CP_STATE_BOTH,
       .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 1,
-      .access =3D PL2_RW, .resetvalue =3D 0,
+      .access =3D PL2_RW, .resetvalue =3D PMCR_NUM_COUNTERS,
       .fieldoffset =3D offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name =3D "HPFAR", .state =3D ARM_CP_STATE_AA32,
       .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 4,
@@ -6566,7 +6565,7 @@ static void define_pmu_regs(ARMCPU *cpu)
      * field as main ID register, and we implement four counters in
      * addition to the cycle count register.
      */
-    unsigned int i, pmcrn =3D 4;
+    unsigned int i, pmcrn =3D PMCR_NUM_COUNTERS;
     ARMCPRegInfo pmcr =3D {
         .name =3D "PMCR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D=
 0, .opc2 =3D 0,
         .access =3D PL0_RW,
--=20
2.27.0


