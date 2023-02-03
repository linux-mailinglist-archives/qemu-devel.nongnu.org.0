Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FEC68A143
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:10:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0Vx-0008W3-JW; Fri, 03 Feb 2023 13:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vp-0007xk-0I
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:15 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vm-0008Aa-AQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:11 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so5374327wrb.11
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FNLse2ZcD75ram/6R7ZT7oCmOqU0RAt0KF/SNVgLID4=;
 b=F4kQFrxYh5Svorw0WiId2px/Ova0AuG4RaY1y3WSjTYNqA7gqCiHiib3eQrx5f/xEs
 DI3sVEl872UBCplU8OR4dDLHMYVsppx65wuS7eM/p/GuMbfijnwuu1FEieOpOEQP0ZNT
 XWE1DNi+/PZHmGHqv36heCtjmLV/6XegC2N8Zet3rVHlpeHA6mSlVFiIbi55LBNGQqVU
 X1r2x/U5j+IdG5aUBLYxDpiZJbiquFn7IyvQgAdeb6Hesr3QkIrVZSHhcl5K0dqHjubt
 XNpZtV4LluNzeulDHfRXdNA2SErvOiriKDMVbRNi8BdN3QJSjApFth5E0xY+bw4UmpW9
 FXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FNLse2ZcD75ram/6R7ZT7oCmOqU0RAt0KF/SNVgLID4=;
 b=PUuPhfOAMf35B0VXBjmle7Eh06kJ/90EWuvshIAuKoY28nhexgwOTfBxQGxapreqJG
 PxCieMYMehajqHcX7HtFmsz/NUWq7oQrfwpjey6bzM4UWqm+Ku8AU94a42//CP9iZCzO
 2upHrHYjUNHenHjHwlkYm/dhPIDc7DL6T3CVOXqTfr7X0Q+iRNW1697ME08zbnY4bQc7
 xL+T4t+y9Nb5hTsOezbZdSpcWWV3q5SN0G0CmnS3VcxXtYG4m4ZsPQHVlGEeiRxqAfTf
 GdRw0IQ40LpNPz+aOEn+E0PIpdXs5OHCgQPc4SuAjSn0dv0IXEU3AGZviXuoYLoTSNCv
 X0kA==
X-Gm-Message-State: AO0yUKUGzwSsaiV+MaPsd9jdwc9CAPRgLraYfxGAL/fgbQR5A2EIJiiz
 TaL6yV7Ft8J3ObxkbjpbgeF3EqjsgKBchArB
X-Google-Smtp-Source: AK7set/D6H7+maKyZY6LFvuerFfHC9jQOaT8s4VBnqUMY9fjuKeobBfUjZ67ftUIgzHa5w9V7lFJdw==
X-Received: by 2002:a5d:4350:0:b0:2c3:6686:c7d5 with SMTP id
 u16-20020a5d4350000000b002c36686c7d5mr8980518wrr.18.1675447807755; 
 Fri, 03 Feb 2023 10:10:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056000105000b002bbb2d43f65sm2533879wrx.14.2023.02.03.10.10.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 10/19] hw/avr: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:05 +0100
Message-Id: <20230203180914.49112-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/avr/arduino.c | 4 ++--
 hw/avr/atmega.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 48ef478346..428e6e1b2d 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -15,6 +15,7 @@
 #include "atmega.h"
 #include "boot.h"
 #include "qom/object.h"
+#include "hw/qdev-properties.h"
 
 struct ArduinoMachineState {
     /*< private >*/
@@ -44,8 +45,7 @@ static void arduino_machine_init(MachineState *machine)
     ArduinoMachineState *ams = ARDUINO_MACHINE(machine);
 
     object_initialize_child(OBJECT(machine), "mcu", &ams->mcu, amc->mcu_type);
-    object_property_set_uint(OBJECT(&ams->mcu), "xtal-frequency-hz",
-                             amc->xtal_hz, &error_abort);
+    qdev_prop_set_uint64(DEVICE(&ams->mcu), "xtal-frequency-hz", amc->xtal_hz);
     sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
 
     if (machine->firmware) {
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index a34803e642..e6ebc7473a 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -327,8 +327,8 @@ static void atmega_realize(DeviceState *dev, Error **errp)
         devname = g_strdup_printf("timer%zu", i);
         object_initialize_child(OBJECT(dev), devname, &s->timer[i],
                                 TYPE_AVR_TIMER16);
-        object_property_set_uint(OBJECT(&s->timer[i]), "cpu-frequency-hz",
-                                 s->xtal_freq_hz, &error_abort);
+        qdev_prop_set_uint64(DEVICE(&s->timer[i]), "cpu-frequency-hz",
+                             s->xtal_freq_hz);
         sbd = SYS_BUS_DEVICE(&s->timer[i]);
         sysbus_realize(sbd, &error_abort);
         sysbus_mmio_map(sbd, 0, OFFSET_DATA + mc->dev[idx].addr);
-- 
2.38.1


