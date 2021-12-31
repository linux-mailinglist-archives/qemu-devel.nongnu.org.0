Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB8A48240E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:55:54 +0100 (CET)
Received: from localhost ([::1]:55060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HRp-00064v-U1
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:55:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKU-0005wa-Fv
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKS-0000jn-On
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQrjre6Db1sZNkT4sskEN8IBgNsCcPmlEpkvvQNs6e4=;
 b=JZO+Wzo5fvgLhBsdymW1W8HZjZoqw/hfiC9x46R3w50k1nYqBpNAzW0Key9dTNM+lcTdQG
 oSyy1g9drjCr4IwrZLY9EkC6QFITOwvvWDL1BQKUc3pkFlVaD+l+er8zq1Ps2aqvjoe9aB
 wQZRSX9xk84DexgcVKOGgU0aj1tu2u4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-r5P0qJ9-Oi-xUO6VbEsSTg-1; Fri, 31 Dec 2021 07:48:15 -0500
X-MC-Unique: r5P0qJ9-Oi-xUO6VbEsSTg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso7494131wra.18
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQrjre6Db1sZNkT4sskEN8IBgNsCcPmlEpkvvQNs6e4=;
 b=Ms3uEPBG3n598M5nJ/uhc43c1KfY6sXnSUIn4uYk3zrZthiyYK5IDRatH/modAMMfA
 C6Kx6iR0a6pdWrZoB68onNDVtlHp7Gi/EpBvb+rmQpGP3f5mVGDs5EVytqehaKGay5t8
 zGN17cl7mBL+GGHuweYKPYfuqeIpxYr+Mm4WgkXaMsLfqxl67j1mpgaLbt991a0mqbSq
 QNv1SRRTIzdijaEt0mOK9MlEFQcsHctt3wGYl4PEIXrryoMWWrY/1doq2j+DfBaY4T0/
 To4KVwx1igYhz1EURocePvIQx9T1ChpefV87OSzk/TMk8YBea83jp+VTcY8p4YExSUle
 J+bQ==
X-Gm-Message-State: AOAM5329MLmesEXjH6b/Ynmm9oIYzhn/nTKhlmyoF3iCifHhOUCndXru
 3kW11WUg+I5Ntn6QfqEPCQw6sa2KY9GGH77FQOxFDk13caxrKbuEL1dXAGo4oz3g7D6SRZwzKKk
 WvHAsV+QV/8aqWSxrVBa6FWH4HHrTWnh7RoL4rhMigOSQdhM7cMyP1K3libcCV/62
X-Received: by 2002:a5d:488a:: with SMTP id g10mr15576231wrq.653.1640954893603; 
 Fri, 31 Dec 2021 04:48:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj64MCdxk3k9Hhr8hj4/AtZ9Fw4XMI0Tl40rrw40U5RcpByN32mz7ctTQDt60mIgKX5OMRdg==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr15576206wrq.653.1640954893349; 
 Fri, 31 Dec 2021 04:48:13 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id g6sm27436067wri.67.2021.12.31.04.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin'
 parameter
Date: Fri, 31 Dec 2021 13:47:38 +0100
Message-Id: <20211231124754.1005747-5-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

@pin is an input where we connect a device output.
Rename it @input_pin to simplify the documentation.

Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211218130437.1516929-5-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


