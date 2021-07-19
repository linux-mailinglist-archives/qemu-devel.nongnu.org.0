Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D13CEE21
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:31:36 +0200 (CEST)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5arP-00056b-D2
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj0-00043w-Kv
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:54 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aiz-0000pE-2u
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:54 -0400
Received: by mail-pg1-x536.google.com with SMTP id i16so2977663pgi.9
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXNdPSSG3EvHjS1ff9yaYX7BJ5tWCVTACEwi3klwS+c=;
 b=PAmIzVUGWdATnJdw8/yXcOltBIqBKNhlnuLJB8R2h5k8fAmSRGaD9TnGO7I3IjY8g9
 Snu2X64IZHrN2xCrcUD26iJ9c7Swm21YWRYOXjX4slBeYgR5qTfw/WcggXvlkusUMg9M
 fIBfr4YkNRBDfe6yl18C1WsNnypVgN/rQQv9cWodf2kF2G9GdIph+nT3sB8O2ugZ0aXC
 qXfBe0Cq+WoVQB6i71Z9JAdL/NsZO0iQUK16nlJi8ePVBcN/ev5ihuxXdtXNmzvqiJBh
 r74wCziT9w5Npiio/Oz8aInhRPE3mv/7sSr8+GdQ3Tg9g4zTtKIp9qWCy0SrnUkL4YSr
 TiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXNdPSSG3EvHjS1ff9yaYX7BJ5tWCVTACEwi3klwS+c=;
 b=Yaw3Q+vSgn+E4sFMlgZ3fjc9fGCL9jeH6GXjpeduNQV4lAWE6TOMLVG5wElc0tzsXz
 RKLUP07cdZhpvtia2U3ganKGXAL8FRdxXJPurBhDcWYmx9feLuWtv0sMri8nAX7myhV2
 4GKjfKE+0hLdOcSo4EBDRF+AFnqBEDhlRvTuDik4at+lV/43o9kOLLb4eQaXhuaDn/4Q
 6yo6ms4kvAjQ4t1w2+2G1tLCMebQzIyvsYpg08IRVlU9P4e1uPueBQFW0GulrQykmec1
 1IJjzGkiPU62y/9YuEenCXD2FyzX68OOZh2CgLXdeh5brt7UiJ2Y4KtOTroWzD65jaaU
 DuBg==
X-Gm-Message-State: AOAM531e+WmtO5v/0lZtDKgQA0ToHpCnFKRjydID5Rm/pPtvSqxTyTKN
 JY2pb3aw2jpYqOit1h/rUVhKtwxNoZ1nPw==
X-Google-Smtp-Source: ABdhPJwBV89/iXxO3Uup2wzTlxzv9q0ywmceKYm2u2yCzwtSORHqQoxAHobFvXNeLTtaFpnmHyVDoA==
X-Received: by 2002:a63:1205:: with SMTP id h5mr20476205pgl.204.1626729771823; 
 Mon, 19 Jul 2021 14:22:51 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 06/15] accel/tcg: Handle -singlestep in curr_cflags
Date: Mon, 19 Jul 2021 11:22:30 -1000
Message-Id: <20210719212239.428740-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exchange the test in translator_use_goto_tb for CF_NO_GOTO_TB,
and the test in tb_gen_code for setting CF_COUNT_MASK to 1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210717221851.2124573-6-richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c      | 8 +++++++-
 accel/tcg/translate-all.c | 2 +-
 accel/tcg/translator.c    | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 70ea3c7d68..2206c463f5 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -149,7 +149,13 @@ uint32_t curr_cflags(CPUState *cpu)
 {
     uint32_t cflags = cpu->tcg_cflags;
 
-    if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
+    /*
+     * For singlestep and -d nochain, suppress goto_tb so that
+     * we can log -d cpu,exec after every TB.
+     */
+    if (singlestep) {
+        cflags |= CF_NO_GOTO_TB | 1;
+    } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
         cflags |= CF_NO_GOTO_TB;
     }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5cc01d693b..bf82c15aab 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1432,7 +1432,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
     QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
 
-    if (cpu->singlestep_enabled || singlestep) {
+    if (cpu->singlestep_enabled) {
         max_insns = 1;
     }
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 2ea5a74f30..a59eb7c11b 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -39,7 +39,7 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
     }
 
     /* Suppress goto_tb in the case of single-steping.  */
-    if (db->singlestep_enabled || singlestep) {
+    if (db->singlestep_enabled) {
         return false;
     }
 
-- 
2.25.1


