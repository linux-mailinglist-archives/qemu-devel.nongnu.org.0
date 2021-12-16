Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBAD477DC1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:43:29 +0100 (CET)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxb5-0001oP-Sk
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:43:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKs-0001Az-3L; Thu, 16 Dec 2021 15:26:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46576
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKo-0007HX-NC; Thu, 16 Dec 2021 15:26:40 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGISBeu014257; 
 Thu, 16 Dec 2021 20:26:27 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmwwudw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:26 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCWHn010861;
 Thu, 16 Dec 2021 20:26:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78hj779-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQM8T23986542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82B3BA4051;
 Thu, 16 Dec 2021 20:26:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 411DFA4057;
 Thu, 16 Dec 2021 20:26:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 849C5220238;
 Thu, 16 Dec 2021 21:26:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 007/101] target/ppc: Implement Vector Extract Mask
Date: Thu, 16 Dec 2021 21:24:40 +0100
Message-Id: <20211216202614.414266-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _0h5ihzajNptmxZMuuUwmKcXbyfi_h9r
X-Proofpoint-ORIG-GUID: _0h5ihzajNptmxZMuuUwmKcXbyfi_h9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
vextractbm: Vector Extract Byte Mask
vextracthm: Vector Extract Halfword Mask
vextractwm: Vector Extract Word Mask
vextractdm: Vector Extract Doubleword Mask
vextractqm: Vector Extract Quadword Mask

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211203194229.746275-3-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  6 +++
 target/ppc/translate/vmx-impl.c.inc | 82 +++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9a28f1d266bb..639ac22bf055 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -419,6 +419,12 @@ VEXPANDWM       000100 ..... 00010 ..... 11001000010=
    @VX_tb
 VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
 VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
=20
+VEXTRACTBM      000100 ..... 01000 ..... 11001000010    @VX_tb
+VEXTRACTHM      000100 ..... 01001 ..... 11001000010    @VX_tb
+VEXTRACTWM      000100 ..... 01010 ..... 11001000010    @VX_tb
+VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
+VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
+
 # VSX Load/Store Instructions
=20
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index ebb048432369..96c97bf6e74c 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1525,6 +1525,88 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg=
_VX_tb *a)
     return true;
 }
=20
+static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    const uint64_t elem_width =3D 8 << vece, elem_count_half =3D 8 >> ve=
ce,
+                   mask =3D dup_const(vece, 1 << (elem_width - 1));
+    uint64_t i, j;
+    TCGv_i64 lo, hi, t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    hi =3D tcg_temp_new_i64();
+    lo =3D tcg_temp_new_i64();
+    t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_temp_new_i64();
+
+    get_avr64(lo, a->vrb, false);
+    get_avr64(hi, a->vrb, true);
+
+    tcg_gen_andi_i64(lo, lo, mask);
+    tcg_gen_andi_i64(hi, hi, mask);
+
+    /*
+     * Gather the most significant bit of each element in the highest el=
ement
+     * element. E.g. for bytes:
+     * aXXXXXXXbXXXXXXXcXXXXXXXdXXXXXXXeXXXXXXXfXXXXXXXgXXXXXXXhXXXXXXX
+     *     & dup(1 << (elem_width - 1))
+     * a0000000b0000000c0000000d0000000e0000000f0000000g0000000h0000000
+     *     << 32 - 4
+     * 0000e0000000f0000000g0000000h00000000000000000000000000000000000
+     *     |
+     * a000e000b000f000c000g000d000h000e0000000f0000000g0000000h0000000
+     *     << 16 - 2
+     * 00c000g000d000h000e0000000f0000000g0000000h000000000000000000000
+     *     |
+     * a0c0e0g0b0d0f0h0c0e0g000d0f0h000e0g00000f0h00000g0000000h0000000
+     *     << 8 - 1
+     * 0b0d0f0h0c0e0g000d0f0h000e0g00000f0h00000g0000000h00000000000000
+     *     |
+     * abcdefghbcdefgh0cdefgh00defgh000efgh0000fgh00000gh000000h0000000
+     */
+    for (i =3D elem_count_half / 2, j =3D 32; i > 0; i >>=3D 1, j >>=3D =
1) {
+        tcg_gen_shli_i64(t0, hi, j - i);
+        tcg_gen_shli_i64(t1, lo, j - i);
+        tcg_gen_or_i64(hi, hi, t0);
+        tcg_gen_or_i64(lo, lo, t1);
+    }
+
+    tcg_gen_shri_i64(hi, hi, 64 - elem_count_half);
+    tcg_gen_extract2_i64(lo, lo, hi, 64 - elem_count_half);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], lo);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+TRANS(VEXTRACTBM, do_vextractm, MO_8)
+TRANS(VEXTRACTHM, do_vextractm, MO_16)
+TRANS(VEXTRACTWM, do_vextractm, MO_32)
+TRANS(VEXTRACTDM, do_vextractm, MO_64)
+
+static bool trans_VEXTRACTQM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp =3D tcg_temp_new_i64();
+
+    get_avr64(tmp, a->vrb, true);
+    tcg_gen_shri_i64(tmp, tmp, 63);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], tmp);
+
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
2.31.1


