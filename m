Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CAD337522
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:10:14 +0100 (CET)
Received: from localhost ([::1]:41922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKM0x-0002KO-SA
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lKLnn-0002uP-DQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:56:35 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lKLnk-0003VD-P5
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:56:35 -0500
Received: by mail-pf1-x429.google.com with SMTP id s21so3606573pfm.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=H7+G1DMbgPy5Y5WB/pcxDHX69uIbEQB36RYhXgxsmps=;
 b=OcJ6zsKrcL3KnujjGXMKH5nid/0/ToRQnHtW5Q6qavbDzNGHCFcmyVzpXkF3s9541I
 W+467bxyLY0oJd8QvIzRJFd6hD/cfM6ut55QKW8biaSo9HLTCM+2jmd/4330QW1o7mA3
 fYuXrGR2/3qII0JRj8WerWH+ISjpyTZPobqBjZ6DGazeZUZcpBfq/kJGpK60FmwZ4mEX
 WlXUjkFmFJEgZt13jJvX4rONxBoN50HqcqdiUX6O/XejTAzn1BWqCpIW4Aq5r5/cWidn
 PBvjJNFtRvjnfNdKyL+x72CZn5iW3L6GKHmn22/stkxK+nNZu+PTCzzQ8OqbkJyvBFV5
 zjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=H7+G1DMbgPy5Y5WB/pcxDHX69uIbEQB36RYhXgxsmps=;
 b=c1sOMMm9bGj3R8j+w6eVQepYYtvu/jgPkzUykenpX5teTo9H0jeCegKeTRrphjaHBO
 IoEvvcyGDVmThIpDIhP3pttAgLp6STxau+xjJJbfTP8xzukznc4a0eRReXPoPfYErAkw
 io8NSYl/+FGtp4CD+9M7VouFBokDaz0l7lZPfMx1Hd37M2HWGWJA54ZKDh35ymUvzKlM
 mLiBmNpfukRmQSLBN7A3tsa3lpEMSee5VivtuzNRamkc+sXpUeX3C0sZMoVie2aqSGQX
 I+Hzxwqld4CB3ec2tVZceP73uuh3g+M/5Fm6sS9SGAHP4JN+h2GpkUa/agSvsT9qz1+h
 CO+w==
X-Gm-Message-State: AOAM530BHjr6tYj6mzGieM0vf/wpnLUGwVAHn0TOvP6dBENOXjGP8Ha6
 fw9L1PSLMUFG2BCbM3BOMgdV5E1HBhLa4g==
X-Google-Smtp-Source: ABdhPJxBkSWZR2wN3W9lUKB7r6CgH/iKQDnhnFpToAeHmqOIYv+y/KrsphppJJXhwxfpiFpAx1mUzg==
X-Received: by 2002:a63:d94d:: with SMTP id e13mr7499932pgj.160.1615470991416; 
 Thu, 11 Mar 2021 05:56:31 -0800 (PST)
Received: from localhost.localdomain ([120.138.12.210])
 by smtp.gmail.com with ESMTPSA id a7sm2582392pfo.105.2021.03.11.05.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:56:31 -0800 (PST)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/gpio/avr_gpio.c: add tracing for read and writes
Date: Thu, 11 Mar 2021 19:25:38 +0530
Message-Id: <20210311135539.10206-3-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311135539.10206-1-niteesh.gs@gmail.com>
References: <20210311135539.10206-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: S.E.Harris@kent.ac.uk, mrolnik@gmail.com, f4bug@amsat.org,
 G S Niteesh Babu <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added tracing for gpio read, write, and update output irq.

1) trace_avr_gpio_update_ouput_irq
2) trace_avr_gpio_read
3) trace_avr_gpio_write

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 hw/gpio/avr_gpio.c   | 16 ++++++++++++----
 hw/gpio/trace-events |  6 ++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index 8fc192dbcb..8498a99dd2 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -26,6 +26,7 @@
 #include "hw/irq.h"
 #include "hw/gpio/avr_gpio.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 
 static void avr_gpio_reset(DeviceState *dev)
 {
@@ -49,6 +50,7 @@ static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
 
         if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
             qemu_set_irq(s->out[pin], new_port_pin_val);
+            trace_avr_gpio_update_output_irq(pin, new_port_pin_val);
         }
         cur_port_val >>= 1u;
         cur_ddr_val >>= 1u;
@@ -58,19 +60,25 @@ static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
 }
 static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int size)
 {
+    uint8_t val = 0;
     AVRGPIOState *s = (AVRGPIOState *)opaque;
     switch (offset) {
     case GPIO_PIN:
-        return s->reg.pin;
+        val = s->reg.pin;
+        break;
     case GPIO_DDR:
-        return s->reg.ddr;
+        val = s->reg.ddr;
+        break;
     case GPIO_PORT:
-        return s->reg.port;
+        val = s->reg.port;
+        break;
     default:
         g_assert_not_reached();
         break;
     }
-    return 0;
+
+    trace_avr_gpio_read(offset, val);
+    return val;
 }
 
 static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 46ab9323bd..a054def07c 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -18,3 +18,9 @@ sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" P
 sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
 sifive_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+
+# avr_gpio.c
+avr_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
+avr_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
+avr_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+avr_gpio_update_output_irq(int64_t line, int64_t value) "pin %" PRIi64 " value %" PRIi64
-- 
2.17.1


