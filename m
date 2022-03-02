Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73E4CA39B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:26:49 +0100 (CET)
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPN84-00063G-64
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:26:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqR-0000ST-88; Wed, 02 Mar 2022 06:08:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqP-0001kX-Ke; Wed, 02 Mar 2022 06:08:34 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228khrc030968; 
 Wed, 2 Mar 2022 11:08:28 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5ccaqjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:28 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2baA011461;
 Wed, 2 Mar 2022 11:08:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8NZa37093642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEB0BA4079;
 Wed,  2 Mar 2022 11:08:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B2D5A4067;
 Wed,  2 Mar 2022 11:08:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E2ADD220294;
 Wed,  2 Mar 2022 12:08:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 23/87] target/ppc: implement vcntmb[bhwd]
Date: Wed,  2 Mar 2022 12:06:59 +0100
Message-Id: <20220302110803.849505-24-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DOTusvTv7cvo2wjhQ3lLk0zmMeD34ou7
X-Proofpoint-GUID: DOTusvTv7cvo2wjhQ3lLk0zmMeD34ou7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1034 bulkscore=0
 mlxlogscore=609 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
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
Message-Id: <20220225210936.1749575-18-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  8 ++++++++
 target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b20f1eaa8e9c..31a3c3b5084c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -63,6 +63,9 @@
 &VX_bf          bf vra vrb
 @VX_bf          ...... bf:3 .. vra:5 vrb:5 ...........          &VX_bf
=20
+&VX_mp          rt mp:bool vrb
+@VX_mp          ...... rt:5 .... mp:1 vrb:5 ...........         &VX_mp
+
 &VX_tb_rc       vrt vrb rc:bool
 @VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_r=
c
=20
@@ -489,6 +492,11 @@ VEXTRACTWM      000100 ..... 01010 ..... 11001000010=
    @VX_tb
 VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
 VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
=20
+VCNTMBB         000100 ..... 1100 . ..... 11001000010   @VX_mp
+VCNTMBH         000100 ..... 1101 . ..... 11001000010   @VX_mp
+VCNTMBW         000100 ..... 1110 . ..... 11001000010   @VX_mp
+VCNTMBD         000100 ..... 1111 . ..... 11001000010   @VX_mp
+
 ## Vector Multiply Instruction
=20
 VMULESB         000100 ..... ..... ..... 01100001000    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 4db5656669c7..e45bd194f430 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1910,6 +1910,38 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_=
DX_b *a)
     return true;
 }
=20
+static bool do_vcntmb(DisasContext *ctx, arg_VX_mp *a, int vece)
+{
+    TCGv_i64 rt, vrb, mask;
+    rt =3D tcg_const_i64(0);
+    vrb =3D tcg_temp_new_i64();
+    mask =3D tcg_constant_i64(dup_const(vece, 1ULL << ((8 << vece) - 1))=
);
+
+    for (int i =3D 0; i < 2; i++) {
+        get_avr64(vrb, a->vrb, i);
+        if (a->mp) {
+            tcg_gen_and_i64(vrb, mask, vrb);
+        } else {
+            tcg_gen_andc_i64(vrb, mask, vrb);
+        }
+        tcg_gen_ctpop_i64(vrb, vrb);
+        tcg_gen_add_i64(rt, rt, vrb);
+    }
+
+    tcg_gen_shli_i64(rt, rt, TARGET_LONG_BITS - 8 + vece);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], rt);
+
+    tcg_temp_free_i64(vrb);
+    tcg_temp_free_i64(rt);
+
+    return true;
+}
+
+TRANS(VCNTMBB, do_vcntmb, MO_8)
+TRANS(VCNTMBH, do_vcntmb, MO_16)
+TRANS(VCNTMBW, do_vcntmb, MO_32)
+TRANS(VCNTMBD, do_vcntmb, MO_64)
+
 static bool do_vstri(DisasContext *ctx, arg_VX_tb_rc *a,
                      void (*gen_helper)(TCGv_i32, TCGv_ptr, TCGv_ptr))
 {
--=20
2.34.1


