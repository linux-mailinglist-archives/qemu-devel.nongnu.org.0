Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F756D26B6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 19:32:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piIbC-0006Qg-Dp; Fri, 31 Mar 2023 13:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1piIb9-0006Pb-SQ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 13:31:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1piIb8-0001wz-2s
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 13:31:35 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32VHPm6V021101; Fri, 31 Mar 2023 17:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ytl4Dl1zIoGCgi7oNm4Fm2AwYAlQlFDPneqAiItdJkE=;
 b=bHjYvun32K8e9E2RUqbxbQ0luFJh8K8JOxKn2NgPF+qOU9l1Xk2WaXTQ6bGR+MgILxLW
 sE/I641gIVSJTr6Vkp6FDyLg0MCrfr0BgbR0rMfEIBbAcCCoIl6rWyXKmZHrDoeea6Tx
 AH5oDQN3woPZAuHCdQTDXk6bXkjMjT1FCLP55mLMHVHHSvqPu9ytKEs1xAWQjLVg9xGW
 ZOvi9heNAHDJulnBj2uY1rTfnidnnhoK0Cw3+1cYPvd2pazKsh3LjfQlyyy0VwJepCfA
 VoeLyGncfkqexDplVVU8L1Rg+JVD5156aZdVcPe7upXgiSXhT6iAcmq1w6KvHMbDNFgQ 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pp3wp03wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 17:31:19 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32VHRFCK028975;
 Fri, 31 Mar 2023 17:31:18 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pp3wp03nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 17:31:18 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32VEe3D3029171;
 Fri, 31 Mar 2023 17:30:59 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3phrk7u12x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 17:30:59 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32VHUvAZ41746790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 17:30:57 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DC8A58055;
 Fri, 31 Mar 2023 17:30:57 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A90EF5804E;
 Fri, 31 Mar 2023 17:30:56 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 31 Mar 2023 17:30:56 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, thuth@redhat.com, clg@kaod.org,
 ninad@linux.ibm.com, joel@jms.id.au, andrew@aj.id.au,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v5 1/3] qtest: Add functions for accessing devices on Aspeed
 I2C controller
Date: Fri, 31 Mar 2023 13:30:49 -0400
Message-Id: <20230331173051.3857801-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331173051.3857801-1-stefanb@linux.ibm.com>
References: <20230331173051.3857801-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q_naHd53_ZqKYnKvu6ydkh5FdhjupPdk
X-Proofpoint-ORIG-GUID: CkOwLg-7L4ilkB3B07wJPKEtT-ylPWqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxlogscore=692 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310140
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
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/i2c/aspeed_i2c.h |   7 +++
 tests/qtest/qtest_aspeed.c  | 117 ++++++++++++++++++++++++++++++++++++
 tests/qtest/qtest_aspeed.h  |  41 +++++++++++++
 3 files changed, 165 insertions(+)
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
index 0000000000..afee9a1864
--- /dev/null
+++ b/tests/qtest/qtest_aspeed.c
@@ -0,0 +1,117 @@
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
+
+static void aspeed_i2c_startup(QTestState *s, uint32_t baseaddr,
+                               uint8_t slave_addr, uint8_t reg)
+{
+    uint32_t v;
+    static int once;
+
+    if (!once) {
+        /* one time: enable master */
+       qtest_writel(s, baseaddr + A_I2CC_FUN_CTRL, 0);
+       v = qtest_readl(s, baseaddr + A_I2CC_FUN_CTRL) | A_I2CD_MASTER_EN;
+       qtest_writel(s, baseaddr + A_I2CC_FUN_CTRL, v);
+       once = 1;
+    }
+
+    /* select device */
+    qtest_writel(s, baseaddr + A_I2CD_BYTE_BUF, slave_addr << 1);
+    qtest_writel(s, baseaddr + A_I2CD_CMD,
+                 A_I2CD_M_START_CMD | A_I2CD_M_RX_CMD);
+
+    /* select the register to write to */
+    qtest_writel(s, baseaddr + A_I2CD_BYTE_BUF, reg);
+    qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
+}
+
+static uint32_t aspeed_i2c_read_n(QTestState *s,
+                                  uint32_t baseaddr, uint8_t slave_addr,
+                                  uint8_t reg, size_t nbytes)
+{
+    uint32_t res = 0;
+    uint32_t v;
+    size_t i;
+
+    aspeed_i2c_startup(s, baseaddr, slave_addr, reg);
+
+    for (i = 0; i < nbytes; i++) {
+        qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_RX_CMD);
+        v = qtest_readl(s, baseaddr + A_I2CD_BYTE_BUF) >> 8;
+        res |= (v & 0xff) << (i * 8);
+    }
+
+    qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
+
+    return res;
+}
+
+uint32_t aspeed_i2c_readl(QTestState *s,
+                          uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(s, baseaddr, slave_addr, reg, sizeof(uint32_t));
+}
+
+uint16_t aspeed_i2c_readw(QTestState *s,
+                          uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(s, baseaddr, slave_addr, reg, sizeof(uint16_t));
+}
+
+uint8_t aspeed_i2c_readb(QTestState *s,
+                         uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(s, baseaddr, slave_addr, reg, sizeof(uint8_t));
+}
+
+static void aspeed_i2c_write_n(QTestState *s, 
+                               uint32_t baseaddr, uint8_t slave_addr,
+                               uint8_t reg, uint32_t v, size_t nbytes)
+{
+    size_t i;
+
+    aspeed_i2c_startup(s, baseaddr, slave_addr, reg);
+
+    for (i = 0; i < nbytes; i++) {
+        qtest_writel(s, baseaddr + A_I2CD_BYTE_BUF, v & 0xff);
+        v >>= 8;
+        qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
+    }
+
+    qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
+}
+
+void aspeed_i2c_writel(QTestState *s,
+                       uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint32_t v)
+{
+    aspeed_i2c_write_n(s, baseaddr, slave_addr, reg, v, sizeof(v));
+}
+
+void aspeed_i2c_writew(QTestState *s,
+                       uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint16_t v)
+{
+    aspeed_i2c_write_n(s, baseaddr, slave_addr, reg, v, sizeof(v));
+}
+
+void aspeed_i2c_writeb(QTestState *s,
+                       uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint8_t v)
+{
+    aspeed_i2c_write_n(s, baseaddr, slave_addr, reg, v, sizeof(v));
+}
diff --git a/tests/qtest/qtest_aspeed.h b/tests/qtest/qtest_aspeed.h
new file mode 100644
index 0000000000..235dfaa186
--- /dev/null
+++ b/tests/qtest/qtest_aspeed.h
@@ -0,0 +1,41 @@
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
+#include "libqtest.h"
+
+#define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
+
+/* Implements only AST2600 I2C controller */
+
+static inline uint32_t ast2600_i2c_calc_bus_addr(uint8_t bus_num)
+{
+    return AST2600_ASPEED_I2C_BASE_ADDR + 0x80 + bus_num * 0x80;
+}
+
+uint8_t aspeed_i2c_readb(QTestState *s,
+                         uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+uint16_t aspeed_i2c_readw(QTestState *s,
+                          uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+uint32_t aspeed_i2c_readl(QTestState *s,
+                          uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+void aspeed_i2c_writeb(QTestState *s, uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint8_t v);
+void aspeed_i2c_writew(QTestState *s, uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint16_t v);
+void aspeed_i2c_writel(QTestState *s, uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint32_t v);
+
+#endif
-- 
2.39.2


