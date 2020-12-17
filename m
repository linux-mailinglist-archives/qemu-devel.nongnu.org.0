Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED642DD412
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:23:56 +0100 (CET)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpv8D-0007dx-R8
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudz-0003S8-3d
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:39 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudt-0004wg-Jo
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:38 -0500
Received: by mail-ot1-x333.google.com with SMTP id q25so27503307otn.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mEMZJyAsz2pya7wCS7q3Y/mkN8EK0RWNbiEA9tVJa2o=;
 b=F3hKtjarjpOgpXvZMHtUf7sH9kJr40iQ0RjZZB020BlvSk7V/48+y+2jKXH83T4T0Q
 vbKDfXtbUJxlzQuJjLz4Jq1LLtSVuDJpo6wofffSUVvf1V6XSGmCFOJriNFek5qzLdsJ
 dRHb7aHt2VHPIxjJ2WpAV60ThVrD+Njv5wXBfGCbpH3Fr2hjYtuPERA3GbxwvFzFJyXh
 6BjLaNEXoSugHsc1kBnYXkf6ewv0z5ZYUF20/BZ7Yw9E8uvktPOqYmAltyaPK3mFbFgv
 7+On+Pc6CEFEEIpSCjLoQ/VY9YjrsWH3huC/TvDHY58Yil1w+8fgsEJ1bVz0d6CDTBmQ
 Xr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mEMZJyAsz2pya7wCS7q3Y/mkN8EK0RWNbiEA9tVJa2o=;
 b=P54NAfyJ2BtawCK7G5Y0A15oem6ovJOkaYzY+z7qyutNx1r+YTatbFwWnSdrtgpe4w
 8EhL6DWghD9yjhSwjsfN5iBXruns7/BIk6nfNF+xbewMg2W0+iGn7BU+XkLNQkPOFufA
 DA2zJuN3s91mK4MhL1Gu3l3gLazsk8mxUdbaHQ3zoRc8J7pcwu6Zw47TO9wcf5IE1iDr
 MMiRuFC6pZd2g35mCz/+4ZRTo9HaqGrvaUQDMW0B3d87qkbB0vKTsEUt1hy504mk2QjX
 +W0MGdCZHr6GG0pGtLFgrjWLVS67SK14womJkSy/vUHTIUPchHd6MmhWWiqoQDqatSwu
 Gb6Q==
X-Gm-Message-State: AOAM530IeSFNJJMdr2uLq1eIqZbFW7TdcTD3G1F2i/SJBmjwkAWhVsL5
 CVLZn4TUBlJXbLOamrZ3QV61GtXy8CjQ7fc6
X-Google-Smtp-Source: ABdhPJxNgOat/C5wgfbI1UdHO4hF5njXk6pQL+Y+qshUeVY7kFMHlRNYu3fmYHidrXZ1M7kHou6VQg==
X-Received: by 2002:a9d:32c4:: with SMTP id u62mr27671564otb.63.1608216751962; 
 Thu, 17 Dec 2020 06:52:31 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/23] tcg: Use tcg_constant_i32 with icount expander
Date: Thu, 17 Dec 2020 08:52:05 -0600
Message-Id: <20201217145215.534637-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
index 822c43cfd3..404732518a 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -34,7 +34,7 @@ static inline void gen_io_end(void)
 
 static inline void gen_tb_start(TranslationBlock *tb)
 {
-    TCGv_i32 count, imm;
+    TCGv_i32 count;
 
     tcg_ctx->exitreq_label = gen_new_label();
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
@@ -48,15 +48,13 @@ static inline void gen_tb_start(TranslationBlock *tb)
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
@@ -74,9 +72,12 @@ static inline void gen_tb_start(TranslationBlock *tb)
 static inline void gen_tb_end(TranslationBlock *tb, int num_insns)
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


