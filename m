Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE78F61E004
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 03:39:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orVXv-0000Qy-SM; Sat, 05 Nov 2022 22:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXs-0000Iz-8S
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:38:00 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXq-0003KV-Pm
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:38:00 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 f5-20020a17090a4a8500b002131bb59d61so10131189pjh.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 19:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFcVkwwKAdXNW2Qi73KZvrPPSPwknY42Yj0GP3GIix0=;
 b=e+58qIxgbt7v3Ue2YIY+lIGTDQBnuupUXpPzvHKIQGFCkQAfDagkw8XBKR8U2O6mon
 qvIHiSQQhgVZ+pc7rK0oBb4CSSIPVzJgmo3w/1H0vxG6xY/AnU1UhEc1m8F4Jywtnj7n
 JwO6dvGOC6Sd0EgqHaadA0CmyG3DT3Vflu37lV51MO9lqoqzEd/s5r1GoWMPSJTj8BOG
 kAP09GQdJi4bY6xF3CfgHxRp1awNi93X6knpzFkuOqLgktG8sZtgfXpWY8BBIPZ9LpcA
 5XLrp/YHfI/SqdBq/LgueezupjYu0Z4cCYTW7gTBEe6kyXBPxYowgPe6NVkVskQz8uwS
 TyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFcVkwwKAdXNW2Qi73KZvrPPSPwknY42Yj0GP3GIix0=;
 b=XNqaAQR8SQvvsnFunoJiP5LbqmibCIwoXZGoU664+FzN+w1R6oKZ/agw3F83Jl+tnX
 d4WQYPabyGjw68sOOTKcTDYl/w3vJKpSty91sCG9EHzefmlN4rCHs7JEr2XdbeeenfgT
 /rdCHorc8jfvQ49C4TCQrGtqSnRzw7VnnlalQOtMI+PT/13Oxf08RkO+GKGEpNZ7yok+
 z5j0W70hKRLKvpTRKBMxV3WimYwU5H1cvgOg9iTZHN1PYQsPXC7MhTM/n/VP7HhMKptx
 g2IQ7V2Y9oXw+kfCeXURoOUxjlZUw4B/ctE/kr6ufCgv189jtGahzKy5lrvSqM9q85oc
 bODg==
X-Gm-Message-State: ACrzQf3nxmg1Lb6j2dmY8rMtvGRVeJWfEulRwOTQTgrxfKE4QwH6hLWx
 wYtF8B5buFFX/bU0p4PvWXt79OzyibaU/Ewy
X-Google-Smtp-Source: AMsMyM44rcRHAzCtU1bNlbWz+GMw5EeIvYqBOR1RoJo4ivKwBF5sEBSxifeYFODcjLsmV8uDeM6wMQ==
X-Received: by 2002:a17:90a:18a:b0:213:1127:897e with SMTP id
 10-20020a17090a018a00b002131127897emr570469pjc.246.1667702277334; 
 Sat, 05 Nov 2022 19:37:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d918:7a00:e617:679e:af7:63d])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a170902d19500b0018862bb3976sm2259457plb.308.2022.11.05.19.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 19:37:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [RESEND PATCH 5/6] tcg: Move TCG_TARGET_HAS_direct_jump init to
 tb_gen_code
Date: Sun,  6 Nov 2022 13:37:34 +1100
Message-Id: <20221106023735.5277-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106023735.5277-1-richard.henderson@linaro.org>
References: <20221106023735.5277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 10 ----------
 tcg/tcg.c                 | 12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 921944a5ab..9ee21f7f52 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -821,16 +821,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     trace_translate_block(tb, pc, tb->tc.ptr);
 
     /* generate machine code */
-    tb->jmp_reset_offset[0] = TB_JMP_RESET_OFFSET_INVALID;
-    tb->jmp_reset_offset[1] = TB_JMP_RESET_OFFSET_INVALID;
-    tcg_ctx->tb_jmp_reset_offset = tb->jmp_reset_offset;
-    if (TCG_TARGET_HAS_direct_jump) {
-        tcg_ctx->tb_jmp_insn_offset = tb->jmp_target_arg;
-        tcg_ctx->tb_jmp_target_addr = NULL;
-    } else {
-        tcg_ctx->tb_jmp_insn_offset = NULL;
-        tcg_ctx->tb_jmp_target_addr = tb->jmp_target_arg;
-    }
 
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->tb_count, prof->tb_count + 1);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index b43b6a7981..436fcf6ebd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4228,6 +4228,18 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     }
 #endif
 
+    /* Initialize goto_tb jump offsets. */
+    tb->jmp_reset_offset[0] = TB_JMP_RESET_OFFSET_INVALID;
+    tb->jmp_reset_offset[1] = TB_JMP_RESET_OFFSET_INVALID;
+    tcg_ctx->tb_jmp_reset_offset = tb->jmp_reset_offset;
+    if (TCG_TARGET_HAS_direct_jump) {
+        tcg_ctx->tb_jmp_insn_offset = tb->jmp_target_arg;
+        tcg_ctx->tb_jmp_target_addr = NULL;
+    } else {
+        tcg_ctx->tb_jmp_insn_offset = NULL;
+        tcg_ctx->tb_jmp_target_addr = tb->jmp_target_arg;
+    }
+
     tcg_reg_alloc_start(s);
 
     /*
-- 
2.34.1


