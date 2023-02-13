Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B282469439A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWVq-0006ie-He; Mon, 13 Feb 2023 05:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWVe-0006eN-GJ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:56:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWVa-0003dG-PE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:56:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso2510094wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUJ+c15GRYrgsdfojyKynY0o/0XkUeheI9scGjw2Thg=;
 b=jkrVZq1m+qlc3A3KsZyDmeVxEWW2VyLqp1uspE0MPIj/QfqdfY5FwYxVsbKTuhUNAV
 Kume/BDzH6tg0HPCN1uEpnXBjVinYRGbUm5ygy+YiiHHMwdTR5BosdyXM3dEv6Jycvbx
 y1AA96LRiKNXhrWKdPMFM9lBUstEHNH/71HjFK3Tkmf0ogrXfMcgCPnL4FYNLX6tlA+Y
 pa9Nd1qsnCRVZXv/S9j01I/1pVnsCO84UzFd2eL53Dm6nuWFTv8hCF6Y8YeqigwDdKjc
 nJ1wh1ttfhYo3mdeIVJxSiyWXgIC5UvZ5UlSkqrtpZzU9s8S9EeR+qXIfFL5S4GVaude
 rL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUJ+c15GRYrgsdfojyKynY0o/0XkUeheI9scGjw2Thg=;
 b=JN3BQpt+F8/yMVmh/9lSJpuir2TmiQ8qHqSoRs02IGaKg4/MS+3VKW7+gfRq0e/t6a
 0yAEH93NgW+ZykXV4mqQ3tQ2aOauUnjjSUhIMKcAQ4TasIuc9U5tqVN5VLfanyLpWD07
 +4PYXaa9akWd+iqZe3u7586fjq5VDjszBJq282nYMRNWC6HTt2pG9kZBEBnZWw4I/Ja/
 myEQmaAN2CsiUWIYqWYNkcrA7VwcvdQdSrB/5xNjDCr0sYs+tdZie1oohgR/SaAO3oN5
 Kwc2DpdnOTXEINTgWzHYFbm1pWQrO2UTcYQNy8LvEiBoYNBVgT77IJ99muCZQIdEiQZK
 99RA==
X-Gm-Message-State: AO0yUKWiiVKkZsKsOJl+nec5GYiHSQ6zp6CREDz/nKqolAInAfgCCUlr
 V5BnUy2V8siseyEse4/MKEsexurXuvxXn44c
X-Google-Smtp-Source: AK7set9MZm2fJvGWR3QMZ3tX3GtojfIvY51q9nwH5wMw5ZZIZCKwVWxJf5879T92IVUD8JRkvUjztg==
X-Received: by 2002:a05:600c:4a9c:b0:3dd:1b6f:4f30 with SMTP id
 b28-20020a05600c4a9c00b003dd1b6f4f30mr23290416wmp.3.1676285777223; 
 Mon, 13 Feb 2023 02:56:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c4b1000b003dc4fd6e624sm13068169wmp.19.2023.02.13.02.56.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:56:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 1/3] hw/qdev: Introduce QDEV_DECLARE_DEV_BUS_TYPES() macro
Date: Mon, 13 Feb 2023 11:56:07 +0100
Message-Id: <20230213105609.6173-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213105609.6173-1-philmd@linaro.org>
References: <20230213105609.6173-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Similarly to QOM OBJECT_DECLARE_TYPE() equivalent, introduce
a QDev macro to declare common helpers for device sitting on
a bus.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/qdev-core.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 93718be156..dc9909a2e7 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -717,6 +717,34 @@ void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
 
 BusState *qdev_get_parent_bus(const DeviceState *dev);
 
+/**
+ * QDEV_DECLARE_DEV_BUS_TYPES:
+ * @DeviceInstanceType: device instance struct name
+ * @DeviceClassType: device class struct name
+ * @DEVICE_OBJ_NAME: the device name in uppercase with underscore separators
+ * @BusInstanceType: bus instance struct name
+ * @DeviceClassType: bus class struct name
+ * @BUS_OBJ_NAME: the bus name in uppercase with underscore separators
+ *
+ * This macro is typically used in a header file, and will:
+ *
+ *   - create the typedefs for the object and class structs
+ *   - register the type for use with g_autoptr
+ *   - provide four standard type cast functions
+ *
+ * The device state struct, device class struct, bus state struct need
+ * to be declared manually.
+ */
+#define QDEV_DECLARE_DEV_BUS_TYPES(DeviceInstanceType, DeviceClassType, \
+                                                       DEVICE_OBJ_NAME, \
+                                   BusInstanceType, BUS_OBJ_NAME) \
+    OBJECT_DECLARE_TYPE(DeviceInstanceType, DeviceClassType, DEVICE_OBJ_NAME) \
+    OBJECT_DECLARE_SIMPLE_TYPE(BusInstanceType, BUS_OBJ_NAME) \
+    \
+    static inline G_GNUC_UNUSED BusInstanceType * \
+    DEVICE_OBJ_NAME##_GET_BUS(const DeviceInstanceType *dev) \
+    { return BUS_OBJ_NAME(qdev_get_parent_bus(DEVICE(dev))); }
+
 /*** BUS API. ***/
 
 DeviceState *qdev_find_recursive(BusState *bus, const char *id);
-- 
2.38.1


