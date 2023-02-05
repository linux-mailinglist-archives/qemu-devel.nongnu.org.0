Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299D68AF37
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:05:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObtj-00011c-L9; Sun, 05 Feb 2023 05:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtR-0000yt-Tf; Sun, 05 Feb 2023 05:05:15 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtQ-00057p-0D; Sun, 05 Feb 2023 05:05:05 -0500
Received: by mail-oi1-x22f.google.com with SMTP id t5so87131oiw.1;
 Sun, 05 Feb 2023 02:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5Q9l9r/b6kQ91x4NbnE0QX6N3wOGcLvxWVDOgH26Vo=;
 b=n78Zr2CGHojJihr5jFdKqpfa1mjk4FJYxpJZGeaYDLtoPoRZhrG1iGV136f0KBSiWR
 ybjMHu1QYxZDuVMKWSddpmjY57wOcEzrlv5qw7d/xdWzrnnFKU8ilbv5kQHpW0ffI+zK
 rp63zQLcmZArugFpbjKWbQ3vqi7adkRUYuan2Bthc3iCTLDO6mWaZQyu69XI5qq8k1oP
 RtDvG7OUHJH+opLZr+jQCtUROVXM4UBARUk9lB7wTxcUggzQFrFX7SKp8SXHhj8PNjRJ
 ttmX1tP7k2MYt4Ap5pulhXJgOQ91cB1zAYI+ogZJiTRsAZQhBQ1KAjcmPSC7dftNstDp
 dQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5Q9l9r/b6kQ91x4NbnE0QX6N3wOGcLvxWVDOgH26Vo=;
 b=1SIrg/VDetN6cxbh6Z37Yiz21gzBCplaO+xGj81ITwfuVoGz3vtR1j8NJkTTYsVQSw
 bqwwdBVWpYRxqrIOZxBNT27xPzpchhIZnY4LPxdnmH1Kh7T8h5SVvPlScq/qQWpXLIKM
 jsLc6icn01F5QpmapYxW3nIkIdKuPamiib+ILRbUXi2pyZH/+/HHlrq5UhvYqhA50SWX
 wy7GuhrlwnrUOs5ZbOQIZyPjC3yqHNByBlvlunDSxzxpGG3tq91ciHnuNWA4a8az6lrs
 ZFhwVMv5aJbcBiqZ47UNixpdeJNkElBKLlM1j34rmcQaaTEVjiktMGPSpHyCQGwqWB7/
 /+kQ==
X-Gm-Message-State: AO0yUKW1WdmQXHZGOOe9OVYSyIngOtR5rq2i23jjS2k03Pm+2PjUDBrb
 VuD+NTZqd6SYNkT+8CRjvL5kda5kFlo=
X-Google-Smtp-Source: AK7set88t1Yf42l4PbHsipccIi5Pj+UGdxm7Lk941OeQeezbiEs/Yu27M0OCEI6vgQaoGe8OF5lsDw==
X-Received: by 2002:a05:6808:18c:b0:378:4785:7a2e with SMTP id
 w12-20020a056808018c00b0037847857a2emr9303169oic.28.1675591501131; 
 Sun, 05 Feb 2023 02:05:01 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:00 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/16] ppc/pegasos2: Improve readability of VIA south bridge
 creation
Date: Sun,  5 Feb 2023 07:04:36 -0300
Message-Id: <20230205100449.2352781-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Slightly improve readability of creating the south btidge by cnamging
type of a local variable to avoid some casts within function arguments
which makes some lines shorter and easier to read.
Also remove an unneded line break.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230117214545.5E191746369@zero.eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index f46d4bf51d..1a13632ba6 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -102,7 +102,8 @@ static void pegasos2_init(MachineState *machine)
     CPUPPCState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
     PCIBus *pci_bus;
-    PCIDevice *dev, *via;
+    Object *via;
+    PCIDevice *dev;
     I2CBus *i2c_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
@@ -159,19 +160,18 @@ static void pegasos2_init(MachineState *machine)
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
-    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
-                                          TYPE_VT8231_ISA);
+    via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
+                                                 true, TYPE_VT8231_ISA));
     object_property_add_alias(OBJECT(machine), "rtc-time",
-                              object_resolve_path_component(OBJECT(via),
-                                                            "rtc"),
+                              object_resolve_path_component(via, "rtc"),
                               "date");
     qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
+    dev = PCI_DEVICE(object_resolve_path_component(via, "ide"));
     pci_ide_create_devs(dev);
 
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
+    dev = PCI_DEVICE(object_resolve_path_component(via, "pm"));
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
-- 
2.39.1


