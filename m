Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA793B6AD9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:10:36 +0200 (CEST)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzSd-0003nj-JF
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQV-00011K-3T
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQL-0006Gv-Dq
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:22 -0400
Received: by mail-pl1-x635.google.com with SMTP id o3so4654856plg.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBvB7U/HcEMO5AJVKY9MEDQbcWzedaB5pCNHh5Z+IcE=;
 b=RPC9SseCcqxB9lEiduVeL9pwQ8gRK2HwxonuZKBW4V5rm4uGr0Q3/aA2BCcy7FXafd
 RjxjDsQLgDU3gshpv1eLZ0uTSMrLn5MOpDXodjFBEP7qJ31osCu5Q48Lt+Gsu+miXFBw
 xXbKd+TvOkV5NghFqXyk2vSMEODLA4cxpCCvd/9MF52L1H/EU3Nd4r2xqF0EEn5w/hQD
 1QXSFdshR4849izTpVFlXGZERN3qQcDkTZs8+Nbm/U0NEPWwwSpGzfKAlp0t8eBKjihF
 0RIFHNmEO2y9N6kc6wU1aIJCEww1Rlwph44jYPBAiZph8dJYz87824eBFFuma7WnNAk1
 SqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FBvB7U/HcEMO5AJVKY9MEDQbcWzedaB5pCNHh5Z+IcE=;
 b=M7STOxYu+g5iUfgu7BW+J3PDh9Cbs9dvS90i1llhvl+t30MMHuwXsoNLoPBssddT2L
 1Gtbja5wUql0InX/0dCzrYHMUad2x9rNoiKgNd8HaxxelEeAdsV4z2j1TIW7cBPNQTe1
 Kavi+czS49Fij7ho+ewLMdKgWmn4BCKllfO49vDXIqWV1lKrmmLI9HyWw61ZnVo8iTYP
 SNDw7o4mzoHTEdA/WsTelplt2wOERcyuymTS45tsDso9XWfquGyw7EFcWk9voYqXtFRr
 z2yy6Kelb5K3u+KlKw+beUziu2x44ouhCu5G1OLIj9h55pj65HH6dOomulNtyzjkPf5Z
 Vg3w==
X-Gm-Message-State: AOAM5319AecrTp4FeX6sbdMxBfGDXlLbs5cqMC2afDUrLzZJ4M6GoG+M
 I0NBOTpamFFgYtWjRiF3BoB7u02p1MpClw==
X-Google-Smtp-Source: ABdhPJyeLitM01AzjxOqcLXiGb4KsxhLVKL/gBStgEqqoNLjlOeFlWFROp7liEAhqQhP3nyhkIWy6w==
X-Received: by 2002:a17:90a:4091:: with SMTP id
 l17mr15466170pjg.12.1624918092114; 
 Mon, 28 Jun 2021 15:08:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/9] target/nios2: Replace DISAS_TB_JUMP with DISAS_NORETURN
Date: Mon, 28 Jun 2021 15:08:02 -0700
Message-Id: <20210628220810.2919600-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>, crwulff@gmail.com
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


