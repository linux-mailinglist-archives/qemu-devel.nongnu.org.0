Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A864AD28E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 08:55:26 +0100 (CET)
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLLQ-0006AA-Jz
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 02:55:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkc-0000Ns-1Z
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:22 -0500
Received: from [2607:f8b0:4864:20::102d] (port=42553
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkZ-00017u-24
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:21 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so1794139pjb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8UZVMY0pvo1xV7MrFt0a3sWDGzIB2xwb969t7jjX7iw=;
 b=ekHLtPDnLfgwIVfYaq/1dnHpgedAFmkBDXfrE0z51GOeDbykevx1ppb6hjkLjb1KUu
 gBS791CA7fMAa2WmuWEupxK86U5Jxj5jKNU8heZeHaxO0QYTcIYUwWTgfUEwgDUAuyCK
 OF+28rgTsUNT0hruhY5qebRAUePB7mBuQ/2CC+CW7oIgr3uu/8GTtC2DuIP4v1XVMmO8
 euNcdbwneuzrHxhe5b/lRzOpPOgA+Avz0afg1A49k5VUmgu2WZKRGIT6fpijQ4NwvrJA
 qPNHNpbj4Zd/HfSUMaNNWKH1M/13wMdSJeeKAN4pVFB149NTI0fVxRV7ZvE7d/6M+s2W
 4IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8UZVMY0pvo1xV7MrFt0a3sWDGzIB2xwb969t7jjX7iw=;
 b=zapE5CTQBrEpDpoVKjXDVVpKJvPG9ZgTUHk9X1+nQ83UqDAy4wxqsrzl51I4Xp/xCd
 HULrFXIVY/2OXcQoZmir7T2Pr0pLgN7hNE5cIPkh5vV25lmKYlR1SQ/T2XtCMHL5PXtm
 Y8Npb/CH6gAjxCr8OluQlFmA64tVcThYsErMv23TOwQctWc6ENAjAFNzy9dOoDUIp8Vf
 nW6VBVeWw5aJFCORK2thjd3r2cIQ6s3hV9Yy1XL7MSIMNNdyuYRfM04bbxQVo+76SCen
 C30EIulNoNZMMjKqOTHwUMvhduWG+OwaQgqjDTgXUt6RhNn12OvGWPbsME4BFETN1f2l
 x47w==
X-Gm-Message-State: AOAM531iGmmURXMXkjh1CY/qU3YMNPhvFBvY2l+2RKF4+sthq3eP03jC
 6Hq7swZpqLrctwR+Q1HCuXfqaNucyNK1Tg==
X-Google-Smtp-Source: ABdhPJwxHwpVU0TQ6fG3hsDdaRWwCinrDqzEBYt6gMSGWt/sP2mQHL2WF7czatcD8NPMisuElEUmIQ==
X-Received: by 2002:a17:902:dac8:: with SMTP id
 q8mr3325550plx.57.1644304637771; 
 Mon, 07 Feb 2022 23:17:17 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mi11sm1543422pjb.37.2022.02.07.23.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:17:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/8] tcg/sparc: Use tcg_out_movi_imm13 in
 tcg_out_addsub2_i64
Date: Tue,  8 Feb 2022 18:17:03 +1100
Message-Id: <20220208071710.320122-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071710.320122-1-richard.henderson@linaro.org>
References: <20220208071710.320122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When BH is constant, it is constrained to 10 bits for use in MOVCC.
For the cases in which we must load the constant BH into a register,
we do not need the full logic of tcg_out_movi; we can use the simpler
function for emitting a 13 bit constant.

This eliminates the only case in which TCG_REG_T2 was passed to
tcg_out_movi, which will shortly become invalid.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 0c062c60eb..82a7c684b6 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -795,7 +795,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     if (use_vis3_instructions && !is_sub) {
         /* Note that ADDXC doesn't accept immediates.  */
         if (bhconst && bh != 0) {
-           tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_T2, bh);
+           tcg_out_movi_imm13(s, TCG_REG_T2, bh);
            bh = TCG_REG_T2;
         }
         tcg_out_arith(s, rh, ah, bh, ARITH_ADDXC);
@@ -811,9 +811,13 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
 	    tcg_out_movcc(s, TCG_COND_GEU, MOVCC_XCC, rh, ah, 0);
 	}
     } else {
-        /* Otherwise adjust BH as if there is carry into T2 ... */
+        /*
+         * Otherwise adjust BH as if there is carry into T2.
+         * Note that constant BH is constrained to 10 bits for the MOVCC,
+         * so the adjustment fits 11 bits.
+         */
         if (bhconst) {
-            tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_T2, bh + (is_sub ? -1 : 1));
+            tcg_out_movi_imm13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
         } else {
             tcg_out_arithi(s, TCG_REG_T2, bh, 1,
                            is_sub ? ARITH_SUB : ARITH_ADD);
-- 
2.25.1


