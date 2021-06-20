Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E53AE0B7
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:36:09 +0200 (CEST)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv56u-0001rS-4V
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53q-0002HP-TQ
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:32:58 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53l-0008SS-GJ
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:32:58 -0400
Received: by mail-pg1-x52b.google.com with SMTP id g22so12529290pgk.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qZYFgo5owfVk6zq1cDCv8vj7PKVInUCjUJb6z1w1uE=;
 b=F23Wtev8aAJoEJXyCZxEg5HbH1+AdOJheSKIb/ket6m8qtP0/jdC7P7zgexn3WzYMa
 89y9x+jwwFB/oVIThxG2deqz9xgzo5pJbz3Vrs8LaVShXBzCNzv9Iip//tCQ5j4qdKqH
 AuLz7hOecy55hsmx9P3URjsYo6eQzjEYETh7HqsfGcXZrValklWhhRxhqWgB1XVUEB5t
 b21g+fCBDP5Ny2OMsLtrPyovSdKRlarebIQIrykHsCEeQHkOzRuoKNZKlvlF/2xe6DkA
 usQmwn4DmJ0qxIG+ZsAsFt12/kB6DcmiKuWHGkxkL/i3LpMOx0jlIsaMgyEtSIuJr7hn
 opuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qZYFgo5owfVk6zq1cDCv8vj7PKVInUCjUJb6z1w1uE=;
 b=JhfiEYvcdZxO1ADSfpsPExWHzAJDLz+oq2R/iOJFoKurPVzTQdHuxzq+KwWcjpMCvI
 /TA8OsSphBC9lsIwGtRR78aZQ8tgfHyY7KOLu72vih2ErWvSvs8Zhsnh9T9YeGavrwxZ
 IlmprNyJELfy7J2ReJPFEwbFJFxNxNWIeYegfT8WziC4hYu6vNutIQ4q53EoP8RD1A1B
 G9Lj939wY/NhKZRBASQmnyJGHpBJwdFQlIUjLOs0bZeHhwdn6lbbM5Wi1/FXkj2ojOuc
 Z2LdSytJYxma9G2st288FNA3l8uu/NTf5A70P1TYfQDqelVna3b5cGzo42O4+Y0d0I7r
 OYYA==
X-Gm-Message-State: AOAM530xXp3RrUrvz1k9baoF9g39cgK6p4PBm9xlT9g6PdekUgQp8mvr
 607FtIEToegyNVkAlv/GlcJz3jkp+CbzHg==
X-Google-Smtp-Source: ABdhPJxdWE4FtlvtgTBoNqbdJH434zuEiY8i7wntzExivfghkhpp+lZTrLDJWtvrItlyoZocodnJhw==
X-Received: by 2002:aa7:9118:0:b029:2eb:2ef3:f197 with SMTP id
 24-20020aa791180000b02902eb2ef3f197mr16058299pfh.27.1624224771834; 
 Sun, 20 Jun 2021 14:32:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/11] target/cris: Mark exceptions as DISAS_NORETURN
Date: Sun, 20 Jun 2021 14:32:41 -0700
Message-Id: <20210620213249.1494274-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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


