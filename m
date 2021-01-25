Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5F302E42
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 22:49:07 +0100 (CET)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l49jO-0000Fw-Ds
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 16:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muellerd@devvm2477.prn0.facebook.com>)
 id 1l49U0-0004mo-0m
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 16:33:12 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com ([66.220.144.178]:34779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <muellerd@devvm2477.prn0.facebook.com>)
 id 1l49Ty-00030D-LQ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 16:33:11 -0500
Received: by devvm2477.prn0.facebook.com (Postfix, from userid 221162)
 id C517B43DB0C7; Mon, 25 Jan 2021 13:08:42 -0800 (PST)
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correctly initialize MDCR_EL2.HPMN
Date: Mon, 25 Jan 2021 13:08:17 -0800
Message-Id: <20210125210817.2564212-1-muellerd@fb.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.220.144.178;
 envelope-from=muellerd@devvm2477.prn0.facebook.com;
 helo=66-220-144-178.mail-mxout.facebook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 25 Jan 2021 16:46:59 -0500
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
Cc: =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>
From: muellerd--- via <qemu-devel@nongnu.org>

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

Signed-off-by: Daniel M=C3=BCller <muellerd@fb.com>
---
 target/arm/helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ead3fcbd..195db4d378 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5705,13 +5705,11 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
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
+      .access =3D PL2_RW, .resetvalue =3D 4,
       .fieldoffset =3D offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name =3D "HPFAR", .state =3D ARM_CP_STATE_AA32,
       .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 4,
--=20
2.24.1


