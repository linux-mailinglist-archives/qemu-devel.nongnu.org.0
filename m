Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC3339F67
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:14:22 +0100 (CET)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7q8-0006IM-D5
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Xw-0005UR-DL
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:24 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Xu-00016T-5x
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id v11so3453318wro.7
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8kHAMKTSMM1CGT+akUwZjEeXDL24OQm1KW3vQNoEJk=;
 b=WQ2wVFvhCDwMFRKCNYHjor7KH/1RubNYJ4McUmMA9KwlRJQb6mCuFwsQDKV4AEmhPP
 XhsSlzpzP30ALgCNxD8SCO1NLK9TuIWm8oqxV2b0t0KfBhkE8Ae1+ieY1DfQMX+Q18t+
 MOjHAyMtA54Ys68MxGHppQTJ2HK02uwTpWg4d13HowKOmOivR4/NTLhZZT697wHaKpNt
 wh2rGb7ADYzpMNZ5KUvgFM7f/F0F0EHTuZ8QPy3AOLMNf4h3UvEgwmqsr1lZrtiiIupj
 Ak3QGjxxreeL3+h6kUcoduLDTEa+z0nAjl7TUI6b2jgn10czkIEzjN5vqRUMGZUWswUo
 6kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p8kHAMKTSMM1CGT+akUwZjEeXDL24OQm1KW3vQNoEJk=;
 b=ADqJNMv2taJo7xzCR+YmGrTI9NUmxjwjhKoMYwFZhITfLUwtzHjT1FCmGm5ol7axhT
 +6OoH2XLzhw2yc6PrulRr7WPmzb9RP44O08oxsl3JRZ9aueinZcuzSQtH4+8v6TKH1Lr
 5PV0oulTtryFwVjMwdbZy0It2sH6tryM7kZRXn9Vcs4FeZl5O3yKbTk9oMTWE2GRXTbB
 RAGIIUw7lkGJusXowJK/4wzI6568H6sklZvwWTeFZ9jjaFaVwqBndvhl1ksN8H5vmXS0
 3P50LqJ2X/GVB/7iMeIL81TQOPgz1obeD86Gt0L7CRYnhDH4sbuPUYN8hqxBo1BV7N1U
 Hf1g==
X-Gm-Message-State: AOAM530r3UWwh4ev7yahxAib0Lb+k9vrs70ltpfqkfqJ88Gc3iKCYks2
 diRADBC9BY08i7vbZm/FVIeE3sOnTrpSpA==
X-Google-Smtp-Source: ABdhPJxuTQ4QIY8gqCbYm73GI+f85wgxSjiWkfQ7e2YJ/wKkNovOrQK/lkXNQtmcDsnIbdUxLO4eEA==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr19391582wrs.86.1615654519250; 
 Sat, 13 Mar 2021 08:55:19 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n66sm6895423wmn.25.2021.03.13.08.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:55:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] hw/gpio/avr_gpio: Simplify avr_gpio_write_port using
 extract32()
Date: Sat, 13 Mar 2021 17:54:40 +0100
Message-Id: <20210313165445.2113938-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/gpio/avr_gpio.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index 3db55bfa77f..e4c7122e62c 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -39,20 +39,15 @@ static void avr_gpio_reset(DeviceState *dev)
 static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
 {
     uint8_t pin;
-    uint8_t cur_port_val = s->reg.port;
-    uint8_t cur_ddr_val = s->reg.ddr;
 
     for (pin = 0u; pin < AVR_GPIO_COUNT ; pin++) {
-        uint8_t cur_port_pin_val = cur_port_val & 0x01u;
-        uint8_t cur_ddr_pin_val = cur_ddr_val & 0x01u;
-        uint8_t new_port_pin_val = value & 0x01u;
+        uint8_t cur_port_pin_val = extract32(s->reg.port, pin, 1);
+        uint8_t cur_ddr_pin_val = extract32(s->reg.ddr, pin, 1);
+        uint8_t new_port_pin_val = extract32(value, pin, 1);
 
         if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
             qemu_set_irq(s->out[pin], new_port_pin_val);
         }
-        cur_port_val >>= 1u;
-        cur_ddr_val >>= 1u;
-        value >>= 1u;
     }
     s->reg.port = value & s->reg.ddr;
 }
-- 
2.26.2


