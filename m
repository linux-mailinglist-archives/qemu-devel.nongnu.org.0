Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7807D3AE0D6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 00:15:20 +0200 (CEST)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5ip-0000r0-Gv
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 18:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eW-0001WK-5s
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:52 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eT-0007qt-EM
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so9075837pjq.5
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 15:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGPuQ96khA6BN7ttYpkCEpnz8SyOo+2mAqDfZ6XIx6k=;
 b=pcLYdX/eEh+q/wLgYfmqmbah0sM0kSiMTXDGMKjG6OOFylRxpmPPukMNs9A36LoLJ0
 5U28Y1U6/UUhp7wn02dRTPTFILdW0g58MLsZwiucwk8yS7As75Wssw+Pwrtpu18k5G9F
 WxkuzPEeEQXf+eZSxZy1HuLBNcvu9TGNy1AcHE07RaWHRCeyb7PloSOsScZWS5lCiN6V
 nsSHA943bNdz4qW7ibZZIvXONYI6LjjCmTAxIftfIvMcKi9Hy7RBaShMZWGxyFCpCsCm
 MXvTz0gWrXcw3Pead5JQWR7w9e4bJIBBpWNmyUxZ1wS7iOagiamHF1m1tJbA1o5dGmWK
 r96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pGPuQ96khA6BN7ttYpkCEpnz8SyOo+2mAqDfZ6XIx6k=;
 b=FLz1q3HsWQQEpGLy914C+S5u6xHWBGTf6ursOLlVKk5dzcf9o1GViwxWtExGAfT8M2
 CdDlof4qaYZ7QcDVJA2gRduEPCDv6Nq0SiUB29ELb+NDLh8ZxbgHr0RZo23r7OvrTe/7
 ZVuzXlw+lU0CweYS8UndF1K43FjC0e/Ar64d8bcibHaaPdwatElFw6i+bO4488iWTycJ
 QbAEflMxOx5ELIMe2/+SEmLnosyvSCZTEsNAqc6UE8NdE5bWT/P0lRe+0VkoOG953C0O
 22ZCuEQE19NFE9WFAgDst2+u9s8R5EkO0f9LG0XblKPrMslBErCXn/VwlmyNqvG8DJer
 1hOA==
X-Gm-Message-State: AOAM533HUtFsgHcCq+Cx7cxJvhTaSGJDtdRTCY/cLQ0kgIuWofOkmcnv
 IIcxxMfZa7nI2UJ0NVl6B6ZQ5WvNRc2CQA==
X-Google-Smtp-Source: ABdhPJxD0/55fcLm5Ox8WRlZoishPavODfRhzu/SU5JJrWoxDf8wqrL4637L++LcapbghPT7ENx5iw==
X-Received: by 2002:a17:90b:3b92:: with SMTP id
 pc18mr23188832pjb.100.1624227048142; 
 Sun, 20 Jun 2021 15:10:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm11122961pgf.20.2021.06.20.15.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 15:10:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] target/nios2: Replace DISAS_TB_JUMP with DISAS_NORETURN
Date: Sun, 20 Jun 2021 15:10:40 -0700
Message-Id: <20210620221046.1526418-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620221046.1526418-1-richard.henderson@linaro.org>
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
which is the same as DISAS_NORETURN -- we've exited the tb.

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


