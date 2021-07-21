Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709D3D0BBF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:10:44 +0200 (CEST)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Bb-0005gc-Gj
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68vK-0003Pe-Du
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49790 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68vH-0002Fw-Sy
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:54 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S19; 
 Wed, 21 Jul 2021 17:53:38 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/22] target/loongarch: Add floating point load/store
 instruction translation
Date: Wed, 21 Jul 2021 17:53:13 +0800
Message-Id: <1626861198-6133-18-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S19
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw47WFW7tF1kKw1DWFy5XFb_yoW3WFWrpr
 1IkryUXF48tr13X3sayw1Yk3W5XFn7Cr1UK3s0ywn5AF18AF1kAF1rG3yY9rWUXFs7XFW5
 tFZ8CFWqkFyUG3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement floating point load/store instruction translation.

This includes:
- FLD.{S/D}, FST.{S/D}
- FLDX.{S/D}, FSTX.{S/D}
- FLD{GT/LE}.{S/D}, FST{GT/LE}.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/insns.decode |  24 ++++
 target/loongarch/trans.inc.c  | 257 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 281 insertions(+)

diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index febf89a..ea776c2 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -72,6 +72,8 @@
 &fmt_fdcj           fd cj
 &fmt_cdrj           cd rj
 &fmt_rdcj           rd cj
+&fmt_fdrjrk         fd rj rk
+&fmt_fdrjsi12       fd rj si12
 
 #
 # Formats
@@ -106,6 +108,8 @@
 @fmt_fdcj            .... ........ ..... ..... .. ... .....   &fmt_fdcj           %fd %cj
 @fmt_cdrj            .... ........ ..... ..... ..... .. ...   &fmt_cdrj           %cd %rj
 @fmt_rdcj            .... ........ ..... ..... .. ... .....   &fmt_rdcj           %rd %cj
+@fmt_fdrjrk          .... ........ ..... ..... ..... .....    &fmt_fdrjrk         %fd %rj %rk
+@fmt_fdrjsi12        .... ...... ............ ..... .....     &fmt_fdrjsi12       %fd %rj %si12
 
 #
 # Fixed point arithmetic operation instruction
@@ -424,3 +428,23 @@ movfr2cf         0000 00010001 01001 10100 ..... 00 ...   @fmt_cdfj
 movcf2fr         0000 00010001 01001 10101 00 ... .....   @fmt_fdcj
 movgr2cf         0000 00010001 01001 10110 ..... 00 ...   @fmt_cdrj
 movcf2gr         0000 00010001 01001 10111 00 ... .....   @fmt_rdcj
+
+#
+# Floating point load/store instruction
+#
+fld_s            0010 101100 ............ ..... .....     @fmt_fdrjsi12
+fst_s            0010 101101 ............ ..... .....     @fmt_fdrjsi12
+fld_d            0010 101110 ............ ..... .....     @fmt_fdrjsi12
+fst_d            0010 101111 ............ ..... .....     @fmt_fdrjsi12
+fldx_s           0011 10000011 00000 ..... ..... .....    @fmt_fdrjrk
+fldx_d           0011 10000011 01000 ..... ..... .....    @fmt_fdrjrk
+fstx_s           0011 10000011 10000 ..... ..... .....    @fmt_fdrjrk
+fstx_d           0011 10000011 11000 ..... ..... .....    @fmt_fdrjrk
+fldgt_s          0011 10000111 01000 ..... ..... .....    @fmt_fdrjrk
+fldgt_d          0011 10000111 01001 ..... ..... .....    @fmt_fdrjrk
+fldle_s          0011 10000111 01010 ..... ..... .....    @fmt_fdrjrk
+fldle_d          0011 10000111 01011 ..... ..... .....    @fmt_fdrjrk
+fstgt_s          0011 10000111 01100 ..... ..... .....    @fmt_fdrjrk
+fstgt_d          0011 10000111 01101 ..... ..... .....    @fmt_fdrjrk
+fstle_s          0011 10000111 01110 ..... ..... .....    @fmt_fdrjrk
+fstle_d          0011 10000111 01111 ..... ..... .....    @fmt_fdrjrk
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 56677f8..8adfdd3 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -5028,3 +5028,260 @@ static bool trans_movcf2gr(DisasContext *ctx, arg_movcf2gr *a)
 
     return true;
 }
+
+/* Floating point load/store instruction translation */
+static bool trans_fld_s(DisasContext *ctx, arg_fld_s *a)
+{
+    TCGv t0;
+    TCGv_i32 fp0;
+
+    t0 = tcg_temp_new();
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
+                        ctx->default_tcg_memop_mask);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i32(fp0);
+
+
+    return true;
+}
+
+static bool trans_fst_s(DisasContext *ctx, arg_fst_s *a)
+{
+    TCGv t0;
+    TCGv_i32 fp0;
+
+    t0 = tcg_temp_new();
+    fp0 = tcg_temp_new_i32();
+
+    check_fpu_enabled(ctx);
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    gen_load_fpr32(fp0, a->fd);
+    tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
+                        ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_fld_d(DisasContext *ctx, arg_fld_d *a)
+{
+    TCGv t0;
+    TCGv_i64 fp0;
+
+    t0 = tcg_temp_new();
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEQ |
+                        ctx->default_tcg_memop_mask);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_fst_d(DisasContext *ctx, arg_fst_d *a)
+{
+    TCGv t0;
+    TCGv_i64 fp0;
+
+    t0 = tcg_temp_new();
+    fp0 = tcg_temp_new_i64();
+
+    check_fpu_enabled(ctx);
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    gen_load_fpr64(fp0, a->fd);
+    tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEQ |
+                        ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_fldx_s(DisasContext *ctx, arg_fldx_s *a)
+{
+    TCGv t0;
+    TCGv_i32 fp0;
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    t0 = tcg_temp_new();
+    fp0 = tcg_temp_new_i32();
+
+    if (a->rj == 0 && a->rk == 0) {
+        /* Nop */
+        return true;
+    }
+
+    tcg_gen_add_tl(t0, Rj, Rk);
+    tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESL);
+    tcg_gen_trunc_tl_i32(fp0, t0);
+    gen_store_fpr32(fp0, a->fd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_fldx_d(DisasContext *ctx, arg_fldx_d *a)
+{
+    TCGv t0;
+    TCGv_i64 fp0;
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    t0 = tcg_temp_new();
+    fp0 = tcg_temp_new_i64();
+
+    if (a->rj == 0 && a->rk == 0) {
+        /* Nop */
+        return true;
+    }
+
+    tcg_gen_add_tl(t0, Rj, Rk);
+    tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEQ);
+    gen_store_fpr64(fp0, a->fd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i64(fp0);
+
+    return true;
+}
+
+static bool trans_fstx_s(DisasContext *ctx, arg_fstx_s *a)
+{
+    TCGv t0;
+    TCGv_i32 fp0;
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    t0 = tcg_temp_new();
+    fp0 = tcg_temp_new_i32();
+
+    if (a->rj == 0 && a->rk == 0) {
+        /* Nop */
+        return true;
+    }
+
+    tcg_gen_add_tl(t0, Rj, Rk);
+    gen_load_fpr32(fp0, a->fd);
+    tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i32(fp0);
+
+    return true;
+}
+
+static bool trans_fstx_d(DisasContext *ctx, arg_fstx_d *a)
+{
+    TCGv t0;
+    TCGv_i64 fp0;
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    t0 = tcg_temp_new();
+    fp0 = tcg_temp_new_i64();
+
+    if (a->rj == 0 && a->rk == 0) {
+        /* Nop */
+        return true;
+    }
+
+    tcg_gen_add_tl(t0, Rj, Rk);
+    gen_load_fpr64(fp0, a->fd);
+    tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEQ);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+
+#define DECL_ARG2(name)  \
+    arg_ ## name arg = { \
+        .fd = a->fd,     \
+        .rj = a->rj,     \
+        .rk = a->rk,     \
+    };
+
+static bool trans_fldgt_s(DisasContext *ctx, arg_fldgt_s *a)
+{
+    ASRTGT;
+    DECL_ARG2(fldx_s)
+    trans_fldx_s(ctx, &arg);
+    return true;
+}
+
+static bool trans_fldgt_d(DisasContext *ctx, arg_fldgt_d *a)
+{
+    ASRTGT;
+    DECL_ARG2(fldx_d);
+    trans_fldx_d(ctx, &arg);
+    return true;
+}
+
+static bool trans_fldle_s(DisasContext *ctx, arg_fldle_s *a)
+{
+    ASRTLE;
+    DECL_ARG2(fldx_s);
+    trans_fldx_s(ctx, &arg);
+    return true;
+}
+
+static bool trans_fldle_d(DisasContext *ctx, arg_fldle_d *a)
+{
+    ASRTLE;
+    DECL_ARG2(fldx_d);
+    trans_fldx_d(ctx, &arg);
+    return true;
+}
+
+static bool trans_fstgt_s(DisasContext *ctx, arg_fstgt_s *a)
+{
+    ASRTGT;
+    DECL_ARG2(fstx_s);
+    trans_fstx_s(ctx, &arg);
+    return true;
+}
+
+static bool trans_fstgt_d(DisasContext *ctx, arg_fstgt_d *a)
+{
+    ASRTGT;
+    DECL_ARG2(fstx_d);
+    trans_fstx_d(ctx, &arg);
+    return true;
+}
+
+static bool trans_fstle_s(DisasContext *ctx, arg_fstle_s *a)
+{
+    ASRTLE;
+    DECL_ARG2(fstx_s);
+    trans_fstx_s(ctx, &arg);
+    return true;
+}
+
+static bool trans_fstle_d(DisasContext *ctx, arg_fstle_d *a)
+{
+    ASRTLE;
+    DECL_ARG2(fstx_d);
+    trans_fstx_d(ctx, &arg);
+    return true;
+}
+
+#undef DECL_ARG2
-- 
1.8.3.1


