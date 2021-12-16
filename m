Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92286476C36
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:51:28 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmU3-00072H-Nk
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmOj-0000Z8-4F; Thu, 16 Dec 2021 03:45:57 -0500
Received: from [2a00:1450:4864:20::436] (port=35734
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmOd-0003IV-RF; Thu, 16 Dec 2021 03:45:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id k9so24959899wrd.2;
 Thu, 16 Dec 2021 00:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8zhYeJXBQhrvmMlQ1+MeZ6KpS28GbGtjyPGoLP9Qjg=;
 b=To8IesIlYX91lbf1houLEmoAG/ADFwunMnvdglRWeC7ozQAPtlbM100PsAjs8gWiJU
 wKBtdzrCXjhqidyZFIXj/kD+rzF/Jcm70MvAThqaZg6mCEp/AHwBW7lPvu1nTkoIJVfr
 h+9M2QwcOaD0TItTxZ27dXvT2bA7QCNpZZzLWzIvLOD6CGtvRYWtIGTlm861ZY7kULvK
 I91fBsoF4gw+15A+ZW3kQcTFfg24wqiKMn9SrNNZDaj5xks9HUbCWEV5JBVl4zutRmKQ
 kaR5zwqrPn0Yvx49aj0HXzpVtb3KYr/R3dsFk9m7QQwTmcmKg5liGpJdiiKUyrRh+rtH
 8IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p8zhYeJXBQhrvmMlQ1+MeZ6KpS28GbGtjyPGoLP9Qjg=;
 b=CoBPRv5jl0NU2Dq2o0d318/TUeWWlfpOcM0OUgq4Mh1StGzZ3DKDlHHGy3fgCxV0vG
 /XnNgeocRv6cuaCcMsUwCYD5SFJE4KG+/a6R9n2lD7mJDorA35BE0vJMB6aIa2mG7JG2
 X5Pwmr9g+LaCPmuPNrVR32/sUSOtvwjez+W2MOi5HycN8abl8cJsy/TLnenxwtBkcgta
 u9I3eAYkUeGCTjmwWyeUCEf3IFQzuCAig64iLfyPDOl9FG6rc/xja3ed2QEXehHtdEWd
 gSmfss/UrPPgsIomkTUJPDVmcgQxo8FHhU+gemRPgOzLbnrECmUqj8EyUD6cI02eIV16
 woHQ==
X-Gm-Message-State: AOAM530+hGH3r/tgf4GIF77bZbDfe94aqaz/yrTJv4d6lNnzNQv1GXwc
 Gn3mWiqQEDTP85W8iVfQ3f+ITO3WA0o=
X-Google-Smtp-Source: ABdhPJwrzLGKI7e69mG/21lTlVCuy0riIYDjWj4l8YPjekbNPfeQoYEiHGAivjvLY15klPsCOH9gJA==
X-Received: by 2002:a05:6000:108e:: with SMTP id
 y14mr7990588wrw.69.1639644349573; 
 Thu, 16 Dec 2021 00:45:49 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id q123sm7021042wma.30.2021.12.16.00.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:45:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/net: Move MV88W8618 network device out of hw/arm/
 directory
Date: Thu, 16 Dec 2021 09:45:30 +0100
Message-Id: <20211216084530.698125-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216084530.698125-1-f4bug@amsat.org>
References: <20211216084530.698125-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Marvell 88W8618 network device is hidden in the Musicpal
machine. Move it into a new unit file under the hw/net/ directory.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/mv88w8618_eth.h |  16 ++
 hw/arm/musicpal.c              | 380 +-----------------------------
 hw/net/mv88w8618_eth.c         | 406 +++++++++++++++++++++++++++++++++
 MAINTAINERS                    |   2 +
 hw/net/meson.build             |   1 +
 5 files changed, 426 insertions(+), 379 deletions(-)
 create mode 100644 include/hw/net/mv88w8618_eth.h
 create mode 100644 hw/net/mv88w8618_eth.c

diff --git a/include/hw/net/mv88w8618_eth.h b/include/hw/net/mv88w8618_eth.h
new file mode 100644
index 00000000000..65e880e0eb7
--- /dev/null
+++ b/include/hw/net/mv88w8618_eth.h
@@ -0,0 +1,16 @@
+/*
+ * Marvell MV88W8618 / Freecom MusicPal emulation.
+ *
+ * Copyright (c) 2008 Jan Kiszka
+ *
+ * This code is licensed under the GNU GPL v2.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+#ifndef HW_NET_MV88W8618_H
+#define HW_NET_MV88W8618_H
+
+#define TYPE_MV88W8618_ETH "mv88w8618_eth"
+
+#endif
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 6b5310117b8..7c840fb4283 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -34,12 +34,12 @@
 #include "ui/pixel_ops.h"
 #include "qemu/cutils.h"
 #include "qom/object.h"
+#include "hw/net/mv88w8618_eth.h"
 
 #define MP_MISC_BASE            0x80002000
 #define MP_MISC_SIZE            0x00001000
 
 #define MP_ETH_BASE             0x80008000
-#define MP_ETH_SIZE             0x00001000
 
 #define MP_WLAN_BASE            0x8000C000
 #define MP_WLAN_SIZE            0x00000800
@@ -84,383 +84,6 @@
 /* Wolfson 8750 I2C address */
 #define MP_WM_ADDR              0x1A
 
-/* Ethernet register offsets */
-#define MP_ETH_SMIR             0x010
-#define MP_ETH_PCXR             0x408
-#define MP_ETH_SDCMR            0x448
-#define MP_ETH_ICR              0x450
-#define MP_ETH_IMR              0x458
-#define MP_ETH_FRDP0            0x480
-#define MP_ETH_FRDP1            0x484
-#define MP_ETH_FRDP2            0x488
-#define MP_ETH_FRDP3            0x48C
-#define MP_ETH_CRDP0            0x4A0
-#define MP_ETH_CRDP1            0x4A4
-#define MP_ETH_CRDP2            0x4A8
-#define MP_ETH_CRDP3            0x4AC
-#define MP_ETH_CTDP0            0x4E0
-#define MP_ETH_CTDP1            0x4E4
-
-/* MII PHY access */
-#define MP_ETH_SMIR_DATA        0x0000FFFF
-#define MP_ETH_SMIR_ADDR        0x03FF0000
-#define MP_ETH_SMIR_OPCODE      (1 << 26) /* Read value */
-#define MP_ETH_SMIR_RDVALID     (1 << 27)
-
-/* PHY registers */
-#define MP_ETH_PHY1_BMSR        0x00210000
-#define MP_ETH_PHY1_PHYSID1     0x00410000
-#define MP_ETH_PHY1_PHYSID2     0x00610000
-
-#define MP_PHY_BMSR_LINK        0x0004
-#define MP_PHY_BMSR_AUTONEG     0x0008
-
-#define MP_PHY_88E3015          0x01410E20
-
-/* TX descriptor status */
-#define MP_ETH_TX_OWN           (1U << 31)
-
-/* RX descriptor status */
-#define MP_ETH_RX_OWN           (1U << 31)
-
-/* Interrupt cause/mask bits */
-#define MP_ETH_IRQ_RX_BIT       0
-#define MP_ETH_IRQ_RX           (1 << MP_ETH_IRQ_RX_BIT)
-#define MP_ETH_IRQ_TXHI_BIT     2
-#define MP_ETH_IRQ_TXLO_BIT     3
-
-/* Port config bits */
-#define MP_ETH_PCXR_2BSM_BIT    28 /* 2-byte incoming suffix */
-
-/* SDMA command bits */
-#define MP_ETH_CMD_TXHI         (1 << 23)
-#define MP_ETH_CMD_TXLO         (1 << 22)
-
-typedef struct mv88w8618_tx_desc {
-    uint32_t cmdstat;
-    uint16_t res;
-    uint16_t bytes;
-    uint32_t buffer;
-    uint32_t next;
-} mv88w8618_tx_desc;
-
-typedef struct mv88w8618_rx_desc {
-    uint32_t cmdstat;
-    uint16_t bytes;
-    uint16_t buffer_size;
-    uint32_t buffer;
-    uint32_t next;
-} mv88w8618_rx_desc;
-
-#define TYPE_MV88W8618_ETH "mv88w8618_eth"
-OBJECT_DECLARE_SIMPLE_TYPE(mv88w8618_eth_state, MV88W8618_ETH)
-
-struct mv88w8618_eth_state {
-    /*< private >*/
-    SysBusDevice parent_obj;
-    /*< public >*/
-
-    MemoryRegion iomem;
-    qemu_irq irq;
-    MemoryRegion *dma_mr;
-    AddressSpace dma_as;
-    uint32_t smir;
-    uint32_t icr;
-    uint32_t imr;
-    int mmio_index;
-    uint32_t vlan_header;
-    uint32_t tx_queue[2];
-    uint32_t rx_queue[4];
-    uint32_t frx_queue[4];
-    uint32_t cur_rx[4];
-    NICState *nic;
-    NICConf conf;
-};
-
-static void eth_rx_desc_put(AddressSpace *dma_as, uint32_t addr,
-                            mv88w8618_rx_desc *desc)
-{
-    cpu_to_le32s(&desc->cmdstat);
-    cpu_to_le16s(&desc->bytes);
-    cpu_to_le16s(&desc->buffer_size);
-    cpu_to_le32s(&desc->buffer);
-    cpu_to_le32s(&desc->next);
-    dma_memory_write(dma_as, addr, desc, sizeof(*desc));
-}
-
-static void eth_rx_desc_get(AddressSpace *dma_as, uint32_t addr,
-                            mv88w8618_rx_desc *desc)
-{
-    dma_memory_read(dma_as, addr, desc, sizeof(*desc));
-    le32_to_cpus(&desc->cmdstat);
-    le16_to_cpus(&desc->bytes);
-    le16_to_cpus(&desc->buffer_size);
-    le32_to_cpus(&desc->buffer);
-    le32_to_cpus(&desc->next);
-}
-
-static ssize_t eth_receive(NetClientState *nc, const uint8_t *buf, size_t size)
-{
-    mv88w8618_eth_state *s = qemu_get_nic_opaque(nc);
-    uint32_t desc_addr;
-    mv88w8618_rx_desc desc;
-    int i;
-
-    for (i = 0; i < 4; i++) {
-        desc_addr = s->cur_rx[i];
-        if (!desc_addr) {
-            continue;
-        }
-        do {
-            eth_rx_desc_get(&s->dma_as, desc_addr, &desc);
-            if ((desc.cmdstat & MP_ETH_RX_OWN) && desc.buffer_size >= size) {
-                dma_memory_write(&s->dma_as, desc.buffer + s->vlan_header,
-                                          buf, size);
-                desc.bytes = size + s->vlan_header;
-                desc.cmdstat &= ~MP_ETH_RX_OWN;
-                s->cur_rx[i] = desc.next;
-
-                s->icr |= MP_ETH_IRQ_RX;
-                if (s->icr & s->imr) {
-                    qemu_irq_raise(s->irq);
-                }
-                eth_rx_desc_put(&s->dma_as, desc_addr, &desc);
-                return size;
-            }
-            desc_addr = desc.next;
-        } while (desc_addr != s->rx_queue[i]);
-    }
-    return size;
-}
-
-static void eth_tx_desc_put(AddressSpace *dma_as, uint32_t addr,
-                            mv88w8618_tx_desc *desc)
-{
-    cpu_to_le32s(&desc->cmdstat);
-    cpu_to_le16s(&desc->res);
-    cpu_to_le16s(&desc->bytes);
-    cpu_to_le32s(&desc->buffer);
-    cpu_to_le32s(&desc->next);
-    dma_memory_write(dma_as, addr, desc, sizeof(*desc));
-}
-
-static void eth_tx_desc_get(AddressSpace *dma_as, uint32_t addr,
-                            mv88w8618_tx_desc *desc)
-{
-    dma_memory_read(dma_as, addr, desc, sizeof(*desc));
-    le32_to_cpus(&desc->cmdstat);
-    le16_to_cpus(&desc->res);
-    le16_to_cpus(&desc->bytes);
-    le32_to_cpus(&desc->buffer);
-    le32_to_cpus(&desc->next);
-}
-
-static void eth_send(mv88w8618_eth_state *s, int queue_index)
-{
-    uint32_t desc_addr = s->tx_queue[queue_index];
-    mv88w8618_tx_desc desc;
-    uint32_t next_desc;
-    uint8_t buf[2048];
-    int len;
-
-    do {
-        eth_tx_desc_get(&s->dma_as, desc_addr, &desc);
-        next_desc = desc.next;
-        if (desc.cmdstat & MP_ETH_TX_OWN) {
-            len = desc.bytes;
-            if (len < 2048) {
-                dma_memory_read(&s->dma_as, desc.buffer, buf, len);
-                qemu_send_packet(qemu_get_queue(s->nic), buf, len);
-            }
-            desc.cmdstat &= ~MP_ETH_TX_OWN;
-            s->icr |= 1 << (MP_ETH_IRQ_TXLO_BIT - queue_index);
-            eth_tx_desc_put(&s->dma_as, desc_addr, &desc);
-        }
-        desc_addr = next_desc;
-    } while (desc_addr != s->tx_queue[queue_index]);
-}
-
-static uint64_t mv88w8618_eth_read(void *opaque, hwaddr offset,
-                                   unsigned size)
-{
-    mv88w8618_eth_state *s = opaque;
-
-    switch (offset) {
-    case MP_ETH_SMIR:
-        if (s->smir & MP_ETH_SMIR_OPCODE) {
-            switch (s->smir & MP_ETH_SMIR_ADDR) {
-            case MP_ETH_PHY1_BMSR:
-                return MP_PHY_BMSR_LINK | MP_PHY_BMSR_AUTONEG |
-                       MP_ETH_SMIR_RDVALID;
-            case MP_ETH_PHY1_PHYSID1:
-                return (MP_PHY_88E3015 >> 16) | MP_ETH_SMIR_RDVALID;
-            case MP_ETH_PHY1_PHYSID2:
-                return (MP_PHY_88E3015 & 0xFFFF) | MP_ETH_SMIR_RDVALID;
-            default:
-                return MP_ETH_SMIR_RDVALID;
-            }
-        }
-        return 0;
-
-    case MP_ETH_ICR:
-        return s->icr;
-
-    case MP_ETH_IMR:
-        return s->imr;
-
-    case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        return s->frx_queue[(offset - MP_ETH_FRDP0) / 4];
-
-    case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        return s->rx_queue[(offset - MP_ETH_CRDP0) / 4];
-
-    case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        return s->tx_queue[(offset - MP_ETH_CTDP0) / 4];
-
-    default:
-        return 0;
-    }
-}
-
-static void mv88w8618_eth_write(void *opaque, hwaddr offset,
-                                uint64_t value, unsigned size)
-{
-    mv88w8618_eth_state *s = opaque;
-
-    switch (offset) {
-    case MP_ETH_SMIR:
-        s->smir = value;
-        break;
-
-    case MP_ETH_PCXR:
-        s->vlan_header = ((value >> MP_ETH_PCXR_2BSM_BIT) & 1) * 2;
-        break;
-
-    case MP_ETH_SDCMR:
-        if (value & MP_ETH_CMD_TXHI) {
-            eth_send(s, 1);
-        }
-        if (value & MP_ETH_CMD_TXLO) {
-            eth_send(s, 0);
-        }
-        if (value & (MP_ETH_CMD_TXHI | MP_ETH_CMD_TXLO) && s->icr & s->imr) {
-            qemu_irq_raise(s->irq);
-        }
-        break;
-
-    case MP_ETH_ICR:
-        s->icr &= value;
-        break;
-
-    case MP_ETH_IMR:
-        s->imr = value;
-        if (s->icr & s->imr) {
-            qemu_irq_raise(s->irq);
-        }
-        break;
-
-    case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        s->frx_queue[(offset - MP_ETH_FRDP0) / 4] = value;
-        break;
-
-    case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        s->rx_queue[(offset - MP_ETH_CRDP0) / 4] =
-            s->cur_rx[(offset - MP_ETH_CRDP0) / 4] = value;
-        break;
-
-    case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        s->tx_queue[(offset - MP_ETH_CTDP0) / 4] = value;
-        break;
-    }
-}
-
-static const MemoryRegionOps mv88w8618_eth_ops = {
-    .read = mv88w8618_eth_read,
-    .write = mv88w8618_eth_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void eth_cleanup(NetClientState *nc)
-{
-    mv88w8618_eth_state *s = qemu_get_nic_opaque(nc);
-
-    s->nic = NULL;
-}
-
-static NetClientInfo net_mv88w8618_info = {
-    .type = NET_CLIENT_DRIVER_NIC,
-    .size = sizeof(NICState),
-    .receive = eth_receive,
-    .cleanup = eth_cleanup,
-};
-
-static void mv88w8618_eth_init(Object *obj)
-{
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    DeviceState *dev = DEVICE(sbd);
-    mv88w8618_eth_state *s = MV88W8618_ETH(dev);
-
-    sysbus_init_irq(sbd, &s->irq);
-    memory_region_init_io(&s->iomem, obj, &mv88w8618_eth_ops, s,
-                          "mv88w8618-eth", MP_ETH_SIZE);
-    sysbus_init_mmio(sbd, &s->iomem);
-}
-
-static void mv88w8618_eth_realize(DeviceState *dev, Error **errp)
-{
-    mv88w8618_eth_state *s = MV88W8618_ETH(dev);
-
-    if (!s->dma_mr) {
-        error_setg(errp, TYPE_MV88W8618_ETH " 'dma-memory' link not set");
-        return;
-    }
-
-    address_space_init(&s->dma_as, s->dma_mr, "emac-dma");
-    s->nic = qemu_new_nic(&net_mv88w8618_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
-}
-
-static const VMStateDescription mv88w8618_eth_vmsd = {
-    .name = "mv88w8618_eth",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32(smir, mv88w8618_eth_state),
-        VMSTATE_UINT32(icr, mv88w8618_eth_state),
-        VMSTATE_UINT32(imr, mv88w8618_eth_state),
-        VMSTATE_UINT32(vlan_header, mv88w8618_eth_state),
-        VMSTATE_UINT32_ARRAY(tx_queue, mv88w8618_eth_state, 2),
-        VMSTATE_UINT32_ARRAY(rx_queue, mv88w8618_eth_state, 4),
-        VMSTATE_UINT32_ARRAY(frx_queue, mv88w8618_eth_state, 4),
-        VMSTATE_UINT32_ARRAY(cur_rx, mv88w8618_eth_state, 4),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property mv88w8618_eth_properties[] = {
-    DEFINE_NIC_PROPERTIES(mv88w8618_eth_state, conf),
-    DEFINE_PROP_LINK("dma-memory", mv88w8618_eth_state, dma_mr,
-                     TYPE_MEMORY_REGION, MemoryRegion *),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void mv88w8618_eth_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->vmsd = &mv88w8618_eth_vmsd;
-    device_class_set_props(dc, mv88w8618_eth_properties);
-    dc->realize = mv88w8618_eth_realize;
-}
-
-static const TypeInfo mv88w8618_eth_info = {
-    .name          = TYPE_MV88W8618_ETH,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(mv88w8618_eth_state),
-    .instance_init = mv88w8618_eth_init,
-    .class_init    = mv88w8618_eth_class_init,
-};
-
 /* LCD register offsets */
 #define MP_LCD_IRQCTRL          0x180
 #define MP_LCD_IRQSTAT          0x184
@@ -1745,7 +1368,6 @@ static void musicpal_register_types(void)
     type_register_static(&mv88w8618_pic_info);
     type_register_static(&mv88w8618_pit_info);
     type_register_static(&mv88w8618_flashcfg_info);
-    type_register_static(&mv88w8618_eth_info);
     type_register_static(&mv88w8618_wlan_info);
     type_register_static(&musicpal_lcd_info);
     type_register_static(&musicpal_gpio_info);
diff --git a/hw/net/mv88w8618_eth.c b/hw/net/mv88w8618_eth.c
new file mode 100644
index 00000000000..6902b1ef316
--- /dev/null
+++ b/hw/net/mv88w8618_eth.c
@@ -0,0 +1,406 @@
+/*
+ * Marvell MV88W8618 / Freecom MusicPal emulation.
+ *
+ * Copyright (c) 2008 Jan Kiszka
+ *
+ * This code is licensed under the GNU GPL v2.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/net/mv88w8618_eth.h"
+#include "migration/vmstate.h"
+#include "sysemu/dma.h"
+#include "net/net.h"
+
+#define MP_ETH_SIZE             0x00001000
+
+/* Ethernet register offsets */
+#define MP_ETH_SMIR             0x010
+#define MP_ETH_PCXR             0x408
+#define MP_ETH_SDCMR            0x448
+#define MP_ETH_ICR              0x450
+#define MP_ETH_IMR              0x458
+#define MP_ETH_FRDP0            0x480
+#define MP_ETH_FRDP1            0x484
+#define MP_ETH_FRDP2            0x488
+#define MP_ETH_FRDP3            0x48C
+#define MP_ETH_CRDP0            0x4A0
+#define MP_ETH_CRDP1            0x4A4
+#define MP_ETH_CRDP2            0x4A8
+#define MP_ETH_CRDP3            0x4AC
+#define MP_ETH_CTDP0            0x4E0
+#define MP_ETH_CTDP1            0x4E4
+
+/* MII PHY access */
+#define MP_ETH_SMIR_DATA        0x0000FFFF
+#define MP_ETH_SMIR_ADDR        0x03FF0000
+#define MP_ETH_SMIR_OPCODE      (1 << 26) /* Read value */
+#define MP_ETH_SMIR_RDVALID     (1 << 27)
+
+/* PHY registers */
+#define MP_ETH_PHY1_BMSR        0x00210000
+#define MP_ETH_PHY1_PHYSID1     0x00410000
+#define MP_ETH_PHY1_PHYSID2     0x00610000
+
+#define MP_PHY_BMSR_LINK        0x0004
+#define MP_PHY_BMSR_AUTONEG     0x0008
+
+#define MP_PHY_88E3015          0x01410E20
+
+/* TX descriptor status */
+#define MP_ETH_TX_OWN           (1U << 31)
+
+/* RX descriptor status */
+#define MP_ETH_RX_OWN           (1U << 31)
+
+/* Interrupt cause/mask bits */
+#define MP_ETH_IRQ_RX_BIT       0
+#define MP_ETH_IRQ_RX           (1 << MP_ETH_IRQ_RX_BIT)
+#define MP_ETH_IRQ_TXHI_BIT     2
+#define MP_ETH_IRQ_TXLO_BIT     3
+
+/* Port config bits */
+#define MP_ETH_PCXR_2BSM_BIT    28 /* 2-byte incoming suffix */
+
+/* SDMA command bits */
+#define MP_ETH_CMD_TXHI         (1 << 23)
+#define MP_ETH_CMD_TXLO         (1 << 22)
+
+typedef struct mv88w8618_tx_desc {
+    uint32_t cmdstat;
+    uint16_t res;
+    uint16_t bytes;
+    uint32_t buffer;
+    uint32_t next;
+} mv88w8618_tx_desc;
+
+typedef struct mv88w8618_rx_desc {
+    uint32_t cmdstat;
+    uint16_t bytes;
+    uint16_t buffer_size;
+    uint32_t buffer;
+    uint32_t next;
+} mv88w8618_rx_desc;
+
+OBJECT_DECLARE_SIMPLE_TYPE(mv88w8618_eth_state, MV88W8618_ETH)
+
+struct mv88w8618_eth_state {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
+    uint32_t smir;
+    uint32_t icr;
+    uint32_t imr;
+    int mmio_index;
+    uint32_t vlan_header;
+    uint32_t tx_queue[2];
+    uint32_t rx_queue[4];
+    uint32_t frx_queue[4];
+    uint32_t cur_rx[4];
+    NICState *nic;
+    NICConf conf;
+};
+
+static void eth_rx_desc_put(AddressSpace *dma_as, uint32_t addr,
+                            mv88w8618_rx_desc *desc)
+{
+    cpu_to_le32s(&desc->cmdstat);
+    cpu_to_le16s(&desc->bytes);
+    cpu_to_le16s(&desc->buffer_size);
+    cpu_to_le32s(&desc->buffer);
+    cpu_to_le32s(&desc->next);
+    dma_memory_write(dma_as, addr, desc, sizeof(*desc));
+}
+
+static void eth_rx_desc_get(AddressSpace *dma_as, uint32_t addr,
+                            mv88w8618_rx_desc *desc)
+{
+    dma_memory_read(dma_as, addr, desc, sizeof(*desc));
+    le32_to_cpus(&desc->cmdstat);
+    le16_to_cpus(&desc->bytes);
+    le16_to_cpus(&desc->buffer_size);
+    le32_to_cpus(&desc->buffer);
+    le32_to_cpus(&desc->next);
+}
+
+static ssize_t eth_receive(NetClientState *nc, const uint8_t *buf, size_t size)
+{
+    mv88w8618_eth_state *s = qemu_get_nic_opaque(nc);
+    uint32_t desc_addr;
+    mv88w8618_rx_desc desc;
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        desc_addr = s->cur_rx[i];
+        if (!desc_addr) {
+            continue;
+        }
+        do {
+            eth_rx_desc_get(&s->dma_as, desc_addr, &desc);
+            if ((desc.cmdstat & MP_ETH_RX_OWN) && desc.buffer_size >= size) {
+                dma_memory_write(&s->dma_as, desc.buffer + s->vlan_header,
+                                          buf, size);
+                desc.bytes = size + s->vlan_header;
+                desc.cmdstat &= ~MP_ETH_RX_OWN;
+                s->cur_rx[i] = desc.next;
+
+                s->icr |= MP_ETH_IRQ_RX;
+                if (s->icr & s->imr) {
+                    qemu_irq_raise(s->irq);
+                }
+                eth_rx_desc_put(&s->dma_as, desc_addr, &desc);
+                return size;
+            }
+            desc_addr = desc.next;
+        } while (desc_addr != s->rx_queue[i]);
+    }
+    return size;
+}
+
+static void eth_tx_desc_put(AddressSpace *dma_as, uint32_t addr,
+                            mv88w8618_tx_desc *desc)
+{
+    cpu_to_le32s(&desc->cmdstat);
+    cpu_to_le16s(&desc->res);
+    cpu_to_le16s(&desc->bytes);
+    cpu_to_le32s(&desc->buffer);
+    cpu_to_le32s(&desc->next);
+    dma_memory_write(dma_as, addr, desc, sizeof(*desc));
+}
+
+static void eth_tx_desc_get(AddressSpace *dma_as, uint32_t addr,
+                            mv88w8618_tx_desc *desc)
+{
+    dma_memory_read(dma_as, addr, desc, sizeof(*desc));
+    le32_to_cpus(&desc->cmdstat);
+    le16_to_cpus(&desc->res);
+    le16_to_cpus(&desc->bytes);
+    le32_to_cpus(&desc->buffer);
+    le32_to_cpus(&desc->next);
+}
+
+static void eth_send(mv88w8618_eth_state *s, int queue_index)
+{
+    uint32_t desc_addr = s->tx_queue[queue_index];
+    mv88w8618_tx_desc desc;
+    uint32_t next_desc;
+    uint8_t buf[2048];
+    int len;
+
+    do {
+        eth_tx_desc_get(&s->dma_as, desc_addr, &desc);
+        next_desc = desc.next;
+        if (desc.cmdstat & MP_ETH_TX_OWN) {
+            len = desc.bytes;
+            if (len < 2048) {
+                dma_memory_read(&s->dma_as, desc.buffer, buf, len);
+                qemu_send_packet(qemu_get_queue(s->nic), buf, len);
+            }
+            desc.cmdstat &= ~MP_ETH_TX_OWN;
+            s->icr |= 1 << (MP_ETH_IRQ_TXLO_BIT - queue_index);
+            eth_tx_desc_put(&s->dma_as, desc_addr, &desc);
+        }
+        desc_addr = next_desc;
+    } while (desc_addr != s->tx_queue[queue_index]);
+}
+
+static uint64_t mv88w8618_eth_read(void *opaque, hwaddr offset,
+                                   unsigned size)
+{
+    mv88w8618_eth_state *s = opaque;
+
+    switch (offset) {
+    case MP_ETH_SMIR:
+        if (s->smir & MP_ETH_SMIR_OPCODE) {
+            switch (s->smir & MP_ETH_SMIR_ADDR) {
+            case MP_ETH_PHY1_BMSR:
+                return MP_PHY_BMSR_LINK | MP_PHY_BMSR_AUTONEG |
+                       MP_ETH_SMIR_RDVALID;
+            case MP_ETH_PHY1_PHYSID1:
+                return (MP_PHY_88E3015 >> 16) | MP_ETH_SMIR_RDVALID;
+            case MP_ETH_PHY1_PHYSID2:
+                return (MP_PHY_88E3015 & 0xFFFF) | MP_ETH_SMIR_RDVALID;
+            default:
+                return MP_ETH_SMIR_RDVALID;
+            }
+        }
+        return 0;
+
+    case MP_ETH_ICR:
+        return s->icr;
+
+    case MP_ETH_IMR:
+        return s->imr;
+
+    case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
+        return s->frx_queue[(offset - MP_ETH_FRDP0) / 4];
+
+    case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
+        return s->rx_queue[(offset - MP_ETH_CRDP0) / 4];
+
+    case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
+        return s->tx_queue[(offset - MP_ETH_CTDP0) / 4];
+
+    default:
+        return 0;
+    }
+}
+
+static void mv88w8618_eth_write(void *opaque, hwaddr offset,
+                                uint64_t value, unsigned size)
+{
+    mv88w8618_eth_state *s = opaque;
+
+    switch (offset) {
+    case MP_ETH_SMIR:
+        s->smir = value;
+        break;
+
+    case MP_ETH_PCXR:
+        s->vlan_header = ((value >> MP_ETH_PCXR_2BSM_BIT) & 1) * 2;
+        break;
+
+    case MP_ETH_SDCMR:
+        if (value & MP_ETH_CMD_TXHI) {
+            eth_send(s, 1);
+        }
+        if (value & MP_ETH_CMD_TXLO) {
+            eth_send(s, 0);
+        }
+        if (value & (MP_ETH_CMD_TXHI | MP_ETH_CMD_TXLO) && s->icr & s->imr) {
+            qemu_irq_raise(s->irq);
+        }
+        break;
+
+    case MP_ETH_ICR:
+        s->icr &= value;
+        break;
+
+    case MP_ETH_IMR:
+        s->imr = value;
+        if (s->icr & s->imr) {
+            qemu_irq_raise(s->irq);
+        }
+        break;
+
+    case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
+        s->frx_queue[(offset - MP_ETH_FRDP0) / 4] = value;
+        break;
+
+    case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
+        s->rx_queue[(offset - MP_ETH_CRDP0) / 4] =
+            s->cur_rx[(offset - MP_ETH_CRDP0) / 4] = value;
+        break;
+
+    case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
+        s->tx_queue[(offset - MP_ETH_CTDP0) / 4] = value;
+        break;
+    }
+}
+
+static const MemoryRegionOps mv88w8618_eth_ops = {
+    .read = mv88w8618_eth_read,
+    .write = mv88w8618_eth_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void eth_cleanup(NetClientState *nc)
+{
+    mv88w8618_eth_state *s = qemu_get_nic_opaque(nc);
+
+    s->nic = NULL;
+}
+
+static NetClientInfo net_mv88w8618_info = {
+    .type = NET_CLIENT_DRIVER_NIC,
+    .size = sizeof(NICState),
+    .receive = eth_receive,
+    .cleanup = eth_cleanup,
+};
+
+static void mv88w8618_eth_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    DeviceState *dev = DEVICE(sbd);
+    mv88w8618_eth_state *s = MV88W8618_ETH(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+    memory_region_init_io(&s->iomem, obj, &mv88w8618_eth_ops, s,
+                          "mv88w8618-eth", MP_ETH_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void mv88w8618_eth_realize(DeviceState *dev, Error **errp)
+{
+    mv88w8618_eth_state *s = MV88W8618_ETH(dev);
+
+    if (!s->dma_mr) {
+        error_setg(errp, TYPE_MV88W8618_ETH " 'dma-memory' link not set");
+        return;
+    }
+
+    address_space_init(&s->dma_as, s->dma_mr, "emac-dma");
+    s->nic = qemu_new_nic(&net_mv88w8618_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), dev->id, s);
+}
+
+static const VMStateDescription mv88w8618_eth_vmsd = {
+    .name = "mv88w8618_eth",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(smir, mv88w8618_eth_state),
+        VMSTATE_UINT32(icr, mv88w8618_eth_state),
+        VMSTATE_UINT32(imr, mv88w8618_eth_state),
+        VMSTATE_UINT32(vlan_header, mv88w8618_eth_state),
+        VMSTATE_UINT32_ARRAY(tx_queue, mv88w8618_eth_state, 2),
+        VMSTATE_UINT32_ARRAY(rx_queue, mv88w8618_eth_state, 4),
+        VMSTATE_UINT32_ARRAY(frx_queue, mv88w8618_eth_state, 4),
+        VMSTATE_UINT32_ARRAY(cur_rx, mv88w8618_eth_state, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property mv88w8618_eth_properties[] = {
+    DEFINE_NIC_PROPERTIES(mv88w8618_eth_state, conf),
+    DEFINE_PROP_LINK("dma-memory", mv88w8618_eth_state, dma_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void mv88w8618_eth_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &mv88w8618_eth_vmsd;
+    device_class_set_props(dc, mv88w8618_eth_properties);
+    dc->realize = mv88w8618_eth_realize;
+}
+
+static const TypeInfo mv88w8618_eth_info = {
+    .name          = TYPE_MV88W8618_ETH,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(mv88w8618_eth_state),
+    .instance_init = mv88w8618_eth_init,
+    .class_init    = mv88w8618_eth_class_init,
+};
+
+static void musicpal_register_types(void)
+{
+    type_register_static(&mv88w8618_eth_info);
+}
+
+type_init(musicpal_register_types)
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d597..ffc1b57fb37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -781,6 +781,8 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/musicpal.c
+F: hw/net/mv88w8618_eth.c
+F: include/hw/net/mv88w8618_eth.h
 F: docs/system/arm/musicpal.rst
 
 Nuvoton NPCM7xx
diff --git a/hw/net/meson.build b/hw/net/meson.build
index bdf71f1f405..bbc77d48548 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -26,6 +26,7 @@
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_SUN8I_EMAC', if_true: files('allwinner-sun8i-emac.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_FEC', if_true: files('imx_fec.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-emac.c'))
+softmmu_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('mv88w8618_eth.c'))
 
 softmmu_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_gem.c'))
 softmmu_ss.add(when: 'CONFIG_STELLARIS_ENET', if_true: files('stellaris_enet.c'))
-- 
2.33.1


