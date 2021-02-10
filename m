Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2EB315B11
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:24:46 +0100 (CET)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dJF-0007PB-8q
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyR-0003t4-PB
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:15 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy5-00086u-NR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:15 -0500
Received: by mail-pj1-x1036.google.com with SMTP id z9so105277pjl.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILtc/770b5fG5q5GcqrdG9j1sxGJ0TG1dVSu3TNbgUU=;
 b=omDEYRbbjWa2ybt9T2TxFB5M8kGriPN9kU55wlr3IbVq2rkMCe+TDA1xjskmDjh3SE
 gky1kj01F+IzfBCeCyuPO1lTyzJLFncXbRg5qXqDzbYY/6J6fKOblxp9K1PLAwhtp0wP
 NmtnKjUeum/9UtHkQi0xBjjM+VUsmPbdAY677pB0YgwRlUjsMbUEMtA0pgtP2mEttNGf
 rNqq7MzUx5JDxRAOJWaWaIo5oYJGX7LdBKtqs6Sit41F2aaYxL87f6AmabpgaFNkKmdU
 XLfVdV6iBWco7Jbo1cQc4JMihLTEvrn0p8bc8nlGs/ZDRTxK7grDcI1W5Bq50zn6vdqi
 zFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ILtc/770b5fG5q5GcqrdG9j1sxGJ0TG1dVSu3TNbgUU=;
 b=CvV5pU4f7auvg+3AmvhjypcAWwC0UMy/lLEDKmI5xSTTtYAt52XR4f1ov7v1hHW4VU
 qgifC8sCFkqb5XH2dONDBedkGOvC45VouZoYM42SJOlkQN7sYztWIvNE9oAtjhTkjCVF
 xnKoyRvdfH7CYyBLTgmp/MW1ujJlgGg7NwWnJc5NKGxTU8RLZHgSXZf3JzyMK1xovpTE
 7OXCgg7vQvD+OXbIMu5EaJV4dcns41gHmzuT10CANy7Ph1p2WoYi/T/v1qdo40Et1kea
 KlgUtWCWsJ6DHG+G4tMxcGDjsmwlQFFhQ0kD3EiEz8fcXwn/3lQfAnzjve9eC3ycykG4
 /oLA==
X-Gm-Message-State: AOAM533Dok9wCXvNLZ7MEII7wI+T2iNckpBIZI2/HFtbtoAEV6PdlzQH
 xCh6Wa0p1fkSOvwUD4jP+KSUvyFLhWw9tg==
X-Google-Smtp-Source: ABdhPJyxOgLJ70ZEEwLP69TstJ8IyTYu41rruRL0mnAeLVKdjKwWyNBCMbJkvU1gw2DeEcySiov+qQ==
X-Received: by 2002:a17:902:d688:b029:e1:8936:c92a with SMTP id
 v8-20020a170902d688b02900e18936c92amr357588ply.74.1612915372411; 
 Tue, 09 Feb 2021 16:02:52 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 22/31] target/arm: Use the proper TBI settings for
 linux-user
Date: Tue,  9 Feb 2021 16:02:14 -0800
Message-Id: <20210210000223.884088-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were fudging TBI1 enabled to speed up the generated code.
Now that we've improved the code generation, remove this.
Also, tidy the comment to reflect the current code.

The pauth test was testing a kernel address (-1) and making
incorrect assumptions about TBI1; stick to userland addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  4 ++--
 target/arm/cpu.c            | 10 +++-------
 tests/tcg/aarch64/pauth-2.c |  1 -
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 448982dd2f..1f7f81f10e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1419,9 +1419,9 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
  */
 static inline uint64_t useronly_clean_ptr(uint64_t ptr)
 {
-    /* TBI is known to be enabled. */
 #ifdef CONFIG_USER_ONLY
-    ptr = sextract64(ptr, 0, 56);
+    /* TBI0 is known to be enabled, while TBI1 is disabled. */
+    ptr &= sextract64(ptr, 0, 56);
 #endif
     return ptr;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8ddb2556f8..761f0c61bd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -205,14 +205,10 @@ static void arm_cpu_reset(DeviceState *dev)
             env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
         }
         /*
-         * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
-         * turning on both here will produce smaller code and otherwise
-         * make no difference to the user-level emulation.
-         *
-         * In sve_probe_page, we assume that this is set.
-         * Do not modify this without other changes.
+         * Enable TBI0 but not TBI1.
+         * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/tests/tcg/aarch64/pauth-2.c b/tests/tcg/aarch64/pauth-2.c
index 9bba0beb63..978652ede3 100644
--- a/tests/tcg/aarch64/pauth-2.c
+++ b/tests/tcg/aarch64/pauth-2.c
@@ -53,7 +53,6 @@ void do_test(uint64_t value)
 int main()
 {
     do_test(0);
-    do_test(-1);
     do_test(0xda004acedeadbeefull);
     return 0;
 }
-- 
2.25.1


