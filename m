Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2265593B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zik-0006Kp-RH; Sat, 24 Dec 2022 03:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziN-000691-Ow
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:08 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziI-0001Ps-KW
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:07 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxlfBytaZjVEkIAA--.18193S3;
 Sat, 24 Dec 2022 16:16:50 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S36; 
 Sat, 24 Dec 2022 16:16:50 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 34/43] target/loongarch: Implement LSX fpu arith
 instructions
Date: Sat, 24 Dec 2022 16:16:24 +0800
Message-Id: <20221224081633.4185445-35-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S36
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3uF4fur1rKrW7JF47ZFWrKrg_yoW8AF4kXo
 WfAw15Aw48Ar4fKr9rKa4kZa4vq340kw1DGFWv9r17JFyxAr1ayryUKwn5ta1fAFWFgry5
 G39rZa15t3Wagrykn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x2
 6I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AG
 Y7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
- VF{ADD/SUB/MUL/DIV}.{S/D};
- VF{MADD/MSUB/NMADD/NMSUB}.{S/D};
- VF{MAX/MIN}.{S/D};
- VF{MAXA/MINA}.{S/D};
- VFLOGB.{S/D};
- VFCLASS.{S/D};
- VF{SQRT/RECIP/RSQRT}.{S/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  46 +++++
 target/loongarch/fpu_helper.c               |   2 +-
 target/loongarch/helper.h                   |  41 +++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  55 ++++++
 target/loongarch/insns.decode               |  43 +++++
 target/loongarch/internals.h                |   1 +
 target/loongarch/lsx_helper.c               | 179 ++++++++++++++++++++
 7 files changed, 366 insertions(+), 1 deletion(-)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index ffcaf06136..987bf5c597 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -778,6 +778,11 @@ static void output_vv(DisasContext *ctx, arg_vv *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, v%d", a->vd, a->vj);
 }
 
+static void output_vvvv(DisasContext *ctx, arg_vvvv *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, v%d, v%d, v%d", a->vd, a->vj, a->vk, a->va);
+}
+
 INSN_LSX(vadd_b,           vvv)
 INSN_LSX(vadd_h,           vvv)
 INSN_LSX(vadd_w,           vvv)
@@ -1273,3 +1278,44 @@ INSN_LSX(vfrstp_b,         vvv)
 INSN_LSX(vfrstp_h,         vvv)
 INSN_LSX(vfrstpi_b,        vv_i)
 INSN_LSX(vfrstpi_h,        vv_i)
+
+INSN_LSX(vfadd_s,          vvv)
+INSN_LSX(vfadd_d,          vvv)
+INSN_LSX(vfsub_s,          vvv)
+INSN_LSX(vfsub_d,          vvv)
+INSN_LSX(vfmul_s,          vvv)
+INSN_LSX(vfmul_d,          vvv)
+INSN_LSX(vfdiv_s,          vvv)
+INSN_LSX(vfdiv_d,          vvv)
+
+INSN_LSX(vfmadd_s,         vvvv)
+INSN_LSX(vfmadd_d,         vvvv)
+INSN_LSX(vfmsub_s,         vvvv)
+INSN_LSX(vfmsub_d,         vvvv)
+INSN_LSX(vfnmadd_s,        vvvv)
+INSN_LSX(vfnmadd_d,        vvvv)
+INSN_LSX(vfnmsub_s,        vvvv)
+INSN_LSX(vfnmsub_d,        vvvv)
+
+INSN_LSX(vfmax_s,          vvv)
+INSN_LSX(vfmax_d,          vvv)
+INSN_LSX(vfmin_s,          vvv)
+INSN_LSX(vfmin_d,          vvv)
+
+INSN_LSX(vfmaxa_s,         vvv)
+INSN_LSX(vfmaxa_d,         vvv)
+INSN_LSX(vfmina_s,         vvv)
+INSN_LSX(vfmina_d,         vvv)
+
+INSN_LSX(vflogb_s,         vv)
+INSN_LSX(vflogb_d,         vv)
+
+INSN_LSX(vfclass_s,        vv)
+INSN_LSX(vfclass_d,        vv)
+
+INSN_LSX(vfsqrt_s,         vv)
+INSN_LSX(vfsqrt_d,         vv)
+INSN_LSX(vfrecip_s,        vv)
+INSN_LSX(vfrecip_d,        vv)
+INSN_LSX(vfrsqrt_s,        vv)
+INSN_LSX(vfrsqrt_d,        vv)
diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 4b9637210a..0e9f5eb73b 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -77,7 +77,7 @@ static void update_fcsr0_mask(CPULoongArchState *env, uintptr_t pc, int mask)
     }
 }
 
-static void update_fcsr0(CPULoongArchState *env, uintptr_t pc)
+void update_fcsr0(CPULoongArchState *env, uintptr_t pc)
 {
     update_fcsr0_mask(env, pc, 0);
 }
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 781a544622..31fc36917d 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -628,3 +628,44 @@ DEF_HELPER_4(vfrstp_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vfrstp_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vfrstpi_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vfrstpi_h, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vfadd_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfadd_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vfsub_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfsub_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vfmul_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfmul_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vfdiv_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfdiv_d, void, env, i32, i32, i32)
+
+DEF_HELPER_5(vfmadd_s, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfmadd_d, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfmsub_s, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfmsub_d, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfnmadd_s, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfnmadd_d, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfnmsub_s, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(vfnmsub_d, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_4(vfmax_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfmax_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vfmin_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfmin_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vfmaxa_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfmaxa_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vfmina_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfmina_d, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vflogb_s, void, env, i32, i32)
+DEF_HELPER_3(vflogb_d, void, env, i32, i32)
+
+DEF_HELPER_3(vfclass_s, void, env, i32, i32)
+DEF_HELPER_3(vfclass_d, void, env, i32, i32)
+
+DEF_HELPER_3(vfsqrt_s, void, env, i32, i32)
+DEF_HELPER_3(vfsqrt_d, void, env, i32, i32)
+DEF_HELPER_3(vfrecip_s, void, env, i32, i32)
+DEF_HELPER_3(vfrecip_d, void, env, i32, i32)
+DEF_HELPER_3(vfrsqrt_s, void, env, i32, i32)
+DEF_HELPER_3(vfrsqrt_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index ffa281e717..c8b271ddc8 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -50,6 +50,20 @@ static bool gen_vv(DisasContext *ctx, arg_vv *a,
     return true;
 }
 
+static bool gen_vvvv(DisasContext *ctx, arg_vvvv *a,
+                     void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32,
+                                  TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 vk = tcg_constant_i32(a->vk);
+    TCGv_i32 va = tcg_constant_i32(a->va);
+
+    CHECK_SXE;
+    func(cpu_env, vd, vj, vk, va);
+    return true;
+}
+
 TRANS(vadd_b, gen_vvv, gen_helper_vadd_b)
 TRANS(vadd_h, gen_vvv, gen_helper_vadd_h)
 TRANS(vadd_w, gen_vvv, gen_helper_vadd_w)
@@ -544,3 +558,44 @@ TRANS(vfrstp_b, gen_vvv, gen_helper_vfrstp_b)
 TRANS(vfrstp_h, gen_vvv, gen_helper_vfrstp_h)
 TRANS(vfrstpi_b, gen_vv_i, gen_helper_vfrstpi_b)
 TRANS(vfrstpi_h, gen_vv_i, gen_helper_vfrstpi_h)
+
+TRANS(vfadd_s, gen_vvv, gen_helper_vfadd_s)
+TRANS(vfadd_d, gen_vvv, gen_helper_vfadd_d)
+TRANS(vfsub_s, gen_vvv, gen_helper_vfsub_s)
+TRANS(vfsub_d, gen_vvv, gen_helper_vfsub_d)
+TRANS(vfmul_s, gen_vvv, gen_helper_vfmul_s)
+TRANS(vfmul_d, gen_vvv, gen_helper_vfmul_d)
+TRANS(vfdiv_s, gen_vvv, gen_helper_vfdiv_s)
+TRANS(vfdiv_d, gen_vvv, gen_helper_vfdiv_d)
+
+TRANS(vfmadd_s, gen_vvvv, gen_helper_vfmadd_s)
+TRANS(vfmadd_d, gen_vvvv, gen_helper_vfmadd_d)
+TRANS(vfmsub_s, gen_vvvv, gen_helper_vfmsub_s)
+TRANS(vfmsub_d, gen_vvvv, gen_helper_vfmsub_d)
+TRANS(vfnmadd_s, gen_vvvv, gen_helper_vfnmadd_s)
+TRANS(vfnmadd_d, gen_vvvv, gen_helper_vfnmadd_d)
+TRANS(vfnmsub_s, gen_vvvv, gen_helper_vfnmsub_s)
+TRANS(vfnmsub_d, gen_vvvv, gen_helper_vfnmsub_d)
+
+TRANS(vfmax_s, gen_vvv, gen_helper_vfmax_s)
+TRANS(vfmax_d, gen_vvv, gen_helper_vfmax_d)
+TRANS(vfmin_s, gen_vvv, gen_helper_vfmin_s)
+TRANS(vfmin_d, gen_vvv, gen_helper_vfmin_d)
+
+TRANS(vfmaxa_s, gen_vvv, gen_helper_vfmaxa_s)
+TRANS(vfmaxa_d, gen_vvv, gen_helper_vfmaxa_d)
+TRANS(vfmina_s, gen_vvv, gen_helper_vfmina_s)
+TRANS(vfmina_d, gen_vvv, gen_helper_vfmina_d)
+
+TRANS(vflogb_s, gen_vv, gen_helper_vflogb_s)
+TRANS(vflogb_d, gen_vv, gen_helper_vflogb_d)
+
+TRANS(vfclass_s, gen_vv, gen_helper_vfclass_s)
+TRANS(vfclass_d, gen_vv, gen_helper_vfclass_d)
+
+TRANS(vfsqrt_s, gen_vv, gen_helper_vfsqrt_s)
+TRANS(vfsqrt_d, gen_vv, gen_helper_vfsqrt_d)
+TRANS(vfrecip_s, gen_vv, gen_helper_vfrecip_s)
+TRANS(vfrecip_d, gen_vv, gen_helper_vfrecip_d)
+TRANS(vfrsqrt_s, gen_vv, gen_helper_vfrsqrt_s)
+TRANS(vfrsqrt_d, gen_vv, gen_helper_vfrsqrt_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index f537f726a2..722aa5d85b 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -492,6 +492,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vv           vd vj
 &vvv          vd vj vk
 &vv_i         vd vj imm
+&vvvv         vd vj vk va
 
 #
 # LSX Formats
@@ -505,6 +506,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv_ui7             .... ........ ... imm:7 vj:5 vd:5    &vv_i
 @vv_ui8              .... ........ .. imm:8 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
+@vvvv               .... ........ va:5 vk:5 vj:5 vd:5    &vvvv
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -1002,3 +1004,44 @@ vfrstp_b         0111 00010010 10110 ..... ..... .....    @vvv
 vfrstp_h         0111 00010010 10111 ..... ..... .....    @vvv
 vfrstpi_b        0111 00101001 10100 ..... ..... .....    @vv_ui5
 vfrstpi_h        0111 00101001 10101 ..... ..... .....    @vv_ui5
+
+vfadd_s          0111 00010011 00001 ..... ..... .....    @vvv
+vfadd_d          0111 00010011 00010 ..... ..... .....    @vvv
+vfsub_s          0111 00010011 00101 ..... ..... .....    @vvv
+vfsub_d          0111 00010011 00110 ..... ..... .....    @vvv
+vfmul_s          0111 00010011 10001 ..... ..... .....    @vvv
+vfmul_d          0111 00010011 10010 ..... ..... .....    @vvv
+vfdiv_s          0111 00010011 10101 ..... ..... .....    @vvv
+vfdiv_d          0111 00010011 10110 ..... ..... .....    @vvv
+
+vfmadd_s         0000 10010001 ..... ..... ..... .....    @vvvv
+vfmadd_d         0000 10010010 ..... ..... ..... .....    @vvvv
+vfmsub_s         0000 10010101 ..... ..... ..... .....    @vvvv
+vfmsub_d         0000 10010110 ..... ..... ..... .....    @vvvv
+vfnmadd_s        0000 10011001 ..... ..... ..... .....    @vvvv
+vfnmadd_d        0000 10011010 ..... ..... ..... .....    @vvvv
+vfnmsub_s        0000 10011101 ..... ..... ..... .....    @vvvv
+vfnmsub_d        0000 10011110 ..... ..... ..... .....    @vvvv
+
+vfmax_s          0111 00010011 11001 ..... ..... .....    @vvv
+vfmax_d          0111 00010011 11010 ..... ..... .....    @vvv
+vfmin_s          0111 00010011 11101 ..... ..... .....    @vvv
+vfmin_d          0111 00010011 11110 ..... ..... .....    @vvv
+
+vfmaxa_s         0111 00010100 00001 ..... ..... .....    @vvv
+vfmaxa_d         0111 00010100 00010 ..... ..... .....    @vvv
+vfmina_s         0111 00010100 00101 ..... ..... .....    @vvv
+vfmina_d         0111 00010100 00110 ..... ..... .....    @vvv
+
+vflogb_s         0111 00101001 11001 10001 ..... .....    @vv
+vflogb_d         0111 00101001 11001 10010 ..... .....    @vv
+
+vfclass_s        0111 00101001 11001 10101 ..... .....    @vv
+vfclass_d        0111 00101001 11001 10110 ..... .....    @vv
+
+vfsqrt_s         0111 00101001 11001 11001 ..... .....    @vv
+vfsqrt_d         0111 00101001 11001 11010 ..... .....    @vv
+vfrecip_s        0111 00101001 11001 11101 ..... .....    @vv
+vfrecip_d        0111 00101001 11001 11110 ..... .....    @vv
+vfrsqrt_s        0111 00101001 11010 00001 ..... .....    @vv
+vfrsqrt_d        0111 00101001 11010 00010 ..... .....    @vv
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index f01635aed6..0bb0f072c0 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -32,6 +32,7 @@ void G_NORETURN do_raise_exception(CPULoongArchState *env,
 const char *loongarch_exception_name(int32_t exception);
 
 void restore_fp_status(CPULoongArchState *env);
+void update_fcsr0(CPULoongArchState *env, uintptr_t pc);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_loongarch_cpu;
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 31e9270826..a5f2752dce 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -9,6 +9,8 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
+#include "internals.h"
 
 #define DO_HELPER_VVV(NAME, BIT, FUNC, ...)                   \
     void helper_##NAME(CPULoongArchState *env,                \
@@ -24,6 +26,11 @@
     void helper_##NAME(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
     { FUNC(env, vd, vj, BIT, __VA_ARGS__); }
 
+#define DO_HELPER_VVVV(NAME, BIT, FUNC, ...)                               \
+    void helper_##NAME(CPULoongArchState *env,                             \
+                       uint32_t vd, uint32_t vj, uint32_t vk, uint32_t va) \
+    { FUNC(env, vd, vj, vk, va, BIT, __VA_ARGS__); }
+
 static void helper_vvv(CPULoongArchState *env,
                        uint32_t vd, uint32_t vj, uint32_t vk, int bit,
                        void (*func)(vec_t*, vec_t*, vec_t*, int, int))
@@ -3468,3 +3475,175 @@ void helper_vfrstpi_h(CPULoongArchState *env,
     m = imm % 8;
     Vd->H[m] = (int16_t)i;
 }
+
+static void helper_vvv_f(CPULoongArchState *env,
+                uint32_t vd, uint32_t vj, uint32_t vk, int bit,
+                void (*func)(float_status*, vec_t*, vec_t*, vec_t*, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+
+    vec_t dest;
+    dest.D[0] = 0;
+    dest.D[1] = 0;
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(&env->fp_status, &dest, Vj, Vk, bit, i);
+    }
+    Vd->D[0] = dest.D[0];
+    Vd->D[1] = dest.D[1];
+    update_fcsr0(env, GETPC());
+}
+
+#define LSX_DO_FARITH(name)                                           \
+static void do_vf## name (float_status *status,                       \
+                     vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n) \
+{                                                                     \
+    switch (bit) {                                                    \
+    case 32:                                                          \
+        Vd->W[n] = float32_## name (Vj->W[n], Vk->W[n], status);      \
+        break;                                                        \
+    case 64:                                                          \
+        Vd->D[n] = float64_## name (Vj->D[n], Vk->D[n], status);      \
+        break;                                                        \
+    default:                                                          \
+        g_assert_not_reached();                                       \
+    }                                                                 \
+}
+
+LSX_DO_FARITH(add)
+LSX_DO_FARITH(sub)
+LSX_DO_FARITH(mul)
+LSX_DO_FARITH(div)
+LSX_DO_FARITH(maxnum)
+LSX_DO_FARITH(minnum)
+LSX_DO_FARITH(maxnummag)
+LSX_DO_FARITH(minnummag)
+
+DO_HELPER_VVV(vfadd_s, 32, helper_vvv_f, do_vfadd)
+DO_HELPER_VVV(vfadd_d, 64, helper_vvv_f, do_vfadd)
+DO_HELPER_VVV(vfsub_s, 32, helper_vvv_f, do_vfsub)
+DO_HELPER_VVV(vfsub_d, 64, helper_vvv_f, do_vfsub)
+DO_HELPER_VVV(vfmul_s, 32, helper_vvv_f, do_vfmul)
+DO_HELPER_VVV(vfmul_d, 64, helper_vvv_f, do_vfmul)
+DO_HELPER_VVV(vfdiv_s, 32, helper_vvv_f, do_vfdiv)
+DO_HELPER_VVV(vfdiv_d, 64, helper_vvv_f, do_vfdiv)
+
+static void helper_vvvv_f(CPULoongArchState *env,
+                uint32_t vd, uint32_t vj, uint32_t vk, uint32_t va, int bit,
+                void (*func)(float_status*, vec_t*, vec_t*, vec_t*,
+                             vec_t*, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+    vec_t *Va = &(env->fpr[va].vec);
+
+    vec_t dest;
+    dest.D[0] = 0;
+    dest.D[1] = 0;
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(&env->fp_status, &dest, Vj, Vk, Va, bit, i);
+    }
+    Vd->D[0] = dest.D[0];
+    Vd->D[1] = dest.D[1];
+    update_fcsr0(env, GETPC());
+}
+
+#define LSX_DO_FMULADD(name, flags)                         \
+static void do_vf## name (float_status *status,             \
+                          vec_t *Vd, vec_t *Vj, vec_t *Vk,  \
+                          vec_t *Va, int bit, int n)        \
+{                                                           \
+    switch (bit) {                                          \
+    case 32:                                                \
+        Vd->W[n] = float32_muladd(Vj->W[n], Vk->W[n],       \
+                                  Va->W[n], flags, status); \
+        break;                                              \
+    case 64:                                                \
+        Vd->D[n] = float64_muladd(Vj->D[n], Vk->D[n],       \
+                                  Va->D[n], flags,status);  \
+        break;                                              \
+    default:                                                \
+        g_assert_not_reached();                             \
+    }                                                       \
+}
+
+LSX_DO_FMULADD(madd, 0)
+LSX_DO_FMULADD(msub, float_muladd_negate_c)
+LSX_DO_FMULADD(nmadd, float_muladd_negate_product | float_muladd_negate_c)
+LSX_DO_FMULADD(nmsub, float_muladd_negate_product)
+
+DO_HELPER_VVVV(vfmadd_s, 32, helper_vvvv_f, do_vfmadd)
+DO_HELPER_VVVV(vfmadd_d, 64, helper_vvvv_f, do_vfmadd)
+DO_HELPER_VVVV(vfmsub_s, 32, helper_vvvv_f, do_vfmsub)
+DO_HELPER_VVVV(vfmsub_d, 64, helper_vvvv_f, do_vfmsub)
+DO_HELPER_VVVV(vfnmadd_s, 32, helper_vvvv_f, do_vfnmadd)
+DO_HELPER_VVVV(vfnmadd_d, 64, helper_vvvv_f, do_vfnmadd)
+DO_HELPER_VVVV(vfnmsub_s, 32, helper_vvvv_f, do_vfnmsub)
+DO_HELPER_VVVV(vfnmsub_d, 64, helper_vvvv_f, do_vfnmsub)
+
+DO_HELPER_VVV(vfmax_s, 32, helper_vvv_f, do_vfmaxnum)
+DO_HELPER_VVV(vfmax_d, 64, helper_vvv_f, do_vfmaxnum)
+DO_HELPER_VVV(vfmin_s, 32, helper_vvv_f, do_vfminnum)
+DO_HELPER_VVV(vfmin_d, 64, helper_vvv_f, do_vfminnum)
+
+DO_HELPER_VVV(vfmaxa_s, 32, helper_vvv_f, do_vfmaxnummag)
+DO_HELPER_VVV(vfmaxa_d, 64, helper_vvv_f, do_vfmaxnummag)
+DO_HELPER_VVV(vfmina_s, 32, helper_vvv_f, do_vfminnummag)
+DO_HELPER_VVV(vfmina_d, 64, helper_vvv_f, do_vfminnummag)
+
+static void helper_vv_f(CPULoongArchState *env,
+                uint32_t vd, uint32_t vj, int bit,
+                void (*func)(CPULoongArchState*, vec_t*, vec_t*, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    vec_t dest;
+    dest.D[0] = 0;
+    dest.D[1] = 0;
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(env, &dest, Vj, bit, i);
+    }
+    Vd->D[0] = dest.D[0];
+    Vd->D[1] = dest.D[1];
+}
+
+#define LSX_DO_VV(name)                                     \
+static void do_v## name (CPULoongArchState *env, vec_t *Vd, \
+                          vec_t *Vj, int bit, int n)        \
+{                                                           \
+    switch (bit) {                                          \
+    case 32:                                                \
+        Vd->W[n] = helper_## name ## _s(env, Vj->W[n]);     \
+        break;                                              \
+    case 64:                                                \
+        Vd->D[n] = helper_## name ## _d(env, Vj->D[n]);     \
+        break;                                              \
+    default:                                                \
+        g_assert_not_reached();                             \
+    }                                                       \
+}                                                           \
+
+LSX_DO_VV(flogb)
+LSX_DO_VV(fclass)
+LSX_DO_VV(fsqrt)
+LSX_DO_VV(frecip)
+LSX_DO_VV(frsqrt)
+
+DO_HELPER_VV(vflogb_s, 32, helper_vv_f, do_vflogb)
+DO_HELPER_VV(vflogb_d, 64, helper_vv_f, do_vflogb)
+
+DO_HELPER_VV(vfclass_s, 32, helper_vv_f, do_vfclass)
+DO_HELPER_VV(vfclass_d, 64, helper_vv_f, do_vfclass)
+
+DO_HELPER_VV(vfsqrt_s, 32, helper_vv_f, do_vfsqrt)
+DO_HELPER_VV(vfsqrt_d, 64, helper_vv_f, do_vfsqrt)
+DO_HELPER_VV(vfrecip_s, 32, helper_vv_f, do_vfrecip)
+DO_HELPER_VV(vfrecip_d, 64, helper_vv_f, do_vfrecip)
+DO_HELPER_VV(vfrsqrt_s, 32, helper_vv_f, do_vfrsqrt)
+DO_HELPER_VV(vfrsqrt_d, 64, helper_vv_f, do_vfrsqrt)
-- 
2.31.1


