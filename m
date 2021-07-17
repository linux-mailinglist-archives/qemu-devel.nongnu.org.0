Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3243CC6A1
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:25:41 +0200 (CEST)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ske-0004FZ-SD
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seC-0006tZ-GG
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:00 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seA-0001zS-EY
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so11571909pjb.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOLiMEmN0a3chiS5zK6wK/UK5sFKrMRuxK04aSAiGGo=;
 b=hvtLbmo0JqQJRwVE3/R8/tB9fK/D+5mU1FdDgwGTIBfLkARVJLLdfS5pmU2LSoLx8J
 veNdRS7DNusqZFRFH7KvnhVIhgp3aL1qgo2epcBifeiJuzqLFt390INVUoKDMFv4Zjbk
 7V1wg3tNKtBu2ea9h6869hg8U6oOtqkseztcxHNrEVKeQ3YULYDrILCZv9RBy9CJIaaR
 +s5emQ13KNC45EUVgiAOqxc/5GVkEUqGEkON68VFs8ay8PBwuUZXnlIKnGGLkogeGGci
 A+MCQeq/zLZG2jw/0zPQIXBxTq5yT5a1MxGpikRFxAFJ4w8MQuSxYdZtODzt94vN2fU/
 yKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOLiMEmN0a3chiS5zK6wK/UK5sFKrMRuxK04aSAiGGo=;
 b=etBzU5BUUHTtL9fgPqWGhF2iVMtoJ1JkSzqN3RkyAKOmRcAzfXJVvyOgjw3Nv0s1gu
 A/rcHcL7pwjaQRew+OSJBuhSviikaq+axlqMux3qVjGRxJMGRpDNgzAmiQgwKJSaiT/w
 r0uE+c1VcDj8z9OJDlyU+PyqtibQusV9dHsW2APaLaY0YQK8jVGZINgrLEWtH99RVepg
 vxyzG3RyDjTTQM5MkVt5EOIaFVe+3c8Ws3X+x3qfwh1Kb+BuUqnObNbz0vaUMWOxxjNM
 s/oXbsL3I5TDO5QpSKnelDZEN2LX9w+StzcrpjZDEnvchrIhwVXMGlC5l70xRzSbgwhA
 aqdQ==
X-Gm-Message-State: AOAM533zjbhSqVtPezoOLmXuPYi9TqoFRwwEEhQY1tpvoCDE6jN9lgC9
 q4kq9L1BTNwvgKod8laPYjDLeIzzyEr7Iw==
X-Google-Smtp-Source: ABdhPJzrcBR3ojTHihUaO8UBmc/aVwFuuQUT4Cf9M+jp1M3fGlc8YgwjsGjrYJNpyUe7MY/ZEINKfA==
X-Received: by 2002:a17:90a:86c6:: with SMTP id
 y6mr16353533pjv.16.1626560335840; 
 Sat, 17 Jul 2021 15:18:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/13] accel/tcg: Handle -singlestep in curr_cflags
Date: Sat, 17 Jul 2021 15:18:43 -0700
Message-Id: <20210717221851.2124573-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


