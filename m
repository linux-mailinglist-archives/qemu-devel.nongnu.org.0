Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8213590CB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 02:09:11 +0200 (CEST)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUehy-0003eY-IQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 20:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUecG-0001HT-Tc; Thu, 08 Apr 2021 20:03:16 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUecE-0005FZ-Nu; Thu, 08 Apr 2021 20:03:16 -0400
Received: by mail-pf1-x432.google.com with SMTP id d124so2997241pfa.13;
 Thu, 08 Apr 2021 17:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+C/wJefbfy2aDXpfyY2NDyo6oSSPbSeGWL4PDsdMvp4=;
 b=nFQMTtQxNY9ngbMN3qEXhkAptwIQrXrr9MN3is+h6PfqtipTmpLKFOwD/KV9D5YdUo
 LPV7KeLPqi1e2yrKUdGVhbk/TwOl8HflltfKq0EAralPCKQcmvgHlfySwPmMvYbAWWZ8
 WV1TWJ6dCp7gkJ42mbXQVgocEwP3TtShM7Nt25w3wLi9eKBPiimkktXTP+TW00ni4Ymk
 FSfwm6cTXqWHYNGuR+uR1GT0sFG1y7XJzT5qcnV7BaN7aEOkvcheYhcTAsdkEVHvj0NX
 0kKJTcCzt+0OaZ1Qh4+ZH6OO1/Orh66eZ/Tv9IcTX/yzhtxYA6OLoFHqVMWoHHhgiMAs
 m+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+C/wJefbfy2aDXpfyY2NDyo6oSSPbSeGWL4PDsdMvp4=;
 b=O/qf6elBALKhFixBlNLZ8+8b6IolegtmFu7Y1kzbtzJK9/Nrz6APZ3iq/Jf11FnjMn
 GEJDVqW0di0QUTcyeazAX7TD72wujcSVT8WFU4gOeevwl/zGGpa0FXi0xKz7B6f4lRI5
 AJCVCVgIRXXeO9fV7Rqp4Va83QrF+KZ6dcpyXX7tic81kgAPwNUDN75tDA3uubPj0TUq
 YU++PeoxxbSsD+aT0aAXiaPHKLQePOlPj6PK0vjDnfBXOppBjmcF1owqcPBIKiEYdK1I
 Bo0ZRMvvedHLZOw92cZ4c/sgDc9FI9y3gWi5ZEAz5Qfe4INPkhhsn0JzYjS1BiHsHr2z
 cd0w==
X-Gm-Message-State: AOAM531BWhPgbbWibXlc4dobZVIch8lqvFa5jBoVjkFEkqFDPc0S2Oms
 Guxyw4rN+tmBAPf/621C0V4=
X-Google-Smtp-Source: ABdhPJxb5MJpC0UYTIOMX0oZIuZYKOJJjdo1yHXtgGKmFZC/LfRJfkP21PmvkSseGPHi93FqwjCgjw==
X-Received: by 2002:a63:6d83:: with SMTP id i125mr10131263pgc.12.1617926592958; 
 Thu, 08 Apr 2021 17:03:12 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id f17sm393406pfk.184.2021.04.08.17.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 17:03:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v5 1/3] hw: Model ASPEED's Hash and Crypto Engine
Date: Fri,  9 Apr 2021 09:32:51 +0930
Message-Id: <20210409000253.1475587-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409000253.1475587-1-joel@jms.id.au>
References: <20210409000253.1475587-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
SHA2, RSA and other cryptographic algorithms.

This initial model implements a subset of the device's functionality;
currently only MD5/SHA hashing, and on the ast2600's scatter gather
engine.

Co-developed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
 - rebase on upstream to fix meson.build conflict
v2:
 - reorder register defines
 - mask src/dest/len registers according to hardware
v4:
 - Fix typos in comments
 - Remove sdram base address; new memory region fixes mean this is not
   required
 - Use PRIx64
 - Add Object Classes for soc familiy specific features
 - Convert big switch statement to a lookup in a struct
v5:
 - Support scatter gather mode
---
 docs/system/arm/aspeed.rst    |   1 +
 include/hw/misc/aspeed_hace.h |  43 ++++
 hw/misc/aspeed_hace.c         | 389 ++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |   1 +
 4 files changed, 434 insertions(+)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index d1fb8f25b39c..23a1468cd175 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -49,6 +49,7 @@ Supported devices
  * Ethernet controllers
  * Front LEDs (PCA9552 on I2C bus)
  * LPC Peripheral Controller (a subset of subdevices are supported)
+ * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
 
 
 Missing devices
diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
new file mode 100644
index 000000000000..94d5ada95fa2
--- /dev/null
+++ b/include/hw/misc/aspeed_hace.h
@@ -0,0 +1,43 @@
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
+#define TYPE_ASPEED_AST2400_HACE TYPE_ASPEED_HACE "-ast2400"
+#define TYPE_ASPEED_AST2500_HACE TYPE_ASPEED_HACE "-ast2500"
+#define TYPE_ASPEED_AST2600_HACE TYPE_ASPEED_HACE "-ast2600"
+OBJECT_DECLARE_TYPE(AspeedHACEState, AspeedHACEClass, ASPEED_HACE)
+
+#define ASPEED_HACE_NR_REGS (0x64 >> 2)
+
+struct AspeedHACEState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_HACE_NR_REGS];
+
+    MemoryRegion *dram_mr;
+    AddressSpace dram_as;
+};
+
+
+struct AspeedHACEClass {
+    SysBusDeviceClass parent_class;
+
+    uint32_t src_mask;
+    uint32_t dest_mask;
+    uint32_t hash_mask;
+};
+
+#endif /* _ASPEED_HACE_H_ */
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
new file mode 100644
index 000000000000..be7f99ea7947
--- /dev/null
+++ b/hw/misc/aspeed_hace.c
@@ -0,0 +1,389 @@
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
+/* Hash algorithm selection */
+#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))
+#define  HASH_ALGO_MD5                  0
+#define  HASH_ALGO_SHA1                 BIT(5)
+#define  HASH_ALGO_SHA224               BIT(6)
+#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))
+#define  HASH_ALGO_SHA512_SERIES        (BIT(5) | BIT(6))
+/* SHA512 algorithm selection */
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
+/* Cascaded operation modes */
+#define  HASH_ONLY                      0
+#define  HASH_ONLY2                     BIT(0)
+#define  HASH_CRYPT_THEN_HASH           BIT(1)
+#define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
+/* Other cmd bits */
+#define  HASH_IRQ_EN                    BIT(9)
+#define  HASH_SG_EN                     BIT(18)
+/* Scatter-gather data list */
+#define SG_LIST_LEN_SIZE                4
+#define SG_LIST_LEN_MASK                0x0FFFFFFF
+#define SG_LIST_LEN_LAST                BIT(31)
+#define SG_LIST_ADDR_SIZE               4
+#define SG_LIST_ADDR_MASK               0x7FFFFFFF
+#define SG_LIST_ENTRY_SIZE              (SG_LIST_LEN_SIZE + SG_LIST_ADDR_SIZE)
+#define ASPEED_HACE_MAX_SG              256        /* max number of entries */
+
+static const struct {
+    uint32_t mask;
+    QCryptoHashAlgorithm algo;
+} hash_algo_map[] = {
+    { HASH_ALGO_MD5, QCRYPTO_HASH_ALG_MD5 },
+    { HASH_ALGO_SHA1, QCRYPTO_HASH_ALG_SHA1 },
+    { HASH_ALGO_SHA224, QCRYPTO_HASH_ALG_SHA224 },
+    { HASH_ALGO_SHA256, QCRYPTO_HASH_ALG_SHA256 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA512, QCRYPTO_HASH_ALG_SHA512 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA384, QCRYPTO_HASH_ALG_SHA384 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA256, QCRYPTO_HASH_ALG_SHA256 },
+};
+
+static int hash_algo_lookup(uint32_t reg)
+{
+    int i;
+
+    reg &= HASH_ALGO_MASK | SHA512_HASH_ALGO_MASK;
+
+    for (i = 0; i < ARRAY_SIZE(hash_algo_map); i++) {
+        if (reg == hash_algo_map[i].mask) {
+            return hash_algo_map[i].algo;
+        }
+    }
+
+    return -1;
+}
+
+static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
+{
+    struct iovec iov[ASPEED_HACE_MAX_SG];
+    g_autofree uint8_t *digest_buf;
+    size_t digest_len = 0;
+    int i;
+
+    if (sg_mode) {
+        uint32_t len = 0;
+
+        for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
+            uint32_t addr, src;
+
+            if (i == ASPEED_HACE_MAX_SG) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "aspeed_hace: guest failed to set end of sg list marker\n");
+                break;
+            }
+
+            src = s->regs[R_HASH_SRC] + (i * SG_LIST_ENTRY_SIZE);
+
+            len = address_space_ldl_le(&s->dram_as, src,
+                                       MEMTXATTRS_UNSPECIFIED, NULL);
+
+            addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
+                                        MEMTXATTRS_UNSPECIFIED, NULL);
+            addr &= SG_LIST_ADDR_MASK;
+
+            iov[i].iov_len = len & SG_LIST_LEN_MASK;
+            iov[i].iov_base = address_space_map(&s->dram_as,
+                                                addr,
+                                                &iov[i].iov_len, false,
+                                                MEMTXATTRS_UNSPECIFIED);
+        }
+    } else {
+        hwaddr len = s->regs[R_HASH_SRC_LEN];
+
+        iov[0].iov_len = len;
+        iov[0].iov_base = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
+                                            &len, false,
+                                            MEMTXATTRS_UNSPECIFIED);
+        i = 1;
+    }
+
+    if (qcrypto_hash_bytesv(algo, iov, i, &digest_buf, &digest_len, NULL) < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
+        return;
+    }
+
+    if (address_space_write(&s->dram_as, s->regs[R_HASH_DEST],
+                            MEMTXATTRS_UNSPECIFIED,
+                            digest_buf, digest_len)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "aspeed_hace: address space write failed\n");
+    }
+
+    for (; i > 0; i--) {
+        address_space_unmap(&s->dram_as, iov[i - 1].iov_base,
+                            iov[i - 1].iov_len, false,
+                            iov[i - 1].iov_len);
+    }
+
+    /*
+     * Set status bits to indicate completion. Testing shows hardware sets
+     * these irrespective of HASH_IRQ_EN.
+     */
+    s->regs[R_STATUS] |= HASH_IRQ;
+}
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
+    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
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
+        data &= ahc->src_mask;
+        break;
+    case R_HASH_DEST:
+        data &= ahc->dest_mask;
+        break;
+    case R_HASH_SRC_LEN:
+        data &= 0x0FFFFFFF;
+        break;
+    case R_HASH_CMD: {
+        int algo;
+        data &= ahc->hash_mask;
+
+        if ((data & HASH_HMAC_MASK)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: HMAC engine command mode %"PRIx64" not implemented",
+                          __func__, (data & HASH_HMAC_MASK) >> 8);
+        }
+        if (data & BIT(1)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Cascaded mode not implemented",
+                          __func__);
+        }
+        algo = hash_algo_lookup(data);
+        if (algo < 0) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
+                        __func__, data & ahc->hash_mask);
+                break;
+        }
+        do_hash_operation(s, algo, data & HASH_SG_EN);
+
+        if (data & HASH_IRQ_EN) {
+            qemu_irq_raise(s->irq);
+        }
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
+    dc->vmsd = &vmstate_aspeed_hace;
+}
+
+static const TypeInfo aspeed_hace_info = {
+    .name = TYPE_ASPEED_HACE,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedHACEState),
+    .class_init = aspeed_hace_class_init,
+    .class_size = sizeof(AspeedHACEClass)
+};
+
+static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
+
+    dc->desc = "AST2400 Hash and Crypto Engine";
+
+    ahc->src_mask = 0x0FFFFFFF;
+    ahc->dest_mask = 0x0FFFFFF8;
+    ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
+}
+
+static const TypeInfo aspeed_ast2400_hace_info = {
+    .name = TYPE_ASPEED_AST2400_HACE,
+    .parent = TYPE_ASPEED_HACE,
+    .class_init = aspeed_ast2400_hace_class_init,
+};
+
+static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
+
+    dc->desc = "AST2500 Hash and Crypto Engine";
+
+    ahc->src_mask = 0x3fffffff;
+    ahc->dest_mask = 0x3ffffff8;
+    ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
+}
+
+static const TypeInfo aspeed_ast2500_hace_info = {
+    .name = TYPE_ASPEED_AST2500_HACE,
+    .parent = TYPE_ASPEED_HACE,
+    .class_init = aspeed_ast2500_hace_class_init,
+};
+
+static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
+
+    dc->desc = "AST2600 Hash and Crypto Engine";
+
+    ahc->src_mask = 0x7FFFFFFF;
+    ahc->dest_mask = 0x7FFFFFF8;
+    ahc->hash_mask = 0x00147FFF;
+}
+
+static const TypeInfo aspeed_ast2600_hace_info = {
+    .name = TYPE_ASPEED_AST2600_HACE,
+    .parent = TYPE_ASPEED_HACE,
+    .class_init = aspeed_ast2600_hace_class_init,
+};
+
+static void aspeed_hace_register_types(void)
+{
+    type_register_static(&aspeed_ast2400_hace_info);
+    type_register_static(&aspeed_ast2500_hace_info);
+    type_register_static(&aspeed_ast2600_hace_info);
+    type_register_static(&aspeed_hace_info);
+}
+
+type_init(aspeed_hace_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 21034dc60a81..1e7b8b064bd1 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -109,6 +109,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+  'aspeed_hace.c',
   'aspeed_lpc.c',
   'aspeed_scu.c',
   'aspeed_sdmc.c',
-- 
2.30.2


