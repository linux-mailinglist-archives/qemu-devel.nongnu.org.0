Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40B308E1E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:12:54 +0100 (CET)
Received: from localhost ([::1]:40570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5a8T-0007ll-K1
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6J-0005x1-Ro
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:41 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6H-0007zS-AW
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:39 -0500
Received: by mail-pj1-x1036.google.com with SMTP id md11so6369264pjb.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BJ7K2GgfBNlUMSrPcIxO0xnk9cq6USQK317WPPixCjk=;
 b=gqRycE24vsHPc8BudlMFOTAjvj6trvjqRLX1pw/gvo9wrbsYohq+mub1U9VSptr7Ru
 5vmpeJ71jn72iLLphewtEqRFZcr7rtg4qlC76DbgamgtORNknWMZdVvrdPLNuP34kUSm
 WrVXmU3whZ+DjJlq3/qw7wFteN2EqyKBWXsmKoQFKNodAc1clegnrkuVTL1rkt0EU1+S
 wO8afnH7bEdjTES8HXi83ubd9C9B5cUkhogtjg3VXq8ejfVfTxNQ9v2C2qPHkOu4MOTN
 giCZnw2b6cLWL8Ingn+/yID9XSqr+J+hwU3YvoGOBmYXx81DdBArBwCeB4Pr2qqbm+D4
 naPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BJ7K2GgfBNlUMSrPcIxO0xnk9cq6USQK317WPPixCjk=;
 b=gHHTX+mVUS8L4lIOkZDRWxhjUkjBniMF16KCU+DliwbtOuntODxdKeiRKYf7vZAnKq
 nsJixkV/Zle4LHfLXyfUqAfn2u/4kP0Td6Muxf/LPJAeeA+CrWJuOVsoOFeUnneQZtZN
 6j+HhiblAWnHo3/uGQh0XBUW7p2oAEv01Lw2Jgb68fdlmE57vLcQPhgOAiXiqM7He8CF
 RIlSPJXfeQQQelPYtXwFAw/G0Ita6uMxGOyNdDZdMqA7a1lueGlK00087wFM1iof6PPE
 amTz/wQ3Auuh79jCYh4Qf7r3o6dEnn3hwxtiI7/Itutx36a26gjKI7IcX0vz0xOP/sgH
 9t8Q==
X-Gm-Message-State: AOAM531SAcPDP8xYSNtHSXI2YwNVEJ7+LgnpQyn6xgHQrs+ITedBkWrp
 I7ThbWUvMmK2S5nom5F6HkEX9PkRjRh1jPOx
X-Google-Smtp-Source: ABdhPJwPurwAywGQeXKktXnCoC8WGWD5jEEeHPvxusQNqPl4h/cGhi5/6+ZeD5zH0m11rzTEx+r12w==
X-Received: by 2002:a17:90a:4494:: with SMTP id
 t20mr6036700pjg.155.1611951035739; 
 Fri, 29 Jan 2021 12:10:35 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/24] tcg/tci: Remove TCG_TARGET_HAS_* ifdefs
Date: Fri, 29 Jan 2021 10:10:06 -1000
Message-Id: <20210129201028.787853-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The opcodes always exist, regardless of whether or not they
are enabled.  Remove the unnecessary ifdefs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 82 ----------------------------------------
 1 file changed, 82 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 9c45f5f88f..b62e14d5ce 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -71,70 +71,42 @@ static const TCGTargetOpDef tcg_target_op_defs[] = {
     { INDEX_op_add_i32, { R, RI, RI } },
     { INDEX_op_sub_i32, { R, RI, RI } },
     { INDEX_op_mul_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_div_i32
     { INDEX_op_div_i32, { R, R, R } },
     { INDEX_op_divu_i32, { R, R, R } },
     { INDEX_op_rem_i32, { R, R, R } },
     { INDEX_op_remu_i32, { R, R, R } },
-#elif TCG_TARGET_HAS_div2_i32
-    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
-    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
-#endif
     /* TODO: Does R, RI, RI result in faster code than R, R, RI?
        If both operands are constants, we can optimize. */
     { INDEX_op_and_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_andc_i32
     { INDEX_op_andc_i32, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_eqv_i32
     { INDEX_op_eqv_i32, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_nand_i32
     { INDEX_op_nand_i32, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_nor_i32
     { INDEX_op_nor_i32, { R, RI, RI } },
-#endif
     { INDEX_op_or_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_orc_i32
     { INDEX_op_orc_i32, { R, RI, RI } },
-#endif
     { INDEX_op_xor_i32, { R, RI, RI } },
     { INDEX_op_shl_i32, { R, RI, RI } },
     { INDEX_op_shr_i32, { R, RI, RI } },
     { INDEX_op_sar_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_rot_i32
     { INDEX_op_rotl_i32, { R, RI, RI } },
     { INDEX_op_rotr_i32, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_deposit_i32
     { INDEX_op_deposit_i32, { R, "0", R } },
-#endif
 
     { INDEX_op_brcond_i32, { R, RI } },
 
     { INDEX_op_setcond_i32, { R, R, RI } },
-#if TCG_TARGET_REG_BITS == 64
     { INDEX_op_setcond_i64, { R, R, RI } },
-#endif /* TCG_TARGET_REG_BITS == 64 */
 
-#if TCG_TARGET_REG_BITS == 32
     /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
     { INDEX_op_add2_i32, { R, R, R, R, R, R } },
     { INDEX_op_sub2_i32, { R, R, R, R, R, R } },
     { INDEX_op_brcond2_i32, { R, R, RI, RI } },
     { INDEX_op_mulu2_i32, { R, R, R, R } },
     { INDEX_op_setcond2_i32, { R, R, R, RI, RI } },
-#endif
 
-#if TCG_TARGET_HAS_not_i32
     { INDEX_op_not_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_neg_i32
     { INDEX_op_neg_i32, { R, R } },
-#endif
 
-#if TCG_TARGET_REG_BITS == 64
     { INDEX_op_ld8u_i64, { R, R } },
     { INDEX_op_ld8s_i64, { R, R } },
     { INDEX_op_ld16u_i64, { R, R } },
@@ -151,81 +123,39 @@ static const TCGTargetOpDef tcg_target_op_defs[] = {
     { INDEX_op_add_i64, { R, RI, RI } },
     { INDEX_op_sub_i64, { R, RI, RI } },
     { INDEX_op_mul_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_div_i64
     { INDEX_op_div_i64, { R, R, R } },
     { INDEX_op_divu_i64, { R, R, R } },
     { INDEX_op_rem_i64, { R, R, R } },
     { INDEX_op_remu_i64, { R, R, R } },
-#elif TCG_TARGET_HAS_div2_i64
-    { INDEX_op_div2_i64, { R, R, "0", "1", R } },
-    { INDEX_op_divu2_i64, { R, R, "0", "1", R } },
-#endif
     { INDEX_op_and_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_andc_i64
     { INDEX_op_andc_i64, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_eqv_i64
     { INDEX_op_eqv_i64, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_nand_i64
     { INDEX_op_nand_i64, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_nor_i64
     { INDEX_op_nor_i64, { R, RI, RI } },
-#endif
     { INDEX_op_or_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_orc_i64
     { INDEX_op_orc_i64, { R, RI, RI } },
-#endif
     { INDEX_op_xor_i64, { R, RI, RI } },
     { INDEX_op_shl_i64, { R, RI, RI } },
     { INDEX_op_shr_i64, { R, RI, RI } },
     { INDEX_op_sar_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_rot_i64
     { INDEX_op_rotl_i64, { R, RI, RI } },
     { INDEX_op_rotr_i64, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_deposit_i64
     { INDEX_op_deposit_i64, { R, "0", R } },
-#endif
     { INDEX_op_brcond_i64, { R, RI } },
 
-#if TCG_TARGET_HAS_ext8s_i64
     { INDEX_op_ext8s_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext16s_i64
     { INDEX_op_ext16s_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext32s_i64
     { INDEX_op_ext32s_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext8u_i64
     { INDEX_op_ext8u_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext16u_i64
     { INDEX_op_ext16u_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext32u_i64
     { INDEX_op_ext32u_i64, { R, R } },
-#endif
     { INDEX_op_ext_i32_i64, { R, R } },
     { INDEX_op_extu_i32_i64, { R, R } },
-#if TCG_TARGET_HAS_bswap16_i64
     { INDEX_op_bswap16_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_bswap32_i64
     { INDEX_op_bswap32_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_bswap64_i64
     { INDEX_op_bswap64_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_not_i64
     { INDEX_op_not_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_neg_i64
     { INDEX_op_neg_i64, { R, R } },
-#endif
-#endif /* TCG_TARGET_REG_BITS == 64 */
 
     { INDEX_op_qemu_ld_i32, { R, L } },
     { INDEX_op_qemu_ld_i64, { R64, L } },
@@ -233,25 +163,13 @@ static const TCGTargetOpDef tcg_target_op_defs[] = {
     { INDEX_op_qemu_st_i32, { R, S } },
     { INDEX_op_qemu_st_i64, { R64, S } },
 
-#if TCG_TARGET_HAS_ext8s_i32
     { INDEX_op_ext8s_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext16s_i32
     { INDEX_op_ext16s_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext8u_i32
     { INDEX_op_ext8u_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext16u_i32
     { INDEX_op_ext16u_i32, { R, R } },
-#endif
 
-#if TCG_TARGET_HAS_bswap16_i32
     { INDEX_op_bswap16_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_bswap32_i32
     { INDEX_op_bswap32_i32, { R, R } },
-#endif
 
     { INDEX_op_mb, { } },
     { -1 },
-- 
2.25.1


