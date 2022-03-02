Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7A4CA3FA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:41:33 +0100 (CET)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNMK-0005A4-OV
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:41:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqw-0000mv-2a; Wed, 02 Mar 2022 06:09:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqs-0001nO-Bd; Wed, 02 Mar 2022 06:09:05 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229AIMW002538; 
 Wed, 2 Mar 2022 11:08:35 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5e4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:35 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dkI008759;
 Wed, 2 Mar 2022 11:08:32 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3efbfj548e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8U3f43647474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ADAC52076;
 Wed,  2 Mar 2022 11:08:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 18C5E52059;
 Wed,  2 Mar 2022 11:08:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 697CC220294;
 Wed,  2 Mar 2022 12:08:29 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 33/87] target/ppc: implement vrlqmi
Date: Wed,  2 Mar 2022 12:07:09 +0100
Message-Id: <20220302110803.849505-34-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xAz0PEQGTjs4xd-i94NsXAJB5gp8b3o6
X-Proofpoint-GUID: xAz0PEQGTjs4xd-i94NsXAJB5gp8b3o6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1034 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=937 mlxscore=0
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225210936.1749575-28-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 87d482c5d961..abc2007129d9 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -495,6 +495,7 @@ VRLQ            000100 ..... ..... ..... 00000000101 =
   @VX
=20
 VRLWMI          000100 ..... ..... ..... 00010000101    @VX
 VRLDMI          000100 ..... ..... ..... 00011000101    @VX
+VRLQMI          000100 ..... ..... ..... 00001000101    @VX
=20
 VRLWNM          000100 ..... ..... ..... 00110000101    @VX
 VRLDNM          000100 ..... ..... ..... 00111000101    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index eb305e84da9a..352250fad087 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1109,7 +1109,8 @@ static void do_vrlq_mask(TCGv_i64 mh, TCGv_i64 ml, =
TCGv_i64 b, TCGv_i64 e)
     tcg_temp_free_i64(t1);
 }
=20
-static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask)
+static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask,
+                                bool insert)
 {
     TCGv_i64 ah, al, vrb, n, t0, t1, zero =3D tcg_constant_i64(0);
=20
@@ -1146,7 +1147,7 @@ static bool do_vector_rotl_quad(DisasContext *ctx, =
arg_VX *a, bool mask)
     tcg_gen_shri_i64(ah, ah, 1);
     tcg_gen_or_i64(t1, ah, t1);
=20
-    if (mask) {
+    if (mask || insert) {
         tcg_gen_shri_i64(n, vrb, 8);
         tcg_gen_shri_i64(vrb, vrb, 16);
         tcg_gen_andi_i64(n, n, 0x7f);
@@ -1156,6 +1157,17 @@ static bool do_vector_rotl_quad(DisasContext *ctx,=
 arg_VX *a, bool mask)
=20
         tcg_gen_and_i64(t0, t0, ah);
         tcg_gen_and_i64(t1, t1, al);
+
+        if (insert) {
+            get_avr64(n, a->vrt, true);
+            get_avr64(vrb, a->vrt, false);
+            tcg_gen_not_i64(ah, ah);
+            tcg_gen_not_i64(al, al);
+            tcg_gen_and_i64(n, n, ah);
+            tcg_gen_and_i64(vrb, vrb, al);
+            tcg_gen_or_i64(t0, t0, n);
+            tcg_gen_or_i64(t1, t1, vrb);
+        }
     }
=20
     set_avr64(a->vrt, t0, true);
@@ -1171,8 +1183,9 @@ static bool do_vector_rotl_quad(DisasContext *ctx, =
arg_VX *a, bool mask)
     return true;
 }
=20
-TRANS(VRLQ, do_vector_rotl_quad, false)
-TRANS(VRLQNM, do_vector_rotl_quad, true)
+TRANS(VRLQ, do_vector_rotl_quad, false, false)
+TRANS(VRLQNM, do_vector_rotl_quad, true, false)
+TRANS(VRLQMI, do_vector_rotl_quad, false, true)
=20
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               =
\
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     =
\
--=20
2.34.1


