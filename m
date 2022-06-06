Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D653F280
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:23:49 +0200 (CEST)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyM4a-00089o-2p
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw5-0001Qq-HT
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw3-0003jn-2F
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:01 -0400
Received: by mail-pl1-x633.google.com with SMTP id w3so13307914plp.13
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FNNyVYWBtJhSU+LRfak3MwvAaHKmRxCyAMsDTN3JP9s=;
 b=XlgSVRRvdlACL4llDlBiI3KVQWVlta9YIOOfL4pm78c2S+2bkegCDyfYBO74WN97vE
 7/cRG3JkluorfMAv0v06KBls2Shdm2q2XEUgwFmM8PyIV+5D31WDHPUbLKe1J6p1810J
 DgfqNp15J8MhHACBzppXhXZZg0hACM4vLf4BrckIqk0Cz0ykK2I2lZ3RQGhA9tIEw54C
 OSeBDTZjT1f3qHGnGQgpFOQR1mWAQJFW/6peFogggqEJqqkWA0JREnZtzKl8USL42c8i
 otUjZcsyE5tyJO0MgIviaKwsK8UlG5uormRKsV8qVoC/+hEUycPzIxCPxTSop9OuIHzd
 F7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FNNyVYWBtJhSU+LRfak3MwvAaHKmRxCyAMsDTN3JP9s=;
 b=mFb76ES8P5WuR22ayCyeGrZpJ+ygGgUHzFqlEAOLNvtTd1Q241Q9stvqz4WdlWEu62
 BOVYFfKaH8HoOsb6q+9+ifAKCH6JNj2xttm1gAaeN0i0oyXElVmCpwSElIrrMq4fGLf/
 UqW9VDHbXzv0ozgiWoqbGK8wB5QvwJTZ+Dn4DSCdmH0+yLaABHfNTOBg2G1Q3Wks++cT
 nAs4u53xOmbXe6fgVo9mX5zhnxqr1RYkz0qj3eNykV2Y6NOHuz6emOppnbZ4TCxNmnsm
 WyCtLqGjvYOwrUNqQ2UMtHMUsacCk15fGnlHBERIxjxJrzYoXGkR3Z+9WZm6/R2FUro1
 mVgg==
X-Gm-Message-State: AOAM533uo9VfDG34u2ZuqH4RSzJDadYzdN0deq6f/QwueLC61oLHRXkU
 eQlCynxnU53ci2JsB7ZQFULd/hIXQns6iQ==
X-Google-Smtp-Source: ABdhPJwxfFroxQ1e7S5vyuLBEYuqwo/WNDZpZWOnNczaj0g7XuC7VFG5dy3g/TKPjo5E6Fh92KHP8Q==
X-Received: by 2002:a17:90a:14a5:b0:1e0:af2a:50ee with SMTP id
 k34-20020a17090a14a500b001e0af2a50eemr64266040pja.66.1654557297706; 
 Mon, 06 Jun 2022 16:14:57 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:14:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 06/43] target/loongarch: Add fixed point bit instruction
 translation
Date: Mon,  6 Jun 2022 16:14:13 -0700
Message-Id: <20220606231450.448443-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
- EXT.W.{B/H}
- CL{O/Z}.{W/D}, CT{O/Z}.{W/D}
- BYTEPICK.{W/D}
- REVB.{2H/4H/2W/D}
- REVH.{2W/D}
- BITREV.{4B/8B}, BITREV.{W/D}
- BSTRINS.{W/D}, BSTRPICK.{W/D}
- MASKEQZ, MASKNEZ

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-7-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                   |   4 +
 target/loongarch/insns.decode               |  39 ++++
 target/loongarch/op_helper.c                |  21 ++
 target/loongarch/translate.c                |   1 +
 target/loongarch/insn_trans/trans_bit.c.inc | 212 ++++++++++++++++++++
 5 files changed, 277 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_bit.c.inc

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index eb771c0628..04e0245d5e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -4,3 +4,7 @@
  */
 
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
+
+DEF_HELPER_FLAGS_1(bitrev_w, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(bitrev_d, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 673aee4be5..b0bed5531b 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -14,13 +14,16 @@
 # Argument sets
 #
 &r_i          rd imm
+&rr           rd rj
 &rrr          rd rj rk
 &rr_i         rd rj imm
 &rrr_sa       rd rj rk sa
+&rr_ms_ls     rd rj ms ls
 
 #
 # Formats
 #
+@rr               .... ........ ..... ..... rj:5 rd:5    &rr
 @rrr               .... ........ ..... rk:5 rj:5 rd:5    &rrr
 @r_i20                          .... ... imm:s20 rd:5    &r_i
 @rr_ui5           .... ........ ..... imm:5 rj:5 rd:5    &rr_i
@@ -29,6 +32,10 @@
 @rr_ui12                 .... ...... imm:12 rj:5 rd:5    &rr_i
 @rr_i16                     .... .. imm:s16 rj:5 rd:5    &rr_i
 @rrr_sa2p1        .... ........ ... .. rk:5 rj:5 rd:5    &rrr_sa  sa=%sa2p1
+@rrr_sa2        .... ........ ... sa:2 rk:5 rj:5 rd:5    &rrr_sa
+@rrr_sa3         .... ........ .. sa:3 rk:5 rj:5 rd:5    &rrr_sa
+@rr_2bw            .... ....... ms:5 . ls:5 rj:5 rd:5    &rr_ms_ls
+@rr_2bd               .... ...... ms:6 ls:6 rj:5 rd:5    &rr_ms_ls
 
 #
 # Fixed point arithmetic operation instruction
@@ -99,3 +106,35 @@ srai_w          0000 00000100 10001 ..... ..... .....    @rr_ui5
 srai_d          0000 00000100 1001 ...... ..... .....    @rr_ui6
 rotri_w         0000 00000100 11001 ..... ..... .....    @rr_ui5
 rotri_d         0000 00000100 1101 ...... ..... .....    @rr_ui6
+
+#
+# Fixed point bit operation instruction
+#
+ext_w_h         0000 00000000 00000 10110 ..... .....    @rr
+ext_w_b         0000 00000000 00000 10111 ..... .....    @rr
+clo_w           0000 00000000 00000 00100 ..... .....    @rr
+clz_w           0000 00000000 00000 00101 ..... .....    @rr
+cto_w           0000 00000000 00000 00110 ..... .....    @rr
+ctz_w           0000 00000000 00000 00111 ..... .....    @rr
+clo_d           0000 00000000 00000 01000 ..... .....    @rr
+clz_d           0000 00000000 00000 01001 ..... .....    @rr
+cto_d           0000 00000000 00000 01010 ..... .....    @rr
+ctz_d           0000 00000000 00000 01011 ..... .....    @rr
+revb_2h         0000 00000000 00000 01100 ..... .....    @rr
+revb_4h         0000 00000000 00000 01101 ..... .....    @rr
+revb_2w         0000 00000000 00000 01110 ..... .....    @rr
+revb_d          0000 00000000 00000 01111 ..... .....    @rr
+revh_2w         0000 00000000 00000 10000 ..... .....    @rr
+revh_d          0000 00000000 00000 10001 ..... .....    @rr
+bitrev_4b       0000 00000000 00000 10010 ..... .....    @rr
+bitrev_8b       0000 00000000 00000 10011 ..... .....    @rr
+bitrev_w        0000 00000000 00000 10100 ..... .....    @rr
+bitrev_d        0000 00000000 00000 10101 ..... .....    @rr
+bytepick_w      0000 00000000 100 .. ..... ..... .....   @rrr_sa2
+bytepick_d      0000 00000000 11 ... ..... ..... .....   @rrr_sa3
+maskeqz         0000 00000001 00110 ..... ..... .....    @rrr
+masknez         0000 00000001 00111 ..... ..... .....    @rrr
+bstrins_w       0000 0000011 ..... 0 ..... ..... .....   @rr_2bw
+bstrpick_w      0000 0000011 ..... 1 ..... ..... .....   @rr_2bw
+bstrins_d       0000 000010 ...... ...... ..... .....    @rr_2bd
+bstrpick_d      0000 000011 ...... ...... ..... .....    @rr_2bd
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 903810951e..f4b22c70a0 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -19,3 +19,24 @@ void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
 {
     do_raise_exception(env, exception, GETPC());
 }
+
+target_ulong helper_bitrev_w(target_ulong rj)
+{
+    return (int32_t)revbit32(rj);
+}
+
+target_ulong helper_bitrev_d(target_ulong rj)
+{
+    return revbit64(rj);
+}
+
+target_ulong helper_bitswap(target_ulong v)
+{
+    v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
+        ((v & (target_ulong)0x5555555555555555ULL) << 1);
+    v = ((v >> 2) & (target_ulong)0x3333333333333333ULL) |
+        ((v & (target_ulong)0x3333333333333333ULL) << 2);
+    v = ((v >> 4) & (target_ulong)0x0F0F0F0F0F0F0F0FULL) |
+        ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
+    return v;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index d5640d5d79..88afd9b3a8 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -147,6 +147,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "decode-insns.c.inc"
 #include "insn_trans/trans_arith.c.inc"
 #include "insn_trans/trans_shift.c.inc"
+#include "insn_trans/trans_bit.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
new file mode 100644
index 0000000000..9337714ec4
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_bit.c.inc
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_rr(DisasContext *ctx, arg_rr *a,
+                   DisasExtend src_ext, DisasExtend dst_ext,
+                   void (*func)(TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+
+    func(dest, src1);
+    gen_set_gpr(a->rd, dest, dst_ext);
+
+    return true;
+}
+
+static void gen_bytepick_w(TCGv dest, TCGv src1, TCGv src2, target_long sa)
+{
+    tcg_gen_concat_tl_i64(dest, src1, src2);
+    tcg_gen_sextract_i64(dest, dest, (32 - sa * 8), 32);
+}
+
+static void gen_bytepick_d(TCGv dest, TCGv src1, TCGv src2, target_long sa)
+{
+    tcg_gen_extract2_i64(dest, src1, src2, (64 - sa * 8));
+}
+
+static void gen_bstrins(TCGv dest, TCGv src1,
+                        unsigned int ls, unsigned int len)
+{
+    tcg_gen_deposit_tl(dest, dest, src1, ls, len);
+}
+
+static bool gen_rr_ms_ls(DisasContext *ctx, arg_rr_ms_ls *a,
+                         DisasExtend src_ext, DisasExtend dst_ext,
+                         void (*func)(TCGv, TCGv, unsigned int, unsigned int))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+
+    if (a->ls > a->ms) {
+        return false;
+    }
+
+    func(dest, src1, a->ls, a->ms - a->ls + 1);
+    gen_set_gpr(a->rd, dest, dst_ext);
+
+    return true;
+}
+
+static void gen_clz_w(TCGv dest, TCGv src1)
+{
+    tcg_gen_clzi_tl(dest, src1, TARGET_LONG_BITS);
+    tcg_gen_subi_tl(dest, dest, TARGET_LONG_BITS - 32);
+}
+
+static void gen_clo_w(TCGv dest, TCGv src1)
+{
+    tcg_gen_not_tl(dest, src1);
+    tcg_gen_ext32u_tl(dest, dest);
+    gen_clz_w(dest, dest);
+}
+
+static void gen_ctz_w(TCGv dest, TCGv src1)
+{
+    tcg_gen_ori_tl(dest, src1, (target_ulong)MAKE_64BIT_MASK(32, 32));
+    tcg_gen_ctzi_tl(dest, dest, TARGET_LONG_BITS);
+}
+
+static void gen_cto_w(TCGv dest, TCGv src1)
+{
+    tcg_gen_not_tl(dest, src1);
+    gen_ctz_w(dest, dest);
+}
+
+static void gen_clz_d(TCGv dest, TCGv src1)
+{
+    tcg_gen_clzi_i64(dest, src1, TARGET_LONG_BITS);
+}
+
+static void gen_clo_d(TCGv dest, TCGv src1)
+{
+    tcg_gen_not_tl(dest, src1);
+    gen_clz_d(dest, dest);
+}
+
+static void gen_ctz_d(TCGv dest, TCGv src1)
+{
+    tcg_gen_ctzi_tl(dest, src1, TARGET_LONG_BITS);
+}
+
+static void gen_cto_d(TCGv dest, TCGv src1)
+{
+    tcg_gen_not_tl(dest, src1);
+    gen_ctz_d(dest, dest);
+}
+
+static void gen_revb_2w(TCGv dest, TCGv src1)
+{
+    tcg_gen_bswap64_i64(dest, src1);
+    tcg_gen_rotri_i64(dest, dest, 32);
+}
+
+static void gen_revb_2h(TCGv dest, TCGv src1)
+{
+    TCGv mask = tcg_constant_tl(0x00FF00FF);
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    tcg_gen_shri_tl(t0, src1, 8);
+    tcg_gen_and_tl(t0, t0, mask);
+    tcg_gen_and_tl(t1, src1, mask);
+    tcg_gen_shli_tl(t1, t1, 8);
+    tcg_gen_or_tl(dest, t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_revb_4h(TCGv dest, TCGv src1)
+{
+    TCGv mask = tcg_constant_tl(0x00FF00FF00FF00FFULL);
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    tcg_gen_shri_tl(t0, src1, 8);
+    tcg_gen_and_tl(t0, t0, mask);
+    tcg_gen_and_tl(t1, src1, mask);
+    tcg_gen_shli_tl(t1, t1, 8);
+    tcg_gen_or_tl(dest, t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_revh_2w(TCGv dest, TCGv src1)
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 mask = tcg_constant_i64(0x0000ffff0000ffffull);
+
+    tcg_gen_shri_i64(t0, src1, 16);
+    tcg_gen_and_i64(t1, src1, mask);
+    tcg_gen_and_i64(t0, t0, mask);
+    tcg_gen_shli_i64(t1, t1, 16);
+    tcg_gen_or_i64(dest, t1, t0);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
+
+static void gen_revh_d(TCGv dest, TCGv src1)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv mask = tcg_constant_tl(0x0000FFFF0000FFFFULL);
+
+    tcg_gen_shri_tl(t1, src1, 16);
+    tcg_gen_and_tl(t1, t1, mask);
+    tcg_gen_and_tl(t0, src1, mask);
+    tcg_gen_shli_tl(t0, t0, 16);
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_gen_rotri_tl(dest, t0, 32);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_maskeqz(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, zero, zero, src1);
+}
+
+static void gen_masknez(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, zero, zero, src1);
+}
+
+TRANS(ext_w_h, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_ext16s_tl)
+TRANS(ext_w_b, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_ext8s_tl)
+TRANS(clo_w, gen_rr, EXT_NONE, EXT_NONE, gen_clo_w)
+TRANS(clz_w, gen_rr, EXT_ZERO, EXT_NONE, gen_clz_w)
+TRANS(cto_w, gen_rr, EXT_NONE, EXT_NONE, gen_cto_w)
+TRANS(ctz_w, gen_rr, EXT_NONE, EXT_NONE, gen_ctz_w)
+TRANS(clo_d, gen_rr, EXT_NONE, EXT_NONE, gen_clo_d)
+TRANS(clz_d, gen_rr, EXT_NONE, EXT_NONE, gen_clz_d)
+TRANS(cto_d, gen_rr, EXT_NONE, EXT_NONE, gen_cto_d)
+TRANS(ctz_d, gen_rr, EXT_NONE, EXT_NONE, gen_ctz_d)
+TRANS(revb_2h, gen_rr, EXT_NONE, EXT_SIGN, gen_revb_2h)
+TRANS(revb_4h, gen_rr, EXT_NONE, EXT_NONE, gen_revb_4h)
+TRANS(revb_2w, gen_rr, EXT_NONE, EXT_NONE, gen_revb_2w)
+TRANS(revb_d, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_bswap64_i64)
+TRANS(revh_2w, gen_rr, EXT_NONE, EXT_NONE, gen_revh_2w)
+TRANS(revh_d, gen_rr, EXT_NONE, EXT_NONE, gen_revh_d)
+TRANS(bitrev_4b, gen_rr, EXT_ZERO, EXT_SIGN, gen_helper_bitswap)
+TRANS(bitrev_8b, gen_rr, EXT_NONE, EXT_NONE, gen_helper_bitswap)
+TRANS(bitrev_w, gen_rr, EXT_NONE, EXT_SIGN, gen_helper_bitrev_w)
+TRANS(bitrev_d, gen_rr, EXT_NONE, EXT_NONE, gen_helper_bitrev_d)
+TRANS(maskeqz, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
+TRANS(masknez, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
+TRANS(bytepick_w, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
+TRANS(bytepick_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_d)
+TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
+TRANS(bstrins_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
+TRANS(bstrpick_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, tcg_gen_extract_tl)
+TRANS(bstrpick_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, tcg_gen_extract_tl)
-- 
2.34.1


