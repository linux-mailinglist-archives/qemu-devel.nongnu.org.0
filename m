Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C812F10F25D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 22:49:43 +0100 (CET)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibtZe-0003zu-Q6
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 16:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ibsxg-0002hs-Uy
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 16:10:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ibsxa-0000jx-6P
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 16:10:27 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1ibsxQ-0000b8-Pf; Mon, 02 Dec 2019 16:10:13 -0500
Received: by mail-wr1-x441.google.com with SMTP id b18so983379wrj.8;
 Mon, 02 Dec 2019 13:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YSSdKKG1i6JVSlPytRsAwGL4WTE2dxtGdKjtspalJFE=;
 b=L7ZszqUzkHcluseCQLaWzNFJkI+6teYGz8kuF4ZzyMxGNDrQjkB1q3yD4lB0aSz1t2
 4WgoAtsG1TqhLzlPY6scu4WFW5vve946/3lHfjOcecVoDicSS53/rs7DIXcFQbEW+smO
 HoGj+UsxG+J/smctlkiTJnmBHksNt9KsnixK4M34VWwG9hrCbW/UO8LoCofv+6iB2pGs
 fmUecTmhJf5HdwFMGVdat0iCixJRq6nlFChReialxQJmlf8prJJxVlJiqzqivWEKkBI8
 VWTkyLJb+olapWmqYemz1GpeTCJdfVrAN8Z9LT8BzMO6dfw7GDhUgJLLZCH47Cv7KOfw
 5XNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YSSdKKG1i6JVSlPytRsAwGL4WTE2dxtGdKjtspalJFE=;
 b=FUYpHTd04WBfPD0Tzcr5h10VBlV+I6VcmDPSgmnGvV2rmw7DEhA8Q8do2R98IE5K4c
 vdzhLsbKmOSlsNuTocWq96VCD6oojdDlZ5fIDm2NJITE8NcJIQmBmKc3uGu85T22yXjr
 y5mCmkk7SVc2jL4DALsN/a051GEVPlQzLnF/excNYXE+XjZxCelPq1nN3RfY+Dtkcccs
 8Zek+8Qmge7IvmAskSXT9Xkgrj0qWLJcLaPE5xmK5cmD1Dle+/QHrLaA+8Iiv2WjqPBQ
 +2Busx4fmHKuFx7fUVHHdGWcy2obLDmRlqODaG3LhMCarB5F/PgRUt19+C07TptPiAO2
 Oitg==
X-Gm-Message-State: APjAAAUIYTTcBSU9aMyCibpqxqdXHItBbH25brEIH2csRGgSHICmW9DL
 F0ml87b7K6lud4+9pj0zXIp15fQ4
X-Google-Smtp-Source: APXvYqwQkNFAKM4YhPm2hslVoloXVTCFDw47qe/cJqMSf2UxnufyFhxJppZZ3oE4wZQwnsa3gqhQ8g==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr1112264wro.310.1575321005843; 
 Mon, 02 Dec 2019 13:10:05 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id f1sm770859wrp.93.2019.12.02.13.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 13:10:05 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] arm: allwinner-h3: add EMAC ethernet device
Date: Mon,  2 Dec 2019 22:09:47 +0100
Message-Id: <20191202210947.3603-11-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202210947.3603-1-nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-Mailman-Approved-At: Mon, 02 Dec 2019 16:38:22 -0500
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Allwinner H3 System on Chip includes an Ethernet MAC (EMAC)
which provides 10M/100M/1000M Ethernet connectivity. This commit
adds support for the Allwinner H3 EMAC, including emulation for
the following functionality:

 * DMA transfers
 * MII interface
 * Transmit CRC calculation

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/arm/Kconfig                     |   1 +
 hw/arm/allwinner-h3.c              |  17 +
 hw/arm/orangepi.c                  |   7 +
 hw/net/Kconfig                     |   3 +
 hw/net/Makefile.objs               |   1 +
 hw/net/allwinner-h3-emac.c         | 786 +++++++++++++++++++++++++++++
 hw/net/trace-events                |  10 +
 include/hw/arm/allwinner-h3.h      |   2 +
 include/hw/net/allwinner-h3-emac.h |  69 +++
 9 files changed, 896 insertions(+)
 create mode 100644 hw/net/allwinner-h3-emac.c
 create mode 100644 include/hw/net/allwinner-h3-emac.h

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ebf8d2325f..551cff3442 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -294,6 +294,7 @@ config ALLWINNER_A10
 config ALLWINNER_H3
     bool
     select ALLWINNER_A10_PIT
+    select ALLWINNER_H3_EMAC
     select SERIAL
     select ARM_TIMER
     select ARM_GIC
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index c2972caf88..274b8548c0 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -53,6 +53,9 @@ static void aw_h3_init(Object *obj)
 
     sysbus_init_child_obj(obj, "mmc0", &s->mmc0, sizeof(s->mmc0),
                           TYPE_AW_H3_SDHOST);
+
+    sysbus_init_child_obj(obj, "emac", &s->emac, sizeof(s->emac),
+                          TYPE_AW_H3_EMAC);
 }
 
 static void aw_h3_realize(DeviceState *dev, Error **errp)
@@ -237,6 +240,20 @@ static void aw_h3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* EMAC */
+    if (nd_table[0].used) {
+        qemu_check_nic_model(&nd_table[0], TYPE_AW_H3_EMAC);
+        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
+    }
+    object_property_set_bool(OBJECT(&s->emac), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbusdev = SYS_BUS_DEVICE(&s->emac);
+    sysbus_mmio_map(sysbusdev, 0, AW_H3_EMAC_BASE);
+    sysbus_connect_irq(sysbusdev, 0, s->irq[AW_H3_GIC_SPI_EMAC]);
+
     /* Universal Serial Bus */
     sysbus_create_simple(TYPE_AW_H3_EHCI, AW_H3_EHCI0_BASE,
                          s->irq[AW_H3_GIC_SPI_EHCI0]);
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index dee3efaf08..8a61eb0e69 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -61,6 +61,13 @@ static void orangepi_init(MachineState *machine)
         exit(1);
     }
 
+    /* Setup EMAC properties */
+    object_property_set_int(OBJECT(&s->h3->emac), 1, "phy-addr", &err);
+    if (err != NULL) {
+        error_reportf_err(err, "Couldn't set phy address: ");
+        exit(1);
+    }
+
     /* Mark H3 object realized */
     object_property_set_bool(OBJECT(s->h3), true, "realized", &err);
     if (err != NULL) {
diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 3856417d42..36d3923992 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -74,6 +74,9 @@ config MIPSNET
 config ALLWINNER_EMAC
     bool
 
+config ALLWINNER_H3_EMAC
+    bool
+
 config IMX_FEC
     bool
 
diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
index 7907d2c199..5548deb07a 100644
--- a/hw/net/Makefile.objs
+++ b/hw/net/Makefile.objs
@@ -23,6 +23,7 @@ common-obj-$(CONFIG_XGMAC) += xgmac.o
 common-obj-$(CONFIG_MIPSNET) += mipsnet.o
 common-obj-$(CONFIG_XILINX_AXI) += xilinx_axienet.o
 common-obj-$(CONFIG_ALLWINNER_EMAC) += allwinner_emac.o
+common-obj-$(CONFIG_ALLWINNER_H3_EMAC) += allwinner-h3-emac.o
 common-obj-$(CONFIG_IMX_FEC) += imx_fec.o
 
 common-obj-$(CONFIG_CADENCE) += cadence_gem.o
diff --git a/hw/net/allwinner-h3-emac.c b/hw/net/allwinner-h3-emac.c
new file mode 100644
index 0000000000..37f6f44406
--- /dev/null
+++ b/hw/net/allwinner-h3-emac.c
@@ -0,0 +1,786 @@
+/*
+ * Allwinner H3 EMAC emulation
+ *
+ * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "net/net.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "net/checksum.h"
+#include "qemu/module.h"
+#include "exec/cpu-common.h"
+#include "hw/net/allwinner-h3-emac.h"
+
+/* EMAC register offsets */
+#define REG_BASIC_CTL_0        (0x0000) /* Basic Control 0 */
+#define REG_BASIC_CTL_1        (0x0004) /* Basic Control 1 */
+#define REG_INT_STA            (0x0008) /* Interrupt Status */
+#define REG_INT_EN             (0x000C) /* Interrupt Enable */
+#define REG_TX_CTL_0           (0x0010) /* Transmit Control 0 */
+#define REG_TX_CTL_1           (0x0014) /* Transmit Control 1 */
+#define REG_TX_FLOW_CTL        (0x001C) /* Transmit Flow Control */
+#define REG_TX_DMA_DESC_LIST   (0x0020) /* Transmit Descriptor List Address */
+#define REG_RX_CTL_0           (0x0024) /* Receive Control 0 */
+#define REG_RX_CTL_1           (0x0028) /* Receive Control 1 */
+#define REG_RX_DMA_DESC_LIST   (0x0034) /* Receive Descriptor List Address */
+#define REG_FRM_FLT            (0x0038) /* Receive Frame Filter */
+#define REG_RX_HASH_0          (0x0040) /* Receive Hash Table 0 */
+#define REG_RX_HASH_1          (0x0044) /* Receive Hash Table 1 */
+#define REG_MII_CMD            (0x0048) /* Management Interface Command */
+#define REG_MII_DATA           (0x004C) /* Management Interface Data */
+#define REG_ADDR_HIGH          (0x0050) /* MAC Address High */
+#define REG_ADDR_LOW           (0x0054) /* MAC Address Low */
+#define REG_TX_DMA_STA         (0x00B0) /* Transmit DMA Status */
+#define REG_TX_CUR_DESC        (0x00B4) /* Transmit Current Descriptor */
+#define REG_TX_CUR_BUF         (0x00B8) /* Transmit Current Buffer */
+#define REG_RX_DMA_STA         (0x00C0) /* Receive DMA Status */
+#define REG_RX_CUR_DESC        (0x00C4) /* Receive Current Descriptor */
+#define REG_RX_CUR_BUF         (0x00C8) /* Receive Current Buffer */
+#define REG_RGMII_STA          (0x00D0) /* RGMII Status */
+
+/* EMAC register flags */
+#define BASIC_CTL0_100Mbps     (0b11 << 2)
+#define BASIC_CTL0_FD          (1 << 0)
+#define BASIC_CTL1_SOFTRST     (1 << 0)
+
+#define INT_STA_RGMII_LINK     (1 << 16)
+#define INT_STA_RX_EARLY       (1 << 13)
+#define INT_STA_RX_OVERFLOW    (1 << 12)
+#define INT_STA_RX_TIMEOUT     (1 << 11)
+#define INT_STA_RX_DMA_STOP    (1 << 10)
+#define INT_STA_RX_BUF_UA      (1 << 9)
+#define INT_STA_RX             (1 << 8)
+#define INT_STA_TX_EARLY       (1 << 5)
+#define INT_STA_TX_UNDERFLOW   (1 << 4)
+#define INT_STA_TX_TIMEOUT     (1 << 3)
+#define INT_STA_TX_BUF_UA      (1 << 2)
+#define INT_STA_TX_DMA_STOP    (1 << 1)
+#define INT_STA_TX             (1 << 0)
+
+#define INT_EN_RX_EARLY        (1 << 13)
+#define INT_EN_RX_OVERFLOW     (1 << 12)
+#define INT_EN_RX_TIMEOUT      (1 << 11)
+#define INT_EN_RX_DMA_STOP     (1 << 10)
+#define INT_EN_RX_BUF_UA       (1 << 9)
+#define INT_EN_RX              (1 << 8)
+#define INT_EN_TX_EARLY        (1 << 5)
+#define INT_EN_TX_UNDERFLOW    (1 << 4)
+#define INT_EN_TX_TIMEOUT      (1 << 3)
+#define INT_EN_TX_BUF_UA       (1 << 2)
+#define INT_EN_TX_DMA_STOP     (1 << 1)
+#define INT_EN_TX              (1 << 0)
+
+#define TX_CTL0_TX_EN          (1 << 31)
+#define TX_CTL1_TX_DMA_START   (1 << 31)
+#define TX_CTL1_TX_DMA_EN      (1 << 30)
+#define TX_CTL1_TX_FLUSH       (1 << 0)
+
+#define RX_CTL0_RX_EN          (1 << 31)
+#define RX_CTL0_STRIP_FCS      (1 << 28)
+#define RX_CTL0_CRC_IPV4       (1 << 27)
+
+#define RX_CTL1_RX_DMA_START   (1 << 31)
+#define RX_CTL1_RX_DMA_EN      (1 << 30)
+#define RX_CTL1_RX_MD          (1 << 1)
+
+#define RX_FRM_FLT_DIS_ADDR    (1 << 31)
+
+#define MII_CMD_PHY_ADDR_SHIFT (12)
+#define MII_CMD_PHY_ADDR_MASK  (0xf000)
+#define MII_CMD_PHY_REG_SHIFT  (4)
+#define MII_CMD_PHY_REG_MASK   (0xf0)
+#define MII_CMD_PHY_RW         (1 << 1)
+#define MII_CMD_PHY_BUSY       (1 << 0)
+
+#define TX_DMA_STA_STOP        (0b000)
+#define TX_DMA_STA_RUN_FETCH   (0b001)
+#define TX_DMA_STA_WAIT_STA    (0b010)
+
+#define RX_DMA_STA_STOP        (0b000)
+#define RX_DMA_STA_RUN_FETCH   (0b001)
+#define RX_DMA_STA_WAIT_FRM    (0b011)
+
+#define RGMII_LINK_UP          (1 << 3)
+#define RGMII_FD               (1 << 0)
+
+/* EMAC register reset values */
+#define REG_BASIC_CTL_1_RST    (0x08000000)
+
+/* EMAC constants */
+#define AW_H3_EMAC_MIN_PKT_SZ  (64)
+
+/* Transmit/receive frame descriptor */
+typedef struct FrameDescriptor {
+    uint32_t status;
+    uint32_t status2;
+    uint32_t addr;
+    uint32_t next;
+} FrameDescriptor;
+
+/* Frame descriptor flags */
+#define DESC_STATUS_CTL                 (1 << 31)
+#define DESC_STATUS2_BUF_SIZE_MASK      (0x7ff)
+
+/* Transmit frame descriptor flags */
+#define TX_DESC_STATUS_LENGTH_ERR       (1 << 14)
+#define TX_DESC_STATUS2_FIRST_DESC      (1 << 29)
+#define TX_DESC_STATUS2_LAST_DESC       (1 << 30)
+#define TX_DESC_STATUS2_CHECKSUM_MASK   (0x3 << 27)
+
+/* Receive frame descriptor flags */
+#define RX_DESC_STATUS_FIRST_DESC       (1 << 9)
+#define RX_DESC_STATUS_LAST_DESC        (1 << 8)
+#define RX_DESC_STATUS_FRM_LEN_MASK     (0x3fff0000)
+#define RX_DESC_STATUS_FRM_LEN_SHIFT    (16)
+#define RX_DESC_STATUS_NO_BUF           (1 << 14)
+#define RX_DESC_STATUS_HEADER_ERR       (1 << 7)
+#define RX_DESC_STATUS_LENGTH_ERR       (1 << 4)
+#define RX_DESC_STATUS_CRC_ERR          (1 << 1)
+#define RX_DESC_STATUS_PAYLOAD_ERR      (1 << 0)
+#define RX_DESC_STATUS2_RX_INT_CTL      (1 << 31)
+
+/* MII register offsets */
+#define MII_REG_CR                      (0x0)
+#define MII_REG_ST                      (0x1)
+#define MII_REG_ID_HIGH                 (0x2)
+#define MII_REG_ID_LOW                  (0x3)
+
+/* MII register flags */
+#define MII_REG_CR_RESET                (1 << 15)
+#define MII_REG_CR_POWERDOWN            (1 << 11)
+#define MII_REG_CR_10Mbit               (0)
+#define MII_REG_CR_100Mbit              (1 << 13)
+#define MII_REG_CR_1000Mbit             (1 << 6)
+#define MII_REG_CR_AUTO_NEG             (1 << 12)
+#define MII_REG_CR_AUTO_NEG_RESTART     (1 << 9)
+#define MII_REG_CR_FULLDUPLEX           (1 << 8)
+
+#define MII_REG_ST_100BASE_T4           (1 << 15)
+#define MII_REG_ST_100BASE_X_FD         (1 << 14)
+#define MII_REG_ST_100BASE_X_HD         (1 << 13)
+#define MII_REG_ST_10_FD                (1 << 12)
+#define MII_REG_ST_10_HD                (1 << 11)
+#define MII_REG_ST_100BASE_T2_FD        (1 << 10)
+#define MII_REG_ST_100BASE_T2_HD        (1 << 9)
+#define MII_REG_ST_AUTONEG_COMPLETE     (1 << 5)
+#define MII_REG_ST_AUTONEG_AVAIL        (1 << 3)
+#define MII_REG_ST_LINK_UP              (1 << 2)
+
+/* MII constants */
+#define MII_PHY_ID_HIGH                 (0x0044)
+#define MII_PHY_ID_LOW                  (0x1400)
+
+static void aw_h3_emac_mii_set_link(AwH3EmacState *s, bool link_active)
+{
+    if (link_active) {
+        s->mii_st |= MII_REG_ST_LINK_UP;
+    } else {
+        s->mii_st &= ~MII_REG_ST_LINK_UP;
+    }
+}
+
+static void aw_h3_emac_mii_reset(AwH3EmacState *s, bool link_active)
+{
+    s->mii_cr = MII_REG_CR_100Mbit | MII_REG_CR_AUTO_NEG |
+                MII_REG_CR_FULLDUPLEX;
+    s->mii_st = MII_REG_ST_100BASE_T4 | MII_REG_ST_100BASE_X_FD |
+                MII_REG_ST_100BASE_X_HD | MII_REG_ST_10_FD | MII_REG_ST_10_HD |
+                MII_REG_ST_100BASE_T2_FD | MII_REG_ST_100BASE_T2_HD |
+                MII_REG_ST_AUTONEG_COMPLETE | MII_REG_ST_AUTONEG_AVAIL;
+
+    aw_h3_emac_mii_set_link(s, link_active);
+}
+
+static void aw_h3_emac_mii_cmd(AwH3EmacState *s)
+{
+    uint8_t addr, reg;
+
+    addr = (s->mii_cmd & MII_CMD_PHY_ADDR_MASK) >> MII_CMD_PHY_ADDR_SHIFT;
+    reg = (s->mii_cmd & MII_CMD_PHY_REG_MASK) >> MII_CMD_PHY_REG_SHIFT;
+
+    if (addr != s->mii_phy_addr) {
+        return;
+    }
+
+    /* Read or write a PHY register? */
+    if (s->mii_cmd & MII_CMD_PHY_RW) {
+        trace_aw_h3_emac_mii_write_reg(reg, s->mii_data);
+
+        switch (reg) {
+        case MII_REG_CR:
+            if (s->mii_data & MII_REG_CR_RESET) {
+                aw_h3_emac_mii_reset(s, s->mii_st & MII_REG_ST_LINK_UP);
+            } else {
+                s->mii_cr = s->mii_data & ~(MII_REG_CR_RESET |
+                                            MII_REG_CR_AUTO_NEG_RESTART);
+            }
+            break;
+        default:
+            qemu_log_mask(LOG_UNIMP, "allwinner-h3-emac: write access to "
+                                     "unknown MII register 0x%x\n", reg);
+            break;
+        }
+    } else {
+        switch (reg) {
+        case MII_REG_CR:
+            s->mii_data = s->mii_cr;
+            break;
+        case MII_REG_ST:
+            s->mii_data = s->mii_st;
+            break;
+        case MII_REG_ID_HIGH:
+            s->mii_data = MII_PHY_ID_HIGH;
+            break;
+        case MII_REG_ID_LOW:
+            s->mii_data = MII_PHY_ID_LOW;
+            break;
+        default:
+            qemu_log_mask(LOG_UNIMP, "allwinner-h3-emac: read access to "
+                                     "unknown MII register 0x%x\n", reg);
+            s->mii_data = 0;
+            break;
+        }
+
+        trace_aw_h3_emac_mii_read_reg(reg, s->mii_data);
+    }
+}
+
+static void aw_h3_emac_update_irq(AwH3EmacState *s)
+{
+    qemu_set_irq(s->irq, (s->int_sta & s->int_en) != 0);
+}
+
+static uint32_t aw_h3_emac_next_desc(FrameDescriptor *desc, size_t min_size)
+{
+    uint32_t paddr = desc->next;
+
+    cpu_physical_memory_read(paddr, desc, sizeof(*desc));
+
+    if ((desc->status & DESC_STATUS_CTL) &&
+        (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
+        return paddr;
+    } else {
+        return 0;
+    }
+}
+
+static uint32_t aw_h3_emac_get_desc(FrameDescriptor *desc, uint32_t start_addr,
+                                    size_t min_size)
+{
+    uint32_t desc_addr = start_addr;
+
+    /* Note that the list is a cycle. Last entry points back to the head. */
+    while (desc_addr != 0) {
+        cpu_physical_memory_read(desc_addr, desc, sizeof(*desc));
+
+        if ((desc->status & DESC_STATUS_CTL) &&
+            (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
+            return desc_addr;
+        } else if (desc->next == start_addr) {
+            break;
+        } else {
+            desc_addr = desc->next;
+        }
+    }
+
+    return 0;
+}
+
+static uint32_t aw_h3_emac_get_rx_desc(AwH3EmacState *s, FrameDescriptor *desc,
+                                       size_t min_size)
+{
+    return aw_h3_emac_get_desc(desc, s->rx_desc_curr, min_size);
+}
+
+static uint32_t aw_h3_emac_get_tx_desc(AwH3EmacState *s, FrameDescriptor *desc,
+                                       size_t min_size)
+{
+    return aw_h3_emac_get_desc(desc, s->tx_desc_head, min_size);
+}
+
+static void aw_h3_emac_flush_desc(FrameDescriptor *desc, uint32_t phys_addr)
+{
+    cpu_physical_memory_write(phys_addr, desc, sizeof(*desc));
+}
+
+static int aw_h3_emac_can_receive(NetClientState *nc)
+{
+    AwH3EmacState *s = qemu_get_nic_opaque(nc);
+    FrameDescriptor desc;
+
+    return (s->rx_ctl0 & RX_CTL0_RX_EN) &&
+           (aw_h3_emac_get_rx_desc(s, &desc, 0) != 0);
+}
+
+static ssize_t aw_h3_emac_receive(NetClientState *nc, const uint8_t *buf,
+                                  size_t size)
+{
+    AwH3EmacState *s = qemu_get_nic_opaque(nc);
+    FrameDescriptor desc;
+    size_t bytes_left = size;
+    size_t desc_bytes = 0;
+    size_t pad_fcs_size = 4;
+    size_t padding = 0;
+
+    if (!(s->rx_ctl0 & RX_CTL0_RX_EN)) {
+        return -1;
+    }
+
+    s->rx_desc_curr = aw_h3_emac_get_rx_desc(s, &desc, AW_H3_EMAC_MIN_PKT_SZ);
+    if (!s->rx_desc_curr) {
+        s->int_sta |= INT_STA_RX_BUF_UA;
+    }
+
+    /* Keep filling RX descriptors until the whole frame is written */
+    while (s->rx_desc_curr && bytes_left > 0) {
+        desc.status &= ~DESC_STATUS_CTL;
+        desc.status &= ~RX_DESC_STATUS_FRM_LEN_MASK;
+
+        if (bytes_left == size) {
+            desc.status |= RX_DESC_STATUS_FIRST_DESC;
+        }
+
+        if ((desc.status2 & DESC_STATUS2_BUF_SIZE_MASK) <
+            (bytes_left + pad_fcs_size)) {
+            desc_bytes = desc.status2 & DESC_STATUS2_BUF_SIZE_MASK;
+            desc.status |= desc_bytes << RX_DESC_STATUS_FRM_LEN_SHIFT;
+        } else {
+            padding = pad_fcs_size;
+            if (bytes_left < AW_H3_EMAC_MIN_PKT_SZ) {
+                padding += (AW_H3_EMAC_MIN_PKT_SZ - bytes_left);
+            }
+
+            desc_bytes = (bytes_left);
+            desc.status |= RX_DESC_STATUS_LAST_DESC;
+            desc.status |= (bytes_left + padding)
+                            << RX_DESC_STATUS_FRM_LEN_SHIFT;
+        }
+
+        cpu_physical_memory_write(desc.addr, buf, desc_bytes);
+        aw_h3_emac_flush_desc(&desc, s->rx_desc_curr);
+        trace_aw_h3_emac_receive(s->rx_desc_curr, desc.addr, desc_bytes);
+
+        /* Check if frame needs to raise the receive interrupt */
+        if (!(desc.status2 & RX_DESC_STATUS2_RX_INT_CTL)) {
+            s->int_sta |= INT_STA_RX;
+        }
+
+        /* Increment variables */
+        buf += desc_bytes;
+        bytes_left -= desc_bytes;
+
+        /* Move to the next descriptor */
+        s->rx_desc_curr = aw_h3_emac_next_desc(&desc, 64);
+        if (!s->rx_desc_curr) {
+            /* Not enough buffer space available */
+            s->int_sta |= INT_STA_RX_BUF_UA;
+            s->rx_desc_curr = s->rx_desc_head;
+            break;
+        }
+    }
+
+    /* Report receive DMA is finished */
+    s->rx_ctl1 &= ~RX_CTL1_RX_DMA_START;
+    aw_h3_emac_update_irq(s);
+
+    return size;
+}
+
+static void aw_h3_emac_transmit(AwH3EmacState *s)
+{
+    NetClientState *nc = qemu_get_queue(s->nic);
+    FrameDescriptor desc;
+    size_t bytes = 0;
+    size_t packet_bytes = 0;
+    size_t transmitted = 0;
+    static uint8_t packet_buf[2048];
+
+    s->tx_desc_curr = aw_h3_emac_get_tx_desc(s, &desc, 0);
+
+    /* Read all transmit descriptors */
+    while (s->tx_desc_curr != 0) {
+
+        /* Read from physical memory into packet buffer */
+        bytes = desc.status2 & DESC_STATUS2_BUF_SIZE_MASK;
+        if (bytes + packet_bytes > sizeof(packet_buf)) {
+            desc.status |= TX_DESC_STATUS_LENGTH_ERR;
+            break;
+        }
+        cpu_physical_memory_read(desc.addr, packet_buf + packet_bytes, bytes);
+        packet_bytes += bytes;
+        desc.status &= ~DESC_STATUS_CTL;
+        aw_h3_emac_flush_desc(&desc, s->tx_desc_curr);
+
+        /* After the last descriptor, send the packet */
+        if (desc.status2 & TX_DESC_STATUS2_LAST_DESC) {
+            if (desc.status2 & TX_DESC_STATUS2_CHECKSUM_MASK) {
+                net_checksum_calculate(packet_buf, packet_bytes);
+            }
+
+            qemu_send_packet(nc, packet_buf, packet_bytes);
+            trace_aw_h3_emac_transmit(s->tx_desc_curr, desc.addr, bytes);
+
+            packet_bytes = 0;
+            transmitted++;
+        }
+        s->tx_desc_curr = aw_h3_emac_next_desc(&desc, 0);
+    }
+
+    /* Raise transmit completed interrupt */
+    if (transmitted > 0) {
+        s->int_sta |= INT_STA_TX;
+        s->tx_ctl1 &= ~TX_CTL1_TX_DMA_START;
+        aw_h3_emac_update_irq(s);
+    }
+}
+
+static void aw_h3_emac_reset(DeviceState *dev)
+{
+    AwH3EmacState *s = AW_H3_EMAC(dev);
+    NetClientState *nc = qemu_get_queue(s->nic);
+
+    trace_aw_h3_emac_reset();
+
+    s->mii_cmd = 0;
+    s->mii_data = 0;
+    s->basic_ctl0 = 0;
+    s->basic_ctl1 = 0;
+    s->int_en = 0;
+    s->int_sta = 0;
+    s->frm_flt = 0;
+    s->rx_ctl0 = 0;
+    s->rx_ctl1 = RX_CTL1_RX_MD;
+    s->rx_desc_head = 0;
+    s->rx_desc_curr = 0;
+    s->tx_ctl0 = 0;
+    s->tx_ctl1 = 0;
+    s->tx_desc_head = 0;
+    s->tx_desc_curr = 0;
+    s->tx_flowctl = 0;
+
+    aw_h3_emac_mii_reset(s, !nc->link_down);
+}
+
+static uint64_t aw_h3_emac_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AwH3EmacState *s = opaque;
+    uint64_t value = 0;
+    FrameDescriptor desc;
+
+    switch (offset) {
+    case REG_BASIC_CTL_0:       /* Basic Control 0 */
+        value = s->basic_ctl0;
+        break;
+    case REG_BASIC_CTL_1:       /* Basic Control 1 */
+        value = s->basic_ctl1;
+        break;
+    case REG_INT_STA:           /* Interrupt Status */
+        value = s->int_sta;
+        break;
+    case REG_INT_EN:            /* Interupt Enable */
+        value = s->int_en;
+        break;
+    case REG_TX_CTL_0:          /* Transmit Control 0 */
+        value = s->tx_ctl0;
+        break;
+    case REG_TX_CTL_1:          /* Transmit Control 1 */
+        value = s->tx_ctl1;
+        break;
+    case REG_TX_FLOW_CTL:       /* Transmit Flow Control */
+        value = s->tx_flowctl;
+        break;
+    case REG_TX_DMA_DESC_LIST:  /* Transmit Descriptor List Address */
+        value = s->tx_desc_head;
+        break;
+    case REG_RX_CTL_0:          /* Receive Control 0 */
+        value = s->rx_ctl0;
+        break;
+    case REG_RX_CTL_1:          /* Receive Control 1 */
+        value = s->rx_ctl1;
+        break;
+    case REG_RX_DMA_DESC_LIST:  /* Receive Descriptor List Address */
+        value = s->rx_desc_head;
+        break;
+    case REG_FRM_FLT:           /* Receive Frame Filter */
+        value = s->frm_flt;
+        break;
+    case REG_RX_HASH_0:         /* Receive Hash Table 0 */
+    case REG_RX_HASH_1:         /* Receive Hash Table 1 */
+        break;
+    case REG_MII_CMD:           /* Management Interface Command */
+        value = s->mii_cmd;
+        break;
+    case REG_MII_DATA:          /* Management Interface Data */
+        value = s->mii_data;
+        break;
+    case REG_ADDR_HIGH:         /* MAC Address High */
+        value = *(((uint32_t *) (s->conf.macaddr.a)) + 1);
+        break;
+    case REG_ADDR_LOW:          /* MAC Address Low */
+        value = *(uint32_t *) (s->conf.macaddr.a);
+        break;
+    case REG_TX_DMA_STA:        /* Transmit DMA Status */
+        break;
+    case REG_TX_CUR_DESC:       /* Transmit Current Descriptor */
+        value = s->tx_desc_curr;
+        break;
+    case REG_TX_CUR_BUF:        /* Transmit Current Buffer */
+        if (s->tx_desc_curr != 0) {
+            cpu_physical_memory_read(s->tx_desc_curr, &desc, sizeof(desc));
+            value = desc.addr;
+        } else {
+            value = 0;
+        }
+        break;
+    case REG_RX_DMA_STA:        /* Receive DMA Status */
+        break;
+    case REG_RX_CUR_DESC:       /* Receive Current Descriptor */
+        value = s->rx_desc_curr;
+        break;
+    case REG_RX_CUR_BUF:        /* Receive Current Buffer */
+        if (s->rx_desc_curr != 0) {
+            cpu_physical_memory_read(s->rx_desc_curr, &desc, sizeof(desc));
+            value = desc.addr;
+        } else {
+            value = 0;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "allwinner-h3-emac: read access to unknown "
+                                 "EMAC register 0x" TARGET_FMT_plx "\n",
+                                  offset);
+    }
+
+    trace_aw_h3_emac_read(offset, value);
+    return value;
+}
+
+static void aw_h3_emac_write(void *opaque, hwaddr offset, uint64_t value,
+                             unsigned size)
+{
+    AwH3EmacState *s = opaque;
+    NetClientState *nc = qemu_get_queue(s->nic);
+
+    trace_aw_h3_emac_write(offset, value);
+
+    switch (offset) {
+    case REG_BASIC_CTL_0:       /* Basic Control 0 */
+        s->basic_ctl0 = value;
+        break;
+    case REG_BASIC_CTL_1:       /* Basic Control 1 */
+        if (value & BASIC_CTL1_SOFTRST) {
+            aw_h3_emac_reset(DEVICE(s));
+            value &= ~BASIC_CTL1_SOFTRST;
+        }
+        s->basic_ctl1 = value;
+        if (aw_h3_emac_can_receive(nc)) {
+            qemu_flush_queued_packets(nc);
+        }
+        break;
+    case REG_INT_STA:           /* Interrupt Status */
+        s->int_sta &= ~value;
+        aw_h3_emac_update_irq(s);
+        break;
+    case REG_INT_EN:            /* Interrupt Enable */
+        s->int_en = value;
+        aw_h3_emac_update_irq(s);
+        break;
+    case REG_TX_CTL_0:          /* Transmit Control 0 */
+        s->tx_ctl0 = value;
+        break;
+    case REG_TX_CTL_1:          /* Transmit Control 1 */
+        s->tx_ctl1 = value;
+        if (value & TX_CTL1_TX_DMA_EN) {
+            aw_h3_emac_transmit(s);
+        }
+        break;
+    case REG_TX_FLOW_CTL:       /* Transmit Flow Control */
+        s->tx_flowctl = value;
+        break;
+    case REG_TX_DMA_DESC_LIST:  /* Transmit Descriptor List Address */
+        s->tx_desc_head = value;
+        s->tx_desc_curr = value;
+        break;
+    case REG_RX_CTL_0:          /* Receive Control 0 */
+        s->rx_ctl0 = value;
+        break;
+    case REG_RX_CTL_1:          /* Receive Control 1 */
+        s->rx_ctl1 = value | RX_CTL1_RX_MD;
+        if ((value & RX_CTL1_RX_DMA_EN) && aw_h3_emac_can_receive(nc)) {
+            qemu_flush_queued_packets(nc);
+        }
+        break;
+    case REG_RX_DMA_DESC_LIST:  /* Receive Descriptor List Address */
+        s->rx_desc_head = value;
+        s->rx_desc_curr = value;
+        break;
+    case REG_FRM_FLT:           /* Receive Frame Filter */
+        s->frm_flt = value;
+        break;
+    case REG_RX_HASH_0:         /* Receive Hash Table 0 */
+    case REG_RX_HASH_1:         /* Receive Hash Table 1 */
+        break;
+    case REG_MII_CMD:           /* Management Interface Command */
+        s->mii_cmd = value & ~MII_CMD_PHY_BUSY;
+        aw_h3_emac_mii_cmd(s);
+        break;
+    case REG_MII_DATA:          /* Management Interface Data */
+        s->mii_data = value;
+        break;
+    case REG_ADDR_HIGH:         /* MAC Address High */
+        s->conf.macaddr.a[4] = (value & 0xff);
+        s->conf.macaddr.a[5] = (value & 0xff00) >> 8;
+        break;
+    case REG_ADDR_LOW:          /* MAC Address Low */
+        s->conf.macaddr.a[0] = (value & 0xff);
+        s->conf.macaddr.a[1] = (value & 0xff00) >> 8;
+        s->conf.macaddr.a[2] = (value & 0xff0000) >> 16;
+        s->conf.macaddr.a[3] = (value & 0xff000000) >> 24;
+        break;
+    case REG_TX_DMA_STA:        /* Transmit DMA Status */
+    case REG_TX_CUR_DESC:       /* Transmit Current Descriptor */
+    case REG_TX_CUR_BUF:        /* Transmit Current Buffer */
+    case REG_RX_DMA_STA:        /* Receive DMA Status */
+    case REG_RX_CUR_DESC:       /* Receive Current Descriptor */
+    case REG_RX_CUR_BUF:        /* Receive Current Buffer */
+    case REG_RGMII_STA:         /* RGMII Status */
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "allwinner-h3-emac: write access to unknown "
+                                 "EMAC register 0x" TARGET_FMT_plx "\n",
+                                  offset);
+    }
+}
+
+static void aw_h3_emac_set_link(NetClientState *nc)
+{
+    AwH3EmacState *s = qemu_get_nic_opaque(nc);
+
+    trace_aw_h3_emac_set_link(!nc->link_down);
+    aw_h3_emac_mii_set_link(s, !nc->link_down);
+}
+
+static const MemoryRegionOps aw_h3_emac_mem_ops = {
+    .read = aw_h3_emac_read,
+    .write = aw_h3_emac_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static NetClientInfo net_aw_h3_emac_info = {
+    .type = NET_CLIENT_DRIVER_NIC,
+    .size = sizeof(NICState),
+    .can_receive = aw_h3_emac_can_receive,
+    .receive = aw_h3_emac_receive,
+    .link_status_changed = aw_h3_emac_set_link,
+};
+
+static void aw_h3_emac_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwH3EmacState *s = AW_H3_EMAC(obj);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aw_h3_emac_mem_ops, s,
+                          TYPE_AW_H3_EMAC, AW_H3_EMAC_REGS_MEM_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void aw_h3_emac_realize(DeviceState *dev, Error **errp)
+{
+    AwH3EmacState *s = AW_H3_EMAC(dev);
+
+    qemu_macaddr_default_if_unset(&s->conf.macaddr);
+    s->nic = qemu_new_nic(&net_aw_h3_emac_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), dev->id, s);
+    qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
+}
+
+static Property aw_h3_emac_properties[] = {
+    DEFINE_NIC_PROPERTIES(AwH3EmacState, conf),
+    DEFINE_PROP_UINT8("phy-addr", AwH3EmacState, mii_phy_addr, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static int aw_h3_emac_post_load(void *opaque, int version_id)
+{
+    AwH3EmacState *s = opaque;
+
+    aw_h3_emac_set_link(qemu_get_queue(s->nic));
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_aw_emac = {
+    .name = TYPE_AW_H3_EMAC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = aw_h3_emac_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(mii_phy_addr, AwH3EmacState),
+        VMSTATE_UINT32(mii_cmd, AwH3EmacState),
+        VMSTATE_UINT32(mii_data, AwH3EmacState),
+        VMSTATE_UINT32(basic_ctl0, AwH3EmacState),
+        VMSTATE_UINT32(basic_ctl1, AwH3EmacState),
+        VMSTATE_UINT32(int_en, AwH3EmacState),
+        VMSTATE_UINT32(int_sta, AwH3EmacState),
+        VMSTATE_UINT32(frm_flt, AwH3EmacState),
+        VMSTATE_UINT32(rx_ctl0, AwH3EmacState),
+        VMSTATE_UINT32(rx_ctl1, AwH3EmacState),
+        VMSTATE_UINT32(rx_desc_head, AwH3EmacState),
+        VMSTATE_UINT32(rx_desc_curr, AwH3EmacState),
+        VMSTATE_UINT32(tx_ctl0, AwH3EmacState),
+        VMSTATE_UINT32(tx_ctl1, AwH3EmacState),
+        VMSTATE_UINT32(tx_desc_head, AwH3EmacState),
+        VMSTATE_UINT32(tx_desc_curr, AwH3EmacState),
+        VMSTATE_UINT32(tx_flowctl, AwH3EmacState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aw_h3_emac_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aw_h3_emac_realize;
+    dc->props = aw_h3_emac_properties;
+    dc->reset = aw_h3_emac_reset;
+    dc->vmsd = &vmstate_aw_emac;
+}
+
+static const TypeInfo aw_h3_emac_info = {
+    .name           = TYPE_AW_H3_EMAC,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AwH3EmacState),
+    .instance_init  = aw_h3_emac_init,
+    .class_init     = aw_h3_emac_class_init,
+};
+
+static void aw_h3_emac_register_types(void)
+{
+    type_register_static(&aw_h3_emac_info);
+}
+
+type_init(aw_h3_emac_register_types)
diff --git a/hw/net/trace-events b/hw/net/trace-events
index e70f12bee1..e9e2f26f68 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -1,5 +1,15 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# allwinner-h3-emac.c
+aw_h3_emac_mii_write_reg(uint32_t reg, uint32_t value) "MII write: reg=0x%x value=0x%x"
+aw_h3_emac_mii_read_reg(uint32_t reg, uint32_t value) "MII read: reg=0x%x value=0x%x"
+aw_h3_emac_receive(uint32_t desc, uint32_t paddr, uint32_t bytes) "RX packet: desc=0x%08x paddr=0x%08x bytes=%u"
+aw_h3_emac_transmit(uint32_t desc, uint32_t paddr, uint32_t bytes) "TX packet: desc=0x%08x paddr=0x%08x bytes=%u"
+aw_h3_emac_reset(void) "HW reset"
+aw_h3_emac_set_link(bool active) "Set link: active=%u"
+aw_h3_emac_read(uint64_t offset, uint64_t val) "MMIO read: offset=0x%" PRIx64 " value=0x%" PRIx64
+aw_h3_emac_write(uint64_t offset, uint64_t val) "MMIO write: offset=0x%" PRIx64 " value=0x%" PRIx64
+
 # etraxfs_eth.c
 mdio_phy_read(int regnum, uint16_t value) "read phy_reg:%d value:0x%04x"
 mdio_phy_write(int regnum, uint16_t value) "write phy_reg:%d value:0x%04x"
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 7aff4ebbd2..b964a60f41 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -31,6 +31,7 @@
 #include "hw/misc/allwinner-h3-syscon.h"
 #include "hw/misc/allwinner-h3-sid.h"
 #include "hw/sd/allwinner-h3-sdhost.h"
+#include "hw/net/allwinner-h3-emac.h"
 #include "target/arm/cpu.h"
 
 #define AW_H3_SRAM_A1_BASE     (0x00000000)
@@ -119,6 +120,7 @@ typedef struct AwH3State {
     AwH3SysconState syscon;
     AwH3SidState sid;
     AwH3SDHostState mmc0;
+    AwH3EmacState emac;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
diff --git a/include/hw/net/allwinner-h3-emac.h b/include/hw/net/allwinner-h3-emac.h
new file mode 100644
index 0000000000..a007d54472
--- /dev/null
+++ b/include/hw/net/allwinner-h3-emac.h
@@ -0,0 +1,69 @@
+/*
+ * Allwinner H3 EMAC emulation
+ *
+ * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef ALLWINNER_H3_EMAC_H
+#define ALLWINNER_H3_EMAC_H
+
+#include "qemu/units.h"
+#include "net/net.h"
+#include "qemu/fifo8.h"
+#include "hw/net/mii.h"
+#include "hw/sysbus.h"
+
+#define AW_H3_EMAC_REGS_MEM_SIZE  (1024)
+
+#define TYPE_AW_H3_EMAC "allwinner-h3-emac"
+#define AW_H3_EMAC(obj) OBJECT_CHECK(AwH3EmacState, (obj), TYPE_AW_H3_EMAC)
+
+typedef struct AwH3EmacState {
+    /*< private >*/
+    SysBusDevice  parent_obj;
+    /*< public >*/
+
+    MemoryRegion iomem;
+    qemu_irq     irq;
+    NICState     *nic;
+    NICConf      conf;
+
+    uint8_t      mii_phy_addr;
+    uint32_t     mii_cmd;
+    uint32_t     mii_data;
+    uint32_t     mii_cr;
+    uint32_t     mii_st;
+
+    uint32_t     basic_ctl0;
+    uint32_t     basic_ctl1;
+    uint32_t     int_en;
+    uint32_t     int_sta;
+    uint32_t     frm_flt;
+
+    uint32_t     rx_ctl0;
+    uint32_t     rx_ctl1;
+    uint32_t     rx_desc_head;
+    uint32_t     rx_desc_curr;
+
+    uint32_t     tx_ctl0;
+    uint32_t     tx_ctl1;
+    uint32_t     tx_desc_head;
+    uint32_t     tx_desc_curr;
+    uint32_t     tx_flowctl;
+
+} AwH3EmacState;
+
+#endif
-- 
2.17.1


