Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC433339F49
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:57:41 +0100 (CET)
Received: from localhost ([::1]:53884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7a8-0006w8-VB
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7YE-0005dn-I6
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:42 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Y8-0001F8-Qy
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:38 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z2so3461609wrl.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BqwEDz4b6b8tJdYYE+yXeBUdnYk9J8p8YYQcsDJqW0=;
 b=BgpoEHfIdo2X5XIwVkhI0fkq9z6hHo0v3bK5L5JVA/ba1MXqfajAMtPGxJt7+c4owE
 RLtbirDA4m5pJXd6vrDhSOGC9agg2xooH4sLgRmdsLyzVDIU/8EakDjLAFtfQrrcV8dv
 NC0Y63QRLGooHgsHuFOiILx2XzFzFikkA2AlsJ96UITPRCoU5VUFJSYRzIaExYl8cM47
 104QrVBnMwZUA1hroL/5vQPyqYqWz7Y/LDPlUg7WlUln0cve9fs/4ooVw+LphcQfFE5K
 8P0n4isI23Z5RX39YHtYHZaGibRvBTmQusOm6VXEvpuqHGx5WXU1zWQIbbcntEulwFRP
 1rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0BqwEDz4b6b8tJdYYE+yXeBUdnYk9J8p8YYQcsDJqW0=;
 b=tZPA/XTAggBXwKubvWFBHjxY0oNBab9AIF5Rkye1JW8dXfUN/EE91Sf2rK+zsA1r5l
 pmsjCx9e57b9KOkDiSU4uPJBEIu3LDntFRPZ4Svdb6vRJBblROKJ9cqtvPeDL2XU11cw
 bkRrawBQDQHoAMwlxHGBCXGgeaRs7v3O5QSZbk85BQ6HY1KWsfSI8xvB1wOixBLJUr2r
 wtt+UqnGuI/AGfjJOXCVzIPN8BZkeG5HXqDQvGvb92xiu7O9TwNwjjlhn20yTCMDnL4W
 Xdteyq83CSJgdLKfjGdmbnsrrAVEyuHzC3HtI0r2/AQwTKSdDHt/0yWhElYlJHblsVGj
 7JYg==
X-Gm-Message-State: AOAM531NN1p83eGEk9hNEBYmTTI8GjPHkx1Ja5o0eHvB+PEIwME7W93O
 QdVUL6lddhvlAbAxZAKy0qK0/URjAFEpYA==
X-Google-Smtp-Source: ABdhPJwqs+fLPyloqslG3J+/g7eIi7wb1FieoniswFeZtmaemx2pYvXh92IaVRbmF7Zi7VHJdzhUFA==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr19612070wrw.351.1615654534838; 
 Sat, 13 Mar 2021 08:55:34 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a3sm12473824wrt.68.2021.03.13.08.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:55:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] hw/avr/arduino: Replace magic number by
 gpio_port_index() call
Date: Sat, 13 Mar 2021 17:54:43 +0100
Message-Id: <20210313165445.2113938-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

The '1' magic value means 'Port B'. Introduce and use the
gpio_port_index() helper to explicit the port name.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/avr/arduino.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 73563a35d0d..87124d17f18 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -43,6 +43,12 @@ typedef struct ArduinoMachineClass ArduinoMachineClass;
 DECLARE_OBJ_CHECKERS(ArduinoMachineState, ArduinoMachineClass,
                      ARDUINO_MACHINE, TYPE_ARDUINO_MACHINE)
 
+static unsigned gpio_port_index(char c)
+{
+    assert(c >= 'A' && c < 'A' + GPIO_MAX);
+    return c - 'A';
+}
+
 static void arduino_machine_init(MachineState *machine)
 {
     ArduinoMachineClass *amc = ARDUINO_MACHINE_GET_CLASS(machine);
@@ -59,7 +65,7 @@ static void arduino_machine_init(MachineState *machine)
                                          LED_COLOR_YELLOW,
                                          "D13 LED");
 
-    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[1]),
+    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[gpio_port_index('B')]),
                           amc->d13_led_portb_bit,
                           qdev_get_gpio_in(DEVICE(ams->onboard_led), 0));
 
-- 
2.26.2


