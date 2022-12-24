Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30665594E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:31:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjM-0006f4-LV; Sat, 24 Dec 2022 03:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziQ-0006Cf-Us
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:11 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziO-0001lB-IZ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:10 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxXet4taZjZUkIAA--.18673S3;
 Sat, 24 Dec 2022 16:16:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S45; 
 Sat, 24 Dec 2022 16:16:55 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 43/43] target/loongarch: Implement vldi
Date: Sat, 24 Dec 2022 16:16:33 +0800
Message-Id: <20221224081633.4185445-44-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S45
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Jry7tw1UZF4UXFyDur1xXwb_yoWxWF13pr
 W2vryUtrWrXrW7Zr1Fvw15Aw15trsIgw4j9anayw18uFW7XFn7ZrW8trZI9FW7Xw1DXry0
 v3W5Z3yjgas3XwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
 aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |   7 +
 target/loongarch/helper.h                   |   2 +
 target/loongarch/insn_trans/trans_lsx.c.inc |  10 ++
 target/loongarch/insns.decode               |   4 +
 target/loongarch/lsx_helper.c               | 134 ++++++++++++++++++++
 5 files changed, 157 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index e8dc0644bb..0c5cc313e0 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -829,6 +829,11 @@ static void output_vrr(DisasContext *ctx, arg_vrr *a, const char *mnemonic)
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
@@ -1114,6 +1119,8 @@ INSN_LSX(vmskltz_d,        vv)
 INSN_LSX(vmskgez_b,        vv)
 INSN_LSX(vmsknz_b,         vv)
 
+INSN_LSX(vldi,             v_i)
+
 INSN_LSX(vand_v,           vvv)
 INSN_LSX(vor_v,            vvv)
 INSN_LSX(vxor_v,           vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index a92bcfffe8..cc28ecadd9 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -418,6 +418,8 @@ DEF_HELPER_3(vmskltz_d, void, env, i32, i32)
 DEF_HELPER_3(vmskgez_b, void, env, i32, i32)
 DEF_HELPER_3(vmsknz_b, void, env, i32,i32)
 
+DEF_HELPER_3(vldi, void, env, i32, i32)
+
 DEF_HELPER_4(vand_v, void, env, i32, i32, i32)
 DEF_HELPER_4(vor_v, void, env, i32, i32, i32)
 DEF_HELPER_4(vxor_v, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 308cba12f2..97969d7138 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -406,6 +406,16 @@ TRANS(vmskltz_d, gen_vv, gen_helper_vmskltz_d)
 TRANS(vmskgez_b, gen_vv, gen_helper_vmskgez_b)
 TRANS(vmsknz_b,  gen_vv, gen_helper_vmsknz_b)
 
+static bool trans_vldi(DisasContext *ctx, arg_vldi *a)
+{
+    TCGv_i32 twd = tcg_constant_i32(a->vd);
+    TCGv_i32 tui = tcg_constant_i32(a->imm);
+
+    CHECK_SXE;
+    gen_helper_vldi(cpu_env, twd, tui);
+    return true;
+}
+
 TRANS(vand_v, gen_vvv, gen_helper_vand_v)
 TRANS(vor_v, gen_vvv, gen_helper_vor_v)
 TRANS(vxor_v, gen_vvv, gen_helper_vxor_v)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index f786a9a9ee..b1608fd86e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -512,6 +512,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vvr          vd vj rk
 &vrr          vd rj rk
 &vr_ii        vd rj imm imm2
+&v_i          vd imm
 
 #
 # LSX Formats
@@ -549,6 +550,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vr_i8i3       .... ....... imm2:3 ........ rj:5 vd:5    &vr_ii imm=%i8s1
 @vr_i8i4          .... ...... imm2:4 imm:s8 rj:5 vd:5    &vr_ii
 @vrr               .... ........ ..... rk:5 rj:5 vd:5    &vrr
+@v_i13                   .... ........ .. imm:13 vd:5    &v_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -836,6 +838,8 @@ vmskltz_d        0111 00101001 11000 10011 ..... .....    @vv
 vmskgez_b        0111 00101001 11000 10100 ..... .....    @vv
 vmsknz_b         0111 00101001 11000 11000 ..... .....    @vv
 
+vldi             0111 00111110 00 ............. .....     @v_i13
+
 vand_v           0111 00010010 01100 ..... ..... .....    @vvv
 vor_v            0111 00010010 01101 ..... ..... .....    @vvv
 vxor_v           0111 00010010 01110 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 9058230975..fcaee16394 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -5239,3 +5239,137 @@ void helper_vstelm_d(CPULoongArchState *env,
     cpu_stq_data(env, addr, Vd->D[sel]);
 #endif
 }
+
+#define EXPAND_BYTE(bit)  ((uint64_t)(bit ? 0xff : 0))
+
+void helper_vldi(CPULoongArchState *env, uint32_t vd, uint32_t ui)
+{
+    int sel = (ui >> 12) & 0x1;
+    uint32_t i;
+
+    vec_t *Vd = &(env->fpr[vd].vec);
+    if (sel) {
+        /* VSETI.D */
+        int mode = (ui >> 8) & 0xf;
+        uint64_t imm = (ui & 0xff);
+        for (i = 0; i < 2; i++) {
+            switch (mode) {
+            case 0:
+                Vd->D[i] = (imm << 32) | imm;
+                break;
+            case 1:
+                Vd->D[i] = (imm << 24) | (imm << 8);
+                break;
+            case 2:
+                Vd->D[i] = (imm << 48) | (imm << 16);
+                break;
+            case 3:
+                Vd->D[i] = (imm << 56) | (imm << 24);
+                break;
+            case 4:
+                Vd->D[i] = (imm << 48) | (imm << 32) |
+                           (imm << 16) | imm;
+                break;
+            case 5:
+                Vd->D[i] = (imm << 56) | (imm << 40) |
+                           (imm << 24) | (imm << 8);
+                break;
+            case 6:
+                Vd->D[i] = (imm << 40) | ((uint64_t)0xff << 32) |
+                           (imm << 8) | 0xff;
+                break;
+            case 7:
+                Vd->D[i] = (imm << 48) | ((uint64_t)0xffff << 32) |
+                           (imm << 16) | 0xffff;
+                break;
+            case 8:
+                Vd->D[i] = (imm << 56) | (imm << 48) | (imm << 40) |
+                           (imm << 32) | (imm << 24) | (imm << 16) |
+                           (imm << 8) | imm;
+                break;
+            case 9: {
+                uint64_t b0,b1,b2,b3,b4,b5,b6,b7;
+                b0 = imm & 0x1;
+                b1 = (imm & 0x2) >> 1;
+                b2 = (imm & 0x4) >> 2;
+                b3 = (imm & 0x8) >> 3;
+                b4 = (imm & 0x10) >> 4;
+                b5 = (imm & 0x20) >> 5;
+                b6 = (imm & 0x40) >> 6;
+                b7 = (imm & 0x80) >> 7;
+                Vd->D[i] = (EXPAND_BYTE(b7) << 56) |
+                           (EXPAND_BYTE(b6) << 48) |
+                           (EXPAND_BYTE(b5) << 40) |
+                           (EXPAND_BYTE(b4) << 32) |
+                           (EXPAND_BYTE(b3) << 24) |
+                           (EXPAND_BYTE(b2) << 16) |
+                           (EXPAND_BYTE(b1) <<  8) |
+                           EXPAND_BYTE(b0);
+                break;
+            }
+            case 10: {
+                uint64_t b6, b7;
+                uint64_t t0, t1;
+                b6 = (imm & 0x40) >> 6;
+                b7 = (imm & 0x80) >> 7;
+                t0 = (imm & 0x3f);
+                t1 = (b7 << 6) | ((1-b6) << 5) | (uint64_t)(b6 ? 0x1f : 0);
+                Vd->D[i] = (t1 << 57) | (t0 << 51) |
+                           (t1 << 25) | (t0 << 19);
+                break;
+            }
+            case 11: {
+                uint64_t b6,b7;
+                uint64_t t0, t1;
+                b6 = (imm & 0x40) >> 6;
+                b7 = (imm & 0x80) >> 7;
+                t0 = (imm & 0x3f);
+                t1 = (b7 << 6) | ((1-b6) << 5) | (b6 ? 0x1f : 0);
+                Vd->D[i] = (t1 << 25) | (t0 << 19);
+                break;
+            }
+            case 12: {
+                uint64_t b6,b7;
+                uint64_t t0, t1;
+                b6 = (imm & 0x40) >> 6;
+                b7 = (imm & 0x80) >> 7;
+                t0 = (imm & 0x3f);
+                t1 = (b7 << 6) | ((1-b6) << 5) | (b6 ? 0x1f : 0);
+                Vd->D[i] = (t1 << 54) | (t0 << 48);
+                break;
+            }
+            default:
+                assert(0);
+            }
+        }
+    } else {
+        /* LDI.df */
+        uint32_t df = (ui >> 10) & 0x3;
+        int32_t s10 = ((int32_t)(ui << 22)) >> 22;
+
+        switch (df) {
+        case 0:
+            for (i = 0; i < LSX_LEN/8; i++) {
+                Vd->B[i] = (int8_t)s10;
+            }
+            break;
+        case 1:
+            for (i = 0; i < LSX_LEN/16; i++) {
+                Vd->H[i] = (int16_t)s10;
+            }
+            break;
+        case 2:
+            for (i = 0; i < LSX_LEN/32; i++) {
+                Vd->W[i] = (int32_t)s10;
+            }
+            break;
+        case 3:
+            for (i = 0; i < LSX_LEN/64; i++) {
+                Vd->D[i] = (int64_t)s10;
+            }
+           break;
+        default:
+            assert(0);
+        }
+    }
+}
-- 
2.31.1


