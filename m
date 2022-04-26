Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD0F510753
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:43:35 +0200 (CEST)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQ9t-00055b-LW
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmZ-0002Zq-KO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmY-0004OA-3y
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:27 -0400
Received: by mail-pg1-x529.google.com with SMTP id r83so16743077pgr.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+pIlq3Zf7Ct4aEs80TxFQjBRjx+ntMdX+PCJRolBhs=;
 b=h1M3ibQBXkj7y4vkNLhPwa2fp6HzgBPebAtCu/FIOr/3s9Y8zM9gPUYO2uC7DRFOVe
 NKooUyUITPmzRKCneXz5bFiGGGshblIZwsayp+foyh0MfSqs9/+ZeZLAxaM+ByvSDmTb
 YhYaPhboYAEZHV/zlbLA0E2n5PUr1wo2Jpa5FHx/HfxSYfwhecA227pZvKDA1tnbL2hS
 ti9PLcEteXSYkI7JCS3nlLjFdsRg9VlK182NzKMYkkGtvMVX8O4cxUfp9QSOC1cdfADG
 r86cQtAbBtiGBd9FelFirjh9usi3nZsBNuL1fwtyPChiUjZOAMdo4Qr/OkjFrUDgrzs4
 cc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+pIlq3Zf7Ct4aEs80TxFQjBRjx+ntMdX+PCJRolBhs=;
 b=S9JgSgslTgGbMk+re3bJON+QIvIOzxF/7+SEfIix4ZZVMdf8yAYsJT/zQA7AhaLuFQ
 8J784vGVrC42n4MxvAeaRyyxZgjll8Inve8GDyd/e/SjbhJjHNPNVKVoCtavJYC0QgMg
 ws/Bjz0NxucbQbz3QQWb27KIiM4KSh3JBr4U+n+RkvgSTBH+RuN1Y09zbnZM5YG8HL4R
 tjudpkycUrqswG9T8he04hva6Z7QSCx1X6/6LlS+SC8TkTk38shHikG48G/TeITaWxvJ
 /r8v83u3MkBz8Vxlwlh9u9rb1+CLYWk97ThMJUCiIIwPt839WcaB7fdmQFNeaHg+TI6X
 PhVA==
X-Gm-Message-State: AOAM531/LqeHKviUXyeihk4i3PTV6PBzCMl3ar623r0c+pz0RMDfe1tg
 ZJZTHGC7Ra7XSccjoF4ovR+80E3OAcTRuA==
X-Google-Smtp-Source: ABdhPJwzsKB9i50pm2uBZFBPAEfqPxld02DPKBX3RF2Cn7zXSUVYjN81FyNxlDr20HQyMoCuz2mtNg==
X-Received: by 2002:a65:6657:0:b0:381:1b99:3f04 with SMTP id
 z23-20020a656657000000b003811b993f04mr20390053pgv.512.1650997164770; 
 Tue, 26 Apr 2022 11:19:24 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/68] target/nios2: Fix BRET instruction
Date: Tue, 26 Apr 2022 11:18:17 -0700
Message-Id: <20220426181907.103691-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

We had failed to copy BSTATUS back to STATUS, and diagnose
supervisor-only.  The spec is light on the specifics of the
implementation of bret, but it is an easy assumption that
the restore into STATUS should work the same as eret.

Therefore, reuse the existing helper_eret.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-19-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 53699ee088..3694f2503b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -407,12 +407,22 @@ static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
     dc->base.is_jmp = DISAS_JUMP;
 }
 
-/* PC <- ba */
+/*
+ * status <- bstatus
+ * PC <- ba
+ */
 static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_BA]);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[CR_BSTATUS], cpu_R[R_BA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- rA */
-- 
2.34.1


