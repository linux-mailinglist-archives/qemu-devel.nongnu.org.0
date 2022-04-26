Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB84B51078A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:50:29 +0200 (CEST)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQGY-0001a1-Ud
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmX-0002YL-QU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmV-0004MS-AD
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id z21so9082745pgj.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4LG2ggGa5J5Lu4I1wse39Ww5a8efRD9iZexWoAzkdh0=;
 b=wLsYfP+d9KcZPoO/twVsghfqaNA9+87J+Cd9ox66aNpl2ZqoKtFxICsQUGO9Q1OCdN
 HArTHbxjHwREH5iyX0QTKCeXpYek7b90Wl5rxZ21yFK3Ar1NFHWtpRnkeziG9T4lkQeR
 zCgU8nCckveRxvwiG1BPc+/LiyExxezrdnZClySt3k8qxwNx6Wk4BIjXR1ecOKbQCjrB
 365SlAEOeIvPfPffBmfWVrjxce8w7sukpkAw+DGMDwZxvVokiBtl5sBSkDMq8XByE9D4
 0xUA+X4J+CPWdd0Frv3g43JbUOXYxL7unbQYtreGvmxAu6PArKAvk3+5VnzNsHEWGnHz
 q7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4LG2ggGa5J5Lu4I1wse39Ww5a8efRD9iZexWoAzkdh0=;
 b=20+Q2GbDz07QjrNp84jNPK7DwUebeaBVJ3/XOWtF8QoxzGOnBM+deTvrZ3dmWSpu7D
 994RrAnzFWMOhhUwrOC34Vrxtdd5bai3fap2JxQ0NySb33snlozV4nFQ5wrpSCvnYowK
 7zZ2kWeZjg8B9Uy/lEMCaYjAf0pTTBUE0XBPy3UbCKYJu7J0I2QxUObQA3viiDErjpPZ
 W5SaMAPUZJeJRZx5/LHSxgGn70Zd+6BmrRcfuX0Gmf15ogNm/ZhwEIlq5w/JEwD7FoLY
 KEn6JgUnKF9/FETtFF/pHra5k8cDOh4P8AIxdUCeDzNWgW5vipOMWle7LdKtLuIcyX67
 MZpQ==
X-Gm-Message-State: AOAM531TB1PZqqmzMjb0VtzWptJL+DyPtrtOkHohIK/O71I8blbWMABs
 mH6kpD4yjiVAJVi9N4EVaHU4C4bdqW7x1g==
X-Google-Smtp-Source: ABdhPJwZe/Pso1hAnb3Zfphg3hPVM07zDKZTUiHJ2zjf6qYNgd1HSZJyqKWqXhNY3k+j3PpM23sKPA==
X-Received: by 2002:a63:e51:0:b0:3a4:9d22:1fd5 with SMTP id
 17-20020a630e51000000b003a49d221fd5mr20793126pgo.586.1650997160895; 
 Tue, 26 Apr 2022 11:19:20 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/68] target/nios2: Stop generating code if
 gen_check_supervisor fails
Date: Tue, 26 Apr 2022 11:18:13 -0700
Message-Id: <20220426181907.103691-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Whether the cpu is in user-mode or not is something that we
know at translation-time.  We do not need to generate code
after having raised an exception.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-15-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index eb97e13feb..d61e349207 100644
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
2.34.1


