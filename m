Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542F35732B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:27:09 +0200 (CEST)
Received: from localhost ([::1]:48600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBxM-0002ZS-3e
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnj-0007Zc-6P; Wed, 07 Apr 2021 13:17:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnf-0006iH-93; Wed, 07 Apr 2021 13:17:10 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H622r101780; Wed, 7 Apr 2021 13:16:51 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37sd1a89sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:50 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HCZgA015031;
 Wed, 7 Apr 2021 17:16:48 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 37rvc5gfsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGkMf41615850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE167A4040;
 Wed,  7 Apr 2021 17:16:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89C46A404D;
 Wed,  7 Apr 2021 17:16:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A2D9F2200C7;
 Wed,  7 Apr 2021 19:16:44 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 06/24] hw: Model ASPEED's Hash and Crypto Engine
Date: Wed,  7 Apr 2021 19:16:19 +0200
Message-Id: <20210407171637.777743-7-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zn7CsHI1AAxXBC3iWLe9NFSSLdO-UGva
X-Proofpoint-ORIG-GUID: Zn7CsHI1AAxXBC3iWLe9NFSSLdO-UGva
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1034 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
SHA2, RSA and other cryptographic algorithms.

This initial model implements a subset of the device's functionality;
currently only direct access (non-scatter gather) hashing.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[ clg : minor checkpatch fixes ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210324070955.125941-2-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_hace.h |  43 ++++
 hw/misc/aspeed_hace.c         | 359 ++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |   1 +
 3 files changed, 403 insertions(+)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.=
h
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
index 000000000000..6e5b447a4835
--- /dev/null
+++ b/hw/misc/aspeed_hace.c
@@ -0,0 +1,359 @@
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
+
+static const struct {
+    uint32_t mask;
+    QCryptoHashAlgorithm algo;
+} hash_algo_map[] =3D {
+    { HASH_ALGO_MD5, QCRYPTO_HASH_ALG_MD5 },
+    { HASH_ALGO_SHA1, QCRYPTO_HASH_ALG_SHA1 },
+    { HASH_ALGO_SHA224, QCRYPTO_HASH_ALG_SHA224 },
+    { HASH_ALGO_SHA256, QCRYPTO_HASH_ALG_SHA256 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA512, QCRYPTO_HASH_AL=
G_SHA512 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA384, QCRYPTO_HASH_AL=
G_SHA384 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA256, QCRYPTO_HASH_AL=
G_SHA256 },
+};
+
+static int hash_algo_lookup(uint32_t mask)
+{
+    int i;
+
+    for (i =3D 0; i < ARRAY_SIZE(hash_algo_map); i++) {
+        if (mask =3D=3D hash_algo_map[i].mask) {
+            return hash_algo_map[i].algo;
+        }
+    }
+
+    return -1;
+}
+
+static int do_hash_operation(AspeedHACEState *s, int algo)
+{
+    hwaddr src, len, dest;
+    uint8_t *digest_buf =3D NULL;
+    size_t digest_len =3D 0;
+    char *src_buf;
+    int rc;
+
+    src =3D s->regs[R_HASH_SRC];
+    len =3D s->regs[R_HASH_SRC_LEN];
+    dest =3D s->regs[R_HASH_DEST];
+
+    src_buf =3D address_space_map(&s->dram_as, src, &len, false,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (!src_buf) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map dram\n", __fun=
c__);
+        return -EACCES;
+    }
+
+    rc =3D qcrypto_hash_bytes(algo, src_buf, len, &digest_buf, &digest_l=
en,
+                            &error_fatal);
+    if (rc < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__)=
;
+        return rc;
+    }
+
+    rc =3D address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED=
,
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
+     * Set status bits to indicate completion. Testing shows hardware se=
ts
+     * these irrespective of HASH_IRQ_EN.
+     */
+    s->regs[R_STATUS] |=3D HASH_IRQ;
+
+    return 0;
+}
+
+
+static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int=
 size)
+{
+    AspeedHACEState *s =3D ASPEED_HACE(opaque);
+
+    addr >>=3D 2;
+
+    if (addr >=3D ASPEED_HACE_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx=
 "\n",
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
+    AspeedHACEState *s =3D ASPEED_HACE(opaque);
+    AspeedHACEClass *ahc =3D ASPEED_HACE_GET_CLASS(s);
+
+    addr >>=3D 2;
+
+    if (addr >=3D ASPEED_HACE_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRI=
x "\n",
+                      __func__, addr << 2);
+        return;
+    }
+
+    switch (addr) {
+    case R_STATUS:
+        if (data & HASH_IRQ) {
+            data &=3D ~HASH_IRQ;
+
+            if (s->regs[addr] & HASH_IRQ) {
+                qemu_irq_lower(s->irq);
+            }
+        }
+        break;
+    case R_HASH_SRC:
+        data &=3D ahc->src_mask;
+        break;
+    case R_HASH_DEST:
+        data &=3D ahc->dest_mask;
+        break;
+    case R_HASH_SRC_LEN:
+        data &=3D 0x0FFFFFFF;
+        break;
+    case R_HASH_CMD: {
+        int algo =3D -1;
+        if ((data & HASH_HMAC_MASK)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: HMAC engine command mode %"PRIx64" not im=
plemented",
+                          __func__, (data & HASH_HMAC_MASK) >> 8);
+        }
+        if (data & HASH_SG_EN) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Hash scatter gather mode not implemented"=
,
+                          __func__);
+        }
+        if (data & BIT(1)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Cascaded mode not implemented",
+                          __func__);
+        }
+        algo =3D hash_algo_lookup(data & ahc->hash_mask);
+        if (algo < 0) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: Invalid hash algorithm selection 0x%"PRIx64=
"\n",
+                        __func__, data & ahc->hash_mask);
+                break;
+        }
+        do_hash_operation(s, algo);
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
+    s->regs[addr] =3D data;
+}
+
+static const MemoryRegionOps aspeed_hace_ops =3D {
+    .read =3D aspeed_hace_read,
+    .write =3D aspeed_hace_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+    },
+};
+
+static void aspeed_hace_reset(DeviceState *dev)
+{
+    struct AspeedHACEState *s =3D ASPEED_HACE(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void aspeed_hace_realize(DeviceState *dev, Error **errp)
+{
+    AspeedHACEState *s =3D ASPEED_HACE(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
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
+static Property aspeed_hace_properties[] =3D {
+    DEFINE_PROP_LINK("dram", AspeedHACEState, dram_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+
+static const VMStateDescription vmstate_aspeed_hace =3D {
+    .name =3D TYPE_ASPEED_HACE,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedHACEState, ASPEED_HACE_NR_REGS)=
,
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void aspeed_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D aspeed_hace_realize;
+    dc->reset =3D aspeed_hace_reset;
+    device_class_set_props(dc, aspeed_hace_properties);
+    dc->vmsd =3D &vmstate_aspeed_hace;
+}
+
+static const TypeInfo aspeed_hace_info =3D {
+    .name =3D TYPE_ASPEED_HACE,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AspeedHACEState),
+    .class_init =3D aspeed_hace_class_init,
+    .class_size =3D sizeof(AspeedHACEClass)
+};
+
+static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *dat=
a)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc =3D ASPEED_HACE_CLASS(klass);
+
+    dc->desc =3D "AST2400 Hash and Crypto Engine";
+
+    ahc->src_mask =3D 0x0FFFFFFF;
+    ahc->dest_mask =3D 0x0FFFFFF8;
+    ahc->hash_mask =3D HASH_ALGO_MASK;
+}
+
+static const TypeInfo aspeed_ast2400_hace_info =3D {
+    .name =3D TYPE_ASPEED_AST2400_HACE,
+    .parent =3D TYPE_ASPEED_HACE,
+    .class_init =3D aspeed_ast2400_hace_class_init,
+};
+
+static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *dat=
a)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc =3D ASPEED_HACE_CLASS(klass);
+
+    dc->desc =3D "AST2500 Hash and Crypto Engine";
+
+    ahc->src_mask =3D 0x3fffffff;
+    ahc->dest_mask =3D 0x3ffffff8;
+    ahc->hash_mask =3D HASH_ALGO_MASK;
+}
+
+static const TypeInfo aspeed_ast2500_hace_info =3D {
+    .name =3D TYPE_ASPEED_AST2500_HACE,
+    .parent =3D TYPE_ASPEED_HACE,
+    .class_init =3D aspeed_ast2500_hace_class_init,
+};
+
+static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *dat=
a)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc =3D ASPEED_HACE_CLASS(klass);
+
+    dc->desc =3D "AST2600 Hash and Crypto Engine";
+
+    ahc->src_mask =3D 0x7FFFFFFF;
+    ahc->dest_mask =3D 0x7FFFFFF8;
+    ahc->hash_mask =3D HASH_ALGO_MASK | SHA512_HASH_ALGO_MASK;
+}
+
+static const TypeInfo aspeed_ast2600_hace_info =3D {
+    .name =3D TYPE_ASPEED_AST2600_HACE,
+    .parent =3D TYPE_ASPEED_HACE,
+    .class_init =3D aspeed_ast2600_hace_class_init,
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
@@ -109,6 +109,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: f=
iles('pvpanic-isa.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c=
'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+  'aspeed_hace.c',
   'aspeed_lpc.c',
   'aspeed_scu.c',
   'aspeed_sdmc.c',
--=20
2.26.3


