Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB882E8292
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:56:25 +0100 (CET)
Received: from localhost ([::1]:36074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6ro-0001Iv-La
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lY-0001qR-L8
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:56 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lX-0006T0-3x
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:56 -0500
Received: by mail-wr1-x430.google.com with SMTP id q18so21082800wrn.1
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WFrblze5li4MVZdmD/PXlDbbm0BIjxaFdcbJ0KL/q84=;
 b=oCY+HZdeKzxfhjf18meqoCqH9zznlem7sYBdRiB6VTF1ann6gl2OyrxX5s7X2a2Rya
 AxZ4eeM6XHAOEP2SBAkqi/9N5Gj438kYyODZMOR8Y6jJCKzWwGqvyk34eyfbX57FQWI2
 3MaR9wBDRFaodr4kB8vRp6I/Dc1fTIWlQNoe8b6OuMczQYIQT96LLbcIbgCXYe0AfQlK
 FfAcRSwRdXCgaBmcz9puZj8+BOzZfYF+UZencqjTndOMlyPfl6ERYlV3ms6mlAnFhc9B
 CsM9u2VH6v+smIph5AUzW/mjvVv80i9S53iOglgV+oDa+tiCy5JY2v02TvJOEVCEr1/s
 TTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WFrblze5li4MVZdmD/PXlDbbm0BIjxaFdcbJ0KL/q84=;
 b=EmrmTYTHbljuoutdjPskrQEHOylmIi8LKZxRUcoK/Iv3Pz/fgj2+Dy6lFD/jK5jELI
 QFl25mqvxrHf7e84VT1m5Yij4YX3kZKBpmG0+G5RUHWH1VuXsfsJYThMV+4/hOKhg2lB
 QbyoJpE/wiK7pvWRs+xNHGsKiYL5eIHNzQpeHwysuyHZ9dJW0j41gIWINZISrDi3WcP+
 BJ9IiAnC1jWU2tsmYPwz9zourHO+DzjeM3z1HsUWminbvVWvZ2WVtE3EafXuxK9gK9Ft
 cOk1GszmW9tsXom2JOX6/b2vvi85OyFGFnCybTXS4npWsoYRKgcsEIHjKGGjF2ixdMiY
 gtWA==
X-Gm-Message-State: AOAM530iFbri/Y+IpoxpEvtuHb4hyvZekI16Ml9wQ3k99aIR2394R1SV
 JinJfv76Mlo8mwm07VJ5PrSEuduL8/Y=
X-Google-Smtp-Source: ABdhPJwrwe/LCzS7HK1cnQW6hO5y0DzMChCzRI6loZYj9hHRtsU0CfUiPYwbjGhFN9sXDBcgOmvwyw==
X-Received: by 2002:adf:9d42:: with SMTP id o2mr57237279wre.135.1609454993514; 
 Thu, 31 Dec 2020 14:49:53 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id y68sm15055472wmc.0.2020.12.31.14.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/18] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
Date: Thu, 31 Dec 2020 23:49:01 +0100
Message-Id: <20201231224911.1467352-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
RFC: memory_region_is_mapped() is probably not the best call to check
     if this is the first call.

 hw/pci-host/bonito.c | 49 ++++++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 29c0294d289..a091ef15d27 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -138,6 +138,10 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 
 /* 4. PCI address map control */
 #define BONITO_PCIMAP           (0x10 >> 2)      /* 0x110 */
+FIELD(PCIMAP, LO0,               0, 6)
+FIELD(PCIMAP, LO1,               6, 6)
+FIELD(PCIMAP, LO2,              12, 6)
+FIELD(PCIMAP, 2G,               18, 1)
 #define BONITO_PCIMEMBASECFG    (0x14 >> 2)      /* 0x114 */
 #define BONITO_PCIMAP_CFG       (0x18 >> 2)      /* 0x118 */
 
@@ -232,6 +236,7 @@ struct BonitoState {
     qemu_irq *pic;
     PCIBonitoState *pci_dev;
     MemoryRegion pci_mem;
+    MemoryRegion pcimem_lo_alias[3];
 };
 
 #define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
@@ -240,6 +245,31 @@ OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
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
@@ -253,7 +283,6 @@ static void bonito_writel(void *opaque, hwaddr addr,
     switch (saddr) {
     case BONITO_IODEVCFG:
     case BONITO_SDCFG:
-    case BONITO_PCIMAP:
     case BONITO_PCIMEMBASECFG:
     case BONITO_PCIMAP_CFG:
     case BONITO_GPIODATA:
@@ -275,6 +304,10 @@ static void bonito_writel(void *opaque, hwaddr addr,
     case BONITO_MEMSIZE:
         s->regs[saddr] = val;
         break;
+    case BONITO_PCIMAP:
+        s->regs[saddr] = val;
+        bonito_remap(s);
+        break;
     case BONITO_BONGENCFG:
         if (!FIELD_EX32(s->regs[saddr], BONGENCFG, CPUSELFRESET)
                 && FIELD_EX32(val, BONGENCFG, CPUSELFRESET)) {
@@ -603,6 +636,8 @@ static void bonito_reset(void *opaque)
     s->regs[BONITO_DQCFG] = 0x8;
     s->regs[BONITO_MEMSIZE] = 0x10000000;
     s->regs[BONITO_PCIMAP] = 0x6140;
+
+    bonito_remap(s);
 }
 
 static const VMStateDescription vmstate_bonito = {
@@ -619,7 +654,6 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
-    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
 
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
     phb->bus = pci_register_root_bus(dev, "pci",
@@ -627,17 +661,6 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
                                      dev, &bs->pci_mem, get_system_io(),
                                      PCI_DEVFN(5, 0), 32, TYPE_PCI_BUS);
 
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


