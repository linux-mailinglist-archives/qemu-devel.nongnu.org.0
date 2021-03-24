Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702353484C9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:45:08 +0100 (CET)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCFP-0005y7-Hi
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPCA7-0001qg-Du; Wed, 24 Mar 2021 18:39:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPCA5-0002pg-8J; Wed, 24 Mar 2021 18:39:39 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OMXPoD123354; Wed, 24 Mar 2021 18:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dUO4fOEv1n8VcWVg5BZZBX4F71p8l5ojaat6OU5nL4o=;
 b=qLorZUwbqL5TSD0KO3peq1+Sch2dN02I3TfIYyteaup+NpD4ixmP+mIwP/VzjuaFOx5b
 lcM4kcO/hy2iu+YJRZNJufupAbF8yu30YsuFkLqYLnvRGhYouBe00iQ9fX2kBo7oq7ly
 b0jOPWdoQQJ7Ze68beidkLWlz6oMXZ5Dr7pNUHJrkJYhdK97dpjj268UMq3ezK19kJlr
 5gEeNeVaXAUQyN0vc4zOFKhqPsig/Nx1wms7EWeDIBy0XXrGHUOhQ4/0zJOpw0nKEYQV
 9YYMJdXEN/wkc5f9zVMCtXpao+cyyCuQcMJHlQuHtGf3wnd+hBGIyDW9fpdrcJTAWnym bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gcfctkpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:39:22 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12OMZ2xs130975;
 Wed, 24 Mar 2021 18:39:22 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gcfctkp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:39:22 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OMbNPF022835;
 Wed, 24 Mar 2021 22:39:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 37equdsbhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 22:39:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12OMdKwG11338026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 22:39:20 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE93FC605F;
 Wed, 24 Mar 2021 22:39:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44759C6059;
 Wed, 24 Mar 2021 22:39:17 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.133.239])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 22:39:17 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/3] aspeed: Add Scater-Gather support for HACE Hash
Date: Wed, 24 Mar 2021 19:38:45 -0300
Message-Id: <20210324223846.17407-3-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240161
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 hw/misc/aspeed_hace.c         | 127 ++++++++++++++++++++++++++++++++--
 include/hw/misc/aspeed_hace.h |   6 ++
 2 files changed, 127 insertions(+), 6 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 93313d2b80..8a37b1d961 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -57,6 +57,10 @@
 /* Other cmd bits */
 #define  HASH_IRQ_EN                    BIT(9)
 #define  HASH_SG_EN                     BIT(18)
+/* Scatter-gather data list */
+#define  SG_LIST_LAST                   BIT(31)
+#define  SG_LIST_LEN_MASK               0x7fffffff
+#define  SG_LIST_ADDR_MASK              0x7ffffff8  /* 8-byte aligned */
 
 static const struct {
     uint32_t mask;
@@ -129,6 +133,117 @@ static int do_hash_operation(AspeedHACEState *s, int algo)
     return 0;
 }
 
+static int do_hash_sg_operation(AspeedHACEState *s, int algo)
+{
+    uint32_t src, dest, reqSize;
+    hwaddr len;
+    const size_t reqLen = sizeof(struct aspeed_sg_list);
+    struct iovec iov[ASPEED_HACE_MAX_SG];
+    unsigned int i = 0;
+    unsigned int isLast = 0;
+    uint8_t *digestBuf = NULL;
+    size_t digestLen = 0, size = 0;
+    struct aspeed_sg_list *sgList;
+    int rc;
+
+    reqSize = s->regs[R_HASH_SRC_LEN];
+    dest = s->regs[R_HASH_DEST];
+
+    while (!isLast && i < ASPEED_HACE_MAX_SG) {
+        src = s->regs[R_HASH_SRC] + (i * reqLen);
+        len = reqLen;
+        sgList = (struct aspeed_sg_list *) address_space_map(&s->dram_as,
+                                                                     src,
+                                                         (hwaddr *) &len,
+                                                                   false,
+                                                 MEMTXATTRS_UNSPECIFIED);
+        if (!sgList) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+             "%s: failed to map dram for SG Array entry '%u' for address '0x%0x'\n",
+             __func__, i, src);
+            rc = -EACCES;
+            goto cleanup;
+        }
+        if (len != reqLen)
+            qemu_log_mask(LOG_GUEST_ERROR,
+             "%s:  Warning: dram map for SG array entry '%u' requested size '%lu' != mapped size '%lu'\n",
+             __func__, i, reqLen, len);
+
+        isLast = sgList->len & SG_LIST_LAST;
+
+        iov[i].iov_len = (hwaddr) (sgList->len & SG_LIST_LEN_MASK);
+        iov[i].iov_base = address_space_map(&s->dram_as,
+                            sgList->phy_addr & SG_LIST_ADDR_MASK,
+                            &iov[i].iov_len, false,
+                            MEMTXATTRS_UNSPECIFIED);
+        if (!iov[i].iov_base) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+             "%s: failed to map dram for SG array entry '%u' for region '0x%x', len '%u'\n",
+             __func__, i, sgList->phy_addr & SG_LIST_ADDR_MASK,
+             sgList->len & SG_LIST_LEN_MASK);
+            rc = -EACCES;
+            goto cleanup;
+        }
+        if (iov[i].iov_len != (sgList->len & SG_LIST_LEN_MASK))
+            qemu_log_mask(LOG_GUEST_ERROR,
+             "%s:  Warning: dram map for SG region entry %u requested size %u != mapped size %lu\n",
+             __func__, i, (sgList->len & SG_LIST_LEN_MASK), iov[i].iov_len);
+
+
+        address_space_unmap(&s->dram_as, (void *) sgList, len, false,
+                            len);
+        size += iov[i].iov_len;
+        i++;
+    }
+
+    if (!isLast) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                     "%s: Error: Exhausted maximum of '%u' SG array entries\n",
+                     __func__, ASPEED_HACE_MAX_SG);
+        rc = -ENOTSUP;
+        goto cleanup;
+    }
+
+    if (size != reqSize)
+        qemu_log_mask(LOG_GUEST_ERROR,
+         "%s: Warning: requested SG total size %u != actual size %lu\n",
+         __func__, reqSize, size);
+
+    rc = qcrypto_hash_bytesv(algo, iov, i, &digestBuf, &digestLen,
+                            &error_fatal);
+    if (rc < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n",
+                      __func__);
+        goto cleanup;
+    }
+
+    rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
+                             digestBuf, digestLen);
+    if (rc)
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: address space write failed\n", __func__);
+    g_free(digestBuf);
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
+    if (!rc) {
+        s->regs[R_STATUS] |= HASH_IRQ;
+    }
+
+    return rc;
+}
+
+
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -187,11 +302,6 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
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
@@ -204,7 +314,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                         __func__, data & ahc->hash_mask);
                 break;
         }
-        do_hash_operation(s, algo);
+        if (data & HASH_SG_EN) {
+            s->regs[(R_HASH_SRC >> 2)] &= 0x7FFFFFF8;
+            do_hash_sg_operation(s, algo);
+        } else {
+            do_hash_operation(s, algo);
+        }
 
         if (data & HASH_IRQ_EN) {
             qemu_irq_raise(s->irq);
diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 94d5ada95f..ead46afda9 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -40,4 +40,10 @@ struct AspeedHACEClass {
     uint32_t hash_mask;
 };
 
+#define ASPEED_HACE_MAX_SG      256
+struct aspeed_sg_list {
+        uint32_t len;
+        uint32_t phy_addr;
+} __attribute__ ((__packed__));
+
 #endif /* _ASPEED_HACE_H_ */
-- 
2.25.1


