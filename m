Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C1E5AE6DF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:49:18 +0200 (CEST)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVX4v-0007AD-VP
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeq-0003Ok-OP
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVej-0005GY-7A
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id s23so6612870wmj.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OGKK8ii462fh2FYHuqVoO8HNQ7SQYpLXPO2c0Erkaco=;
 b=nzgLiAURtWBJa6M/P/5R8CKZZT8hkCxWxG6BBTzCvbAO9EnqKeqtlt+jDdNycFfN0E
 g+OWKC8OHcmkF+ZLkfEkwWa4Pl8XNnGecRchsdN82zrh883CSQ804R2KJUv1rGK4Mvcl
 NIuKu2SKEx3MP0O3BC0aQHxhzT1WtfiYrlDq0EOkz3X/F8mw+A2D4vgx9NuwoQMVBNkj
 JJmlNRj0ETkWVjWm9fq5ygD6lKf4ex1s/Felg2Zb7z7HwUMA/cGboLkfBhHyVmFVQypz
 ZkBO14KJ4CuXeeN2brHhlJXQhmp0kdmMx84N+q5sUpBAXc019n7l2XemjHtFZYZE0rBg
 zrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OGKK8ii462fh2FYHuqVoO8HNQ7SQYpLXPO2c0Erkaco=;
 b=WeRHkhOZTNhnfoNmd7BlcOWx4+DJ6ig0Uqe9gcvkAGwVsL7h/9niSAzqR9UBuU7cSc
 uov3QyxdcRfFSNawprfyhA805WOqQajKBkWnRJsM1gRuOV0OSJgrTAGHxQDlYJU9KKjq
 lYpYarU+YaYHSUbHjWOwe03MN31mXHTC5FmkMROdxB7ItcdI/WQkFuCe+zxSHJNwPvk0
 oZt5TEc1jsKHmkeO3OIlN1NLKuBUpWqWe6qbtGvj68CL73dmCJUZwtEftRLaB4Afn0cL
 BYWwTHR33Bz/DaruFLjj8MII2VktfrS3+zntFKxxThrAAhNgTboOJVGO7Y3UW2AZCKxW
 22WA==
X-Gm-Message-State: ACgBeo0d/sSfOgcVsFPgoQnfoiyJmUf5uLN74MiNhhdQBDVCiBB/h39t
 57zN9z+/i5CxLuX94cQussCiVlq4FUt3Nujj
X-Google-Smtp-Source: AA6agR6qh9focY4Acrscwv0xHueeEK1EFoMcOAeLm0Vz7+PHvuNBi9rrLlErihqISJ4ngoE3p2fAtA==
X-Received: by 2002:a05:600c:25cd:b0:3a6:811f:3a0a with SMTP id
 13-20020a05600c25cd00b003a6811f3a0amr13311461wml.53.1662459487747; 
 Tue, 06 Sep 2022 03:18:07 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 18/26] target/s390x: Split per_branch
Date: Tue,  6 Sep 2022 11:17:39 +0100
Message-Id: <20220906101747.344559-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split into per_branch_dest and per_branch_disp, which can be
used for direct and indirect.  In preperation for TARGET_TB_PCREL,
call per_branch_* before indirect branches.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 712f6d5795..bd2ee1c96e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -350,21 +350,25 @@ static inline bool per_enabled(DisasContext *s)
 #endif
 }
 
-static void per_branch(DisasContext *s, bool to_next)
+static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 {
 #ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
+    if (s->base.tb->flags & FLAG_MASK_PER) {
+        gen_helper_per_branch(cpu_env, gbea, dest);
+    }
+#endif
+}
 
-    if (per_enabled(s)) {
-        if (to_next) {
-            TCGv_i64 next_pc = tcg_temp_new_i64();
-
-            gen_psw_addr_disp(s, next_pc, s->ilen);
-            gen_helper_per_branch(cpu_env, gbea, next_pc);
-            tcg_temp_free_i64(next_pc);
-        } else {
-            gen_helper_per_branch(cpu_env, gbea, psw_addr);
-        }
+static void per_branch_disp(DisasContext *s, int64_t disp)
+{
+#ifndef CONFIG_USER_ONLY
+    gen_psw_addr_disp(s, gbea, 0);
+    if (s->base.tb->flags & FLAG_MASK_PER) {
+        TCGv_i64 dest = tcg_temp_new_i64();
+        gen_psw_addr_disp(s, dest, disp);
+        gen_helper_per_branch(cpu_env, gbea, dest);
+        tcg_temp_free_i64(dest);
     }
 #endif
 }
@@ -1172,7 +1176,7 @@ struct DisasInsn {
 static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
     if (disp == s->ilen) {
-        per_branch(s, true);
+        per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
     if (use_goto_tb(s, s->base.pc_next + disp)) {
@@ -1184,7 +1188,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
         return DISAS_NORETURN;
     } else {
         update_psw_addr_disp(s, disp);
-        per_branch(s, false);
+        per_branch_dest(s, psw_addr);
         return DISAS_PC_UPDATED;
     }
 }
@@ -1192,7 +1196,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
     tcg_gen_mov_i64(psw_addr, dest);
-    per_branch(s, false);
+    per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
 }
 
-- 
2.34.1


