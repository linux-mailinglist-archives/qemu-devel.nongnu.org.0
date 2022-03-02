Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1214CA3E7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:37:25 +0100 (CET)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNIK-0006nc-I4
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:37:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqq-0000lB-Gv; Wed, 02 Mar 2022 06:09:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqp-0001mi-0S; Wed, 02 Mar 2022 06:09:00 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228kiMp031009; 
 Wed, 2 Mar 2022 11:08:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5ccaqq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2cxE011479;
 Wed, 2 Mar 2022 11:08:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B8TtT38076822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F69DA4069;
 Wed,  2 Mar 2022 11:08:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D063CA4080;
 Wed,  2 Mar 2022 11:08:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:28 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 21D70220294;
 Wed,  2 Mar 2022 12:08:28 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 31/87] target/ppc: implement vrlq
Date: Wed,  2 Mar 2022 12:07:07 +0100
Message-Id: <20220302110803.849505-32-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xizcpbIntnq2_XPNE0SKEdiCFbov13WB
X-Proofpoint-GUID: xizcpbIntnq2_XPNE0SKEdiCFbov13WB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1034 bulkscore=0
 mlxlogscore=891 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
Message-Id: <20220225210936.1749575-26-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 48 +++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e788dc51523d..c3d47a881573 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -491,6 +491,7 @@ VRLB            000100 ..... ..... ..... 00000000100 =
   @VX
 VRLH            000100 ..... ..... ..... 00001000100    @VX
 VRLW            000100 ..... ..... ..... 00010000100    @VX
 VRLD            000100 ..... ..... ..... 00011000100    @VX
+VRLQ            000100 ..... ..... ..... 00000000101    @VX
=20
 VRLWMI          000100 ..... ..... ..... 00010000101    @VX
 VRLDMI          000100 ..... ..... ..... 00011000101    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 09d6c88e62a8..478a62440db3 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1055,6 +1055,54 @@ TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, f=
alse, false);
 TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true, false);
 TRANS_FLAGS2(ISA310, VSRAQ, do_vector_shift_quad, true, true);
=20
+static bool trans_VRLQ(DisasContext *ctx, arg_VX *a)
+{
+    TCGv_i64 ah, al, n, t0, t1, zero =3D tcg_constant_i64(0);
+
+    REQUIRE_VECTOR(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+
+    ah =3D tcg_temp_new_i64();
+    al =3D tcg_temp_new_i64();
+    n =3D tcg_temp_new_i64();
+    t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_temp_new_i64();
+
+    get_avr64(ah, a->vra, true);
+    get_avr64(al, a->vra, false);
+    get_avr64(n, a->vrb, true);
+
+    tcg_gen_mov_i64(t0, ah);
+    tcg_gen_andi_i64(t1, n, 64);
+    tcg_gen_movcond_i64(TCG_COND_NE, ah, t1, zero, al, ah);
+    tcg_gen_movcond_i64(TCG_COND_NE, al, t1, zero, t0, al);
+    tcg_gen_andi_i64(n, n, 0x3F);
+
+    tcg_gen_shl_i64(t0, ah, n);
+    tcg_gen_shl_i64(t1, al, n);
+
+    tcg_gen_xori_i64(n, n, 63);
+
+    tcg_gen_shr_i64(al, al, n);
+    tcg_gen_shri_i64(al, al, 1);
+    tcg_gen_or_i64(t0, al, t0);
+
+    tcg_gen_shr_i64(ah, ah, n);
+    tcg_gen_shri_i64(ah, ah, 1);
+    tcg_gen_or_i64(t1, ah, t1);
+
+    set_avr64(a->vrt, t0, true);
+    set_avr64(a->vrt, t1, false);
+
+    tcg_temp_free_i64(ah);
+    tcg_temp_free_i64(al);
+    tcg_temp_free_i64(n);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               =
\
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     =
\
                                          TCGv_vec sat, TCGv_vec a,      =
\
--=20
2.34.1


