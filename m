Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BF4BFF79
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:58:33 +0100 (CET)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYUi-0006Bu-CH
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:58:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLX-0007NH-FB; Tue, 22 Feb 2022 09:40:57 -0500
Received: from [187.72.171.209] (port=44457 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLN-0005jA-3k; Tue, 22 Feb 2022 09:40:47 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 58B068000A7;
 Tue, 22 Feb 2022 11:37:42 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 18/47] target/ppc: implement vgnb
Date: Tue, 22 Feb 2022 11:36:16 -0300
Message-Id: <20220222143646.1268606-19-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:42.0743 (UTC)
 FILETIME=[BFE81E70:01D827F9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
 - Optimized implementation (rth)
---
 target/ppc/insn32.decode            |   5 ++
 target/ppc/translate/vmx-impl.c.inc | 135 ++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 31a3c3b508..02df4a98e6 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -66,6 +66,9 @@
 &VX_mp          rt mp:bool vrb
 @VX_mp          ...... rt:5 .... mp:1 vrb:5 ...........         &VX_mp
 
+&VX_n           rt vrb n
+@VX_n           ...... rt:5 .. n:3 vrb:5 ...........            &VX_n
+
 &VX_tb_rc       vrt vrb rc:bool
 @VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_rc
 
@@ -418,6 +421,8 @@ VCMPUQ          000100 ... -- ..... ..... 00100000001   @VX_bf
 
 ## Vector Bit Manipulation Instruction
 
+VGNB            000100 ..... -- ... ..... 10011001100   @VX_n
+
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
 VCLZDM          000100 ..... ..... ..... 11110000100    @VX
 VCTZDM          000100 ..... ..... ..... 11111000100    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 17fc25d1bd..19219b0010 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1416,6 +1416,141 @@ GEN_VXFORM_DUAL(vsplth, PPC_ALTIVEC, PPC_NONE,
 GEN_VXFORM_DUAL(vspltw, PPC_ALTIVEC, PPC_NONE,
                 vextractuw, PPC_NONE, PPC2_ISA300);
 
+static bool trans_VGNB(DisasContext *ctx, arg_VX_n *a)
+{
+    /*
+     * Similar to do_vextractm, we'll use a sequence of mask-shift-or operations
+     * to gather the bits. The masks can be created with
+     *
+     * uint64_t mask(uint64_t n, uint64_t step)
+     * {
+     *     uint64_t p = ((1UL << (1UL << step)) - 1UL) << ((n - 1UL) << step),
+     *                  plen = n << step, m = 0;
+     *     for(int i = 0; i < 64/plen; i++) {
+     *         m |= p;
+     *         m = ror64(m, plen);
+     *     }
+     *     p >>= plen * DIV_ROUND_UP(64, plen) - 64;
+     *     return m | p;
+     * }
+     *
+     * But since there are few values of N, we'll use a lookup table to avoid
+     * these calculations at runtime.
+     */
+    static const uint64_t mask[6][5] = {
+        {
+            0xAAAAAAAAAAAAAAAAULL, 0xccccccccccccccccULL, 0xf0f0f0f0f0f0f0f0ULL,
+            0xff00ff00ff00ff00ULL, 0xffff0000ffff0000ULL
+        },
+        {
+            0x9249249249249249ULL, 0xC30C30C30C30C30CULL, 0xF00F00F00F00F00FULL,
+            0xFF0000FF0000FF00ULL, 0xFFFF00000000FFFFULL
+        },
+        {
+            /* For N >= 4, some mask operations can be elided */
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
+    int i, sh, nbits = DIV_ROUND_UP(64, a->n);
+    TCGv_i64 hi, lo, t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    if (a->n < 2) {
+        /*
+         * "N can be any value between 2 and 7, inclusive." Otherwise, the
+         * result is undefined, so we don't need to change RT. Also, N > 7 is
+         * impossible since the immediate field is 3 bits only.
+         */
+        return true;
+    }
+
+    hi = tcg_temp_new_i64();
+    lo = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    get_avr64(hi, a->vrb, true);
+    get_avr64(lo, a->vrb, false);
+
+    /* Align the lower doubleword so we can use the same mask */
+    tcg_gen_shli_i64(lo, lo, a->n * nbits - 64);
+
+    /*
+     * Starting from the most significant bit, gather every Nth bit with a
+     * sequence of mask-shift-or operation. E.g.: for N=3
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
+    for (i = 0, sh = a->n - 1; i < 5; i++, sh <<= 1) {
+        m = mask[a->n - 2][i];
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
 static bool do_vextdx(DisasContext *ctx, arg_VA *a, int size, bool right,
                void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv))
 {
-- 
2.25.1


