Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E353F274
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:17:37 +0200 (CEST)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyLya-0004Y1-It
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw7-0001Sn-Bg
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:03 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw4-0003jv-7r
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:02 -0400
Received: by mail-pg1-x536.google.com with SMTP id c14so14157864pgu.13
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g5Ik5FSfGfo3qFPpTu+te67A1cJjS/y43NUlSlc+gyA=;
 b=H91ctl8fvyQDNYWAnXcsW8N7YBoyemXs6MPjL+f99BPJjzUJWPQp6goCYED9/u6fT6
 ufGfeRap/a8ZlB3dTAbY3vJLo3YIL/WKHaE/d0sYZ/hLsOwYXH0/3B3cLzgnJMHo4qGS
 wAKiCbUbuHL/ynGJru/MNjZc5yRFQj83ayC2WVGSo4KmFq4hdxfVfIc1CByb79Pg9tB3
 rhY+cPZwFsJUvJqYMuvtjXNmoEqDTMyW94GjJrqX5txmzk1xl+7uCP1bXvNaHS8Zybbn
 tLbnlpKHMK02ZgGYfj8xuJX57t++ux5IAeE2U++0UTsgiRZsfFc5rYto3wMxND8nRvBt
 XG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5Ik5FSfGfo3qFPpTu+te67A1cJjS/y43NUlSlc+gyA=;
 b=NYFcPiIJlcwpMFJ9YD3sB5z2HyQblOfgoWXMFeP1OkU5fWLlKFUy//ALHTtldhIxrI
 UJI2qAB4UEVGogQnZF5lPF77MZY1F2uhKx0gbiokt126tR4TTZI9kEKhVZcF4gzNv0zx
 u0i9IPHQIJHAvtPoDdOZJz9NNglIvsenI2TJD6Lyj6R2ku/khXxO3cSxfDS7s5RVOjK1
 LvPPtDxFOGsANGhN+DrwMdzfyM3EYyVsLLWcRe3BhmCJxhpDYUmPqCGn1PP6pzzvzsBW
 0p1Huxw5qBNS9eSt5D+BNl76g2SPyoEOSh3Ig+0+giMKvmYZiVJ77LXD1Nwkme5RotOx
 gMkw==
X-Gm-Message-State: AOAM533os7D76IhK8eTeV88+6cFFKOyacWdG+/+pAXK+HrvrcNCr9HxU
 xXTPMO/gBA4xEBXhr9ekHyWqLVzFMdblHQ==
X-Google-Smtp-Source: ABdhPJw4HYFqiFNCtVHGKbuR7PBA++9MoR/HqCBT7cZNDbrE8FgW8sFE9wcAPnX7M9IpjuoVZIcl6g==
X-Received: by 2002:a63:2a8d:0:b0:3f9:d9f9:a5c4 with SMTP id
 q135-20020a632a8d000000b003f9d9f9a5c4mr22570246pgq.614.1654557298780; 
 Mon, 06 Jun 2022 16:14:58 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:14:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 07/43] target/loongarch: Add fixed point load/store instruction
 translation
Date: Mon,  6 Jun 2022 16:14:14 -0700
Message-Id: <20220606231450.448443-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

This includes:
- LD.{B[U]/H[U]/W[U]/D}, ST.{B/H/W/D}
- LDX.{B[U]/H[U]/W[U]/D}, STX.{B/H/W/D}
- LDPTR.{W/D}, STPTR.{W/D}
- PRELD
- LD{GT/LE}.{B/H/W/D}, ST{GT/LE}.{B/H/W/D}
- DBAR, IBAR

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-8-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                     |   3 +
 target/loongarch/insns.decode                 |  55 +++++
 target/loongarch/op_helper.c                  |  15 ++
 target/loongarch/translate.c                  |   6 +
 .../loongarch/insn_trans/trans_memory.c.inc   | 229 ++++++++++++++++++
 5 files changed, 308 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_memory.c.inc

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 04e0245d5e..100622bfc2 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -8,3 +8,6 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_FLAGS_1(bitrev_w, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(bitrev_d, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
+
+DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index b0bed5531b..1156e6965c 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -8,21 +8,25 @@
 #
 # Fields
 #
+%i14s2     10:s14       !function=shl_2
 %sa2p1     15:2         !function=plus_1
 
 #
 # Argument sets
 #
+&i            imm
 &r_i          rd imm
 &rr           rd rj
 &rrr          rd rj rk
 &rr_i         rd rj imm
+&hint_r_i     hint rj imm
 &rrr_sa       rd rj rk sa
 &rr_ms_ls     rd rj ms ls
 
 #
 # Formats
 #
+@i15                       .... ........ ..... imm:15    &i
 @rr               .... ........ ..... ..... rj:5 rd:5    &rr
 @rrr               .... ........ ..... rk:5 rj:5 rd:5    &rrr
 @r_i20                          .... ... imm:s20 rd:5    &r_i
@@ -30,7 +34,9 @@
 @rr_ui6            .... ........ .... imm:6 rj:5 rd:5    &rr_i
 @rr_i12                 .... ...... imm:s12 rj:5 rd:5    &rr_i
 @rr_ui12                 .... ...... imm:12 rj:5 rd:5    &rr_i
+@rr_i14s2         .... ....  .............. rj:5 rd:5    &rr_i imm=%i14s2
 @rr_i16                     .... .. imm:s16 rj:5 rd:5    &rr_i
+@hint_r_i12           .... ...... imm:s12 rj:5 hint:5    &hint_r_i
 @rrr_sa2p1        .... ........ ... .. rk:5 rj:5 rd:5    &rrr_sa  sa=%sa2p1
 @rrr_sa2        .... ........ ... sa:2 rk:5 rj:5 rd:5    &rrr_sa
 @rrr_sa3         .... ........ .. sa:3 rk:5 rj:5 rd:5    &rrr_sa
@@ -138,3 +144,52 @@ bstrins_w       0000 0000011 ..... 0 ..... ..... .....   @rr_2bw
 bstrpick_w      0000 0000011 ..... 1 ..... ..... .....   @rr_2bw
 bstrins_d       0000 000010 ...... ...... ..... .....    @rr_2bd
 bstrpick_d      0000 000011 ...... ...... ..... .....    @rr_2bd
+
+#
+# Fixed point load/store instruction
+#
+ld_b            0010 100000 ............ ..... .....     @rr_i12
+ld_h            0010 100001 ............ ..... .....     @rr_i12
+ld_w            0010 100010 ............ ..... .....     @rr_i12
+ld_d            0010 100011 ............ ..... .....     @rr_i12
+st_b            0010 100100 ............ ..... .....     @rr_i12
+st_h            0010 100101 ............ ..... .....     @rr_i12
+st_w            0010 100110 ............ ..... .....     @rr_i12
+st_d            0010 100111 ............ ..... .....     @rr_i12
+ld_bu           0010 101000 ............ ..... .....     @rr_i12
+ld_hu           0010 101001 ............ ..... .....     @rr_i12
+ld_wu           0010 101010 ............ ..... .....     @rr_i12
+ldx_b           0011 10000000 00000 ..... ..... .....    @rrr
+ldx_h           0011 10000000 01000 ..... ..... .....    @rrr
+ldx_w           0011 10000000 10000 ..... ..... .....    @rrr
+ldx_d           0011 10000000 11000 ..... ..... .....    @rrr
+stx_b           0011 10000001 00000 ..... ..... .....    @rrr
+stx_h           0011 10000001 01000 ..... ..... .....    @rrr
+stx_w           0011 10000001 10000 ..... ..... .....    @rrr
+stx_d           0011 10000001 11000 ..... ..... .....    @rrr
+ldx_bu          0011 10000010 00000 ..... ..... .....    @rrr
+ldx_hu          0011 10000010 01000 ..... ..... .....    @rrr
+ldx_wu          0011 10000010 10000 ..... ..... .....    @rrr
+preld           0010 101011 ............ ..... .....     @hint_r_i12
+dbar            0011 10000111 00100 ...............      @i15
+ibar            0011 10000111 00101 ...............      @i15
+ldptr_w         0010 0100 .............. ..... .....     @rr_i14s2
+stptr_w         0010 0101 .............. ..... .....     @rr_i14s2
+ldptr_d         0010 0110 .............. ..... .....     @rr_i14s2
+stptr_d         0010 0111 .............. ..... .....     @rr_i14s2
+ldgt_b          0011 10000111 10000 ..... ..... .....    @rrr
+ldgt_h          0011 10000111 10001 ..... ..... .....    @rrr
+ldgt_w          0011 10000111 10010 ..... ..... .....    @rrr
+ldgt_d          0011 10000111 10011 ..... ..... .....    @rrr
+ldle_b          0011 10000111 10100 ..... ..... .....    @rrr
+ldle_h          0011 10000111 10101 ..... ..... .....    @rrr
+ldle_w          0011 10000111 10110 ..... ..... .....    @rrr
+ldle_d          0011 10000111 10111 ..... ..... .....    @rrr
+stgt_b          0011 10000111 11000 ..... ..... .....    @rrr
+stgt_h          0011 10000111 11001 ..... ..... .....    @rrr
+stgt_w          0011 10000111 11010 ..... ..... .....    @rrr
+stgt_d          0011 10000111 11011 ..... ..... .....    @rrr
+stle_b          0011 10000111 11100 ..... ..... .....    @rrr
+stle_h          0011 10000111 11101 ..... ..... .....    @rrr
+stle_w          0011 10000111 11110 ..... ..... .....    @rrr
+stle_d          0011 10000111 11111 ..... ..... .....    @rrr
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index f4b22c70a0..bd2db783c9 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -40,3 +40,18 @@ target_ulong helper_bitswap(target_ulong v)
         ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
     return v;
 }
+
+/* loongarch assert op */
+void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
+{
+    if (rj > rk) {
+        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+    }
+}
+
+void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
+{
+    if (rj <= rk) {
+        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+    }
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 88afd9b3a8..b8fed26699 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -31,6 +31,11 @@ static inline int plus_1(DisasContext *ctx, int x)
     return x + 1;
 }
 
+static inline int shl_2(DisasContext *ctx, int x)
+{
+    return x << 2;
+}
+
 void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
@@ -148,6 +153,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_arith.c.inc"
 #include "insn_trans/trans_shift.c.inc"
 #include "insn_trans/trans_bit.c.inc"
+#include "insn_trans/trans_memory.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
diff --git a/target/loongarch/insn_trans/trans_memory.c.inc b/target/loongarch/insn_trans/trans_memory.c.inc
new file mode 100644
index 0000000000..10914acf52
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_memory.c.inc
@@ -0,0 +1,229 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_load(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+
+    return true;
+}
+
+static bool gen_store(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+
+    return true;
+}
+
+static bool gen_loadx(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+static bool gen_storex(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
+static bool gen_load_gt(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, src1, ctx->mem_idx, mop);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static bool gen_load_le(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, src1, ctx->mem_idx, mop);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static bool gen_store_gt(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_qemu_st_tl(data, src1, ctx->mem_idx, mop);
+
+    return true;
+}
+
+static bool gen_store_le(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_qemu_st_tl(data, src1, ctx->mem_idx, mop);
+
+    return true;
+}
+
+static bool trans_preld(DisasContext *ctx, arg_preld *a)
+{
+    return true;
+}
+
+static bool trans_dbar(DisasContext *ctx, arg_dbar * a)
+{
+    tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
+    return true;
+}
+
+static bool trans_ibar(DisasContext *ctx, arg_ibar *a)
+{
+    ctx->base.is_jmp = DISAS_STOP;
+    return true;
+}
+
+static bool gen_ldptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+
+    return true;
+}
+
+static bool gen_stptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->im);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+
+    return true;
+}
+
+TRANS(ld_b, gen_load, MO_SB)
+TRANS(ld_h, gen_load, MO_TESW)
+TRANS(ld_w, gen_load, MO_TESL)
+TRANS(ld_d, gen_load, MO_TEUQ)
+TRANS(st_b, gen_store, MO_UB)
+TRANS(st_h, gen_store, MO_TEUW)
+TRANS(st_w, gen_store, MO_TEUL)
+TRANS(st_d, gen_store, MO_TEUQ)
+TRANS(ld_bu, gen_load, MO_UB)
+TRANS(ld_hu, gen_load, MO_TEUW)
+TRANS(ld_wu, gen_load, MO_TEUL)
+TRANS(ldx_b, gen_loadx, MO_SB)
+TRANS(ldx_h, gen_loadx, MO_TESW)
+TRANS(ldx_w, gen_loadx, MO_TESL)
+TRANS(ldx_d, gen_loadx, MO_TEUQ)
+TRANS(stx_b, gen_storex, MO_UB)
+TRANS(stx_h, gen_storex, MO_TEUW)
+TRANS(stx_w, gen_storex, MO_TEUL)
+TRANS(stx_d, gen_storex, MO_TEUQ)
+TRANS(ldx_bu, gen_loadx, MO_UB)
+TRANS(ldx_hu, gen_loadx, MO_TEUW)
+TRANS(ldx_wu, gen_loadx, MO_TEUL)
+TRANS(ldptr_w, gen_ldptr, MO_TESL)
+TRANS(stptr_w, gen_stptr, MO_TEUL)
+TRANS(ldptr_d, gen_ldptr, MO_TEUQ)
+TRANS(stptr_d, gen_stptr, MO_TEUQ)
+TRANS(ldgt_b, gen_load_gt, MO_SB)
+TRANS(ldgt_h, gen_load_gt, MO_TESW)
+TRANS(ldgt_w, gen_load_gt, MO_TESL)
+TRANS(ldgt_d, gen_load_gt, MO_TEUQ)
+TRANS(ldle_b, gen_load_le, MO_SB)
+TRANS(ldle_h, gen_load_le, MO_TESW)
+TRANS(ldle_w, gen_load_le, MO_TESL)
+TRANS(ldle_d, gen_load_le, MO_TEUQ)
+TRANS(stgt_b, gen_store_gt, MO_UB)
+TRANS(stgt_h, gen_store_gt, MO_TEUW)
+TRANS(stgt_w, gen_store_gt, MO_TEUL)
+TRANS(stgt_d, gen_store_gt, MO_TEUQ)
+TRANS(stle_b, gen_store_le, MO_UB)
+TRANS(stle_h, gen_store_le, MO_TEUW)
+TRANS(stle_w, gen_store_le, MO_TEUL)
+TRANS(stle_d, gen_store_le, MO_TEUQ)
-- 
2.34.1


