Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A446A4397
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe4t-00018r-QA; Mon, 27 Feb 2023 09:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe3z-0000VE-Ok
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:11 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe3x-0007WR-Uq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:11 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r7so6329417wrz.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vrjkaKCliIFkLE0ljnHmQFIiPqAoUGCU+4M0ENFMcrk=;
 b=gRNlgXABrQlLN4CfgW1Z61p3m+VGHgsGU8hF7Yvj5/QE82BS81YVdsqXEx1/NGwYTu
 JMaTJTUJQFB6WcYMhcRkAVVQnTJy6ECw6i5lc6vh20fLXKj5ToWe/UjWqN5dWxT2482u
 S27zOUvnE03xwtAIog27jdG6Q2McFMT7QlpzLJDxKCT8apmC5OAb7V5XqChF5e3hTZ/n
 /yIIc+pp1EKlY+KXdFMP3yy1K8KlH8c5FWWBuOzZff+7Xp80wmDc7oSTOKHH/AX32n+Z
 5SiYVmTi6Qo01Oq5Jw56qJRz0oZpUesu0CmQlpc6IdMiCMR5Sxb96OqGBaxsvjz2M+lu
 itvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vrjkaKCliIFkLE0ljnHmQFIiPqAoUGCU+4M0ENFMcrk=;
 b=I2rozQbDILvhtSqWMOqtV2pEyFaekqEt1V0sdZqSQAQ+rgAAxCn95p8xtLfKBWg6Rr
 p/iZUBpdnHet16BAvJmnymJS0YMxkreUYX0816dhnzyUdTkQ6ajld/waUkD6SWvtXFzu
 +idl+zAg1I6c0P++uREufbdXYYdM6LQ/APA6p3CT20XnAFUOMcoW8ektTTUPHqyZlv+x
 /r++nAtF4qytPHolMzJu43gBOlwDyiExvXM3r1bIwMs4XW7Sx9ywEtSS7MwHxZ5y6ozs
 eAPR4TfSPKoEptIrkCb8IbZl0Xb/QwA4pY+N/y7q06xb82xlH++f5qnVJVPnUxybN8SV
 AMDw==
X-Gm-Message-State: AO0yUKV21in3HW57DYGkQvqZfDvVAXoKZ7RkckShRaZzsZ6/Cm08d8z7
 zDeGljQfRGPZ0OAQWj2h7bvCUGXmOSdkYdad
X-Google-Smtp-Source: AK7set92RCYaHHmN6+NU38W2Mf/WseupTp2C/P0IQzcgLFWxtU9LBhvnWvSQgaZIg7Nop+DOSWWpjQ==
X-Received: by 2002:a5d:4447:0:b0:2c9:b3a9:b080 with SMTP id
 x7-20020a5d4447000000b002c9b3a9b080mr6098768wrr.16.1677506468299; 
 Mon, 27 Feb 2023 06:01:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/25] target/arm: Wrap breakpoint/watchpoint updates with
 tcg_enabled
Date: Mon, 27 Feb 2023 14:00:39 +0000
Message-Id: <20230227140102.3712344-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

This is in preparation for restricting compilation of some parts of
debug_helper.c to TCG only.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c          |  6 ++++--
 target/arm/debug_helper.c | 16 ++++++++++++----
 target/arm/machine.c      |  7 +++++--
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 876ab8f3bf8..da416f7b1cb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -539,8 +539,10 @@ static void arm_cpu_reset_hold(Object *obj)
     }
 #endif
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+    }
     arm_rebuild_hflags(env);
 }
 
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 3c671c88c1a..3325eb9d7df 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -939,7 +939,9 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     value &= ~3ULL;
 
     raw_write(env, ri, value);
-    hw_watchpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_watchpoint_update(cpu, i);
+    }
 }
 
 static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -949,7 +951,9 @@ static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int i = ri->crm;
 
     raw_write(env, ri, value);
-    hw_watchpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_watchpoint_update(cpu, i);
+    }
 }
 
 void hw_breakpoint_update(ARMCPU *cpu, int n)
@@ -1062,7 +1066,9 @@ static void dbgbvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int i = ri->crm;
 
     raw_write(env, ri, value);
-    hw_breakpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_breakpoint_update(cpu, i);
+    }
 }
 
 static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1079,7 +1085,9 @@ static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     value = deposit64(value, 8, 1, extract64(value, 7, 1));
 
     raw_write(env, ri, value);
-    hw_breakpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_breakpoint_update(cpu, i);
+    }
 }
 
 void define_debug_regs(ARMCPU *cpu)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index b4c3850570c..fd6323f6d8a 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
@@ -848,8 +849,10 @@ static int cpu_post_load(void *opaque, int version_id)
         return -1;
     }
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+    }
 
     /*
      * TCG gen_update_fp_context() relies on the invariant that
-- 
2.34.1


