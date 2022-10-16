Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF675FFF40
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:43:35 +0200 (CEST)
Received: from localhost ([::1]:40574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok2zO-0001VP-5o
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2ky-0002hZ-UB; Sun, 16 Oct 2022 08:28:42 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kw-0000Ov-FO; Sun, 16 Oct 2022 08:28:40 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ot12so19485188ejb.1;
 Sun, 16 Oct 2022 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjMwr8cgXdmnl7qao2/HnRISq2gNWnT6j/SN7k814vg=;
 b=NfJsutzCcawqSgy6sp9sx4BncHauOevGyLJN6PppYmIg/Cy4NJ/uXZL6eRxcdEyafd
 xa2Q22GhaGyIBL9JN2GsEvv0bzfrxMLDA3PIwNIe758HCOY/t7iscO6hMEvGLtoim9y9
 L8e71qgTP7oiE4jc/aaZJcVczf4mKp+YVkiXKc7Y2yOmgfig5O1eYv+19WtMKcQmoM7m
 T35fv6eKMaJHKOL7xQUFJqsNVJV7Xeatw2nF5rTiKi3tW8abt7NLfrfsvE9isNTQVspc
 KIBMO6t0uPTTxu8c1ukpTPEXZI2Fcvr9O7hMFX8NhiZMMKxf/mfQGl62ITvwf9P4JvB4
 xG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjMwr8cgXdmnl7qao2/HnRISq2gNWnT6j/SN7k814vg=;
 b=pzbeefMRgzHUH0+RgO/tId4Jov0x7fWvcrTCGU3H25nGajLoVdxLKdEHzoEu6Wu3pE
 eopHuTTdirEUwj6FI7EjpaItRPyIdnBrAEQ4FjyIC95NUIRUNVJPbkf0Rh6Z4NZIY6NP
 egW2Kl7DQzJHn+6ruNCUQNi3dPDJFJ8gwMNK3XyvCRyBFwLtvpu5FvDrhWvLiFuAffac
 yJ88jbhfrDt8quTwAdVSP0KLtHQs08PCU/AKRIRDTV7eWJgmFmXCTvuReTaZtESb3HaI
 6c7/Sqq3EULC6JwJCIuXx4lm9zBtTMq6ASLWMVjq6+nxzeqJPEgMdjgbYle/VrgU4miG
 sMkA==
X-Gm-Message-State: ACrzQf2AbWAE+VYnw8nJWE/BBIcwSgwNfsGr31aCPokP6p1SWziJgDnl
 y8bly7HM+YAcONlUafUVXTyJEUSv5BY=
X-Google-Smtp-Source: AMsMyM4k35PRrtcohrqbwuDVnRU2MW2epTJBwRLkFdfspbVa81Sv8sJubzy2wDq/ak/eP8b7xcfTow==
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr5111302ejc.724.1665923316278; 
 Sun, 16 Oct 2022 05:28:36 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:35 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 8/9] hw/sd/sdhci: Implement Freescale eSDHC device model
Date: Sun, 16 Oct 2022 14:27:36 +0200
Message-Id: <20221016122737.93755-9-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will allow e500 boards to access SD cards using just their own devices.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sdhci.c         | 120 +++++++++++++++++++++++++++++++++++++++++-
 include/hw/sd/sdhci.h |   3 ++
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 306070c872..8d8ad9ff24 100644
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
@@ -1575,6 +1576,122 @@ static const TypeInfo sdhci_bus_info = {
     .class_init = sdhci_bus_class_init,
 };
 
+/* --- qdev Freescale eSDHC --- */
+
+/* Watermark Level Register */
+#define ESDHC_WML                    0x44
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
+        qemu_log_mask(LOG_UNIMP, "ESDHC rd @0x%02" HWADDR_PRIx
+                      " not implemented\n", offset);
+        break;
+
+    default:
+        ret = 0;
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd @0x%02" HWADDR_PRIx
+                      " unknown offset\n", offset);
+        break;
+    }
+
+    return ret;
+}
+
+static void esdhci_write(void *opaque, hwaddr offset, uint64_t val,
+                         unsigned size)
+{
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
+        qemu_log_mask(LOG_UNIMP, "ESDHC wr @0x%02" HWADDR_PRIx " <- 0x%08lx "
+                      "not implemented\n", offset, val);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr @0x%02" HWADDR_PRIx
+                      " <- 0x%08lx unknown offset\n", offset, val);
+        break;
+    }
+}
+
+static const MemoryRegionOps esdhc_mmio_ops = {
+    .read = esdhci_read,
+    .write = esdhci_write,
+    .valid = {
+        .min_access_size = 4,
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
@@ -1907,6 +2024,7 @@ static void sdhci_register_types(void)
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
2.38.0


