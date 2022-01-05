Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6C1485ACB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:36:09 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dx2-0006BY-E0
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:36:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlP-0001dz-Jw; Wed, 05 Jan 2022 16:24:07 -0500
Received: from [2607:f8b0:4864:20::a30] (port=45780
 helo=mail-vk1-xa30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlN-0007sk-Vn; Wed, 05 Jan 2022 16:24:07 -0500
Received: by mail-vk1-xa30.google.com with SMTP id j4so442693vkr.12;
 Wed, 05 Jan 2022 13:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvBDsArz1EJtM3iV1IrsTLU5PEbPHY3JrCCjY7ZIxjA=;
 b=LiBwEzv9ve43U3ccMAZu3EKJYVzRMg4lVtdnd+BG1Z8Yxv43u1maTTx+WhMvZT28nB
 P45jczupp415s7DpHNeiue9pZ6G7DePmaJZsgQcUojf5ExepP8j8ORgnH1SQOZe0jao+
 EFURIfjxva17FMoQhZdPHT3Eh0fL6m4WFnDvntt4b/2b04EkCKLORQxZR7fBIvefXC5q
 OePiLe2CbsICPdZ/epV3NyFe72dYBPGLMOWfLQXzf2aSDpN7wk5piSwXDRi6sg2cAXZw
 9IvONYo/oJu8ydP0EJGCRCmUuY0u7sB1aiI7kGf5UbqOqIRvqTjwKE5mGiib1ezZoQMv
 j10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvBDsArz1EJtM3iV1IrsTLU5PEbPHY3JrCCjY7ZIxjA=;
 b=Q/r/y1jOMzzc0MLQqVV6+3nm6a5ND71vfom4mH7RLQotygkRrDLrnoD4++Qbt+2aUI
 2McBT0p5ABD2Nms3LRuKHZ9t9YtHHkfUPY5PoYYPliNptWYf2w646uMpF2CXrLVvNkyy
 d9eMpuRkwBPfnL0rg9AseVzwb67d3AYndLxmsUIN81SRQMcjeWobuCbhfkNIMv+nu0At
 PGr4dLd33JfdGamW9gjr0gV4nchOxpEkUACxqMRWcReIm+hA3g5yzgfZB8k3clB/Puod
 KqVyVa31av5ld2cRTLk7fH7tvSxGHH5lvdAZJoUINSVg8plBa+Lt/u9ABb6HBaFGFqyp
 TsLg==
X-Gm-Message-State: AOAM533Da63CfDuX4ti+W2izx2CFAdwnXuYcjd3UbAmYno09PNdaGB5o
 OsrHg4lQ7QV9KYt+TfGrqj0ZxDRMxeU=
X-Google-Smtp-Source: ABdhPJz9tJBTkrjSnYgDNGNQa8FgjX7/EhDNzJ7FpIBFjOX50PIdCn9blD0CMJlkaQH3pWlm1zpX6w==
X-Received: by 2002:a05:6122:e46:: with SMTP id
 bj6mr19344435vkb.31.1641417844694; 
 Wed, 05 Jan 2022 13:24:04 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:04 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/18] ppc/pnv: Introduce support for user created PHB3
 devices
Date: Wed,  5 Jan 2022 18:23:26 -0300
Message-Id: <20220105212338.49899-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

PHB3 devices and PCI devices can now be added to the powernv8 machine
using :

  -device pnv-phb3,chip-id=0,index=1 \
  -device nec-usb-xhci,bus=pci.1,addr=0x0

The 'index' property identifies the PHB3 in the chip. In case of user
created devices, a lookup on 'chip-id' is required to assign the
owning chip.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3.c | 11 ++++++++++-
 hw/ppc/pnv.c           | 23 ++++++++++++++++++-----
 include/hw/ppc/pnv.h   |  2 ++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index fdc8d0b437..1ebe43df5d 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -991,6 +991,15 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
     int i;
 
+    /* User created devices */
+    if (!phb->chip) {
+        phb->chip = pnv_get_chip(pnv, phb->chip_id);
+        if (!phb->chip) {
+            error_setg(errp, "invalid chip id: %d", phb->chip_id);
+            return;
+        }
+    }
+
     if (phb->phb_id >= PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
         error_setg(errp, "invalid PHB index: %d", phb->phb_id);
         return;
@@ -1104,7 +1113,7 @@ static void pnv_phb3_class_init(ObjectClass *klass, void *data)
     dc->realize = pnv_phb3_realize;
     device_class_set_props(dc, pnv_phb3_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 }
 
 static const TypeInfo pnv_phb3_type_info = {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 3a263f631a..ad02d56aa7 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1117,14 +1117,14 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
-    for (i = 0; i < pcc->num_phbs; i++) {
+    if (defaults_enabled()) {
+        chip->num_phbs = pcc->num_phbs;
+    }
+
+    for (i = 0; i < chip->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
     }
 
-    /*
-     * Number of PHBs is the chip default
-     */
-    chip->num_phbs = pcc->num_phbs;
 }
 
 static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
@@ -1814,6 +1814,19 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
     return NULL;
 }
 
+PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
+{
+    int i;
+
+    for (i = 0; i < pnv->num_chips; i++) {
+        PnvChip *chip = pnv->chips[i];
+        if (chip->chip_id == chip_id) {
+            return chip;
+        }
+    }
+    return NULL;
+}
+
 static int pnv_ics_resend_child(Object *child, void *opaque)
 {
     PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index c726288e5e..64bab7112b 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -218,6 +218,8 @@ struct PnvMachineState {
     hwaddr       fw_load_addr;
 };
 
+PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
+
 #define PNV_FDT_ADDR          0x01000000
 #define PNV_TIMEBASE_FREQ     512000000ULL
 
-- 
2.33.1


