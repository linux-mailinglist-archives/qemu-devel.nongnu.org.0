Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63963D0265
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:57:35 +0200 (CEST)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vry-0001uR-TV
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpN-0007Am-8s
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpL-00082G-QX
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id b12so428562pfv.6
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXNdPSSG3EvHjS1ff9yaYX7BJ5tWCVTACEwi3klwS+c=;
 b=d81CIYkGmpm6ZkjDzFpOZdrYgeXv+Hn6nw+iMcB/63XeZ5crb7UM7fzRGNVSd66gK8
 1g1rmsIzePVxTCwOHFzkSck6rfaH8Aw0VQafJGKxyYAkCxYt4TMhBNoVqPZeOHNpH0kV
 BndRDBnCsWoSp7zZ8f4x7RyCHEUOU/ulHjlFsmZAD2eqvgr9sOzvfAtQn2Q7VJTx5XD7
 q1KHyFcdAtcwXPHOzHfi+alxk0RulegW16lqhRLnCZ8riFIiXhjlwrCDODUDvJ6bv4W6
 A0/3Y+r3ffzqaCsaj/Nq4riDzVxoKGITnC/c85vqZxrlR9pR3ev3rb+PvpeIdn9GerfL
 XZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXNdPSSG3EvHjS1ff9yaYX7BJ5tWCVTACEwi3klwS+c=;
 b=LgDD7Gz6nhuuuSNJRzNsjP2Sj+UGq7pvKI4E0iqMXhomCqGbnHpJBZ0PwmptikrYfG
 CQmqfzQmMiCfCg5ZavTdrO2C0L1LI5bt6JNRCahaW2eVKWYVh3AYMUvMFuBI73E35xEk
 p75nSCcs0IscS7LdNxniaAc/dhHXCHDdTW+o5c12p3ePqEuLXGGSjSa9EtDTjYHfg15F
 f7M74aSkTzF7g+alJBY0kP9Wtx6o1bcYQF3S7y/wInDaUCwNvF0wvGP55LvpCJZU12Lz
 gpwIMxgfDRJErtrb0uIjcnGcn2cPtiIKBbSxwaV+M8luTlAxUdZq9Ndg3ZTTjEFUvcvY
 dMOQ==
X-Gm-Message-State: AOAM530ydc+d5L/L4tyw2IV/oXvm7k0XgpEk8TAfo7rQJOQqV/bzm/Uc
 Pzur68stMiAnRqr2iOvTd9eIbbmQ5YlLmQ==
X-Google-Smtp-Source: ABdhPJzFdoaSTAa26tAaQX/53UGfFk8aw8R8nnnr8uCP5Hwn8oxbrnOlDK8KnOpOkftjdln1JFV1CQ==
X-Received: by 2002:a63:1126:: with SMTP id g38mr32111677pgl.452.1626810890546; 
 Tue, 20 Jul 2021 12:54:50 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 06/17] accel/tcg: Handle -singlestep in curr_cflags
Date: Tue, 20 Jul 2021 09:54:28 -1000
Message-Id: <20210720195439.626594-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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


