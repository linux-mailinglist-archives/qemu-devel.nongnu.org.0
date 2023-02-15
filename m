Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E060697ABF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFwf-0008Ej-0x; Wed, 15 Feb 2023 06:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwd-0008EN-EQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:27 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwb-0003Pu-Pz
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:27 -0500
Received: by mail-wr1-x429.google.com with SMTP id s13so1064241wrw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0Um24g3S+MBssc7B7utkfO2I7iu2ZNyFey2RuTCvjU=;
 b=WH23tS9m3JqyYupEg4Ee4+MUZY6fR+DpeaMRHmG6hHWCyPec1v010Rpnb4rLsraLFG
 1eKTlnhCe/gn3ae1qgSufryNBnTm2SDRcJZQ4VDLJWWp4ASFqKctZWCHJcxJs2kl8x93
 kEsi2H1sdRgolmQZxOc5uuJuVnl2yeQF6N7U0J849aNcOy//cFHQj8mCAFQaZSqu+Jbf
 ksfUbYUmG+cZy/JKubXx2KF4wZFn8J7SDgvKYugnW3uhn3ffhp2gnQuTvAJML/YPlg8q
 7wNXo/IZuValWOXF+JIf6Y6ANTJ8MoLb4OGju48dBYovfMWzA+F1tg4G16eEJfkUMyEx
 Fs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0Um24g3S+MBssc7B7utkfO2I7iu2ZNyFey2RuTCvjU=;
 b=2j3gORuzB+i1QCoAuWfEC0Ja5g00+go/3HV7nAgJurwNb1nQv/a9sgRiLIKn8JDEpH
 M8oRsoqCP+NXb26AgVKS+TPUHnNOTENzXh32jG+I1KWGi74Dkd/BYAX8jw57GktfRsS0
 a7NVsveBlKw2MhFwxUq08pvS8OKfUvO6Bus5H5WEqIC12nJXc9VEy2aAGRpjEfkTorf6
 E9eueELRanWICDaWVZXUKNT2JwRDFBx0ywdaAshqi696Ineqj9ZcUEzJj2sgt+a/cNy0
 qXf94MZyf/d/h11UkRhmVOOaBS79md/FBzG0VfBaYHINcL38jee48N7y55fN/F1vca1T
 3Njw==
X-Gm-Message-State: AO0yUKVeukuXCCqL4+ExCnbFaXzPOW9URwesGugaijHH5w0u+enjIycj
 GYuakR3E1vON8SFfYO5Sb1MrRYHqV8uelaTl
X-Google-Smtp-Source: AK7set9ianFy+YSawy84axfaXwSlFgqzuAihHvjOl3JqE08GTelsTB+kV+K7Me4xjcyUDSa70VPhYw==
X-Received: by 2002:adf:e60d:0:b0:2c5:5308:859c with SMTP id
 p13-20020adfe60d000000b002c55308859cmr1261935wrm.18.1676460443945; 
 Wed, 15 Feb 2023 03:27:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb4d000000b002c573a6216fsm411908wrs.37.2023.02.15.03.27.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/20] hw/ide/mmio: Use CamelCase for MMIO_IDE state name
Date: Wed, 15 Feb 2023 12:26:54 +0100
Message-Id: <20230215112712.23110-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Following docs/devel/style.rst guidelines, rename MMIOIDEState
as IdeMmioState.

Having the structure name and its typedef named equally,
we can manually convert from the old DECLARE_INSTANCE_CHECKER()
macro to the more recent OBJECT_DECLARE_SIMPLE_TYPE().

Note, due to that name mismatch, this macro wasn't automatically
converted during commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE
when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/mmio.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index fb2ebd4847..f1c6e1479b 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -40,9 +40,7 @@
  */
 
 #define TYPE_MMIO_IDE "mmio-ide"
-typedef struct MMIOIDEState MMIOState;
-DECLARE_INSTANCE_CHECKER(MMIOState, MMIO_IDE,
-                         TYPE_MMIO_IDE)
+OBJECT_DECLARE_SIMPLE_TYPE(MMIOIDEState, MMIO_IDE)
 
 struct MMIOIDEState {
     /*< private >*/
@@ -58,7 +56,7 @@ struct MMIOIDEState {
 
 static void mmio_ide_reset(DeviceState *dev)
 {
-    MMIOState *s = MMIO_IDE(dev);
+    MMIOIDEState *s = MMIO_IDE(dev);
 
     ide_bus_reset(&s->bus);
 }
@@ -66,7 +64,7 @@ static void mmio_ide_reset(DeviceState *dev)
 static uint64_t mmio_ide_read(void *opaque, hwaddr addr,
                               unsigned size)
 {
-    MMIOState *s = opaque;
+    MMIOIDEState *s = opaque;
     addr >>= s->shift;
     if (addr & 7)
         return ide_ioport_read(&s->bus, addr);
@@ -77,7 +75,7 @@ static uint64_t mmio_ide_read(void *opaque, hwaddr addr,
 static void mmio_ide_write(void *opaque, hwaddr addr,
                            uint64_t val, unsigned size)
 {
-    MMIOState *s = opaque;
+    MMIOIDEState *s = opaque;
     addr >>= s->shift;
     if (addr & 7)
         ide_ioport_write(&s->bus, addr, val);
@@ -94,14 +92,14 @@ static const MemoryRegionOps mmio_ide_ops = {
 static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
                                      unsigned size)
 {
-    MMIOState *s= opaque;
+    MMIOIDEState *s= opaque;
     return ide_status_read(&s->bus, 0);
 }
 
 static void mmio_ide_ctrl_write(void *opaque, hwaddr addr,
                                 uint64_t val, unsigned size)
 {
-    MMIOState *s = opaque;
+    MMIOIDEState *s = opaque;
     ide_ctrl_write(&s->bus, 0, val);
 }
 
@@ -116,8 +114,8 @@ static const VMStateDescription vmstate_ide_mmio = {
     .version_id = 3,
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
-        VMSTATE_IDE_BUS(bus, MMIOState),
-        VMSTATE_IDE_DRIVES(bus.ifs, MMIOState),
+        VMSTATE_IDE_BUS(bus, MMIOIDEState),
+        VMSTATE_IDE_DRIVES(bus.ifs, MMIOIDEState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -125,7 +123,7 @@ static const VMStateDescription vmstate_ide_mmio = {
 static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(dev);
-    MMIOState *s = MMIO_IDE(dev);
+    MMIOIDEState *s = MMIO_IDE(dev);
 
     ide_init2(&s->bus, s->irq);
 
@@ -140,14 +138,14 @@ static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
 static void mmio_ide_initfn(Object *obj)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(obj);
-    MMIOState *s = MMIO_IDE(obj);
+    MMIOIDEState *s = MMIO_IDE(obj);
 
     ide_bus_init(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
     sysbus_init_irq(d, &s->irq);
 }
 
 static Property mmio_ide_properties[] = {
-    DEFINE_PROP_UINT32("shift", MMIOState, shift, 0),
+    DEFINE_PROP_UINT32("shift", MMIOIDEState, shift, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -164,7 +162,7 @@ static void mmio_ide_class_init(ObjectClass *oc, void *data)
 static const TypeInfo mmio_ide_type_info = {
     .name = TYPE_MMIO_IDE,
     .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MMIOState),
+    .instance_size = sizeof(MMIOIDEState),
     .instance_init = mmio_ide_initfn,
     .class_init = mmio_ide_class_init,
 };
@@ -176,7 +174,7 @@ static void mmio_ide_register_types(void)
 
 void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1)
 {
-    MMIOState *s = MMIO_IDE(dev);
+    MMIOIDEState *s = MMIO_IDE(dev);
 
     if (hd0 != NULL) {
         ide_create_drive(&s->bus, 0, hd0);
-- 
2.38.1


