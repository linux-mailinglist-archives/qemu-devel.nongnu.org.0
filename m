Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79CE2D31CE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:13:01 +0100 (CET)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhTw-0000of-Kb
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIr-0007U5-9F
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:33 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIm-0006L2-U7
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:32 -0500
Received: by mail-oi1-x241.google.com with SMTP id s2so10841377oij.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BbcpleEZKyhprJSQbmMTNOGh64QQmS1NjHgoZYuCqSw=;
 b=NRrPdEVVkQlX9xp4tMaisqz23qIimHNK4rKLvD9M03ojTP6jJY6YiqRkgTWCVZIi3W
 SZc922+gvlV+VWKTDA3Ny6jHvjahSWq9icDP2T8YrzcjW1IzLLkh7AYIr+7GJoxhLP3y
 HVZgO+XeVI2Bj2ZpSkyWahoXm+jlbg96OlVYlL9WDLF0XF59RRa9qRP6EmcK+nlmqkX1
 fIrBKQ+m9SWcVuUJmg5b3javhQtDCelCDAr/oWjXgzOchYFMI9FckEzBV/zJfe7LD8Z5
 vj//7PQp0YCHtxwJJLwali2tD1uFAjsHNLzPt4tH5okvM2Br0xXbsTuv18rrXDVz1bvd
 3xcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BbcpleEZKyhprJSQbmMTNOGh64QQmS1NjHgoZYuCqSw=;
 b=SQ7IYXzMbMCzv37EfijjBd1eRjCaVrQPS5dloBx1hnQ6auw7z8wiMV1HhpyYEwH+ck
 rjCCzXRHS6NSr3v2c8kvETfZeKe7RhctSSaQ1j90ulR34gTD4AaLORrNzuGu1gmUVArA
 fNMf+Vy0mLKwQmB4Yyzy+LJ7Nxdigm3AOJihfqkLqfwwTyfhUsEl1mCauVOzwyZyEqMR
 terNdEkuH9nGNLb40wYq8vFxpwYueGsZChelbrg04cjfUieA4Em6KOz2j+vFdt9Pm9ld
 tnmU+/PnRjBVv3xVmwC2Rc955G5ps7ibQQkqjraAKKvMQkDSYsWAYpL/C1tnKVR8ARSx
 gCPQ==
X-Gm-Message-State: AOAM530VZiOcioHD5YmSZry4djs9xZE8BIBMJngxQ+tJV3owsdFt3QWw
 zOiclKlUUlGdIrEwRw6zuzujLEDr3O3gFjAQ
X-Google-Smtp-Source: ABdhPJxpFGQ4t1STahqz7EK0xBQhQkezpv8HT8DRqGyB5JZgcOnlUEzU9ukTffa2oEvIPEVCj3tvPg==
X-Received: by 2002:a05:6808:a1a:: with SMTP id
 n26mr3636377oij.94.1607450486901; 
 Tue, 08 Dec 2020 10:01:26 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/24] target/arm: Merge gen_aa32_frob64 into
 gen_aa32_ld_i64
Date: Tue,  8 Dec 2020 12:00:58 -0600
Message-Id: <20201208180118.157911-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the only caller.  Adjust some commentary to talk
about SCTLR_B instead of the vanishing function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7b3ebf44ae..f35d376341 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -942,20 +942,17 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
-{
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-}
-
 static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
-    gen_aa32_frob64(s, val);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+
     tcg_temp_free(addr);
 }
 
@@ -4921,16 +4918,13 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        /* For AArch32, architecturally the 32-bit word at the lowest
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. That means we don't want to do a
-         * gen_aa32_ld_i64(), which invokes gen_aa32_frob64() as if
-         * for an architecturally 64-bit access, but instead do a
-         * 64-bit access using MO_BE if appropriate and then split
-         * the two halves.
-         * This only makes a difference for BE32 user-mode, where
-         * frob64() must not flip the two halves of the 64-bit data
-         * but this code must treat BE32 user-mode like BE32 system.
+         * gen_aa32_ld_i64(), which checks SCTLR_B as if for an
+         * architecturally 64-bit access, but instead do a 64-bit access
+         * using MO_BE if appropriate and then split the two halves.
          */
         TCGv taddr = gen_aa32_addr(s, addr, opc);
 
@@ -4990,14 +4984,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 n64 = tcg_temp_new_i64();
 
         t2 = load_reg(s, rt2);
-        /* For AArch32, architecturally the 32-bit word at the lowest
+
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. Since we're going to treat this as a
          * single 64-bit BE store, we need to put the two halves in the
          * opposite order for BE to LE, so that they end up in the right
-         * places.
-         * We don't want gen_aa32_frob64() because that does the wrong
-         * thing for BE32 usermode.
+         * places.  We don't want gen_aa32_st_i64, because that checks
+         * SCTLR_B as if for an architectural 64-bit access.
          */
         if (s->be_data == MO_BE) {
             tcg_gen_concat_i32_i64(n64, t2, t1);
-- 
2.25.1


