Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7FF68019E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 22:35:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMFJx-0002Pv-0w; Sun, 29 Jan 2023 16:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pMFJu-0002Og-L5
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 16:34:38 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pMFJt-0001Ls-1e
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 16:34:38 -0500
Received: by mail-ed1-x52a.google.com with SMTP id fi26so9246440edb.7
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 13:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JadtpMa7DrfVYGf0i2ahJZaP7MUyVL38zp2RXdr9vK0=;
 b=P+1gPNOlpaSzSsVYz5ligiEIkoMxrbb3smmEElmfd9u4FddwHbns66bE2H3bXqYhWl
 dHHmR035QC3XfKi1Cgc9/oRgyg2DcGj+Qs2mySTXoSaczFLnJESkqUIGUuPgedKe63xk
 iMTcd33W8/EFDRIIIFVE4LVYEUcO3b4sf/P/l/V42LRy4C//E2mWfeuj2/7F6oOMOa96
 6/hDpWR140ONFpzWYbZPiKA8hJnjGjYqQlL30EUe+Fgz9jr+Hcc27pYxyd+sm2cYzrgH
 WsmNDUevkrd7+keGrO749LUl/AIzHWLkc7hxfzpLG5xgpCeaVQUKDTt9tttKL68FqgZf
 6XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JadtpMa7DrfVYGf0i2ahJZaP7MUyVL38zp2RXdr9vK0=;
 b=KJcUC1sSvXFtRLVUiofX8uxOTYZ/z1Dc0gB6vqhhBNra30pLMpAp0Rhq6FvsTuzvqS
 PiiJiJxQdZrCA3phAOwYYUOMKst1aVeJlPw7oWtQky5L/uWJsNoNHwl5cUJpiMV716XE
 EWwAieuOkMKMB/kMsm4CKUisOZMpy7Fp5HTk/RDehMsXo2RKVRBikah3qND8PH6gpSPQ
 utaOaNxshi6JJHm7MEL1qeiURMMJOubfuWoLQGoCE2eb6h0U24C9LC4yeHWfkShFolpV
 m11mCTd248gD1O5h1vVUxN19PcoswpWNX3NUUyVkfP6NcQxRCHv+ZjIvZwR2T0SETCyE
 RgUQ==
X-Gm-Message-State: AFqh2kqXjvR+r/Z9WkGSWWJJeHQ+p5xrxE8+dLhzr8StCbz7Aj62McS6
 cUV4KhINWl0B1V2QCKMe1ZO7sVSUC3c=
X-Google-Smtp-Source: AMrXdXtroKdAEVh48bNrSqJvkcUTbsPnCMI4pkgBbs8b6Zc13poLH0Dms2i9tc4lqv9DTGR2pG/LHw==
X-Received: by 2002:a05:6402:43c4:b0:49e:8425:6033 with SMTP id
 p4-20020a05640243c400b0049e84256033mr41567703edc.28.1675028074639; 
 Sun, 29 Jan 2023 13:34:34 -0800 (PST)
Received: from localhost.localdomain ([46.183.103.17])
 by smtp.gmail.com with ESMTPSA id
 d1-20020aa7d681000000b0049be07c9ff5sm5831220edr.4.2023.01.29.13.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 13:34:34 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/3] hw/isa/vt82c686: Fix SCI routing
Date: Sun, 29 Jan 2023 22:34:16 +0100
Message-Id: <20230129213418.87978-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129213418.87978-1-shentey@gmail.com>
References: <20230129213418.87978-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

According to the PCI specification, the hardware is not supposed to use
PCI_INTERRUPT_PIN for interrupt routing. Use the dedicated ACPI
Interrupt Select register for SCI routing instead.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3f9bd0c04d..2189be6f20 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -46,6 +46,8 @@ struct ViaPMState {
     ACPIREGS ar;
     APMState apm;
     PMSMBus smb;
+
+    qemu_irq irq;
 };
 
 static void pm_io_space_update(ViaPMState *s)
@@ -148,18 +150,7 @@ static void pm_update_sci(ViaPMState *s)
                    ACPI_BITMASK_POWER_BUTTON_ENABLE |
                    ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
                    ACPI_BITMASK_TIMER_ENABLE)) != 0);
-    if (pci_get_byte(s->dev.config + PCI_INTERRUPT_PIN)) {
-        /*
-         * FIXME:
-         * Fix device model that realizes this PM device and remove
-         * this work around.
-         * The device model should wire SCI and setup
-         * PCI_INTERRUPT_PIN properly.
-         * If PIN# = 0(interrupt pin isn't used), don't raise SCI as
-         * work around.
-         */
-        pci_set_irq(&s->dev, sci_level);
-    }
+    qemu_set_irq(s->irq, sci_level);
     /* schedule a timer interruption if needed */
     acpi_pm_tmr_update(&s->ar, (s->ar.pm1.evt.en & ACPI_BITMASK_TIMER_ENABLE) &&
                        !(pmsts & ACPI_BITMASK_TIMER_STATUS));
@@ -213,6 +204,13 @@ static void via_pm_realize(PCIDevice *dev, Error **errp)
     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
 }
 
+static void via_pm_init(Object *obj)
+{
+    ViaPMState *s = VIA_PM(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+}
+
 typedef struct via_pm_init_info {
     uint16_t device_id;
 } ViaPMInitInfo;
@@ -238,6 +236,7 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
 static const TypeInfo via_pm_info = {
     .name          = TYPE_VIA_PM,
     .parent        = TYPE_PCI_DEVICE,
+    .instance_init = via_pm_init,
     .instance_size = sizeof(ViaPMState),
     .abstract      = true,
     .interfaces = (InterfaceInfo[]) {
@@ -568,6 +567,21 @@ static const VMStateDescription vmstate_via = {
     }
 };
 
+static void via_isa_set_pm_irq(void *opaque, int n, int level)
+{
+    ViaISAState *s = opaque;
+    uint8_t irq = pci_get_byte(s->pm.dev.config + 0x42) & 0xf;
+
+    if (irq == 2) {
+        qemu_log_mask(LOG_GUEST_ERROR, "IRQ 2 for PM controller is reserved");
+        return;
+    }
+
+    if (irq != 0) {
+        qemu_set_irq(s->isa_irqs[irq], level);
+    }
+}
+
 static void via_isa_init(Object *obj)
 {
     ViaISAState *s = VIA_ISA(obj);
@@ -578,6 +592,8 @@ static void via_isa_init(Object *obj)
     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
     object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
     object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
+
+    qdev_init_gpio_in_named(DEVICE(obj), via_isa_set_pm_irq, "sci", 1);
 }
 
 static const TypeInfo via_isa_info = {
@@ -664,6 +680,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
         return;
     }
+    qdev_connect_gpio_out(DEVICE(&s->pm), 0,
+                          qdev_get_gpio_in_named(DEVICE(d), "sci", 0));
 
     /* Function 5: AC97 Audio */
     qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
-- 
2.39.1


