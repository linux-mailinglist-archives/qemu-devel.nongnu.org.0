Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828158572C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:08:47 +0200 (CEST)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZ66-0008Rf-8j
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ3v-00038Y-0E
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ3t-0001sZ-AW
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:30 -0400
Received: by mail-pf1-x435.google.com with SMTP id 70so5836743pfx.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HXCBntOjGzm8ardshRhxv5iuyqDFWrlT1RdhJEN5akM=;
 b=jm9G1DAeu9TMKmi1nO9GRbQxTheemcGp0UMNI66bL8gsTudxEtALCru01SBxule4qT
 6LGA8aehx4PAnoH95P0lT0gKya7WMyUjAw58x1zFlEg2OTxl1u0Xf587dpwN2kEPvv8A
 f1F8xtBCKWfzRKx0TYbb1ZuDdVg1ZvQH2dVDaRLG4Ub8I9++XJiEEwJgjG8y8JZtG/Cm
 CDF4rPhKNDg9WuJCaZyXn+BoLrCrG7jCSf1X2yYig1ev4t+GKy0X39XsXf8pXSap59mu
 1pjD9Ijoa+OCe2zIn1H+wYNpq7Oys6olp+SgazhUBn5QLrIQrrRG1XWeF4naDyH1k6YH
 HGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HXCBntOjGzm8ardshRhxv5iuyqDFWrlT1RdhJEN5akM=;
 b=1sO8tR15wCeClN0QOnGp17YWSjphDWq7zgMm6QYPrL90Jzv67SGYLAoDikXk64bHjn
 tAhsVtY5fuINH8fK4B2BvCIbFTXGB21BD4ebKagILTPkeOh1z3gi7Ue4Qd2U1/zcQL9c
 B/fwS6bkE1o824BK/hBz7+7lR2lJQbvcOfWJ5zP4av/K/39P/EXH8x3eVeHMKvo2q+0m
 PWzgRbOegNkJCjtCa/OTZGLv+aMNTHfR5PFG5Gia1i9AMrkjldILnzU/KtmFA+8VrUr2
 +FzFCGyRYW8+bb0Hg55LMGVqn6rxRoQl4f8AAqR97S1zjzqfC4BOEryucHwpKsvWWgdM
 /uoQ==
X-Gm-Message-State: AJIora8vBIiOfb8sHEx64FCoiWvSt6ud+EARU26uKYi58p4MsBEEhs7e
 iitSBNBBdDeG/vcxw7KmyeJ84jhedBZE6g==
X-Google-Smtp-Source: AGRyM1tPsZ8OBNfYftntOYscYnHcsScjRT0EW2bPuqVRfjYJMfSsCj8B1rRfoch4bfwWWKQkBFkTQQ==
X-Received: by 2002:a05:6a00:10ca:b0:4f7:5af4:47b6 with SMTP id
 d10-20020a056a0010ca00b004f75af447b6mr5677145pfu.6.1659135987758; 
 Fri, 29 Jul 2022 16:06:27 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 18-20020a621812000000b005251fff13dfsm3410715pfy.155.2022.07.29.16.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:06:27 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 06/11] hw/openrisc: Initialize timer time at startup
Date: Sat, 30 Jul 2022 08:01:12 +0900
Message-Id: <20220729230117.3768312-7-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729230117.3768312-1-shorne@gmail.com>
References: <20220729230117.3768312-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last_clk time was initialized at zero, this means when we calculate
the first delta we will calculate 0 vs current time which could cause
unnecessary hops.

This patch moves timer initialization to the cpu reset.  There are two
resets registered here:

 1. Per cpu timer mask (ttmr) reset.
 2. Global cpu timer (last_clk and ttcr) reset, attached to the first
    cpu only.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v2:
 - Moved timer init from init to reset suggested by Richard

 hw/openrisc/cputimer.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 93268815d8..10163b391b 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
+#include "sysemu/reset.h"
 
 #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
 
@@ -122,6 +123,24 @@ static void openrisc_timer_cb(void *opaque)
     qemu_cpu_kick(CPU(cpu));
 }
 
+/* Reset the per CPU counter state. */
+static void openrisc_count_reset(void *opaque)
+{
+    OpenRISCCPU *cpu = opaque;
+
+    if (cpu->env.is_counting) {
+        cpu_openrisc_count_stop(cpu);
+    }
+    cpu->env.ttmr = 0x00000000;
+}
+
+/* Reset the global timer state. */
+static void openrisc_timer_reset(void *opaque)
+{
+    or1k_timer->ttcr = 0x00000000;
+    or1k_timer->last_clk = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
 static const VMStateDescription vmstate_or1k_timer = {
     .name = "or1k_timer",
     .version_id = 1,
@@ -136,10 +155,11 @@ static const VMStateDescription vmstate_or1k_timer = {
 void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
 {
     cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
-    cpu->env.ttmr = 0x00000000;
 
+    qemu_register_reset(openrisc_count_reset, cpu);
     if (or1k_timer == NULL) {
         or1k_timer = g_new0(OR1KTimerState, 1);
+        qemu_register_reset(openrisc_timer_reset, cpu);
         vmstate_register(NULL, 0, &vmstate_or1k_timer, or1k_timer);
     }
 }
-- 
2.37.1


