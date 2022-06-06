Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5453F295
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:34:11 +0200 (CEST)
Received: from localhost ([::1]:32952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMEa-0000TL-E8
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwK-0001g5-8h
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:16 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwC-0003xN-P6
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:12 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 123so3823735pgb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ti1D21egvyjipNMhJe24wbpmyh4s4RDeZeoZTDcmsyA=;
 b=zy0oiDvCRrjefwMzmCy5V6I8H9Iq1vFY6/H5lfPuOlRfSZ4gktvXd1JAnw8hPOWCZo
 JNi97tmd4jbIiD1bv3g7hgEu5i91I4kji9AzYN3kElYQC5NTZhJHkISaG5b+5HFqEpQP
 QqDhyVb3phWuToapcOVmIedKDYeulw5/2tjeipTp9RlqqRP8EeMOC5KEmq3nwvL6vKkd
 u6bFaUkGkgHYw0xv+RrYGJPqXbXcs9mkDQAgLp3lSSiurW5XymwW8BDuM0EN3w6TG8G0
 3TkizZF8++6qieHF+y4M5AOx/ff2TGzT9EQBAhVWMmNTmZvr3QBnBHZmisXv5HBhtYX5
 yxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ti1D21egvyjipNMhJe24wbpmyh4s4RDeZeoZTDcmsyA=;
 b=NBubYQLaHzTGAr6q2XSz75f0rZ2IBMQeQ71f6EocqJk1ONO3AaZ2q8qw9gtiC+hyjG
 U+Kv6v6nFwaT7/Q+KRkPw8kcHgmfKPmjQplzD1DDy96UzCJTzlgYVkbH7Np6k4BfdKtx
 78YkbMEVdnnEgQ6TbXTqS+9xdgA0zJo1mRJ0I8ZIfna2som4NZyR+iIQtuMEje2zXHAs
 0t6Qmy/cyyspSRMH1Lqw6UdQ65csK33URkBI3Amhh7Y/JK7VKmxovwZmn7TeN/6bRkcc
 C1Od4poIllfx7WVK84Ba4YrAhK0Z3X7T/1F+wbRK3mdlEVeqYDayv33IWsiSuD1fmFUV
 tbyQ==
X-Gm-Message-State: AOAM532ZuLsgjEBHA+PWPVkOoTAmkAE0rw7zEGAOLtgxRUnVoxE/QgNU
 pjzd4v+uzlVVHilHq2Yn7H5ulJcne49b7A==
X-Google-Smtp-Source: ABdhPJyMsKPtRfgIJMr82kBMVEB6RtamvG8evQXWyWk+lHeTHH2QSQ1SkN50T3rI+HF8TgUu6clgyg==
X-Received: by 2002:a63:5f0d:0:b0:3fd:7b18:bad8 with SMTP id
 t13-20020a635f0d000000b003fd7b18bad8mr11001233pgb.213.1654557307267; 
 Mon, 06 Jun 2022 16:15:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 16/43] target/loongarch: Add disassembler
Date: Mon,  6 Jun 2022 16:14:23 -0700
Message-Id: <20220606231450.448443-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

This patch adds support for disassembling via option '-d in_asm'.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-17-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build              |   1 +
 include/disas/dis-asm.h  |   2 +
 target/loongarch/disas.c | 610 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 613 insertions(+)
 create mode 100644 target/loongarch/disas.c

diff --git a/meson.build b/meson.build
index d738391810..21cd949082 100644
--- a/meson.build
+++ b/meson.build
@@ -2349,6 +2349,7 @@ disassemblers = {
   'sh4' : ['CONFIG_SH4_DIS'],
   'sparc' : ['CONFIG_SPARC_DIS'],
   'xtensa' : ['CONFIG_XTENSA_DIS'],
+  'loongarch' : ['CONFIG_LOONGARCH_DIS'],
 }
 if link_language == 'cpp'
   disassemblers += {
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index fc7cb7af5a..64247ecb11 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -253,6 +253,7 @@ enum bfd_architecture
 #define bfd_mach_rx            0x75
 #define bfd_mach_rx_v2         0x76
 #define bfd_mach_rx_v3         0x77
+  bfd_arch_loongarch,
   bfd_arch_last
   };
 #define bfd_mach_s390_31 31
@@ -458,6 +459,7 @@ int print_insn_riscv64          (bfd_vma, disassemble_info*);
 int print_insn_riscv128         (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
 int print_insn_hexagon(bfd_vma, disassemble_info *);
+int print_insn_loongarch(bfd_vma, disassemble_info *);
 
 #ifdef CONFIG_CAPSTONE
 bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size);
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
new file mode 100644
index 0000000000..9454ebb8e9
--- /dev/null
+++ b/target/loongarch/disas.c
@@ -0,0 +1,610 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch Disassembler
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited.
+ */
+
+#include "qemu/osdep.h"
+#include "disas/dis-asm.h"
+#include "qemu/bitops.h"
+
+typedef struct {
+    disassemble_info *info;
+    uint64_t pc;
+    uint32_t insn;
+} DisasContext;
+
+static inline int plus_1(DisasContext *ctx, int x)
+{
+    return x + 1;
+}
+
+static inline int shl_2(DisasContext *ctx, int x)
+{
+    return x << 2;
+}
+
+#define output(C, INSN, FMT, ...)                                   \
+{                                                                   \
+    (C)->info->fprintf_func((C)->info->stream, "%08x   %-9s\t" FMT, \
+                            (C)->insn, INSN, ##__VA_ARGS__);        \
+}
+
+#include "decode-insns.c.inc"
+
+int print_insn_loongarch(bfd_vma memaddr, struct disassemble_info *info)
+{
+    bfd_byte buffer[4];
+    uint32_t insn;
+    int status;
+
+    status = (*info->read_memory_func)(memaddr, buffer, 4, info);
+    if (status != 0) {
+        (*info->memory_error_func)(status, memaddr, info);
+        return -1;
+    }
+    insn = bfd_getl32(buffer);
+    DisasContext ctx = {
+        .info = info,
+        .pc = memaddr,
+        .insn = insn
+    };
+
+    if (!decode(&ctx, insn)) {
+        output(&ctx, "illegal", "");
+    }
+    return 4;
+}
+
+static void output_r_i(DisasContext *ctx, arg_r_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, %d", a->rd, a->imm);
+}
+
+static void output_rrr(DisasContext *ctx, arg_rrr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d, r%d", a->rd, a->rj, a->rk);
+}
+
+static void output_rr_i(DisasContext *ctx, arg_rr_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d, %d", a->rd, a->rj, a->imm);
+}
+
+static void output_rrr_sa(DisasContext *ctx, arg_rrr_sa *a,
+                          const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d, r%d, %d", a->rd, a->rj, a->rk, a->sa);
+}
+
+static void output_rr(DisasContext *ctx, arg_rr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d", a->rd, a->rj);
+}
+
+static void output_rr_ms_ls(DisasContext *ctx, arg_rr_ms_ls *a,
+                          const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d, %d, %d", a->rd, a->rj, a->ms, a->ls);
+}
+
+static void output_hint_r_i(DisasContext *ctx, arg_hint_r_i *a,
+                            const char *mnemonic)
+{
+    output(ctx, mnemonic, "%d, r%d, %d", a->hint, a->rj, a->imm);
+}
+
+static void output_i(DisasContext *ctx, arg_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "%d", a->imm);
+}
+
+static void output_rr_jk(DisasContext *ctx, arg_rr_jk *a,
+                         const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d", a->rj, a->rk);
+}
+
+static void output_ff(DisasContext *ctx, arg_ff *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "f%d, f%d", a->fd, a->fj);
+}
+
+static void output_fff(DisasContext *ctx, arg_fff *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "f%d, f%d, f%d", a->fd, a->fj, a->fk);
+}
+
+static void output_ffff(DisasContext *ctx, arg_ffff *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "f%d, f%d, f%d, f%d", a->fd, a->fj, a->fk, a->fa);
+}
+
+static void output_fffc(DisasContext *ctx, arg_fffc *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "f%d, f%d, f%d, %d", a->fd, a->fj, a->fk, a->ca);
+}
+
+static void output_fr(DisasContext *ctx, arg_fr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "f%d, r%d", a->fd, a->rj);
+}
+
+static void output_rf(DisasContext *ctx, arg_rf *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, f%d", a->rd, a->fj);
+}
+
+static void output_fcsrd_r(DisasContext *ctx, arg_fcsrd_r *a,
+                           const char *mnemonic)
+{
+    output(ctx, mnemonic, "fcsr%d, r%d", a->fcsrd, a->rj);
+}
+
+static void output_r_fcsrs(DisasContext *ctx, arg_r_fcsrs *a,
+                           const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, fcsr%d", a->rd, a->fcsrs);
+}
+
+static void output_cf(DisasContext *ctx, arg_cf *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "fcc%d, f%d", a->cd, a->fj);
+}
+
+static void output_fc(DisasContext *ctx, arg_fc *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "f%d, fcc%d", a->fd, a->cj);
+}
+
+static void output_cr(DisasContext *ctx, arg_cr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "fcc%d, r%d", a->cd, a->rj);
+}
+
+static void output_rc(DisasContext *ctx, arg_rc *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, fcc%d", a->rd, a->cj);
+}
+
+static void output_frr(DisasContext *ctx, arg_frr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "f%d, r%d, r%d", a->fd, a->rj, a->rk);
+}
+
+static void output_fr_i(DisasContext *ctx, arg_fr_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "f%d, r%d, %d", a->fd, a->rj, a->imm);
+}
+
+static void output_r_offs(DisasContext *ctx, arg_r_offs *a,
+                          const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, %d # 0x%" PRIx64, a->rj, a->offs,
+           ctx->pc + a->offs);
+}
+
+static void output_c_offs(DisasContext *ctx, arg_c_offs *a,
+                          const char *mnemonic)
+{
+    output(ctx, mnemonic, "fcc%d, %d # 0x%" PRIx64, a->cj, a->offs,
+           ctx->pc + a->offs);
+}
+
+static void output_offs(DisasContext *ctx, arg_offs *a,
+                        const char *mnemonic)
+{
+    output(ctx, mnemonic, "%d # 0x%" PRIx64, a->offs, ctx->pc + a->offs);
+}
+
+static void output_rr_offs(DisasContext *ctx, arg_rr_offs *a,
+                           const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d, %d # 0x%" PRIx64, a->rj,
+           a->rd, a->offs, ctx->pc + a->offs);
+}
+
+#define INSN(insn, type)                                    \
+static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
+{                                                           \
+    output_##type(ctx, a, #insn);                           \
+    return true;                                            \
+}
+
+INSN(clo_w,        rr)
+INSN(clz_w,        rr)
+INSN(cto_w,        rr)
+INSN(ctz_w,        rr)
+INSN(clo_d,        rr)
+INSN(clz_d,        rr)
+INSN(cto_d,        rr)
+INSN(ctz_d,        rr)
+INSN(revb_2h,      rr)
+INSN(revb_4h,      rr)
+INSN(revb_2w,      rr)
+INSN(revb_d,       rr)
+INSN(revh_2w,      rr)
+INSN(revh_d,       rr)
+INSN(bitrev_4b,    rr)
+INSN(bitrev_8b,    rr)
+INSN(bitrev_w,     rr)
+INSN(bitrev_d,     rr)
+INSN(ext_w_h,      rr)
+INSN(ext_w_b,      rr)
+INSN(cpucfg,       rr)
+INSN(asrtle_d,     rr_jk)
+INSN(asrtgt_d,     rr_jk)
+INSN(alsl_w,       rrr_sa)
+INSN(alsl_wu,      rrr_sa)
+INSN(bytepick_w,   rrr_sa)
+INSN(bytepick_d,   rrr_sa)
+INSN(add_w,        rrr)
+INSN(add_d,        rrr)
+INSN(sub_w,        rrr)
+INSN(sub_d,        rrr)
+INSN(slt,          rrr)
+INSN(sltu,         rrr)
+INSN(maskeqz,      rrr)
+INSN(masknez,      rrr)
+INSN(nor,          rrr)
+INSN(and,          rrr)
+INSN(or,           rrr)
+INSN(xor,          rrr)
+INSN(orn,          rrr)
+INSN(andn,         rrr)
+INSN(sll_w,        rrr)
+INSN(srl_w,        rrr)
+INSN(sra_w,        rrr)
+INSN(sll_d,        rrr)
+INSN(srl_d,        rrr)
+INSN(sra_d,        rrr)
+INSN(rotr_w,       rrr)
+INSN(rotr_d,       rrr)
+INSN(mul_w,        rrr)
+INSN(mulh_w,       rrr)
+INSN(mulh_wu,      rrr)
+INSN(mul_d,        rrr)
+INSN(mulh_d,       rrr)
+INSN(mulh_du,      rrr)
+INSN(mulw_d_w,     rrr)
+INSN(mulw_d_wu,    rrr)
+INSN(div_w,        rrr)
+INSN(mod_w,        rrr)
+INSN(div_wu,       rrr)
+INSN(mod_wu,       rrr)
+INSN(div_d,        rrr)
+INSN(mod_d,        rrr)
+INSN(div_du,       rrr)
+INSN(mod_du,       rrr)
+INSN(crc_w_b_w,    rrr)
+INSN(crc_w_h_w,    rrr)
+INSN(crc_w_w_w,    rrr)
+INSN(crc_w_d_w,    rrr)
+INSN(crcc_w_b_w,   rrr)
+INSN(crcc_w_h_w,   rrr)
+INSN(crcc_w_w_w,   rrr)
+INSN(crcc_w_d_w,   rrr)
+INSN(break,        i)
+INSN(syscall,      i)
+INSN(alsl_d,       rrr_sa)
+INSN(slli_w,       rr_i)
+INSN(slli_d,       rr_i)
+INSN(srli_w,       rr_i)
+INSN(srli_d,       rr_i)
+INSN(srai_w,       rr_i)
+INSN(srai_d,       rr_i)
+INSN(rotri_w,      rr_i)
+INSN(rotri_d,      rr_i)
+INSN(bstrins_w,    rr_ms_ls)
+INSN(bstrpick_w,   rr_ms_ls)
+INSN(bstrins_d,    rr_ms_ls)
+INSN(bstrpick_d,   rr_ms_ls)
+INSN(fadd_s,       fff)
+INSN(fadd_d,       fff)
+INSN(fsub_s,       fff)
+INSN(fsub_d,       fff)
+INSN(fmul_s,       fff)
+INSN(fmul_d,       fff)
+INSN(fdiv_s,       fff)
+INSN(fdiv_d,       fff)
+INSN(fmax_s,       fff)
+INSN(fmax_d,       fff)
+INSN(fmin_s,       fff)
+INSN(fmin_d,       fff)
+INSN(fmaxa_s,      fff)
+INSN(fmaxa_d,      fff)
+INSN(fmina_s,      fff)
+INSN(fmina_d,      fff)
+INSN(fscaleb_s,    fff)
+INSN(fscaleb_d,    fff)
+INSN(fcopysign_s,  fff)
+INSN(fcopysign_d,  fff)
+INSN(fabs_s,       ff)
+INSN(fabs_d,       ff)
+INSN(fneg_s,       ff)
+INSN(fneg_d,       ff)
+INSN(flogb_s,      ff)
+INSN(flogb_d,      ff)
+INSN(fclass_s,     ff)
+INSN(fclass_d,     ff)
+INSN(fsqrt_s,      ff)
+INSN(fsqrt_d,      ff)
+INSN(frecip_s,     ff)
+INSN(frecip_d,     ff)
+INSN(frsqrt_s,     ff)
+INSN(frsqrt_d,     ff)
+INSN(fmov_s,       ff)
+INSN(fmov_d,       ff)
+INSN(movgr2fr_w,   fr)
+INSN(movgr2fr_d,   fr)
+INSN(movgr2frh_w,  fr)
+INSN(movfr2gr_s,   rf)
+INSN(movfr2gr_d,   rf)
+INSN(movfrh2gr_s,  rf)
+INSN(movgr2fcsr,   fcsrd_r)
+INSN(movfcsr2gr,   r_fcsrs)
+INSN(movfr2cf,     cf)
+INSN(movcf2fr,     fc)
+INSN(movgr2cf,     cr)
+INSN(movcf2gr,     rc)
+INSN(fcvt_s_d,     ff)
+INSN(fcvt_d_s,     ff)
+INSN(ftintrm_w_s,  ff)
+INSN(ftintrm_w_d,  ff)
+INSN(ftintrm_l_s,  ff)
+INSN(ftintrm_l_d,  ff)
+INSN(ftintrp_w_s,  ff)
+INSN(ftintrp_w_d,  ff)
+INSN(ftintrp_l_s,  ff)
+INSN(ftintrp_l_d,  ff)
+INSN(ftintrz_w_s,  ff)
+INSN(ftintrz_w_d,  ff)
+INSN(ftintrz_l_s,  ff)
+INSN(ftintrz_l_d,  ff)
+INSN(ftintrne_w_s, ff)
+INSN(ftintrne_w_d, ff)
+INSN(ftintrne_l_s, ff)
+INSN(ftintrne_l_d, ff)
+INSN(ftint_w_s,    ff)
+INSN(ftint_w_d,    ff)
+INSN(ftint_l_s,    ff)
+INSN(ftint_l_d,    ff)
+INSN(ffint_s_w,    ff)
+INSN(ffint_s_l,    ff)
+INSN(ffint_d_w,    ff)
+INSN(ffint_d_l,    ff)
+INSN(frint_s,      ff)
+INSN(frint_d,      ff)
+INSN(slti,         rr_i)
+INSN(sltui,        rr_i)
+INSN(addi_w,       rr_i)
+INSN(addi_d,       rr_i)
+INSN(lu52i_d,      rr_i)
+INSN(andi,         rr_i)
+INSN(ori,          rr_i)
+INSN(xori,         rr_i)
+INSN(fmadd_s,      ffff)
+INSN(fmadd_d,      ffff)
+INSN(fmsub_s,      ffff)
+INSN(fmsub_d,      ffff)
+INSN(fnmadd_s,     ffff)
+INSN(fnmadd_d,     ffff)
+INSN(fnmsub_s,     ffff)
+INSN(fnmsub_d,     ffff)
+INSN(fsel,         fffc)
+INSN(addu16i_d,    rr_i)
+INSN(lu12i_w,      r_i)
+INSN(lu32i_d,      r_i)
+INSN(pcaddi,       r_i)
+INSN(pcalau12i,    r_i)
+INSN(pcaddu12i,    r_i)
+INSN(pcaddu18i,    r_i)
+INSN(ll_w,         rr_i)
+INSN(sc_w,         rr_i)
+INSN(ll_d,         rr_i)
+INSN(sc_d,         rr_i)
+INSN(ldptr_w,      rr_i)
+INSN(stptr_w,      rr_i)
+INSN(ldptr_d,      rr_i)
+INSN(stptr_d,      rr_i)
+INSN(ld_b,         rr_i)
+INSN(ld_h,         rr_i)
+INSN(ld_w,         rr_i)
+INSN(ld_d,         rr_i)
+INSN(st_b,         rr_i)
+INSN(st_h,         rr_i)
+INSN(st_w,         rr_i)
+INSN(st_d,         rr_i)
+INSN(ld_bu,        rr_i)
+INSN(ld_hu,        rr_i)
+INSN(ld_wu,        rr_i)
+INSN(preld,        hint_r_i)
+INSN(fld_s,        fr_i)
+INSN(fst_s,        fr_i)
+INSN(fld_d,        fr_i)
+INSN(fst_d,        fr_i)
+INSN(ldx_b,        rrr)
+INSN(ldx_h,        rrr)
+INSN(ldx_w,        rrr)
+INSN(ldx_d,        rrr)
+INSN(stx_b,        rrr)
+INSN(stx_h,        rrr)
+INSN(stx_w,        rrr)
+INSN(stx_d,        rrr)
+INSN(ldx_bu,       rrr)
+INSN(ldx_hu,       rrr)
+INSN(ldx_wu,       rrr)
+INSN(fldx_s,       frr)
+INSN(fldx_d,       frr)
+INSN(fstx_s,       frr)
+INSN(fstx_d,       frr)
+INSN(amswap_w,     rrr)
+INSN(amswap_d,     rrr)
+INSN(amadd_w,      rrr)
+INSN(amadd_d,      rrr)
+INSN(amand_w,      rrr)
+INSN(amand_d,      rrr)
+INSN(amor_w,       rrr)
+INSN(amor_d,       rrr)
+INSN(amxor_w,      rrr)
+INSN(amxor_d,      rrr)
+INSN(ammax_w,      rrr)
+INSN(ammax_d,      rrr)
+INSN(ammin_w,      rrr)
+INSN(ammin_d,      rrr)
+INSN(ammax_wu,     rrr)
+INSN(ammax_du,     rrr)
+INSN(ammin_wu,     rrr)
+INSN(ammin_du,     rrr)
+INSN(amswap_db_w,  rrr)
+INSN(amswap_db_d,  rrr)
+INSN(amadd_db_w,   rrr)
+INSN(amadd_db_d,   rrr)
+INSN(amand_db_w,   rrr)
+INSN(amand_db_d,   rrr)
+INSN(amor_db_w,    rrr)
+INSN(amor_db_d,    rrr)
+INSN(amxor_db_w,   rrr)
+INSN(amxor_db_d,   rrr)
+INSN(ammax_db_w,   rrr)
+INSN(ammax_db_d,   rrr)
+INSN(ammin_db_w,   rrr)
+INSN(ammin_db_d,   rrr)
+INSN(ammax_db_wu,  rrr)
+INSN(ammax_db_du,  rrr)
+INSN(ammin_db_wu,  rrr)
+INSN(ammin_db_du,  rrr)
+INSN(dbar,         i)
+INSN(ibar,         i)
+INSN(fldgt_s,      frr)
+INSN(fldgt_d,      frr)
+INSN(fldle_s,      frr)
+INSN(fldle_d,      frr)
+INSN(fstgt_s,      frr)
+INSN(fstgt_d,      frr)
+INSN(fstle_s,      frr)
+INSN(fstle_d,      frr)
+INSN(ldgt_b,       rrr)
+INSN(ldgt_h,       rrr)
+INSN(ldgt_w,       rrr)
+INSN(ldgt_d,       rrr)
+INSN(ldle_b,       rrr)
+INSN(ldle_h,       rrr)
+INSN(ldle_w,       rrr)
+INSN(ldle_d,       rrr)
+INSN(stgt_b,       rrr)
+INSN(stgt_h,       rrr)
+INSN(stgt_w,       rrr)
+INSN(stgt_d,       rrr)
+INSN(stle_b,       rrr)
+INSN(stle_h,       rrr)
+INSN(stle_w,       rrr)
+INSN(stle_d,       rrr)
+INSN(beqz,         r_offs)
+INSN(bnez,         r_offs)
+INSN(bceqz,        c_offs)
+INSN(bcnez,        c_offs)
+INSN(jirl,         rr_offs)
+INSN(b,            offs)
+INSN(bl,           offs)
+INSN(beq,          rr_offs)
+INSN(bne,          rr_offs)
+INSN(blt,          rr_offs)
+INSN(bge,          rr_offs)
+INSN(bltu,         rr_offs)
+INSN(bgeu,         rr_offs)
+
+#define output_fcmp(C, PREFIX, SUFFIX)                                         \
+{                                                                              \
+    (C)->info->fprintf_func((C)->info->stream, "%08x   %s%s\tfcc%d, f%d, f%d", \
+                            (C)->insn, PREFIX, SUFFIX, a->cd,                  \
+                            a->fj, a->fk);                                     \
+}
+
+static bool output_cff_fcond(DisasContext *ctx, arg_cff_fcond * a,
+                               const char *suffix)
+{
+    bool ret = true;
+    switch (a->fcond) {
+    case 0x0:
+        output_fcmp(ctx, "fcmp_caf_", suffix);
+        break;
+    case 0x1:
+        output_fcmp(ctx, "fcmp_saf_", suffix);
+        break;
+    case 0x2:
+        output_fcmp(ctx, "fcmp_clt_", suffix);
+        break;
+    case 0x3:
+        output_fcmp(ctx, "fcmp_slt_", suffix);
+        break;
+    case 0x4:
+        output_fcmp(ctx, "fcmp_ceq_", suffix);
+        break;
+    case 0x5:
+        output_fcmp(ctx, "fcmp_seq_", suffix);
+        break;
+    case 0x6:
+        output_fcmp(ctx, "fcmp_cle_", suffix);
+        break;
+    case 0x7:
+        output_fcmp(ctx, "fcmp_sle_", suffix);
+        break;
+    case 0x8:
+        output_fcmp(ctx, "fcmp_cun_", suffix);
+        break;
+    case 0x9:
+        output_fcmp(ctx, "fcmp_sun_", suffix);
+        break;
+    case 0xA:
+        output_fcmp(ctx, "fcmp_cult_", suffix);
+        break;
+    case 0xB:
+        output_fcmp(ctx, "fcmp_sult_", suffix);
+        break;
+    case 0xC:
+        output_fcmp(ctx, "fcmp_cueq_", suffix);
+        break;
+    case 0xD:
+        output_fcmp(ctx, "fcmp_sueq_", suffix);
+        break;
+    case 0xE:
+        output_fcmp(ctx, "fcmp_cule_", suffix);
+        break;
+    case 0xF:
+        output_fcmp(ctx, "fcmp_sule_", suffix);
+        break;
+    case 0x10:
+        output_fcmp(ctx, "fcmp_cne_", suffix);
+        break;
+    case 0x11:
+        output_fcmp(ctx, "fcmp_sne_", suffix);
+        break;
+    case 0x14:
+        output_fcmp(ctx, "fcmp_cor_", suffix);
+        break;
+    case 0x15:
+        output_fcmp(ctx, "fcmp_sor_", suffix);
+        break;
+    case 0x18:
+        output_fcmp(ctx, "fcmp_cune_", suffix);
+        break;
+    case 0x19:
+        output_fcmp(ctx, "fcmp_sune_", suffix);
+        break;
+    default:
+        ret = false;
+    }
+    return ret;
+}
+
+#define FCMP_INSN(suffix)                               \
+static bool trans_fcmp_cond_##suffix(DisasContext *ctx, \
+                                     arg_cff_fcond * a) \
+{                                                       \
+    return output_cff_fcond(ctx, a, #suffix);           \
+}
+
+FCMP_INSN(s)
+FCMP_INSN(d)
-- 
2.34.1


