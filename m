Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A73AE17D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:42:06 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8ws-00011C-QM
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pu-0003iJ-HV
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:50 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pn-00058s-Vg
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id w31so12830908pga.6
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XmpHG5qWHga2DrUxm66yiT1xDZZbA3TthH2EU3CwRBo=;
 b=xylRNmWbryrU3eyR/TMxLe00WWDmc0rbCZu2gTQXoUkRQCRg0+/SctiCCGQ/YEPC9w
 eAdwT+cjOhfQyxmG028poOZMJGUJlZo4HRBn7DmaZPFGKiKBW9UCI4kLxhtY+I/fgl/J
 TsDhaNG7RawYYgnpqz4aX0OG7nYV5PLGmM1QyAyu6pXHYYu9ZQTmHbfFDDsidhcGf29E
 xCIJX4y1PQ4j1ZvS6mS4n7i6WwnwEkRaJeqyCIx1qGfAJrau3uvADCwmqfma4OoPU/YP
 TyWELAVbMRCkK/V/UTYeG+HAAvqheBObfglGTqzo7522I0hQ1vKTLRrhyog8dr2qjXrI
 8T/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmpHG5qWHga2DrUxm66yiT1xDZZbA3TthH2EU3CwRBo=;
 b=UOMCOT6Lqm/CrIm9YJxZwbqPYi+70Oze4f8TkfUoU40MRhgyQIySjzu62uHsCmf5eD
 aUfGkNOVccjrIWYjTIJl/fpLYDfycupavdJeYLsfylL4Uz6uMrq5xpcppv1Jl2h/7fJM
 Q8jSW73LWxz1tRHJaMgGWxdRu7Unl8jzkd3674qYQgOflidM7gD0XZ7fg+1jNwBiA6oG
 sKydQUU5dl9EfRifwqapJU4KeyOtlNpuEamrTuM4XeJ9r2rxJ7U8sh4L0qi1PsVyWpY9
 GXzQNdd9GyXIbPmc0SqIQI1B+LiDShkH/OojtYicVJ7MuiTDHnhzSBdDSd7lm5QgymP8
 aEPA==
X-Gm-Message-State: AOAM5310lU+a6/aeVQrrKru8NW2yuJcytAkoI9wKqiztDEdjAgEnu8rk
 q510NzxkV4NYFHugLAv3MHY2K389esF4Dg==
X-Google-Smtp-Source: ABdhPJw3mYg2/r5k7NxXaQdrI03ZjAUKbG2oURGUfa7Ar4M9XoZCfSoMco/rPsNXbHAWSxEp1Me0gA==
X-Received: by 2002:a63:9f02:: with SMTP id g2mr21617381pge.141.1624239282769; 
 Sun, 20 Jun 2021 18:34:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/26] target/alpha: Remove in_superpage
Date: Sun, 20 Jun 2021 18:34:16 -0700
Message-Id: <20210621013439.1791385-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
index 70ba4a67c7..6ea19a1d4c 100644
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
@@ -2916,7 +2901,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUAlphaState *env = cpu->env_ptr;
-    int64_t bound, mask;
+    int64_t bound;
 
     ctx->tbflags = ctx->base.tb->flags;
     ctx->mem_idx = cpu_mmu_index(env, false);
@@ -2945,12 +2930,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
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


