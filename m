Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A733C17C3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:09:41 +0200 (CEST)
Received: from localhost ([::1]:34704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XWu-0005Zd-Qe
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5B-0001UZ-Jv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:01 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X55-0008Ag-Jk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:01 -0400
Received: by mail-pf1-x436.google.com with SMTP id d12so5974293pfj.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLqLvbO0HhVOjC+FZ4WKlh7ZoSv8S+xpjgL8WHiyFE8=;
 b=dnU8/S2BENxBajwg5xuzE/tzBZunMG0xtu8k7zjE3ZuxAzQBy3TC23VefZ2NxEOPBg
 zR1i+8KVKn2ucwe7py/h6NN5KEOa+c33MKd9blDYacZPtsqQw2YzWO0q2Pa9qqRZba/B
 CVIGt2UlyDYMtMiEi3ZC907X38sh44fUK8zE30MLJqagZMmTeXiw/0H/g4ldQlNJqpZp
 OjyM4KyCTF8xnM6Sv47oe626QTCKzNYm2yjPDpG10xo1P/BuMHu5nmXjhO8o2gjfeoKs
 OnuiW7XkvT/D/TmOktE4fW85q137rMu+qBmg0huJt+m7TrJpFzCdQAYD2NzkCvTvr6kF
 ZpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLqLvbO0HhVOjC+FZ4WKlh7ZoSv8S+xpjgL8WHiyFE8=;
 b=Zz1CCTiqZiuqdmUKvC8GQRVooiLBgRd6W1KPl2s8PqTQJZdHDMgsE4sWFnEYjpfVy1
 5YitXXhMvnndkW9FpQ8MeeHyNUr0+ErjX4gOICb5L17PsTUvDgMYuictV7oNNURhpknx
 kMa20cs3MGviEcscHONsCK+hDzd5zac2i2bc8kP/k6WjzHwmQVaihFC93nSnLN+2893h
 3nXKYrEhjyEafw0VWWIwjSuDrPYu6X/S4e3me2GET49sqVKfbCb7NhJeYOCn2Wto20q5
 9VZBgZbbHHWo1pNfRFctXrDm/cuBIdg8BH5Qbp7uOQftbtYZ0wvEh9LnQQrrWb3+MibG
 xFNQ==
X-Gm-Message-State: AOAM530h29Mg3ViltiB0WXJcj4/uMyvuNKelHvkh4T3gRt9Z8vYQuZE9
 CMbt5ezrge1fBNcFHopZUhwfHEf8AwTeAQ==
X-Google-Smtp-Source: ABdhPJz9UDu/4NgiPuALjCtLetKF36jG3gqg/sUiJfrdQYwhMj00ikCBtFFEWQOiSIe/DnJ96DP2vg==
X-Received: by 2002:a63:50e:: with SMTP id 14mr32331752pgf.429.1625762454155; 
 Thu, 08 Jul 2021 09:40:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/28] target/arm: Use translator_use_goto_tb for aarch64
Date: Thu,  8 Jul 2021 09:40:28 -0700
Message-Id: <20210708164050.711967-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have not needed to end a TB for I/O since ba3e7926691
("icount: clean up cpu_can_io at the entry to the block"),
and gdbstub singlestep is handled by the generic function.

Drop the unused 'n' argument to use_goto_tb.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e81cc20d04..856a689b90 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -386,35 +386,20 @@ static void gen_step_complete_exception(DisasContext *s)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
+static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    /* No direct tb linking with singlestep (either QEMU's or the ARM
-     * debug architecture kind) or deterministic io
-     */
-    if (s->base.singlestep_enabled || s->ss_active ||
-        (tb_cflags(s->base.tb) & CF_LAST_IO)) {
+    if (s->ss_active) {
         return false;
     }
-
-#ifndef CONFIG_USER_ONLY
-    /* Only link tbs from inside the same guest page */
-    if ((s->base.tb->pc & TARGET_PAGE_MASK) != (dest & TARGET_PAGE_MASK)) {
-        return false;
-    }
-#endif
-
-    return true;
+    return translator_use_goto_tb(&s->base, dest);
 }
 
 static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
 {
-    const TranslationBlock *tb;
-
-    tb = s->base.tb;
-    if (use_goto_tb(s, n, dest)) {
+    if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_a64_set_pc_im(dest);
-        tcg_gen_exit_tb(tb, n);
+        tcg_gen_exit_tb(s->base.tb, n);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
         gen_a64_set_pc_im(dest);
-- 
2.25.1


