Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14A568A13E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:10:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0VU-0007KR-7R; Fri, 03 Feb 2023 13:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VS-0007EI-MM
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:50 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VQ-0008AZ-Pz
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:50 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r2so5385000wrv.7
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NgUd8czy/KtDDSBdj4dPqj7LZDSjTfVH8TLfiduuJo=;
 b=CU3fbR7lJ21Zn2niwiaBP9zRXcde3Bp5hkgZKitC/NfkXXYKdnaY5J0YIFGwWchBkD
 PfBFF/550g9rH+CnIRr+cpZE85Qsg10BDkjRPbLiuJLFUak/uxStv2bzf3HnyfIrpCoP
 m0tnc1rcG+9kcc5RPtTTpenyE7v/d0IMMhihdPr5h2i6m+MLvZuCiQsAJHH7sf3rnhIk
 2KdSGc+0HcOLcPiObSgclwwLbvKSP+VrynaV04kGTwsTGvlmNDsKnFZb1C/bTP+qSiRv
 UuPMh78uRUkdknby3TI78D/4oM3Swn48Is5V16I28dpw1KjT6nfkGklaxygI2r1/ACV+
 EiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9NgUd8czy/KtDDSBdj4dPqj7LZDSjTfVH8TLfiduuJo=;
 b=blBmkLDUAPH82K0Lt2SRAJghfnYzxVyxzpO8cd1S+Qa5/0MmiUlKJYSu8kN/U3qEr8
 WGuzDrOi8+um1lisfOccCvEPceXJaulDvFJd4F4umgl01HLh0Ud3Zush6HH0bErlNwRL
 5uRRfMQo+yGcpD8RUC+dnoih24twRpRexLv2RLAGydo3oa/8DY0LEk8WrVc9ECWg6TEC
 cAbqmguUiMVLv8EnyLZITiOb0gBgNJAsCdqFjOl6u9mndluZu0HmDlxFLUgipfTOluRs
 vSQRIJaXO6nZ39/clxSEqgt+Amz3xAIFS9CadHb5hbO3BlGOmmITZzt7TgF4UQ+4Iy8k
 J3wg==
X-Gm-Message-State: AO0yUKVWFuSUyPxaj8dLIb6OaxHuNaIHw4+sj5AwVdfhVlCJ69B37Z+k
 Kp+rqOLNV2OzRPf1Ux5cDVSIBMINHJvr8hfL
X-Google-Smtp-Source: AK7set/bwnjSzxwEM8YW56mYd/6D/HmDTbE+tJVPIYouAM/Q2o9fmPI1Bw7BLFApJWMpOHtjLur6xQ==
X-Received: by 2002:a05:6000:15c3:b0:2bf:e7c4:898a with SMTP id
 y3-20020a05600015c300b002bfe7c4898amr4916904wry.51.1675447787974; 
 Fri, 03 Feb 2023 10:09:47 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d68ce000000b002c3da499290sm1422762wrw.84.2023.02.03.10.09.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/19] hw/core/gpio: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:01 +0100
Message-Id: <20230203180914.49112-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/core/gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/gpio.c b/hw/core/gpio.c
index 80d07a6ec9..ba05dfa92e 100644
--- a/hw/core/gpio.c
+++ b/hw/core/gpio.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
 #include "hw/irq.h"
 #include "qapi/error.h"
 
@@ -120,13 +121,12 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
     char *propname = g_strdup_printf("%s[%d]",
                                      name ? name : "unnamed-gpio-out", n);
     if (input_pin && !OBJECT(input_pin)->parent) {
-        /* We need a name for object_property_set_link to work */
+        /* We need a name for qdev_prop_set_link to work */
         object_property_add_child(container_get(qdev_get_machine(),
                                                 "/unattached"),
                                   "non-qdev-gpio[*]", OBJECT(input_pin));
     }
-    object_property_set_link(OBJECT(dev), propname,
-                             OBJECT(input_pin), &error_abort);
+    qdev_prop_set_link(dev, propname, OBJECT(input_pin));
     g_free(propname);
 }
 
@@ -152,7 +152,7 @@ static qemu_irq qdev_disconnect_gpio_out_named(DeviceState *dev,
     qemu_irq ret = (qemu_irq)object_property_get_link(OBJECT(dev), propname,
                                                       NULL);
     if (ret) {
-        object_property_set_link(OBJECT(dev), propname, NULL, NULL);
+        qdev_prop_set_link(dev, propname, NULL);
     }
     g_free(propname);
     return ret;
-- 
2.38.1


