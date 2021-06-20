Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AD3AE0BC
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:37:43 +0200 (CEST)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv58Q-00075j-P8
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53r-0002ID-FU
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:32:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53k-0008SO-JQ
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:32:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso471601pjv.4
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktgo4xWUwEPLcu/uB4HSWazqzoEfJMOHsnknfFL5vLg=;
 b=jEiRs9rlN2OoWgNESPPR0gyrScgHNkyV3YQt0PWFcY2CLMY1UTsPKPdV7rpw0h2ATa
 dY4K5tuNclkXzcgAQLAtzEdTNGHSeAZAExNiSH0rMPTrsPU6AhYZExm1YFGUbauRu49h
 enFA2F08hzXuGPaxhliTwZBj9BRE7EemabX5ia0fK0zD6L8oYIlPY+gPob1xUo2BGmSL
 LdPsNfMXiAasDUDDLUNBDk8O9r7tvSYHGAhMGmkAsqSRMy9spfMmvMafUTgVu8nCY5mr
 pcjlBFHZTSfLk+BKl8iDN/Cs8Yg+WQU32+uWqTgBy8uJt87MWDMqlLUEQM3Tg7JRATNQ
 rmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktgo4xWUwEPLcu/uB4HSWazqzoEfJMOHsnknfFL5vLg=;
 b=B7MxxA38HcIocEQD+Sn6Qg6FgYvdhTlKN80PkWwrKLKtCu4rix2khGpkYOCLmwyvMX
 coU557DosXRWsLwpZwW/UvW6Z3fZOflSfWB55VegagF47HJwjLlwnZCJIKAub2tu3g4k
 YScyaFiRG0lHrBal8BCsSMyafm7tA1E6QCzHV4tsvh/tJH1WKd+XayN4BuCOxCYpavcs
 gRrCixWqwFYjRI5/Zcwxy1w2idULMxptD/IqpQIX5VN6Qnim1RDaaESwk1ZAjM89uDoy
 3MZJQCNsz4a+QFu34I4mmLZ6eF3brbADuyPSJNrcKyV+eT9lWrWA6dJ1lYUK94d+aUAA
 wXBg==
X-Gm-Message-State: AOAM531jfVTM9mFz7Eys27Tan8Sse97p0+bkAmF4ybFcn42yZayjpw27
 sJO1ej8cYIyjF8AQ5AWCsy7EbYgw/fXSzg==
X-Google-Smtp-Source: ABdhPJx9iXbnFBsuN/oybKQIjWWLci3OFIrUG572iCeBGENfJimJS2TgBM+JeEwD9/uRrcwm+1glaQ==
X-Received: by 2002:a17:90b:300c:: with SMTP id
 hg12mr26176275pjb.46.1624224771330; 
 Sun, 20 Jun 2021 14:32:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] target/cris: Replace DISAS_TB_JUMP with
 DISAS_NORETURN
Date: Sun, 20 Jun 2021 14:32:40 -0700
Message-Id: <20210620213249.1494274-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
which is the same as DISAS_NORETURN -- we've exited the tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index bed7a7ed10..2ff4319dd1 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -55,7 +55,6 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 #define DISAS_SWI     DISAS_TARGET_3
 
 /* Used by the decoder.  */
@@ -3243,12 +3242,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                     gen_goto_tb(dc, 1, dc->jmp_pc);
                     gen_set_label(l1);
                     gen_goto_tb(dc, 0, dc->pc);
-                    dc->base.is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     dc->jmp = JMP_NOJMP;
                 } else if (dc->jmp == JMP_DIRECT) {
                     cris_evaluate_flags(dc);
                     gen_goto_tb(dc, 0, dc->jmp_pc);
-                    dc->base.is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     dc->jmp = JMP_NOJMP;
                 } else {
                     TCGv c = tcg_const_tl(dc->pc);
@@ -3311,7 +3310,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_SWI:
-        case DISAS_TB_JUMP:
+        case DISAS_NORETURN:
             /* nothing more to generate */
             break;
         }
-- 
2.25.1


