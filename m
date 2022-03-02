Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DCD4CA3BF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:30:34 +0100 (CET)
Received: from localhost ([::1]:56050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNBh-0003AE-UO
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:30:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqt-0000lT-SU; Wed, 02 Mar 2022 06:09:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqp-0001mn-MW; Wed, 02 Mar 2022 06:09:01 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIKDY022644; 
 Wed, 2 Mar 2022 11:08:32 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6qa0xq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:32 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2eKa014296;
 Wed, 2 Mar 2022 11:08:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3efbu8w0gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8R6n29688218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 239ACA4075;
 Wed,  2 Mar 2022 11:08:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4493A4067;
 Wed,  2 Mar 2022 11:08:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:26 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 272272201C1;
 Wed,  2 Mar 2022 12:08:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 28/87] target/ppc: implement vsraq
Date: Wed,  2 Mar 2022 12:07:04 +0100
Message-Id: <20220302110803.849505-29-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1P0cCrs1e4R19wwhIMklLSSzjijMuYlg
X-Proofpoint-ORIG-GUID: 1P0cCrs1e4R19wwhIMklLSSzjijMuYlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1034
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=989 suspectscore=0
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-23-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 23 +++++++++++++++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 96ee73024218..7a9fc1dffa38 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -485,6 +485,7 @@ VSRAB           000100 ..... ..... ..... 01100000100 =
   @VX
 VSRAH           000100 ..... ..... ..... 01101000100    @VX
 VSRAW           000100 ..... ..... ..... 01110000100    @VX
 VSRAD           000100 ..... ..... ..... 01111000100    @VX
+VSRAQ           000100 ..... ..... ..... 01100000101    @VX
=20
 ## Vector Integer Arithmetic Instructions
=20
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 8a1e64d7f2e0..27ed87fcd6db 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,9 +834,10 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_1=
6, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv=
);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec=
_sarv);
=20
-static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool righ=
t)
+static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool righ=
t,
+                                 bool alg)
 {
-    TCGv_i64 hi, lo, t0, n, zero =3D tcg_constant_i64(0);
+    TCGv_i64 hi, lo, t0, t1, n, zero =3D tcg_constant_i64(0);
=20
     REQUIRE_VECTOR(ctx);
=20
@@ -844,6 +845,7 @@ static bool do_vector_shift_quad(DisasContext *ctx, a=
rg_VX *a, bool right)
     hi =3D tcg_temp_new_i64();
     lo =3D tcg_temp_new_i64();
     t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_const_i64(0);
=20
     get_avr64(lo, a->vra, false);
     get_avr64(hi, a->vra, true);
@@ -853,7 +855,10 @@ static bool do_vector_shift_quad(DisasContext *ctx, =
arg_VX *a, bool right)
     tcg_gen_andi_i64(t0, n, 64);
     if (right) {
         tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, hi, lo);
-        tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, zero, hi);
+        if (alg) {
+            tcg_gen_sari_i64(t1, lo, 63);
+        }
+        tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, t1, hi);
     } else {
         tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, lo, hi);
         tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, zero, lo);
@@ -861,7 +866,11 @@ static bool do_vector_shift_quad(DisasContext *ctx, =
arg_VX *a, bool right)
     tcg_gen_andi_i64(n, n, 0x3F);
=20
     if (right) {
-        tcg_gen_shr_i64(t0, hi, n);
+        if (alg) {
+            tcg_gen_sar_i64(t0, hi, n);
+        } else {
+            tcg_gen_shr_i64(t0, hi, n);
+        }
     } else {
         tcg_gen_shl_i64(t0, lo, n);
     }
@@ -886,13 +895,15 @@ static bool do_vector_shift_quad(DisasContext *ctx,=
 arg_VX *a, bool right)
     tcg_temp_free_i64(hi);
     tcg_temp_free_i64(lo);
     tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
     tcg_temp_free_i64(n);
=20
     return true;
 }
=20
-TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, false);
-TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true);
+TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, false, false);
+TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true, false);
+TRANS_FLAGS2(ISA310, VSRAQ, do_vector_shift_quad, true, true);
=20
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               =
\
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     =
\
--=20
2.34.1


