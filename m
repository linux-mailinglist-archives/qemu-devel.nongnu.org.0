Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4269C7A1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:25:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2JC-00020F-Aj; Mon, 20 Feb 2023 04:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2H9-0007Y6-Bg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:16:00 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2H7-0004MI-HV
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id bg28so405092wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JkD4ylCUPd/YYTKvkzbI+ReBZ+PYphiYSDNHJcbrxXw=;
 b=PfUnD/IrABYau0XaQ92dv/4sRwiEfhCSs655lVSoDxgLHNT7XuxW50lHhSloPVQAtv
 1fr80LwL0vJF0J8LuhkP1fPHzoIjiJ1yobgJMG6dEWVib21CiwKZaMe70RgXkuHxeDpt
 azQBqMKr8HauYTc5jsgx7neLwjcz9qQYokzmb24LcZZpu/KAGsHMQ+p1xnTAXy3csIml
 4w5t13Y/eRzHzB98ZC+M4fSKRDYWLQpXx5owL7M3QrUyuhG2HkmF61VHVR5v8fopvOSc
 3XylvJJkjgT3byPWzRxAovoGSHn+niHN9rvxn1iXAcpFGVVFoK0/a8I2vX/M01ulBe+c
 YlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JkD4ylCUPd/YYTKvkzbI+ReBZ+PYphiYSDNHJcbrxXw=;
 b=rpQWMYUQZ1QeeQnlzkfjT15hSMquFXlIDWGTlSKktcNLYdhnKxDQevNYoevWJNwTgT
 Wy68N2ppXNI1HbA0+KqrByIjR4pKnDMPs2eIalX81MZ2id2pv2qWZEP43DGXtBB3Fg+n
 vA/pwUcN/xS/IXc/PmTbknHjEatV2zqQgZwGp9jyhLsvTruY+Y9StUqR3xW4/T0n4Ju2
 7CE/PTT2O29dA2ariFvV5oYYuYHbWr/lrkVBGL3/WOpxfFQdG1j9Ddp5SXTezrkC3ZCe
 rSlcIJmqwyfP3EN0gTWJnigXLcCKZoev9CdogOYnzMQLumBFA3dk5oS9C7wZuxd3mIc5
 +3aQ==
X-Gm-Message-State: AO0yUKVqpKC5Q/K8bL3VCYk+U/upytjgEMEwKFfiN1nHmlJp6W3eHdvC
 T6m0MTtQpDE1hxsik6P3hoOUzprWnjuIk6mB
X-Google-Smtp-Source: AK7set+qH/8OynNfj6+l2DjUrptr6WCi3Aoyd2lV5wItY3eK4QPWG9YtWSW0dC9GpvaErTxWDP/qOg==
X-Received: by 2002:a05:600c:706:b0:3e2:1368:e3a0 with SMTP id
 i6-20020a05600c070600b003e21368e3a0mr9518224wmn.18.1676884555970; 
 Mon, 20 Feb 2023 01:15:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a05600c224c00b003dc53217e07sm13119110wmm.16.2023.02.20.01.15.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 23/24] hw/ide/piix: Refactor pci_piix_init_ports as
 pci_piix_init_bus per bus
Date: Mon, 20 Feb 2023 10:13:57 +0100
Message-Id: <20230220091358.17038-24-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-21-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/piix.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b74f1c77c4..acb4eaa27f 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -122,7 +122,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
+static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
 {
     static const struct {
         int iobase;
@@ -132,24 +132,21 @@ static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
-    int i, ret;
+    int ret;
 
-    for (i = 0; i < 2; i++) {
-        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
-                                      port_info[i].iobase2);
-        if (ret) {
-            error_setg_errno(errp, -ret, "Failed to realize %s port %u",
-                             object_get_typename(OBJECT(d)), i);
-            return false;
-        }
-        ide_bus_init_output_irq(&d->bus[i],
-                                isa_get_irq(NULL, port_info[i].isairq));
-
-        bmdma_init(&d->bus[i], &d->bmdma[i], d);
-        d->bmdma[i].bus = &d->bus[i];
-        ide_bus_register_restart_cb(&d->bus[i]);
+    ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
+    ret = ide_bus_init_ioport_isa(&d->bus[i], NULL,
+                                  port_info[i].iobase, port_info[i].iobase2);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
+                         object_get_typename(OBJECT(d)), i);
+        return false;
     }
+    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+
+    bmdma_init(&d->bus[i], &d->bmdma[i], d);
+    d->bmdma[i].bus = &d->bus[i];
+    ide_bus_register_restart_cb(&d->bus[i]);
 
     return true;
 }
@@ -166,8 +163,10 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    if (!pci_piix_init_ports(d, errp)) {
-        return;
+    for (unsigned i = 0; i < 2; i++) {
+        if (!pci_piix_init_bus(d, i, errp)) {
+            return;
+        }
     }
 }
 
-- 
2.38.1


