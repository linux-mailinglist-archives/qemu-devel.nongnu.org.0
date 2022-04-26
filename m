Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83544510810
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:05:14 +0200 (CEST)
Received: from localhost ([::1]:34948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQUr-00080T-Hh
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq0-0001rq-6V
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:04 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpy-0005Sb-AP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:59 -0400
Received: by mail-pl1-x62b.google.com with SMTP id q8so7842845plx.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ECkUiferYymqY4Z15uQTs5z/1lpHpfnUwzpraAW+MmE=;
 b=oO381OdIPVQRnBJG9j5lE3c4+mN7lc0q5Ag+dC3TSCCGgCiWRYNHxIH1UaWYS3VSvk
 jS5iBa13mYN/Q/2ICk9fjYTSeuknKi6scbVtm1riWsIxptHAirmtK31sYzNGNScvyVr5
 MEANgxSbMB6qb+4a2lfAr1mpjbQvDxQQ92dH3KSPvcRfEF9BVRqmzshqfCI8FxxRuUND
 3OESMCOkHkfq4d2nZO8DHlMQkuIfuVWSXXAE/CLrOVS3MhERQh9SP/ryw9sGBfFK3NEb
 oC0XZOblaV22c21Z9KSZS730ZMBQ7botU45FOVWbX/cT3ZoKgliVe1x2Z4+Krnn4kZPa
 UHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ECkUiferYymqY4Z15uQTs5z/1lpHpfnUwzpraAW+MmE=;
 b=gSpJeRJVg4WbhWoVi3eyuj8JEBztkl2ck6VnNNADUf4In4uNMmPxLGoh+9VBwgEOrC
 Td9FTI5BS2QmChJT4J3uT7d2KfuzC59aVkzS0WHOrt287dFivr98n6j4lOHNzJVqw3m4
 jbzjjU20aVV0FH4d+eOlgu8Lciku6iaW/1gScaHmqZroU/SswhMkT02IYkUUuygLyWNR
 a37y3eR6j9YKFsZAJIYP/AbzBARDf/92E6S4Jtu+5eg7N0vAftuKO0qnWnDZngMhF2gO
 ZmojLf1Drui0xJDI91OTmZDqG2Ra/edHFveSQP5wb6Vs5x8m4MqEkqFgERJjc65+TT0E
 QA8w==
X-Gm-Message-State: AOAM533S6pbIo9L4BvB1gS0rim8T7H93MbFIGo67lhxPFJQtR/r17d6t
 OmJFtj/UcIszCGJAHYM86Cdu3BlG7U7VzQ==
X-Google-Smtp-Source: ABdhPJy8RnUH9MMW6L/4qMmjcWPlSXshBriAUYOUxjE5oHY88ufh5NB4pqy5/43irlLtkVJE5btE6A==
X-Received: by 2002:a17:902:bf0a:b0:15c:df1b:f37d with SMTP id
 bi10-20020a170902bf0a00b0015cdf1bf37dmr19462963plb.90.1650997377049; 
 Tue, 26 Apr 2022 11:22:57 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/68] target/nios2: Hoist set of is_jmp into gen_goto_tb
Date: Tue, 26 Apr 2022 11:18:52 -0700
Message-Id: <20220426181907.103691-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than force all callers to set this, do it
within the subroutine.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-50-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 8616813365..a55270cefa 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -192,6 +192,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_exit_tb(NULL, 0);
     }
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
@@ -235,7 +236,6 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     J_TYPE(instr, code);
     gen_goto_tb(dc, 0, (dc->pc & 0xF0000000) | (instr.imm26 << 2));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -278,7 +278,6 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     gen_goto_tb(dc, 0, dc->base.pc_next + (instr.imm16.s & -4));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -290,7 +289,6 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 /* Comparison instructions */
-- 
2.34.1


