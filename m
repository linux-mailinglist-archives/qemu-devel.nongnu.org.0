Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F74477DD6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:50:12 +0100 (CET)
Received: from localhost ([::1]:42438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxhb-0005dj-DL
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:50:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKw-0001Et-4t; Thu, 16 Dec 2021 15:26:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKs-0007Jd-7b; Thu, 16 Dec 2021 15:26:44 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGHhquT006213; 
 Thu, 16 Dec 2021 20:26:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cy2tr1gxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKBqpr016331;
 Thu, 16 Dec 2021 20:26:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qwatac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKQLnB46661932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D37A211C04A;
 Thu, 16 Dec 2021 20:26:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92D4611C052;
 Thu, 16 Dec 2021 20:26:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DAED02201A0;
 Thu, 16 Dec 2021 21:26:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 006/101] target/ppc: Implement Vector Expand Mask
Date: Thu, 16 Dec 2021 21:24:39 +0100
Message-Id: <20211216202614.414266-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2rJzIlBaOk5-PNZwSxdFYyoSfS0suwuA
X-Proofpoint-ORIG-GUID: 2rJzIlBaOk5-PNZwSxdFYyoSfS0suwuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1034 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
vexpandbm: Vector Expand Byte Mask
vexpandhm: Vector Expand Halfword Mask
vexpandwm: Vector Expand Word Mask
vexpanddm: Vector Expand Doubleword Mask
vexpandqm: Vector Expand Quadword Mask

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211203194229.746275-2-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            | 11 ++++++++++
 target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e135b8aba417..9a28f1d266bb 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -56,6 +56,9 @@
 &VX_uim4        vrt uim vrb
 @VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
=20
+&VX_tb          vrt vrb
+@VX_tb          ...... vrt:5 ..... vrb:5 ...........    &VX_tb
+
 &X              rt ra rb
 @X              ...... rt:5 ra:5 rb:5 .......... .      &X
=20
@@ -408,6 +411,14 @@ VINSWVRX        000100 ..... ..... ..... 00110001111=
    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
=20
+## Vector Mask Manipulation Instructions
+
+VEXPANDBM       000100 ..... 00000 ..... 11001000010    @VX_tb
+VEXPANDHM       000100 ..... 00001 ..... 11001000010    @VX_tb
+VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
+VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
+VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
+
 # VSX Load/Store Instructions
=20
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 8eb8d3a06720..ebb048432369 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1491,6 +1491,40 @@ static bool trans_VSRDBI(DisasContext *ctx, arg_VN=
 *a)
     return true;
 }
=20
+static bool do_vexpand(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_sari(vece, avr_full_offset(a->vrt), avr_full_offset(a->=
vrb),
+                      (8 << vece) - 1, 16, 16);
+
+    return true;
+}
+
+TRANS(VEXPANDBM, do_vexpand, MO_8)
+TRANS(VEXPANDHM, do_vexpand, MO_16)
+TRANS(VEXPANDWM, do_vexpand, MO_32)
+TRANS(VEXPANDDM, do_vexpand, MO_64)
+
+static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp =3D tcg_temp_new_i64();
+
+    get_avr64(tmp, a->vrb, true);
+    tcg_gen_sari_i64(tmp, tmp, 63);
+    set_avr64(a->vrt, tmp, false);
+    set_avr64(a->vrt, tmp, true);
+
+    tcg_temp_free_i64(tmp);
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           =
\
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              =
\
     {                                                                   =
\
--=20
2.31.1


