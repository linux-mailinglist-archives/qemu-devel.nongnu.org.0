Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E509A6CB648
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:49:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph2B5-0000u8-LP; Tue, 28 Mar 2023 01:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1ph2B0-0000qi-ER; Tue, 28 Mar 2023 01:47:22 -0400
Received: from m12.mail.163.com ([220.181.12.215])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1ph2Av-0005Eq-Aq; Tue, 28 Mar 2023 01:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gZ00j
 0RL6EPyiOjEg/gcT8mV4sWyhdEWLnycoYVAHvE=; b=Z57iPcl9AmoHY1f//C59x
 jFr6bFi+c1ZxSyqGXTwOFNCz0tQ7urNozvNQYTLHxGtQxGAn+/RhNHf6oZEMJtzQ
 KzrgT+SsFZbxUZ2ecT03hglYqyxGnXywTsdy+H2fGXlfonbL6z6NgmXu1U1t4CdG
 2YprOfJdLBKpvklOJcvzjs=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [112.224.194.92])
 by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wBHtBBOfyJkWfxRAg--.23168S9;
 Tue, 28 Mar 2023 13:47:04 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v2 07/12] hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
Date: Tue, 28 Mar 2023 13:46:47 +0800
Message-Id: <20230328054654.18620-8-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328054654.18620-1-qianfanguijin@163.com>
References: <20230328054654.18620-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHtBBOfyJkWfxRAg--.23168S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFWkCry7XFWrWF4kAr48Xrb_yoWxZrW5pF
 ZYkw45GF45Gan3Jr47tF1DKF1rGa4kCF4UKrn3uF97Ar1DG3WYqa1qgay5JF4DGFZ8CF4U
 Aan0qFy5uFsxtaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_NtInUUUUU=
X-Originating-IP: [112.224.194.92]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXBpA7VXl6EVDwQAAs0
Received-SPF: pass client-ip=220.181.12.215;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: qianfan Zhao <qianfanguijin@163.com>

A64's sd register was similar to H3, and it introduced a new register
named SAMP_DL_REG location at 0x144. The dma descriptor buffer size of
mmc2 is only 8K and the other mmc controllers has 64K.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/sd/allwinner-sdhost.c         | 70 ++++++++++++++++++++++++++++++--
 include/hw/sd/allwinner-sdhost.h |  9 ++++
 2 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 51e5e90830..38e7844399 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -77,6 +77,7 @@ enum {
     REG_SD_DATA1_CRC  = 0x12C, /* CRC Data 1 from card/eMMC */
     REG_SD_DATA0_CRC  = 0x130, /* CRC Data 0 from card/eMMC */
     REG_SD_CRC_STA    = 0x134, /* CRC status from card/eMMC during write */
+    REG_SD_SAMP_DL    = 0x144, /* Sample Delay Control (sun50i-a64) */
     REG_SD_FIFO       = 0x200, /* Read/Write FIFO */
 };
 
@@ -158,6 +159,7 @@ enum {
     REG_SD_RES_CRC_RST      = 0x0,
     REG_SD_DATA_CRC_RST     = 0x0,
     REG_SD_CRC_STA_RST      = 0x0,
+    REG_SD_SAMPLE_DL_RST    = 0x00002000,
     REG_SD_FIFO_RST         = 0x0,
 };
 
@@ -438,6 +440,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
 {
     AwSdHostState *s = AW_SDHOST(opaque);
     AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
+    bool out_of_bounds = false;
     uint32_t res = 0;
 
     switch (offset) {
@@ -556,13 +559,24 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
     case REG_SD_FIFO:      /* Read/Write FIFO */
         res = allwinner_sdhost_fifo_read(s);
         break;
+    case REG_SD_SAMP_DL: /* Sample Delay */
+        if (sc->can_calibrate) {
+            res = s->sample_delay;
+        } else {
+            out_of_bounds = true;
+        }
+        break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
-                      HWADDR_PRIx"\n", __func__, offset);
+        out_of_bounds = true;
         res = 0;
         break;
     }
 
+    if (out_of_bounds) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
+                      HWADDR_PRIx"\n", __func__, offset);
+    }
+
     trace_allwinner_sdhost_read(offset, res, size);
     return res;
 }
@@ -581,6 +595,7 @@ static void allwinner_sdhost_write(void *opaque, hwaddr offset,
 {
     AwSdHostState *s = AW_SDHOST(opaque);
     AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
+    bool out_of_bounds = false;
 
     trace_allwinner_sdhost_write(offset, value, size);
 
@@ -704,10 +719,21 @@ static void allwinner_sdhost_write(void *opaque, hwaddr offset,
     case REG_SD_DATA0_CRC: /* CRC Data 0 from card/eMMC */
     case REG_SD_CRC_STA:   /* CRC status from card/eMMC in write operation */
         break;
+    case REG_SD_SAMP_DL: /* Sample delay control */
+        if (sc->can_calibrate) {
+            s->sample_delay = value;
+        } else {
+            out_of_bounds = true;
+        }
+        break;
     default:
+        out_of_bounds = true;
+        break;
+    }
+
+    if (out_of_bounds) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
                       HWADDR_PRIx"\n", __func__, offset);
-        break;
     }
 }
 
@@ -756,6 +782,7 @@ static const VMStateDescription vmstate_allwinner_sdhost = {
         VMSTATE_UINT32(response_crc, AwSdHostState),
         VMSTATE_UINT32_ARRAY(data_crc, AwSdHostState, 8),
         VMSTATE_UINT32(status_crc, AwSdHostState),
+        VMSTATE_UINT32(sample_delay, AwSdHostState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -794,6 +821,7 @@ static void allwinner_sdhost_realize(DeviceState *dev, Error **errp)
 static void allwinner_sdhost_reset(DeviceState *dev)
 {
     AwSdHostState *s = AW_SDHOST(dev);
+    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
 
     s->global_ctl = REG_SD_GCTL_RST;
     s->clock_ctl = REG_SD_CKCR_RST;
@@ -834,6 +862,10 @@ static void allwinner_sdhost_reset(DeviceState *dev)
     }
 
     s->status_crc = REG_SD_CRC_STA_RST;
+
+    if (sc->can_calibrate) {
+        s->sample_delay = REG_SD_SAMPLE_DL_RST;
+    }
 }
 
 static void allwinner_sdhost_bus_class_init(ObjectClass *klass, void *data)
@@ -867,6 +899,24 @@ static void allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
     sc->is_sun4i = false;
 }
 
+static void allwinner_sdhost_sun50i_a64_class_init(ObjectClass *klass,
+                                                   void *data)
+{
+    AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
+    sc->max_desc_size = 64 * KiB;
+    sc->is_sun4i = false;
+    sc->can_calibrate = true;
+}
+
+static void allwinner_sdhost_sun50i_a64_emmc_class_init(ObjectClass *klass,
+                                                        void *data)
+{
+    AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
+    sc->max_desc_size = 8 * KiB;
+    sc->is_sun4i = false;
+    sc->can_calibrate = true;
+}
+
 static const TypeInfo allwinner_sdhost_info = {
     .name          = TYPE_AW_SDHOST,
     .parent        = TYPE_SYS_BUS_DEVICE,
@@ -889,6 +939,18 @@ static const TypeInfo allwinner_sdhost_sun5i_info = {
     .class_init    = allwinner_sdhost_sun5i_class_init,
 };
 
+static const TypeInfo allwinner_sdhost_sun50i_a64_info = {
+    .name          = TYPE_AW_SDHOST_SUN50I_A64,
+    .parent        = TYPE_AW_SDHOST,
+    .class_init    = allwinner_sdhost_sun50i_a64_class_init,
+};
+
+static const TypeInfo allwinner_sdhost_sun50i_a64_emmc_info = {
+    .name          = TYPE_AW_SDHOST_SUN50I_A64_EMMC,
+    .parent        = TYPE_AW_SDHOST,
+    .class_init    = allwinner_sdhost_sun50i_a64_emmc_class_init,
+};
+
 static const TypeInfo allwinner_sdhost_bus_info = {
     .name = TYPE_AW_SDHOST_BUS,
     .parent = TYPE_SD_BUS,
@@ -901,6 +963,8 @@ static void allwinner_sdhost_register_types(void)
     type_register_static(&allwinner_sdhost_info);
     type_register_static(&allwinner_sdhost_sun4i_info);
     type_register_static(&allwinner_sdhost_sun5i_info);
+    type_register_static(&allwinner_sdhost_sun50i_a64_info);
+    type_register_static(&allwinner_sdhost_sun50i_a64_emmc_info);
     type_register_static(&allwinner_sdhost_bus_info);
 }
 
diff --git a/include/hw/sd/allwinner-sdhost.h b/include/hw/sd/allwinner-sdhost.h
index 30c1e60404..1b951177dd 100644
--- a/include/hw/sd/allwinner-sdhost.h
+++ b/include/hw/sd/allwinner-sdhost.h
@@ -38,6 +38,12 @@
 /** Allwinner sun5i family and newer (A13, H2+, H3, etc) */
 #define TYPE_AW_SDHOST_SUN5I TYPE_AW_SDHOST "-sun5i"
 
+/** Allwinner sun50i-a64 */
+#define TYPE_AW_SDHOST_SUN50I_A64 TYPE_AW_SDHOST "-sun50i-a64"
+
+/** Allwinner sun50i-a64 emmc */
+#define TYPE_AW_SDHOST_SUN50I_A64_EMMC  TYPE_AW_SDHOST "-sun50i-a64-emmc"
+
 /** @} */
 
 /**
@@ -110,6 +116,7 @@ struct AwSdHostState {
     uint32_t startbit_detect;   /**< eMMC DDR Start Bit Detection Control */
     uint32_t response_crc;      /**< Response CRC */
     uint32_t data_crc[8];       /**< Data CRC */
+    uint32_t sample_delay;      /**< Sample delay control */
     uint32_t status_crc;        /**< Status CRC */
 
     /** @} */
@@ -132,6 +139,8 @@ struct AwSdHostClass {
     size_t max_desc_size;
     bool   is_sun4i;
 
+    /** does the IP block support autocalibration? */
+    bool can_calibrate;
 };
 
 #endif /* HW_SD_ALLWINNER_SDHOST_H */
-- 
2.25.1


