Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC34CA385
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:23:07 +0100 (CET)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPN4U-0000Hv-5n
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:23:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqQ-0000R3-TW; Wed, 02 Mar 2022 06:08:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqP-0001kE-53; Wed, 02 Mar 2022 06:08:34 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229J1SL025840; 
 Wed, 2 Mar 2022 11:08:25 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5uc22bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:25 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2bML027230;
 Wed, 2 Mar 2022 11:08:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8KD858720562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8496F52059;
 Wed,  2 Mar 2022 11:08:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 41FD252076;
 Wed,  2 Mar 2022 11:08:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 924BF2201C1;
 Wed,  2 Mar 2022 12:08:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 18/87] target/ppc: Implement Vector Compare Greater Than
 Quadword
Date: Wed,  2 Mar 2022 12:06:54 +0100
Message-Id: <20220302110803.849505-19-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4fnrkNbd8uTA8UFfghLaJiS5MtdcvDtr
X-Proofpoint-GUID: 4fnrkNbd8uTA8UFfghLaJiS5MtdcvDtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=789 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1034 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203020047
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
vcmpgtsq: Vector Compare Greater Than Signed Quadword
vcmpgtuq: Vector Compare Greater Than Unsigned Quadword

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-13-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  2 ++
 target/ppc/translate/vmx-impl.c.inc | 39 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 437a3e29e059..07a4ef910342 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -388,11 +388,13 @@ VCMPGTSB        000100 ..... ..... ..... . 11000001=
10   @VC
 VCMPGTSH        000100 ..... ..... ..... . 1101000110   @VC
 VCMPGTSW        000100 ..... ..... ..... . 1110000110   @VC
 VCMPGTSD        000100 ..... ..... ..... . 1111000111   @VC
+VCMPGTSQ        000100 ..... ..... ..... . 1110000111   @VC
=20
 VCMPGTUB        000100 ..... ..... ..... . 1000000110   @VC
 VCMPGTUH        000100 ..... ..... ..... . 1001000110   @VC
 VCMPGTUW        000100 ..... ..... ..... . 1010000110   @VC
 VCMPGTUD        000100 ..... ..... ..... . 1011000111   @VC
+VCMPGTUQ        000100 ..... ..... ..... . 1010000111   @VC
=20
 VCMPNEB         000100 ..... ..... ..... . 0000000111   @VC
 VCMPNEH         000100 ..... ..... ..... . 0001000111   @VC
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index b7e9afb97897..7f9913235e97 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1143,6 +1143,45 @@ static bool trans_VCMPEQUQ(DisasContext *ctx, arg_=
VC *a)
     return true;
 }
=20
+static bool do_vcmpgtq(DisasContext *ctx, arg_VC *a, bool sign)
+{
+    TCGv_i64 t0, t1, t2;
+
+    t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_temp_new_i64();
+    t2 =3D tcg_temp_new_i64();
+
+    get_avr64(t0, a->vra, false);
+    get_avr64(t1, a->vrb, false);
+    tcg_gen_setcond_i64(TCG_COND_GTU, t2, t0, t1);
+
+    get_avr64(t0, a->vra, true);
+    get_avr64(t1, a->vrb, true);
+    tcg_gen_movcond_i64(TCG_COND_EQ, t2, t0, t1, t2, tcg_constant_i64(0)=
);
+    tcg_gen_setcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t1, t0, t1);
+
+    tcg_gen_or_i64(t1, t1, t2);
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
+TRANS(VCMPGTSQ, do_vcmpgtq, true)
+TRANS(VCMPGTUQ, do_vcmpgtq, false)
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
--=20
2.34.1


