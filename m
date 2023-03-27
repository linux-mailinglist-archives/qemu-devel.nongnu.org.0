Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23346CAFEC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 22:25:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgtOd-0007NR-Ed; Mon, 27 Mar 2023 16:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgtOZ-0007AD-Gu
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 16:24:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgtOV-0005nv-Aw
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 16:24:47 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RJgBnQ005368; Mon, 27 Mar 2023 20:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=QD9wZKHVUie3Wx9BL91VeMxf34VOEx6O1bgVwFRx9Hs=;
 b=TpsWCjzBKGV5SPab1lwuCi73ioKRZj8HsSo8DzYKRQUl/9uDTX1TZ2GRij1U0YAijIOw
 KsCgYQWi1jOl2f48aK1Ty4RxXkT+WwBdczvugUqKk6jZrJW+cLZOpam/1IIWgjW2k8+A
 DgrhpP46lNF9VdE0fdLmUDcUmvkVi3c5tUdJZAQSZ94bnxyT3wUFmeQzTOkp+QhFiPvV
 tNF+XP3LOgspqIkifrNJOzXhjXyvVr4jm/FB6Flzzu7u+hqW56gqvrjXl7f5C0cvumW5
 eeTxDEyina4MG8BPf8slP3QsY/zIwzZoqyFkx0sP9AiN1Nlye5ocfIP0IG/ME6jSr+aV Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkhhc8w6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:35 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RKHwZD015591;
 Mon, 27 Mar 2023 20:24:35 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkhhc8w6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RJGWbW019763;
 Mon, 27 Mar 2023 20:24:34 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3phrk7g7hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:33 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RKOVPG59507158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 20:24:32 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C37EB58067;
 Mon, 27 Mar 2023 20:24:31 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1F4358059;
 Mon, 27 Mar 2023 20:24:30 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 20:24:30 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 3/3] qtest: Add a test case for TPM TIS I2C connected to
 Aspeed I2C controller
Date: Mon, 27 Mar 2023 16:24:16 -0400
Message-Id: <20230327202416.3617162-4-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327202416.3617162-1-stefanb@linux.ibm.com>
References: <20230327202416.3617162-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R0eBOHhorCauFXGZLhFhv5NiB93xCTjL
X-Proofpoint-GUID: j_jMQNbuql5KwF23QRhvD1L28fD84D_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270163
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

Add a test case for the TPM TIS I2C device exercising most of its
functionality, including localities.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/qtest/meson.build        |   3 +
 tests/qtest/tpm-tis-i2c-test.c | 637 +++++++++++++++++++++++++++++++++
 2 files changed, 640 insertions(+)
 create mode 100644 tests/qtest/tpm-tis-i2c-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 29a4efb4c2..065a00d34d 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -200,6 +200,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   ['arm-cpu-features',
    'microbit-test',
    'test-arm-mptimer',
@@ -212,6 +213,7 @@ qtests_aarch64 = \
     ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
@@ -303,6 +305,7 @@ qtests = {
   'tpm-crb-test': [io, tpmemu_files],
   'tpm-tis-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'tpm-tis-test': [io, tpmemu_files, 'tpm-tis-util.c'],
+  'tpm-tis-i2c-test': [io, tpmemu_files, 'qtest_aspeed.c'],
   'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
diff --git a/tests/qtest/tpm-tis-i2c-test.c b/tests/qtest/tpm-tis-i2c-test.c
new file mode 100644
index 0000000000..94ec423845
--- /dev/null
+++ b/tests/qtest/tpm-tis-i2c-test.c
@@ -0,0 +1,637 @@
+/*
+ * QTest testcases for TPM TIS on I2C (derived from TPM TIS test)
+ *
+ * Copyright (c) 2023 IBM Corporation
+ * Copyright (c) 2023 Red Hat, Inc.
+ *
+ * Authors:
+ *   Stefan Berger <stefanb@linux.ibm.com>
+ *   Marc-André Lureau <marcandre.lureau@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+
+#include "libqtest-single.h"
+#include "hw/acpi/tpm.h"
+#include "hw/pci/pci_ids.h"
+#include "qtest_aspeed.h"
+#include "tpm-emu.h"
+
+#define DEBUG_TIS_TEST 0
+
+#define DPRINTF(fmt, ...) do { \
+    if (DEBUG_TIS_TEST) { \
+        printf(fmt, ## __VA_ARGS__); \
+    } \
+} while (0)
+
+#define DPRINTF_ACCESS \
+    DPRINTF("%s: %d: locty=%d l=%d access=0x%02x pending_request_flag=0x%x\n", \
+            __func__, __LINE__, locty, l, access, pending_request_flag)
+
+#define DPRINTF_STS \
+    DPRINTF("%s: %d: sts = 0x%08x\n", __func__, __LINE__, sts)
+
+#define I2C_SLAVE_ADDR   0x2e
+#define I2C_DEV_BUS_NUM  10
+
+static const uint8_t TPM_CMD[12] =
+    "\x80\x01\x00\x00\x00\x0c\x00\x00\x01\x44\x00\x00";
+
+uint32_t aspeed_dev_addr;
+
+uint8_t cur_locty = 0xff;
+
+static void tpm_tis_i2c_set_locty(uint8_t locty)
+{
+    if (cur_locty != locty) {
+        cur_locty = locty;
+        aspeed_i2c_writeb(aspeed_dev_addr, I2C_SLAVE_ADDR,
+                          TPM_I2C_REG_LOC_SEL, locty);
+    }
+}
+
+static uint8_t tpm_tis_i2c_readb(uint8_t locty, uint8_t reg)
+{
+    tpm_tis_i2c_set_locty(locty);
+    return aspeed_i2c_readb(aspeed_dev_addr, I2C_SLAVE_ADDR, reg);
+}
+
+static uint16_t tpm_tis_i2c_readw(uint8_t locty, uint8_t reg)
+{
+    tpm_tis_i2c_set_locty(locty);
+    return aspeed_i2c_readw(aspeed_dev_addr, I2C_SLAVE_ADDR, reg);
+}
+
+static uint32_t tpm_tis_i2c_readl(uint8_t locty, uint8_t reg)
+{
+    tpm_tis_i2c_set_locty(locty);
+    return aspeed_i2c_readl(aspeed_dev_addr, I2C_SLAVE_ADDR, reg);
+}
+
+static void tpm_tis_i2c_writeb(uint8_t locty, uint8_t reg, uint8_t v)
+{
+    if (reg != TPM_I2C_REG_LOC_SEL) {
+        tpm_tis_i2c_set_locty(locty);
+    }
+    aspeed_i2c_writeb(aspeed_dev_addr, I2C_SLAVE_ADDR, reg, v);
+}
+
+static void tpm_tis_i2c_writel(uint8_t locty, uint8_t reg, uint32_t v)
+{
+    if (reg != TPM_I2C_REG_LOC_SEL) {
+        tpm_tis_i2c_set_locty(locty);
+    }
+    aspeed_i2c_writel(aspeed_dev_addr, I2C_SLAVE_ADDR, reg, v);
+}
+
+static void tpm_tis_i2c_test_basic(const void *data)
+{
+    uint8_t access;
+    uint32_t v;
+
+    /*
+     * All register accesses below must work without locality 0 being the
+     * active locality. Therefore, ensure access is released.
+     */
+    tpm_tis_i2c_writeb(0, TPM_I2C_REG_ACCESS,
+                       TPM_TIS_ACCESS_ACTIVE_LOCALITY);
+    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
+    g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+    /* read interrupt capability -- none are supported */
+    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_CAPABILITY);
+    g_assert_cmpint(v, ==, 0);
+
+    /* try to enable all interrupts */
+    tpm_tis_i2c_writel(0, TPM_I2C_REG_INT_ENABLE, 0xffffffff);
+    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_ENABLE);
+    /* none could be enabled */
+    g_assert_cmpint(v, ==, 0);
+
+    /* enable csum */
+    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_DATA_CSUM_ENABLED);
+    /* check csum enable register has bit 0 set */
+    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
+    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
+    /* reading it as 32bit register returns same result */
+    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
+    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
+
+    /* disable csum */
+    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, 0);
+    /* check csum enable register has bit 0 clear */
+    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
+    g_assert_cmpint(v, ==, 0);
+
+    /* write to unsupported register '1' */
+    tpm_tis_i2c_writel(0, 1, 0x12345678);
+    v = tpm_tis_i2c_readl(0, 1);
+    g_assert_cmpint(v, ==, 0xffffffff);
+}
+
+static void tpm_tis_i2c_test_check_localities(const void *data)
+{
+    uint8_t locty, l;
+    uint8_t access;
+    uint32_t capability, i2c_cap;
+    uint32_t didvid;
+    uint32_t rid;
+
+    for (locty = 0; locty < TPM_TIS_NUM_LOCALITIES; locty++) {
+        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+        capability = tpm_tis_i2c_readl(locty, TPM_I2C_REG_INTF_CAPABILITY);
+        i2c_cap = (TPM_I2C_CAP_INTERFACE_TYPE |
+                   TPM_I2C_CAP_INTERFACE_VER  |
+                   TPM_I2C_CAP_TPM2_FAMILY    |
+                   TPM_I2C_CAP_LOCALITY_CAP   |
+                   TPM_I2C_CAP_BUS_SPEED      |
+                   TPM_I2C_CAP_DEV_ADDR_CHANGE);
+        g_assert_cmpint(capability, ==, i2c_cap);
+
+        didvid = tpm_tis_i2c_readl(locty, TPM_I2C_REG_DID_VID);
+        g_assert_cmpint(didvid, ==, (1 << 16) | PCI_VENDOR_ID_IBM);
+
+        rid = tpm_tis_i2c_readl(locty, TPM_I2C_REG_RID);
+        g_assert_cmpint(rid, !=, 0);
+        g_assert_cmpint(rid, !=, 0xffffffff);
+
+        /* locality selection must be at locty */
+        l = tpm_tis_i2c_readb(locty, TPM_I2C_REG_LOC_SEL);
+        g_assert_cmpint(l, ==, locty);
+    }
+}
+
+static void tpm_tis_i2c_test_check_access_reg(const void *data)
+{
+    uint8_t locty;
+    uint8_t access;
+
+    /* do not test locality 4 (hw only) */
+    for (locty = 0; locty < TPM_TIS_NUM_LOCALITIES - 1; locty++) {
+        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+        /* request use of locality */
+        tpm_tis_i2c_writeb(locty, TPM_I2C_REG_ACCESS,
+                           TPM_TIS_ACCESS_REQUEST_USE);
+
+        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+        /* release access */
+        tpm_tis_i2c_writeb(locty, TPM_I2C_REG_ACCESS,
+                           TPM_TIS_ACCESS_ACTIVE_LOCALITY);
+        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+    }
+}
+
+/*
+ * Test case for seizing access by a higher number locality
+ */
+static void tpm_tis_i2c_test_check_access_reg_seize(const void *data)
+{
+    int locty, l;
+    uint8_t access;
+    uint8_t pending_request_flag;
+
+    /* do not test locality 4 (hw only) */
+    for (locty = 0; locty < TPM_TIS_NUM_LOCALITIES - 1; locty++) {
+        pending_request_flag = 0;
+
+        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+        /* request use of locality */
+        tpm_tis_i2c_writeb(locty,
+                           TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_REQUEST_USE);
+        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+        /* lower localities cannot seize access */
+        for (l = 0; l < locty; l++) {
+            /* lower locality is not active */
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /* try to request use from 'l' */
+            tpm_tis_i2c_writeb(l,
+                               TPM_I2C_REG_ACCESS,
+                               TPM_TIS_ACCESS_REQUEST_USE);
+
+            /*
+             * requesting use from 'l' was not possible;
+             * we must see REQUEST_USE and possibly PENDING_REQUEST
+             */
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_REQUEST_USE |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /*
+             * locality 'locty' must be unchanged;
+             * we must see PENDING_REQUEST
+             */
+            access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                        TPM_TIS_ACCESS_PENDING_REQUEST |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /* try to seize from 'l' */
+            tpm_tis_i2c_writeb(l,
+                               TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_SEIZE);
+            /* seize from 'l' was not possible */
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_REQUEST_USE |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /* locality 'locty' must be unchanged */
+            access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                        TPM_TIS_ACCESS_PENDING_REQUEST |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /*
+             * on the next loop we will have a PENDING_REQUEST flag
+             * set for locality 'l'
+             */
+            pending_request_flag = TPM_TIS_ACCESS_PENDING_REQUEST;
+        }
+
+        /*
+         * higher localities can 'seize' access but not 'request use';
+         * note: this will activate first l+1, then l+2 etc.
+         */
+        for (l = locty + 1; l < TPM_TIS_NUM_LOCALITIES - 1; l++) {
+            /* try to 'request use' from 'l' */
+            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
+                               TPM_TIS_ACCESS_REQUEST_USE);
+
+            /*
+             * requesting use from 'l' was not possible; we should see
+             * REQUEST_USE and may see PENDING_REQUEST
+             */
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_REQUEST_USE |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /*
+             * locality 'l-1' must be unchanged; we should always
+             * see PENDING_REQUEST from 'l' requesting access
+             */
+            access = tpm_tis_i2c_readb(l - 1, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                        TPM_TIS_ACCESS_PENDING_REQUEST |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /* try to seize from 'l' */
+            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_SEIZE);
+
+            /* seize from 'l' was possible */
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /* l - 1 should show that it has BEEN_SEIZED */
+            access = tpm_tis_i2c_readb(l - 1, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_BEEN_SEIZED |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /* clear the BEEN_SEIZED flag and make sure it's gone */
+            tpm_tis_i2c_writeb(l - 1, TPM_I2C_REG_ACCESS,
+                               TPM_TIS_ACCESS_BEEN_SEIZED);
+
+            access = tpm_tis_i2c_readb(l - 1, TPM_I2C_REG_ACCESS);
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+        }
+
+        /*
+         * PENDING_REQUEST will not be set if locty = 0 since all localities
+         * were active; in case of locty = 1, locality 0 will be active
+         * but no PENDING_REQUEST anywhere
+         */
+        if (locty <= 1) {
+            pending_request_flag = 0;
+        }
+
+        /* release access from l - 1; this activates locty - 1 */
+        l--;
+
+        access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+        DPRINTF_ACCESS;
+
+        DPRINTF("%s: %d: relinquishing control on l = %d\n",
+                __func__, __LINE__, l);
+        tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
+                           TPM_TIS_ACCESS_ACTIVE_LOCALITY);
+
+        access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+        DPRINTF_ACCESS;
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    pending_request_flag |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+        for (l = locty - 1; l >= 0; l--) {
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+            /* release this locality */
+            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
+                               TPM_TIS_ACCESS_ACTIVE_LOCALITY);
+
+            if (l == 1) {
+                pending_request_flag = 0;
+            }
+        }
+
+        /* no locality may be active now */
+        for (l = 0; l < TPM_TIS_NUM_LOCALITIES - 1; l++) {
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+        }
+    }
+}
+
+/*
+ * Test case for getting access when higher number locality relinquishes access
+ */
+static void tpm_tis_i2c_test_check_access_reg_release(const void *data)
+{
+    int locty, l;
+    uint8_t access;
+    uint8_t pending_request_flag;
+
+    /* do not test locality 4 (hw only) */
+    for (locty = TPM_TIS_NUM_LOCALITIES - 2; locty >= 0; locty--) {
+        pending_request_flag = 0;
+
+        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+        /* request use of locality */
+        tpm_tis_i2c_writeb(locty, TPM_I2C_REG_ACCESS,
+                           TPM_TIS_ACCESS_REQUEST_USE);
+        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
+        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                    TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+        /* request use of all other localities */
+        for (l = 0; l < TPM_TIS_NUM_LOCALITIES - 1; l++) {
+            if (l == locty) {
+                continue;
+            }
+            /*
+             * request use of locality 'l' -- we MUST see REQUEST USE and
+             * may see PENDING_REQUEST
+             */
+            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
+                               TPM_TIS_ACCESS_REQUEST_USE);
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_REQUEST_USE |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+            pending_request_flag = TPM_TIS_ACCESS_PENDING_REQUEST;
+        }
+        /* release locality 'locty' */
+        tpm_tis_i2c_writeb(locty, TPM_I2C_REG_ACCESS,
+                           TPM_TIS_ACCESS_ACTIVE_LOCALITY);
+        /*
+         * highest locality should now be active; release it and make sure the
+         * next higest locality is active afterwards
+         */
+        for (l = TPM_TIS_NUM_LOCALITIES - 2; l >= 0; l--) {
+            if (l == locty) {
+                continue;
+            }
+            /* 'l' should be active now */
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+            /* 'l' relinquishes access */
+            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
+                               TPM_TIS_ACCESS_ACTIVE_LOCALITY);
+            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
+            DPRINTF_ACCESS;
+            if (l == 1 || (locty <= 1 && l == 2)) {
+                pending_request_flag = 0;
+            }
+            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                        pending_request_flag |
+                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+        }
+    }
+}
+
+/*
+ * Test case for transmitting packets
+ */
+static void tpm_tis_i2c_test_check_transmit(const void *data)
+{
+    const TPMTestState *s = data;
+    uint8_t access;
+    uint32_t sts, v;
+    uint16_t bcount, csum;
+    size_t i;
+
+    /* enable csum */
+    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_DATA_CSUM_ENABLED);
+    /* check csum enable register has bit 0 set */
+    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
+    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
+    /* reading it as 32bit register returns same result */
+    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
+    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
+
+    /* request use of locality 0 */
+    tpm_tis_i2c_writeb(0, TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_REQUEST_USE);
+    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
+    g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
+                                TPM_TIS_ACCESS_ACTIVE_LOCALITY |
+                                TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
+
+    sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
+    DPRINTF_STS;
+
+    g_assert_cmpint(sts & 0xff, ==, 0);
+
+    bcount = (sts >> 8) & 0xffff;
+    g_assert_cmpint(bcount, >=, 128);
+
+    /* ic2 must have bits 26-31 zero */
+    g_assert_cmpint(sts & (0x1f << 26), ==, 0);
+
+    tpm_tis_i2c_writel(0, TPM_I2C_REG_STS, TPM_TIS_STS_COMMAND_READY);
+    sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
+    DPRINTF_STS;
+    g_assert_cmpint(sts & 0xff, ==, TPM_TIS_STS_COMMAND_READY);
+
+    /* transmit command */
+    for (i = 0; i < sizeof(TPM_CMD); i++) {
+        tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_FIFO, TPM_CMD[i]);
+        sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
+        DPRINTF_STS;
+        if (i < sizeof(TPM_CMD) - 1) {
+            g_assert_cmpint(sts & 0xff, ==,
+                            TPM_TIS_STS_EXPECT | TPM_TIS_STS_VALID);
+        } else {
+            g_assert_cmpint(sts & 0xff, ==, TPM_TIS_STS_VALID);
+        }
+        g_assert_cmpint((sts >> 8) & 0xffff, ==, --bcount);
+    }
+    /* read the checksum */
+    csum = tpm_tis_i2c_readw(0, TPM_I2C_REG_DATA_CSUM_GET);
+    g_assert_cmpint(csum, ==, 0x6733);
+
+    /* start processing */
+    tpm_tis_i2c_writeb(0, TPM_I2C_REG_STS, TPM_TIS_STS_TPM_GO);
+
+    uint64_t end_time = g_get_monotonic_time() + 50 * G_TIME_SPAN_SECOND;
+    do {
+        sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
+        if ((sts & TPM_TIS_STS_DATA_AVAILABLE) != 0) {
+            break;
+        }
+    } while (g_get_monotonic_time() < end_time);
+
+    sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
+    DPRINTF_STS;
+    g_assert_cmpint(sts & 0xff, == ,
+                    TPM_TIS_STS_VALID | TPM_TIS_STS_DATA_AVAILABLE);
+    bcount = (sts >> 8) & 0xffff;
+
+    /* read response */
+    uint8_t tpm_msg[sizeof(struct tpm_hdr)];
+    g_assert_cmpint(sizeof(tpm_msg), ==, bcount);
+
+    for (i = 0; i < sizeof(tpm_msg); i++) {
+        tpm_msg[i] = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_FIFO);
+        sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
+        DPRINTF_STS;
+        if (sts & TPM_TIS_STS_DATA_AVAILABLE) {
+            g_assert_cmpint((sts >> 8) & 0xffff, ==, --bcount);
+        }
+    }
+    g_assert_cmpmem(tpm_msg, sizeof(tpm_msg), s->tpm_msg, sizeof(*s->tpm_msg));
+
+    /* relinquish use of locality 0 */
+    tpm_tis_i2c_writeb(0,
+                       TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_ACTIVE_LOCALITY);
+    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    char *args;
+    char *tmp_path = g_dir_make_tmp("qemu-tpm-tis-i2c-test.XXXXXX", NULL);
+    GThread *thread;
+    TPMTestState test;
+
+    module_call_init(MODULE_INIT_QOM);
+    g_test_init(&argc, &argv, NULL);
+
+    test.addr = g_new0(SocketAddress, 1);
+    test.addr->type = SOCKET_ADDRESS_TYPE_UNIX;
+    test.addr->u.q_unix.path = g_build_filename(tmp_path, "sock", NULL);
+    g_mutex_init(&test.data_mutex);
+    g_cond_init(&test.data_cond);
+    test.data_cond_signal = false;
+    test.tpm_version = TPM_VERSION_2_0;
+
+    thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
+    tpm_emu_test_wait_cond(&test);
+
+    aspeed_dev_addr = ast2600_aspeed_i2c_calc_dev_addr(I2C_DEV_BUS_NUM);
+
+    args = g_strdup_printf(
+        "-machine rainier-bmc -accel tcg "
+        "-chardev socket,id=chr,path=%s "
+        "-tpmdev emulator,id=tpm0,chardev=chr "
+        "-device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.%d,address=0x%x",
+        test.addr->u.q_unix.path,
+        I2C_DEV_BUS_NUM,
+        I2C_SLAVE_ADDR);
+    qtest_start(args);
+
+    qtest_add_data_func("/tpm-tis-i2c/test_basic", &test,
+                        tpm_tis_i2c_test_basic);
+
+    qtest_add_data_func("/tpm-tis-i2c/test_check_localities", &test,
+                        tpm_tis_i2c_test_check_localities);
+
+    qtest_add_data_func("/tpm-tis-i2c/check_access_reg", &test,
+                        tpm_tis_i2c_test_check_access_reg);
+
+    qtest_add_data_func("/tpm-tis-i2c/check_access_reg_seize", &test,
+                        tpm_tis_i2c_test_check_access_reg_seize);
+
+    qtest_add_data_func("/tpm-tis-i2c/check_access_reg_release", &test,
+                        tpm_tis_i2c_test_check_access_reg_release);
+
+    qtest_add_data_func("/tpm-tis-i2c/test_check_transmit", &test,
+                        tpm_tis_i2c_test_check_transmit);
+
+    ret = g_test_run();
+
+    qtest_end();
+
+    g_thread_join(thread);
+    g_unlink(test.addr->u.q_unix.path);
+    qapi_free_SocketAddress(test.addr);
+    g_rmdir(tmp_path);
+    g_free(tmp_path);
+    g_free(args);
+    return ret;
+}
-- 
2.39.2


