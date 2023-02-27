Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2786A44B8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:38:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCO-0005Kd-JF; Mon, 27 Feb 2023 09:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeC9-0004mn-Vp
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:38 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeC8-0000b3-Ad
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:37 -0500
Received: by mail-wm1-x335.google.com with SMTP id p26so4307189wmc.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=reFqpRaD/SRUkm/EOnn9E/Z0xVn0tzwElddaq98oV3o=;
 b=jT63GyUFa7ScoWkWi8FCYh1gQGra0gFt4iTHSwSnL5umiiojJ+jARHFN6oxbxa7C1q
 42fEetnCu0zI98ZXSgwhjiwpiXAN0lNWozZ3DvOWkA7KcfDdFoc1RGGrToQO5hn7WpWy
 r8P/2PKJvJ5RB3paCtdBE34nKrNuvaCivN71faex7UfGCT/EBcpElCp80NA94h/sfA/j
 V3lciG4iSDpzKgpzbUQdNUtm29HcHNFKH6I3zmDMJ9eoc/4KIvTXeHxYDomtiYqhZSiU
 a6zqQ2mlcuZthp9TBuN1SW3gBqRkHMMKbuawOsK1LE3F7PLK248HjzOlQSPzPiP5+X1y
 obMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reFqpRaD/SRUkm/EOnn9E/Z0xVn0tzwElddaq98oV3o=;
 b=NKyMqQtqtOHElXmZ0Jxvubr/uJPznfqiflWkNrTJKS37/thuF819hvLD7sSOhO4Uf1
 B7ITim20hFWd1XAUAyUED5uaPbjsoJHjgPYnI3+0e2n1phogQDap1ISNFYa2pMz23ACO
 OhTs+1xM3xzNqAP60XBYTepyt5Wzn9Muou9kGD49WiPPBz5P93L7OxcIeJ2J4msqjqr6
 iFUnaBdj1asbqHXwgyLyTUntv/uSSHjiTXeeCPv/eutYcxZCZXw/3PDzHjygChTBQiRn
 ULy1BbuIhEBDGWuYdkk1aRoZEdiwRgiB5Jn9EwbWY2M4R2uM0Ljig1PbSHUOyXLpI/1D
 V0VQ==
X-Gm-Message-State: AO0yUKWvc4rLQHC+MJD1exbTWcu2HuudUZ4t8BxrB+qpaGLJmxFsOrOj
 CkAhLzuhlAIACF3E5oXlAb0SKsoLbsHPz8oa
X-Google-Smtp-Source: AK7set9Ua5g2i+3Xrsx2mkwpp+DdQzxW5TKK4N8VVFBADnqDXaoO5RYn4XA6gDVPCI85u/OngFdp9w==
X-Received: by 2002:a05:600c:3093:b0:3dc:5c86:12f3 with SMTP id
 g19-20020a05600c309300b003dc5c8612f3mr15892250wmn.1.1677506974537; 
 Mon, 27 Feb 2023 06:09:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003e20fa01a86sm9877012wms.13.2023.02.27.06.09.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 090/126] hw/display/sm501: Alias 'dma-offset' QOM property in
 chipset object
Date: Mon, 27 Feb 2023 15:01:37 +0100
Message-Id: <20230227140213.35084-81-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

No need to use an intermediate 'dma-offset' property in the
chipset object. Alias the property, so when the machine (here
r2d-plus) sets the value on the chipset, it is propagated to
the OHCI object.

Note we can rename the chipset 'base' property as 'dma-offset'
since the object is a non-user-creatable sysbus type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20230203145536.17585-12-philmd@linaro.org>
---
 hw/display/sm501.c | 7 ++-----
 hw/sh4/r2d.c       | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 38b8d0e16b..bb53499dff 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1944,7 +1944,6 @@ struct SM501SysBusState {
     /*< public >*/
     SM501State state;
     uint32_t vram_size;
-    uint32_t base;
     SerialMM serial;
     OHCISysBusState ohci;
 };
@@ -1965,7 +1964,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->state.mmio_region);
 
     /* bridge to usb host emulation module */
-    qdev_prop_set_uint64(DEVICE(&s->ohci), "dma-offset", s->base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
@@ -1980,7 +1978,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
-    DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2020,6 +2017,7 @@ static void sm501_sysbus_init(Object *o)
     SerialMM *smm = &sm501->serial;
 
     object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
+    object_property_add_alias(o, "dma-offset", OBJECT(ohci), "dma-offset");
     qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
 
     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
@@ -2027,8 +2025,7 @@ static void sm501_sysbus_init(Object *o)
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


