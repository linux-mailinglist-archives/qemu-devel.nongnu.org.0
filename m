Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCA04CA356
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:18:45 +0100 (CET)
Received: from localhost ([::1]:56982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPN0G-0000v7-B3
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:18:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqS-0000VJ-Qh; Wed, 02 Mar 2022 06:08:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqR-0001lE-3p; Wed, 02 Mar 2022 06:08:36 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AqQ2E009956; 
 Wed, 2 Mar 2022 11:08:28 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej779rbae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:28 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dUH022348;
 Wed, 2 Mar 2022 11:08:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B8N9W38076794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E7294203F;
 Wed,  2 Mar 2022 11:08:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFF6142041;
 Wed,  2 Mar 2022 11:08:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 30B022201C1;
 Wed,  2 Mar 2022 12:08:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 22/87] target/ppc: implement vclrrb
Date: Wed,  2 Mar 2022 12:06:58 +0100
Message-Id: <20220302110803.849505-23-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v6P1cRv7tXM-sxN9VI-mwWZOghsMHZen
X-Proofpoint-GUID: v6P1cRv7tXM-sxN9VI-mwWZOghsMHZen
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=695 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 clxscore=1034 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Message-Id: <20220225210936.1749575-17-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++--------
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 31cdbba86bfb..b20f1eaa8e9c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -530,6 +530,7 @@ VSTRIHL         000100 ..... 00010 ..... . 0000001101=
   @VX_tb_rc
 VSTRIHR         000100 ..... 00011 ..... . 0000001101   @VX_tb_rc
=20
 VCLRLB          000100 ..... ..... ..... 00110001101    @VX
+VCLRRB          000100 ..... ..... ..... 00111001101    @VX
=20
 # VSX Load/Store Instructions
=20
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index d43fba00ed43..4db5656669c7 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1940,7 +1940,7 @@ TRANS(VSTRIBR, do_vstri, gen_helper_VSTRIBR)
 TRANS(VSTRIHL, do_vstri, gen_helper_VSTRIHL)
 TRANS(VSTRIHR, do_vstri, gen_helper_VSTRIHR)
=20
-static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
+static bool do_vclrb(DisasContext *ctx, arg_VX *a, bool right)
 {
     TCGv_i64 rb, mh, ml, tmp,
              ones =3D tcg_constant_i64(-1),
@@ -1954,15 +1954,28 @@ static bool trans_VCLRLB(DisasContext *ctx, arg_V=
X *a)
     tcg_gen_extu_tl_i64(rb, cpu_gpr[a->vrb]);
     tcg_gen_andi_i64(tmp, rb, 7);
     tcg_gen_shli_i64(tmp, tmp, 3);
-    tcg_gen_shl_i64(tmp, ones, tmp);
+    if (right) {
+        tcg_gen_shr_i64(tmp, ones, tmp);
+    } else {
+        tcg_gen_shl_i64(tmp, ones, tmp);
+    }
     tcg_gen_not_i64(tmp, tmp);
=20
-    tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(8),
-                        tmp, ones);
-    tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(8),
-                        zero, tmp);
-    tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(16),
-                        mh, ones);
+    if (right) {
+        tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(8),
+                            tmp, ones);
+        tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(8),
+                            zero, tmp);
+        tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(16),
+                            ml, ones);
+    } else {
+        tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(8),
+                            tmp, ones);
+        tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(8),
+                            zero, tmp);
+        tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(16),
+                            mh, ones);
+    }
=20
     get_avr64(tmp, a->vra, true);
     tcg_gen_and_i64(tmp, tmp, mh);
@@ -1980,6 +1993,9 @@ static bool trans_VCLRLB(DisasContext *ctx, arg_VX =
*a)
     return true;
 }
=20
+TRANS(VCLRLB, do_vclrb, false)
+TRANS(VCLRRB, do_vclrb, true)
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           =
\
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              =
\
     {                                                                   =
\
--=20
2.34.1


