Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E523B7890
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:24:19 +0200 (CEST)
Received: from localhost ([::1]:56842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJLG-000367-2w
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIsu-0007sS-FB
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:01 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIss-0000q7-5T
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:54:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id v12so25493plo.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBvB7U/HcEMO5AJVKY9MEDQbcWzedaB5pCNHh5Z+IcE=;
 b=zYlpJtTRdoBPO+R0OZUhw4uQAe2Qyyjq7aUAdMQOsKE74Yxoy5kplilLW+wDcBBeog
 KtjM4pSS6bPRzJAmNsVliFqrdB5FGK+4mEpolFmH/k5+DVjMVqL1tTYNuy/CyuTg0gPh
 3Bj9JBBH3XoI0IHhDED4xfDTzr+MZYdIXZXpr4MTVGyXFFJ8JkhDt0MVdb4QAd5dm4A6
 +KgBTo/i95IAGMzJUfdIS+YCQD0QwAZ8btcrMYd/fsf4K4jz0s8bauBJuXrWKC1fBnDw
 ICY++l/JHNj0aeBXrUl5zvLNZ2rUW3qgYoeH+2PlYN5B7+zAXwwOP+FOTZgmV88hLN76
 Mm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FBvB7U/HcEMO5AJVKY9MEDQbcWzedaB5pCNHh5Z+IcE=;
 b=MQtjQQj5nxVAOZfYW/rgdgJ0pjRBfpxTge/df+anM/dxnYOnQkrBpNa2HaYckPYtX5
 gSoK4GkkNO7jIrBIPhzCnZFGQKwYC4FgWruR0nDd2agn4C6oz2hno3gVrV0JzHE00Thn
 tzauMznF/OL8CC69v4PFMmsJvm7R31rYBPm0GD79SIeWK2J4d2EZfIFFY6tZaL7elBmI
 SAhUpq1q2naJpR+zTQIJwU3x2spd+V/ecb/SL0tJf85/kK/ivFKoP85KNBB0TKWGfHq0
 FN8jRUbhlRFdOcUFrN92TRjqP0W0+sBcyb/fZwIrNlB6duAxOklvxVUM/g6NI1eEmLiw
 xdnQ==
X-Gm-Message-State: AOAM530A7Ah7yQ34I3D65VyO3a4Fbri/VWMGL4Uvoj1aJKcGZm7dBdVm
 xd8cOFpQ1CxEgdff5YMEhCZ1rCX8tLJO3w==
X-Google-Smtp-Source: ABdhPJxrcU5ggjSvHy9QfqeU/2crQoX7k0eE98y1oez6j8XGC+6mM97iUPv+QFr+YvY7/AC6/ahNgQ==
X-Received: by 2002:a17:90a:8588:: with SMTP id
 m8mr315362pjn.160.1624992896720; 
 Tue, 29 Jun 2021 11:54:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:54:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/63] target/nios2: Replace DISAS_TB_JUMP with DISAS_NORETURN
Date: Tue, 29 Jun 2021 11:53:53 -0700
Message-Id: <20210629185455.3131172-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
which is the same as DISAS_NORETURN -- we've exited the tb.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 399f22d938..388fae93a2 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -37,7 +37,6 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 
 #define INSTRUCTION_FLG(func, flags) { (func), (flags) }
 #define INSTRUCTION(func)                  \
@@ -209,7 +208,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     J_TYPE(instr, code);
     gen_goto_tb(dc, 0, (dc->pc & 0xF0000000) | (instr.imm26 << 2));
-    dc->is_jmp = DISAS_TB_JUMP;
+    dc->is_jmp = DISAS_NORETURN;
 }
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -269,7 +268,7 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     gen_goto_tb(dc, 0, dc->pc + 4 + (instr.imm16.s & -4));
-    dc->is_jmp = DISAS_TB_JUMP;
+    dc->is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -281,7 +280,7 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_goto_tb(dc, 0, dc->pc + 4);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->pc + 4 + (instr.imm16.s & -4));
-    dc->is_jmp = DISAS_TB_JUMP;
+    dc->is_jmp = DISAS_NORETURN;
 }
 
 /* Comparison instructions */
@@ -883,7 +882,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         break;
 
     case DISAS_NORETURN:
-    case DISAS_TB_JUMP:
         /* nothing more to generate */
         break;
     }
-- 
2.25.1


