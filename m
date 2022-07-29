Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E4D58572E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:08:57 +0200 (CEST)
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZ6G-0000Lm-Jd
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ43-0003Sy-GB
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:40 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ40-0001tD-Qr
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:38 -0400
Received: by mail-pg1-x535.google.com with SMTP id 23so5060372pgc.8
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TlVFILlYi0pdD31MJQKEWmRWeQlW2WXHnVn9NT9MijI=;
 b=Rw5d5PDARjD8Y4K/aF0raM2kiFzKD6LizbPe8HQ87YdHnfZ1J4GaI0cYXI3wsSpWFf
 nq5xVUMZQb9exaKYTdm7BPQm8KwbD5fc5xY4pkKWS/feUsY5O+bYUBkoh3KlzKCV97fr
 6gCCzPsv/O8sQlr35YPcD3Kxogi2loqqWZnQfNNgy6ZnMWeFIj/cYKe76AQim+trElDZ
 ubNzwNzWPdeGupuy3VdIskfhWkUcAw3iqfADLVq2in9cG2xYKRtglVRAaeEjgyTYU1BR
 MRd6u6TVazFuTNvdiKBVRcYRqiST4Y1aBjE25+wS6IhyQBw8AF75y2KXpO3gWEWZ5BAi
 P+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TlVFILlYi0pdD31MJQKEWmRWeQlW2WXHnVn9NT9MijI=;
 b=Bx86ulgM573U/01ImJ0fcUqI5As6oB9bmXQhjU+jeyyArLQRvRWP+4QiRPeN6atpxn
 6Mkj3XxqcrkBL5xOJbOdZe/L1317uRx2vSYRHnenjXpPu5SFmjETTDJn2hHZryvstDR6
 4d9HhJjLR3+Fa8edqatjxRbRWZ32MMGi7l9kcMvV4ed1h3N6sWOtRo35Ki6B0iBL/hzO
 fdU1QQPUk4FXTxWNXBvys1R0JF4MbkTpsYNSqTrL8JST4kocgwIO2qMv0TcRzbqxbIFR
 hLL584nDRa3WullKRodZmE81BKAZSJv5whJte5zqjD/MK/omgHXi5Iczj6gaL32VHi3t
 F36w==
X-Gm-Message-State: ACgBeo04P/rowMwD6npz770P3Y+GewwfVFhyGmgXkooJ5SFvbyx1CfnY
 j1rElh5TDwZBEQvHmljgi194UVuDnkuLEQ==
X-Google-Smtp-Source: AA6agR57g/r2FRojc1uHJGjaNttIjV8/+q9a0izc4ATW+DrCgi9fFfkvHaigIk9M4mF/9Z1g9eJWzQ==
X-Received: by 2002:a62:ed0f:0:b0:52c:e8c2:b29e with SMTP id
 u15-20020a62ed0f000000b0052ce8c2b29emr2536029pfh.42.1659135995209; 
 Fri, 29 Jul 2022 16:06:35 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6263c2000000b00528c066678csm3419977pfb.72.2022.07.29.16.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:06:34 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 09/11] target/openrisc: Interrupt handling fixes
Date: Sat, 30 Jul 2022 08:01:15 +0900
Message-Id: <20220729230117.3768312-10-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729230117.3768312-1-shorne@gmail.com>
References: <20220729230117.3768312-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x535.google.com
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
Since v2:
 - Added Reviewed-by

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
2.37.1


