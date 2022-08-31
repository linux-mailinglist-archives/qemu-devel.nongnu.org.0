Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB355A86B2
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:24:36 +0200 (CEST)
Received: from localhost ([::1]:40002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTKF-0001E9-JO
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpP-0005Ia-1g; Wed, 31 Aug 2022 14:52:43 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpM-0008CP-LU; Wed, 31 Aug 2022 14:52:42 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 q39-20020a056830442700b0063889adc0ddso10889111otv.1; 
 Wed, 31 Aug 2022 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/CUpiQz/Eh/qlwE2VDRL1xjgEiOzu/97pCbPaKrzZJE=;
 b=m+kXmuHYgzTgwO0xLddooS5VwET3vE9dJUo5FFAK8oRLaxVi5zXehc+4kk7ayERT7t
 foxxeENQ3J0bn84cz2Uwf7LVpafCAM68Sud5Ctq/T+PSG/ilah0zbrHJoMJx49wRWU6+
 UgdKInrZXcTKRgmuwtDyJrJiJst+siV6TgV2/f9UKLqnalXHPPcj2J1wJaMT0OuUfpoW
 9wOk5z8YKxLepMdz+s/cq3bfuvzYSDAqmp4pixrLo+1+d2c9tOpxl7YIzvHskjfjPXNq
 cqnflKODHPzb3QcKTyC2ouK1jUIFVb1m/q4KzIjUvPgli0zFXEBoYTSRnYDdVqJqKR2G
 IGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/CUpiQz/Eh/qlwE2VDRL1xjgEiOzu/97pCbPaKrzZJE=;
 b=0OI8QRYAMlozdsfdeAsEllCIEUBo18jneh6Bs8bB2MeD9X27w/hmtVcOOd6fjdtmSl
 lEcKjn+g2mLa1byjqkGVie8pIDtzZyv+ZTyxC3cHPhXs2tHFppVQUQyYO2YfViflqGxq
 zhdWU4eScqh1DitT+NaUc5XxRgKas/N8nSPcYkXYDrP7tLg/FmoTxhFNW2W5Ny9Q/KSz
 sI6yxzzMhfpc6eCIBnbXaqgELQlXCvT3bd9jdOVIrbegmNLiPFzOYPFsYuCZBau3QAtV
 rPMueWfpuYicryiCT0FtECVdT2hut9nPcRgthmhtpBwYfLDc6qVzGuqjzO7XG0oOFkTf
 /2dA==
X-Gm-Message-State: ACgBeo1Mmwg3DD1Jjvxvr9cQCl6bS7AAv35Jk8xtSK6cNiSWLWqFYeSa
 3hMbNNoeLJYhGDEvP4z84BJVr/riQnQ=
X-Google-Smtp-Source: AA6agR6Q2O6siIyx3sWuQya0FbzmXTPaE8eiuKjrqOBW9HAoxWM9ae1cGYBAe3cXQi9WWUeaJVlL2w==
X-Received: by 2002:a05:6830:14ce:b0:636:dfca:259e with SMTP id
 t14-20020a05683014ce00b00636dfca259emr11123111otq.287.1661971958965; 
 Wed, 31 Aug 2022 11:52:38 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 41/60] ppc/ppc405: QOM'ify GPIO
Date: Wed, 31 Aug 2022 15:50:15 -0300
Message-Id: <20220831185034.23240-42-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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

The GPIO controller is currently modeled as a simple SysBus device
with a unique memory region.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: Simplify sysbus device casts for readability]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <e95d7849f3768e1f9a2846c4b282392750678b3e.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h     | 21 +++++++++++++++++++
 hw/ppc/ppc405_uc.c  | 50 ++++++++++++++++++++++-----------------------
 hw/ppc/trace-events |  1 -
 3 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index a5b493d3e7..21f6cb3585 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,26 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* GPIO */
+#define TYPE_PPC405_GPIO "ppc405-gpio"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GpioState, PPC405_GPIO);
+struct Ppc405GpioState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion io;
+    uint32_t or;
+    uint32_t tcr;
+    uint32_t osrh;
+    uint32_t osrl;
+    uint32_t tsrh;
+    uint32_t tsrl;
+    uint32_t odr;
+    uint32_t ir;
+    uint32_t rr1;
+    uint32_t isr1h;
+    uint32_t isr1l;
+};
+
 /* On Chip Memory */
 #define TYPE_PPC405_OCM "ppc405-ocm"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
@@ -152,6 +172,7 @@ struct Ppc405SoCState {
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
+    Ppc405GpioState gpio;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 8ee0357ac3..3f4a5b36f5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -714,22 +714,6 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
 
 /*****************************************************************************/
 /* GPIO */
-typedef struct ppc405_gpio_t ppc405_gpio_t;
-struct ppc405_gpio_t {
-    MemoryRegion io;
-    uint32_t or;
-    uint32_t tcr;
-    uint32_t osrh;
-    uint32_t osrl;
-    uint32_t tsrh;
-    uint32_t tsrl;
-    uint32_t odr;
-    uint32_t ir;
-    uint32_t rr1;
-    uint32_t isr1h;
-    uint32_t isr1l;
-};
-
 static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned size)
 {
     trace_ppc405_gpio_read(addr, size);
@@ -748,20 +732,22 @@ static const MemoryRegionOps ppc405_gpio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ppc405_gpio_reset (void *opaque)
+static void ppc405_gpio_realize(DeviceState *dev, Error **errp)
 {
+    Ppc405GpioState *s = PPC405_GPIO(dev);
+
+    memory_region_init_io(&s->io, OBJECT(s), &ppc405_gpio_ops, s, "gpio",
+                          0x38);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->io);
 }
 
-static void ppc405_gpio_init(hwaddr base)
+static void ppc405_gpio_class_init(ObjectClass *oc, void *data)
 {
-    ppc405_gpio_t *gpio;
-
-    trace_ppc405_gpio_init(base);
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    gpio = g_new0(ppc405_gpio_t, 1);
-    memory_region_init_io(&gpio->io, NULL, &ppc405_gpio_ops, gpio, "pgio", 0x038);
-    memory_region_add_subregion(get_system_memory(), base, &gpio->io);
-    qemu_register_reset(&ppc405_gpio_reset, gpio);
+    dc->realize = ppc405_gpio_realize;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1414,6 +1400,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
 
     object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
+
+    object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1492,8 +1480,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
                          qdev_get_gpio_in(s->uic, 2));
+
     /* GPIO */
-    ppc405_gpio_init(0xef600700);
+    sbd = SYS_BUS_DEVICE(&s->gpio);
+    if (!sysbus_realize(sbd, errp)) {
+        return;
+    }
+    sysbus_mmio_map(sbd, 0, 0xef600700);
 
     /* Serial ports */
     if (serial_hd(0) != NULL) {
@@ -1555,6 +1548,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_GPIO,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405GpioState),
+        .class_init     = ppc405_gpio_class_init,
+    }, {
         .name           = TYPE_PPC405_OCM,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405OcmState),
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 8d35521bf7..69a95f9f57 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -165,7 +165,6 @@ opba_init(uint64_t addr) "offet 0x%" PRIx64
 
 ppc405_gpio_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size %d"
 ppc405_gpio_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%" PRIx64 " size %d = 0x%" PRIx64
-ppc405_gpio_init(uint64_t addr) "offet 0x%" PRIx64
 
 ocm_update_mappings(uint32_t isarc, uint32_t isacntl, uint32_t dsarc, uint32_t dsacntl, uint32_t ocm_isarc, uint32_t ocm_isacntl, uint32_t ocm_dsarc, uint32_t ocm_dsacntl) "OCM update ISA 0x%08" PRIx32 " 0x%08" PRIx32 " (0x%08" PRIx32" 0x%08" PRIx32 ") DSA 0x%08" PRIx32 " 0x%08" PRIx32" (0x%08" PRIx32 " 0x%08" PRIx32 ")"
 ocm_map(const char* prefix, uint32_t isarc) "OCM map %s 0x%08" PRIx32
-- 
2.37.2


