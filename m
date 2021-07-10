Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D483C355E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:54:25 +0200 (CEST)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FJA-0002bA-Te
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exc-0005zv-Q1
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:08 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exb-0002RH-2q
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:08 -0400
Received: by mail-pf1-x434.google.com with SMTP id o201so6620817pfd.1
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmrvZ2YDmFmQRowDiyGgkhSWbFuv8fekjQLGpsBU/NM=;
 b=qUEtvDtPYfegydw0pJYrorQFMFKSnTz8nE8dsHS4vddDrUVd94+OTyLP5WuxXJZCRO
 f8HCDzZxF9AbfvlRboGgpoYN8r1WHGivIvCIAY+hVYwFn3zqJaQwcU05Aq+GxIytEPF+
 Dv45MWagTfv+bIRI57CrbmgSqYVG+H1rR+56zisKRudCiL8zk8JyaY41JDcrFIXtq8YT
 bvBrGElh16p1RW0y+B7eZyb2w9NPak4mUBe030aqZOtgczsnBlMBguIiyMgbHggaFMg4
 9kC4wO3a/EXFLdJZYhI6f1xFw8UU0AbaeeSNvcEoufszmgNNaIaJmw5FdyZRtiPslQHf
 409g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmrvZ2YDmFmQRowDiyGgkhSWbFuv8fekjQLGpsBU/NM=;
 b=SQeUawYgcO1L+bKtrB+xB/8qIqZ/CFpk2SX/D4QqjKP0JWF3m6N+Na9fPUhfL3TuPf
 d9rniynlrUXDWGUXl7O1XVspAZPpSOQuPgxkhWR8aUHDMGEtogw/JM5SIRrStWs0Am8a
 ojiDptdS0QBhD0oVngNmn8njVTavo+FLP2gBFvrbddOjEjbMlSbTtfbMvmk5U7rHLmAc
 84/Dr/XkpBBRSPxaO5d09fzDrrt0DzNnjXjLjPG5LieoPnVS/biv8ByjkfvGxo/JpS9o
 apciHcc+w9vQtd9qsG1c2FwfpeVY37j0YgeArGu53MIROFw4XTxbx/5AvC+EbY70I0Nk
 UtuA==
X-Gm-Message-State: AOAM532GBNhqj7b1gLD0ZDKbL8KkET3n+n7AnVZe2ugYlZucTiotO6oz
 2E2eYZ9qJ98aMwcsBa6sz7SR4N3ouuJ6Zw==
X-Google-Smtp-Source: ABdhPJxHeX4TZCcN58m1NPTnRc/qRPNBsdytDoCqgea9DzcTVQ7NpijKCFbaIk9FTvWQX2iBtX5Rhw==
X-Received: by 2002:a63:ba1e:: with SMTP id k30mr8226441pgf.39.1625931125806; 
 Sat, 10 Jul 2021 08:32:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/41] target/tricore: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:33 -0700
Message-Id: <20210710153143.1320521-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
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


