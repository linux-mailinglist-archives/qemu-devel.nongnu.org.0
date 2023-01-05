Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F865EEDB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJQ-00031d-KS; Thu, 05 Jan 2023 09:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJJ-0002rd-3k; Thu, 05 Jan 2023 09:33:37 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJH-000733-8G; Thu, 05 Jan 2023 09:33:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso1431473wms.5; 
 Thu, 05 Jan 2023 06:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2W2KrNb+t7zThSMmV7Yn1JPyvbrTPUj8QIREtNm4oAU=;
 b=i0y5ZK/lw/6OZegwSDpb3aAXA7JF1/79pSsI7yy28uQXNbAlnYJPJQOANcmto68Lwc
 56x6KtX52eS8MqUF9+udEBwDuthAxaKBfKy+uu0SVwpFBfxbidFYCtgtDqpcP82KRovX
 YtOB57uhxn6vkOEZt+FSvnFcxW/E+x1ghLdZp7LZN+CKNIhHXh4djJewYDHzXEUESooD
 4Wjdk6dD4Fq/789xpNlxV5rMJq/f9kECsAcBAMisho2YPc8SGD807D0D7EIArv8p8pn3
 OP9VcEPnVja4ko47mQIl1kzsTAvJUNaPWSYk1wy8Gv1m+iCHIEenZOPGvrJtzi7DpG55
 KckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2W2KrNb+t7zThSMmV7Yn1JPyvbrTPUj8QIREtNm4oAU=;
 b=5Y4VXwUbbb53OZf+gVQvY8paczSm2r5MCvhw+67xyW7ABReJoHK2hN1K7mo6Bmeipw
 B7AcDrM/fhjxI27DlFaTLexULtRxAMBPjvxYdp6PPgvFNnOYLxucYyCxFS/ab7v/ArMg
 ciqr93vXGVJOyB8JyssSmu/IYj2Ic01A2M88l9Nc54kTzwOphHE5W7VGUvMGG25Kp+C/
 WAGqDAbNk8swvCq9SuaHl9vnOJIKeuDkBnsMHKcbZbYyP1WCgKtn87/Zz0V/k/tsyLkM
 FpCk+jMHtHRh3mWGiJ4G7AUCX8MXSY6b8jkJcjnv7eGGS7Y3Fj3RlgWsPQWOKHFCJmv0
 MSpA==
X-Gm-Message-State: AFqh2kpTvwDgY1slPxEbWJE5ghlQYThsDAL2mtUt7VKkOrisf1/lVit4
 054z63luHlnfccRc9gaEXY6HNMlAId8TDg==
X-Google-Smtp-Source: AMrXdXtvJ6QnZqPqoDQ//KpSPwncmBtQC6stWn6W5wTpqa2vKHCxg8PomMbJkm05O6UjmNFM5PoE4w==
X-Received: by 2002:a05:600c:46cd:b0:3d9:a145:4d1a with SMTP id
 q13-20020a05600c46cd00b003d9a1454d1amr16151872wmo.34.1672929213313; 
 Thu, 05 Jan 2023 06:33:33 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:32 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 24/31] hw/isa/piix4: Reuse struct PIIXState from PIIX3
Date: Thu,  5 Jan 2023 15:32:21 +0100
Message-Id: <20230105143228.244965-25-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Now that PIIX4 also uses the "proxy-pic", both implementations
can share the same struct.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-34-shentey@gmail.com>
---
 hw/isa/piix4.c | 51 +++++++++++++++-----------------------------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index eae4db0182..ce88377630 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -42,32 +42,10 @@
 #include "sysemu/runstate.h"
 #include "qom/object.h"
 
-struct PIIX4State {
-    PCIDevice dev;
-
-    ISAPICState pic;
-    RTCState rtc;
-    PCIIDEState ide;
-    UHCIState uhci;
-    PIIX4PMState pm;
-
-    uint32_t smb_io_base;
-
-    /* Reset Control Register */
-    MemoryRegion rcr_mem;
-    uint8_t rcr;
-
-    bool has_acpi;
-    bool has_usb;
-    bool smm_enabled;
-};
-
-OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
-
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
     PCIBus *bus = pci_get_bus(&s->dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
@@ -87,7 +65,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
 
 static void piix4_isa_reset(DeviceState *dev)
 {
-    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; // master, memory and I/O
@@ -122,12 +100,13 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xac] = 0x00;
     pci_conf[0xae] = 0x00;
 
+    d->pic_levels = 0; /* not used in PIIX4 */
     d->rcr = 0;
 }
 
 static int piix4_post_load(void *opaque, int version_id)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     if (version_id == 2) {
         s->rcr = 0;
@@ -142,8 +121,8 @@ static const VMStateDescription vmstate_piix4 = {
     .minimum_version_id = 2,
     .post_load = piix4_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, PIIX4State),
-        VMSTATE_UINT8_V(rcr, PIIX4State, 3),
+        VMSTATE_PCI_DEVICE(dev, PIIXState),
+        VMSTATE_UINT8_V(rcr, PIIXState, 3),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -151,7 +130,7 @@ static const VMStateDescription vmstate_piix4 = {
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     if (val & 4) {
         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
@@ -163,7 +142,7 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
 
 static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     return s->rcr;
 }
@@ -180,7 +159,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PIIXState *s = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
@@ -250,7 +229,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
 static void piix4_init(Object *obj)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
+    PIIXState *s = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
@@ -258,10 +237,10 @@ static void piix4_init(Object *obj)
 }
 
 static Property piix4_props[] = {
-    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
-    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
-    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
-    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
+    DEFINE_PROP_UINT32("smb_io_base", PIIXState, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIXState, has_acpi, true),
+    DEFINE_PROP_BOOL("has-usb", PIIXState, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIXState, smm_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -289,7 +268,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX4State),
+    .instance_size = sizeof(PIIXState),
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.39.0


