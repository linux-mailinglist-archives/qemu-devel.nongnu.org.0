Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0460B50A762
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:49:25 +0200 (CEST)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhavk-0001Rs-1F
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeL-0008WQ-UL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeJ-0002vb-8G
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c23so5549780plo.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKIThnJwihMgCB5YgANDuhlt0GFgFWT4M3nz0HEBt1E=;
 b=blGSzVLfUmWosZCHYhxio2hWO9I0H9XQA4GbsUG0usL/iDiD4T7wtxc94JfCX9ou8b
 S1pEEIzS3cBB8X1/+nsWlyX68CRnS2VRVkng4VLT+32HfGvmjBVUlQYt//Yt4PorRN72
 ARlgja0BOtlKf575tp+0jOjXoOM4dWfA/TvyDFBmYTGxD1M/duzSPQxTMNpv6+KtAJdB
 JwF+W7oKxL+89j/Abs4zsR8beUAojdc0ye88TEDvHgIg3Pb0Upzm9DgNa8ArvrsCREz6
 N+/I49XI18Auv1qYBgD+6iER94+GMfV+HK87mo9Qf0jgTfaKj7GnG5lYtm9giMj/kWYw
 XEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKIThnJwihMgCB5YgANDuhlt0GFgFWT4M3nz0HEBt1E=;
 b=SvxDDzMXK4RL+KOqGDsXZj1YO2wSY/nElpuVfU9HnKexRUbV8mRhxOC7UbujVAEnNh
 eYedyO8+XgTfJie3cnMCZy0AF8CYO3fPmn5Ad3P4rriuCRJboeKE22ufOGZcXovbva1s
 rt1rAkjA+fFFUFCqXp+IVs8r1H29KVzcZTRZjbZQT9cGsL/dw4M9KkJ/E66q8biDltPD
 7eaxpe5noI8i+QEf5S9Y78mU60hTfyYI3Wql64KCfrzTLdfAL5zqWuIygn3DUiinodfc
 /yw0MG0N3ixmYzD69KloNzyVHHGdEwREH5CJrdyebM65b8NHJo7M9WaZGNPLFcsp1KwH
 rCFQ==
X-Gm-Message-State: AOAM533Njbj+4ytuiP7a7m/zPa52leHFtohwCOpUnz76nN8/DyZm8aGB
 rQpzL12NMnxReaECi9n/r87MwG+ucGbkkQ==
X-Google-Smtp-Source: ABdhPJzX9Rwc4reGyfMjNwUP3OiJuda9euMpW7aQ9hAWWv2cKEQc92US2f8KCWiV1A/Teh8RZXUYyg==
X-Received: by 2002:a17:903:41c7:b0:158:eb28:cb64 with SMTP id
 u7-20020a17090341c700b00158eb28cb64mr594477ple.150.1650562281742; 
 Thu, 21 Apr 2022 10:31:21 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm23557644pgc.50.2022.04.21.10.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:31:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] target/rx: Put tb_flags into DisasContext
Date: Thu, 21 Apr 2022 10:31:08 -0700
Message-Id: <20220421173114.48357-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421173114.48357-1-richard.henderson@linaro.org>
References: <20220421173114.48357-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy tb->flags into ctx->tb_flags; we'll want to modify
this value throughout the tb in future.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20220417165130.695085-2-richard.henderson@linaro.org>
---
 target/rx/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index c8a8991a63..c9db16553b 100644
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
2.34.1


