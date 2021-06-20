Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC23ADC9C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:25:14 +0200 (CEST)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup1F-0004Zl-Lo
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxw-0005JJ-Vt
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxu-0007xg-OS
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:48 -0400
Received: by mail-pg1-x532.google.com with SMTP id w31so11273019pga.6
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qZYFgo5owfVk6zq1cDCv8vj7PKVInUCjUJb6z1w1uE=;
 b=MeGcgIkUojPaUt2PUP5BJce9SYH/8P7z2BAImjnfAIUiIUsUJlhwNtP0ArJPb9excy
 3w+TfpC6f2G3xF6k9f/UmCylTRqHh4ZAH1BlcW/iGdNIp/cTwXKzkNLSRUkyoduzXJud
 Xg5CmTrdJ3MkqPGs4ejxjXUTl94c9HBKNktqvZX4/rEaQB7tfEFRO0XJL41lDCHJ+IB5
 gONDUZE0UetTC0RkHBHRv4FpGh3xl5Q176UzSl0/ejU8fitKbOZ2+PgtI4kR1tdindHR
 J8TVfni/iFiT/svg/K8rKIj9HnlixSTRj5nn3imR++oPhhR0GvHf3nxF317incriEdPc
 LdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qZYFgo5owfVk6zq1cDCv8vj7PKVInUCjUJb6z1w1uE=;
 b=mPyOJ2Sau+bhVCsbfblksT2wAw1GyqtMu9bi5UpAAQqOvlYPmGa0E4zJl0YqtslHiB
 EQcOOLxKUUWtfBii/USoA6ChTy3p2DsPnoorGOGUC4gFbfQ/4m72gZSs5UxC4Vp3o3zY
 fxRxz0fvHmKduD0bgERdbqLuexw3fX65nT2nGhVhaecSbr2CMMMeRhhmclC5ZMvza1DJ
 RIzdx9CSlFBttaOco0eG/1CmH72A+AUSjNg5uvSkTHqfB+qNnoZjADIQAzA0mWkE6v1n
 N/CGBUhV6kZjOZW2KRhHxypMgVLYRDwye5BsFcl/J1gGVI/Tt7kF/CJRTiWB9xeMH4SG
 fr/w==
X-Gm-Message-State: AOAM531J7ezI/Y3VTYiLKhN52tmuuS9eyonPp4lbALJNKInjMwOAxQUx
 p5nYZ4I4YpU6ljgGjwoD/hScVs6RpVi7ZA==
X-Google-Smtp-Source: ABdhPJwewuwybRP1iFkKLyMNopG+kmJhvZpUnlCneRh2U/IkRStk1FEJGiHX5CWNLMA5gVWTGygnCw==
X-Received: by 2002:a65:638e:: with SMTP id h14mr17810222pgv.108.1624162905225; 
 Sat, 19 Jun 2021 21:21:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] target/cris: Mark exceptions as DISAS_NORETURN
Date: Sat, 19 Jun 2021 21:21:35 -0700
Message-Id: <20210620042141.1235541-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042141.1235541-1-richard.henderson@linaro.org>
References: <20210620042141.1235541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

After we've raised the exception, we have left the TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 5 +++--
 target/cris/translate_v10.c.inc | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 2ff4319dd1..f8b574b0b6 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -2874,6 +2874,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
                        -offsetof(CRISCPU, env) + offsetof(CPUState, halted));
         tcg_gen_movi_tl(env_pc, dc->pc + 2);
         t_gen_raise_exception(EXCP_HLT);
+        dc->base.is_jmp = DISAS_NORETURN;
         return 2;
     }
 
@@ -2901,7 +2902,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
         /* Breaks start at 16 in the exception vector.  */
         t_gen_movi_env_TN(trap_vector, dc->op1 + 16);
         t_gen_raise_exception(EXCP_BREAK);
-        dc->base.is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_NORETURN;
         break;
     default:
         printf("op2=%x\n", dc->op2);
@@ -3189,7 +3190,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
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


