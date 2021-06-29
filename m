Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6898E3B6DF9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 07:38:07 +0200 (CEST)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly6Ri-0007Fw-0H
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 01:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly6Qo-00066O-QY
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 01:37:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly6Qn-000384-0D
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 01:37:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id o22so12003425wms.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 22:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/FIuf09EtyyMEtP9Q7uUQGr5VMb7Zl+JbrYKv0AQkHw=;
 b=hGHDYYhPGdZXf1P4cRF43ymPf+FOPCUXaS4qnD2SqZ+SqfsYpjS8PmRA1F4dPTtw3+
 JaITYefmdS9LCX9NSHPSIEGhZvzcEJ0L/W6vTpL3UBkrmpiYTM8kTw8NTyJDhg/gFNUK
 vnwi2UlVYZnmhjFcgllhZNK2NIy+VM8EBQBLxI/5+bsMPekeLMXuyq6gscgCmU3lF0dj
 H4rCCCbubuyIFNhQ/9aj63ZMiXMMAPFYU8mNJLR0DGH4E9IlMo4V6Aa7fdRKNJsBAiM0
 d3HJSgDPANcFnDf5Es1ktLrlLgN1eDOX/qecp7jXQOx+T0s/+YHaI6BnxyV5csmQ4FKK
 7fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/FIuf09EtyyMEtP9Q7uUQGr5VMb7Zl+JbrYKv0AQkHw=;
 b=VqdbN7hxT5HjTXcvZ8QDhQhE9JqK2nuYoKJIg9yAjBArgKpMVo9OjD3mYclmDr4JYf
 0hXalcfQEzZs17uFQqM5rXPSFyIbWe9/PGd1RcbelfMde7MuiGyGzwtxsHSIV30zb+Wx
 QyM0p3dyFudLzoZkrgh7qqJ1bxR0Qk+jO8SIc4JxhXT5ORaXbLaXhQU/nl3tDWHn4a9z
 vMcUSSMgxsX+CZoXjtyW5NLQ5XYVYzg6GzYHUxMrTuOPF2xirrk9vnhEQluvZ/3DyRCS
 n3Kaqi0W/WqSI+PiMjh7yCB3xyI79K8tcpMZij1b/qivJpmWF3DpMULqSH0IYt12q078
 YqOA==
X-Gm-Message-State: AOAM5312avAxhdO1jV4WnL+N0JHLXFqXn3kV4UYI7bnZOxqaOfnYEhlx
 TgxdrrkeGSiPXQbvHWnilglazNddl0Bfiw==
X-Google-Smtp-Source: ABdhPJwfK4femS8bgDLzYSWoe+Bfu3WHdVUqixx+h2KWqDNy+HzeYCx02fIoVOtuzFBAxrdvO0SrLw==
X-Received: by 2002:a05:600c:3b28:: with SMTP id
 m40mr29973235wms.99.1624945026555; 
 Mon, 28 Jun 2021 22:37:06 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c10sm8802969wmb.40.2021.06.28.22.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 22:37:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/mips/jazz: Map the UART devices unconditionally
Date: Tue, 29 Jun 2021 07:37:04 +0200
Message-Id: <20210629053704.2584504-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the Magnum ARC firmware we can see accesses to the
UART1 beeing rejected, because the device is not mapped:

  $ qemu-system-mips64el -M magnum -d guest_errors,unimp -bios NTPROM.RAW
  Invalid access at addr 0x80007004, size 1, region '(null)', reason: rejected
  Invalid access at addr 0x80007001, size 1, region '(null)', reason: rejected
  Invalid access at addr 0x80007002, size 1, region '(null)', reason: rejected
  Invalid access at addr 0x80007003, size 1, region '(null)', reason: rejected
  Invalid access at addr 0x80007004, size 1, region '(null)', reason: rejected

Since both UARTs are present (soldered on the board) regardless there
are character devices connected, map them unconditionally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/jazz.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1e1cf8154e7..e33d639af63 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -333,16 +333,12 @@ static void mips_jazz_init(MachineState *machine,
     memory_region_add_subregion(address_space, 0x80005000, i8042);
 
     /* Serial ports */
-    if (serial_hd(0)) {
-        serial_mm_init(address_space, 0x80006000, 0,
-                       qdev_get_gpio_in(rc4030, 8), 8000000 / 16,
-                       serial_hd(0), DEVICE_NATIVE_ENDIAN);
-    }
-    if (serial_hd(1)) {
-        serial_mm_init(address_space, 0x80007000, 0,
-                       qdev_get_gpio_in(rc4030, 9), 8000000 / 16,
-                       serial_hd(1), DEVICE_NATIVE_ENDIAN);
-    }
+    serial_mm_init(address_space, 0x80006000, 0,
+                   qdev_get_gpio_in(rc4030, 8), 8000000 / 16,
+                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(address_space, 0x80007000, 0,
+                   qdev_get_gpio_in(rc4030, 9), 8000000 / 16,
+                   serial_hd(1), DEVICE_NATIVE_ENDIAN);
 
     /* Parallel port */
     if (parallel_hds[0])
-- 
2.31.1


