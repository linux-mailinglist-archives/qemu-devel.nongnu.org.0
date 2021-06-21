Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18A3AE153
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:36:40 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8rf-0006bd-2D
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8px-0003n4-24
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:53 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pp-0005Ak-Pg
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:52 -0400
Received: by mail-pg1-x533.google.com with SMTP id w31so12830945pga.6
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8W3E8oUQSB677QQyABV7B4p2F0hPm4epmS7TTIJ96Bk=;
 b=M4I3DRen5KFnW0x+9OukwYD1Je20YCMqH2ORkp0fb+Iv733BWZSOx4gvsYGQyTxIOl
 YCx+pzgDbunXrsoAe6eY9cvLj6QFIkKguZh+7PYLgQLUAOEqukAMZQBC2V+iALATaD0B
 ETdMJly+BLzOAQsO0FHxHcZLdkLcUxcCXnRBLuahKWhYQzwnH4X080/JjOOGnw0O6Am9
 t7o2tgJiPl8/lAkQYNCvhc9SZBDyYmEGDiVzCjKPHE+MOK/cExXbQYpYtzmRJapQ8+4n
 eMCkNaV9B7xaOUnCMdCtaARPxu/3FYDtRHWo8fYsXIMb8VoAArV6o5LX5pijWCJMrEtQ
 rBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8W3E8oUQSB677QQyABV7B4p2F0hPm4epmS7TTIJ96Bk=;
 b=rPcXR1KTRMy0xl3wSw0b8RJYWY2zV4fRPsqsQ9L95H9va+YL9kxAeAvdiodlYl5ttb
 4d7DwXpQy/xeB3M0P3ixg7q+cjCaPjtoRMk9eBZ8Ydtv10st/yO/+fo7TFkEeLf3V7Mk
 cydtPdEPrkWer0zPc34YwCZXfiIYbRuorgs7PRn0C0xB3ufzU2kgas/2pGJZgZOPvbQn
 DIMSVtx13FHHP1AJoB3IFtKDHd548uYPoZUBhvanco2/Z7XbLjJ09LSo0H1hNMevm+TO
 8rDCvvhAx3e87/Qxe5S/Ui4Jzz5Jars+VNcJf7G8dRu7TJcCFCrRKVWzAZTfFGBhl5yA
 m4Ww==
X-Gm-Message-State: AOAM532r2iBQJIhuDkm6qEfIa/64ZHbp3i9dsDqISmUjRqmKcKxR+MKr
 L+89RZ5fZNdW90XGmFEauKUTevn8eSw4NA==
X-Google-Smtp-Source: ABdhPJyaLHO5MCLNhnWIyCn36Thx+tXk51c0E4uHH7r/+P029An1hH2+q1OTM+aUvcy+xJWCNOzByA==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr21433072pgh.255.1624239284611; 
 Sun, 20 Jun 2021 18:34:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/26] target/avr: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:19 -0700
Message-Id: <20210621013439.1791385-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Single stepping is not the only reason not to use goto_tb.
If goto_tb is disallowed, and single-stepping is not enabled,
then use tcg_gen_lookup_and_goto_tb to indirectly chain.

Cc: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index c06ce45bc7..8237a03c23 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1083,14 +1083,17 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     const TranslationBlock *tb = ctx->base.tb;
 
-    if (!ctx->base.singlestep_enabled) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        gen_helper_debug(cpu_env);
-        tcg_gen_exit_tb(NULL, 0);
+        if (ctx->base.singlestep_enabled) {
+            gen_helper_debug(cpu_env);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
+        }
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
-- 
2.25.1


