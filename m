Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653304CA376
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:21:05 +0100 (CET)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPN2W-0005hO-GU
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:21:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqL-0008Tq-3i; Wed, 02 Mar 2022 06:08:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41124
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqJ-0001iJ-3T; Wed, 02 Mar 2022 06:08:28 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222ANW56020803; 
 Wed, 2 Mar 2022 11:08:20 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej6sr0tag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:20 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2vhU027724;
 Wed, 2 Mar 2022 11:08:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:18 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8G2Y51314984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 727CF52076;
 Wed,  2 Mar 2022 11:08:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 284BA52059;
 Wed,  2 Mar 2022 11:08:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 691E32201C1;
 Wed,  2 Mar 2022 12:08:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 12/87] target/ppc: Implement vmsumudm instruction
Date: Wed,  2 Mar 2022 12:06:48 +0100
Message-Id: <20220302110803.849505-13-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x-9u6JJQr-J9Z6ZPS1vsjLtoGNy3obvv
X-Proofpoint-GUID: x-9u6JJQr-J9Z6ZPS1vsjLtoGNy3obvv
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1034 mlxscore=0
 mlxlogscore=625 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Based on [1] by Lijun Pan <ljp@linux.ibm.com>, which was never merged
into master.

[1]: https://lists.gnu.org/archive/html/qemu-ppc/2020-07/msg00419.html

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-7-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e85a75db2ff7..732a2bb79ed4 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -471,6 +471,7 @@ VMULLD          000100 ..... ..... ..... 00111001001   =
 @VX
 ## Vector Multiply-Sum Instructions
=20
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
+VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
=20
 # VSX Load/Store Instructions
=20
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx=
-impl.c.inc
index 4f528dc82018..fcff3418c5c8 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2081,6 +2081,40 @@ static bool trans_VPEXTD(DisasContext *ctx, arg_VX *=
a)
     return true;
 }
=20
+static bool trans_VMSUMUDM(DisasContext *ctx, arg_VA *a)
+{
+    TCGv_i64 rl, rh, src1, src2;
+    int dw;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    rh =3D tcg_temp_new_i64();
+    rl =3D tcg_temp_new_i64();
+    src1 =3D tcg_temp_new_i64();
+    src2 =3D tcg_temp_new_i64();
+
+    get_avr64(rl, a->rc, false);
+    get_avr64(rh, a->rc, true);
+
+    for (dw =3D 0; dw < 2; dw++) {
+        get_avr64(src1, a->vra, dw);
+        get_avr64(src2, a->vrb, dw);
+        tcg_gen_mulu2_i64(src1, src2, src1, src2);
+        tcg_gen_add2_i64(rl, rh, rl, rh, src1, src2);
+    }
+
+    set_avr64(a->vrt, rl, false);
+    set_avr64(a->vrt, rh, true);
+
+    tcg_temp_free_i64(rl);
+    tcg_temp_free_i64(rh);
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i64(src2);
+
+    return true;
+}
+
 static bool trans_VMSUMCUD(DisasContext *ctx, arg_VA *a)
 {
     TCGv_i64 tmp0, tmp1, prod1h, prod1l, prod0h, prod0l, zero;
--=20
2.34.1


