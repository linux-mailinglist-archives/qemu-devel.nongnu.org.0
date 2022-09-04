Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510F5AC348
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:45:10 +0200 (CEST)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUkJZ-0003BT-7p
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1Q-00080Y-P0
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1P-00031R-1w
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f15so2725480wrw.3
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=EldJkEoNWNKZAj6IpvRwW2ZX0M3V6N6F5zvDJDJ3mZY=;
 b=PdLyKLzb6yg9uR8kKG0lYQ/IP9CsySxu4NqgeGLrW9xViJQxdWqKF4dQf2K7XJUT0S
 AYSnkRW6GPUeWAYW+Tti9Z/IC6RYiHl3iFovZE6sDkbrJKyyBWLxKj+Az5gjilaG/c6l
 WV8bOMB7FrzMHv/bc6A5QtRn+G/XTSeo4dbChWVIHqU7V8uEICy9WcOkvy9qO7MaWqUG
 Yets3kAXIDShuxDnktsd59KOxeWBdlgqOjv3Q+e0RKPlpP7DMwum7p3ef4uXlc3XIlQr
 SxDIuqu3qKokftb4Xv6jLxkE88peM0ehHSsTdm+67geNzS+UyNa61kN4Cqt1h87EeWaD
 NwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EldJkEoNWNKZAj6IpvRwW2ZX0M3V6N6F5zvDJDJ3mZY=;
 b=PyWA3XqZfuPo5CYnKGkYRjWY35nA1Tny6jd4JgwwAEJsl2yrm98+MScUz2X+l5/Bb6
 EznS6JMNjCHwTknnS6HA2eJoWgRsckybDrp4a5qiCcd6QKu3vUXktSSgaaijrP3JJ9Be
 tENWo31CrrlBX/qD+LRejgstAZJosqXKIIfDyzIddhdaHzTJtCxcUnGdAlTnwAj+kP1W
 /cfdWbB60sqo20CFWpCzYOiJkrE6hfgl8bwATE1cxrdR6/WqPmTyaR+6onGriUVu4L2n
 i3ku/qxEFMKjEVEvjeLDInQXkyl43v3ZGGC74BFhjWa3+Qqwf2iEHputlmtpHCG1+32d
 WPRw==
X-Gm-Message-State: ACgBeo3CjwULyWO8J++1XLNJuk379XIDroqk2GIUMNeykje3bq0k7Uvr
 I707xaw5VER7P1SksMAnMW7tEHgDmdI=
X-Google-Smtp-Source: AA6agR7EC4yeXNSw3pKolUGD1oWZpkkEG3mSODFWoPr1LpNL1iuCRX1eaFF07ZyyOk/GcZKg7Ljdhg==
X-Received: by 2002:a5d:5047:0:b0:226:eb0a:d2d5 with SMTP id
 h7-20020a5d5047000000b00226eb0ad2d5mr11567968wrt.558.1662276381441; 
 Sun, 04 Sep 2022 00:26:21 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b0022862fd933asm2016809wrp.96.2022.09.04.00.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:21 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/11] target/openrisc: Interrupt handling fixes
Date: Sun,  4 Sep 2022 08:26:05 +0100
Message-Id: <20220904072607.44275-10-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x42a.google.com
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

When running SMP systems we sometimes were seeing lockups where
IPI interrupts were being raised by never handled.

This looks to be caused by 2 issues in the openrisc interrupt handling
logic.

 1. After clearing an interrupt the openrisc_cpu_set_irq handler will
    always clear PICSR.  This is not correct as masked interrupts
    should still be visible in PICSR.
 2. After setting PICMR (mask register) and exposed interrupts should
    cause an interrupt to be raised.  This was not being done so add it.

This patch fixes both issues.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/cpu.c        | 1 -
 target/openrisc/sys_helper.c | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 41d1b2a24a..cb9f35f408 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -98,7 +98,6 @@ static void openrisc_cpu_set_irq(void *opaque, int irq, int level)
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-        cpu->env.picsr = 0;
     }
 }
 #endif
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index da88ad9e77..09b3c97d7c 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -139,6 +139,13 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         break;
     case TO_SPR(9, 0):  /* PICMR */
         env->picmr = rb;
+        qemu_mutex_lock_iothread();
+        if (env->picsr & env->picmr) {
+            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
+        qemu_mutex_unlock_iothread();
         break;
     case TO_SPR(9, 2):  /* PICSR */
         env->picsr &= ~rb;
-- 
2.37.2


