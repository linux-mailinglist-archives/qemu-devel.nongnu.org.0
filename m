Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D66F6A43F0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeEB-00087u-Re; Mon, 27 Feb 2023 09:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCw-0007Dl-P6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCv-0000u2-2g
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:26 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so3899515wmc.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tl1KX2+HVo5outnBBgTl0z+MxZE/pkgAiqysShOhouw=;
 b=rqSDBHVcfVBUhQK39orxdTi5Nb4vsHnTtPtnQar4mZjBDsc8gPJnNAcNwXZtBcQLQV
 QSqURcDCzDqIObIoztR3wyLd9iJyqq1hxR7PGU3Bz1bFphGFMULtap/mve4lHEFlbj2B
 BRMNZPYmQjIUC6/uqMVf0uhnoXDqS75lHKXCxFIbR40EgsPZJjlJ+AZkwqOz6E4Xiqnj
 vBF0bXIqs/v4jwPmpkOJsc+qKI3LrJEHUbOTqV2HlmY1Bs38s5eTycqiV24hfqMla3C0
 YrNYmGs1NXJ5qn/Kw/+ojE0V65xioQDusVv+7LYCoch2IBbGAxRM/dSF/Q3Aw+zM2a5m
 jYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tl1KX2+HVo5outnBBgTl0z+MxZE/pkgAiqysShOhouw=;
 b=NeIX4wtwz4GYvM9V47WUzB47YlHw31rNvJVpZf5uG3IrsMRGMObcjoHYfVVXNlpBjf
 gm+teDl+JtPMG9xQM2244a8QfCL0IWRoOWbdigypnDsjnamq5gCI3re/cVY6x7TsQgZV
 zOLmNpTFnJCxrSsL7Alki2F81mVm9lPrV2/cyCrcs7NmGeC6Jj0YPJpsKlmylNWDo9ST
 hU07Lgau6yUC+mMrDfA9wo5wNFk+UJggdAy0dZS9gCmf/jG2rGnr1YhW383HijDSVeBd
 0hIMqGZzYqrqfLcCq9hxhyTjxF+xzVwdupUs4+wVlK/gyFjgiCeHQzwnvpkytkrtPK9z
 QD6Q==
X-Gm-Message-State: AO0yUKU0AZyIGszn1rsSDGrWD2ZL5zl7rcuSZsMjWqt03HX92fiujfKS
 CWog8JszP+C50m/HxcjG2w1JYTJvklnvYADw
X-Google-Smtp-Source: AK7set+jjPxdErZyvKr+ptDJpFw2IskHUxWLVGmVcmg5E91dipHD1Kibd5gThrBktvrIsVkiknRkGA==
X-Received: by 2002:a05:600c:a292:b0:3eb:368c:5eb with SMTP id
 hu18-20020a05600ca29200b003eb368c05ebmr5211259wmb.36.1677507023520; 
 Mon, 27 Feb 2023 06:10:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003e2096da239sm12958002wmq.7.2023.02.27.06.10.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 099/126] hw/ide/mmio: Use CamelCase for MMIO_IDE state name
Date: Mon, 27 Feb 2023 15:01:46 +0100
Message-Id: <20230227140213.35084-90-philmd@linaro.org>
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

Following docs/devel/style.rst guidelines, rename MMIOIDEState
as IdeMmioState.

Having the structure name and its typedef named equally,
we can manually convert from the old DECLARE_INSTANCE_CHECKER()
macro to the more recent OBJECT_DECLARE_SIMPLE_TYPE().

Note, due to that name mismatch, this macro wasn't automatically
converted during commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE
when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230220091358.17038-3-philmd@linaro.org>
---
 hw/ide/mmio.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index fb2ebd4847..08493930b7 100644
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
+    MMIOIDEState *s = opaque;
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


