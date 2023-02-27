Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D66A443A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:21:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCM-0005I5-Ne; Mon, 27 Feb 2023 09:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeC4-0004jE-Vb
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeC3-0000Zx-9h
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso6824101wmi.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jWJvrSdJX2sHlOeU6ruiLsKR+oVCbKmfMpesV07gggA=;
 b=zyO/PJgfdL/mLJzPDfaVxOJCeE5Orx3ZcXskmM/6RVq/9Vet1VBJ6o2gwpEYx6aXnY
 7bpiPe3cVZhNDWJduPaa39Umk0hYslDSC6//u+wBQ1LxhbTZOPHQ7QgAYxbu+cbgeNlW
 jr4+V8O/Ohaz9I61SYUrHCD38ohw/098C7sqZgmg/RBGy/Ov8rvhp4odn8nVBUhzrbEx
 YOvVf6bsRbDyCa25+8QB5aV6iz9I5CtPpwKj/s60XVJLCveQaMAkMJQcmIwtFXU+7Xnp
 sN3Oe/0wy/geaKAZFPJFhR5/rfaj1X1lVo9bpNiivlz2pPf1Q2Xga1wyGjKuKNoxjA7n
 1EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWJvrSdJX2sHlOeU6ruiLsKR+oVCbKmfMpesV07gggA=;
 b=n4jecXjlbN0cYGnLKOunkA0nTRmtknoLbbb40O3dAOm8Skf5VNx9DN2u5b/+y17faR
 yvhtLcWfhvXnWooHOTopxMB0PYaEEiePJlzW81BRfHMeeXuvrsd66HjkDwM9d5hav0kc
 t3wYjzcJi/qYpY27zaeYfqWXz0GxPRIxBCqyiwS/98wCu8OCUPcRBg5Ypt+LJtzohJUL
 +hArclMfTzeUTZoJEbNyGQPg1KVs/ZQZGeBC4cZ5NfpEKth/onqwXnlJFlKVVKvFK8Le
 mdEA/xTiB5JbMrsQh2Tro+pVESkWaEIHSviL/voFqE3o8bZ070N0v3pRZXNpzNQ1Itcw
 ooxg==
X-Gm-Message-State: AO0yUKUIluwi4G3mpFcwbgD0llyC/S2zrj7LFpQDaYqCmF/uM6MO/M7S
 lqT1ZduRmm9V6CsJbF5x1hid1GVLMFwl+vQ5
X-Google-Smtp-Source: AK7set/XdKy7E4ZDZ/EsHX13cIZSsyXP0AYKSABftBOR4CG2dtmNdsRZirq4MqwIdTsaDRDIBwtJ6g==
X-Received: by 2002:a05:600c:998:b0:3dc:5b88:e6dd with SMTP id
 w24-20020a05600c099800b003dc5b88e6ddmr19957914wmp.10.1677506969590; 
 Mon, 27 Feb 2023 06:09:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c359400b003daf7721bb3sm13719342wmq.12.2023.02.27.06.09.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 089/126] hw/display/sm501: Embed OHCI QOM child in chipset
Date: Mon, 27 Feb 2023 15:01:36 +0100
Message-Id: <20230227140213.35084-80-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Note this device doesn't implement unrealize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20230203145536.17585-11-philmd@linaro.org>
---
 hw/display/sm501.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index e1d0591d36..38b8d0e16b 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/usb/hcd-ohci.h"
 #include "hw/char/serial.h"
 #include "ui/console.h"
 #include "hw/sysbus.h"
@@ -1945,13 +1946,13 @@ struct SM501SysBusState {
     uint32_t vram_size;
     uint32_t base;
     SerialMM serial;
+    OHCISysBusState ohci;
 };
 
 static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 {
     SM501SysBusState *s = SYSBUS_SM501(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    DeviceState *usb_dev;
     MemoryRegion *mr;
 
     sm501_init(&s->state, dev, s->vram_size);
@@ -1964,13 +1965,11 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->state.mmio_region);
 
     /* bridge to usb host emulation module */
-    usb_dev = qdev_new("sysbus-ohci");
-    qdev_prop_set_uint32(usb_dev, "num-ports", 2);
-    qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
+    qdev_prop_set_uint64(DEVICE(&s->ohci), "dma-offset", s->base);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
-                       sysbus_mmio_get_region(SYS_BUS_DEVICE(usb_dev), 0));
-    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(usb_dev));
+                       sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
+    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->ohci));
 
     /* bridge to serial emulation module */
     sysbus_realize(SYS_BUS_DEVICE(&s->serial), &error_fatal);
@@ -2017,8 +2016,12 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
 static void sm501_sysbus_init(Object *o)
 {
     SM501SysBusState *sm501 = SYSBUS_SM501(o);
+    OHCISysBusState *ohci = &sm501->ohci;
     SerialMM *smm = &sm501->serial;
 
+    object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
+    qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
+
     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
     qdev_set_legacy_instance_id(DEVICE(smm), SM501_UART0, 2);
     qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
-- 
2.38.1


