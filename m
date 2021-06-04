Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9A39BD9E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:50:20 +0200 (CEST)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpD1X-0001nt-Ln
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRX-0003Hs-Cn
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:07 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRO-0003si-90
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id a11so7976638wrt.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1niJS7hSglD8mEiCtLQ9fXnqmC61tEmzNc7ZOj4a5VQ=;
 b=kc9bC2bxV3woV3SDD6n85+Q/HlLWOtCSuOMUG86UL7O+llzIcSVvnTAZmB+Fd9Da2u
 LRFC6IYt2IclWWcT2IAyDzAGbnF77oHyucOCFy+OIeVFYBCkksuaqWLsHbScwbxMG8Cu
 SdS5Rls9e7TXxeYeJJTk8qhx+QutkRb1EmPc5dy2CrN4VhXn2VRkVESgTHPLpeqq7Qhk
 IhiqzVG4qT0hYBWBj9zjCDCYHr1Dc80FGpYv2xKYJ+xwAR3c71Rp7gS4KN+JH+2ZIglo
 towCNMFvSfY3iZNYDdJrBlJq07SJBvuYUh3KlYuQKkHhLlXbMNImJMKcz8H31xVO/pAr
 mw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1niJS7hSglD8mEiCtLQ9fXnqmC61tEmzNc7ZOj4a5VQ=;
 b=X3WLglTi+XCpG1exBECN4TZpbwwp9bNW9SV+yOdCjVOcdtVUjIERNcPLCRuWF8xyc1
 7ewi3ge6+qLTi6hMW/I4iIF2j2Kb7VZmrHx9/hivnWMJXkjPlS6CXau3JR74hvEJQ+It
 BOE6PcjymFFnwJ0RBjNtv6HLYQ+Vu4fVqnrp9/TB9lyKQJqNSOVurT7RVqc/zvgpJVMD
 ZD/7lshjkeRHz8b5wGYxFuNYVMaVOR2NWWR2O3In62QS5n3lcFUvWRtTj4MygtdNTe0K
 CM8LjVtxpiQA32kMap0jCx305xtDIlNtHJdDnOokjN4xVWDgVjdhiH6YYPZXhEEL7yVx
 2GtQ==
X-Gm-Message-State: AOAM533BZ4Y+ShGJV1OwX8TbtxH/6uKvjYubzaDPnK6mbGow4YPN9Jxg
 kZhzZk9jejwxzgXBJ3qKb8nL2A==
X-Google-Smtp-Source: ABdhPJwGKQZxHCbnss+doiH+gk7+Fsl7FF4XKGSs2CnotzPKgF993rmUoaRkKSrc7GN3S+jQy0hoJQ==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr4679437wrv.322.1622823176253; 
 Fri, 04 Jun 2021 09:12:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s128sm6256282wme.6.2021.06.04.09.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EECA1FFBA;
 Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 33/99] target/arm: add temporary stub for
 arm_rebuild_hflags
Date: Fri,  4 Jun 2021 16:52:06 +0100
Message-Id: <20210604155312.15902-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

this should go away once the configuration and hw/arm is clean

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/boot.c              | 5 ++++-
 target/arm/arm-powerctl.c  | 8 +++++---
 target/arm/tcg/tcg-stubs.c | 5 +++++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d7b059225e..13eea9e372 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -26,6 +26,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "sysemu/tcg.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
@@ -796,7 +797,9 @@ static void do_cpu_reset(void *opaque)
                 info->secondary_cpu_reset_hook(cpu, info);
             }
         }
-        arm_rebuild_hflags(env);
+        if (tcg_enabled()) {
+            arm_rebuild_hflags(env);
+        }
     }
 }
 
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..a00624876c 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -15,6 +15,7 @@
 #include "arm-powerctl.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
+#include "sysemu/tcg.h"
 
 #ifndef DEBUG_ARM_POWERCTL
 #define DEBUG_ARM_POWERCTL 0
@@ -127,9 +128,10 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
         target_cpu->env.regs[0] = info->context_id;
     }
 
-    /* CP15 update requires rebuilding hflags */
-    arm_rebuild_hflags(&target_cpu->env);
-
+    if (tcg_enabled()) {
+        /* CP15 update requires rebuilding hflags */
+        arm_rebuild_hflags(&target_cpu->env);
+    }
     /* Start the new CPU at the requested address */
     cpu_set_pc(target_cpu_state, info->entry);
 
diff --git a/target/arm/tcg/tcg-stubs.c b/target/arm/tcg/tcg-stubs.c
index 14220d59a1..332f1b9cfb 100644
--- a/target/arm/tcg/tcg-stubs.c
+++ b/target/arm/tcg/tcg-stubs.c
@@ -14,3 +14,8 @@ void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
 {
     g_assert_not_reached();
 }
+
+void arm_rebuild_hflags(CPUARMState *env)
+{
+    g_assert_not_reached();
+}
-- 
2.20.1


