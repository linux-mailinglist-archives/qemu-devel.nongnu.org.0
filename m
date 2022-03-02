Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E902A4CA3D3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:34:52 +0100 (CET)
Received: from localhost ([::1]:36144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNFs-0000dd-2M
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqt-0000lR-Ro; Wed, 02 Mar 2022 06:09:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10148
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqq-0001n3-82; Wed, 02 Mar 2022 06:09:01 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Am3XI002377; 
 Wed, 2 Mar 2022 11:08:34 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej7570ecq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:34 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B3QkR030533;
 Wed, 2 Mar 2022 11:08:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu9523j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8Tvb52494732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD398A407A;
 Wed,  2 Mar 2022 11:08:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79A73A406F;
 Wed,  2 Mar 2022 11:08:29 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:29 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BFD072201C1;
 Wed,  2 Mar 2022 12:08:28 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 32/87] target/ppc: implement vrlqnm
Date: Wed,  2 Mar 2022 12:07:08 +0100
Message-Id: <20220302110803.849505-33-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wopQoyOkpZU0u4lsnsLjF8c1PcKMdZ7Y
X-Proofpoint-ORIG-GUID: wopQoyOkpZU0u4lsnsLjF8c1PcKMdZ7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=992 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1034
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225210936.1749575-27-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 81 +++++++++++++++++++++++++++--
 2 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c3d47a881573..87d482c5d961 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -498,6 +498,7 @@ VRLDMI          000100 ..... ..... ..... 00011000101 =
   @VX
=20
 VRLWNM          000100 ..... ..... ..... 00110000101    @VX
 VRLDNM          000100 ..... ..... ..... 00111000101    @VX
+VRLQNM          000100 ..... ..... ..... 00101000101    @VX
=20
 ## Vector Integer Arithmetic Instructions
=20
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 478a62440db3..eb305e84da9a 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1055,28 +1055,83 @@ TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, =
false, false);
 TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true, false);
 TRANS_FLAGS2(ISA310, VSRAQ, do_vector_shift_quad, true, true);
=20
-static bool trans_VRLQ(DisasContext *ctx, arg_VX *a)
+static void do_vrlq_mask(TCGv_i64 mh, TCGv_i64 ml, TCGv_i64 b, TCGv_i64 =
e)
 {
-    TCGv_i64 ah, al, n, t0, t1, zero =3D tcg_constant_i64(0);
+    TCGv_i64 th, tl, t0, t1, zero =3D tcg_constant_i64(0),
+             ones =3D tcg_constant_i64(-1);
+
+    th =3D tcg_temp_new_i64();
+    tl =3D tcg_temp_new_i64();
+    t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_temp_new_i64();
+
+    /* m =3D ~0 >> b */
+    tcg_gen_andi_i64(t0, b, 64);
+    tcg_gen_movcond_i64(TCG_COND_NE, t1, t0, zero, zero, ones);
+    tcg_gen_andi_i64(t0, b, 0x3F);
+    tcg_gen_shr_i64(mh, t1, t0);
+    tcg_gen_shr_i64(ml, ones, t0);
+    tcg_gen_xori_i64(t0, t0, 63);
+    tcg_gen_shl_i64(t1, t1, t0);
+    tcg_gen_shli_i64(t1, t1, 1);
+    tcg_gen_or_i64(ml, t1, ml);
+
+    /* t =3D ~0 >> e */
+    tcg_gen_andi_i64(t0, e, 64);
+    tcg_gen_movcond_i64(TCG_COND_NE, t1, t0, zero, zero, ones);
+    tcg_gen_andi_i64(t0, e, 0x3F);
+    tcg_gen_shr_i64(th, t1, t0);
+    tcg_gen_shr_i64(tl, ones, t0);
+    tcg_gen_xori_i64(t0, t0, 63);
+    tcg_gen_shl_i64(t1, t1, t0);
+    tcg_gen_shli_i64(t1, t1, 1);
+    tcg_gen_or_i64(tl, t1, tl);
+
+    /* t =3D t >> 1 */
+    tcg_gen_shli_i64(t0, th, 63);
+    tcg_gen_shri_i64(tl, tl, 1);
+    tcg_gen_shri_i64(th, th, 1);
+    tcg_gen_or_i64(tl, t0, tl);
+
+    /* m =3D m ^ t */
+    tcg_gen_xor_i64(mh, mh, th);
+    tcg_gen_xor_i64(ml, ml, tl);
+
+    /* Negate the mask if begin > end */
+    tcg_gen_movcond_i64(TCG_COND_GT, t0, b, e, ones, zero);
+
+    tcg_gen_xor_i64(mh, mh, t0);
+    tcg_gen_xor_i64(ml, ml, t0);
+
+    tcg_temp_free_i64(th);
+    tcg_temp_free_i64(tl);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
+
+static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask)
+{
+    TCGv_i64 ah, al, vrb, n, t0, t1, zero =3D tcg_constant_i64(0);
=20
     REQUIRE_VECTOR(ctx);
     REQUIRE_INSNS_FLAGS2(ctx, ISA310);
=20
     ah =3D tcg_temp_new_i64();
     al =3D tcg_temp_new_i64();
+    vrb =3D tcg_temp_new_i64();
     n =3D tcg_temp_new_i64();
     t0 =3D tcg_temp_new_i64();
     t1 =3D tcg_temp_new_i64();
=20
     get_avr64(ah, a->vra, true);
     get_avr64(al, a->vra, false);
-    get_avr64(n, a->vrb, true);
+    get_avr64(vrb, a->vrb, true);
=20
     tcg_gen_mov_i64(t0, ah);
-    tcg_gen_andi_i64(t1, n, 64);
+    tcg_gen_andi_i64(t1, vrb, 64);
     tcg_gen_movcond_i64(TCG_COND_NE, ah, t1, zero, al, ah);
     tcg_gen_movcond_i64(TCG_COND_NE, al, t1, zero, t0, al);
-    tcg_gen_andi_i64(n, n, 0x3F);
+    tcg_gen_andi_i64(n, vrb, 0x3F);
=20
     tcg_gen_shl_i64(t0, ah, n);
     tcg_gen_shl_i64(t1, al, n);
@@ -1091,11 +1146,24 @@ static bool trans_VRLQ(DisasContext *ctx, arg_VX =
*a)
     tcg_gen_shri_i64(ah, ah, 1);
     tcg_gen_or_i64(t1, ah, t1);
=20
+    if (mask) {
+        tcg_gen_shri_i64(n, vrb, 8);
+        tcg_gen_shri_i64(vrb, vrb, 16);
+        tcg_gen_andi_i64(n, n, 0x7f);
+        tcg_gen_andi_i64(vrb, vrb, 0x7f);
+
+        do_vrlq_mask(ah, al, vrb, n);
+
+        tcg_gen_and_i64(t0, t0, ah);
+        tcg_gen_and_i64(t1, t1, al);
+    }
+
     set_avr64(a->vrt, t0, true);
     set_avr64(a->vrt, t1, false);
=20
     tcg_temp_free_i64(ah);
     tcg_temp_free_i64(al);
+    tcg_temp_free_i64(vrb);
     tcg_temp_free_i64(n);
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(t1);
@@ -1103,6 +1171,9 @@ static bool trans_VRLQ(DisasContext *ctx, arg_VX *a=
)
     return true;
 }
=20
+TRANS(VRLQ, do_vector_rotl_quad, false)
+TRANS(VRLQNM, do_vector_rotl_quad, true)
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               =
\
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     =
\
                                          TCGv_vec sat, TCGv_vec a,      =
\
--=20
2.34.1


