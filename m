Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EE504874
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:54:20 +0200 (CEST)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng8AF-0001Cm-P5
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87b-0005jQ-9P
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:35 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87Z-00047Q-UL
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:35 -0400
Received: by mail-pg1-x52f.google.com with SMTP id u2so14832257pgq.10
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgjr7uNGifmmfZHmH00wqonWc8uQdHdxbJEQboAm3jQ=;
 b=nyOpnfoZYQ9JFegwbIWxx3WKGQ28uYlqMJiSCElJ5d4HBBG+auVO+0L1w3JPPcOw2B
 pbR7DCSvebMk5oocxlezznvd3viTic6yyj0I61eDu966+xYLlNTa4tB5zSJ9vP0eiQjy
 m5EJdDeXuyU6UfHk4tJ0+Y7larOcPQICydIfUGWKdBeP4aA2mlz4JJwaI2WePMSolZ0R
 NEGzXJU+C9NQsJjYjo/2iDasyBHqGJUezGO6ZdDB0yDgEC8USrzIbvje/wrUhb9o/Ena
 /w9PlSK06D9NzQliyPrZ0x3MCocThWm8/8rDK9xHscKpGLIai/uKhCfBF5mAseE9EPd9
 1VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tgjr7uNGifmmfZHmH00wqonWc8uQdHdxbJEQboAm3jQ=;
 b=JkyM3pp4H/EmFuImPIO2coXWadb2rdd1Yd4ZP0+reJWOskIYRDbDy0FtIvEiVGrXNW
 Hqd3ajx9wkzt010LW67nXmnQHXlAzCLPY5o3osjB6HczoX2BLpoWiVxRzT8enB/Rv31d
 Qr4cS/OyFkeAewWdOI22xatsZ7c7x7Q7tZISjEqDBrc2k7uAIL5FqrpB+PlTlQ07I4pE
 T+SapN8xcdQKHKVcjwCJQcKdy4UEj2pOnkX0RUSFCvPxaZqUg7EeqnAnhBPq6WINNkmG
 9MBMhhfN/noDGrBtariw0NATgrFO3UDa/eA9DAQGCAk7VX/RMdiJf19KthJWd96Vmn1M
 NHyQ==
X-Gm-Message-State: AOAM532NvCY2hdxtXIR4xTvHhgTZz+UVWu1wws3TUubV+3fFXg/uea94
 hSEqzYQSZORfCXOE2cRHGAHNVrMrhBwMQA==
X-Google-Smtp-Source: ABdhPJwqW8Dxpdf2SsKa5inUdWC1PHqEkciJroh4ZRVC4eoDyAZ1nVEXIm71Qh5orNEn1ul2NYRnHw==
X-Received: by 2002:a63:714e:0:b0:398:9bdc:e11a with SMTP id
 b14-20020a63714e000000b003989bdce11amr6720119pgn.572.1650214292549; 
 Sun, 17 Apr 2022 09:51:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 f3-20020a17090aa78300b001ca7dfab2e4sm10395396pjq.25.2022.04.17.09.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 09:51:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/rx: Put tb_flags into DisasContext
Date: Sun, 17 Apr 2022 09:51:27 -0700
Message-Id: <20220417165130.695085-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417165130.695085-1-richard.henderson@linaro.org>
References: <20220417165130.695085-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: i@yvt.jp, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy tb->flags into ctx->tb_flags; we'll want to modify
this value throughout the tb in future.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 5db8f79a82..785cbd948e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -32,6 +32,7 @@ typedef struct DisasContext {
     DisasContextBase base;
     CPURXState *env;
     uint32_t pc;
+    uint32_t tb_flags;
 } DisasContext;
 
 typedef struct DisasCompare {
@@ -231,7 +232,7 @@ static inline TCGv rx_load_source(DisasContext *ctx, TCGv mem,
 /* Processor mode check */
 static int is_privileged(DisasContext *ctx, int is_exception)
 {
-    if (FIELD_EX32(ctx->base.tb->flags, PSW, PM)) {
+    if (FIELD_EX32(ctx->tb_flags, PSW, PM)) {
         if (is_exception) {
             gen_helper_raise_privilege_violation(cpu_env);
         }
@@ -2292,6 +2293,7 @@ static void rx_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     CPURXState *env = cs->env_ptr;
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     ctx->env = env;
+    ctx->tb_flags = ctx->base.tb->flags;
 }
 
 static void rx_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
-- 
2.25.1


