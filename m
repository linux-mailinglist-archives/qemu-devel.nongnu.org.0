Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3A3C17E8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:15:24 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XcR-0003bn-Kj
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5D-0001bh-KO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:03 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X54-0008AL-0t
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:03 -0400
Received: by mail-pg1-x52b.google.com with SMTP id y17so6581204pgf.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mu/klPefx3rfkuaf7T8LxDUEzbZZpOz/hPlkdZ13L10=;
 b=valb4wA+xqJ1cZ6LgtuBw3tPYrmmeKEzPlNvgvcsdtWYlwvn2FXeqzq1aoaiWsNQYU
 lLN02J1KNgFYYVJ0BwUMC/hNCES098J+Rhs+qInq4rVc03o2XLJB7d4aEiEM1L05SJnd
 5Yunv5JPhDeXqsfxmqADJ+nM51nTozI698BHQPa0WhTEq6mNpfVYhyM7s69HYBkKZ/5S
 5CJsGWHjpnIoXvgA9AJcN9ccKqZFl8uLaD0aw/Z9DceHGaK44l6nGBmRA0MtiM4ylA6z
 q9mCMP+IH9NvLFAYgnsr/fAXclo1/krcBpGkWDUhzAra/ZwxxswS6IzM0M14zhZxmISK
 6KkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mu/klPefx3rfkuaf7T8LxDUEzbZZpOz/hPlkdZ13L10=;
 b=nhVOqRZrBM71NojjB5o4umbhrBa1CrQEm4wGfmNK2hh81lCIH/BeSe9rZQXqDCK7Gb
 xQgMKIw7GxJIujrfgO2zOS+EnbOwGC3OCxn3z7i1JS96FnWWEp7hM+EXae8tLbu1QRVv
 a9RXPYqSLJFnOJxw5bK/VE5CIW4QTGuunxl1bkdwrJwHfd1p1sQC83iKjlnPQn+Z2WZO
 nh197ufKOZqYwUnhWDakXpXdxPhJpWxUlgGCDvNdj56rVW7wTQ7oAF4nz3ctlla3Crat
 zFPvo1oMYi0Pe+QUies5igIFJmbRhD3POZ4tBvzKmEcx3nNQfe/ZGqcT3YlDYblWQGQt
 OGwQ==
X-Gm-Message-State: AOAM530f572wQooN7TDI2E1QlXdHTbVaT/QWT5qhHV7p+X9ZzLFdv9nR
 Xc2LA7Ht289A3rzApIBMarCmObVEmODW3w==
X-Google-Smtp-Source: ABdhPJwBYUbX/jxPoGdvfMjWEya7WypDUDl8uIxjyM84DUXp6NHV0ts2KmqL3ds75UkkY0BZtnwNBg==
X-Received: by 2002:a63:214d:: with SMTP id s13mr33492499pgm.260.1625762452730; 
 Thu, 08 Jul 2021 09:40:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/28] target/alpha: Remove in_superpage
Date: Thu,  8 Jul 2021 09:40:25 -0700
Message-Id: <20210708164050.711967-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

The number of links across (normal) pages using this is low,
and it will shortly violate the contract for breakpoints.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index aaedf78116..8fa00a79d1 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -439,24 +439,9 @@ static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
     return DISAS_NEXT;
 }
 
-static bool in_superpage(DisasContext *ctx, int64_t addr)
-{
-#ifndef CONFIG_USER_ONLY
-    return ((ctx->tbflags & ENV_FLAG_PS_USER) == 0
-            && addr >> TARGET_VIRT_ADDR_SPACE_BITS == -1
-            && ((addr >> 41) & 3) == 2);
-#else
-    return false;
-#endif
-}
-
 static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
 {
 #ifndef CONFIG_USER_ONLY
-    /* If the destination is in the superpage, the page perms can't change.  */
-    if (in_superpage(ctx, dest)) {
-        return true;
-    }
     /* Check for the dest on the same page as the start of the TB.  */
     return ((ctx->base.tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
 #else
@@ -2991,7 +2976,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUAlphaState *env = cpu->env_ptr;
-    int64_t bound, mask;
+    int64_t bound;
 
     ctx->tbflags = ctx->base.tb->flags;
     ctx->mem_idx = cpu_mmu_index(env, false);
@@ -3020,12 +3005,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     ctx->lit = NULL;
 
     /* Bound the number of insns to execute to those left on the page.  */
-    if (in_superpage(ctx, ctx->base.pc_first)) {
-        mask = -1ULL << 41;
-    } else {
-        mask = TARGET_PAGE_MASK;
-    }
-    bound = -(ctx->base.pc_first | mask) / 4;
+    bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
 }
 
-- 
2.25.1


