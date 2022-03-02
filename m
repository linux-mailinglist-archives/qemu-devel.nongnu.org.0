Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB664CA3B1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:29:53 +0100 (CET)
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNB2-0001zK-Mp
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqS-0000VF-97; Wed, 02 Mar 2022 06:08:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqQ-0001l4-HR; Wed, 02 Mar 2022 06:08:35 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229dLrq009593; 
 Wed, 2 Mar 2022 11:08:24 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej425mana-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:23 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2cdS011476;
 Wed, 2 Mar 2022 11:08:22 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:22 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8KIJ51970488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E568442042;
 Wed,  2 Mar 2022 11:08:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FC8A42041;
 Wed,  2 Mar 2022 11:08:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:19 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E5ADA220294;
 Wed,  2 Mar 2022 12:08:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 17/87] target/ppc: Implement Vector Compare Equal Quadword
Date: Wed,  2 Mar 2022 12:06:53 +0100
Message-Id: <20220302110803.849505-18-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rleJm46iUF0PxjWHmLK-6l4ZVoPj92rm
X-Proofpoint-ORIG-GUID: rleJm46iUF0PxjWHmLK-6l4ZVoPj92rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1034
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 mlxlogscore=631 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Implement the following PowerISA v3.1 instructions:
vcmpequq: Vector Compare Equal Quadword

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-12-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 36 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index be9e05cc73b3..437a3e29e059 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -382,6 +382,7 @@ VCMPEQUB        000100 ..... ..... ..... . 0000000110=
   @VC
 VCMPEQUH        000100 ..... ..... ..... . 0001000110   @VC
 VCMPEQUW        000100 ..... ..... ..... . 0010000110   @VC
 VCMPEQUD        000100 ..... ..... ..... . 0011000111   @VC
+VCMPEQUQ        000100 ..... ..... ..... . 0111000111   @VC
=20
 VCMPGTSB        000100 ..... ..... ..... . 1100000110   @VC
 VCMPGTSH        000100 ..... ..... ..... . 1101000110   @VC
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 0574bb8bab7b..b7e9afb97897 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1107,6 +1107,42 @@ TRANS(VCMPNEZB, do_vcmpnez, MO_8)
 TRANS(VCMPNEZH, do_vcmpnez, MO_16)
 TRANS(VCMPNEZW, do_vcmpnez, MO_32)
=20
+static bool trans_VCMPEQUQ(DisasContext *ctx, arg_VC *a)
+{
+    TCGv_i64 t0, t1, t2;
+
+    t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_temp_new_i64();
+    t2 =3D tcg_temp_new_i64();
+
+    get_avr64(t0, a->vra, true);
+    get_avr64(t1, a->vrb, true);
+    tcg_gen_xor_i64(t2, t0, t1);
+
+    get_avr64(t0, a->vra, false);
+    get_avr64(t1, a->vrb, false);
+    tcg_gen_xor_i64(t1, t0, t1);
+
+    tcg_gen_or_i64(t1, t1, t2);
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, t1, 0);
+    tcg_gen_neg_i64(t1, t1);
+
+    set_avr64(a->vrt, t1, true);
+    set_avr64(a->vrt, t1, false);
+
+    if (a->rc) {
+        tcg_gen_extrl_i64_i32(cpu_crf[6], t1);
+        tcg_gen_andi_i32(cpu_crf[6], cpu_crf[6], 0xa);
+        tcg_gen_xori_i32(cpu_crf[6], cpu_crf[6], 0x2);
+    }
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+
+    return true;
+}
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
--=20
2.34.1


