Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71D5F3822
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:53:48 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTNj-0005G1-Oh
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7x-00024O-0E; Mon, 03 Oct 2022 16:33:27 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7r-00045R-Um; Mon, 03 Oct 2022 16:33:22 -0400
Received: by mail-ej1-x631.google.com with SMTP id bj12so24616480ejb.13;
 Mon, 03 Oct 2022 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dLhWaH+GFLaQTBYICV0cLgySRHga9v0l6pOYw6YnV/g=;
 b=OG1S4UOxH9eJQpxiAXpC61Ye0BhjlqYo3ifXu/PK/yvZvEKEdPcw6wGIzbil7a4wVP
 SmmquUckAoR5X1Zlza/aQsPvj2ZGKmvDNP9H+XB95HOQ/UsO4r52PROFfZNHZuBBloG4
 IXhQLe7tyMtCMSZEtXqUy7XONRyXsBUo9IWifrpbVg+D5msxZcf5fuYd5j8etT0Ug98+
 PeJGEZ833528dAGrbr3/czaYlGTk8sEA/CvF3RY64hWfsCzEB3teet1sFGyN+2nacvZX
 xz+yn4sAMfYgPSB18N1C2VExqeagwSnTy0rGo2wLLUUSSon+kt4I/HfSVcxb4BAQl8bD
 rUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dLhWaH+GFLaQTBYICV0cLgySRHga9v0l6pOYw6YnV/g=;
 b=e+pKGlcY9OmPiQ6ex5/j46TYZ9eNqTvUqi4TgLDmXQL+P2czMeWqA9Av1FB0TPUOOP
 o7eqbxdg+eTkOfChyX/oa7O3wAVHoYeJ3gTDSxSQvRAXeD4k5GWsVw9uiPrZmaSyJXF0
 N/fvz0H7IATlv1maxLFLZ0f8lrICI+15iAxmYa7VjBXIvO/up2CKb8lzvl/UsnEHsrwP
 Q+seOOF3x8UAGq458NngPSY9z1CrESm/XRp5dypdsoiZkCKtEl0qQtt2XdfxsrxgRK9E
 dUWItdCIuFLfBn8n2SaepmSdfJyKlbDbeWvlnsWlAE8r4nDCdu2axeKGTKA11BIKBm87
 ZIPw==
X-Gm-Message-State: ACrzQf0OJU1QQPMkaUZAHowiNBQCg7YVnbdwKc9PSUMpvscwHr4BSWHS
 qVNiOolKIdWOcRTABkvewWbpe3ijgXk=
X-Google-Smtp-Source: AMsMyM4YztlIKSjsPs7thzErV+Wv4OHZ52do9Z1OcfGtyHclQs3UD223HHCDhX1IYjwe2SffBEa4yQ==
X-Received: by 2002:a17:907:2cee:b0:779:d10c:25a5 with SMTP id
 hz14-20020a1709072cee00b00779d10c25a5mr16751017ejc.678.1664829197718; 
 Mon, 03 Oct 2022 13:33:17 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:17 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 12/13] hw/sd/sdhci: Implement Freescale eSDHC device model
Date: Mon,  3 Oct 2022 22:31:41 +0200
Message-Id: <20221003203142.24355-13-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will allow e500 boards to access SD cards using just their own devices.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sdhci.c         | 147 +++++++++++++++++++++++++++++++++++++++++-
 include/hw/sd/sdhci.h |   3 +
 2 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 306070c872..ff92c6c4e5 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
 
     s->io_ops = &sdhci_mmio_ops;
+    s->io_registers_map_size = SDHC_REGISTERS_MAP_SIZE;
 }
 
 void sdhci_uninitfn(SDHCIState *s)
@@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
     memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
-                          SDHC_REGISTERS_MAP_SIZE);
+                          s->io_registers_map_size);
 }
 
 void sdhci_common_unrealize(SDHCIState *s)
@@ -1575,6 +1576,149 @@ static const TypeInfo sdhci_bus_info = {
     .class_init = sdhci_bus_class_init,
 };
 
+/* --- qdev Freescale eSDHC --- */
+
+/* Watermark Level Register */
+#define ESDHC_WML                    0x44
+
+/* Host Controller Capabilities Register 2 */
+#define ESDHC_CAPABILITIES_1        0x114
+
+/* Control Register for DMA transfer */
+#define ESDHC_DMA_SYSCTL            0x40c
+
+#define ESDHC_REGISTERS_MAP_SIZE    0x410
+
+static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t ret;
+
+    if (size != 4) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
+                      " wrong size\n", size, offset);
+        return 0;
+    }
+
+    if (offset & 0x3) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
+                      " unaligned\n", size, offset);
+        return 0;
+    }
+
+    switch (offset) {
+    case SDHC_SYSAD:
+    case SDHC_BLKSIZE:
+    case SDHC_ARGUMENT:
+    case SDHC_TRNMOD:
+    case SDHC_RSPREG0:
+    case SDHC_RSPREG1:
+    case SDHC_RSPREG2:
+    case SDHC_RSPREG3:
+    case SDHC_BDATA:
+    case SDHC_PRNSTS:
+    case SDHC_HOSTCTL:
+    case SDHC_CLKCON:
+    case SDHC_NORINTSTS:
+    case SDHC_NORINTSTSEN:
+    case SDHC_NORINTSIGEN:
+    case SDHC_ACMD12ERRSTS:
+    case SDHC_CAPAB:
+    case SDHC_SLOT_INT_STATUS:
+        ret = sdhci_read(opaque, offset, size);
+        break;
+
+    case ESDHC_WML:
+    case ESDHC_DMA_SYSCTL:
+        ret = 0;
+        qemu_log_mask(LOG_UNIMP, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
+                      " not implemented\n", size, offset);
+        break;
+
+    default:
+        ret = 0;
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
+                      " unknown offset\n", size, offset);
+        break;
+    }
+
+    return ret;
+}
+
+static void esdhci_write(void *opaque, hwaddr offset, uint64_t val,
+                         unsigned size)
+{
+    if (size != 4) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
+                      " <- 0x%08lx wrong size\n", size, offset, val);
+        return;
+    }
+
+    if (offset & 0x3) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
+                      " <- 0x%08lx unaligned\n", size, offset, val);
+        return;
+    }
+
+    switch (offset) {
+    case SDHC_SYSAD:
+    case SDHC_BLKSIZE:
+    case SDHC_ARGUMENT:
+    case SDHC_TRNMOD:
+    case SDHC_BDATA:
+    case SDHC_HOSTCTL:
+    case SDHC_CLKCON:
+    case SDHC_NORINTSTS:
+    case SDHC_NORINTSTSEN:
+    case SDHC_NORINTSIGEN:
+    case SDHC_FEAER:
+        sdhci_write(opaque, offset, val, size);
+        break;
+
+    case ESDHC_WML:
+    case ESDHC_DMA_SYSCTL:
+        qemu_log_mask(LOG_UNIMP, "ESDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0x%08lx "
+                      "not implemented\n", size, offset, val);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
+                      " <- 0x%08lx unknown offset\n", size, offset, val);
+        break;
+    }
+}
+
+static const MemoryRegionOps esdhc_mmio_ops = {
+    .read = esdhci_read,
+    .write = esdhci_write,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+        .unaligned = false
+    },
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void esdhci_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+    SDHCIState *s = SYSBUS_SDHCI(obj);
+
+    s->io_ops = &esdhc_mmio_ops;
+    s->io_registers_map_size = ESDHC_REGISTERS_MAP_SIZE;
+
+    /*
+     * Compatible with:
+     * - SD Host Controller Specification Version 2.0 Part A2
+     */
+    qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+}
+
+static const TypeInfo esdhc_info = {
+    .name = TYPE_FSL_ESDHC,
+    .parent = TYPE_SYSBUS_SDHCI,
+    .instance_init = esdhci_init,
+};
+
 /* --- qdev i.MX eSDHC --- */
 
 #define USDHC_MIX_CTRL                  0x48
@@ -1907,6 +2051,7 @@ static void sdhci_register_types(void)
 {
     type_register_static(&sdhci_sysbus_info);
     type_register_static(&sdhci_bus_info);
+    type_register_static(&esdhc_info);
     type_register_static(&imx_usdhc_info);
     type_register_static(&sdhci_s3c_info);
 }
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 01a64c5442..5b32e83eee 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -45,6 +45,7 @@ struct SDHCIState {
     AddressSpace *dma_as;
     MemoryRegion *dma_mr;
     const MemoryRegionOps *io_ops;
+    uint64_t io_registers_map_size;
 
     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
     QEMUTimer *transfer_timer;
@@ -122,6 +123,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
 DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
                          TYPE_SYSBUS_SDHCI)
 
+#define TYPE_FSL_ESDHC "fsl-esdhc"
+
 #define TYPE_IMX_USDHC "imx-usdhc"
 
 #define TYPE_S3C_SDHCI "s3c-sdhci"
-- 
2.37.3


