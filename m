Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FBC4CA30B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:15:16 +0100 (CET)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMwt-0002qG-C0
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:15:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqR-0000SQ-6s; Wed, 02 Mar 2022 06:08:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqP-0001kL-BV; Wed, 02 Mar 2022 06:08:34 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228lie3003107; 
 Wed, 2 Mar 2022 11:08:26 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5dvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:26 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dDl014266;
 Wed, 2 Mar 2022 11:08:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3efbu8w0gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8LSf36372820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B16A4073;
 Wed,  2 Mar 2022 11:08:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9FF3A4067;
 Wed,  2 Mar 2022 11:08:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3C517220294;
 Wed,  2 Mar 2022 12:08:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 19/87] target/ppc: Implement Vector Compare Quadword
Date: Wed,  2 Mar 2022 12:06:55 +0100
Message-Id: <20220302110803.849505-20-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mfOstdbGu78SDPjfOyVgQbtIFzdVnce-
X-Proofpoint-GUID: mfOstdbGu78SDPjfOyVgQbtIFzdVnce-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1034 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=731 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Implement the following PowerISA v3.1 instructions:
vcmpsq: Vector Compare Signed Quadword
vcmpuq: Vector Compare Unsigned Quadword

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-14-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  6 ++++
 target/ppc/translate/vmx-impl.c.inc | 45 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 07a4ef910342..f0cb6602e25a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -60,6 +60,9 @@
 &VX             vrt vra vrb
 @VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
=20
+&VX_bf          bf vra vrb
+@VX_bf          ...... bf:3 .. vra:5 vrb:5 ...........          &VX_bf
+
 &VX_uim4        vrt uim vrb
 @VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
=20
@@ -404,6 +407,9 @@ VCMPNEZB        000100 ..... ..... ..... . 0100000111=
   @VC
 VCMPNEZH        000100 ..... ..... ..... . 0101000111   @VC
 VCMPNEZW        000100 ..... ..... ..... . 0110000111   @VC
=20
+VCMPSQ          000100 ... -- ..... ..... 00101000001   @VX_bf
+VCMPUQ          000100 ... -- ..... ..... 00100000001   @VX_bf
+
 ## Vector Bit Manipulation Instruction
=20
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 7f9913235e97..ba2106dc7c5e 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1182,6 +1182,51 @@ static bool do_vcmpgtq(DisasContext *ctx, arg_VC *=
a, bool sign)
 TRANS(VCMPGTSQ, do_vcmpgtq, true)
 TRANS(VCMPGTUQ, do_vcmpgtq, false)
=20
+static bool do_vcmpq(DisasContext *ctx, arg_VX_bf *a, bool sign)
+{
+    TCGv_i64 vra, vrb;
+    TCGLabel *gt, *lt, *done;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    vra =3D tcg_temp_local_new_i64();
+    vrb =3D tcg_temp_local_new_i64();
+    gt =3D gen_new_label();
+    lt =3D gen_new_label();
+    done =3D gen_new_label();
+
+    get_avr64(vra, a->vra, true);
+    get_avr64(vrb, a->vrb, true);
+    tcg_gen_brcond_i64((sign ? TCG_COND_GT : TCG_COND_GTU), vra, vrb, gt=
);
+    tcg_gen_brcond_i64((sign ? TCG_COND_LT : TCG_COND_LTU), vra, vrb, lt=
);
+
+    get_avr64(vra, a->vra, false);
+    get_avr64(vrb, a->vrb, false);
+    tcg_gen_brcond_i64(TCG_COND_GTU, vra, vrb, gt);
+    tcg_gen_brcond_i64(TCG_COND_LTU, vra, vrb, lt);
+
+    tcg_gen_movi_i32(cpu_crf[a->bf], CRF_EQ);
+    tcg_gen_br(done);
+
+    gen_set_label(gt);
+    tcg_gen_movi_i32(cpu_crf[a->bf], CRF_GT);
+    tcg_gen_br(done);
+
+    gen_set_label(lt);
+    tcg_gen_movi_i32(cpu_crf[a->bf], CRF_LT);
+    tcg_gen_br(done);
+
+    gen_set_label(done);
+    tcg_temp_free_i64(vra);
+    tcg_temp_free_i64(vrb);
+
+    return true;
+}
+
+TRANS(VCMPSQ, do_vcmpq, true)
+TRANS(VCMPUQ, do_vcmpq, false)
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
--=20
2.34.1


