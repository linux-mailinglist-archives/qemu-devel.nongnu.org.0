Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1454CA516
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:44:15 +0100 (CET)
Received: from localhost ([::1]:44130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOL0-00060h-Tt
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:44:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPNAS-0002Wp-7y; Wed, 02 Mar 2022 06:29:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPNAQ-00083r-8A; Wed, 02 Mar 2022 06:29:15 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AAnbt032167; 
 Wed, 2 Mar 2022 11:08:20 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej4h3kq98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:20 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dUF022348;
 Wed, 2 Mar 2022 11:08:18 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8F8F53150054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4CA9A4079;
 Wed,  2 Mar 2022 11:08:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 792F7A4075;
 Wed,  2 Mar 2022 11:08:15 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:15 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id AB9B1220294;
 Wed,  2 Mar 2022 12:08:14 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 11/87] target/ppc: Implement vmsumcud instruction
Date: Wed,  2 Mar 2022 12:06:47 +0100
Message-Id: <20220302110803.849505-12-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vcM1eArqUysa8wfyJQfKif91iLdpbevK
X-Proofpoint-GUID: vcM1eArqUysa8wfyJQfKif91iLdpbevK
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1034 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=468 phishscore=0
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
Message-Id: <20220225210936.1749575-6-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  4 +++
 target/ppc/translate/vmx-impl.c.inc | 53 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d817e44c7104..e85a75db2ff7 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -468,6 +468,10 @@ VMULHSD         000100 ..... ..... ..... 01111001001  =
  @VX
 VMULHUD         000100 ..... ..... ..... 01011001001    @VX
 VMULLD          000100 ..... ..... ..... 00111001001    @VX
=20
+## Vector Multiply-Sum Instructions
+
+VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
+
 # VSX Load/Store Instructions
=20
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx=
-impl.c.inc
index 97a075efd1ef..4f528dc82018 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2081,6 +2081,59 @@ static bool trans_VPEXTD(DisasContext *ctx, arg_VX *=
a)
     return true;
 }
=20
+static bool trans_VMSUMCUD(DisasContext *ctx, arg_VA *a)
+{
+    TCGv_i64 tmp0, tmp1, prod1h, prod1l, prod0h, prod0l, zero;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp0 =3D tcg_temp_new_i64();
+    tmp1 =3D tcg_temp_new_i64();
+    prod1h =3D tcg_temp_new_i64();
+    prod1l =3D tcg_temp_new_i64();
+    prod0h =3D tcg_temp_new_i64();
+    prod0l =3D tcg_temp_new_i64();
+    zero =3D tcg_constant_i64(0);
+
+    /* prod1 =3D vsr[vra+32].dw[1] * vsr[vrb+32].dw[1] */
+    get_avr64(tmp0, a->vra, false);
+    get_avr64(tmp1, a->vrb, false);
+    tcg_gen_mulu2_i64(prod1l, prod1h, tmp0, tmp1);
+
+    /* prod0 =3D vsr[vra+32].dw[0] * vsr[vrb+32].dw[0] */
+    get_avr64(tmp0, a->vra, true);
+    get_avr64(tmp1, a->vrb, true);
+    tcg_gen_mulu2_i64(prod0l, prod0h, tmp0, tmp1);
+
+    /* Sum lower 64-bits elements */
+    get_avr64(tmp1, a->rc, false);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp1, zero, prod1l, zero);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp1, tmp0, prod0l, zero);
+
+    /*
+     * Discard lower 64-bits, leaving the carry into bit 64.
+     * Then sum the higher 64-bit elements.
+     */
+    get_avr64(tmp1, a->rc, true);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp0, zero, tmp1, zero);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp1, tmp0, prod1h, zero);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp1, tmp0, prod0h, zero);
+
+    /* Discard 64 more bits to complete the CHOP128(temp >> 128) */
+    set_avr64(a->vrt, tmp0, false);
+    set_avr64(a->vrt, zero, true);
+
+    tcg_temp_free_i64(tmp0);
+    tcg_temp_free_i64(tmp1);
+    tcg_temp_free_i64(prod1h);
+    tcg_temp_free_i64(prod1l);
+    tcg_temp_free_i64(prod0h);
+    tcg_temp_free_i64(prod0l);
+
+    return true;
+}
+
 static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
                          void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
--=20
2.34.1


