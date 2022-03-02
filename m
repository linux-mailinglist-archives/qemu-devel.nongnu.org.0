Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4EF4CA447
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:55:15 +0100 (CET)
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNZa-0002XI-Fl
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:55:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrA-0001KW-6I; Wed, 02 Mar 2022 06:09:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr8-0001qL-Bh; Wed, 02 Mar 2022 06:09:19 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIJ4I022577; 
 Wed, 2 Mar 2022 11:08:50 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6qa0y5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:50 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2b7n011446;
 Wed, 2 Mar 2022 11:08:48 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8jhp57606536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7D6711C05E;
 Wed,  2 Mar 2022 11:08:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EA9611C05B;
 Wed,  2 Mar 2022 11:08:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C69C0220294;
 Wed,  2 Mar 2022 12:08:44 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 55/87] target/ppc: implement lxvr[bhwd]/stxvr[bhwd]x
Date: Wed,  2 Mar 2022 12:07:31 +0100
Message-Id: <20220302110803.849505-56-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RtGqXWZ5eXzy0Tv31k34KMAA7j3JOq18
X-Proofpoint-ORIG-GUID: RtGqXWZ5eXzy0Tv31k34KMAA7j3JOq18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1034
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=919 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Implement the following PowerISA v3.1 instuctions:
lxvrbx: Load VSX Vector Rightmost Byte Indexed X-form
lxvrhx: Load VSX Vector Rightmost Halfword Indexed X-form
lxvrwx: Load VSX Vector Rightmost Word Indexed X-form
lxvrdx: Load VSX Vector Rightmost Doubleword Indexed X-form

stxvrbx: Store VSX Vector Rightmost Byte Indexed X-form
stxvrhx: Store VSX Vector Rightmost Halfword Indexed X-form
stxvrwx: Store VSX Vector Rightmost Word Indexed X-form
stxvrdx: Store VSX Vector Rightmost Doubleword Indexed X-form

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-50-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  8 +++++++
 target/ppc/translate/vsx-impl.c.inc | 35 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1641a3189417..ac2d3da9a781 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -614,6 +614,14 @@ LXVX            011111 ..... ..... ..... 0100 - 0110=
0 . @X_TSX
 STXVX           011111 ..... ..... ..... 0110001100 .   @X_TSX
 LXVPX           011111 ..... ..... ..... 0101001101 -   @X_TSXP
 STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
+LXVRBX          011111 ..... ..... ..... 0000001101 .   @X_TSX
+LXVRHX          011111 ..... ..... ..... 0000101101 .   @X_TSX
+LXVRWX          011111 ..... ..... ..... 0001001101 .   @X_TSX
+LXVRDX          011111 ..... ..... ..... 0001101101 .   @X_TSX
+STXVRBX         011111 ..... ..... ..... 0010001101 .   @X_TSX
+STXVRHX         011111 ..... ..... ..... 0010101101 .   @X_TSX
+STXVRWX         011111 ..... ..... ..... 0011001101 .   @X_TSX
+STXVRDX         011111 ..... ..... ..... 0011101101 .   @X_TSX
=20
 ## VSX Scalar Multiply-Add Instructions
=20
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index a980a79b7880..2ffeab5287e9 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2363,6 +2363,41 @@ TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false=
, false)
 TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
 TRANS64_FLAGS2(ISA310, PLXVP, do_lstxv_PLS_D, false, true)
=20
+static bool do_lstrm(DisasContext *ctx, arg_X *a, MemOp mop, bool store)
+{
+    TCGv ea;
+    TCGv_i64 xt;
+
+    REQUIRE_VSX(ctx);
+
+    xt =3D tcg_temp_new_i64();
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    ea =3D do_ea_calc(ctx, a->ra , cpu_gpr[a->rb]);
+
+    if (store) {
+        get_cpu_vsr(xt, a->rt, false);
+        tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+    } else {
+        tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
+        set_cpu_vsr(a->rt, xt, false);
+        set_cpu_vsr(a->rt, tcg_constant_i64(0), true);
+    }
+
+    tcg_temp_free(ea);
+    tcg_temp_free_i64(xt);
+    return true;
+}
+
+TRANS_FLAGS2(ISA310, LXVRBX, do_lstrm, DEF_MEMOP(MO_UB), false)
+TRANS_FLAGS2(ISA310, LXVRHX, do_lstrm, DEF_MEMOP(MO_UW), false)
+TRANS_FLAGS2(ISA310, LXVRWX, do_lstrm, DEF_MEMOP(MO_UL), false)
+TRANS_FLAGS2(ISA310, LXVRDX, do_lstrm, DEF_MEMOP(MO_UQ), false)
+TRANS_FLAGS2(ISA310, STXVRBX, do_lstrm, DEF_MEMOP(MO_UB), true)
+TRANS_FLAGS2(ISA310, STXVRHX, do_lstrm, DEF_MEMOP(MO_UW), true)
+TRANS_FLAGS2(ISA310, STXVRWX, do_lstrm, DEF_MEMOP(MO_UL), true)
+TRANS_FLAGS2(ISA310, STXVRDX, do_lstrm, DEF_MEMOP(MO_UQ), true)
+
 static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 =
c,
                            int64_t imm)
 {
--=20
2.34.1


