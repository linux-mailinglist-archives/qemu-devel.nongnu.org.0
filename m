Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE30689C5A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxUX-0003Qb-NI; Fri, 03 Feb 2023 09:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUU-0003MT-PA
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUS-00063x-QS
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:38 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso4038388wmq.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mN0VYqfwlRhVEGBvWVUoY9fpevsYWRdufb+QHnf9XBs=;
 b=IRudY8DDtuihwIxYQR6jmlAatCsacvcZW5DjBbIZ2EoRJejf/pAUWseMauxY4wL4GJ
 7ID6P2MmJaEw1evlkqJCXq9Whozs4gJlNydCKt5yXZXzXePLBRap3iTyFgtgeB9BIWgb
 yDKAibLC0sXnmyjl/FZ9PqY1XdWBUO5tqccB86DxySXC9SOGbc7JKWYPF0OFnLm070xv
 IQEcu/efvp8gdgKjqqPZW52ZZNOqGkrD/7lEe6zjAnyPPUHTrsbEX2UOPAExLXIiEaZN
 eBT3EWoGauKWvTT1Om1wqhTHA5P3Z6toagL1XlTtfBvoWL+HFw8Ax5yumwSdwm+l207S
 yA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mN0VYqfwlRhVEGBvWVUoY9fpevsYWRdufb+QHnf9XBs=;
 b=AEBL+ZDn+ZseGkOn5FAa7Rpl2e7B1I9GjiYTu2nnk/IKfJWPsQHDkcFt7HW9PKYzqT
 Gl4KeHBiu3qmI8PZsYLbO2bmNryD5+OBpNv50Pn2xwiOpOPuJGEToiLOKMEOEPOTaVqm
 k/4n9yM+QPY9iXAeoRePXxYjUhdtFTMMaJTIVn5GhpzoKuE/Vaskf5v5xcHgPMFQpJtD
 HQvbEZd+CFRR/q5F5whzvxfeOGqzFI3LhBwhUd792ZjUs2svzJgow27CYSnjJI2CZmwl
 jOn3Ll04jj6ahffJIjgDi9fNFq/zLz1GZpiKWbm7S4jEP1RdqsoS7DHK4WBmtLNtUXFp
 C+0Q==
X-Gm-Message-State: AO0yUKXNDLlwFw5Xgv6+aClUNifBLFcSAZlAiHP4j+y9sSiYp4zCiqKC
 EIVPxtjQ0I1Dr1VGSL6Lb4GsWpjOrASJq8dk
X-Google-Smtp-Source: AK7set+dvSwlpmiGpAhBIR1nJ8bXLpxFXji/9+JR06YDZWjlFe3+eYhtuYXiBmzZKbgbcGAQ46ID3A==
X-Received: by 2002:a05:600c:4711:b0:3df:e474:2ab2 with SMTP id
 v17-20020a05600c471100b003dfe4742ab2mr5135335wmo.33.1675436195202; 
 Fri, 03 Feb 2023 06:56:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b003a84375d0d1sm8636224wmo.44.2023.02.03.06.56.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 11/15] hw/display/sm501: Alias 'dma-offset' QOM property in
 chipset object
Date: Fri,  3 Feb 2023 15:55:32 +0100
Message-Id: <20230203145536.17585-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

No need to use an intermediate 'dma-offset' property in the
chipset object. Alias the property, so when the machine (here
r2d-plus) sets the value on the chipset, it is propagated to
the OHCI object.

Note we can rename the chipset 'base' property as 'dma-offset'
since the object is a non-user-creatable sysbus type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/sm501.c | 7 ++-----
 hw/sh4/r2d.c       | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 0f7e09d7e2..efebd93f1e 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1943,7 +1943,6 @@ struct SM501SysBusState {
     /*< public >*/
     SM501State state;
     uint32_t vram_size;
-    uint32_t base;
     SerialMM serial;
     OHCISysBusState ohci;
 };
@@ -1964,7 +1963,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->state.mmio_region);
 
     /* bridge to usb host emulation module */
-    qdev_prop_set_uint64(DEVICE(&s->ohci), "dma-offset", s->base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
@@ -1979,7 +1977,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
-    DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2019,6 +2016,7 @@ static void sm501_sysbus_init(Object *o)
     SerialMM *smm = &sm501->serial;
 
     object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
+    object_property_add_alias(o, "dma-offset", OBJECT(ohci), "dma-offset");
     qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
 
     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
@@ -2026,8 +2024,7 @@ static void sm501_sysbus_init(Object *o)
     qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
     qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
 
-    object_property_add_alias(o, "chardev",
-                              OBJECT(smm), "chardev");
+    object_property_add_alias(o, "chardev", OBJECT(smm), "chardev");
 }
 
 static const TypeInfo sm501_sysbus_info = {
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..d7020d6d2b 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -274,7 +274,7 @@ static void r2d_init(MachineState *machine)
     dev = qdev_new("sysbus-sm501");
     busdev = SYS_BUS_DEVICE(dev);
     qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
-    qdev_prop_set_uint32(dev, "base", 0x10000000);
+    qdev_prop_set_uint64(dev, "dma-offset", 0x10000000);
     qdev_prop_set_chr(dev, "chardev", serial_hd(2));
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0x10000000);
-- 
2.38.1


