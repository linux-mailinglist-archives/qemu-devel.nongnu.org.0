Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F84CA36D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:20:26 +0100 (CET)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPN1t-00055O-PS
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqP-0000Jz-6j; Wed, 02 Mar 2022 06:08:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14578
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqN-0001jw-JF; Wed, 02 Mar 2022 06:08:32 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AmlDh030639; 
 Wed, 2 Mar 2022 11:08:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75erc8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B3B5T017791;
 Wed, 2 Mar 2022 11:08:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj19jrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8MSL18940384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8443F4C046;
 Wed,  2 Mar 2022 11:08:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 413094C050;
 Wed,  2 Mar 2022 11:08:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 866A8220294;
 Wed,  2 Mar 2022 12:08:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 21/87] target/ppc: implement vclrlb
Date: Wed,  2 Mar 2022 12:06:57 +0100
Message-Id: <20220302110803.849505-22-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XmiC77f_k6gcLL4NhlXnQo_mDCYtM28K
X-Proofpoint-GUID: XmiC77f_k6gcLL4NhlXnQo_mDCYtM28K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=766
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Message-Id: <20220225210936.1749575-16-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  2 ++
 target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d844d868291a..31cdbba86bfb 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -529,6 +529,8 @@ VSTRIBR         000100 ..... 00001 ..... . 0000001101=
   @VX_tb_rc
 VSTRIHL         000100 ..... 00010 ..... . 0000001101   @VX_tb_rc
 VSTRIHR         000100 ..... 00011 ..... . 0000001101   @VX_tb_rc
=20
+VCLRLB          000100 ..... ..... ..... 00110001101    @VX
+
 # VSX Load/Store Instructions
=20
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 6962929826ff..d43fba00ed43 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1940,6 +1940,46 @@ TRANS(VSTRIBR, do_vstri, gen_helper_VSTRIBR)
 TRANS(VSTRIHL, do_vstri, gen_helper_VSTRIHL)
 TRANS(VSTRIHR, do_vstri, gen_helper_VSTRIHR)
=20
+static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
+{
+    TCGv_i64 rb, mh, ml, tmp,
+             ones =3D tcg_constant_i64(-1),
+             zero =3D tcg_constant_i64(0);
+
+    rb =3D tcg_temp_new_i64();
+    mh =3D tcg_temp_new_i64();
+    ml =3D tcg_temp_new_i64();
+    tmp =3D tcg_temp_new_i64();
+
+    tcg_gen_extu_tl_i64(rb, cpu_gpr[a->vrb]);
+    tcg_gen_andi_i64(tmp, rb, 7);
+    tcg_gen_shli_i64(tmp, tmp, 3);
+    tcg_gen_shl_i64(tmp, ones, tmp);
+    tcg_gen_not_i64(tmp, tmp);
+
+    tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(8),
+                        tmp, ones);
+    tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(8),
+                        zero, tmp);
+    tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(16),
+                        mh, ones);
+
+    get_avr64(tmp, a->vra, true);
+    tcg_gen_and_i64(tmp, tmp, mh);
+    set_avr64(a->vrt, tmp, true);
+
+    get_avr64(tmp, a->vra, false);
+    tcg_gen_and_i64(tmp, tmp, ml);
+    set_avr64(a->vrt, tmp, false);
+
+    tcg_temp_free_i64(rb);
+    tcg_temp_free_i64(mh);
+    tcg_temp_free_i64(ml);
+    tcg_temp_free_i64(tmp);
+
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
2.34.1


