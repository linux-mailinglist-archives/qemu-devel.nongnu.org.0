Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2926CAFF1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 22:25:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgtOZ-000784-IW; Mon, 27 Mar 2023 16:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgtOX-00077T-1c
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 16:24:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgtOU-0005n7-Kf
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 16:24:44 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RJgMla023794; Mon, 27 Mar 2023 20:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BI8rYTW3pv3P9++dHKsLx5zRNPa3TrSkND16GjxKqgg=;
 b=INIrGSvcuZiSzgtx9gOycSAl1jbDstwuUFP30MV8/br3rJDQxrtwBjJhS2nkdeYPSh95
 pNbYZ5JirRBimCqN+AbV//1pOLK3Xan6p0AzgAuX7/p9vq8DkjVe3pFKRMfKWR2DurAv
 QqU/EChZrJMWtnmxoZ9+tAbEo2Gl+23wLG0NS5edf2HSZYVPnJ0pSLaP5S3P1NxFWDQO
 kACAL+24pGpBW80PhtT1jxkQ8BiT9NxFAXJZgMjacPS9ZIQWSUBNuMeSdqvWvSOJNLHM
 RyxcfowQ2vS61ffbMrL+y2V1WKlqi/1EtwKRd4QL9nKA8Dt3S9o1gwbSfDa1hd20PORX OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkhhcgwnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:33 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RKKw8U006305;
 Mon, 27 Mar 2023 20:24:33 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkhhcgwnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:33 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RJ88fb024340;
 Mon, 27 Mar 2023 20:24:32 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3phrk788af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:32 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RKOTPM20382292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 20:24:29 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B41115804B;
 Mon, 27 Mar 2023 20:24:29 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0097F58055;
 Mon, 27 Mar 2023 20:24:29 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 20:24:28 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 1/3] qtest: Add functions for accessing devices on Aspeed I2C
 controller
Date: Mon, 27 Mar 2023 16:24:14 -0400
Message-Id: <20230327202416.3617162-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327202416.3617162-1-stefanb@linux.ibm.com>
References: <20230327202416.3617162-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G89Dy-1h3oFI4J7P6Eivbpse0ehYxnrW
X-Proofpoint-GUID: _hAEdySFqHVOHas2Rw_-8G6txaglakD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=691 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270163
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add read and write functions for accessing registers of I2C devices
connected to the Aspeed I2C controller.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 include/hw/i2c/aspeed_i2c.h |   7 +++
 tests/qtest/qtest_aspeed.c  | 109 ++++++++++++++++++++++++++++++++++++
 tests/qtest/qtest_aspeed.h  |  34 +++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 tests/qtest/qtest_aspeed.c
 create mode 100644 tests/qtest/qtest_aspeed.h

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index adc904d6c1..51c944efea 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -38,6 +38,13 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 #define ASPEED_I2C_OLD_NUM_REG 11
 #define ASPEED_I2C_NEW_NUM_REG 22
 
+#define A_I2CD_M_STOP_CMD       BIT(5)
+#define A_I2CD_M_RX_CMD         BIT(3)
+#define A_I2CD_M_TX_CMD         BIT(1)
+#define A_I2CD_M_START_CMD      BIT(0)
+
+#define A_I2CD_MASTER_EN        BIT(0)
+
 /* Tx State Machine */
 #define   I2CD_TX_STATE_MASK                  0xf
 #define     I2CD_IDLE                         0x0
diff --git a/tests/qtest/qtest_aspeed.c b/tests/qtest/qtest_aspeed.c
new file mode 100644
index 0000000000..2fcafc22fc
--- /dev/null
+++ b/tests/qtest/qtest_aspeed.c
@@ -0,0 +1,109 @@
+/*
+ * Aspeed i2c bus interface for reading from and writing to i2c device registers
+ *
+ * Copyright (c) 2023 IBM Corporation
+ *
+ * Authors:
+ *   Stefan Berger <stefanb@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qtest_aspeed.h"
+#include "hw/i2c/aspeed_i2c.h"
+#include "libqtest-single.h"
+
+static void aspeed_i2c_startup(uint32_t baseaddr, uint8_t slave_addr,
+                               uint8_t reg)
+{
+    uint32_t v;
+    static int once;
+
+    if (!once) {
+        /* one time: enable master */
+       writel(baseaddr + A_I2CC_FUN_CTRL, 0);
+       v = readl(baseaddr + A_I2CC_FUN_CTRL) | A_I2CD_MASTER_EN;
+       writel(baseaddr + A_I2CC_FUN_CTRL, v);
+       once = 1;
+    }
+
+    /* select device */
+    writel(baseaddr + A_I2CD_BYTE_BUF, slave_addr << 1);
+    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_START_CMD | A_I2CD_M_RX_CMD);
+
+    /* select the register to write to */
+    writel(baseaddr + A_I2CD_BYTE_BUF, reg);
+    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
+}
+
+static uint32_t aspeed_i2c_read_n(uint32_t baseaddr, uint8_t slave_addr,
+                                  uint8_t reg, size_t nbytes)
+{
+    uint32_t res = 0;
+    uint32_t v;
+    size_t i;
+
+    aspeed_i2c_startup(baseaddr, slave_addr, reg);
+
+    for (i = 0; i < nbytes; i++) {
+        writel(baseaddr + A_I2CD_CMD, A_I2CD_M_RX_CMD);
+        v = readl(baseaddr + A_I2CD_BYTE_BUF) >> 8;
+        res |= (v & 0xff) << (i * 8);
+    }
+
+    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
+
+    return res;
+}
+
+uint32_t aspeed_i2c_readl(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint32_t));
+}
+
+uint16_t aspeed_i2c_readw(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint16_t));
+}
+
+uint8_t aspeed_i2c_readb(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint8_t));
+}
+
+static void aspeed_i2c_write_n(uint32_t baseaddr, uint8_t slave_addr,
+                               uint8_t reg, uint32_t v, size_t nbytes)
+{
+    size_t i;
+
+    aspeed_i2c_startup(baseaddr, slave_addr, reg);
+
+    for (i = 0; i < nbytes; i++) {
+        writel(baseaddr + A_I2CD_BYTE_BUF, v & 0xff);
+        v >>= 8;
+        writel(baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
+    }
+
+    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
+}
+
+void aspeed_i2c_writel(uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint32_t v)
+{
+    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
+}
+
+void aspeed_i2c_writew(uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint16_t v)
+{
+    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
+}
+
+void aspeed_i2c_writeb(uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint8_t v)
+{
+    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
+}
diff --git a/tests/qtest/qtest_aspeed.h b/tests/qtest/qtest_aspeed.h
new file mode 100644
index 0000000000..529061cf5b
--- /dev/null
+++ b/tests/qtest/qtest_aspeed.h
@@ -0,0 +1,34 @@
+/*
+ * Aspeed i2c bus interface to reading and writing to i2c device registers
+ *
+ * Copyright (c) 2023 IBM Corporation
+ *
+ * Authors:
+ *   Stefan Berger <stefanb@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QTEST_ASPEED_H
+#define QTEST_ASPEED_H
+
+#include <stdint.h>
+
+#define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
+
+static inline uint32_t ast2600_aspeed_i2c_calc_dev_addr(uint8_t bus_num)
+{
+    return AST2600_ASPEED_I2C_BASE_ADDR + 0x80 + bus_num * 0x80;
+}
+
+uint8_t aspeed_i2c_readb(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+uint16_t aspeed_i2c_readw(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+uint32_t aspeed_i2c_readl(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+void aspeed_i2c_writeb(uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint8_t v);
+void aspeed_i2c_writew(uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint16_t v);
+void aspeed_i2c_writel(uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint32_t v);
+
+#endif
-- 
2.39.2


