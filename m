Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4E31E03A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:26:39 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTPC-0002wi-2R
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTL2-0007M5-7N
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:20 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTL0-0007BS-8W
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:19 -0500
Received: by mail-pj1-x102b.google.com with SMTP id c19so2143343pjq.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/cgl87lXykdJMny21/UJVDiccpgPXiqD0uRpK0C4eyY=;
 b=EaySR6UeAsJYW/hnOYJBvhhFEfYOwC30x/VPoS8QEZcmSM17yjFHzqnn77nOIeaqIL
 t+PJ7bG0EUZ9vOe9mZkemyeGn463iQ4DfJSyl+lXPmMUf6pHFVQNM9taup+fRyt/hwwF
 ONDjNLA0TmR7+e9TERqae+Biw7ccyc40UpCVDbtgsK2Yx8V3BOE7kltQ6uKC0fw/iEpT
 lOzxxa4F7Fm3ESlEGJ0VBHOFV/DgotvMCPY463oqzqUGd6gEy+kT73TP2LlszvTCifzs
 Kyv0P0skPwaiVsKpY056dIHWbqwG+otETJqRBiNEjTnICLkPMCXNVUgFdgVdcYwghw5X
 Ttyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/cgl87lXykdJMny21/UJVDiccpgPXiqD0uRpK0C4eyY=;
 b=KAMOC0DzPqXuUo6rGgk3G1nE06XRhAjbBTt91jqoBMctvc+YP6FnANawAp2tNFBt9g
 Z3AR+AkzAazu4iTAz5xybY23RkIg1GUQi2bfOJQ6zrhE3yZwp4mONNy63RTKkHKaQrcq
 Cq7I8fQ0ZLyqJkrPtCRUVk50b4CzJLDvDJA9TgB2T5JwV4BiCm09QHUWGc0Hh0iW7h3r
 rO1m4vJoMOxnLVqOq443Pl7Kdb6kFANNVAliVbOrp37yOk2WzXZwDVgho6jTNLq0IVhT
 5mHKHdVlBJqux9vvdGBTAo4kMhdLbG4EyFXGXTilKLJVuMrELBcOsZYGN52rKqdgevUj
 RN1g==
X-Gm-Message-State: AOAM530aB0CngywQcTJLixDFzCST3+meZ9E0CK74G5Cvm+vqQZcC/yX9
 m9Bfx4KXoZ6Q75QI0EkYQR6aBFpXDEUIpQ==
X-Google-Smtp-Source: ABdhPJznstbmwtmLWjA5xxJUgzEyDCOfPvRWYcfkGu7bweWRyHh2kFm5UbD69OkzdGEU8fonQOtmHQ==
X-Received: by 2002:a17:902:ce83:b029:de:6b3c:fcd2 with SMTP id
 f3-20020a170902ce83b02900de6b3cfcd2mr707362plg.67.1613593336973; 
 Wed, 17 Feb 2021 12:22:16 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/71] tcg/tci: Reduce use of tci_read_r64
Date: Wed, 17 Feb 2021 12:19:36 -0800
Message-Id: <20210217202036.1724901-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In all cases restricted to 64-bit hosts, tcg_read_r is
identical.  We retain the 64-bit symbol for the single
case of INDEX_op_qemu_st_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 93 +++++++++++++++++++++++++------------------------------
 1 file changed, 42 insertions(+), 51 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index cef12f263d..9efe69d05f 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
-{
-    return tci_read_reg(regs, index);
-}
-#endif
-
 static void
 tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
 {
@@ -146,9 +139,7 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs,
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
 {
-    uint64_t value = tci_read_reg64(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
+    return tci_read_r(regs, tb_ptr);
 }
 #endif
 
@@ -390,8 +381,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
@@ -672,7 +663,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_mov_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i64:
@@ -696,7 +687,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
         case INDEX_op_st_i64:
-            t0 = tci_read_r64(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint64_t *)(t1 + t2) = t0;
@@ -706,62 +697,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
             break;
         case INDEX_op_divu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
             break;
         case INDEX_op_rem_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
             break;
         case INDEX_op_remu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
         case INDEX_op_and_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -769,41 +760,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 << (t2 & 63));
             break;
         case INDEX_op_shr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 >> (t2 & 63));
             break;
         case INDEX_op_sar_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol64(t1, t2 & 63));
             break;
         case INDEX_op_rotr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror64(t1, t2 & 63));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
         case INDEX_op_deposit_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp64 = (((1ULL << tmp8) - 1) << tmp16);
@@ -811,8 +802,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            t0 = tci_read_r64(regs, &tb_ptr);
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(t0, t1, condition)) {
@@ -882,21 +873,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i64
         case INDEX_op_not_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i64
         case INDEX_op_neg_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
-- 
2.25.1


