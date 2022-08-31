Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540E5A86BF
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:31:18 +0200 (CEST)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTQj-0007vw-8z
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpS-0005Tf-Ql; Wed, 31 Aug 2022 14:52:46 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpQ-000890-Uh; Wed, 31 Aug 2022 14:52:46 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11e7e0a63e2so25422753fac.4; 
 Wed, 31 Aug 2022 11:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WvgrZreNJVwVxCAG8r1WouiihndF6Ok2THG78cBDGJo=;
 b=GyJd0boT/UHKkGFR459c7hQorlIpHcJ3IGJWPxU35UzRC2g9fNIsVSRCYUxl736kyh
 CxJ86Uytp6s1/F+oTPPPInwPIf2kE9EqxcD8dn5z61EtkspM+4HBNwS1zx4rIAt6vwMi
 o5EXRSElj6xminblqBXPl5gtQZi555FSxfuNSQOLfAwJ1EVS0ZnIbLE9jyrtYoIlfZY4
 et+W4GjmJqknBam5W4pHhFRIEbUnjkbCLwsxv8PVrIVXV2zQxXOxuzi2zmnnWJz0uJ53
 5HVZ83GVD0rqaq5BRbfnN+Gw8+BBbYQAPRr+czFKIVUgFRvfdTfkpW4sZg5+wbZyAhzT
 cacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WvgrZreNJVwVxCAG8r1WouiihndF6Ok2THG78cBDGJo=;
 b=E/Gnpnk1DPnpqPR09bFOuGNt2aH61U7Q2srD2+yN6xN0p0FhpQ+tmxm+4Mf29ymV6Z
 QhZmkEp3eW+zX+SiOMchswGu/0vnANdEY9epBe8cyENwnbr0Qlbxooxq7zgCtg581S41
 +jqmQkghIi1yKn6DdsJTZVOQAFqEGFG6aJb0NDBYvhWKyq7aeqdKFA2b6o3cMk1QPF82
 fVTYoGvuN8bsW8axhhAcvkkITopDX7Jbf04XOdC4WnPZ3bElIGVN5Dzke7685MJof7Jt
 READH5vTa8RtZjbio2dE6GZYRCPe5pq3KoreWjpOO2UKZMlmxGm1pJ1yDZARkIUoxUbP
 t5JQ==
X-Gm-Message-State: ACgBeo3Ccx3efg0msZJ9wPcYdeJU28JmebEKVujx7VOAzFojaF/1s+kW
 QxAiUv4fLZwQRoCwYf1QpVpsjTsi8xE=
X-Google-Smtp-Source: AA6agR7nRRtsUjQ/kYW2cNCme3GFOnixnxO8RbdGmJm0nDvzdJ+ShsQPDkuGZJpCB3CYPU17xS+9rQ==
X-Received: by 2002:a05:6870:ec88:b0:11f:963:1019 with SMTP id
 eo8-20020a056870ec8800b0011f09631019mr2183734oab.201.1661971963782; 
 Wed, 31 Aug 2022 11:52:43 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 43/60] ppc/ppc405: QOM'ify EBC
Date: Wed, 31 Aug 2022 15:50:17 -0300
Message-Id: <20220831185034.23240-44-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

From: Cédric Le Goater <clg@kaod.org>

EBC is currently modeled as a DCR device. Also drop the ppc405_ebc_init()
helper and adapt the sam460ex machine.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <51a0769ab605c5158f4f2f1c896725d5fe7a073b.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h    | 17 ++++++++++++-
 hw/ppc/ppc405_uc.c | 62 ++++++++++++++++++++++++----------------------
 hw/ppc/sam460ex.c  |  4 ++-
 3 files changed, 51 insertions(+), 32 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index c75e4c7cb5..82bf8dae93 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,21 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* Peripheral controller */
+#define TYPE_PPC405_EBC "ppc405-ebc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
+struct Ppc405EbcState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t addr;
+    uint32_t bcr[8];
+    uint32_t bap[8];
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+    uint32_t cfg;
+};
+
 /* DMA controller */
 #define TYPE_PPC405_DMA "ppc405-dma"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
@@ -192,12 +207,12 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
+    Ppc405EbcState ebc;
 };
 
 /* PowerPC 405 core */
 ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
 void ppc4xx_plb_init(CPUPPCState *env);
-void ppc405_ebc_init(CPUPPCState *env);
 
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 3845c0fec1..ff81fb3e20 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -393,28 +393,16 @@ static void ppc4xx_opba_init(hwaddr base)
 
 /*****************************************************************************/
 /* Peripheral controller */
-typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
-struct ppc4xx_ebc_t {
-    uint32_t addr;
-    uint32_t bcr[8];
-    uint32_t bap[8];
-    uint32_t bear;
-    uint32_t besr0;
-    uint32_t besr1;
-    uint32_t cfg;
-};
-
 enum {
     EBC0_CFGADDR = 0x012,
     EBC0_CFGDATA = 0x013,
 };
 
-static uint32_t dcr_read_ebc (void *opaque, int dcrn)
+static uint32_t dcr_read_ebc(void *opaque, int dcrn)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = opaque;
     uint32_t ret;
 
-    ebc = opaque;
     switch (dcrn) {
     case EBC0_CFGADDR:
         ret = ebc->addr;
@@ -494,11 +482,10 @@ static uint32_t dcr_read_ebc (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = opaque;
 
-    ebc = opaque;
     switch (dcrn) {
     case EBC0_CFGADDR:
         ebc->addr = val;
@@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ebc_reset (void *opaque)
+static void ppc405_ebc_reset(DeviceState *dev)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
     int i;
 
-    ebc = opaque;
     ebc->addr = 0x00000000;
     ebc->bap[0] = 0x7F8FFE80;
     ebc->bcr[0] = 0xFFE28000;
@@ -572,16 +558,23 @@ static void ebc_reset (void *opaque)
     ebc->cfg = 0x80400000;
 }
 
-void ppc405_ebc_init(CPUPPCState *env)
+static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_ebc_t *ebc;
-
-    ebc = g_new0(ppc4xx_ebc_t, 1);
-    qemu_register_reset(&ebc_reset, ebc);
-    ppc_dcr_register(env, EBC0_CFGADDR,
-                     ebc, &dcr_read_ebc, &dcr_write_ebc);
-    ppc_dcr_register(env, EBC0_CFGDATA,
-                     ebc, &dcr_read_ebc, &dcr_write_ebc);
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
+    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, ebc, &dcr_read_ebc, &dcr_write_ebc);
+}
+
+static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ebc_realize;
+    dc->reset = ppc405_ebc_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1378,6 +1371,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
+
+    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1444,7 +1439,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                       s->do_dram_init);
 
     /* External bus controller */
-    ppc405_ebc_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
+        return;
+    }
 
     /* DMA controller */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->dma), &s->cpu, errp)) {
@@ -1526,6 +1523,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_EBC,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405EbcState),
+        .class_init     = ppc405_ebc_class_init,
+    }, {
         .name           = TYPE_PPC405_DMA,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405DmaState),
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0357ee077f..320c61a7f3 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -371,7 +371,9 @@ static void sam460ex_init(MachineState *machine)
                                qdev_get_gpio_in(uic[0], 3));
 
     /* External bus controller */
-    ppc405_ebc_init(env);
+    dev = qdev_new(TYPE_PPC405_EBC);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
 
     /* CPR */
     ppc4xx_cpr_init(env);
-- 
2.37.2


