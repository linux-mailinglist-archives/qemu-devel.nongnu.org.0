Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF163AE190
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:53:54 +0200 (CEST)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv98M-0008Az-31
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qG-0004ET-L6
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q1-0005Ff-Hl
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id bb20so4806819pjb.3
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lVjdPTEZr5bsk/W3c3tDkqvpodiVq7V2WUfItf4iddE=;
 b=DhpBdVEPuUfQKvNhVYbT0h1zGeQqL3RGyCdF4XvAtX7csgnSSOUG+iaYjSpPbZ2ERB
 HCWxU2wbn0rkh4JLKr/JKk5L0KOVMxK1slc6iNBKv2N2Fx5jZYEaDdF2hCUfI9vuRbUW
 gJP3w5WqU+4OQZJA87VcYNuD5amugm5jLdDNpYEL3nG7WRcAAvYDoIM54ngh7sF2Df70
 e3TfpZ5GdKppyq81HVEu5EHoGoYZJJy+tdSg45wwCXM8+EwBb96pJ3SM5gaiYwqOI987
 v1JV16G0RawwgrSUemQHs2iaBG2AyragRXOhKqwO/f6D1aoSS4QuOKobqhLqgqwifsoA
 Ou8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lVjdPTEZr5bsk/W3c3tDkqvpodiVq7V2WUfItf4iddE=;
 b=J3XtoJ7D7KE7ZLDQEhJ+21o8CphC49nqmldEWoU6nNgrNcRFMvTQgblF8G2em4+W4+
 EHDH2ypAwCOroJ1qsDMJ6qa1q2F10ZXXqatxT2CJKtAH/idhvE2tO6DoJ2M/68Ary3lN
 LBcak+mIIgyhVCRacgyK5i+/y3dPkZbClgnuFyAE66wqtHXCGmHniJ//LNu4RiY4t+4D
 7YnF+n2iUh6TZX1hNczC0aVPG/7jH0227F5kHElBfjCabTMoFbgco6QLD5qP/DmQUg3H
 FgI9Si7YqauiPl0MVXeLj//R0OAa6CYhs9bt9gqSMB7flJNz1fWiUDQdCDKQPKSI+Xcj
 dXvw==
X-Gm-Message-State: AOAM532GklcOGCOB3d9TeIovthZAEGxhVbA1708Oj3G64UTJRix0nqrL
 X2n+ly3xJvnWzppkLy/VOzx7MgDJ/KVN8w==
X-Google-Smtp-Source: ABdhPJyU47uApshjr5bHhhfqYwbv7wF64YImGVSl0cuSUd3Za2d/tOKGZfxkyfBBxLu0pjonUH6Rng==
X-Received: by 2002:a17:90a:5401:: with SMTP id
 z1mr23651272pjh.7.1624239294886; 
 Sun, 20 Jun 2021 18:34:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/26] target/tricore: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:37 -0700
Message-Id: <20210621013439.1791385-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 2a814263de..09465ea013 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3225,19 +3225,6 @@ static inline void gen_save_pc(target_ulong pc)
     tcg_gen_movi_tl(cpu_PC, pc);
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-{
-    if (unlikely(ctx->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void generate_qemu_excp(DisasContext *ctx, int excp)
 {
     TCGv_i32 tmp = tcg_const_i32(excp);
@@ -3246,9 +3233,9 @@ static void generate_qemu_excp(DisasContext *ctx, int excp)
     tcg_temp_free(tmp);
 }
 
-static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    if (use_goto_tb(ctx, dest)) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
-- 
2.25.1


