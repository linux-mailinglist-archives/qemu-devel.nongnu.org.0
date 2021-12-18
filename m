Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B67479AF6
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 14:12:37 +0100 (CET)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myZVs-00070h-7T
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 08:12:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOY-0005MF-CW; Sat, 18 Dec 2021 08:05:08 -0500
Received: from [2a00:1450:4864:20::332] (port=40801
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOW-0003Cv-9v; Sat, 18 Dec 2021 08:05:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so5915325wmj.5; 
 Sat, 18 Dec 2021 05:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GIRB66yypPPrKrwEsR87//zR2i3jDtWRs1HuHZDcrWg=;
 b=Qb027waV4mbmfuORIRqAGvEgCBvkYqTvd3A38adXSokl7radPDN4ZoGtxoX4pT4RXV
 SdsC99+ZyJjfo3fwWxReSHeuD23zpAqolN99TK1bMYiWbjx7xUVAWk0+lPzkgUh37ojO
 zJ7GfIQEAHk3m7uwQCX0a9QLxKdsOt2LV0JdphsNFWWcJ0NjgAgJTRKIdB/rB3N5EHWs
 mytcqldg8aUCBhx9r1fDNQ9SYIdT99TNChg53KjKX39SFkOFoU3pp8iSveA+sPa/77yL
 RgNfZkCRD498XYck/5nwI6mYA8ZoJ1FmlPpqCmV72jn6tYpBd+R3Cn8FX83EezVZ6gI3
 0/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GIRB66yypPPrKrwEsR87//zR2i3jDtWRs1HuHZDcrWg=;
 b=uDoncV6BUl1gthRiAYu/t7oyRg2i9/J+Zu+9utzUXjhOCGBX5fYHTjizFsSMz7UYve
 33fZ33RqC3+vMr+XlIINAqMl5c2584lE17dXW73rH5hk1BKRJsbMVIjp5CeYoW1Rnp82
 4bfWW6gyUcEfNZfWvikiK6Gg7L/CFjXR/xLMqobrQodga5T6IZ+Uka1AomBKJqAq18cY
 Fenb7IJmgUGKi5cA0YOcEElUbKoXjbkR+YgRecOfWUkHmHhnJnA35P8cLktA0oMHdPkI
 bLXKpJAGk8Y4y4q4siTPMU+e0eDhxDeyVaBDw5kFdKtHGKQwkQ80Qvwo7ZjwM4sHtYVj
 ds/Q==
X-Gm-Message-State: AOAM531cYooYCo3//Gs6xplLVqS2MNsoXIrVFOLV8JnTe2vvJLJgqMEE
 HpBLiV8qJHkwoW3lvyfTS0g4sGc1RpQ=
X-Google-Smtp-Source: ABdhPJzga44jJ38Mi7jDzm22dZ+3rQE4TCaz9skhBBO1E6Tj/g8xPcrfw5k6G3O5wCnql6RPVXwcIg==
X-Received: by 2002:a1c:238c:: with SMTP id j134mr4451644wmj.5.1639832698527; 
 Sat, 18 Dec 2021 05:04:58 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o4sm8757967wmc.43.2021.12.18.05.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 05:04:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin'
 parameter
Date: Sat, 18 Dec 2021 14:04:36 +0100
Message-Id: <20211218130437.1516929-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218130437.1516929-1-f4bug@amsat.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@pin is an input where we connect a device output.
Rename it @input_pin to simplify the documentation.

Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h |  6 +++---
 hw/core/gpio.c         | 13 +++++++------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 424c48daf6e..d19c9417520 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -476,7 +476,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
  * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
  * @dev: Device whose GPIO to connect
  * @n: Number of the anonymous output GPIO line (which must be in range)
- * @pin: qemu_irq to connect the output line to
+ * @input_pin: qemu_irq to connect the output line to
  *
  * This function connects an anonymous output GPIO line on a device
  * up to an arbitrary qemu_irq, so that when the device asserts that
@@ -509,7 +509,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
  * @dev: Device whose GPIO to connect
  * @name: Name of the output GPIO array
  * @n: Number of the anonymous output GPIO line (which must be in range)
- * @pin: qemu_irq to connect the output line to
+ * @input_pin: qemu_irq to connect the output line to
  *
  * This function connects an anonymous output GPIO line on a device
  * up to an arbitrary qemu_irq, so that when the device asserts that
@@ -530,7 +530,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
  * For anonymous output GPIO lines, use qdev_connect_gpio_out().
  */
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
-                                 qemu_irq pin);
+                                 qemu_irq input_pin);
 
 /**
  * qdev_get_gpio_out_connector: Get the qemu_irq connected to an output GPIO
diff --git a/hw/core/gpio.c b/hw/core/gpio.c
index 8e6b4f5edf3..80d07a6ec99 100644
--- a/hw/core/gpio.c
+++ b/hw/core/gpio.c
@@ -115,17 +115,18 @@ qemu_irq qdev_get_gpio_in(DeviceState *dev, int n)
 }
 
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
-                                 qemu_irq pin)
+                                 qemu_irq input_pin)
 {
     char *propname = g_strdup_printf("%s[%d]",
                                      name ? name : "unnamed-gpio-out", n);
-    if (pin && !OBJECT(pin)->parent) {
+    if (input_pin && !OBJECT(input_pin)->parent) {
         /* We need a name for object_property_set_link to work */
         object_property_add_child(container_get(qdev_get_machine(),
                                                 "/unattached"),
-                                  "non-qdev-gpio[*]", OBJECT(pin));
+                                  "non-qdev-gpio[*]", OBJECT(input_pin));
     }
-    object_property_set_link(OBJECT(dev), propname, OBJECT(pin), &error_abort);
+    object_property_set_link(OBJECT(dev), propname,
+                             OBJECT(input_pin), &error_abort);
     g_free(propname);
 }
 
@@ -165,9 +166,9 @@ qemu_irq qdev_intercept_gpio_out(DeviceState *dev, qemu_irq icpt,
     return disconnected;
 }
 
-void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin)
+void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq input_pin)
 {
-    qdev_connect_gpio_out_named(dev, NULL, n, pin);
+    qdev_connect_gpio_out_named(dev, NULL, n, input_pin);
 }
 
 void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
-- 
2.33.1


