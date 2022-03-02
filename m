Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058974CA3F0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:38:38 +0100 (CET)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNJV-0000ZR-3k
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:38:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqt-0000lS-Rz; Wed, 02 Mar 2022 06:09:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqq-0001n1-IC; Wed, 02 Mar 2022 06:09:01 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229s8WP008101; 
 Wed, 2 Mar 2022 11:08:32 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6bt1da4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:31 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2bkk022345;
 Wed, 2 Mar 2022 11:08:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8Q8s18678208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79A07A4070;
 Wed,  2 Mar 2022 11:08:26 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3699AA4069;
 Wed,  2 Mar 2022 11:08:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:26 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7C467220294;
 Wed,  2 Mar 2022 12:08:25 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 27/87] target/ppc: implement vsrq
Date: Wed,  2 Mar 2022 12:07:03 +0100
Message-Id: <20220302110803.849505-28-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m25dBzj3zHqcE3k_1p8YxPaofCKHuSrV
X-Proofpoint-ORIG-GUID: m25dBzj3zHqcE3k_1p8YxPaofCKHuSrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=831 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Message-Id: <20220225210936.1749575-22-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++--------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 379906550877..96ee73024218 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -479,6 +479,7 @@ VSRB            000100 ..... ..... ..... 01000000100 =
   @VX
 VSRH            000100 ..... ..... ..... 01001000100    @VX
 VSRW            000100 ..... ..... ..... 01010000100    @VX
 VSRD            000100 ..... ..... ..... 11011000100    @VX
+VSRQ            000100 ..... ..... ..... 01000000101    @VX
=20
 VSRAB           000100 ..... ..... ..... 01100000100    @VX
 VSRAH           000100 ..... ..... ..... 01101000100    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 49c722e8625c..8a1e64d7f2e0 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,11 +834,10 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_=
16, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv=
);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec=
_sarv);
=20
-static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
+static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool righ=
t)
 {
     TCGv_i64 hi, lo, t0, n, zero =3D tcg_constant_i64(0);
=20
-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
     REQUIRE_VECTOR(ctx);
=20
     n =3D tcg_temp_new_i64();
@@ -852,19 +851,37 @@ static bool trans_VSLQ(DisasContext *ctx, arg_VX *a=
)
     get_avr64(n, a->vrb, true);
=20
     tcg_gen_andi_i64(t0, n, 64);
-    tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, lo, hi);
-    tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, zero, lo);
+    if (right) {
+        tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, hi, lo);
+        tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, zero, hi);
+    } else {
+        tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, lo, hi);
+        tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, zero, lo);
+    }
     tcg_gen_andi_i64(n, n, 0x3F);
=20
-    tcg_gen_shl_i64(t0, lo, n);
-    set_avr64(a->vrt, t0, false);
+    if (right) {
+        tcg_gen_shr_i64(t0, hi, n);
+    } else {
+        tcg_gen_shl_i64(t0, lo, n);
+    }
+    set_avr64(a->vrt, t0, right);
=20
-    tcg_gen_shl_i64(hi, hi, n);
+    if (right) {
+        tcg_gen_shr_i64(lo, lo, n);
+    } else {
+        tcg_gen_shl_i64(hi, hi, n);
+    }
     tcg_gen_xori_i64(n, n, 63);
-    tcg_gen_shr_i64(lo, lo, n);
-    tcg_gen_shri_i64(lo, lo, 1);
+    if (right) {
+        tcg_gen_shl_i64(hi, hi, n);
+        tcg_gen_shli_i64(hi, hi, 1);
+    } else {
+        tcg_gen_shr_i64(lo, lo, n);
+        tcg_gen_shri_i64(lo, lo, 1);
+    }
     tcg_gen_or_i64(hi, hi, lo);
-    set_avr64(a->vrt, hi, true);
+    set_avr64(a->vrt, hi, !right);
=20
     tcg_temp_free_i64(hi);
     tcg_temp_free_i64(lo);
@@ -874,6 +891,9 @@ static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
     return true;
 }
=20
+TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, false);
+TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true);
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               =
\
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     =
\
                                          TCGv_vec sat, TCGv_vec a,      =
\
--=20
2.34.1


