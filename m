Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFCB69C77B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:16:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Fa-0005al-ER; Mon, 20 Feb 2023 04:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FT-0005Yg-7F
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:16 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FQ-0003kM-3N
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g7so1924009wrd.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVwFPC8/Cym1VDjogehpU1u1QuWz7q979OWiyNkc7u4=;
 b=ixQoK3vRNaLvZtGNYpq6vHbDKkGj/0dNxU6uYwWZvItEbg6p9W3FTZXmoDwwoAFFUn
 jtbbkgjQRIcynPUQSdZT8oN8QzGxTuamy9z37kOpC8+iHtgNpRqvXlxFG77Hl+lITss2
 p330O5RlMIKwt6Akg0Y08+gtBaDn6TxtoyjqadVVA++h50YytsfFCXITKc4mWbpuJ5fj
 UrwXJcLt/DFwk0Zg1SqwaQ7CIkTWfUIE4pPMpwGYhX7l4EqxdSiay8MAAv4MT7fSLVOa
 0/je56tDs4DBt6hvjrabCPxE8W1Ub6O26DiHD7Ppfkxt0TLjqPWuHw/lz/GRCaqKo964
 WTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVwFPC8/Cym1VDjogehpU1u1QuWz7q979OWiyNkc7u4=;
 b=QHiODLg57Z3xpGNVpRg9X389QCWeoRSG/2pvB00IFWndX4n6w7R5Hul7QltHBfAfOY
 5XG56DrtijWGFCiGhIlcPUMUdN9/+XzOiG6QIXvYJi7vDAN6yfuYU8LMi1PRNWC8PP9x
 jqfkgMCwrkkU2TVnE7ks2nfbcSlVDdlOU1snGQX1HUDHqH90bTeP/Zp4M6zS/+6Wx8Zr
 OhJgU9U4g8ZF0czlK/T28Id54AEom0TzynH6KM4UJ3B9anXGlrdFQw8MscPdDhMSlITY
 FEWzSbS7mhVJG27cFU+FkzmPdpV6FFZimgvb9hcyOZBX2yqvHiCKO6CsmBFkfNWHciqe
 GCSg==
X-Gm-Message-State: AO0yUKXHkV52nF/CRNdyVjGBMY/6go1JsAPT7qccSRbg0lBeHh8dwEG1
 mV1m7wndFTl+NFLj+ZRD6c7DtvEORxj3/dgB
X-Google-Smtp-Source: AK7set/z5aT1cKNFWuZwZhqQPPoMCy4H4EZtUMttfpcYX5au4pVioT1jHAAQ4kzAT3nMbhEXXCPi9w==
X-Received: by 2002:adf:dd86:0:b0:2c5:a370:df65 with SMTP id
 x6-20020adfdd86000000b002c5a370df65mr528344wrl.10.1676884450408; 
 Mon, 20 Feb 2023 01:14:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5d67c3000000b002c59f186739sm1919995wrw.23.2023.02.20.01.14.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/24] hw/ide/mmio: Use CamelCase for MMIO_IDE state name
Date: Mon, 20 Feb 2023 10:13:36 +0100
Message-Id: <20230220091358.17038-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
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

Following docs/devel/style.rst guidelines, rename MMIOIDEState
as MmioIdeState.

Having the structure name and its typedef named equally,
we can manually convert from the old DECLARE_INSTANCE_CHECKER()
macro to the more recent OBJECT_DECLARE_SIMPLE_TYPE().

Note, due to that name mismatch, this macro wasn't automatically
converted during commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE
when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/mmio.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index fb2ebd4847..c33d42437f 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -40,11 +40,9 @@
  */
 
 #define TYPE_MMIO_IDE "mmio-ide"
-typedef struct MMIOIDEState MMIOState;
-DECLARE_INSTANCE_CHECKER(MMIOState, MMIO_IDE,
-                         TYPE_MMIO_IDE)
+OBJECT_DECLARE_SIMPLE_TYPE(MmioIdeState, MMIO_IDE)
 
-struct MMIOIDEState {
+struct MmioIdeState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -58,7 +56,7 @@ struct MMIOIDEState {
 
 static void mmio_ide_reset(DeviceState *dev)
 {
-    MMIOState *s = MMIO_IDE(dev);
+    MmioIdeState *s = MMIO_IDE(dev);
 
     ide_bus_reset(&s->bus);
 }
@@ -66,7 +64,7 @@ static void mmio_ide_reset(DeviceState *dev)
 static uint64_t mmio_ide_read(void *opaque, hwaddr addr,
                               unsigned size)
 {
-    MMIOState *s = opaque;
+    MmioIdeState *s = opaque;
     addr >>= s->shift;
     if (addr & 7)
         return ide_ioport_read(&s->bus, addr);
@@ -77,7 +75,7 @@ static uint64_t mmio_ide_read(void *opaque, hwaddr addr,
 static void mmio_ide_write(void *opaque, hwaddr addr,
                            uint64_t val, unsigned size)
 {
-    MMIOState *s = opaque;
+    MmioIdeState *s = opaque;
     addr >>= s->shift;
     if (addr & 7)
         ide_ioport_write(&s->bus, addr, val);
@@ -94,14 +92,14 @@ static const MemoryRegionOps mmio_ide_ops = {
 static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
                                      unsigned size)
 {
-    MMIOState *s= opaque;
+    MmioIdeState *s= opaque;
     return ide_status_read(&s->bus, 0);
 }
 
 static void mmio_ide_ctrl_write(void *opaque, hwaddr addr,
                                 uint64_t val, unsigned size)
 {
-    MMIOState *s = opaque;
+    MmioIdeState *s = opaque;
     ide_ctrl_write(&s->bus, 0, val);
 }
 
@@ -116,8 +114,8 @@ static const VMStateDescription vmstate_ide_mmio = {
     .version_id = 3,
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
-        VMSTATE_IDE_BUS(bus, MMIOState),
-        VMSTATE_IDE_DRIVES(bus.ifs, MMIOState),
+        VMSTATE_IDE_BUS(bus, MmioIdeState),
+        VMSTATE_IDE_DRIVES(bus.ifs, MmioIdeState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -125,7 +123,7 @@ static const VMStateDescription vmstate_ide_mmio = {
 static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(dev);
-    MMIOState *s = MMIO_IDE(dev);
+    MmioIdeState *s = MMIO_IDE(dev);
 
     ide_init2(&s->bus, s->irq);
 
@@ -140,14 +138,14 @@ static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
 static void mmio_ide_initfn(Object *obj)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(obj);
-    MMIOState *s = MMIO_IDE(obj);
+    MmioIdeState *s = MMIO_IDE(obj);
 
     ide_bus_init(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
     sysbus_init_irq(d, &s->irq);
 }
 
 static Property mmio_ide_properties[] = {
-    DEFINE_PROP_UINT32("shift", MMIOState, shift, 0),
+    DEFINE_PROP_UINT32("shift", MmioIdeState, shift, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -164,7 +162,7 @@ static void mmio_ide_class_init(ObjectClass *oc, void *data)
 static const TypeInfo mmio_ide_type_info = {
     .name = TYPE_MMIO_IDE,
     .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MMIOState),
+    .instance_size = sizeof(MmioIdeState),
     .instance_init = mmio_ide_initfn,
     .class_init = mmio_ide_class_init,
 };
@@ -176,7 +174,7 @@ static void mmio_ide_register_types(void)
 
 void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1)
 {
-    MMIOState *s = MMIO_IDE(dev);
+    MmioIdeState *s = MMIO_IDE(dev);
 
     if (hd0 != NULL) {
         ide_create_drive(&s->bus, 0, hd0);
-- 
2.38.1


