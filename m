Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941B63C753F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:49:11 +0200 (CEST)
Received: from localhost ([::1]:44008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Lao-0003Ju-LV
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUD-0006tR-7R
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:21 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU9-0005fH-MX
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:20 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso2490232pjp.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXF13QTS5AJHAq5VT/9hnMvu0uSbL+4zu4FScleCGMI=;
 b=auIbAaMZJ8l3mhaJmIb7KsrJTMttOAlcM/4UPIF2HR4ynwPWgZdc+IsL2Nbs8aDdia
 g2ARGztMRVTyPPJa/EHOcaovZafy7yNnJIWGo+xwlLDYKGidzjVu4UjzX7KQ/SFSVBqN
 HGqLv9w83E+yUyuIUuTkzoKVbga/0cFV4ORL2VIHKWPNUuKbI/ouVIO6XCDKteINdf1G
 1HBhmZwh6fg2Hmti2zRSODbtc8iOFk391v9UlPkulsXZ1DltlTDOOE/KPSZZxRwKQrT8
 ugN9TGBlfR2B7vRf5fhMyZ0JrLVa/V8reS9sRQMnwr9sTuxfcVp+hiDaEnsmVxxvpukz
 c1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXF13QTS5AJHAq5VT/9hnMvu0uSbL+4zu4FScleCGMI=;
 b=hzsKOCQr5S49zGXUNXTzb86u7f7187xZQfV+3+R2uCbB4PNI/Ik2EZ/SDWvnMcRIOh
 JCIJGaWI3hOXQenj2Ua11XuYc9oMhb+HwGsZtA1QvWZb0HoyN4zkccGkt7iL/xyrO6Mq
 g3qvfnXIns9jr/CAOGxrB1aTc612O8X4Y7HtCrQKce2pjLZSdToBfyFvhuZQ22/+dk2H
 edvie6xRDFPEXrNozEujYj1YaYLb4xSMtAsBkXAnqM6VQN5Vf0ZmnN58w92WhWDctDrr
 UpQwg64u9UF6g6Ji8Hwywe0w8rYpCDEqAuVEH4xNpn6skSdD2XVWEial5Fj62O23yDa7
 +2Xg==
X-Gm-Message-State: AOAM532FQiL02Q61nfbwOBt2ORIM49uuoxgRgG0YnnRMVhenJWRL8NJy
 e1qrgfAnBgyo6Ry2puK0+wdlkczhs+x6eg==
X-Google-Smtp-Source: ABdhPJwVGnVTyyq0Bz8tL0LHr8/nQtgFWRn0Ozhow9jM3oGS54aXRfzvyVwoiG2Qn2hAebHggMzz4w==
X-Received: by 2002:a17:90a:1704:: with SMTP id
 z4mr207727pjd.213.1626194536418; 
 Tue, 13 Jul 2021 09:42:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/14] target/alpha: Use tcg_constant_i64 for zero and lit
Date: Tue, 13 Jul 2021 09:42:04 -0700
Message-Id: <20210713164211.1520109-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These constant temps do not need to be freed, and
therefore need less bookkeeping from tcg producers.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 64c4865dda..58c0e08c0c 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -66,8 +66,6 @@ struct DisasContext {
     /* Temporaries for $31 and $f31 as source and destination.  */
     TCGv zero;
     TCGv sink;
-    /* Temporary for immediate constants.  */
-    TCGv lit;
 };
 
 /* Target-specific return values from translate_one, indicating the
@@ -157,7 +155,7 @@ void alpha_translate_init(void)
 static TCGv load_zero(DisasContext *ctx)
 {
     if (!ctx->zero) {
-        ctx->zero = tcg_const_i64(0);
+        ctx->zero = tcg_constant_i64(0);
     }
     return ctx->zero;
 }
@@ -177,14 +175,6 @@ static void free_context_temps(DisasContext *ctx)
         tcg_temp_free(ctx->sink);
         ctx->sink = NULL;
     }
-    if (ctx->zero) {
-        tcg_temp_free(ctx->zero);
-        ctx->zero = NULL;
-    }
-    if (ctx->lit) {
-        tcg_temp_free(ctx->lit);
-        ctx->lit = NULL;
-    }
 }
 
 static TCGv load_gpr(DisasContext *ctx, unsigned reg)
@@ -200,8 +190,7 @@ static TCGv load_gpr_lit(DisasContext *ctx, unsigned reg,
                          uint8_t lit, bool islit)
 {
     if (islit) {
-        ctx->lit = tcg_const_i64(lit);
-        return ctx->lit;
+        return tcg_constant_i64(lit);
     } else if (likely(reg < 31)) {
         return ctx->ir[reg];
     } else {
@@ -2992,7 +2981,6 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 
     ctx->zero = NULL;
     ctx->sink = NULL;
-    ctx->lit = NULL;
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-- 
2.25.1


