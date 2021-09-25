Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160341834B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:39:32 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9lz-0002Ke-EJ
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94T-0004fJ-No
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94S-0007RI-EB
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id t28so23095178wra.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L6ntqmXS7ifceLSpB74XEWOrQdhQXzlIYsRxqC94HM4=;
 b=XXmlP6cLFpZrFEwpSQpqLjkIeoXbqru4Jzhp3Pae/ZVwAcQVcE5kqnZ25vCtt3IK5C
 ujgZIx0F+BjhHfFArQMuZYhqrCwjLe6kxBt0m1BR1jqSzhko5KaxNOQH4y5l7qXjwrLB
 zNERBOP+Or7Lhuhj8dV+OBUbvGy7UMgnyHAfa08ltO4yuqQ41InTJzmnUASj5Q9BwORP
 loxtfZ5/NXAqQprsPM6JeboJVjWHvbaE+59lEmgcVR5CMXl56SntlcqiuqoPInaKLAhb
 rTWpeHqhT2Em7d7MW3WAdjZZzDwr2LB/8SMoD52fY4ULB4/wKfW7WokQvN8bUW0pxoZ2
 XbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L6ntqmXS7ifceLSpB74XEWOrQdhQXzlIYsRxqC94HM4=;
 b=ViFxlRgxGTX8AfIDOeXwTrYyPKjccjZgOYYs/NTCzRq3YBghK4UEDu1WCMiLV/PKB1
 nr8Bru5r9XX6gzmZNLQB5kKs8aQc1Fm78/vju7LSWoeYUOponYbTgCxQgA86+nvWG/VW
 BEKt4ss7ps925UktnzVU/IemkEJgIMyF2Szg1VEe8bO3GGK5V9vWDKaJsfg8Fu8jtas7
 vzfPaexdt7hwuHAMoplFNKCMJTWmy8s+CduivYamNxKPWeNhZnOpOJqf0VtVb6ZWQ8Dt
 Z5qrzvZsM08fEmzzRDlPlOC0uokEuHTtLWUVMSdeR7qx0pPNUzVca4Oovbgyt3ywzDH6
 rwVw==
X-Gm-Message-State: AOAM5323LvCd0uUF47AJEStA3NK1OZZQGjZl7hxhMiOaNEvmKHamA5Dv
 fglPwxfRzneqlOFXFNkur8bN0SnAfXE=
X-Google-Smtp-Source: ABdhPJxrqfAIyw96x1bvkCaCx6I8daOxiy5ZHNxF76Bp8IK2BEuJbPZ6vgedWh16WWOKz/ApMNYYtA==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr7418733wmc.98.1632581671055; 
 Sat, 25 Sep 2021 07:54:31 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f9sm108882wmf.3.2021.09.25.07.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:54:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 40/40] accel/tcg: Simplify tcg_cpu_has_work()
Date: Sat, 25 Sep 2021 16:51:18 +0200
Message-Id: <20210925145118.1361230-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All TCG targets implement the TCGCPUOps::has_work() handler.
We can remove the non-NULL handler check in tcg_cpu_has_work().

Add an assertion in tcg_exec_realizefn() for future TCG targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c      | 6 ++++++
 accel/tcg/tcg-accel-ops.c | 5 +----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5fd1ed34222..d577a65237c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -993,6 +993,12 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (!tcg_target_initialized) {
+        /* Mandatory non-NULL handlers */
+        g_assert(cc->tcg_ops->initialize);
+#ifndef CONFIG_USER_ONLY
+        g_assert(cc->tcg_ops->has_work);
+#endif /* !CONFIG_USER_ONLY */
+
         cc->tcg_ops->initialize();
         tcg_target_initialized = true;
     }
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 3c75ed2cccc..6cd32f04cb9 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -78,10 +78,7 @@ static bool tcg_cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->tcg_ops->has_work) {
-        return cc->tcg_ops->has_work(cpu);
-    }
-    return false;
+    return cc->tcg_ops->has_work(cpu);
 }
 
 /* mask must never be zero, except for A20 change call */
-- 
2.31.1


