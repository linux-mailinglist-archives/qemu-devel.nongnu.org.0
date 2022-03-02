Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA34CA43D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:52:49 +0100 (CET)
Received: from localhost ([::1]:54654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNXE-0007Bb-69
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:52:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr1-00012A-Gu; Wed, 02 Mar 2022 06:09:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqz-0001of-6H; Wed, 02 Mar 2022 06:09:11 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222A9khS032326; 
 Wed, 2 Mar 2022 11:08:42 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej4h3kqv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:42 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2x0e030092;
 Wed, 2 Mar 2022 11:08:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu9523s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8bID54460912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E62F11C05B;
 Wed,  2 Mar 2022 11:08:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CA0B11C050;
 Wed,  2 Mar 2022 11:08:37 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:37 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9C9D52201C1;
 Wed,  2 Mar 2022 12:08:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 44/87] target/ppc: Implement xvtlsbb instruction
Date: Wed,  2 Mar 2022 12:07:20 +0100
Message-Id: <20220302110803.849505-45-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WMmG6gURvDXj2oWClyY_91N3e45YXVQK
X-Proofpoint-GUID: WMmG6gURvDXj2oWClyY_91N3e45YXVQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1034 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=833 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-39-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  7 +++++
 target/ppc/translate/vsx-impl.c.inc | 40 +++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c28cc13325fe..973cda113166 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -155,6 +155,9 @@
 &XX2            xt xb uim:uint8_t
 @XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=3D=
%xx_xt xb=3D%xx_xb
=20
+&XX2_bf_xb      bf xb
+@XX2_bf_xb      ...... bf:3 .. ..... ..... ......... . .        &XX2_bf_=
xb xb=3D%xx_xb
+
 &XX3            xt xa xb
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=3D=
%xx_xt xa=3D%xx_xa xb=3D%xx_xb
=20
@@ -666,6 +669,10 @@ XSMINJDP        111100 ..... ..... ..... 10011000 ..=
.   @XX3
=20
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
=20
+## VSX Vector Test Least-Significant Bit by Byte Instruction
+
+XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
+
 ### rfebb
 &XL_s           s:uint8_t
 @XL_s           ......-------------- s:1 .......... -   &XL_s
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 292a14f5aa98..4da889531bd7 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1704,6 +1704,46 @@ static bool trans_LXVKQ(DisasContext *ctx, arg_X_u=
im5 *a)
     return true;
 }
=20
+static bool trans_XVTLSBB(DisasContext *ctx, arg_XX2_bf_xb *a)
+{
+    TCGv_i64 xb, t0, t1, all_true, all_false, mask, zero;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xb =3D tcg_temp_new_i64();
+    t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_temp_new_i64();
+    all_true =3D tcg_temp_new_i64();
+    all_false =3D tcg_temp_new_i64();
+    mask =3D tcg_constant_i64(dup_const(MO_8, 1));
+    zero =3D tcg_constant_i64(0);
+
+    get_cpu_vsr(xb, a->xb, true);
+    tcg_gen_and_i64(t0, mask, xb);
+    get_cpu_vsr(xb, a->xb, false);
+    tcg_gen_and_i64(t1, mask, xb);
+
+    tcg_gen_or_i64(all_false, t0, t1);
+    tcg_gen_and_i64(all_true, t0, t1);
+
+    tcg_gen_setcond_i64(TCG_COND_EQ, all_false, all_false, zero);
+    tcg_gen_shli_i64(all_false, all_false, 1);
+    tcg_gen_setcond_i64(TCG_COND_EQ, all_true, all_true, mask);
+    tcg_gen_shli_i64(all_true, all_true, 3);
+
+    tcg_gen_or_i64(t0, all_false, all_true);
+    tcg_gen_extrl_i64_i32(cpu_crf[a->bf], t0);
+
+    tcg_temp_free_i64(xb);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(all_true);
+    tcg_temp_free_i64(all_false);
+
+    return true;
+}
+
 static void gen_xxsldwi(DisasContext *ctx)
 {
     TCGv_i64 xth, xtl;
--=20
2.34.1


