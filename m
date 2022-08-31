Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641315A8673
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:09:54 +0200 (CEST)
Received: from localhost ([::1]:33994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTT61-0001i9-Is
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoB-0002ts-VH; Wed, 31 Aug 2022 14:51:28 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:39833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSo9-000819-Kr; Wed, 31 Aug 2022 14:51:27 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11e9a7135easo23772576fac.6; 
 Wed, 31 Aug 2022 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UUzG1m/jY0aj+8UQJ6oIqjQbr/XYUoynDwPcfAYIbIs=;
 b=TkRYi3miV2WurrgIFTVBgeBeF/EGx0V7OxgR2jg/rdElAznhePdlYYfcmgL3ofQizw
 vWpiD3Wzz7AHrDaNl3PHH0kFaztXEBYbL8OOAypRxIlp6n0ARv3kCW5cx/D95rKeyvr0
 31Fm8pvE/g8iCGbqUgnoXDukStJ8wbdgX5/1JjrK4Vw03rablMYGSkk98lV9NDPBzlia
 8DMYeRePOrlumbYkrZiw2Wer9ahACBeHlYS1djJkWAqa7i1iD5HeH+0ic0aOKJIbAgpy
 bE7s8jnYfDS+uxCAnY0HIC9ij+Ezsa4GfxQQDj+knmjB5+iSsdGXfq7hf1PzbFM0D1rf
 F9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UUzG1m/jY0aj+8UQJ6oIqjQbr/XYUoynDwPcfAYIbIs=;
 b=FiRs1mYebhcFsnRyU6ARS6ziXUOXU8I95/z2RDUIlTI9dui6I71kam16+0DQoTvWdo
 BTRsWwTdzW9zOHfvJZgnQZth78I7PNRUvgalIad1P8oAiiODAqiE/ZXtv5szgxGluMWg
 7z+DI4P6TN4ZL5qqsHUZ29qR5x5+GeshVIbtNKEBxkFAc1rSJq6MiDgNf41xuM8YiyFb
 5iUF5DdFiPP+sCs8gykFmVV7SrlMjHIL2sD6DLRYWKGBQj+Dn9rhgZkkKLsalQUIaU+y
 kZVJ7y2WeqLtSJbwUJHNQUSvJ9end+a2veaLzZsFB+VFaxZNDv65huIV5O7glLabin7k
 iTaw==
X-Gm-Message-State: ACgBeo1ugT86ddBMGqGNu34Ly9HRWa0i+/YOX08hssXJsxhz5KUpkR1D
 TUgjKif7MtKE7yXEU9TR2Qqn1IIEE1A=
X-Google-Smtp-Source: AA6agR7NVgyhDPCNx2/0UEz0X2TlpcBnaPMwNVqLhTEgEuvHOVtZorYPQRav939ZkZ02SWZE/UvZvw==
X-Received: by 2002:a05:6870:3413:b0:11e:35e:db23 with SMTP id
 g19-20020a056870341300b0011e035edb23mr2064897oah.34.1661971884420; 
 Wed, 31 Aug 2022 11:51:24 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 14/60] ppc/pnv: remove root port name from
 pnv_phb_attach_root_port()
Date: Wed, 31 Aug 2022 15:49:48 -0300
Message-Id: <20220831185034.23240-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We support only a single root port, PNV_PHB_ROOT_PORT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-10-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 7 +------
 hw/ppc/pnv.c          | 9 +++++----
 include/hw/ppc/pnv.h  | 3 +--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index da729e89e7..cc15a949c9 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -24,7 +24,6 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     PnvPHB *phb = PNV_PHB(dev);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     g_autofree char *phb_typename = NULL;
-    g_autofree char *phb_rootport_typename = NULL;
 
     if (!phb->version) {
         error_setg(errp, "version not specified");
@@ -34,15 +33,12 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     switch (phb->version) {
     case 3:
         phb_typename = g_strdup(TYPE_PNV_PHB3);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 4:
         phb_typename = g_strdup(TYPE_PNV_PHB4);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 5:
         phb_typename = g_strdup(TYPE_PNV_PHB5);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     default:
         g_assert_not_reached();
@@ -73,8 +69,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    pnv_phb_attach_root_port(pci, phb_rootport_typename,
-                             phb->phb_id, phb->chip_id);
+    pnv_phb_attach_root_port(pci, phb->phb_id, phb->chip_id);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 576c0013ed..6b94c373d1 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1195,11 +1195,12 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
  * QOM id. 'chip_id' is going to be used as PCIE chassis for the
  * root port.
  */
-void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
-                              int index, int chip_id)
+void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
 {
-    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
-    g_autofree char *default_id = g_strdup_printf("%s[%d]", name, index);
+    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
+    g_autofree char *default_id = g_strdup_printf("%s[%d]",
+                                                  TYPE_PNV_PHB_ROOT_PORT,
+                                                  index);
     const char *dev_id = DEVICE(root)->id;
 
     object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 21fa90aaff..0eda47da0c 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -193,8 +193,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
-void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
-                              int index, int chip_id);
+void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.37.2


