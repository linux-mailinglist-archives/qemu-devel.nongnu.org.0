Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289D3B88A6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:43:14 +0200 (CEST)
Received: from localhost ([::1]:57832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfB3-0002kq-9n
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0j-00055b-TZ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0h-0001yf-57
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so1982956pjo.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YzHaNSHTcPGqhF/jUvUjsx0pHeg/Xl1qSkbxFOtUk2A=;
 b=ad8vUANRHI33010LsIYZjmAxK34WCI+Jmbg2mhL17Cj5uSBBfQWHfqdRVUyZBGwQMG
 5llcQnAruDaPaxGASnJfxDNoVecHYq0MdnM6vwwfIfF1EtkVlt40qVCmREV6mk/h17CP
 bgMH6OAAwowsVyfxJPuXkdzMJGwqwlSgFtNr46syU7XGf3iQ076eJkRS1gYAb0RaVuwm
 BlecgH9PFSOtwoxQftOOJPc17tl+Oe/W6YjpIPYxOX7asCi6OF8aFHWbOGq51USjh78Y
 5O1btnIE3NCafIGmDSjQsLNdlDa/5nLdDe8FDBGGIdeggzHESbMCuCyE7/PWiiNrXzYj
 zZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzHaNSHTcPGqhF/jUvUjsx0pHeg/Xl1qSkbxFOtUk2A=;
 b=ef6gSjWtfesRh6E84Fg1LoCpZSaRmi+Jx50ANceljf6ODOzNoEpCP0qCwgVMYAJfcd
 yFNNWehTe5W2+wdCWG4Vslnpc68PRohAZ2Z/bHAFvqf5R2o3SVv9lStg/wtHE1TlkQKU
 tc4yKdDPA7cxICLMlAFlKMWEG1rJ4U+x64lsigOoK4M6yqH72EX8sHx08cHaWTxW0Ms0
 ZoC38ij3c9w0BkzHWeXxP7GaGP7MOnEGjnrWbBKRCHH6ngIiYSEAFOITY9gPZG5ND/ey
 BIAcxEpE/EfWbUw2UFzgo+sXcxE1qSfFXdE2F6VVUO/c4D+BUoHMvcV8Sa3JuJsgEKBt
 LeOw==
X-Gm-Message-State: AOAM5334e5BfWzzoK7LzV6iZg/AqYdWAJyUKpglP/tAxGHgRYMuPJwUH
 b9wlNOr+MU1LUFKxpLDBqIoqN8AUirh5yw==
X-Google-Smtp-Source: ABdhPJxUSD0BXntqfFWQ5v4KYZ7w9FFY24I6HKz7W8Cp3ER9u1zM+RXepiqc+UviS/1qnKwXcTtBpQ==
X-Received: by 2002:a17:90a:c58d:: with SMTP id
 l13mr5719773pjt.186.1625077949883; 
 Wed, 30 Jun 2021 11:32:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/28] target/alpha: Remove in_superpage
Date: Wed, 30 Jun 2021 11:32:01 -0700
Message-Id: <20210630183226.3290849-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The number of links across (normal) pages using this is low,
and it will shortly violate the contract for breakpoints.

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


