Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08EB3D17E0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:20:29 +0200 (CEST)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ihg-0005zQ-Pn
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOH-0002xn-SS
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOC-0005or-JJ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:24 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so503632pja.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kjlCqgWH6pPgYrklOenIkvHWm64/nMaB86DSmeNcAlg=;
 b=YGjJCsV4jW3tfALyF3pFrO4wnjAdq1xYzoYsQxpjmx398WULiH+gT3FaDttA+vGNq8
 1X6BJdmTvO3k4bSMLEXD6B0clRfAdPfm4ac4WssAbkyTEjmU3XPiTg+eFs0ZoKxEjszY
 XcjI7z2JNGlDd875wY8SsET9imM5qm/8s1b1Ik6Px5BOIC596zbsB1ppP/vZGG1mWamm
 luy0DUIfZQBSEyMiWOUSqSdNTfKzTNB+3bCy90U4+1Y5RW36AyIBEvIwvjkL63WxSunE
 D2jKZFz5aHo9e8HOUIwMa/pp2gWo5HqpxKvoVrUDvUOFRgQ94Hmf/dWUJgPJjoAtEVSr
 qkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kjlCqgWH6pPgYrklOenIkvHWm64/nMaB86DSmeNcAlg=;
 b=mFHbLMre5BcGv4g3owRVyZ7gLX+tgGgWlutNxn/5CbzgJWH8jCxSJvcefaf4Ly0Cac
 PXP/JWWVlb5JMUpFumAaWx4IjGt5olo6RCLMLT4PUPhRJ08c9ckwKAlvStKhiI1nFt5n
 D7bdyKVZY2Xk66w7dsCr+WIrqZtLlvKHKtVgguCMgoWj4I1Iax12m6C0n8x4kZTRo26g
 d5+dt803QQwdjYgg/QAU3BYIRe/JDvmulkqbBVx1dlOaaQSHAhxpa258vdCOsoFsx5dK
 /oxgR/w3+DcHaN8yT3l+rflqtZw/0Ucvtx6Na5eSmra0iPxiPuCzweYTqk9dplN9ofFD
 sfIw==
X-Gm-Message-State: AOAM532oTP1kVBj171jfGDdgl3rtqm9eyodXR6fFxWa0WXO6FmQ4fz3t
 J4+ShX4+oCy5oS4NiHcDKYh0cRe3psliOw==
X-Google-Smtp-Source: ABdhPJyGIiczQOFB/6wC1A303j0MwIT+/iPhB29S68vtD0CmUetmYU0lNeaxPwVZDZSwxFsMbsh83w==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id
 i22-20020aa78b560000b02902b977bed305mr38364016pfd.61.1626897619053; 
 Wed, 21 Jul 2021 13:00:19 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/27] accel/tcg: Handle -singlestep in curr_cflags
Date: Wed, 21 Jul 2021 09:59:43 -1000
Message-Id: <20210721195954.879535-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exchange the test in translator_use_goto_tb for CF_NO_GOTO_TB,
and the test in tb_gen_code for setting CF_COUNT_MASK to 1.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


