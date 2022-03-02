Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE444CA43A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:52:22 +0100 (CET)
Received: from localhost ([::1]:53372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNWo-0006Js-2M
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:52:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr0-0000yM-2g; Wed, 02 Mar 2022 06:09:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49028
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqy-0001oS-BI; Wed, 02 Mar 2022 06:09:09 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222ANTiK020709; 
 Wed, 2 Mar 2022 11:08:44 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej6sr0txb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:43 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B3A6H017784;
 Wed, 2 Mar 2022 11:08:42 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj19jsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8d7i32178670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E148C4C040;
 Wed,  2 Mar 2022 11:08:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 962584C050;
 Wed,  2 Mar 2022 11:08:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CC840220294;
 Wed,  2 Mar 2022 12:08:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 47/87] target/ppc: Implement xscmp{eq,ge,gt}qp
Date: Wed,  2 Mar 2022 12:07:23 +0100
Message-Id: <20220302110803.849505-48-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qzAdCqd7EMLrry66NeQTf-ihX1DfYu9W
X-Proofpoint-GUID: qzAdCqd7EMLrry66NeQTf-ihX1DfYu9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1034 mlxscore=0
 mlxlogscore=539 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Message-Id: <20220225210936.1749575-42-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  3 +++
 target/ppc/insn32.decode            |  3 +++
 target/ppc/fpu_helper.c             |  3 +++
 target/ppc/translate/vsx-impl.c.inc | 31 +++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4a12d4390527..c646b983e329 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -362,6 +362,9 @@ DEF_HELPER_5(XSNMSUBDP, void, env, vsr, vsr, vsr, vsr=
)
 DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPEQQP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGTQP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGEQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpexpdp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscmpexpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscmpodp, void, env, i32, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 973cda113166..92327a0a718f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -664,6 +664,9 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...=
   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+XSCMPEQQP       111111 ..... ..... ..... 0001000100 -   @X
+XSCMPGEQP       111111 ..... ..... ..... 0011000100 -   @X
+XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
=20
 ## VSX Binary Floating-Point Convert Instructions
=20
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index bbd54b2d9c16..a589e6b7a54f 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2307,6 +2307,9 @@ VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
 VSX_SCALAR_CMP(xscmpeqdp, float64, eq, VsrD(0), 0)
 VSX_SCALAR_CMP(xscmpgedp, float64, le, VsrD(0), 1)
 VSX_SCALAR_CMP(xscmpgtdp, float64, lt, VsrD(0), 1)
+VSX_SCALAR_CMP(XSCMPEQQP, float128, eq, f128, 0)
+VSX_SCALAR_CMP(XSCMPGEQP, float128, le, f128, 1)
+VSX_SCALAR_CMP(XSCMPGTQP, float128, lt, f128, 1)
=20
 void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
                        ppc_vsr_t *xa, ppc_vsr_t *xb)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 3baaac1abd22..6dd20b030976 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2615,6 +2615,37 @@ TRANS(XSMINCDP, do_xsmaxmincjdp, gen_helper_xsminc=
dp)
 TRANS(XSMAXJDP, do_xsmaxmincjdp, gen_helper_xsmaxjdp)
 TRANS(XSMINJDP, do_xsmaxmincjdp, gen_helper_xsminjdp)
=20
+static bool do_helper_X(arg_X *a,
+    void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr rt, ra, rb;
+
+    rt =3D gen_avr_ptr(a->rt);
+    ra =3D gen_avr_ptr(a->ra);
+    rb =3D gen_avr_ptr(a->rb);
+
+    helper(cpu_env, rt, ra, rb);
+
+    tcg_temp_free_ptr(rt);
+    tcg_temp_free_ptr(ra);
+    tcg_temp_free_ptr(rb);
+
+    return true;
+}
+
+static bool do_xscmpqp(DisasContext *ctx, arg_X *a,
+    void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    return do_helper_X(a, helper);
+}
+
+TRANS(XSCMPEQQP, do_xscmpqp, gen_helper_XSCMPEQQP)
+TRANS(XSCMPGEQP, do_xscmpqp, gen_helper_XSCMPGEQP)
+TRANS(XSCMPGTQP, do_xscmpqp, gen_helper_XSCMPGTQP)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
--=20
2.34.1


