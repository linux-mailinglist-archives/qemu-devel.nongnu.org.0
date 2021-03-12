Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED944338AD8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:01:43 +0100 (CET)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfY5-000321-OR
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKfU1-0000Lo-Te; Fri, 12 Mar 2021 05:57:29 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKfTz-0003VL-Qr; Fri, 12 Mar 2021 05:57:29 -0500
Received: by mail-pl1-x636.google.com with SMTP id u18so11735357plc.12;
 Fri, 12 Mar 2021 02:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bdcJqxFfTnrdI3dfSKKaKUtkDcGdrZjqxk3hXGCYHWg=;
 b=kEIRTBzz6UEUWoRNKDjA+Xo9jKYQa0RSRMVNv7M+G3Ow81IJsjP4bm5pDTGedA0cBG
 3+YNiYfr1PeZWQnI0Y0RC8VQdLiGVB2pD3NTebOeMpcs8VIy5ZQ0B03TkvdTcukljDaD
 G9r0037+SYe0XXOBErQdFTA+8RjyjGMSoBA+nCt7E0PodWAH7ExXQpfgPJvNA4sjVmHL
 ZBPdLFKqBB9XOq2MJ2gmIEzWuULVWiOvkYeqnlHLmAlkuxPtjVotKe5VnokKKGaeDoEo
 Iowp+i32YKNGdryvkVy37mIvXkoY5oKMgjj6TX2gCpWPmAm981MCrh54ZMKgNpXoCkFk
 xE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bdcJqxFfTnrdI3dfSKKaKUtkDcGdrZjqxk3hXGCYHWg=;
 b=ndjaSTxnRfGDgAN5OTZJ3QWIhGNG4eSvLZiPJ7ygklqKp5d81OK+FV3uGWznawsXvM
 bZE5U1LgEKxBmgYdsRY3ehKcjZnhfyspaiAj/1M2vGwzK8eyOBPt7jtNNLgbxUcY4Dno
 LvOh0s1X5Bwng5zJm04LZoPHZ9jqlAhePCWfVDET5UuasjRRiDrBFkDTrKw/jiOGsDRT
 HUu4CU53sV10RF4UDsVh/k9vL+eC+fL4X6kYL+HNAv9qW/DLVISKZMZyv7cfUDOYXUEk
 UbVKlA8h7VyVvpuB7PMqZ8kqJVtFZLyBOBoh2hnjuiE6I2G6OtibhPAZqgztt5lV1cD3
 odWQ==
X-Gm-Message-State: AOAM533dGbcWe3QO62kzT4J6Itm1tnJa7YDPLwBYrny+qQHioXGatbth
 5G/Vop9RzLVdKCf7XdTp9HY=
X-Google-Smtp-Source: ABdhPJzuxjbCzqBIb9Tz8kgaqmVebBdZj/MJhjQcmvRu5p7F0+ukz33EGHqnN2jQyuncqp+l5/mHYw==
X-Received: by 2002:a17:902:ed88:b029:e3:6b9f:9ac3 with SMTP id
 e8-20020a170902ed88b02900e36b9f9ac3mr13434387plj.72.1615546644711; 
 Fri, 12 Mar 2021 02:57:24 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id p25sm5326793pfe.100.2021.03.12.02.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:57:23 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v3 1/3] hw: Model ASPEED's Hash and Crypto Engine
Date: Fri, 12 Mar 2021 21:27:09 +1030
Message-Id: <20210312105711.551423-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312105711.551423-1-joel@jms.id.au>
References: <20210312105711.551423-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
SHA2, RSA and other cryptographic algorithms.

This initial model implements a subset of the device's functionality;
currently only direct access (non-scatter gather) hashing.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
v3:
 - rebase on upstream to fix meson.build conflict
v2:
 - reorder register defines
 - mask src/dest/len registers according to hardware
---
 include/hw/misc/aspeed_hace.h |  33 ++++
 hw/misc/aspeed_hace.c         | 312 ++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |   1 +
 3 files changed, 346 insertions(+)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
new file mode 100644
index 000000000000..e1fce670ef9e
--- /dev/null
+++ b/include/hw/misc/aspeed_hace.h
@@ -0,0 +1,33 @@
+/*
+ * ASPEED Hash and Crypto Engine
+ *
+ * Copyright (C) 2021 IBM Corp.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ASPEED_HACE_H
+#define ASPEED_HACE_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_HACE "aspeed.hace"
+#define ASPEED_HACE(obj) OBJECT_CHECK(AspeedHACEState, (obj), TYPE_ASPEED_HACE)
+
+#define ASPEED_HACE_NR_REGS (0x64 >> 2)
+
+typedef struct AspeedHACEState {
+    /* <private> */
+    SysBusDevice parent;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_HACE_NR_REGS];
+
+    MemoryRegion *dram_mr;
+    AddressSpace dram_as;
+} AspeedHACEState;
+
+#endif /* _ASPEED_HACE_H_ */
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
new file mode 100644
index 000000000000..3d02fae2dd62
--- /dev/null
+++ b/hw/misc/aspeed_hace.c
@@ -0,0 +1,312 @@
+/*
+ * ASPEED Hash and Crypto Engine
+ *
+ * Copyright (C) 2021 IBM Corp.
+ *
+ * Joel Stanley <joel@jms.id.au>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "hw/misc/aspeed_hace.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "crypto/hash.h"
+#include "hw/qdev-properties.h"
+#include "hw/irq.h"
+
+#define R_CRYPT_CMD     (0x10 / 4)
+
+#define R_STATUS        (0x1c / 4)
+#define HASH_IRQ        BIT(9)
+#define CRYPT_IRQ       BIT(12)
+#define TAG_IRQ         BIT(15)
+
+#define R_HASH_SRC      (0x20 / 4)
+#define R_HASH_DEST     (0x24 / 4)
+#define R_HASH_SRC_LEN  (0x2c / 4)
+
+#define R_HASH_CMD      (0x30 / 4)
+/* Hash algorithim selection */
+#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))
+#define  HASH_ALGO_MD5                  0
+#define  HASH_ALGO_SHA1                 BIT(5)
+#define  HASH_ALGO_SHA224               BIT(6)
+#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))
+#define  HASH_ALGO_SHA512_SERIES        (BIT(5) | BIT(6))
+/* SHA512 algorithim selection */
+#define  SHA512_HASH_ALGO_MASK          (BIT(10) | BIT(11) | BIT(12))
+#define  HASH_ALGO_SHA512_SHA512        0
+#define  HASH_ALGO_SHA512_SHA384        BIT(10)
+#define  HASH_ALGO_SHA512_SHA256        BIT(11)
+#define  HASH_ALGO_SHA512_SHA224        (BIT(10) | BIT(11))
+/* HMAC modes */
+#define  HASH_HMAC_MASK                 (BIT(7) | BIT(8))
+#define  HASH_DIGEST                    0
+#define  HASH_DIGEST_HMAC               BIT(7)
+#define  HASH_DIGEST_ACCUM              BIT(8)
+#define  HASH_HMAC_KEY                  (BIT(7) | BIT(8))
+/* Cascscaed operation modes */
+#define  HASH_ONLY                      0
+#define  HASH_ONLY2                     BIT(0)
+#define  HASH_CRYPT_THEN_HASH           BIT(1)
+#define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
+/* Other cmd bits */
+#define  HASH_IRQ_EN                    BIT(9)
+#define  HASH_SG_EN                     BIT(18)
+
+
+static int do_hash_operation(AspeedHACEState *s, int algo)
+{
+    hwaddr src, len, dest;
+    uint8_t *digest_buf = NULL;
+    size_t digest_len = 0;
+    char *src_buf;
+    int rc;
+
+    src = 0x80000000 | s->regs[R_HASH_SRC];
+    len = s->regs[R_HASH_SRC_LEN];
+    dest = 0x80000000 | s->regs[R_HASH_DEST];
+
+    src_buf = address_space_map(&s->dram_as, src, &len, false,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (!src_buf) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map dram\n", __func__);
+        return -EACCES;
+    }
+
+    rc = qcrypto_hash_bytes(algo, src_buf, len, &digest_buf, &digest_len,
+                            &error_fatal);
+    if (rc < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
+        return rc;
+    }
+
+    rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
+                             digest_buf, digest_len);
+    if (rc) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: address space write failed\n", __func__);
+    }
+    g_free(digest_buf);
+
+    address_space_unmap(&s->dram_as, src_buf, len, false, len);
+
+    /*
+     * Set status bits to indicate completion. Testing shows hardware sets
+     * these irrespective of HASH_IRQ_EN.
+     */
+    s->regs[R_STATUS] |= HASH_IRQ;
+
+    return 0;
+}
+
+
+static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    AspeedHACEState *s = ASPEED_HACE(opaque);
+
+    addr >>= 2;
+
+    if (addr >= ASPEED_HACE_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr << 2);
+        return 0;
+    }
+
+    return s->regs[addr];
+}
+
+static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
+                              unsigned int size)
+{
+    AspeedHACEState *s = ASPEED_HACE(opaque);
+
+    addr >>= 2;
+
+    if (addr >= ASPEED_HACE_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr << 2);
+        return;
+    }
+
+    switch (addr) {
+    case R_STATUS:
+        if (data & HASH_IRQ) {
+            data &= ~HASH_IRQ;
+
+            if (s->regs[addr] & HASH_IRQ) {
+                qemu_irq_lower(s->irq);
+            }
+        }
+        break;
+    case R_HASH_SRC:
+        data &= 0x7FFFFFFF;
+        break;
+    case R_HASH_DEST:
+        data &= 0x7FFFFFF8;
+        break;
+    case R_HASH_SRC_LEN:
+        data &= 0x0FFFFFFF;
+        break;
+    case R_HASH_CMD: {
+        int algo = -1;
+        if ((data & HASH_HMAC_MASK)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: HMAC engine command mode %ld not implemented",
+                          __func__, (data & HASH_HMAC_MASK) >> 8);
+        }
+        if (data & HASH_SG_EN) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Hash scatter gather mode not implemented",
+                          __func__);
+        }
+        if (data & BIT(1)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Cascaded mode not implemented",
+                          __func__);
+        }
+        switch (data & HASH_ALGO_MASK) {
+        case HASH_ALGO_MD5:
+            algo = QCRYPTO_HASH_ALG_MD5;
+            break;
+        case HASH_ALGO_SHA1:
+            algo = QCRYPTO_HASH_ALG_SHA1;
+            break;
+        case HASH_ALGO_SHA224:
+            algo = QCRYPTO_HASH_ALG_SHA224;
+            break;
+        case HASH_ALGO_SHA256:
+            algo = QCRYPTO_HASH_ALG_SHA256;
+            break;
+        case HASH_ALGO_SHA512_SERIES:
+            switch (data & SHA512_HASH_ALGO_MASK) {
+            case HASH_ALGO_SHA512_SHA512:
+                algo = QCRYPTO_HASH_ALG_SHA512;
+                break;
+            case HASH_ALGO_SHA512_SHA384:
+                algo = QCRYPTO_HASH_ALG_SHA384;
+                break;
+            case HASH_ALGO_SHA512_SHA256:
+                algo = QCRYPTO_HASH_ALG_SHA256;
+                break;
+            case HASH_ALGO_SHA512_SHA224:
+                algo = QCRYPTO_HASH_ALG_SHA224;
+                break;
+            default:
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: Invalid sha512 hash algorithm selection 0x%03lx\n",
+                        __func__, data & SHA512_HASH_ALGO_MASK);
+                break;
+            }
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid hash algorithm selection 0x%03lx\n",
+                      __func__, data & HASH_ALGO_MASK);
+            break;
+        }
+        if (algo >= 0) {
+            do_hash_operation(s, algo);
+
+            if (data & HASH_IRQ_EN) {
+                qemu_irq_raise(s->irq);
+            }
+        }
+
+        break;
+    }
+    case R_CRYPT_CMD:
+        qemu_log_mask(LOG_UNIMP, "%s: Crypt commands not implemented\n",
+                       __func__);
+        break;
+    default:
+        break;
+    }
+
+    s->regs[addr] = data;
+}
+
+static const MemoryRegionOps aspeed_hace_ops = {
+    .read = aspeed_hace_read,
+    .write = aspeed_hace_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void aspeed_hace_reset(DeviceState *dev)
+{
+    struct AspeedHACEState *s = ASPEED_HACE(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void aspeed_hace_realize(DeviceState *dev, Error **errp)
+{
+    AspeedHACEState *s = ASPEED_HACE(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_hace_ops, s,
+            TYPE_ASPEED_HACE, 0x1000);
+
+    if (!s->dram_mr) {
+        error_setg(errp, TYPE_ASPEED_HACE ": 'dram' link not set");
+        return;
+    }
+
+    address_space_init(&s->dram_as, s->dram_mr, "dram");
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static Property aspeed_hace_properties[] = {
+    DEFINE_PROP_LINK("dram", AspeedHACEState, dram_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+
+static const VMStateDescription vmstate_aspeed_hace = {
+    .name = TYPE_ASPEED_HACE,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedHACEState, ASPEED_HACE_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void aspeed_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_hace_realize;
+    dc->reset = aspeed_hace_reset;
+    device_class_set_props(dc, aspeed_hace_properties);
+    dc->desc = "Aspeed Hash and Crypto Engine",
+    dc->vmsd = &vmstate_aspeed_hace;
+}
+
+static const TypeInfo aspeed_hace_info = {
+    .name = TYPE_ASPEED_HACE,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedHACEState),
+    .class_init = aspeed_hace_class_init,
+};
+
+static void aspeed_hace_register_types(void)
+{
+    type_register_static(&aspeed_hace_info);
+}
+
+type_init(aspeed_hace_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 00356cf12ec7..23b61d55f62e 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -104,6 +104,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+  'aspeed_hace.c',
   'aspeed_lpc.c',
   'aspeed_scu.c',
   'aspeed_sdmc.c',
-- 
2.30.1


