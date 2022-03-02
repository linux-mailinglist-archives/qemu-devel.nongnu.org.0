Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7C4CA3C4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:31:52 +0100 (CET)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNCx-00050L-PD
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:31:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqV-0000VO-BN; Wed, 02 Mar 2022 06:08:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqT-0001mL-Kq; Wed, 02 Mar 2022 06:08:39 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229HWGF001956; 
 Wed, 2 Mar 2022 11:08:29 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5dyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:29 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2bNh021751;
 Wed, 2 Mar 2022 11:08:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B8OEr35783060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84798AE058;
 Wed,  2 Mar 2022 11:08:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42B6EAE051;
 Wed,  2 Mar 2022 11:08:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:24 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8A8E72201C1;
 Wed,  2 Mar 2022 12:08:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 24/87] target/ppc: implement vgnb
Date: Wed,  2 Mar 2022 12:07:00 +0100
Message-Id: <20220302110803.849505-25-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6Z5Ibdk7vwtSz8xMal4PdO8Ol9n99ozc
X-Proofpoint-GUID: 6Z5Ibdk7vwtSz8xMal4PdO8Ol9n99ozc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1034 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-19-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |   5 ++
 target/ppc/translate/vmx-impl.c.inc | 135 ++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 31a3c3b5084c..02df4a98e665 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -66,6 +66,9 @@
 &VX_mp          rt mp:bool vrb
 @VX_mp          ...... rt:5 .... mp:1 vrb:5 ...........         &VX_mp
=20
+&VX_n           rt vrb n
+@VX_n           ...... rt:5 .. n:3 vrb:5 ...........            &VX_n
+
 &VX_tb_rc       vrt vrb rc:bool
 @VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_r=
c
=20
@@ -418,6 +421,8 @@ VCMPUQ          000100 ... -- ..... ..... 00100000001=
   @VX_bf
=20
 ## Vector Bit Manipulation Instruction
=20
+VGNB            000100 ..... -- ... ..... 10011001100   @VX_n
+
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
 VCLZDM          000100 ..... ..... ..... 11110000100    @VX
 VCTZDM          000100 ..... ..... ..... 11111000100    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index e45bd194f430..52774cdd4dfb 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1416,6 +1416,141 @@ GEN_VXFORM_DUAL(vsplth, PPC_ALTIVEC, PPC_NONE,
 GEN_VXFORM_DUAL(vspltw, PPC_ALTIVEC, PPC_NONE,
                 vextractuw, PPC_NONE, PPC2_ISA300);
=20
+static bool trans_VGNB(DisasContext *ctx, arg_VX_n *a)
+{
+    /*
+     * Similar to do_vextractm, we'll use a sequence of mask-shift-or op=
erations
+     * to gather the bits. The masks can be created with
+     *
+     * uint64_t mask(uint64_t n, uint64_t step)
+     * {
+     *     uint64_t p =3D ((1UL << (1UL << step)) - 1UL) << ((n - 1UL) <=
< step),
+     *                  plen =3D n << step, m =3D 0;
+     *     for(int i =3D 0; i < 64/plen; i++) {
+     *         m |=3D p;
+     *         m =3D ror64(m, plen);
+     *     }
+     *     p >>=3D plen * DIV_ROUND_UP(64, plen) - 64;
+     *     return m | p;
+     * }
+     *
+     * But since there are few values of N, we'll use a lookup table to =
avoid
+     * these calculations at runtime.
+     */
+    static const uint64_t mask[6][5] =3D {
+        {
+            0xAAAAAAAAAAAAAAAAULL, 0xccccccccccccccccULL, 0xf0f0f0f0f0f0=
f0f0ULL,
+            0xff00ff00ff00ff00ULL, 0xffff0000ffff0000ULL
+        },
+        {
+            0x9249249249249249ULL, 0xC30C30C30C30C30CULL, 0xF00F00F00F00=
F00FULL,
+            0xFF0000FF0000FF00ULL, 0xFFFF00000000FFFFULL
+        },
+        {
+            /* For N >=3D 4, some mask operations can be elided */
+            0x8888888888888888ULL, 0, 0xf000f000f000f000ULL, 0,
+            0xFFFF000000000000ULL
+        },
+        {
+            0x8421084210842108ULL, 0, 0xF0000F0000F0000FULL, 0, 0
+        },
+        {
+            0x8208208208208208ULL, 0, 0xF00000F00000F000ULL, 0, 0
+        },
+        {
+            0x8102040810204081ULL, 0, 0xF000000F000000F0ULL, 0, 0
+        }
+    };
+    uint64_t m;
+    int i, sh, nbits =3D DIV_ROUND_UP(64, a->n);
+    TCGv_i64 hi, lo, t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    if (a->n < 2) {
+        /*
+         * "N can be any value between 2 and 7, inclusive." Otherwise, t=
he
+         * result is undefined, so we don't need to change RT. Also, N >=
 7 is
+         * impossible since the immediate field is 3 bits only.
+         */
+        return true;
+    }
+
+    hi =3D tcg_temp_new_i64();
+    lo =3D tcg_temp_new_i64();
+    t0 =3D tcg_temp_new_i64();
+    t1 =3D tcg_temp_new_i64();
+
+    get_avr64(hi, a->vrb, true);
+    get_avr64(lo, a->vrb, false);
+
+    /* Align the lower doubleword so we can use the same mask */
+    tcg_gen_shli_i64(lo, lo, a->n * nbits - 64);
+
+    /*
+     * Starting from the most significant bit, gather every Nth bit with=
 a
+     * sequence of mask-shift-or operation. E.g.: for N=3D3
+     * AxxBxxCxxDxxExxFxxGxxHxxIxxJxxKxxLxxMxxNxxOxxPxxQxxRxxSxxTxxUxxV
+     *     & rep(0b100)
+     * A..B..C..D..E..F..G..H..I..J..K..L..M..N..O..P..Q..R..S..T..U..V
+     *     << 2
+     * .B..C..D..E..F..G..H..I..J..K..L..M..N..O..P..Q..R..S..T..U..V..
+     *     |
+     * AB.BC.CD.DE.EF.FG.GH.HI.IJ.JK.KL.LM.MN.NO.OP.PQ.QR.RS.ST.TU.UV.V
+     *  & rep(0b110000)
+     * AB....CD....EF....GH....IJ....KL....MN....OP....QR....ST....UV..
+     *     << 4
+     * ..CD....EF....GH....IJ....KL....MN....OP....QR....ST....UV......
+     *     |
+     * ABCD..CDEF..EFGH..GHIJ..IJKL..KLMN..MNOP..OPQR..QRST..STUV..UV..
+     *     & rep(0b111100000000)
+     * ABCD........EFGH........IJKL........MNOP........QRST........UV..
+     *     << 8
+     * ....EFGH........IJKL........MNOP........QRST........UV..........
+     *     |
+     * ABCDEFGH....EFGHIJKL....IJKLMNOP....MNOPQRST....QRSTUV......UV..
+     *  & rep(0b111111110000000000000000)
+     * ABCDEFGH................IJKLMNOP................QRSTUV..........
+     *     << 16
+     * ........IJKLMNOP................QRSTUV..........................
+     *     |
+     * ABCDEFGHIJKLMNOP........IJKLMNOPQRSTUV..........QRSTUV..........
+     *     & rep(0b111111111111111100000000000000000000000000000000)
+     * ABCDEFGHIJKLMNOP................................QRSTUV..........
+     *     << 32
+     * ................QRSTUV..........................................
+     *     |
+     * ABCDEFGHIJKLMNOPQRSTUV..........................QRSTUV..........
+     */
+    for (i =3D 0, sh =3D a->n - 1; i < 5; i++, sh <<=3D 1) {
+        m =3D mask[a->n - 2][i];
+        if (m) {
+            tcg_gen_andi_i64(hi, hi, m);
+            tcg_gen_andi_i64(lo, lo, m);
+        }
+        if (sh < 64) {
+            tcg_gen_shli_i64(t0, hi, sh);
+            tcg_gen_shli_i64(t1, lo, sh);
+            tcg_gen_or_i64(hi, t0, hi);
+            tcg_gen_or_i64(lo, t1, lo);
+        }
+    }
+
+    tcg_gen_andi_i64(hi, hi, ~(~0ULL >> nbits));
+    tcg_gen_andi_i64(lo, lo, ~(~0ULL >> nbits));
+    tcg_gen_shri_i64(lo, lo, nbits);
+    tcg_gen_or_i64(hi, hi, lo);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], hi);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
 static bool do_vextdx(DisasContext *ctx, arg_VA *a, int size, bool right=
,
                void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr=
, TCGv))
 {
--=20
2.34.1


