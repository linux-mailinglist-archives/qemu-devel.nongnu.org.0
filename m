Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EFE6C8AF1
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 05:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfvfe-0007vi-5s; Sat, 25 Mar 2023 00:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfvfb-0007vQ-GM
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 00:38:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfvfZ-0002oZ-IT
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 00:38:23 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32P357EB029180; Sat, 25 Mar 2023 04:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Q1ZhET19VdhlP3hiU6Hz/Oa0zgnp23tGF2YQqVw7an8=;
 b=igqT3kxj1ASGPvjf2JTscdW3DPj8VHZXqZOuUh2Z+7eQmVzn/klvtXc2qbRK73eFvVAd
 aUYocF2p4GMaZIc8r/BedWteXwH+DnPwLLf+qRZbLz+S6TtKAXZJHr8jQG8bUO6eddgw
 0Sj6/Up1t8ZGykXAW9HvROUVj3YMHC7KcCBgNxe02/7bMUvWROCQw7AfaWgPpoM4ntoS
 imtzxvPfwdok1XP5+Kic/jjH+b73peAp3r9+vQMBjVtW+IQTcqwg5jbd5WimcgS89wva
 x6YdsCaQgB2putAucBzeN2zCuAQn19volvy5HTtfzr4X+TjBKLY4967UymX76eo8MDzE Rg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phrr7h66a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Mar 2023 04:37:56 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32P2sNQI029133;
 Sat, 25 Mar 2023 04:37:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3phrk6gee1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Mar 2023 04:37:55 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32P4brLB8847972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 Mar 2023 04:37:53 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13D7658068;
 Sat, 25 Mar 2023 04:37:53 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0537D58056;
 Sat, 25 Mar 2023 04:37:53 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Sat, 25 Mar 2023 04:37:52 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id B23EE2E5676; Fri, 24 Mar 2023 23:37:52 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v4 2/3] tpm: Extend common APIs to support TPM TIS I2C
Date: Fri, 24 Mar 2023 23:37:50 -0500
Message-Id: <20230325043751.3559591-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230325043751.3559591-1-ninad@linux.ibm.com>
References: <20230325043751.3559591-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6W_JJdDEqzF1oUtFfDyv3tvXonuuevM1
X-Proofpoint-ORIG-GUID: 6W_JJdDEqzF1oUtFfDyv3tvXonuuevM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303250036
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@us.ibm.com;
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

Qemu already supports devices attached to ISA and sysbus. This drop adds
support for the I2C bus attached TPM devices.

This commit includes changes for the common code.
- Added support for the new checksum registers which are required for
  the I2C support. The checksum calculation is handled in the qemu
  common code.
- Added wrapper function for read and write data so that I2C code can
  call it without MMIO interface.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
V2:

Incorporated Stephen's comments.

- Removed checksum enable and checksum get registers.
- Added checksum calculation function which can be called from
  i2c layer.

---
V3:
Incorporated review comments from Cedric and Stefan.

- Pass locality to the checksum calculation function and cleanup
- Moved I2C related definations in the acpi/tpm.h

---
V4:

Incorporated review comments by Stefan

- Remove the check for locality while calculating checksum
- Use bswap16 instead of cpu_ti_be16.
- Rename TPM_I2C register by dropping _TIS_ from it.
---
 hw/tpm/tpm_tis.h        |  3 +++
 hw/tpm/tpm_tis_common.c | 28 ++++++++++++++++++++++++++++
 include/hw/acpi/tpm.h   | 28 ++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
index f6b5872ba6..6f29a508dd 100644
--- a/hw/tpm/tpm_tis.h
+++ b/hw/tpm/tpm_tis.h
@@ -86,5 +86,8 @@ int tpm_tis_pre_save(TPMState *s);
 void tpm_tis_reset(TPMState *s);
 enum TPMVersion tpm_tis_get_tpm_version(TPMState *s);
 void tpm_tis_request_completed(TPMState *s, int ret);
+uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size);
+void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, uint32_t size);
+uint16_t tpm_tis_get_checksum(TPMState *s);
 
 #endif /* TPM_TPM_TIS_H */
diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
index 503be2a541..c6d139943e 100644
--- a/hw/tpm/tpm_tis_common.c
+++ b/hw/tpm/tpm_tis_common.c
@@ -26,6 +26,8 @@
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "qapi/error.h"
+#include "qemu/bswap.h"
+#include "qemu/crc-ccitt.h"
 #include "qemu/module.h"
 
 #include "hw/acpi/tpm.h"
@@ -447,6 +449,23 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
     return val;
 }
 
+/*
+ * A wrapper read function so that it can be directly called without
+ * mmio.
+ */
+uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size)
+{
+    return tpm_tis_mmio_read(s, addr, size);
+}
+
+/*
+ * Calculate current data buffer checksum
+ */
+uint16_t tpm_tis_get_checksum(TPMState *s)
+{
+    return bswap16(crc_ccitt(0, s->buffer, s->rw_offset));
+}
+
 /*
  * Write a value to a register of the TIS interface
  * See specs pages 33-63 for description of the registers
@@ -767,6 +786,15 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
     }
 }
 
+/*
+ * A wrapper write function so that it can be directly called without
+ * mmio.
+ */
+void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, uint32_t size)
+{
+    tpm_tis_mmio_write(s, addr, val, size);
+}
+
 const MemoryRegionOps tpm_tis_memory_ops = {
     .read = tpm_tis_mmio_read,
     .write = tpm_tis_mmio_write,
diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
index 559ba6906c..4f2424e2fe 100644
--- a/include/hw/acpi/tpm.h
+++ b/include/hw/acpi/tpm.h
@@ -93,6 +93,7 @@
 #define TPM_TIS_CAP_DATA_TRANSFER_64B    (3 << 9)
 #define TPM_TIS_CAP_DATA_TRANSFER_LEGACY (0 << 9)
 #define TPM_TIS_CAP_BURST_COUNT_DYNAMIC  (0 << 8)
+#define TPM_TIS_CAP_BURST_COUNT_STATIC   (1 << 8)
 #define TPM_TIS_CAP_INTERRUPT_LOW_LEVEL  (1 << 4) /* support is mandatory */
 #define TPM_TIS_CAPABILITIES_SUPPORTED1_3 \
     (TPM_TIS_CAP_INTERRUPT_LOW_LEVEL | \
@@ -209,6 +210,33 @@ REG32(CRB_DATA_BUFFER, 0x80)
 #define TPM_PPI_FUNC_ALLOWED_USR_NOT_REQ (4 << 0)
 #define TPM_PPI_FUNC_MASK                (7 << 0)
 
+/* TPM TIS I2C registers */
+#define TPM_I2C_REG_LOC_SEL              0x00
+#define TPM_I2C_REG_ACCESS               0x04
+#define TPM_I2C_REG_INT_ENABLE           0x08
+#define TPM_I2C_REG_INT_CAPABILITY       0x14
+#define TPM_I2C_REG_STS                  0x18
+#define TPM_I2C_REG_DATA_FIFO            0x24
+#define TPM_I2C_REG_INTF_CAPABILITY      0x30
+#define TPM_I2C_REG_I2C_DEV_ADDRESS      0x38
+#define TPM_I2C_REG_DATA_CSUM_ENABLE     0x40
+#define TPM_I2C_REG_DATA_CSUM_GET        0x44
+#define TPM_I2C_REG_DID_VID              0x48
+#define TPM_I2C_REG_RID                  0x4c
+#define TPM_I2C_REG_UNKNOWN              0xff
+
+/* I2C specific interface capabilities */
+#define TPM_I2C_CAP_INTERFACE_TYPE     (0x2 << 0)       /* FIFO interface */
+#define TPM_I2C_CAP_INTERFACE_VER      (0x0 << 4)       /* TCG I2C intf 1.0 */
+#define TPM_I2C_CAP_TPM2_FAMILY        (0x1 << 7)       /* TPM 2.0 family. */
+#define TPM_I2C_CAP_DEV_ADDR_CHANGE    (0x0 << 27)      /* No dev addr chng */
+#define TPM_I2C_CAP_BURST_COUNT_STATIC (0x1 << 29)      /* Burst count static */
+#define TPM_I2C_CAP_LOCALITY_CAP       (0x1 << 25)      /* 0-5 locality */
+#define TPM_I2C_CAP_BUS_SPEED          (3   << 21)      /* std and fast mode */
+
+/* TPM_STS mask for read bits 31:26 must be zero */
+#define TPM_I2C_STS_READ_MASK          0x03ffffff
+
 void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev);
 
 #endif /* CONFIG_TPM */
-- 
2.37.2


