Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63CB6494F0
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:38:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG7-0006Zi-3a; Sun, 11 Dec 2022 10:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFp-0006TF-RN
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:37 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFh-0007tI-D3
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:37 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 db10-20020a0568306b0a00b0066d43e80118so5859237otb.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H8MpUEpMQiUpwtCPeAM5pmeXAHWrn/qz8xIsZr0JfzE=;
 b=Ix7+CxdzxAQxolytdhWBYHYSWyNwomrlSHwC6rqluphKWlrhBHKmKu6Nhu1975U67g
 6wyOuDE7j6Xq0fXTYisJAPDJwQ9yA97bg/dNwm71vV6ONBYryjAWBdIcoXNnh0HFFzQM
 slvg+LzwTfcMR0dpiTOwePuPHVmmj90WsoZcfzkeoGr5WrjRzEGl/mif8y0YU7Pl1k6y
 dHJduMJmm9IKBtbYcrS/sdYsc3Y5PzC4CkiFwu4kOdG8RhSHWxpw+gwdtjqOIGsNI3D2
 BJN6QOkDfY3OiMLT6yAo4F1tvjBSS5eLJgDuitedE7gC4rBBzpVQMk593CUl9BDv0BRr
 utLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H8MpUEpMQiUpwtCPeAM5pmeXAHWrn/qz8xIsZr0JfzE=;
 b=f7narUV9BtEmuZva95stBQoHh+U1VAr5ZYBN3DBYe8Z5CCqfWG+H0PcVeK53Hrsd5J
 IwpXO2yEtndPpYRGqLFd6Csx0LR+Vyw5AAZkUKzbgAOj0WiHxsudoixhwDWaCNB5TkAQ
 EXiTzq5hVQdspx3hn9hCY/W14cSVovShPetked+1pLxjTUOENPlKxnsEcyooWP9kGhrR
 vEQIzF9Z5l9Btrfc6+oRHzxFFcuWyqqR8i9ONF6qCEVkbC0VeO2mOMZs/W4vL7iHNfRw
 /cbkvZJHMrl5xUG4q011WF0STxrT+Aie812saHTIjM/T0bB9gXDT+CPgRwSJJqCwFcak
 iDQg==
X-Gm-Message-State: ANoB5pkYb8fKsMud5QzmPUeHWkQh2CHtScxZtPLZICdtoJ2WLUND4l9Z
 L8zAWpe/MXs7E331JyyP04WypfnodJJkLLNMXDE=
X-Google-Smtp-Source: AA0mqf7YqWYYgW2bFIF2GDyeuPQJSpGgFW9i6iiaE40KLCaZtH16pjx9Wpa0NzyJIeUFgSTdbupd1Q==
X-Received: by 2002:a9d:1ad:0:b0:670:583a:467e with SMTP id
 e42-20020a9d01ad000000b00670583a467emr7634743ote.13.1670772508293; 
 Sun, 11 Dec 2022 07:28:28 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 20/27] target/s390x: Split per_branch
Date: Sun, 11 Dec 2022 09:27:55 -0600
Message-Id: <20221211152802.923900-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 7506eff4b0..1192024f3e 100644
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


