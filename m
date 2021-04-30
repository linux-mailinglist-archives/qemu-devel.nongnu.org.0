Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156EA36F3C4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:39:14 +0200 (CEST)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI7d-0002zP-2n
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHla-0003QC-Tl
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:26 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlC-0007cZ-1M
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:26 -0400
Received: by mail-pf1-x436.google.com with SMTP id n6so1574913pfv.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcK4JXJlH4dCJ4S4ufZcFbDwhd9ORD+at0xFGfdapcw=;
 b=tSESPIG2P6hsHrWl/aaLaNRsKqYJn23yfoDpLzmqi+dgl8gDGu5ROnALt0ML+rN245
 MEhSue0EVIw2DvrawBBw1V4GOqMzdB882ROrLvJ9zpx8GIgDrcLxtcyitqM3o1LOuVcs
 L8LGg4ZrGbGx7YyTy0UypVkL94fRvxhSsJKJjHp4ryg2M3h1u9iXTOhjJHGfNQgcfSkT
 qN+WLIWMKRe+AU4aDZWQllREElpek2a/5jYX84Q/eh8iqKiGY0Dl7irzHJrccI9Jsyx5
 cHXtR2oNyM7Gt5xELY/gak62BizbjzFDOpWJHOAd3+nXkUFvUAcx31E0Etss+QDJCxjH
 Le8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcK4JXJlH4dCJ4S4ufZcFbDwhd9ORD+at0xFGfdapcw=;
 b=reT1dtkPb80QZ7a4FXPlcp7wTydCVvWEWrmBQwMcsjqU7+BJc/urp9v+V6xMBsHHe/
 IuG/NelrhsPUoYPv0VKy15z6Qd4lUY7soy5FbI/ueDKsLnDYqylv9Thb2RDxjT8lOfyp
 7ffFqnaKGILnFaC0FXrVMLCZMrD+e1hzI012iPOPZgxXGHv70w1okTZSkRzXu76IZPr7
 GX+cRuWJdDNrfB3WxbvOiszSNwESI8ri/7gpWy8wZt9/tZIRGRqDnuy2qLgmPLqlF6sw
 /8WJyvJJ3XffnfWkHqzqvHGHqkYix7TFRHX7oiAhR8MjnwmeMHgr7od93mQHZ1JdH9lg
 5dXQ==
X-Gm-Message-State: AOAM530c+tQhAVns4aB0aWVKrQ7OBcYDFRgy6dFZWEeFduxMYYP2HdOo
 rf9hDiXqjewHAJIUkgFEFnov9dTYG4ij3Q==
X-Google-Smtp-Source: ABdhPJxrjvTMiyuuAlTfC3Y04jHGLHFJ/A1WVQviv+RdarKNPo3Uig7f5dcrdwiN2gUr0Zv+3MmKlg==
X-Received: by 2002:a63:4423:: with SMTP id r35mr2411334pga.13.1619745360793; 
 Thu, 29 Apr 2021 18:16:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:16:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/30] target/ppc: Move page crossing check to
 ppc_tr_translate_insn
Date: Thu, 29 Apr 2021 18:15:37 -0700
Message-Id: <20210430011543.1017113-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With prefixed instructions, the number of instructions
remaining until the page crossing is no longer constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 65848463ea..d782a13d27 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8019,9 +8019,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     if (ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP)) {
         ctx->base.max_insns = 1;
-    } else {
-        int bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-        ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
     }
 }
 
@@ -8098,6 +8095,11 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     handler->count++;
 #endif
 
+    /* End the TB when crossing a page boundary. */
+    if (ctx->base.is_jmp == DISAS_NEXT && !(pc & ~TARGET_PAGE_MASK)) {
+        ctx->base.is_jmp = DISAS_TOO_MANY;
+    }
+
     translator_loop_temp_check(&ctx->base);
 }
 
-- 
2.25.1


