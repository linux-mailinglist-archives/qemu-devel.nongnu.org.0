Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235DB34AF63
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:34:05 +0100 (CET)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsDc-0002gt-5Y
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPsAu-0001Ho-BB; Fri, 26 Mar 2021 15:31:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPsAp-0005xk-1g; Fri, 26 Mar 2021 15:31:15 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QJ2cRZ141917; Fri, 26 Mar 2021 15:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7n+xUNb1Z6kBj60dU56TBSEdXccn6setyns2TsQLY0A=;
 b=QYa5xk2kW/kjwbwwH6+wilgInxEQPEl6pYZdVWGnrYK8aC0SCK7ooQPTiyPXqL/WChb1
 to690oA7fxiMzNt/aQ+im6XRL9ASjI6M9oHCdRQ6Aqzq0MM2OEuC7hcwrUcetq3IntZk
 oJ3j5ruF/fuozuqSSlMn2A9Dp069MuhNu4zPW3gELK3xl9WcYi7vL7LZuLNLawK3/MO8
 tCZ+8Pz+Lq+dRJS1MW+MoXeoq4R+XDeVXHhcvqB3t2GhE2CnLAHec6qv1XgdhUCP4Btp
 gj9Ou4S6SiH5TcOp7rNHkp+qpOxiP8exJrBHs2sEWrsnXoxsmEBKJmmg25CW85SAk7yq gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h76802hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:30:56 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QJ3OMU148334;
 Fri, 26 Mar 2021 15:30:56 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h76802hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:30:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QJUoFV019243;
 Fri, 26 Mar 2021 19:30:55 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 37h14n9bqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 19:30:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QJUsfj8323656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 19:30:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49F09AE05C;
 Fri, 26 Mar 2021 19:30:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B26FAE063;
 Fri, 26 Mar 2021 19:30:52 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.195.191])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 19:30:52 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] aspeed: Add Scater-Gather support for HACE Hash
Date: Fri, 26 Mar 2021 16:30:32 -0300
Message-Id: <20210326193033.11798-2-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326193033.11798-1-klaus@linux.vnet.ibm.com>
References: <20210326193033.11798-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W5r-wd0-QJUaXdZlp6qXzUXFLJ_Qe927
X-Proofpoint-GUID: zjC5G3RL7cfJattVzAQqTjlnYWDsIOKj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_08:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260140
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Complement the Aspeed HACE support with Scatter-Gather hash support for
sha256 and sha512. Scatter-Gather is only supported on AST2600-series.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 docs/system/arm/aspeed.rst |   2 +-
 hw/misc/aspeed_hace.c      | 126 +++++++++++++++++++++++++++++++++++--
 2 files changed, 121 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index f9466e6d82..8680fd9409 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -49,7 +49,7 @@ Supported devices
  * Ethernet controllers
  * Front LEDs (PCA9552 on I2C bus)
  * LPC Peripheral Controller (a subset of subdevices are supported)
- * Hash/Crypto Engine (HACE) - Hash support only, no scatter-gather
+ * Hash/Crypto Engine (HACE) - Hash support only
 
 
 Missing devices
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 6e5b447a48..f783811774 100644
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
+#define SG_LIST_ENTRY_SIZE              (SG_LIST_LEN_SIZE + SG_LIST_ADDR_SIZE)
+#define ASPEED_HACE_MAX_SG              256        /* max number of entries */
 
 static const struct {
     uint32_t mask;
@@ -129,6 +137,114 @@ static int do_hash_operation(AspeedHACEState *s, int algo)
     return 0;
 }
 
+static int do_hash_sg_operation(AspeedHACEState *s, int algo)
+{
+    hwaddr src, dest, req_size;
+    uint32_t entry_len, entry_addr;
+    uint8_t *digest_buf = NULL;
+    unsigned int i = 0;
+    MemTxResult result;
+    struct iovec iov[ASPEED_HACE_MAX_SG];
+    size_t digest_len = 0, size = 0;
+    int rc;
+
+    req_size = s->regs[R_HASH_SRC_LEN];
+    dest = s->regs[R_HASH_DEST];
+
+    while (i < ASPEED_HACE_MAX_SG) {
+        src = s->regs[R_HASH_SRC] + (i * SG_LIST_ENTRY_SIZE);
+        entry_len = address_space_ldl_le(&s->dram_as, src,
+                                         MEMTXATTRS_UNSPECIFIED, &result);
+        if (result != MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+             "%s: failed to load SG Array length entry %"PRIu32" from 0x%"HWADDR_PRIx"\n",
+             __func__, i, src);
+            rc = -EACCES;
+            goto cleanup;
+        }
+        entry_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
+                                          MEMTXATTRS_UNSPECIFIED, &result);
+        if (result != MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+             "%s: failed to load SG Array address entry %"PRIu32" from 0x%"HWADDR_PRIx"\n",
+             __func__, i, src + SG_LIST_LEN_SIZE);
+            rc = -EACCES;
+            goto cleanup;
+        }
+
+        iov[i].iov_len = (hwaddr) (entry_len & SG_LIST_LEN_MASK);
+        iov[i].iov_base = address_space_map(&s->dram_as,
+                                            entry_addr & SG_LIST_ADDR_MASK,
+                                            &iov[i].iov_len, false,
+                                            MEMTXATTRS_UNSPECIFIED);
+        if (!iov[i].iov_base) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+             "%s: failed to map dram for SG array entry %"PRIu32" for region 0x%"PRIx32", len %"PRIu32"\n",
+             __func__, i, entry_addr & SG_LIST_ADDR_MASK, entry_len & SG_LIST_LEN_MASK);
+            rc = -EACCES;
+            goto cleanup;
+        }
+        if (iov[i].iov_len != (entry_len & SG_LIST_LEN_MASK))
+            qemu_log_mask(LOG_GUEST_ERROR,
+             "%s:  Warning: dram map for SG region entry %"PRIu32" requested size %"PRIu32" != mapped size %"PRIu64"\n",
+             __func__, i, entry_len & SG_LIST_LEN_MASK, iov[i].iov_len);
+
+        size += iov[i].iov_len;
+        i++;
+
+        if (entry_len & SG_LIST_LEN_LAST) {
+            break;
+        }
+    }
+
+    if (!(entry_len & SG_LIST_LEN_LAST)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                     "%s: Error: Exhausted maximum of %"PRIu32" SG array entries\n",
+                     __func__, ASPEED_HACE_MAX_SG);
+        rc = -ENOTSUP;
+        goto cleanup;
+    }
+
+    if (size != req_size)
+        qemu_log_mask(LOG_GUEST_ERROR,
+         "%s: Warning: requested SG total size %"PRIu64" != actual size %"PRIu64"\n",
+         __func__, req_size, size);
+
+    rc = qcrypto_hash_bytesv(algo, iov, i, &digest_buf, &digest_len,
+                            &error_fatal);
+    if (rc < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n",
+                      __func__);
+        goto cleanup;
+    }
+
+    rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
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
+     * Set status bits to indicate completion. Testing shows hardware sets
+     * these irrespective of HASH_IRQ_EN.
+     */
+//    if (!rc) {
+        s->regs[R_STATUS] |= HASH_IRQ;
+//    }
+
+    return rc;
+}
+
+
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -187,11 +303,6 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                           "%s: HMAC engine command mode %"PRIx64" not implemented",
                           __func__, (data & HASH_HMAC_MASK) >> 8);
         }
-        if (data & HASH_SG_EN) {
-            qemu_log_mask(LOG_UNIMP,
-                          "%s: Hash scatter gather mode not implemented",
-                          __func__);
-        }
         if (data & BIT(1)) {
             qemu_log_mask(LOG_UNIMP,
                           "%s: Cascaded mode not implemented",
@@ -204,7 +315,10 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                         __func__, data & ahc->hash_mask);
                 break;
         }
-        do_hash_operation(s, algo);
+        if (data & HASH_SG_EN)
+            do_hash_sg_operation(s, algo);
+        else
+            do_hash_operation(s, algo);
 
         if (data & HASH_IRQ_EN) {
             qemu_irq_raise(s->irq);
-- 
2.25.1


