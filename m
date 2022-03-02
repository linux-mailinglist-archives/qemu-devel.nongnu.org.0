Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B050D4CA453
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:59:47 +0100 (CET)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNdy-0001nR-PW
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrA-0001Kv-9n; Wed, 02 Mar 2022 06:09:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr8-0001r2-Co; Wed, 02 Mar 2022 06:09:19 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIJ4G022577; 
 Wed, 2 Mar 2022 11:08:45 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6qa0y1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:45 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2baD011461;
 Wed, 2 Mar 2022 11:08:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8e3g57213270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB3DAE058;
 Wed,  2 Mar 2022 11:08:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52D18AE051;
 Wed,  2 Mar 2022 11:08:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8953F2201C1;
 Wed,  2 Mar 2022 12:08:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 48/87] target/ppc: Move xscmp{eq,ge,gt}dp to decodetree
Date: Wed,  2 Mar 2022 12:07:24 +0100
Message-Id: <20220302110803.849505-49-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hxDO3zJlMEvYVXwy8bamhlE9_T8PMxFk
X-Proofpoint-ORIG-GUID: hxDO3zJlMEvYVXwy8bamhlE9_T8PMxFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1034
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=670 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-43-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  6 +++---
 target/ppc/insn32.decode            |  3 +++
 target/ppc/fpu_helper.c             |  6 +++---
 target/ppc/translate/vsx-impl.c.inc | 28 +++++++++++++++++++++++++---
 target/ppc/translate/vsx-ops.c.inc  |  3 ---
 5 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index c646b983e329..567488b28091 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -359,9 +359,9 @@ DEF_HELPER_5(XSMADDDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSMSUBDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMADDDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMSUBDP, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPEQDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGTDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGEDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPEQQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPGTQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPGEQP, void, env, vsr, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 92327a0a718f..6fbb2d188f51 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -664,6 +664,9 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...=
   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+XSCMPEQDP       111100 ..... ..... ..... 00000011 ...   @XX3
+XSCMPGEDP       111100 ..... ..... ..... 00010011 ...   @XX3
+XSCMPGTDP       111100 ..... ..... ..... 00001011 ...   @XX3
 XSCMPEQQP       111111 ..... ..... ..... 0001000100 -   @X
 XSCMPGEQP       111111 ..... ..... ..... 0011000100 -   @X
 XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index a589e6b7a54f..4d67180bec74 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2304,9 +2304,9 @@ VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
     do_float_check_status(env, GETPC());                                =
      \
 }
=20
-VSX_SCALAR_CMP(xscmpeqdp, float64, eq, VsrD(0), 0)
-VSX_SCALAR_CMP(xscmpgedp, float64, le, VsrD(0), 1)
-VSX_SCALAR_CMP(xscmpgtdp, float64, lt, VsrD(0), 1)
+VSX_SCALAR_CMP(XSCMPEQDP, float64, eq, VsrD(0), 0)
+VSX_SCALAR_CMP(XSCMPGEDP, float64, le, VsrD(0), 1)
+VSX_SCALAR_CMP(XSCMPGTDP, float64, lt, VsrD(0), 1)
 VSX_SCALAR_CMP(XSCMPEQQP, float128, eq, f128, 0)
 VSX_SCALAR_CMP(XSCMPGEQP, float128, le, f128, 1)
 VSX_SCALAR_CMP(XSCMPGTQP, float128, lt, f128, 1)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 6dd20b030976..fca25c267b97 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1052,9 +1052,6 @@ GEN_VSX_HELPER_X2(xssqrtdp, 0x16, 0x04, 0, PPC2_VSX=
)
 GEN_VSX_HELPER_X2(xsrsqrtedp, 0x14, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2_AB(xstdivdp, 0x14, 0x07, 0, PPC2_VSX)
 GEN_VSX_HELPER_X1(xstsqrtdp, 0x14, 0x06, 0, PPC2_VSX)
-GEN_VSX_HELPER_X3(xscmpeqdp, 0x0C, 0x00, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xscmpgtdp, 0x0C, 0x01, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xscmpgedp, 0x0C, 0x02, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2_AB(xscmpexpdp, 0x0C, 0x07, 0, PPC2_ISA300)
 GEN_VSX_HELPER_R2_AB(xscmpexpqp, 0x04, 0x05, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2_AB(xscmpodp, 0x0C, 0x05, 0, PPC2_VSX)
@@ -2589,6 +2586,31 @@ TRANS(XXBLENDVH, do_xxblendv, MO_16)
 TRANS(XXBLENDVW, do_xxblendv, MO_32)
 TRANS(XXBLENDVD, do_xxblendv, MO_64)
=20
+static bool do_helper_XX3(DisasContext *ctx, arg_XX3 *a,
+    void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr xt, xa, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    xt =3D gen_vsr_ptr(a->xt);
+    xa =3D gen_vsr_ptr(a->xa);
+    xb =3D gen_vsr_ptr(a->xb);
+
+    helper(cpu_env, xt, xa, xb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xa);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+TRANS(XSCMPEQDP, do_helper_XX3, gen_helper_XSCMPEQDP)
+TRANS(XSCMPGEDP, do_helper_XX3, gen_helper_XSCMPGEDP)
+TRANS(XSCMPGTDP, do_helper_XX3, gen_helper_XSCMPGTDP)
+
 static bool do_xsmaxmincjdp(DisasContext *ctx, arg_XX3 *a,
                             void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr,=
 TCGv_ptr))
 {
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vs=
x-ops.c.inc
index 34310c1fb53d..b8fd116728bd 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -186,9 +186,6 @@ GEN_XX2FORM(xssqrtdp,  0x16, 0x04, PPC2_VSX),
 GEN_XX2FORM(xsrsqrtedp,  0x14, 0x04, PPC2_VSX),
 GEN_XX3FORM(xstdivdp,  0x14, 0x07, PPC2_VSX),
 GEN_XX2FORM(xstsqrtdp,  0x14, 0x06, PPC2_VSX),
-GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
-GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
-GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
 GEN_XX3FORM(xscmpexpdp, 0x0C, 0x07, PPC2_ISA300),
 GEN_VSX_XFORM_300(xscmpexpqp, 0x04, 0x05, 0x00600001),
 GEN_XX2IFORM(xscmpodp,  0x0C, 0x05, PPC2_VSX),
--=20
2.34.1


