Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4866EDC37
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:09:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCiG-0001Vm-5q; Tue, 25 Apr 2023 03:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prCiC-0001US-4i
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:40 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prCi7-0008Dv-Us
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:39 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Ax2ek7e0dksF8AAA--.667S3;
 Tue, 25 Apr 2023 15:03:23 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S35; 
 Tue, 25 Apr 2023 15:03:23 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v4 33/44] target/loongarch: Implement LSX fpu arith
 instructions
Date: Tue, 25 Apr 2023 15:02:37 +0800
Message-Id: <20230425070248.2550028-34-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
References: <20230425070248.2550028-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S35
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfJrW3Cw18ur1fKF4kXFWxCrg_yoW8AFyDXo
 WfAw15Jw48GrySkry29a4vvF97t340yw4DJFWkurnIqa4xAry7tr1rKwn5tayfJ3yYgry3
 J39rZ3W5tw1agryDn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqC1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2js
 IEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI
 8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4I
 kC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8E
 rcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
 87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
- VF{ADD/SUB/MUL/DIV}.{S/D};
- VF{MADD/MSUB/NMADD/NMSUB}.{S/D};
- VF{MAX/MIN}.{S/D};
- VF{MAXA/MINA}.{S/D};
- VFLOGB.{S/D};
- VFCLASS.{S/D};
- VF{SQRT/RECIP/RSQRT}.{S/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.h                      |   4 +
 target/loongarch/disas.c                    |  46 +++++
 target/loongarch/fpu_helper.c               |   2 +-
 target/loongarch/helper.h                   |  41 +++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  55 ++++++
 target/loongarch/insns.decode               |  43 +++++
 target/loongarch/internals.h                |   1 +
 target/loongarch/lsx_helper.c               | 186 ++++++++++++++++++++
 8 files changed, 377 insertions(+), 1 deletion(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 6755b1f0c7..1f37e36b7c 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -55,6 +55,10 @@ FIELD(FCSR0, CAUSE, 24, 5)
     do { \
         (REG) = FIELD_DP32(REG, FCSR0, CAUSE, V); \
     } while (0)
+#define UPDATE_FP_CAUSE(REG, V) \
+    do { \
+        (REG) |= FIELD_DP32(0, FCSR0, CAUSE, V); \
+    } while (0)
 
 #define GET_FP_ENABLES(REG)    FIELD_EX32(REG, FCSR0, ENABLES)
 #define SET_FP_ENABLES(REG, V) \
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index be2bb9cc42..b57b284e49 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -807,6 +807,11 @@ static void output_vv(DisasContext *ctx, arg_vv *a, const char *mnemonic)
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
@@ -1302,3 +1307,44 @@ INSN_LSX(vfrstp_b,         vvv)
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
index 4b9637210a..f6753c5875 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -33,7 +33,7 @@ void restore_fp_status(CPULoongArchState *env)
     set_flush_to_zero(0, &env->fp_status);
 }
 
-static int ieee_ex_to_loongarch(int xcpt)
+int ieee_ex_to_loongarch(int xcpt)
 {
     int ret = 0;
     if (xcpt & float_flag_invalid) {
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 2cc235d019..a0c9de271d 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -517,3 +517,44 @@ DEF_HELPER_4(vfrstp_b, void, env, i32, i32, i32)
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
index ee84a5a4ee..99a17ac200 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -15,6 +15,20 @@
 #define CHECK_SXE
 #endif
 
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
 static bool gen_vvv(DisasContext *ctx, arg_vvv *a,
                     void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32))
 {
@@ -3421,3 +3435,44 @@ TRANS(vfrstp_b, gen_vvv, gen_helper_vfrstp_b)
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
index 4cb286ffe5..bcc531dd25 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -493,6 +493,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vv           vd vj
 &vvv          vd vj vk
 &vv_i         vd vj imm
+&vvvv         vd vj vk va
 
 #
 # LSX Formats
@@ -506,6 +507,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv_ui7             .... ........ ... imm:7 vj:5 vd:5    &vv_i
 @vv_ui8              .... ........ .. imm:8 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
+@vvvv               .... ........ va:5 vk:5 vj:5 vd:5    &vvvv
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -1003,3 +1005,44 @@ vfrstp_b         0111 00010010 10110 ..... ..... .....    @vvv
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
index 4c5752fc01..7b0f29c942 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -53,6 +53,7 @@ void G_NORETURN do_raise_exception(CPULoongArchState *env,
 
 const char *loongarch_exception_name(int32_t exception);
 
+int ieee_ex_to_loongarch(int xcpt);
 void restore_fp_status(CPULoongArchState *env);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index ad0d2dbe87..7d0c615027 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -9,6 +9,8 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
+#include "internals.h"
 
 #define DO_ADD(a, b)  (a + b)
 #define DO_SUB(a, b)  (a - b)
@@ -2060,3 +2062,187 @@ void HELPER(NAME)(CPULoongArchState *env,                 \
 
 VFRSTPI(vfrstpi_b, 8,  B)
 VFRSTPI(vfrstpi_h, 16, H)
+
+static void vec_update_fcsr0_mask(CPULoongArchState *env,
+                                  uintptr_t pc, int mask)
+{
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    set_float_exception_flags(0, &env->fp_status);
+
+    flags &= ~mask;
+
+    if (flags) {
+        flags = ieee_ex_to_loongarch(flags);
+        UPDATE_FP_CAUSE(env->fcsr0, flags);
+    }
+
+    if (GET_FP_ENABLES(env->fcsr0) & flags) {
+        do_raise_exception(env, EXCCODE_FPE, pc);
+    } else {
+        UPDATE_FP_FLAGS(env->fcsr0, flags);
+    }
+}
+
+static void vec_update_fcsr0(CPULoongArchState *env, uintptr_t pc)
+{
+    vec_update_fcsr0_mask(env, pc, 0);
+}
+
+static inline void vec_clear_cause(CPULoongArchState *env)
+{
+    SET_FP_CAUSE(env->fcsr0, 0);
+}
+
+#define DO_3OP_F(NAME, BIT, E, FN)                          \
+void HELPER(NAME)(CPULoongArchState *env,                   \
+                  uint32_t vd, uint32_t vj, uint32_t vk)    \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = &(env->fpr[vd].vreg);                        \
+    VReg *Vj = &(env->fpr[vj].vreg);                        \
+    VReg *Vk = &(env->fpr[vk].vreg);                        \
+                                                            \
+    vec_clear_cause(env);                                   \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E(i) = FN(Vj->E(i), Vk->E(i), &env->fp_status); \
+        vec_update_fcsr0(env, GETPC());                     \
+    }                                                       \
+}
+
+DO_3OP_F(vfadd_s, 32, UW, float32_add)
+DO_3OP_F(vfadd_d, 64, UD, float64_add)
+DO_3OP_F(vfsub_s, 32, UW, float32_sub)
+DO_3OP_F(vfsub_d, 64, UD, float64_sub)
+DO_3OP_F(vfmul_s, 32, UW, float32_mul)
+DO_3OP_F(vfmul_d, 64, UD, float64_mul)
+DO_3OP_F(vfdiv_s, 32, UW, float32_div)
+DO_3OP_F(vfdiv_d, 64, UD, float64_div)
+DO_3OP_F(vfmax_s, 32, UW, float32_maxnum)
+DO_3OP_F(vfmax_d, 64, UD, float64_maxnum)
+DO_3OP_F(vfmin_s, 32, UW, float32_minnum)
+DO_3OP_F(vfmin_d, 64, UD, float64_minnum)
+DO_3OP_F(vfmaxa_s, 32, UW, float32_maxnummag)
+DO_3OP_F(vfmaxa_d, 64, UD, float64_maxnummag)
+DO_3OP_F(vfmina_s, 32, UW, float32_minnummag)
+DO_3OP_F(vfmina_d, 64, UD, float64_minnummag)
+
+#define DO_4OP_F(NAME, BIT, E, FN, flags)                                    \
+void HELPER(NAME)(CPULoongArchState *env,                                    \
+                  uint32_t vd, uint32_t vj, uint32_t vk, uint32_t va)        \
+{                                                                            \
+    int i;                                                                   \
+    VReg *Vd = &(env->fpr[vd].vreg);                                         \
+    VReg *Vj = &(env->fpr[vj].vreg);                                         \
+    VReg *Vk = &(env->fpr[vk].vreg);                                         \
+    VReg *Va = &(env->fpr[va].vreg);                                         \
+                                                                             \
+    vec_clear_cause(env);                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                      \
+        Vd->E(i) = FN(Vj->E(i), Vk->E(i), Va->E(i), flags, &env->fp_status); \
+        vec_update_fcsr0(env, GETPC());                                      \
+    }                                                                        \
+}
+
+DO_4OP_F(vfmadd_s, 32, UW, float32_muladd, 0)
+DO_4OP_F(vfmadd_d, 64, UD, float64_muladd, 0)
+DO_4OP_F(vfmsub_s, 32, UW, float32_muladd, float_muladd_negate_c)
+DO_4OP_F(vfmsub_d, 64, UD, float64_muladd, float_muladd_negate_c)
+DO_4OP_F(vfnmadd_s, 32, UW, float32_muladd, float_muladd_negate_result)
+DO_4OP_F(vfnmadd_d, 64, UD, float64_muladd, float_muladd_negate_result)
+DO_4OP_F(vfnmsub_s, 32, UW, float32_muladd,
+         float_muladd_negate_c | float_muladd_negate_result)
+DO_4OP_F(vfnmsub_d, 64, UD, float64_muladd,
+         float_muladd_negate_c | float_muladd_negate_result)
+
+#define DO_2OP_F(NAME, BIT, E, FN)                                  \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    vec_clear_cause(env);                                           \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        Vd->E(i) = FN(env, Vj->E(i));                               \
+    }                                                               \
+}
+
+#define FLOGB(BIT, T)                                            \
+static T do_flogb_## BIT(CPULoongArchState *env, T fj)           \
+{                                                                \
+    T fp, fd;                                                    \
+    float_status *status = &env->fp_status;                      \
+    FloatRoundMode old_mode = get_float_rounding_mode(status);   \
+                                                                 \
+    set_float_rounding_mode(float_round_down, status);           \
+    fp = float ## BIT ##_log2(fj, status);                       \
+    fd = float ## BIT ##_round_to_int(fp, status);               \
+    set_float_rounding_mode(old_mode, status);                   \
+    vec_update_fcsr0_mask(env, GETPC(), float_flag_inexact);     \
+    return fd;                                                   \
+}
+
+FLOGB(32, uint32_t)
+FLOGB(64, uint64_t)
+
+#define FCLASS(NAME, BIT, E, FN)                                    \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        Vd->E(i) = FN(env, Vj->E(i));                               \
+    }                                                               \
+}
+
+FCLASS(vfclass_s, 32, UW, helper_fclass_s)
+FCLASS(vfclass_d, 64, UD, helper_fclass_d)
+
+#define FSQRT(BIT, T)                                  \
+static T do_fsqrt_## BIT(CPULoongArchState *env, T fj) \
+{                                                      \
+    T fd;                                              \
+    fd = float ## BIT ##_sqrt(fj, &env->fp_status);    \
+    vec_update_fcsr0(env, GETPC());                    \
+    return fd;                                         \
+}
+
+FSQRT(32, uint32_t)
+FSQRT(64, uint64_t)
+
+#define FRECIP(BIT, T)                                                  \
+static T do_frecip_## BIT(CPULoongArchState *env, T fj)                 \
+{                                                                       \
+    T fd;                                                               \
+    fd = float ## BIT ##_div(float ## BIT ##_one, fj, &env->fp_status); \
+    vec_update_fcsr0(env, GETPC());                                     \
+    return fd;                                                          \
+}
+
+FRECIP(32, uint32_t)
+FRECIP(64, uint64_t)
+
+#define FRSQRT(BIT, T)                                                  \
+static T do_frsqrt_## BIT(CPULoongArchState *env, T fj)                 \
+{                                                                       \
+    T fd, fp;                                                           \
+    fp = float ## BIT ##_sqrt(fj, &env->fp_status);                     \
+    fd = float ## BIT ##_div(float ## BIT ##_one, fp, &env->fp_status); \
+    vec_update_fcsr0(env, GETPC());                                     \
+    return fd;                                                          \
+}
+
+FRSQRT(32, uint32_t)
+FRSQRT(64, uint64_t)
+
+DO_2OP_F(vflogb_s, 32, UW, do_flogb_32)
+DO_2OP_F(vflogb_d, 64, UD, do_flogb_64)
+DO_2OP_F(vfsqrt_s, 32, UW, do_fsqrt_32)
+DO_2OP_F(vfsqrt_d, 64, UD, do_fsqrt_64)
+DO_2OP_F(vfrecip_s, 32, UW, do_frecip_32)
+DO_2OP_F(vfrecip_d, 64, UD, do_frecip_64)
+DO_2OP_F(vfrsqrt_s, 32, UW, do_frsqrt_32)
+DO_2OP_F(vfrsqrt_d, 64, UD, do_frsqrt_64)
-- 
2.31.1


