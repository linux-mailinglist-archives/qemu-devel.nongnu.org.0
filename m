Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718083C5F86
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:42:48 +0200 (CEST)
Received: from localhost ([::1]:36224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y51-0006tO-Gq
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2c-0003ze-3Q
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2U-0000v3-MQ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so226416pjo.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJUMslg4EAxSiYS9zA1U7hEkodGULeANuLs91s86cRg=;
 b=d/+oLDVTeNIirW6asf3jP7Xxzanwb7rHfjtheWoqnNFbNCWLohCEx68oAJJnYQLAfD
 JjiudqrtjkProhmLDgwN6Z5/sNSEoCmG3DD7cDc5fIRPlwJoQxi1l5sXaHPqqjPEhboQ
 iOzKj5Igyez22zcVGsKiC5Fl1wYbKzRBvNU327Ad5SMkPwm3KFWc6dPiN8BKwCFPEtcD
 LTRiRqBseTB97t/KW/mpVEBtTm9QDhx6mv9Sbxluz8vhHNCdHZz4RVNhAdFa7d7aLxod
 YIH/kmT9M5vEveRSSiiLITYJIxNjJvCiyPri11WykHNTvcCWkZ4MI6JPgWhb3OhWezdT
 zjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJUMslg4EAxSiYS9zA1U7hEkodGULeANuLs91s86cRg=;
 b=j07OwgDGrXv5JB68ODoqHQacsDtH1LIvXRo0mr4hu2Ae3JUsa/t2UQnnDCBUH6VzaJ
 JHJtKBfJPl46DcYPi1G/dOKXDbKS6AB0B9Dg2ea5JDELX50OU0/NtVLjuDjFZQPbyNcB
 E6QF9XOslS1RQJh0kAijVepCFzFD6Dao/Zvuyzm+FXPTlNeN9kEIca8356MSWmUVQOro
 9Uwl+TtRaInvakNeCkb+fM9tb2A//TSOw29x+eVmEGi9UxCazmc+nQgTFFG4rgsojxUf
 MzMiwub8PoWLS5tgYdUQ8zeneQtlJ91GSvkgG3TR6r/6InSkmo3g0HfcjEIxwvO3ptp9
 Qwdg==
X-Gm-Message-State: AOAM530ky8gnMGsATkh9DpX92haFtzTN9K8mEJmX8G11ii60uRRpNy4V
 ofal3wKzjZxt6JrGEWnhrPXA4CdIl3mlBA==
X-Google-Smtp-Source: ABdhPJz1ric2mj46jRlMcO+Na5K97Q9TCfTktfESSAnr6lM1kcOr4+s8wedjyfiz0f1jjFs2+3E2tg==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr24154112pjn.90.1626104407967; 
 Mon, 12 Jul 2021 08:40:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/10] accel/tcg: Handle -singlestep in curr_cflags
Date: Mon, 12 Jul 2021 08:39:59 -0700
Message-Id: <20210712154004.1410832-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
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
index 997e44c73b..491c1a56b2 100644
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


