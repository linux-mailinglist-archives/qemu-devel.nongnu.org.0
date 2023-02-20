Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD2769C79C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:23:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2GT-0006co-1A; Mon, 20 Feb 2023 04:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GI-0006ZY-Gn
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:07 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GF-0003ur-Rv
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:06 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so376544wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmvmyViEw30a3ByZFiHCey1CNg7krVr0VebVR7rY4oU=;
 b=pgpHNnMbA+dBPOgBLlntf5WYgXAiAB0Zsmb1Z1/L6PVQwhc+qR1XI3esNvMxOcYL8G
 6oA7p0kAL2h3Sf7OQcB3F3JPPATVs7TbScehmgjShJqYYQYDZRW6tZ9hkpY+pZqKMPBK
 NuXtP5pSXUP4qxE31orF2KkJ164G2fZ9KMkiYu9talOlaMy9JWirY2Ja3bEDemcR2S7/
 Hg6XwIDnYr2aSg7Fyoq9+pX5NkEzesMezLy58Ah1l75K9d7Lkr0pi6C+jHpjfhXgx9to
 YLAPcZe0JDpOTzCBFdaLUWw4UbxHcFHGAqlZJHIyGBO43HVvkSutWFBM7IkFO/ev/8/i
 42aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmvmyViEw30a3ByZFiHCey1CNg7krVr0VebVR7rY4oU=;
 b=1OvzhjRI8TzxOhWSN8XQcGYHpMVK2qh2tszd6I0PeohT9OvezpPg05kgha6cwKyilY
 U5T/Swg1zgr9/bJr3sJNDb/upBm0v7BI7iW+0tjfncjqjFAyF7Tl1cyelFFaTq+AZfLs
 vZRAXiZ6aFODZlhkwKJ6KRTSX57f1F5Kummlgqz3mg910gVLP2F3Yp2AmC6NbL9NOM+p
 TyJ9KYa9ofyXMOeY/aUrGeF5p9qHQ/tqIy4g4VaVaLsob+Gkc92SmKUBJnU+XTh5CVYN
 dBFZbUQDp+X9h6ERWPMsUwKq5htMLybY7RmX0gtPiyxJ69/z2fcc5EvmoJHA5pNty9L0
 WTwg==
X-Gm-Message-State: AO0yUKXbLsQhx3bCJKC553bJU5DUKECpQrrh2STlQarUw6JANdqG2YhO
 6/lNdAs8aDZati+D8mBZxvbi2JB7bYCUUeTl
X-Google-Smtp-Source: AK7set9t0XFt4U65zVPQiFXGLJx7BwjGu0K29TDVPeRXCN0qRNBbQqLvbL4S4NHuxl777rLOPqs1pQ==
X-Received: by 2002:a05:600c:32a7:b0:3db:15b1:fb28 with SMTP id
 t39-20020a05600c32a700b003db15b1fb28mr40296wmp.19.1676884501502; 
 Mon, 20 Feb 2023 01:15:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a05600c475200b003e220998b6bsm1013732wmo.17.2023.02.20.01.15.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH v2 12/24] hw/ide: Rename ide_create_drive() ->
 ide_bus_create_drive()
Date: Mon, 20 Feb 2023 10:13:46 +0100
Message-Id: <20230220091358.17038-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

ide_create_drive() operates on a IDEBus; rename it as
ide_bus_create_drive() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/ide_create_drive/ide_bus_create_drive/g' \
        $(git grep -wl ide_create_drive)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-12-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c         | 2 +-
 hw/ide/ahci.c             | 2 +-
 hw/ide/isa.c              | 4 ++--
 hw/ide/macio.c            | 2 +-
 hw/ide/microdrive.c       | 2 +-
 hw/ide/mmio.c             | 4 ++--
 hw/ide/pci.c              | 2 +-
 hw/ide/qdev.c             | 2 +-
 include/hw/ide/internal.h | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f778cb6d09..0b93558dde 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -554,7 +554,7 @@ static void create_ahci(const SBSAMachineState *sms)
         if (hd[i] == NULL) {
             continue;
         }
-        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
+        ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
     }
 }
 
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 3e21f607fe..90fea5d059 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1842,7 +1842,7 @@ void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd)
         if (hd[i] == NULL) {
             continue;
         }
-        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
+        ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
     }
 
 }
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index ad47e0899e..74f7b43137 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -93,10 +93,10 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
 
     s = ISA_IDE(dev);
     if (hd0) {
-        ide_create_drive(&s->bus, 0, hd0);
+        ide_bus_create_drive(&s->bus, 0, hd0);
     }
     if (hd1) {
-        ide_create_drive(&s->bus, 1, hd1);
+        ide_bus_create_drive(&s->bus, 1, hd1);
     }
     return isadev;
 }
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 24fb7a3f9d..7efbbc720a 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -501,7 +501,7 @@ void macio_ide_init_drives(MACIOIDEState *s, DriveInfo **hd_table)
 
     for (i = 0; i < 2; i++) {
         if (hd_table[i]) {
-            ide_create_drive(&s->bus, i, hd_table[i]);
+            ide_bus_create_drive(&s->bus, i, hd_table[i]);
         }
     }
 }
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index b9822b939b..08504b499f 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -566,7 +566,7 @@ PCMCIACardState *dscm1xxxx_init(DriveInfo *dinfo)
     qdev_realize(DEVICE(md), NULL, &error_fatal);
 
     if (dinfo != NULL) {
-        ide_create_drive(&md->bus, 0, dinfo);
+        ide_bus_create_drive(&md->bus, 0, dinfo);
     }
     md->bus.ifs[0].drive_kind = IDE_CFATA;
     md->bus.ifs[0].mdata_size = METADATA_SIZE;
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 8b2ba604c5..d650dcee4d 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -174,10 +174,10 @@ void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1)
     MmioIdeState *s = MMIO_IDE(dev);
 
     if (hd0 != NULL) {
-        ide_create_drive(&s->bus, 0, hd0);
+        ide_bus_create_drive(&s->bus, 0, hd0);
     }
     if (hd1 != NULL) {
-        ide_create_drive(&s->bus, 1, hd1);
+        ide_bus_create_drive(&s->bus, 1, hd1);
     }
 }
 
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index ae638dee0d..4223f5e64d 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -489,7 +489,7 @@ void pci_ide_create_devs(PCIDevice *dev)
     ide_drive_get(hd_table, ARRAY_SIZE(hd_table));
     for (i = 0; i < 4; i++) {
         if (hd_table[i]) {
-            ide_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
+            ide_bus_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
         }
     }
 }
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 6f6c7462f3..1b3b4da01d 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -124,7 +124,7 @@ static void ide_qdev_realize(DeviceState *qdev, Error **errp)
     dc->realize(dev, errp);
 }
 
-IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
+IDEDevice *ide_bus_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
 {
     DeviceState *dev;
 
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 7b4b71d0b0..ccfe064643 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -645,7 +645,7 @@ void ide_atapi_cmd_reply_end(IDEState *s);
 /* hw/ide/qdev.c */
 void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
                   int bus_id, int max_units);
-IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
+IDEDevice *ide_bus_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
 
 int ide_handle_rw_error(IDEState *s, int error, int op);
 
-- 
2.38.1


