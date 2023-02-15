Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF7697AB6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFyB-0003Vr-CQ; Wed, 15 Feb 2023 06:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFy3-0003Ge-9J
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:55 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFy1-0003X4-Eo
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m10so9872778wrn.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkzUfSiq/c6mggilmV6GobDXfpVINJSGyHsNi3pBEGk=;
 b=ivvdJlWncT9BTiEezFQoCwF43fu0e2HoMzMa3gqM5IpyrYPKW5zEajHZNA+TFyIsh5
 23K7+OqVd1n+7zf9vR8f9NBwVm5yHqwsTBQXd/ZZq43wnsDOOFo77tN64gVd5qujSpxt
 2LZb9aup3iCTWDMKCiWNq8k/73nGfwiAN/Kkx7zZv3/2JSyFXpkHk0+hLR6d/YysFkOJ
 JBAkjFipIxG3zGXjC/aNltisjJdJwGRnKxlFN/JRbRZtNEPBd8+Ebfmw1GjWWGuM23xQ
 Cfgc1Fk328yaoByQ0ZNCyMYdwQRr9BWbgFPKEHw6aD2PTmq7mmB7tqkejSBAyp6Fzijc
 yVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rkzUfSiq/c6mggilmV6GobDXfpVINJSGyHsNi3pBEGk=;
 b=pmvrx7+P4WvYbYkkTQOjZfXSX0bVtUYtReBY+7mv6fdlBPENOq9+Jv2nGeCKMvckZ0
 vhLes7/XkjF5SlblWtdi87galHerky6YRZTnkVzxnw+YmPK9hWkq5ktBQD26p9Okm5Hj
 c5HL8/eFLCeh2RGvjIzWAEmRMqQN8MYTrqSNvTvcxXsP7r+YavkPIXMJ8R1uUJx4rz9B
 BZXVHxp86roKs87mg9sS9FRfrBhgGQhrLUlHRVImghWcGPvgs+OnZsvhgxdwr1dkvkbs
 Bhyhp7SVv3cEtXJwY/wFR5kFUPhcKKEHzFt+ONP4iXqC6kd/sTtSpE2zW6aKnETAEqP7
 u6kw==
X-Gm-Message-State: AO0yUKUEJBn2kVnnjMWBqwU+Ys5rMaF3zL29QU5YV4vAcSHa5V0u8StI
 MKdEf/6egairlKvXWK6vUsLUGiMP0HacP9u5
X-Google-Smtp-Source: AK7set85+3QtDJKgN5WT3lf1LjndXRyEDx59NHqVMUZk3rW9BR8TXTlLyYyRUhAhGAyG63dpMAFAXg==
X-Received: by 2002:a5d:5488:0:b0:2c5:5db4:bcd with SMTP id
 h8-20020a5d5488000000b002c55db40bcdmr1658808wrv.11.1676460532489; 
 Wed, 15 Feb 2023 03:28:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d12-20020adfe84c000000b002c3f03d8851sm3646035wrn.16.2023.02.15.03.28.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/20] hw/ide/piix: Refactor pci_piix_init_ports as
 pci_piix_init_bus per bus
Date: Wed, 15 Feb 2023 12:27:12 +0100
Message-Id: <20230215112712.23110-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index f10bdf39ff..41d60921e3 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -121,7 +121,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
+static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
 {
     static const struct {
         int iobase;
@@ -131,24 +131,21 @@ static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
-    int i, ret;
+    int ret;
 
-    for (i = 0; i < 2; i++) {
-        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                              port_info[i].iobase2);
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
+    ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
+                          port_info[i].iobase2);
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
@@ -165,8 +162,10 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
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


