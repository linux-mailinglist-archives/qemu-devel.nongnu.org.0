Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1E6AB3C4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuk-0006JQ-RP; Sun, 05 Mar 2023 19:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytx-0004Vv-19
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:29 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytu-0006ZS-Bz
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:28 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so8530887pla.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBxa9IbK2QO5Et18BBQ58sge4bzUIvwxdB1hRrW4Uf0=;
 b=m9Cj/CXYkPfNoT4ZkYSsSTunlDBV3V70tz/BX4p9JdT9vgwJNEK2AwQ4nQqfG3nouD
 bfWttCn+C5aXqmPVt+H7ijVRZXRhVZFookPyU2HCDM31SejXYIH5SZrfauoKxn1JDxPZ
 CjyhUXQIQl6Qkh1e3Rphjqvtr24DgO51lxtrH7mtQl49XsDF4yz6/285T5d62HwCjYA9
 ZVgY1PH8AD6lEzScMfG9c2fhxlvOXYOu6k/Gz6orWF0efOvOGXyK54ckZRi3WqF+VZHd
 560uf9zrqlEhG4aM7HjR8W4U2/lKtJGJema52dfa7GpmvkBEEoac73+7UsOqpPK03qcw
 dDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yBxa9IbK2QO5Et18BBQ58sge4bzUIvwxdB1hRrW4Uf0=;
 b=d0AhowOlJcG3BnGRTNgbiq8jfXR8LEJIu8+ubsA8brB1ClIH3c2Hamquqoef8vIbIO
 qxY1AKtenmrtjCkq3CGul6SFFm5F8/tqwQo1JUu+TWdsc4/BlQYmf2BC8B9NHjS8KzQd
 LQOeAs2I6xyGRpE+vTvMnlmHaEI9lQyCIeXtrTptvwFktbQb4jWYx0P416l77TAvwj74
 e9jTlinuFsVZURriDJJnqaayJNvxHokcZxcn49FWBP0tZYm4G2h3IjoPwRyroHdSrvDB
 Bk/EFEVRvwswJTLyd1ElZFyD0vH2qXLdUmqr4B0gZ54YYXoFbpja7Eac96Vi2CYQPbAT
 9yTg==
X-Gm-Message-State: AO0yUKXYpVo69hJ98Srb5xPX2h7/GSsZkhCwlQNWajd/BDZnkPn9V/Rm
 PhWAkXBgoj9QFe4SIJw46zoFfSzB0xELhzcgOGiIqg==
X-Google-Smtp-Source: AK7set8C3Eb9GjyzWcfJsT14JO1NWtzRgTkn7YXIZ+jB/3igf3V9SSP7SSoO1MoFzzWY9FLRMgLe5A==
X-Received: by 2002:a17:90b:350c:b0:234:b3cb:147 with SMTP id
 ls12-20020a17090b350c00b00234b3cb0147mr9456960pjb.16.1678063225153; 
 Sun, 05 Mar 2023 16:40:25 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 33/84] target/cris: Drop cris_alu_m_free_temps
Date: Sun,  5 Mar 2023 16:39:03 -0800
Message-Id: <20230306003954.1866998-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 23 -----------------------
 target/cris/translate_v10.c.inc |  4 ----
 2 files changed, 27 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 76db745fe2..439af701e6 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -2101,12 +2101,6 @@ static inline void cris_alu_m_alloc_temps(TCGv *t)
     t[1] = tcg_temp_new();
 }
 
-static inline void cris_alu_m_free_temps(TCGv *t)
-{
-    tcg_temp_free(t[0]);
-    tcg_temp_free(t[1]);
-}
-
 static int dec_movs_m(CPUCRISState *env, DisasContext *dc)
 {
     TCGv t[2];
@@ -2124,7 +2118,6 @@ static int dec_movs_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_MOVE,
             cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2145,7 +2138,6 @@ static int dec_addu_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_ADD,
             cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2165,7 +2157,6 @@ static int dec_adds_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_ADD, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2185,7 +2176,6 @@ static int dec_subu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2205,7 +2195,6 @@ static int dec_subs_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2225,7 +2214,6 @@ static int dec_movu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2244,7 +2232,6 @@ static int dec_cmpu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_CMP, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2265,7 +2252,6 @@ static int dec_cmps_m(CPUCRISState *env, DisasContext *dc)
             cpu_R[dc->op2], cpu_R[dc->op2], t[1],
             memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2286,7 +2272,6 @@ static int dec_cmp_m(CPUCRISState *env, DisasContext *dc)
             cpu_R[dc->op2], cpu_R[dc->op2], t[1],
             memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2312,7 +2297,6 @@ static int dec_test_m(CPUCRISState *env, DisasContext *dc)
          cpu_R[dc->op2], t[1], c, memsize_zz(dc));
     tcg_temp_free(c);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2331,7 +2315,6 @@ static int dec_and_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_AND, cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2351,7 +2334,6 @@ static int dec_add_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_ADD,
          cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2370,7 +2352,6 @@ static int dec_addo_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, 0);
     cris_alu(dc, CC_OP_ADD, cpu_R[R_ACR], t[0], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2413,7 +2394,6 @@ static int dec_addc_mr(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_ADDC, cpu_R[dc->op2], t[0], t[1], 4);
     do_postinc(dc, 4);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2432,7 +2412,6 @@ static int dec_sub_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], t[0], t[1], memsize);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2452,7 +2431,6 @@ static int dec_or_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_OR,
             cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2484,7 +2462,6 @@ static int dec_move_mp(CPUCRISState *env, DisasContext *dc)
     t_gen_mov_preg_TN(dc, dc->op2, t[1]);
 
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 9660f28584..5e9d1c0fe8 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -922,9 +922,6 @@ static int dec10_ind_alu(CPUCRISState *env, DisasContext *dc,
         dc->delayed_branch = 1;
         return insn_len;
     }
-
-    cris_alu_m_free_temps(t);
-
     return insn_len;
 }
 
@@ -1058,7 +1055,6 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                 cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
                          t[0], c, size);
                 tcg_temp_free(c);
-                cris_alu_m_free_temps(t);
                 break;
             case CRISV10_IND_ADD:
                 LOG_DIS("add size=%d op=%d %d\n",  size, dc->src, dc->dst);
-- 
2.34.1


