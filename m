Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC52F573B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:29:47 +0100 (CET)
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsOQ-0001XW-AF
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCc-0003eT-C9
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:34 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCP-0003TR-SI
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:31 -0500
Received: by mail-pg1-x534.google.com with SMTP id i7so2734015pgc.8
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tYsbmjolK+Eg4JFu4uyWsu7Q9CaREMLO0zlw/InU6fk=;
 b=y5RcDgq2fdst/kBTTQbLorBBSIs0VaKJXmrZWD++/CRbwTCbij/FJkj4/RrNMi2cPk
 XOeaecF7GTY+rTNcDBhLdyk6xyXykujqhRGbJTrhkPGIQ94i3yDV3f6a3Zcb22bidsJP
 TSw5vCj08V8/OT4JN04k6RJwZ7UUYS3U1yC+CQa8gVK/xJplDUdz9Dd9c3Xx8w8BGqxJ
 HXW6D2ROPVG1IeX4EVSYNmfJnT5NrKxwzDFp490Y4kAnt1V1yriYZfIIFYvfvT9jXzNT
 ds1WFktaws5cgA33TXrlCc0ZA+r2R+rkTHiMxM8lj+kSuqotBVj/p6h+kElzZzMepyTG
 EnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tYsbmjolK+Eg4JFu4uyWsu7Q9CaREMLO0zlw/InU6fk=;
 b=JaPX4CmeTxCw/JJ9tgQIgm6Y/6hMx7cp+7MM7dT0cU8opb6npuAoOrYvs0QvueJR0r
 Ozg74oMW8lV4wEDPYF1keszhDXk9hJLYmeTJllLcOV4w1WAxce5JEy/V2U0u98DYNAKj
 MvnsHywm75XBPIlGt5qvDlhgh8FNO8iJ0OzgqwUw4CJ4OaQdSMXeJUTJrCb6z54X0YSt
 dD+TiXfxjTjYmuFQyclWZ8cc8vmB6VPP8SOGv6GJznlbuD8JUnyjKuXSXkOv0GG2Qq3X
 a7TaR0yUbKUgkelOAeS+T1LiYShgS+3Qdfj8EAXkgwJWY68MnwU8WWND7oLJccytpF+W
 W41w==
X-Gm-Message-State: AOAM530Ng04B2wT0bkIvKsbwEqVFOzUONvnpAQF9hxSHvBb3M6tNGRLp
 6bQcAq+GlHC4Gl4lOv/JEwWJbV7yBj6nOw==
X-Google-Smtp-Source: ABdhPJy+jsg0Uvd8ZPbEnkyq8bf54w+PGqWkM7mtftPIngCfEqJ0USqeBFaRBXnT2eD5hVGgEqESJw==
X-Received: by 2002:a63:ff4f:: with SMTP id s15mr5075928pgk.62.1610590640158; 
 Wed, 13 Jan 2021 18:17:20 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/24] tcg: Use tcg_constant_i32 with icount expander
Date: Wed, 13 Jan 2021 16:16:43 -1000
Message-Id: <20210114021654.647242-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must do this before we adjust tcg_out_movi_i32, lest the
under-the-hood poking that we do for icount be broken.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index aa4b44354a..298e01eef4 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -34,7 +34,7 @@ static inline void gen_io_end(void)
 
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
-    TCGv_i32 count, imm;
+    TCGv_i32 count;
 
     tcg_ctx->exitreq_label = gen_new_label();
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
@@ -48,15 +48,13 @@ static inline void gen_tb_start(const TranslationBlock *tb)
                    offsetof(ArchCPU, env));
 
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        imm = tcg_temp_new_i32();
-        /* We emit a movi with a dummy immediate argument. Keep the insn index
-         * of the movi so that we later (when we know the actual insn count)
-         * can update the immediate argument with the actual insn count.  */
-        tcg_gen_movi_i32(imm, 0xdeadbeef);
+        /*
+         * We emit a sub with a dummy immediate argument. Keep the insn index
+         * of the sub so that we later (when we know the actual insn count)
+         * can update the argument with the actual insn count.
+         */
+        tcg_gen_sub_i32(count, count, tcg_constant_i32(0));
         icount_start_insn = tcg_last_op();
-
-        tcg_gen_sub_i32(count, count, imm);
-        tcg_temp_free_i32(imm);
     }
 
     tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
@@ -74,9 +72,12 @@ static inline void gen_tb_start(const TranslationBlock *tb)
 static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
 {
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        /* Update the num_insn immediate parameter now that we know
-         * the actual insn count.  */
-        tcg_set_insn_param(icount_start_insn, 1, num_insns);
+        /*
+         * Update the num_insn immediate parameter now that we know
+         * the actual insn count.
+         */
+        tcg_set_insn_param(icount_start_insn, 2,
+                           tcgv_i32_arg(tcg_constant_i32(num_insns)));
     }
 
     gen_set_label(tcg_ctx->exitreq_label);
-- 
2.25.1


