Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B72B3B9407
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:35:04 +0200 (CEST)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyyiV-00067g-GR
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZj-0004dC-PA
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:59 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZX-0008FY-Od
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:59 -0400
Received: by mail-pg1-x52f.google.com with SMTP id o18so5784662pgu.10
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ml7uB0OtQwcxX5TZhhBtWO2veCNQTvvwJhhIq0gQl44=;
 b=i1cgegt7gkgPQ7KB4t5PbQCp2cztGtdmmUfl1Bn5m9ArVgu87g2+IfHsF3J+e3LHAH
 MHtaJGUaL4COmZXZAsrHCIoYHXHQidSboKxMUR/nPzBBECqJKQBPdV8FxEOEzIMyzOPf
 nDbD06XHUmp9xNTgwuqwtkJdNKSKn91QHbO8AO4QU95XuUgK5EaikaXMw5q6+nTkHixk
 Y8zIKVlqsngyBcGLClI1bgeDaw/5O5lyq6dVvh41vxW8Ryj+0cOYWxpUcXRhW5tfFjLn
 3BEb11lHbsqGlIrje3l6IRP2laSqWE+l7+0qRX/65ZgKOsNe1I0O0EsDJFdieYNaLItM
 Hf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ml7uB0OtQwcxX5TZhhBtWO2veCNQTvvwJhhIq0gQl44=;
 b=HjUFe4xyH/oEzr8Jh4AHvf+VMplIs8HAAQ5JEjfmqQLITVhK5zqKyh3Gx2m+skWaiT
 bSHaJmtobnpk6bPQO9iN8TsFY0M85Vs+tTfo+r1TBqQBUfdrHtNE9QRyLqniGUODzurg
 SLNVa4ckD4UFs3gRou4+70eTtlGOwMwl0lthm0HHUNz1VhIASwen5ASqpcjqzibgiZM6
 jDlWetdiJrNyImNtivYdqTRl/v4Rn1vNbSk8Hsao3fRLMMsLWgOmG9AGlhwkWD/J4USw
 PpTSCmhRe04Z1aRMxKKrfj6+ZRiAdKy5pJcXm5i6IdgbFHib+XJNjWqPfrbHzDGJK+94
 UxQA==
X-Gm-Message-State: AOAM533fuYINmd14EGmoJhnuSOnvAFF8l8rA1kVX3UBG1kzmBZMIE9ut
 NNKQDrSSUsMciAkAkG60Fk2E4RLGYDO0BQ==
X-Google-Smtp-Source: ABdhPJy61jeH9FsRfWZ053FACCgtYlsj5JxmL4EsFQOu8RuZd3+48yvS4wg5Z9rTBXBwPi10zZMROw==
X-Received: by 2002:a05:6a00:c84:b029:311:dced:c744 with SMTP id
 a4-20020a056a000c84b0290311dcedc744mr557641pfv.52.1625153145201; 
 Thu, 01 Jul 2021 08:25:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] accel/tcg: Handle -singlestep in curr_cflags
Date: Thu,  1 Jul 2021 08:25:31 -0700
Message-Id: <20210701152537.3330420-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
index d0177d772d..586f8ca4ef 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1437,7 +1437,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
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


