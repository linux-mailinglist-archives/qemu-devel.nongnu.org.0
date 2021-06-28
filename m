Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0BA3B5DE6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:21:24 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqGR-0004i0-9t
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq14-0002t0-HN
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45640 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0u-0001Ez-9Q
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:30 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S19; 
 Mon, 28 Jun 2021 20:05:05 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/20] target/loongarch: Add floating point load/store
 instruction translation
Date: Mon, 28 Jun 2021 20:04:42 +0800
Message-Id: <1624881885-31692-18-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S19
X-Coremail-Antispam: 1UD129KBjvJXoW3CF15tr4rtF17ZF17WF13twb_yoWDXF47pr
 1Iyry3Wr48try3X3s3K345tF98XFs7CF1jg3sIv3WrCF4xJF1UZF1rt3yagF4jgws7XFyY
 qFyDCF9FgFy8JwUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement floating point load/store instruction translation.

This includes:
- FLD.{S/D}, FST.{S/D}
- FLDX.{S/D}, FSTX.{S/D}
- FLD{GT/LE}.{S/D}, FST{GT/LE}.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/insns.decode |  24 +++++++++
 target/loongarch/instmap.h    |  17 +++++++
 target/loongarch/trans.inc.c  | 105 ++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  | 116 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 262 insertions(+)

diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index a9d8530..cff0955 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -73,6 +73,8 @@
 &fmt_fdcj           fd cj
 &fmt_cdrj           cd rj
 &fmt_rdcj           rd cj
+&fmt_fdrjrk         fd rj rk
+&fmt_fdrjsi12       fd rj si12
 
 #
 # Formats
@@ -108,6 +110,8 @@
 @fmt_fdcj            .... ........ ..... ..... .. ... .....   &fmt_fdcj           %fd %cj
 @fmt_cdrj            .... ........ ..... ..... ..... .. ...   &fmt_cdrj           %cd %rj
 @fmt_rdcj            .... ........ ..... ..... .. ... .....   &fmt_rdcj           %rd %cj
+@fmt_fdrjrk          .... ........ ..... ..... ..... .....    &fmt_fdrjrk         %fd %rj %rk
+@fmt_fdrjsi12        .... ...... ............ ..... .....     &fmt_fdrjsi12       %fd %rj %si12
 
 #
 # Fixed point arithmetic operation instruction
@@ -427,3 +431,23 @@ movfr2cf         0000 00010001 01001 10100 ..... 00 ...   @fmt_cdfj
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
diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
index c031ec5..eb8e354 100644
--- a/target/loongarch/instmap.h
+++ b/target/loongarch/instmap.h
@@ -147,6 +147,19 @@ enum {
 
 /* load/store opcodes */
 enum {
+    LA_OPC_FLDX_S    = (0x07060 << 15),
+    LA_OPC_FLDX_D    = (0x07068 << 15),
+    LA_OPC_FSTX_S    = (0x07070 << 15),
+    LA_OPC_FSTX_D    = (0x07078 << 15),
+    LA_OPC_FLDGT_S   = (0x070E8 << 15),
+    LA_OPC_FLDGT_D   = (0x070E9 << 15),
+    LA_OPC_FLDLE_S   = (0x070EA << 15),
+    LA_OPC_FLDLE_D   = (0x070EB << 15),
+    LA_OPC_FSTGT_S   = (0x070EC << 15),
+    LA_OPC_FSTGT_D   = (0x070ED << 15),
+    LA_OPC_FSTLE_S   = (0x070EE << 15),
+    LA_OPC_FSTLE_D   = (0x070EF << 15),
+
     LA_OPC_LD_B      = (0x0A0 << 22),
     LA_OPC_LD_H      = (0x0A1 << 22),
     LA_OPC_LD_W      = (0x0A2 << 22),
@@ -158,6 +171,10 @@ enum {
     LA_OPC_LD_BU     = (0x0A8 << 22),
     LA_OPC_LD_HU     = (0x0A9 << 22),
     LA_OPC_LD_WU     = (0x0AA << 22),
+    LA_OPC_FLD_S     = (0x0AC << 22),
+    LA_OPC_FST_S     = (0x0AD << 22),
+    LA_OPC_FLD_D     = (0x0AE << 22),
+    LA_OPC_FST_D     = (0x0AF << 22),
 
     LA_OPC_LL_W      = (0x20 << 24),
     LA_OPC_LL_D      = (0x22 << 24),
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 110b724..d95101b 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -2209,3 +2209,108 @@ static bool trans_movcf2gr(DisasContext *ctx, arg_movcf2gr *a)
     tcg_temp_free_i32(cj);
     return true;
 }
+
+/* Floating point load/store instruction translation */
+static bool trans_fld_s(DisasContext *ctx, arg_fld_s *a)
+{
+    gen_loongarch_fldst(ctx, LA_OPC_FLD_S, a->fd, a->rj, a->si12);
+    return true;
+}
+
+static bool trans_fst_s(DisasContext *ctx, arg_fst_s *a)
+{
+    gen_loongarch_fldst(ctx, LA_OPC_FST_S, a->fd, a->rj, a->si12);
+    return true;
+}
+
+static bool trans_fld_d(DisasContext *ctx, arg_fld_d *a)
+{
+    gen_loongarch_fldst(ctx, LA_OPC_FLD_D, a->fd, a->rj, a->si12);
+    return true;
+}
+
+static bool trans_fst_d(DisasContext *ctx, arg_fst_d *a)
+{
+    gen_loongarch_fldst(ctx, LA_OPC_FST_D, a->fd, a->rj, a->si12);
+    return true;
+}
+
+static bool trans_fldx_s(DisasContext *ctx, arg_fldx_s *a)
+{
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FLDX_S, a->fd, 0, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fldx_d(DisasContext *ctx, arg_fldx_d *a)
+{
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FLDX_D, a->fd, 0, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fstx_s(DisasContext *ctx, arg_fstx_s *a)
+{
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FSTX_S, 0, a->fd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fstx_d(DisasContext *ctx, arg_fstx_d *a)
+{
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FSTX_D, 0, a->fd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fldgt_s(DisasContext *ctx, arg_fldgt_s *a)
+{
+    ASRTGT;
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FLDGT_S, a->fd, 0, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fldgt_d(DisasContext *ctx, arg_fldgt_d *a)
+{
+    ASRTGT;
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FLDGT_D, a->fd, 0, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fldle_s(DisasContext *ctx, arg_fldle_s *a)
+{
+    ASRTLE;
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FLDLE_S, a->fd, 0, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fldle_d(DisasContext *ctx, arg_fldle_d *a)
+{
+    ASRTLE;
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FLDLE_D, a->fd, 0, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fstgt_s(DisasContext *ctx, arg_fstgt_s *a)
+{
+    ASRTGT;
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FSTGT_S, 0, a->fd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fstgt_d(DisasContext *ctx, arg_fstgt_d *a)
+{
+    ASRTGT;
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FSTGT_D, 0, a->fd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fstle_s(DisasContext *ctx, arg_fstle_s *a)
+{
+    ASRTLE;
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FSTLE_S, 0, a->fd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_fstle_d(DisasContext *ctx, arg_fstle_d *a)
+{
+    ASRTLE;
+    gen_loongarch_fldst_extra(ctx, LA_OPC_FSTLE_D, 0, a->fd, a->rj, a->rk);
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 4efcaa6..c1d89d8 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -2147,6 +2147,122 @@ static void gen_loongarch_fp_mov(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t0);
 }
 
+/* floating point load/store */
+static void gen_loongarch_fp_ldst(DisasContext *ctx, uint32_t opc,
+                                  int ft, TCGv t0)
+{
+    switch (opc) {
+    case LA_OPC_FLD_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
+                                ctx->default_tcg_memop_mask);
+            gen_store_fpr32(ctx, fp0, ft);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FST_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, ft);
+            tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
+                                ctx->default_tcg_memop_mask);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FLD_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+            tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEQ |
+                                ctx->default_tcg_memop_mask);
+            gen_store_fpr64(ctx, fp0, ft);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    case LA_OPC_FST_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+            gen_load_fpr64(ctx, fp0, ft);
+            tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEQ |
+                                ctx->default_tcg_memop_mask);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    default:
+        generate_exception_end(ctx, EXCP_INE);
+        break;
+    }
+}
+
+static void gen_loongarch_fldst(DisasContext *ctx, uint32_t op, int fd,
+                                int rj, int16_t imm)
+{
+    TCGv t0 = tcg_temp_new();
+    check_fpu_enabled(ctx);
+    gen_base_offset_addr(ctx, t0, rj, imm);
+    gen_loongarch_fp_ldst(ctx, op, fd, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_loongarch_fldst_extra(DisasContext *ctx, uint32_t opc,
+                                      int fld, int fst, int base, int index)
+{
+    TCGv t0 = tcg_temp_new();
+
+    if (base == 0) {
+        gen_load_gpr(t0, index);
+    } else if (index == 0) {
+        gen_load_gpr(t0, base);
+    } else {
+        gen_op_addr_add(ctx, t0, cpu_gpr[base], cpu_gpr[index]);
+    }
+
+    switch (opc) {
+    case LA_OPC_FLDX_S:
+    case LA_OPC_FLDGT_S:
+    case LA_OPC_FLDLE_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESL);
+            tcg_gen_trunc_tl_i32(fp0, t0);
+            gen_store_fpr32(ctx, fp0, fld);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FLDX_D:
+    case LA_OPC_FLDGT_D:
+    case LA_OPC_FLDLE_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+            tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEQ);
+            gen_store_fpr64(ctx, fp0, fld);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    case LA_OPC_FSTX_S:
+    case LA_OPC_FSTGT_S:
+    case LA_OPC_FSTLE_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, fst);
+            tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FSTX_D:
+    case LA_OPC_FSTGT_D:
+    case LA_OPC_FSTLE_D:
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+            gen_load_fpr64(ctx, fp0, fst);
+            tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEQ);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
+    }
+    tcg_temp_free(t0);
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1


