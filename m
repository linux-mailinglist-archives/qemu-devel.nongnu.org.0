Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47E2F1CD0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:44:29 +0100 (CET)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1Ez-0003wY-10
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rq-0003Mk-Rr
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:36 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rY-00009i-Uo
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id l23so10982789pjg.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tYsbmjolK+Eg4JFu4uyWsu7Q9CaREMLO0zlw/InU6fk=;
 b=jp1yhE/g5lGhItOm5LeZ4lrD9g+ZEjGe3Aktwavr6oq/NcxAnzWDbL84tEhqz/vNMA
 2UAjVUE5IDPZqULGaoOHbJgbbwTvMPW4Y4JqS1Aj1BN82brxUfWCZ01816FRhcqcfgLD
 o3gaBzdtpTbqidcfSkkm/t5OXedboJXng/D86JlXQk+wboWw/lP/18mlcA6p+g3Fye3Z
 6un4lLZHGu+OjtZe7+QAKJzx7ze4/brzjS+CTM4VS03LYdWKWbtvL0qYEQnMt4msDJnW
 29JjldvrwMLeVRi5Elt8CrafIRcT2IEKO6klfOKjVGcdk/IOICJFs07w2S+Nbw9jVer4
 0ZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tYsbmjolK+Eg4JFu4uyWsu7Q9CaREMLO0zlw/InU6fk=;
 b=d73ROPKvXZJp4HE2FS5ZhnlzQt0lapTNoUWwHCWiMuSbBaBhaOmxiBBdMx4qwEwSRZ
 3dTNRZDBS+3qYc/YFob0Q2ADFubPSFIyGyMkt8TG/3n39thNrHZlNaU7mgKM7TgCB64y
 JyRyJV/YTJZaqxbnK6h5k/HBgc36PPfx+jW0+qWoBwIA9NMnaDwjzf5EVaeRpRMq2n5r
 XBjypZpB9JC+3RFDNTEf9TCsW9m4TAtX1KDBKs7PyK1MQUGs+EqiDTlxhbGImwt34tu1
 OH8TNqMXGIQpCSypS6SmbflzVotX/NgiAMuSpttVM4fReFXGHoR/g3g1AxuNDE6S427r
 oLKg==
X-Gm-Message-State: AOAM5324Mbidvh2w63kxiDzJWWKq37V82ug+Ak762sJyVzAqe/ZWafRI
 4LEj2uxA6m3DJJX5XVbDGcb5UiEWjm0qkw==
X-Google-Smtp-Source: ABdhPJyvYuFMrWV4Jkg7pJUaL2NKyKf6ewa7yWjHI1kqAfUcBw1Dxrq+Puj1of1YUz0rChNIOYJ4gA==
X-Received: by 2002:a17:90a:17e2:: with SMTP id
 q89mr235977pja.209.1610385611382; 
 Mon, 11 Jan 2021 09:20:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/23] tcg: Use tcg_constant_i32 with icount expander
Date: Mon, 11 Jan 2021 07:19:36 -1000
Message-Id: <20210111171946.219469-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


