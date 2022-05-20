Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2652E579
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 08:59:52 +0200 (CEST)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrwc3-0006HN-8T
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 02:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nrwVj-0004wu-HD
 for qemu-devel@nongnu.org; Fri, 20 May 2022 02:53:19 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nrwVg-0008V2-7J
 for qemu-devel@nongnu.org; Fri, 20 May 2022 02:53:18 -0400
Received: by mail-pf1-x431.google.com with SMTP id x143so6990722pfc.11
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 23:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gdj6mmlximd9d/RVf8SEd28VRBLTxQjt2EjmwdyrnVY=;
 b=HaD/CNU7sZscAERW4NTB1QsaCX/yVrWRf98PB5fB35QUpkh7FlzjaHEcmADMt9QOQY
 ES+RhcZWjWvOOgLQhLHjrc/HoYihEXljJHG1YMdWvPcC6XSQpmqhZTJNVrK43+1NQCnY
 IurmiWMDqEVCMSRh4bONkdtiLPIL7NI0+oEDDBsllJa5FN5JDsnUkXPvgJr3H4yWeo9R
 xs22kqh8KDL0WqycPhWu1HshUS+vNhv09b9sVQI5kvczVXxTpfd0S2OuCGeG6SNw1zI/
 JrpvH1SRbQ8mPDisNZeS8oPIcSass/Zb+qDMFmxeGcIk7NBBSjl9Ct3+CY+2oiMOgglM
 2Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gdj6mmlximd9d/RVf8SEd28VRBLTxQjt2EjmwdyrnVY=;
 b=gk9ERh8b0WpIV1xbyQXIPtJiIQVsDC4tJfzeyVa4n8J8Wg6HeHXQJD1hNXhOumwJ+u
 zzR9irrfzO/ykjG2po+4lom/Q7tiiFIiJSOMzLMfFdACkz7fqxQbh2/d/EafceHugKqW
 rHNVfdGZzp2mGshRfq6F47x5TzIW6C4BmvRBtTXmvb1E6AOHepenF8dWSh9MPgmrQtF5
 v+PK97gk6Kdim6v+zrjzP4sC70t7QvwHdQpzaaoF6Cz6/+CzMUhDvHbMlwYwcyh1TpSO
 sxI5xNZTQbqvHFOO7TdfazW7uCXZFztJQnyY3Iws+OX/STivEtSNI46pmd3Bhv8Lz5Sf
 eALg==
X-Gm-Message-State: AOAM530T1cuLQn67OtBWFsXZUoT5Dj5nhgNmYeE0ZbM4W/hRnkoBhkWk
 mdtv7JD+/ZTHPfKGrNTrElP+89MFEB4=
X-Google-Smtp-Source: ABdhPJwm3FXnitONb/6iCtOrc71c+nAxB3Wx2dPX/7/FucvT5aQeHS+BIpX0XmP8WH44ejZUlUt3Vw==
X-Received: by 2002:a05:6a00:885:b0:510:950f:f787 with SMTP id
 q5-20020a056a00088500b00510950ff787mr8387517pfj.83.1653029591130; 
 Thu, 19 May 2022 23:53:11 -0700 (PDT)
Received: from voyager.base64.com.au (ip14.cor1.adl1.base64.com.au.
 [203.0.153.14]) by smtp.gmail.com with ESMTPSA id
 iz15-20020a170902ef8f00b001619b38701bsm4874120plb.72.2022.05.19.23.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 23:53:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Brian Swetland <swetland@frotz.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] hw/net: Add LiteEth model
Date: Fri, 20 May 2022 16:23:02 +0930
Message-Id: <20220520065302.715904-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

LiteX is a soft system-on-chip that targets FPGAs. LiteETH is a basic
network device that is commonly used in LiteX designs.

There is an upstream Linux kernel driver for this device and support in
various other firmware projects for it.

Co-developed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/net/liteeth.h |  56 ++++++++
 hw/net/liteeth.c         | 299 +++++++++++++++++++++++++++++++++++++++
 hw/net/Kconfig           |   3 +
 hw/net/meson.build       |   1 +
 hw/net/trace-events      |   6 +
 5 files changed, 365 insertions(+)
 create mode 100644 include/hw/net/liteeth.h
 create mode 100644 hw/net/liteeth.c

diff --git a/include/hw/net/liteeth.h b/include/hw/net/liteeth.h
new file mode 100644
index 000000000000..8abdfd46bc8e
--- /dev/null
+++ b/include/hw/net/liteeth.h
@@ -0,0 +1,56 @@
+/*
+ * LiteX Liteeth Ethernet controller
+ *
+ * Copyright (c) 2021, IBM Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef LITEETH_H
+#define LITEETH_H
+
+#include "net/net.h"
+#include "hw/sysbus.h"
+
+struct LiteEthState {
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+    MemoryRegion mmio_buf_container;
+    MemoryRegion mmio_buf;
+    AddressSpace mmio_buf_as;
+
+    qemu_irq irq;
+    NICState *nic;
+    NICConf conf;
+
+    /*
+     * Hardware configuration
+     *
+     * n slots, slot_size bytes each.
+     *
+     *  -----   <- rx_base
+     * |  1  |
+     * |  2  |
+     * |  .  |
+     * |  n  |
+     * |-----|  <- tx_base
+     * |  1  |
+     * |  2  |
+     * |  .  |
+     * |  n  |
+     *  -----
+     */
+    uint32_t rx_current;
+
+    uint32_t tx_slots;
+    uint32_t rx_slots;
+    uint32_t slot_size;
+
+    uint32_t regs[0x100 / 4];
+};
+
+#define TYPE_LITEETH "liteeth"
+OBJECT_DECLARE_SIMPLE_TYPE(LiteEthState, LITEETH)
+
+#endif
diff --git a/hw/net/liteeth.c b/hw/net/liteeth.c
new file mode 100644
index 000000000000..daea8a165337
--- /dev/null
+++ b/hw/net/liteeth.c
@@ -0,0 +1,299 @@
+/*
+ * LiteX Liteeth Ethernet controller
+ *
+ * Copyright (c) 2021, IBM Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/net/liteeth.h"
+#include "net/eth.h"
+#include "qemu/log.h"
+#include "qemu/units.h"
+#include "sysemu/dma.h"
+#include "trace.h"
+
+#define LITEETH_WRITER_SLOT       (0x00 / 4)
+#define LITEETH_WRITER_LENGTH     (0x04 / 4)
+#define LITEETH_WRITER_ERRORS     (0x08 / 4) /* backend FIFO errors */
+#define LITEETH_WRITER_EV_STATUS  (0x0C / 4) /* raw IRQ level bits */
+#define LITEETH_WRITER_EV_PENDING (0x10 / 4) /* to read and clear level */
+#define LITEETH_WRITER_EV_ENABLE  (0x14 / 4)
+#define LITEETH_READER_START      (0x18 / 4)
+#define LITEETH_READER_READY      (0x1C / 4)
+#define LITEETH_READER_LEVEL      (0x20 / 4)
+#define LITEETH_READER_SLOT       (0x24 / 4)
+#define LITEETH_READER_LENGTH     (0x28 / 4)
+#define LITEETH_READER_EV_STATUS  (0x2C / 4) /* raw IRQ level bits */
+#define LITEETH_READER_EV_PENDING (0x30 / 4)
+#define LITEETH_READER_EV_ENABLE  (0x34 / 4)
+#define LITEETH_PREAMBLE_CRC      (0x38 / 4) /* ??? */
+#define LITEETH_PREAMBLE_ERRORS   (0x3C / 4) /* ??? */
+#define LITEETH_CRC_ERRORS        (0x40 / 4) /* ??? */
+
+#define LITEETH_SLOT_SIZE         (2 * KiB)
+
+static void liteeth_update_irq(LiteEthState *s)
+{
+    bool level = s->regs[LITEETH_READER_EV_PENDING] ||
+        s->regs[LITEETH_WRITER_EV_PENDING];
+
+    qemu_set_irq(s->irq, level);
+}
+
+static hwaddr liteeth_rx_addr(LiteEthState *s)
+{
+    return s->rx_current * LITEETH_SLOT_SIZE;
+}
+
+static hwaddr liteeth_tx_addr(LiteEthState *s)
+{
+    hwaddr tx_offset = s->rx_slots * LITEETH_SLOT_SIZE;
+    uint8_t slot = s->regs[LITEETH_READER_SLOT];
+
+    return tx_offset + slot * LITEETH_SLOT_SIZE;
+}
+
+static void liteeth_xmit(LiteEthState *s)
+{
+    uint8_t buf[LITEETH_SLOT_SIZE];
+    uint16_t len = s->regs[LITEETH_READER_LENGTH];
+    hwaddr addr = liteeth_tx_addr(s);
+    MemTxResult result;
+
+    trace_liteeth_xmit(len, s->regs[LITEETH_READER_SLOT]);
+
+    assert(len <= LITEETH_SLOT_SIZE);
+
+    result = address_space_read(&s->mmio_buf_as, addr, MEMTXATTRS_UNSPECIFIED,
+                                buf, len);
+    if (result != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: failed to read packet @0x%"HWADDR_PRIx "\n",
+                      __func__, addr);
+        /* TODO: report TX errors ? */
+        return;
+    }
+
+    qemu_send_packet(qemu_get_queue(s->nic), buf, len);
+
+    if (s->regs[LITEETH_READER_EV_ENABLE]) {
+        s->regs[LITEETH_READER_EV_PENDING] = 1;
+    }
+}
+
+static bool liteeth_can_receive(NetClientState *nc)
+{
+    LiteEthState *s = LITEETH(qemu_get_nic_opaque(nc));
+    return s->regs[LITEETH_WRITER_EV_ENABLE];
+}
+
+static ssize_t liteeth_receive(NetClientState *nc, const uint8_t *buf,
+                               size_t len)
+{
+    LiteEthState *s = LITEETH(qemu_get_nic_opaque(nc));
+    hwaddr addr = liteeth_rx_addr(s);
+    MemTxResult result;
+
+    trace_liteeth_receive(len, s->rx_current);
+
+    if (len > LITEETH_SLOT_SIZE) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %zd bytes\n",
+                      __func__, len);
+        len = LITEETH_SLOT_SIZE;
+    }
+
+    /* Copy data into memory */
+    result = address_space_write(&s->mmio_buf_as, addr, MEMTXATTRS_UNSPECIFIED,
+                                 buf, len);
+    if (result != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: failed to write packet @0x%"HWADDR_PRIx "\n",
+                      __func__, addr);
+        return -1;
+    }
+
+    /* Update registers */
+    s->regs[LITEETH_WRITER_SLOT] = s->rx_current;
+    s->regs[LITEETH_WRITER_LENGTH] = len;
+
+    if (s->regs[LITEETH_WRITER_EV_ENABLE]) {
+        s->regs[LITEETH_WRITER_EV_PENDING] = 1;
+    }
+
+    s->rx_current = (s->rx_current + 1) % s->rx_slots;
+
+    liteeth_update_irq(s);
+    return len;
+}
+
+static void liteeth_reset(DeviceState *dev)
+{
+    LiteEthState *s = LITEETH(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->regs[LITEETH_READER_READY] = 1;
+
+    s->rx_current = 0;
+    qemu_set_irq(s->irq, 0);
+}
+
+static uint64_t liteeth_read(void *opaque, hwaddr addr, unsigned width)
+{
+    LiteEthState *s = LITEETH(opaque);
+    uint32_t reg = addr >> 2;
+    uint64_t val = s->regs[reg];
+
+    trace_liteeth_read(addr, val);
+
+    return val;
+}
+
+static void liteeth_write(void *opaque, hwaddr addr, uint64_t val,
+                         unsigned width)
+{
+    LiteEthState *s = LITEETH(opaque);
+    uint32_t reg = addr >> 2;
+
+    trace_liteeth_write(addr, val);
+
+    switch (reg) {
+    case LITEETH_READER_START:
+        if (s->regs[LITEETH_READER_EV_ENABLE]) {
+            s->regs[LITEETH_READER_READY] = 0;
+            liteeth_xmit(s);
+            s->regs[LITEETH_READER_READY] = 1;
+        }
+        if (liteeth_can_receive(qemu_get_queue(s->nic))) {
+            qemu_flush_queued_packets(qemu_get_queue(s->nic));
+        }
+        break;
+
+    case LITEETH_READER_EV_PENDING:
+    case LITEETH_WRITER_EV_PENDING:
+        s->regs[reg] = 0;
+        break;
+
+    case LITEETH_READER_LENGTH:
+        if (val > LITEETH_SLOT_SIZE) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: frame too big : %"PRIx64" bytes\n",
+                          __func__, val);
+            val = LITEETH_SLOT_SIZE;
+        }
+        s->regs[reg] = val;
+        break;
+    case LITEETH_READER_SLOT:
+        s->regs[reg] = val % s->tx_slots;
+        break;
+
+    case LITEETH_READER_READY:
+    case LITEETH_WRITER_LENGTH:
+    case LITEETH_WRITER_SLOT:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid write @%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+
+    default:
+        s->regs[reg] = val;
+    }
+
+    liteeth_update_irq(s);
+}
+
+static const MemoryRegionOps liteeth_ops = {
+    .read = liteeth_read,
+    .write = liteeth_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void liteeth_cleanup(NetClientState *nc)
+{
+    LiteEthState *s = LITEETH(qemu_get_nic_opaque(nc));
+
+    s->nic = NULL;
+}
+
+struct NetClientInfo net_liteeth_info = {
+    .type = NET_CLIENT_DRIVER_NIC,
+    .size = sizeof(NICState),
+    .can_receive = liteeth_can_receive,
+    .receive = liteeth_receive,
+    .cleanup = liteeth_cleanup,
+};
+
+static void liteeth_realize(DeviceState *dev, Error **errp)
+{
+    LiteEthState *s = LITEETH(dev);
+    Error *err = NULL;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    uint64_t membuf_size = (s->tx_slots + s->rx_slots) * LITEETH_SLOT_SIZE;
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    /* MAC registers */
+    memory_region_init_io(&s->mmio, OBJECT(s), &liteeth_ops, s,
+                          TYPE_LITEETH "-regs", 0x44);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+
+    /* Packet buffers */
+    memory_region_init(&s->mmio_buf_container, OBJECT(s),
+                       TYPE_LITEETH "-buf-container", membuf_size);
+    sysbus_init_mmio(sbd, &s->mmio_buf_container);
+
+    memory_region_init_ram(&s->mmio_buf, OBJECT(s), TYPE_LITEETH "-buf",
+                           membuf_size, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&s->mmio_buf_container, 0x0, &s->mmio_buf);
+
+    address_space_init(&s->mmio_buf_as, &s->mmio_buf, TYPE_LITEETH "-buf");
+
+
+    qemu_macaddr_default_if_unset(&s->conf.macaddr);
+    s->nic = qemu_new_nic(&net_liteeth_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), dev->id, s);
+    qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
+}
+
+static Property liteeth_properties[] = {
+    DEFINE_PROP_UINT32("tx-slots", struct LiteEthState, tx_slots, 2),
+    DEFINE_PROP_UINT32("rx-slots", struct LiteEthState, rx_slots, 2),
+    DEFINE_NIC_PROPERTIES(struct LiteEthState, conf),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void liteeth_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc    = "LiteX Ethernet";
+    dc->realize = liteeth_realize;
+    dc->reset = liteeth_reset;
+    device_class_set_props(dc, liteeth_properties);
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+}
+
+static const TypeInfo liteeth_info = {
+    .name = TYPE_LITEETH,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(struct LiteEthState),
+    .class_init = liteeth_class_init,
+};
+
+static void liteeth_register_types(void)
+{
+    type_register_static(&liteeth_info);
+}
+
+type_init(liteeth_register_types);
diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 6d795ec75256..e2c0f43f96b6 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -61,6 +61,9 @@ config LAN9118
     bool
     select PTIMER
 
+config LITEETH
+    bool
+
 config NE2000_ISA
     bool
     default y
diff --git a/hw/net/meson.build b/hw/net/meson.build
index ebac26154261..c8197685c603 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -33,6 +33,7 @@ softmmu_ss.add(when: 'CONFIG_STELLARIS_ENET', if_true: files('stellaris_enet.c')
 softmmu_ss.add(when: 'CONFIG_LANCE', if_true: files('lance.c'))
 softmmu_ss.add(when: 'CONFIG_LASI_I82596', if_true: files('lasi_i82596.c'))
 softmmu_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
+softmmu_ss.add(when: 'CONFIG_LITEETH', if_true: files('liteeth.c'))
 softmmu_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
 softmmu_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))
 softmmu_ss.add(when: 'CONFIG_SUNGEM', if_true: files('sungem.c'))
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 4c0ec3fda167..30400401359b 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -19,6 +19,12 @@ mdio_bitbang(bool mdc, bool mdio, int state, uint16_t cnt, unsigned int drive) "
 lance_mem_readw(uint64_t addr, uint32_t ret) "addr=0x%"PRIx64"val=0x%04x"
 lance_mem_writew(uint64_t addr, uint32_t val) "addr=0x%"PRIx64"val=0x%04x"
 
+# liteeth.c
+liteeth_read(uint64_t addr, uint64_t data)  "@0x%" PRIx64 " value=0x%"PRIx64
+liteeth_write(uint64_t addr, uint64_t data) "@0x%" PRIx64 " value=0x%"PRIx64
+liteeth_xmit(uint16_t len, uint8_t slot) "len=%d slot=%d"
+liteeth_receive(uint16_t len, uint8_t slot) "len=%d slot=%d"
+
 # mipsnet.c
 mipsnet_send(uint32_t size) "sending len=%u"
 mipsnet_receive(uint32_t size) "receiving len=%u"
-- 
2.35.1


