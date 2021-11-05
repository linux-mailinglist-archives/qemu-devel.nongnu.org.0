Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F34467CB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:24:52 +0100 (CET)
Received: from localhost ([::1]:45456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2xP-0005KU-Mz
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj2uY-0002TX-4R; Fri, 05 Nov 2021 13:22:00 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj2uO-0007Dd-1K; Fri, 05 Nov 2021 13:21:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id z200so7651192wmc.1;
 Fri, 05 Nov 2021 10:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kMH4rTDikXhJZKCos7ysG4oLdQBxpsKJK0cAf4O+2Mc=;
 b=NFWCwo7iM31vVhh2iyNK/IlBZtZFlAS2hv0kT88M/xEBw05IZ5zkcwuQEf9ESwsV9A
 k+lQoLZlTqBq3ZEGIZfntT8Cm/ac4o6KHLlwPqfOy7iQt8S3D6KszBw0G/Pq0i4UIBGu
 Ukm9ZAtIAMfKxKAxjmY48IoJvmpcNudd5+uLQgqfOej6dL9rNjGjXaRLLLGRJ9NkAVlQ
 vY18PF75xZM6u80Oz+BXa40nLqIUSkqF559UeGdJ9rv38Hj9zDa/X21tQJj75AW0Omki
 1nOI85sWgbzmj6iExD+SDfv+8kePfk/fOApEJWdbalaFpccgPMK1nav28/T8C89iCoHs
 y89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kMH4rTDikXhJZKCos7ysG4oLdQBxpsKJK0cAf4O+2Mc=;
 b=SFTVU0lTBKyRXbGy2CS5t+AvhvHLIdy+hZlhU3CfNh4Gax+ViMMJ5aiN9VJT2r0rYx
 lrjBSpqLfn3NpXt49XS7/RmX6iTbKp0caEMMHDXU0obpnphfSBF+/NWsMtaT1iQ6SuXK
 Mha4KFA9YfTxs9z4BDemONSfH41vc5kizz37MhdaonZ5KSZAXMvl75sN1khEZOzRCFw6
 Jr2x3YpyNeYgRmSytb82K2Ou5DVi73oTYIMKR7ayMRWMyYfEuctCM8VS4JgMB1qWCynI
 F8FhmvcjR+onv15QyZV5nGGgOvl7k2++n+a94IsTDPnqgCW+O5wxX6cM1se5QKnZwsw2
 nNEg==
X-Gm-Message-State: AOAM5328inkHvtKwMXb9eygb/LST2hIYh9EnR947OKpgwaSVWHxuVhKz
 J+Rjnwte8fw7FMJP+f+RaU+nfJ1A6J8=
X-Google-Smtp-Source: ABdhPJwmmiMflzrZV3GcpCWTGmL5EN9FSF0gkk5YW/bTfouE1WUse5OP7XWXzoEHEOPpSIT06kejgg==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr32572419wml.80.1636132898997; 
 Fri, 05 Nov 2021 10:21:38 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o26sm11661262wmc.17.2021.11.05.10.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:21:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin'
 parameter
Date: Fri,  5 Nov 2021 18:21:26 +0100
Message-Id: <20211105172127.224462-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105172127.224462-1-f4bug@amsat.org>
References: <20211105172127.224462-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@pin is an input where we connect a device output.
Rename it @input_pin to simplify the documentation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h |  8 ++++----
 hw/core/gpio.c         | 13 +++++++------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 5b88c8b9dd3..3a0fe643a73 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -470,7 +470,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
  * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
  * @dev: Device whose GPIO to connect
  * @n: Number of the anonymous output GPIO line (which must be in range)
- * @pin: qemu_irq to connect the output line to
+ * @input_pin: qemu_irq to connect the output line to
  *
  * This function connects an anonymous output GPIO line on a device
  * up to an arbitrary qemu_irq, so that when the device asserts that
@@ -495,14 +495,14 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
  *
  * For named output GPIO lines, use qdev_connect_gpio_out_named().
  */
-void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
+void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq input_pin);
 /**
  * qdev_connect_gpio_out_named: Connect one of a device's named output
  *                              GPIO lines
  * @dev: Device whose GPIO to connect
  * @name: Name of the output GPIO array
  * @n: Number of the anonymous output GPIO line (which must be in range)
- * @pin: qemu_irq to connect the output line to
+ * @input_pin: qemu_irq to connect the output line to
  *
  * This function connects an anonymous output GPIO line on a device
  * up to an arbitrary qemu_irq, so that when the device asserts that
@@ -521,7 +521,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
  * same qemu_irq; see qdev_connect_gpio_out() for details.
  */
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
-                                 qemu_irq pin);
+                                 qemu_irq input_pin);
 /**
  * qdev_get_gpio_out_connector: Get the qemu_irq connected to an output GPIO
  * @dev: Device whose output GPIO we are interested in
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
2.31.1


