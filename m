Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34862E85E0
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:13:51 +0100 (CET)
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTcE-0005kK-Ur
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTb3-0004Ku-37; Fri, 01 Jan 2021 18:12:38 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTb1-0001vW-8z; Fri, 01 Jan 2021 18:12:36 -0500
Received: by mail-wm1-x331.google.com with SMTP id c124so10249692wma.5;
 Fri, 01 Jan 2021 15:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ljyxQOUNZGYTQa01IhKR46X5cyTNgh71UVYnn7BF/T8=;
 b=gj9aAg3lEBFkGyYqrbofjYq+WHyHo97p20dac3t2B96uP7gx03O3DbJSfL06Pw4afl
 MKvcuJc5BIUJnRGBt8TknJzZLRHJ4ZBZCkyCUiFbPJzwDZhWJFWUW3rjrWUYDn/B+i3F
 b5ml/yS0rBVKipruBt9vHyoysstW/DlKg5HsomBxyGUmXSvQEJ02pNtUbVshBeDIjCM8
 wgKY2L0xufQM3LH5F11hSDb+f0v/7Fg9X6hv3/BWvxJfMvogvZIP4dkTZW5N2MwOxUFf
 Q5Y5dTuSiuj0rawNaIJRY3b7/jaGQgXkbW6n9xbQhS+3pzi+ioohk7ekWaKxWCcdPFS1
 kiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ljyxQOUNZGYTQa01IhKR46X5cyTNgh71UVYnn7BF/T8=;
 b=Tg2HPUn4EZBefl9JwC4cAYhjkMUGSOgJg/bLaZ55NwZwl8dqO907BckC3Izyu7oGhq
 MbDjz0WKy6QMAIqhJnzkIMZOS86voH8BSiN4JOgnQ/u/gPLuzLELxMjd4sxq2A/7ypyM
 gxpYfHsldS1NtRN334owYumxSDMqxNQSN6ihO5bb+Vux2/dnxRFZgEMB09HGq3Dvcd+7
 GjETY5bdkQbIbVXVbOqCfdGyNj6cjCPUnLd4nfq7utoZOQCtV8iF/ZRS48ABqPQPUnvP
 pURHAQcWYHYjQQFsIK7RXBV+dYoaSKkzb1jbXpyWplZZQ02g+RBav4ezsqGJbp2CbrC+
 ayKw==
X-Gm-Message-State: AOAM531tYlyZK3EjAHxeULkZSOWyaxHeEaSbn2GFfnhjbgBKpac40dx8
 Hs7VmK0VB73phteV+ncMIfc0oysS3L8=
X-Google-Smtp-Source: ABdhPJzHbswv049B7rC0m2xISqgFQL9fayJbvpZrC9bXRYHh2Z9ZhTl7pJUSHkxPK8VFQWoxe/7oiw==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr17661109wmk.14.1609542753397; 
 Fri, 01 Jan 2021 15:12:33 -0800 (PST)
Received: from x1w.redhat.com (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id x17sm76034444wro.40.2021.01.01.15.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 15:12:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/5] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
Date: Sat,  2 Jan 2021 00:12:13 +0100
Message-Id: <20210101231215.1870611-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210101231215.1870611-1-f4bug@amsat.org>
References: <20210101231215.1870611-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the datasheet (Chapter 5.7.1. "PCI address regions"),
the PCIMAP register:

  Map the 64Mbyte regions marked "PCI_Lo" in the CPU's memory map,
  each of which can be assigned to any 64 Mbyte-aligned region of
  PCI memory. The address appearing on the PCI bus consists of the
  low 26 bits of the CPU physical address, with the high 6 bits
  coming from the appropriate base6 field. Each of the three regions
  is an independent window onto PCI memory, and can be positioned on
  any 64Mbyte boundary in PCI space.

Remap the 3 regions on reset and when PCIMAP is updated.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 49 ++++++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced0657..c58eeaf504c 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -137,6 +137,10 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 
 /* 4. PCI address map control */
 #define BONITO_PCIMAP           (0x10 >> 2)      /* 0x110 */
+FIELD(PCIMAP, LO0,               0, 6)
+FIELD(PCIMAP, LO1,               6, 6)
+FIELD(PCIMAP, LO2,              12, 6)
+FIELD(PCIMAP, 2G,               18, 1)
 #define BONITO_PCIMEMBASECFG    (0x14 >> 2)      /* 0x114 */
 #define BONITO_PCIMAP_CFG       (0x18 >> 2)      /* 0x118 */
 
@@ -237,6 +241,7 @@ struct BonitoState {
     qemu_irq *pic;
     PCIBonitoState *pci_dev;
     MemoryRegion pci_mem;
+    MemoryRegion pcimem_lo_alias[3];
 };
 
 #define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
@@ -245,6 +250,31 @@ OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
 #define TYPE_PCI_BONITO "Bonito"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIBonitoState, PCI_BONITO)
 
+static void bonito_remap(PCIBonitoState *s)
+{
+    static const char *const region_name[3] = {
+        "pci.lomem0", "pci.lomem1", "pci.lomem2"
+    };
+    BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
+
+    for (size_t i = 0; i < 3; i++) {
+        uint32_t offset = extract32(s->regs[BONITO_PCIMAP], 6 * i, 6) << 26;
+
+        if (memory_region_is_mapped(&bs->pcimem_lo_alias[i])) {
+            memory_region_del_subregion(get_system_memory(),
+                                        &bs->pcimem_lo_alias[i]);
+            object_unparent(OBJECT(&bs->pcimem_lo_alias[i]));
+        }
+
+        memory_region_init_alias(&bs->pcimem_lo_alias[i], OBJECT(s),
+                                 region_name[i], &bs->pci_mem,
+                                 offset, 64 * MiB);
+        memory_region_add_subregion(get_system_memory(),
+                                    BONITO_PCILO_BASE + i * 64 * MiB,
+                                    &bs->pcimem_lo_alias[i]);
+    }
+}
+
 static void bonito_writel(void *opaque, hwaddr addr,
                           uint64_t val, unsigned size)
 {
@@ -260,7 +290,6 @@ static void bonito_writel(void *opaque, hwaddr addr,
     case BONITO_BONPONCFG:
     case BONITO_IODEVCFG:
     case BONITO_SDCFG:
-    case BONITO_PCIMAP:
     case BONITO_PCIMEMBASECFG:
     case BONITO_PCIMAP_CFG:
     case BONITO_GPIODATA:
@@ -282,6 +311,10 @@ static void bonito_writel(void *opaque, hwaddr addr,
     case BONITO_MEMSIZE:
         s->regs[saddr] = val;
         break;
+    case BONITO_PCIMAP:
+        s->regs[saddr] = val;
+        bonito_remap(s);
+        break;
     case BONITO_BONGENCFG:
         if (!(s->regs[saddr] & 0x04) && (val & 0x04)) {
             reset = 1; /* bit 2 jump from 0 to 1 cause reset */
@@ -610,6 +643,8 @@ static void bonito_reset(void *opaque)
     s->regs[BONITO_DQCFG] = 0x8;
     s->regs[BONITO_MEMSIZE] = 0x10000000;
     s->regs[BONITO_PCIMAP] = 0x6140;
+
+    bonito_remap(s);
 }
 
 static const VMStateDescription vmstate_bonito = {
@@ -626,7 +661,6 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
-    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
 
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
     phb->bus = pci_register_root_bus(dev, "pci",
@@ -634,17 +668,6 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
                                      dev, &bs->pci_mem, get_system_io(),
                                      0x28, 32, TYPE_PCI_BUS);
 
-    for (size_t i = 0; i < 3; i++) {
-        char *name = g_strdup_printf("pci.lomem%zu", i);
-
-        memory_region_init_alias(&pcimem_lo_alias[i], NULL, name,
-                                 &bs->pci_mem, i * 64 * MiB, 64 * MiB);
-        memory_region_add_subregion(get_system_memory(),
-                                    BONITO_PCILO_BASE + i * 64 * MiB,
-                                    &pcimem_lo_alias[i]);
-        g_free(name);
-    }
-
     create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
 }
 
-- 
2.26.2


