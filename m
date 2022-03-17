Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E04DBE64
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:32:29 +0100 (CET)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUikO-0001nG-3B
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:32:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL5-0001WG-Sf
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:22 -0400
Received: from [2607:f8b0:4864:20::42f] (port=40715
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL2-0002J7-W9
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:19 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d19so5888399pfv.7
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0Y1+UOzMYE465JAg/1XZp8FHRvlzNh9RDhixInPs2c=;
 b=PliBKBi9/uCwVgvvd/+5zgjHzaB/qt7qKsymgp52Dgkz4IVESNJxTI+2f6JeA5Tkaf
 osOHn2eRILf6qL1LmQH77UJMKbZpdD/33HLByZdvmzxmfbzqU4YT8RsEOfjfHCTja7o8
 +U8myTUBAlyiQziEY6p6swThFNp8K/OgiFSbiGbDATelUeGPyRlbBpKgDPf24f+Ji79L
 OgHUcuJZEKFRtXIl4BUjP2TgI/didMbFDFMcDzo4re5m3WWdEm2yWfdz0ULoOdwsa6tw
 0/5OpjAgbS9VscqyjN0oAM8YDoCDa55CaldsNwppn+9KuU6KCdRdYqE8+CC+kaCw9922
 lWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0Y1+UOzMYE465JAg/1XZp8FHRvlzNh9RDhixInPs2c=;
 b=yOTIgGOIXMV1OjmJ7o7I4xRwsVgHyv/RvG3SK6bSvo05T95xpWWaHqOhskwkevE80b
 vVZGJpj4p607nUOTuWy1/YfvN1Kjm+g6jiUw6o4sXsOxmFW/K/aZevdoFNf3Jzb1cSUf
 1V36hlFzjH5UD9kIsRxkeFK+8ly88x/dn1mfr1jTnnnsijdtiCBUuwb2sDf5VEDtm8n2
 T1aCfGLBlMqJdoLxB6f/gJ2z6Ja25pptJ0pOIEVQeepVbgFQNZAUgVS3AEkxO4ejPtgE
 LeEZzSTm2AeTSA3Gpm1L8oH7NzhNH3h9J3naYEYENP39rDE4kgUwsdKAeKYyrpUgLHXz
 hZ3Q==
X-Gm-Message-State: AOAM532aOuTNjXNZU/oGR2Rh/DMyhXkd4WjBaianVqDQGsPZEx3b1+XM
 dFGtJKceHh6zoD04AheSGhlzpRP+79zUTQ==
X-Google-Smtp-Source: ABdhPJyNawzKqURLGzo50Uw/QgeIp+fQPRuCbmztsDlAc0B0tq4c0nRjLhAwCEmK4uYEcV/lygz10w==
X-Received: by 2002:a63:ea05:0:b0:381:1497:63ab with SMTP id
 c5-20020a63ea05000000b00381149763abmr2224150pgi.463.1647493573926; 
 Wed, 16 Mar 2022 22:06:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 35/51] target/nios2: Create gen_jumpr
Date: Wed, 16 Mar 2022 22:05:22 -0700
Message-Id: <20220317050538.924111-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out a function to perform an indirect branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index d5f2e98de9..f61ba92052 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -36,7 +36,6 @@
 #include "semihosting/semihost.h"
 
 /* is_jmp field values */
-#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
 
 #define INSTRUCTION_FLG(func, flags) { (func), (flags) }
@@ -168,6 +167,16 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
     }
 }
 
+static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
+{
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, regno));
+    if (is_call) {
+        tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
+    }
+    tcg_gen_exit_tb(NULL, 0);
+    dc->base.is_jmp = DISAS_NORETURN;
+}
+
 static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     t_gen_helper_raise_exception(dc, flags);
@@ -387,8 +396,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, R_RA));
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, R_RA, false);
 }
 
 /*
@@ -418,8 +426,7 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, instr.a, false);
 }
 
 /* rC <- PC + 4 */
@@ -438,10 +445,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
-
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, instr.a, true);
 }
 
 /* rC <- ctlN */
@@ -838,11 +842,6 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-    case DISAS_JUMP:
-        /* The jump will already have updated the PC register */
-        tcg_gen_exit_tb(NULL, 0);
-        break;
-
     case DISAS_NORETURN:
         /* nothing more to generate */
         break;
-- 
2.25.1


