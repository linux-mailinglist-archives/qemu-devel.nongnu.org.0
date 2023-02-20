Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA5B69D2EC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB7X-00053T-Gl; Mon, 20 Feb 2023 13:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6b-0004d6-P8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:47 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6W-0004Cv-3F
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:40 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 ei9-20020a17090ae54900b002349a303ca5so2292240pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmEW4Ui+jZHyPbqDarHaGkbuRfLpWlEHhDk+zbdrYtU=;
 b=KE5M8PODToCBTR0pToRAN7nDbgnF1tXZafIr6ziEOERldIy2eX9sgesXst5p28ailw
 Prfkwsc3w2oW6vbTT9P/MQLUzp6Dho+8+9P/LhJIdzs2aQQfyYo/F/5pySWBQ8eLSwUb
 FILHc0E4kiPkMvm6EqvXHO1TpyBwN44Xkl9dEjYrFGvwR5/4oKLyt36+ikFBWaV8CY2D
 6Cd4sePgOr8S6dEa4fgoGgO8czdch634Cv7PkoLLvX6rIG5ENisoNt507lctVJ+9QGpY
 bpk02/W6ANQmrfQfXzh7W8XA5ZYGCXg5XrJa/AAcRTCZNQl8HvuCs/apK707u991lh9q
 J8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EmEW4Ui+jZHyPbqDarHaGkbuRfLpWlEHhDk+zbdrYtU=;
 b=L3shCC+cf0X5/uHt8QNlMrN8jrUt4EACxCQBX3ntea4c7SaNYe/L4iWHPO+0uqOlUt
 ggI+BXrbAbIloSFs3h91zFdBiKxFZvTABnnyPsXQeeq7wTAD5ROIkBWKquJi/XcjJS0Y
 hMOg322vYXp+LFvQliaRndkrCQQbpwmjKoP5n4VkirjwfO9vW6e6FE7crWf3t/40CpbD
 k0p/ZXxwWZOMq08F0Y2LZlC5R9PkyQZ/bjjfeWNwo5GxyrCMfhCQPmaHfAodygvUALwE
 lxyodzIpHbVwkIfn1fctWSBOQNcL/r+dMsNk73clQNcbqEcg7FC+sYo9WtuEmprwWkcN
 tvxQ==
X-Gm-Message-State: AO0yUKXVKn2nD/k5EE7Zrkm9xSgdtBsJgDjMieP0Wn/Y8usnE/k+MAd6
 VHtIx6qELLDOFNu6qo5GLbQmmW1VJAvFjFob50s=
X-Google-Smtp-Source: AK7set8usoZarRj4DsjxS3h/q466zhS5tc+7SH/nRn2REiliVX5ycpiKkvkxk8E/eBQwhKboX+T76Q==
X-Received: by 2002:a17:902:ea12:b0:19a:727e:d4f3 with SMTP id
 s18-20020a170902ea1200b0019a727ed4f3mr4558619plg.5.1676918492223; 
 Mon, 20 Feb 2023 10:41:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 20/27] target/s390x: Split per_branch
Date: Mon, 20 Feb 2023 08:40:45 -1000
Message-Id: <20230220184052.163465-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Split into per_branch_dest and per_branch_disp, which can be
used for direct and indirect.  In preperation for TARGET_TB_PCREL,
call per_branch_* before indirect branches.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index afa5f56fc4..878b220bf6 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -362,21 +362,25 @@ static inline bool per_enabled(DisasContext *s)
 #endif
 }
 
-static void per_branch(DisasContext *s, bool to_next)
+static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 {
 #ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
-
     if (per_enabled(s)) {
-        if (to_next) {
-            TCGv_i64 next_pc = tcg_temp_new_i64();
+        gen_helper_per_branch(cpu_env, gbea, dest);
+    }
+#endif
+}
 
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
+    if (per_enabled(s)) {
+        TCGv_i64 dest = tcg_temp_new_i64();
+        gen_psw_addr_disp(s, dest, disp);
+        gen_helper_per_branch(cpu_env, gbea, dest);
+        tcg_temp_free_i64(dest);
     }
 #endif
 }
@@ -1188,7 +1192,7 @@ struct DisasInsn {
 static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
     if (disp == s->ilen) {
-        per_branch(s, true);
+        per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
     if (use_goto_tb(s, s->base.pc_next + disp)) {
@@ -1200,7 +1204,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
         return DISAS_NORETURN;
     } else {
         update_psw_addr_disp(s, disp);
-        per_branch(s, false);
+        per_branch_dest(s, psw_addr);
         return DISAS_PC_UPDATED;
     }
 }
@@ -1208,7 +1212,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
     tcg_gen_mov_i64(psw_addr, dest);
-    per_branch(s, false);
+    per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
 }
 
-- 
2.34.1


