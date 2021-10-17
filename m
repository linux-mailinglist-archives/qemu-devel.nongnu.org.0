Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB055430CD6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:08:28 +0200 (CEST)
Received: from localhost ([::1]:55166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFGV-0006qA-S5
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2a-0005G9-Oa
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:54:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2Z-0000kp-19
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:54:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id u18so37967056wrg.5
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HT2y45thDApYFYQhE//tKIiE8Gj9xsHtdBaSSlAZAp0=;
 b=KScBiuuRAxYL498OkjbjC/hpKcjLQm8LawQUqXixE6J1MCvB675BwkFSXNzuYWm00U
 eX9kUOaysAubgag6z6n2x3GI0ys2pWGjZIi1q3PgFT5FfoFfAAGJY7cGrApgp7b7GFUu
 xR4/oW6s3btGrAhDnDJbO5TyHi6Qe+VZ3+p3S5l3JiP71wa05E7iaN/Gt5g/D6CyatGu
 lSX3RDNjYqs21B1vxD2R9++/rih7EioP/INXABzUFuDbYwK9eoTyrg5J56d4+cZMqfup
 gFesed3VhDFDY9W+tucP9QzZe+khprsWpRd+OKDvlzJqqCOVUOqgogEI3U8UMEBt8jlS
 TUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HT2y45thDApYFYQhE//tKIiE8Gj9xsHtdBaSSlAZAp0=;
 b=EKW8hlZDGMEhk5KaYwN3EYY9rHb6aMvxpK8V5Wg2zgAQHtRQ9ohbPOj2rY/n3E38f3
 qaKUm6e8ggngUBYlNzxE51FyFSaUHz1MnAA09gUIUEKOweYuy1ZAWXqQO3ggnLwGktMn
 3XIdyMeOe36AFKIAFoYIT4j+dUXv7dncE/CnxOTg6s5BYlVeszze3pGgKiNb2pbv13f6
 xKg5X3G33t0hdUw2fi3+9GjNTFC0d8SMRTf3mBgv47SLk6s70i6tzQQhOHdMh23K+0/F
 Phm5FZ+p5NVugGWWaytHQEFWr4xKgzh+G2ViksEokZdPoGWAVueLE/9QqZVyjTcMlHnO
 q+5g==
X-Gm-Message-State: AOAM532CKsTCZJO7TMThh7XM1a86vadi209KzteGcFBXLVzxKJ29dgc2
 2VBd9DEpnsoJph1aaYdwKL6gAVNJTZY=
X-Google-Smtp-Source: ABdhPJzn3Rfd8WUfGtzYuDhhrAUDqULmyYe6ggC4rjcbp1BYyGDpoaopo7vFH77/LsZ2B+yYlLshDQ==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr31799648wrz.408.1634511241556; 
 Sun, 17 Oct 2021 15:54:01 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c7sm13530647wmq.13.2021.10.17.15.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:54:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/17] vt82c686: Move common code to via_isa_realize
Date: Mon, 18 Oct 2021 00:52:43 +0200
Message-Id: <20211017225245.2618892-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The vt82c686b_realize and vt8231_realize methods are almost identical,
factor out the common parts to a via_isa_realize function to avoid
code duplication.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <7cb7a16ff4daf8f48d576246255bea1fd355207c.1634259980.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 67 ++++++++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 38 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f57f3e70679..5b41539f2cd 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -542,6 +542,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
 struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
+    ISABus *isa_bus;
     ViaSuperIOState *via_sio;
 };
 
@@ -572,6 +573,29 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
+static void via_isa_realize(PCIDevice *d, Error **errp)
+{
+    ViaISAState *s = VIA_ISA(d);
+    DeviceState *dev = DEVICE(d);
+    qemu_irq *isa_irq;
+    int i;
+
+    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
+    s->isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+                          &error_fatal);
+    isa_bus_irqs(s->isa_bus, i8259_init(s->isa_bus, *isa_irq));
+    i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(s->isa_bus, 0);
+    mc146818_rtc_init(s->isa_bus, 2000, NULL);
+
+    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
+        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
+            d->wmask[i] = 0;
+        }
+    }
+}
+
 /* TYPE_VT82C686B_ISA */
 
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
@@ -610,27 +634,10 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
-    DeviceState *dev = DEVICE(d);
-    ISABus *isa_bus;
-    qemu_irq *isa_irq;
-    int i;
 
-    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
-    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
-                          &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(isa_bus, 0);
-    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus,
+    via_isa_realize(d, errp);
+    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
                                                TYPE_VT82C686B_SUPERIO));
-    mc146818_rtc_init(isa_bus, 2000, NULL);
-
-    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
-        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
-            d->wmask[i] = 0;
-        }
-    }
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -691,26 +698,10 @@ static void vt8231_isa_reset(DeviceState *dev)
 static void vt8231_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
-    DeviceState *dev = DEVICE(d);
-    ISABus *isa_bus;
-    qemu_irq *isa_irq;
-    int i;
 
-    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
-    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
-                          &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(isa_bus, 0);
-    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus, TYPE_VT8231_SUPERIO));
-    mc146818_rtc_init(isa_bus, 2000, NULL);
-
-    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
-        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
-            d->wmask[i] = 0;
-        }
-    }
+    via_isa_realize(d, errp);
+    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
+                                               TYPE_VT8231_SUPERIO));
 }
 
 static void vt8231_class_init(ObjectClass *klass, void *data)
-- 
2.31.1


