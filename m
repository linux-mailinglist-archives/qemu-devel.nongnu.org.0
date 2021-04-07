Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5E357339
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:32:27 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUC2U-00018F-CX
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnh-0007Tu-3A; Wed, 07 Apr 2021 13:17:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnc-0006ly-Se; Wed, 07 Apr 2021 13:17:08 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H3MW9072187; Wed, 7 Apr 2021 13:16:53 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw6kgn2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:52 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HDcS5031054;
 Wed, 7 Apr 2021 17:16:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 37rvbqgwc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGmBN48103848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38AEE5204F;
 Wed,  7 Apr 2021 17:16:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id EE8F752052;
 Wed,  7 Apr 2021 17:16:47 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0C5AE220190;
 Wed,  7 Apr 2021 19:16:46 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 09/24] aspeed: Add Scater-Gather support for HACE Hash
Date: Wed,  7 Apr 2021 19:16:22 +0200
Message-Id: <20210407171637.777743-10-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u8I3oDBvdfs5CM-OYciVjmDI1T_GSbHZ
X-Proofpoint-ORIG-GUID: u8I3oDBvdfs5CM-OYciVjmDI1T_GSbHZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=721
 clxscore=1034 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070116
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

Complement the Aspeed HACE support with Scatter-Gather hash support for
sha256 and sha512. Scatter-Gather is only supported on AST2600-series.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
[ clg: - fixes for checkpatch errors ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210326193745.13558-2-klaus@linux.vnet.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst |   2 +-
 hw/misc/aspeed_hace.c      | 133 +++++++++++++++++++++++++++++++++++--
 2 files changed, 128 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index f9466e6d8245..8680fd9409db 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -49,7 +49,7 @@ Supported devices
  * Ethernet controllers
  * Front LEDs (PCA9552 on I2C bus)
  * LPC Peripheral Controller (a subset of subdevices are supported)
- * Hash/Crypto Engine (HACE) - Hash support only, no scatter-gather
+ * Hash/Crypto Engine (HACE) - Hash support only
=20
=20
 Missing devices
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 6e5b447a4835..8b3eebfaec63 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -57,6 +57,14 @@
 /* Other cmd bits */
 #define  HASH_IRQ_EN                    BIT(9)
 #define  HASH_SG_EN                     BIT(18)
+/* Scatter-gather data list */
+#define SG_LIST_LEN_SIZE                4
+#define SG_LIST_LEN_MASK                0x0FFFFFFF
+#define SG_LIST_LEN_LAST                BIT(31)
+#define SG_LIST_ADDR_SIZE               4
+#define SG_LIST_ADDR_MASK               0x7FFFFFFF
+#define SG_LIST_ENTRY_SIZE              (SG_LIST_LEN_SIZE + SG_LIST_ADDR=
_SIZE)
+#define ASPEED_HACE_MAX_SG              256        /* max number of entr=
ies */
=20
 static const struct {
     uint32_t mask;
@@ -129,6 +137,121 @@ static int do_hash_operation(AspeedHACEState *s, in=
t algo)
     return 0;
 }
=20
+static int do_hash_sg_operation(AspeedHACEState *s, int algo)
+{
+    hwaddr src, dest, req_size;
+    uint32_t entry_len, entry_addr;
+    uint8_t *digest_buf =3D NULL;
+    unsigned int i =3D 0;
+    MemTxResult result;
+    struct iovec iov[ASPEED_HACE_MAX_SG];
+    size_t digest_len =3D 0, size =3D 0;
+    int rc;
+
+    req_size =3D s->regs[R_HASH_SRC_LEN];
+    dest =3D s->regs[R_HASH_DEST];
+
+    while (i < ASPEED_HACE_MAX_SG) {
+        src =3D s->regs[R_HASH_SRC] + (i * SG_LIST_ENTRY_SIZE);
+        entry_len =3D address_space_ldl_le(&s->dram_as, src,
+                                         MEMTXATTRS_UNSPECIFIED, &result=
);
+        if (result !=3D MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: failed to load SG Array length entry %"PR=
Iu32
+                          " from 0x%"HWADDR_PRIx"\n", __func__, i, src);
+            rc =3D -EACCES;
+            goto cleanup;
+        }
+        entry_addr =3D address_space_ldl_le(&s->dram_as, src + SG_LIST_L=
EN_SIZE,
+                                          MEMTXATTRS_UNSPECIFIED, &resul=
t);
+        if (result !=3D MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: failed to load SG Array address entry %"P=
RIu32
+                          " from 0x%"HWADDR_PRIx"\n",
+                          __func__, i, src + SG_LIST_LEN_SIZE);
+            rc =3D -EACCES;
+            goto cleanup;
+        }
+
+        iov[i].iov_len =3D (hwaddr) (entry_len & SG_LIST_LEN_MASK);
+        iov[i].iov_base =3D address_space_map(&s->dram_as,
+                                            entry_addr & SG_LIST_ADDR_MA=
SK,
+                                            &iov[i].iov_len, false,
+                                            MEMTXATTRS_UNSPECIFIED);
+        if (!iov[i].iov_base) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: failed to map dram for SG array entry %"P=
RIu32
+                          " for region 0x%"PRIx32", len %"PRIu32"\n",
+                          __func__, i, entry_addr & SG_LIST_ADDR_MASK,
+                          entry_len & SG_LIST_LEN_MASK);
+            rc =3D -EACCES;
+            goto cleanup;
+        }
+        if (iov[i].iov_len !=3D (entry_len & SG_LIST_LEN_MASK))
+            qemu_log_mask(LOG_GUEST_ERROR,
+                         "%s:  Warning: dram map for SG region entry %"P=
RIu32
+                         " requested size %"PRIu32" !=3D mapped size %"P=
RIu64"\n",
+                         __func__, i, entry_len & SG_LIST_LEN_MASK,
+                         iov[i].iov_len);
+
+        size +=3D iov[i].iov_len;
+        i++;
+
+        if (entry_len & SG_LIST_LEN_LAST) {
+            break;
+        }
+    }
+
+    if (!(entry_len & SG_LIST_LEN_LAST)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Error: Exhausted maximum of %"PRIu32
+                      " SG array entries\n",
+                      __func__, ASPEED_HACE_MAX_SG);
+        rc =3D -ENOTSUP;
+        goto cleanup;
+    }
+
+    if (size !=3D req_size)
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Warning: requested SG total size %"PRIu64
+                      " !=3D actual size %"PRIu64"\n",
+                      __func__, req_size, size);
+
+    rc =3D qcrypto_hash_bytesv(algo, iov, i, &digest_buf, &digest_len,
+                            &error_fatal);
+    if (rc < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n",
+                      __func__);
+        goto cleanup;
+    }
+
+    rc =3D address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED=
,
+                             digest_buf, digest_len);
+    if (rc)
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: address space write failed\n", __func__);
+    g_free(digest_buf);
+
+cleanup:
+
+    for (; i > 0; i--) {
+        address_space_unmap(&s->dram_as, iov[i - 1].iov_base,
+                            iov[i - 1].iov_len, false,
+                            iov[i - 1].iov_len);
+    }
+
+    /*
+     * Set status bits to indicate completion. Testing shows hardware se=
ts
+     * these irrespective of HASH_IRQ_EN.
+     */
+    if (!rc) {
+        s->regs[R_STATUS] |=3D HASH_IRQ;
+    }
+
+    return rc;
+}
+
+
=20
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int=
 size)
 {
@@ -187,11 +310,6 @@ static void aspeed_hace_write(void *opaque, hwaddr a=
ddr, uint64_t data,
                           "%s: HMAC engine command mode %"PRIx64" not im=
plemented",
                           __func__, (data & HASH_HMAC_MASK) >> 8);
         }
-        if (data & HASH_SG_EN) {
-            qemu_log_mask(LOG_UNIMP,
-                          "%s: Hash scatter gather mode not implemented"=
,
-                          __func__);
-        }
         if (data & BIT(1)) {
             qemu_log_mask(LOG_UNIMP,
                           "%s: Cascaded mode not implemented",
@@ -204,7 +322,10 @@ static void aspeed_hace_write(void *opaque, hwaddr a=
ddr, uint64_t data,
                         __func__, data & ahc->hash_mask);
                 break;
         }
-        do_hash_operation(s, algo);
+        if (data & HASH_SG_EN)
+            do_hash_sg_operation(s, algo);
+        else
+            do_hash_operation(s, algo);
=20
         if (data & HASH_IRQ_EN) {
             qemu_irq_raise(s->irq);
--=20
2.26.3


