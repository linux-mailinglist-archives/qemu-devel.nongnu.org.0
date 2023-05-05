Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6166F7B01
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:32:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulEJ-0006KN-KR; Thu, 04 May 2023 22:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulEG-0006Jk-AP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:31:28 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulED-0000qW-W2
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:31:28 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Ax1egEalRkFPgEAA--.8213S3;
 Fri, 05 May 2023 10:29:24 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S44; 
 Fri, 05 May 2023 10:29:23 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 42/45] target/loongarch: Implement vldi
Date: Fri,  5 May 2023 10:28:03 +0800
Message-Id: <20230505022806.6082-43-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S44
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtFWDJryktFWfXFy5KF15urg_yoW7tF15pr
 yFqryDtr40qryxArna9w15Gry5Kw4xAwnFvF4ft393ZrW8XFnrJrW8trW29FWIqa4DAry0
 g3ZxZrW5Kr9xJwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bexFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x2
 6I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AG
 Y7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VLDI.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-43-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |   7 +
 target/loongarch/insn_trans/trans_lsx.c.inc | 137 ++++++++++++++++++++
 target/loongarch/insns.decode               |   4 +
 3 files changed, 148 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 8627908fc9..5c402d944d 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -858,6 +858,11 @@ static void output_vrr(DisasContext *ctx, arg_vrr *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, r%d, r%d", a->vd, a->rj, a->rk);
 }
 
+static void output_v_i(DisasContext *ctx, arg_v_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, 0x%x", a->vd, a->imm);
+}
+
 INSN_LSX(vadd_b,           vvv)
 INSN_LSX(vadd_h,           vvv)
 INSN_LSX(vadd_w,           vvv)
@@ -1143,6 +1148,8 @@ INSN_LSX(vmskltz_d,        vv)
 INSN_LSX(vmskgez_b,        vv)
 INSN_LSX(vmsknz_b,         vv)
 
+INSN_LSX(vldi,             v_i)
+
 INSN_LSX(vand_v,           vvv)
 INSN_LSX(vor_v,            vvv)
 INSN_LSX(vxor_v,           vvv)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 86dfd2b399..0be2b5a3a8 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2912,6 +2912,143 @@ TRANS(vmskltz_d, gen_vv, gen_helper_vmskltz_d)
 TRANS(vmskgez_b, gen_vv, gen_helper_vmskgez_b)
 TRANS(vmsknz_b, gen_vv, gen_helper_vmsknz_b)
 
+#define EXPAND_BYTE(bit)  ((uint64_t)(bit ? 0xff : 0))
+
+static uint64_t vldi_get_value(DisasContext *ctx, uint32_t imm)
+{
+    int mode;
+    uint64_t data, t;
+
+    /*
+     * imm bit [11:8] is mode, mode value is 0-12.
+     * other values are invalid.
+     */
+    mode = (imm >> 8) & 0xf;
+    t =  imm & 0xff;
+    switch (mode) {
+    case 0:
+        /* data: {2{24'0, imm[7:0]}} */
+        data =  (t << 32) | t ;
+        break;
+    case 1:
+        /* data: {2{16'0, imm[7:0], 8'0}} */
+        data = (t << 24) | (t << 8);
+        break;
+    case 2:
+        /* data: {2{8'0, imm[7:0], 16'0}} */
+        data = (t << 48) | (t << 16);
+        break;
+    case 3:
+        /* data: {2{imm[7:0], 24'0}} */
+        data = (t << 56) | (t << 24);
+        break;
+    case 4:
+        /* data: {4{8'0, imm[7:0]}} */
+        data = (t << 48) | (t << 32) | (t << 16) | t;
+        break;
+    case 5:
+        /* data: {4{imm[7:0], 8'0}} */
+        data = (t << 56) |(t << 40) | (t << 24) | (t << 8);
+        break;
+    case 6:
+        /* data: {2{16'0, imm[7:0], 8'1}} */
+        data = (t << 40) | ((uint64_t)0xff << 32) | (t << 8) | 0xff;
+        break;
+    case 7:
+        /* data: {2{8'0, imm[7:0], 16'1}} */
+        data = (t << 48) | ((uint64_t)0xffff << 32) | (t << 16) | 0xffff;
+        break;
+    case 8:
+        /* data: {8{imm[7:0]}} */
+        data =(t << 56) | (t << 48) | (t << 40) | (t << 32) |
+              (t << 24) | (t << 16) | (t << 8) | t;
+        break;
+    case 9:
+        /* data: {{8{imm[7]}, ..., 8{imm[0]}}} */
+        {
+            uint64_t b0,b1,b2,b3,b4,b5,b6,b7;
+            b0 = t& 0x1;
+            b1 = (t & 0x2) >> 1;
+            b2 = (t & 0x4) >> 2;
+            b3 = (t & 0x8) >> 3;
+            b4 = (t & 0x10) >> 4;
+            b5 = (t & 0x20) >> 5;
+            b6 = (t & 0x40) >> 6;
+            b7 = (t & 0x80) >> 7;
+            data = (EXPAND_BYTE(b7) << 56) |
+                   (EXPAND_BYTE(b6) << 48) |
+                   (EXPAND_BYTE(b5) << 40) |
+                   (EXPAND_BYTE(b4) << 32) |
+                   (EXPAND_BYTE(b3) << 24) |
+                   (EXPAND_BYTE(b2) << 16) |
+                   (EXPAND_BYTE(b1) <<  8) |
+                   EXPAND_BYTE(b0);
+        }
+        break;
+    case 10:
+        /* data: {2{imm[7], ~imm[6], {5{imm[6]}}, imm[5:0], 19'0}} */
+        {
+            uint64_t b6, b7;
+            uint64_t t0, t1;
+            b6 = (imm & 0x40) >> 6;
+            b7 = (imm & 0x80) >> 7;
+            t0 = (imm & 0x3f);
+            t1 = (b7 << 6) | ((1-b6) << 5) | (uint64_t)(b6 ? 0x1f : 0);
+            data  = (t1 << 57) | (t0 << 51) | (t1 << 25) | (t0 << 19);
+        }
+        break;
+    case 11:
+        /* data: {32'0, imm[7], ~{imm[6]}, 5{imm[6]}, imm[5:0], 19'0} */
+        {
+            uint64_t b6,b7;
+            uint64_t t0, t1;
+            b6 = (imm & 0x40) >> 6;
+            b7 = (imm & 0x80) >> 7;
+            t0 = (imm & 0x3f);
+            t1 = (b7 << 6) | ((1-b6) << 5) | (b6 ? 0x1f : 0);
+            data = (t1 << 25) | (t0 << 19);
+        }
+        break;
+    case 12:
+        /* data: {imm[7], ~imm[6], 8{imm[6]}, imm[5:0], 48'0} */
+        {
+            uint64_t b6,b7;
+            uint64_t t0, t1;
+            b6 = (imm & 0x40) >> 6;
+            b7 = (imm & 0x80) >> 7;
+            t0 = (imm & 0x3f);
+            t1 = (b7 << 9) | ((1-b6) << 8) | (b6 ? 0xff : 0);
+            data = (t1 << 54) | (t0 << 48);
+        }
+        break;
+    default:
+        generate_exception(ctx, EXCCODE_INE);
+        g_assert_not_reached();
+    }
+    return data;
+}
+
+static bool trans_vldi(DisasContext *ctx, arg_vldi *a)
+{
+    int sel, vece;
+    uint64_t value;
+    CHECK_SXE;
+
+    sel = (a->imm >> 12) & 0x1;
+
+    if (sel) {
+        value = vldi_get_value(ctx, a->imm);
+        vece = MO_64;
+    } else {
+        value = ((int32_t)(a->imm << 22)) >> 22;
+        vece = (a->imm >> 10) & 0x3;
+    }
+
+    tcg_gen_gvec_dup_i64(vece, vec_full_offset(a->vd), 16, ctx->vl/8,
+                         tcg_constant_i64(value));
+    return true;
+}
+
 TRANS(vand_v, gvec_vvv, MO_64, tcg_gen_gvec_and)
 TRANS(vor_v, gvec_vvv, MO_64, tcg_gen_gvec_or)
 TRANS(vxor_v, gvec_vvv, MO_64, tcg_gen_gvec_xor)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index ea6eedb7a9..c9c3bc2c73 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -513,6 +513,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vvr          vd vj rk
 &vrr          vd rj rk
 &vr_ii        vd rj imm imm2
+&v_i          vd imm
 
 #
 # LSX Formats
@@ -550,6 +551,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vr_i8i3       .... ....... imm2:3 ........ rj:5 vd:5    &vr_ii imm=%i8s1
 @vr_i8i4          .... ...... imm2:4 imm:s8 rj:5 vd:5    &vr_ii
 @vrr               .... ........ ..... rk:5 rj:5 vd:5    &vrr
+@v_i13                   .... ........ .. imm:13 vd:5    &v_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -837,6 +839,8 @@ vmskltz_d        0111 00101001 11000 10011 ..... .....    @vv
 vmskgez_b        0111 00101001 11000 10100 ..... .....    @vv
 vmsknz_b         0111 00101001 11000 11000 ..... .....    @vv
 
+vldi             0111 00111110 00 ............. .....     @v_i13
+
 vand_v           0111 00010010 01100 ..... ..... .....    @vvv
 vor_v            0111 00010010 01101 ..... ..... .....    @vvv
 vxor_v           0111 00010010 01110 ..... ..... .....    @vvv
-- 
2.31.1


