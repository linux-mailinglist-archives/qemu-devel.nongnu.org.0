Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E798D3B7891
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:24:26 +0200 (CEST)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJLN-0003c9-W8
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItR-0008WJ-Bp
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:33 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000tA-5J
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:33 -0400
Received: by mail-pl1-x629.google.com with SMTP id d1so33179plg.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XHdB1I8aK6ZOFpKMHs281yG5ahJFgJAsOdRjioJDUOI=;
 b=mduk+61ykcVZeK4Er7w5axnTJO5lVejLQpBHQcJ8b5iK/cCq15K/G3w2RdVvRVi3oM
 qPi2vDowSKJmRlYcx7Tzrrh3e06VFw6A3sTktBzxk0ne7MqBwDAKbEAFo92Up7BweTAc
 yxY5WXTyxMCrt9GoXktnrcddMf74QCPzwYIgn+dqD0vJDcrzRc+xAc0JGlC7gu1RPD8H
 rx0p71+b1v/5XZxNRd3kUwyOqTW4fNLY9QlK0cMDitY+DtZi7cFEuCfOrvapMda9Ickm
 W/IzDVFWBBWMxUXtybzaBDohfOuIB+KEbO4rqj0lmMg2PfnsiMF4oDqRnAP6bwEaSXo3
 tsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XHdB1I8aK6ZOFpKMHs281yG5ahJFgJAsOdRjioJDUOI=;
 b=j5SV6SV8l9l196IZhTG5RC7DSPfdpH/KrArvK9s47KLcq9r+z8HvL+Huybn6xVyluI
 G2ObnWIii6YPJvfzvo5G2MMDihiP9BL4iWIByXTh7AFGEfAiO0YKtb6D9mDWX2MPKo4R
 e+Sx5FI4u6wGOFBecKGOmFufuiKxDW0syzVvSFN+u0Y63wnHsGoSoJJl+fUNuse3KLdE
 XqLUEN7meQsaGSBDrjWI+5rUHzPfdgK4CWdZ2Q/9gvYuFgTrNqoAkqHMEjCwdY2y9J/C
 KQcqp6c41tJHYPSGBWzAKLf9bdmgaabVureMIS4kRaITvnHZqmXx9LtMsfIkOy7u6bVW
 pQvw==
X-Gm-Message-State: AOAM530NiTGjIQ3j/5dxxeUDXOsdBbIOIwZV9BOkVGm1VXXfprLiCV+v
 4vqcj7DYyYC40+/+c9/17JRcTfQuVXmUcA==
X-Google-Smtp-Source: ABdhPJzpMZgmIAMB/HfGvGJnf3QLTbRopF984AWZbRvlioJLovQFsr5M8bHkGix4Id1fz7Td1xxF5g==
X-Received: by 2002:a17:902:ecc6:b029:128:ed8c:a025 with SMTP id
 a6-20020a170902ecc6b0290128ed8ca025mr7658086plh.64.1624992905174; 
 Tue, 29 Jun 2021 11:55:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/63] target/cris: Mark exceptions as DISAS_NORETURN
Date: Tue, 29 Jun 2021 11:54:08 -0700
Message-Id: <20210629185455.3131172-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After we've raised the exception, we have left the TB.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 5 +++--
 target/cris/translate_v10.c.inc | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index e086ff9131..24dbae6d58 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -2873,6 +2873,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
                        -offsetof(CRISCPU, env) + offsetof(CPUState, halted));
         tcg_gen_movi_tl(env_pc, dc->pc + 2);
         t_gen_raise_exception(EXCP_HLT);
+        dc->base.is_jmp = DISAS_NORETURN;
         return 2;
     }
 
@@ -2900,7 +2901,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
         /* Breaks start at 16 in the exception vector.  */
         t_gen_movi_env_TN(trap_vector, dc->op1 + 16);
         t_gen_raise_exception(EXCP_BREAK);
-        dc->base.is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_NORETURN;
         break;
     default:
         printf("op2=%x\n", dc->op2);
@@ -3188,7 +3189,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
             cris_evaluate_flags(dc);
             tcg_gen_movi_tl(env_pc, dc->pc);
             t_gen_raise_exception(EXCP_DEBUG);
-            dc->base.is_jmp = DISAS_UPDATE;
+            dc->base.is_jmp = DISAS_NORETURN;
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
                properly cleared -- thus we increment the PC here so that
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index dd44a7eb97..0ba2aca96f 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -61,6 +61,7 @@ static inline void cris_illegal_insn(DisasContext *dc)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "illegal insn at pc=%x\n", dc->pc);
     t_gen_raise_exception(EXCP_BREAK);
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
@@ -1169,7 +1170,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                     t_gen_mov_env_TN(trap_vector, c);
                     tcg_temp_free(c);
                     t_gen_raise_exception(EXCP_BREAK);
-                    dc->base.is_jmp = DISAS_UPDATE;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     return insn_len;
                 }
                 LOG_DIS("%d: jump.%d %d r%d r%d\n", __LINE__, size,
-- 
2.25.1


