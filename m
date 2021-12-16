Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C39477DBE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:42:42 +0100 (CET)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxaK-0000Zx-9w
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:42:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKw-0001Gm-CA; Thu, 16 Dec 2021 15:26:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKs-0007Jh-8J; Thu, 16 Dec 2021 15:26:45 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGK9fPM008276; 
 Thu, 16 Dec 2021 20:26:28 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cy2tr1gxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDRuj026852;
 Thu, 16 Dec 2021 20:26:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3cy77pj7y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQN2031916462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29CA611C058;
 Thu, 16 Dec 2021 20:26:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD8ED11C04C;
 Thu, 16 Dec 2021 20:26:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 300D82201A0;
 Thu, 16 Dec 2021 21:26:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 008/101] target/ppc: Implement Vector Mask Move insns
Date: Thu, 16 Dec 2021 21:24:41 +0100
Message-Id: <20211216202614.414266-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pwhDkqVWR2QI99c2_N_Rxp53aWwcLbYZ
X-Proofpoint-ORIG-GUID: pwhDkqVWR2QI99c2_N_Rxp53aWwcLbYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1034 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
mtvsrbm: Move to VSR Byte Mask
mtvsrhm: Move to VSR Halfword Mask
mtvsrwm: Move to VSR Word Mask
mtvsrdm: Move to VSR Doubleword Mask
mtvsrqm: Move to VSR Quadword Mask
mtvsrbmi: Move to VSR Byte Mask Immediate

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211203194229.746275-4-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  11 +++
 target/ppc/translate/vmx-impl.c.inc | 115 ++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 639ac22bf055..f68931f4f374 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -40,6 +40,10 @@
 %ds_rtp         22:4   !function=3Dtimes_2
 @DS_rtp         ...... ....0 ra:5 .............. ..             &D rt=3D=
%ds_rtp si=3D%ds_si
=20
+&DX_b           vrt b
+%dx_b           6:10 16:5 0:1
+@DX_b           ...... vrt:5  ..... .......... ..... .          &DX_b b=3D=
%dx_b
+
 &DX             rt d
 %dx_d           6:s10 16:5 0:1
 @DX             ...... rt:5  ..... .......... ..... .   &DX d=3D%dx_d
@@ -413,6 +417,13 @@ VSRDBI          000100 ..... ..... ..... 01 ... 0101=
10  @VN
=20
 ## Vector Mask Manipulation Instructions
=20
+MTVSRBM         000100 ..... 10000 ..... 11001000010    @VX_tb
+MTVSRHM         000100 ..... 10001 ..... 11001000010    @VX_tb
+MTVSRWM         000100 ..... 10010 ..... 11001000010    @VX_tb
+MTVSRDM         000100 ..... 10011 ..... 11001000010    @VX_tb
+MTVSRQM         000100 ..... 10100 ..... 11001000010    @VX_tb
+MTVSRBMI        000100 ..... ..... .......... 01010 .   @DX_b
+
 VEXPANDBM       000100 ..... 00000 ..... 11001000010    @VX_tb
 VEXPANDHM       000100 ..... 00001 ..... 11001000010    @VX_tb
 VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 96c97bf6e74c..d5e02fd7f22e 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1607,6 +1607,121 @@ static bool trans_VEXTRACTQM(DisasContext *ctx, a=
rg_VX_tb *a)
     return true;
 }
=20
+static bool do_mtvsrm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    const uint64_t elem_width =3D 8 << vece, elem_count_half =3D 8 >> ve=
ce;
+    uint64_t c;
+    int i, j;
+    TCGv_i64 hi, lo, t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    hi =3D tcg_temp_new_i64();
+    lo =3D tcg_temp_new_i64();
+    t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_temp_new_i64();
+
+    tcg_gen_extu_tl_i64(t0, cpu_gpr[a->vrb]);
+    tcg_gen_extract_i64(hi, t0, elem_count_half, elem_count_half);
+    tcg_gen_extract_i64(lo, t0, 0, elem_count_half);
+
+    /*
+     * Spread the bits into their respective elements.
+     * E.g. for bytes:
+     * 00000000000000000000000000000000000000000000000000000000abcdefgh
+     *   << 32 - 4
+     * 0000000000000000000000000000abcdefgh0000000000000000000000000000
+     *   |
+     * 0000000000000000000000000000abcdefgh00000000000000000000abcdefgh
+     *   << 16 - 2
+     * 00000000000000abcdefgh00000000000000000000abcdefgh00000000000000
+     *   |
+     * 00000000000000abcdefgh000000abcdefgh000000abcdefgh000000abcdefgh
+     *   << 8 - 1
+     * 0000000abcdefgh000000abcdefgh000000abcdefgh000000abcdefgh0000000
+     *   |
+     * 0000000abcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgh
+     *   & dup(1)
+     * 0000000a0000000b0000000c0000000d0000000e0000000f0000000g0000000h
+     *   * 0xff
+     * aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffffgggggggghhhhhhhh
+     */
+    for (i =3D elem_count_half / 2, j =3D 32; i > 0; i >>=3D 1, j >>=3D =
1) {
+        tcg_gen_shli_i64(t0, hi, j - i);
+        tcg_gen_shli_i64(t1, lo, j - i);
+        tcg_gen_or_i64(hi, hi, t0);
+        tcg_gen_or_i64(lo, lo, t1);
+    }
+
+    c =3D dup_const(vece, 1);
+    tcg_gen_andi_i64(hi, hi, c);
+    tcg_gen_andi_i64(lo, lo, c);
+
+    c =3D MAKE_64BIT_MASK(0, elem_width);
+    tcg_gen_muli_i64(hi, hi, c);
+    tcg_gen_muli_i64(lo, lo, c);
+
+    set_avr64(a->vrt, lo, false);
+    set_avr64(a->vrt, hi, true);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+TRANS(MTVSRBM, do_mtvsrm, MO_8)
+TRANS(MTVSRHM, do_mtvsrm, MO_16)
+TRANS(MTVSRWM, do_mtvsrm, MO_32)
+TRANS(MTVSRDM, do_mtvsrm, MO_64)
+
+static bool trans_MTVSRQM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp =3D tcg_temp_new_i64();
+
+    tcg_gen_ext_tl_i64(tmp, cpu_gpr[a->vrb]);
+    tcg_gen_sextract_i64(tmp, tmp, 0, 1);
+    set_avr64(a->vrt, tmp, false);
+    set_avr64(a->vrt, tmp, true);
+
+    tcg_temp_free_i64(tmp);
+
+    return true;
+}
+
+static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
+{
+    const uint64_t mask =3D dup_const(MO_8, 1);
+    uint64_t hi, lo;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    hi =3D extract16(a->b, 8, 8);
+    lo =3D extract16(a->b, 0, 8);
+
+    for (int i =3D 4, j =3D 32; i > 0; i >>=3D 1, j >>=3D 1) {
+        hi |=3D hi << (j - i);
+        lo |=3D lo << (j - i);
+    }
+
+    hi =3D (hi & mask) * 0xFF;
+    lo =3D (lo & mask) * 0xFF;
+
+    set_avr64(a->vrt, tcg_constant_i64(hi), true);
+    set_avr64(a->vrt, tcg_constant_i64(lo), false);
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


