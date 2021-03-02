Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0F32A830
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:32:37 +0100 (CET)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8su-0006i8-6E
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lH8qG-0004Tk-Fp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:29:52 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lH8qE-0002wr-T7
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:29:52 -0500
Received: by mail-pg1-x52a.google.com with SMTP id b21so14284889pgk.7
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=janB4qnpFrHNkbWe/DulhaYL446SNFdO6VqQWHIqkK4=;
 b=T8IJ+bTxqR+WYHL+ICI1yszW3LIZztti8TZuaYsGYMGec+BnlpkfOoSMIohUoORVFK
 kOuMnGzNQ3nJ+6sYL+P1UENZbThVvjJ70iZn+oqqgKFvDM+E3RDGfCu3PjsVmK5e5mNa
 28LU2kBh/i0tDuOn8kWDgXdnpxAVV23SkJOyS8PhD2dJa/Lcb0rl/6wGvBZaZUDviFNv
 AjAu0FNdP5GXocwQEr+dEh1weWPx2X2YE8NmJFr0YgPCSOguzYbWwpgZTRsZYjlvzMo2
 s018dWyku9bC2Xjd4bUaQJNl4/6aiR9JylO8AaqxCOAaerX+LzYIaO0S4GeSofn8u+h9
 brxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=janB4qnpFrHNkbWe/DulhaYL446SNFdO6VqQWHIqkK4=;
 b=CV0eqxqdUr2iO4CTuCWqZyvB9uMTfne7SvENb5aZmkyqzjWGHB27wEijlU8HYbqP7h
 RG189QHbNC0hIj+f+0gd7ascSIoYnLGxjCWpi09ymJJ9g2S4ABZUW9POBCrXcQDWRkDh
 Kur0nJkdoRJwctbdTwgu1kjf45gfvpDTuGGoDvBCwFNp79USAcH5f9yugauTqGLJHg9p
 /CKCO1vYBoWB5/2U6boJzsIfDpFvfSf4yxXkmAhESkuVi7zybdv8cYy1IBYd8Ukr9YSm
 7wCvItsu5r9ZhYRzJnDvb6swsxk0MvLl5LeynLbQD+V9BF0T+DVdzaHdYNVFUxvHOoBx
 fuGQ==
X-Gm-Message-State: AOAM532Bf0/kvWLMFK1Scpqeq95SMv5xF7PAWZF6l3SwDTEhGmQqINAf
 ate6OVGaT/LelW7dPPgc1tnwIHf8itXhow==
X-Google-Smtp-Source: ABdhPJwCkh8fgXBsLpButk+wKEzmdOZ4UFWkq0eH2l0J57p8A19HciXaw5WJqJ801QVF9PwPBzWiaQ==
X-Received: by 2002:a62:a507:0:b029:1ce:ddad:79de with SMTP id
 v7-20020a62a5070000b02901ceddad79demr4203911pfm.19.1614706189363; 
 Tue, 02 Mar 2021 09:29:49 -0800 (PST)
Received: from localhost.localdomain ([45.115.91.0])
 by smtp.gmail.com with ESMTPSA id b15sm20122999pgj.84.2021.03.02.09.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:29:49 -0800 (PST)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/gpio/avr_gpio.c: add tracing for read and writes
Date: Tue,  2 Mar 2021 22:59:19 +0530
Message-Id: <20210302172919.7923-3-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302172919.7923-1-niteesh.gs@gmail.com>
References: <20210302172919.7923-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pg1-x52a.google.com
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, f4bug@amsat.org,
 heecheol.yang@outlook.com
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
index 7984843841..5c0d6aa922 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/gpio/avr_gpio.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 
 static void avr_gpio_reset(DeviceState *dev)
 {
@@ -48,6 +49,7 @@ static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
 
         if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
             qemu_set_irq(s->out[pin], new_port_pin_val);
+            trace_avr_gpio_update_output_irq(pin, new_port_pin_val);
         }
         cur_port_val >>= 1u;
         cur_ddr_val >>= 1u;
@@ -57,19 +59,25 @@ static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
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


