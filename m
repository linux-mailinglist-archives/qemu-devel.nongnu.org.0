Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC574CA416
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:45:59 +0100 (CET)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNQc-0004JD-BH
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:45:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr0-0000zB-9v; Wed, 02 Mar 2022 06:09:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61494
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqy-0001oW-H9; Wed, 02 Mar 2022 06:09:10 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228OSWa001247; 
 Wed, 2 Mar 2022 11:08:38 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej51mb5q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:37 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2gZj028057;
 Wed, 2 Mar 2022 11:08:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3efbu9d2wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8X2w25297250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A604942047;
 Wed,  2 Mar 2022 11:08:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 620C942041;
 Wed,  2 Mar 2022 11:08:33 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:33 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A79472201C1;
 Wed,  2 Mar 2022 12:08:32 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 38/87] target/ppc: Implement xxpermx instruction
Date: Wed,  2 Mar 2022 12:07:14 +0100
Message-Id: <20220302110803.849505-39-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3sfnXzecKx0GCiRjAv3yPiyLHB4aqyNU
X-Proofpoint-ORIG-GUID: 3sfnXzecKx0GCiRjAv3yPiyLHB4aqyNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxlogscore=537
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-33-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  1 +
 target/ppc/insn64.decode            |  8 ++++++++
 target/ppc/int_helper.c             | 20 ++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 22 ++++++++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 233800213658..7eda74211e66 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -495,6 +495,7 @@ DEF_HELPER_3(xvrspim, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspip, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspiz, void, env, vsr, vsr)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
+DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, t=
l)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
 DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
 DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 9e4f531fb98b..0963e064b189 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -54,6 +54,11 @@
                 ...... ..... ..... ..... ..... .. .... \
                 &8RR_XX4 xt=3D%8rr_xx_xt xa=3D%8rr_xx_xa xb=3D%8rr_xx_xb=
 xc=3D%8rr_xx_xc
=20
+&8RR_XX4_uim3   xt xa xb xc uim3
+@8RR_XX4_uim3   ...... .. .... .. ............... uim3:3 \
+                ...... ..... ..... ..... ..... .. ....   \
+                &8RR_XX4_uim3 xt=3D%8rr_xx_xt xa=3D%8rr_xx_xa xb=3D%8rr_=
xx_xb xc=3D%8rr_xx_xc
+
 ### Fixed-Point Load Instructions
=20
 PLBZ            000001 10 0--.-- .................. \
@@ -194,3 +199,6 @@ XXBLENDVH       000001 01 0000 -- ------------------ =
\
                 100001 ..... ..... ..... ..... 01 ....  @8RR_XX4
 XXBLENDVB       000001 01 0000 -- ------------------ \
                 100001 ..... ..... ..... ..... 00 ....  @8RR_XX4
+
+XXPERMX         000001 01 0000 -- --------------- ... \
+                100010 ..... ..... ..... ..... 00 ....  @8RR_XX4_uim3
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 6c63c7b2278c..d9bfdc290fbf 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1015,6 +1015,26 @@ VMUL(UW, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_ODD
 #undef VMUL
=20
+void helper_XXPERMX(ppc_vsr_t *t, ppc_vsr_t *s0, ppc_vsr_t *s1, ppc_vsr_=
t *pcv,
+                    target_ulong uim)
+{
+    int i, idx;
+    ppc_vsr_t tmp =3D { .u64 =3D {0, 0} };
+
+    for (i =3D 0; i < ARRAY_SIZE(t->u8); i++) {
+        if ((pcv->VsrB(i) >> 5) =3D=3D uim) {
+            idx =3D pcv->VsrB(i) & 0x1f;
+            if (idx < ARRAY_SIZE(t->u8)) {
+                tmp.VsrB(i) =3D s0->VsrB(idx);
+            } else {
+                tmp.VsrB(i) =3D s1->VsrB(idx - ARRAY_SIZE(t->u8));
+            }
+        }
+    }
+
+    *t =3D tmp;
+}
+
 void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c=
)
 {
     ppc_avr_t result;
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index cdefa1359065..92851b8926d8 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1234,6 +1234,28 @@ static bool trans_XXPERMDI(DisasContext *ctx, arg_=
XX3_dm *a)
     return true;
 }
=20
+static bool trans_XXPERMX(DisasContext *ctx, arg_8RR_XX4_uim3 *a)
+{
+    TCGv_ptr xt, xa, xb, xc;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xt =3D gen_vsr_ptr(a->xt);
+    xa =3D gen_vsr_ptr(a->xa);
+    xb =3D gen_vsr_ptr(a->xb);
+    xc =3D gen_vsr_ptr(a->xc);
+
+    gen_helper_XXPERMX(xt, xa, xb, xc, tcg_constant_tl(a->uim3));
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xa);
+    tcg_temp_free_ptr(xb);
+    tcg_temp_free_ptr(xc);
+
+    return true;
+}
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)       =
      \
 static void gen_##name(DisasContext *ctx)                               =
      \
 {                                                                       =
      \
--=20
2.34.1


