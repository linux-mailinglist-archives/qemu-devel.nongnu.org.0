Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA934D4652
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:54:42 +0100 (CET)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHNR-000488-Rp
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxA-0004q0-LB
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:32 -0500
Received: from [2607:f8b0:4864:20::102b] (port=33650
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGx8-0007u6-Hp
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:32 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso6399331pjc.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bz8zlZqp+XNpUuV3WS3uKIWPzFVnLucU6nOyII1L55M=;
 b=RquWEd/RQnz2t0dcU7OLl46wGO6Id2FuSV+LR37+8Q+hx+Wb5XQ1DXkwOkszsAMVIL
 12iuxBODnyH9s1oIXx/N4sxSbRAD83q7ie7Xzg29F5k5hM8yVBzEUDZe33WhzV9cniHr
 awO0sle25OFlylGkmg1SKSfCV2c0leJcABisPvrCt3y0dbdw1quDBiIyKSSAQkb9bNpc
 7Z8NRCa0Zng8wc++HXtSHqkE4SOlGWzXwB1Xw5jcnFRhKuL86mC+ll0gBgbZt3/16fb3
 LFCQr/mFfR4AGblBFBugB+ko9v5qK4yLwW7HSif6zBNGLTei59r7pKwFIBeDjM4aDIYj
 sr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bz8zlZqp+XNpUuV3WS3uKIWPzFVnLucU6nOyII1L55M=;
 b=rvFbmD/7ZB9DJK32i73pUP7D8wxRP+KKLnsgjke5oF43f14XWyUa+svnwQjAky/m91
 TqeIXvx/qvVHk+mpd/DISudsMvLh+M9JAQ7R2O/q7pWHKnnubSbHVPFkD4ta5UeVyP0a
 5iAN1rSh/cEf/BpreXcxvaMvNmyelwrD05tMx2QyCZ04LTAU0X2pSwi35r6ETkvt1/hr
 qS4QvVF4JL+WOCSq7VUFSXeKqHl1WZsDhpCcfwZo9FihjTDxp6SUNiG+XFGY1NlsKxF4
 UFsqfNiCaL2CiNTlSBhZUbh0wNRqj2eknDPo3pMvqgwTpYPPgM+E3l+HRv8DeouEMJPS
 vtRw==
X-Gm-Message-State: AOAM530g+wnW1a2pEpB1PyyfwqwnRUpwwEIWisY/ZzFY/DVQlNyvKNRU
 0UpHQwVyAqV5F5L6N976tf9eQcsctc0ZbQ==
X-Google-Smtp-Source: ABdhPJyAIZUYT8bM1X7IdhppA2Wl+H94gLHixmSwJkjG+EPvYLB8xESVAQLzEApQh6oSsLGq5tromg==
X-Received: by 2002:a17:902:c408:b0:153:176:19a4 with SMTP id
 k8-20020a170902c40800b00153017619a4mr4693416plk.18.1646911649276; 
 Thu, 10 Mar 2022 03:27:29 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/48] target/nios2: Stop generating code if
 gen_check_supervisor fails
Date: Thu, 10 Mar 2022 03:26:39 -0800
Message-Id: <20220310112725.570053-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whether the cpu is in user-mode or not is something that we
know at translation-time.  We do not need to generate code
after having raised an exception.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 341f3a8273..1e0ab686dc 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -169,12 +169,14 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
     t_gen_helper_raise_exception(dc, flags);
 }
 
-static void gen_check_supervisor(DisasContext *dc)
+static bool gen_check_supervisor(DisasContext *dc)
 {
     if (dc->base.tb->flags & CR_STATUS_U) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
+        return false;
     }
+    return true;
 }
 
 /*
@@ -384,7 +386,9 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
@@ -447,7 +451,9 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
     if (unlikely(instr.c == R_ZERO)) {
         return;
@@ -474,9 +480,13 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 /* ctlN <- rA */
 static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
     R_TYPE(instr, code);
     TCGv v = load_gpr(dc, instr.a);
 
-- 
2.25.1


