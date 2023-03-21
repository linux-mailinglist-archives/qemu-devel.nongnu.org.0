Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1F6C32BA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:23:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebx0-0003zD-5O; Tue, 21 Mar 2023 09:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1peUZr-0001sS-OZ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 01:30:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1peUZp-0008MD-Td
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 01:30:31 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32L4shpX029106; Tue, 21 Mar 2023 05:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=C1AZ4wfwgVOwqpFlw7CaI4DSaQgxPLiqvNjBQvEQ4v8=;
 b=LNYAKp7fCo6mEMU19/sL6YzAuxcVvny2GToadr9OLQpgZlP+6sfenW9GNbZdTmJgfg8P
 5w6MPV74v9vOggaGUFgaiaHNN/7S+dMH5deC1Z7VleIuXxWNrkyLoDfqYZ4HZCVvp7E4
 ptxjsmFotPPlTMapkSJeR0T2ngASPfHqg0nyxNeuTi/REPbrFEqIZQzztGcH1EhXBPbK
 dli6tkMLB9DQMyqrEc/uI032swxm6ys9AzkcNjaIG1STuzvwnNvintYIwbY0f8s6CFO3
 4kHuhpAwylgfJJwIKR9yP88COxQu1esPcUa0OosLn84LjptywPjAPpAcSQkySJTa4/Q+ vw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pf5yj8kvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 05:30:14 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32L4KckP011261;
 Tue, 21 Mar 2023 05:30:13 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7cypq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 05:30:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32L5UBx51639098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Mar 2023 05:30:11 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12A5C58056;
 Tue, 21 Mar 2023 05:30:11 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1A8058062;
 Tue, 21 Mar 2023 05:30:10 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 21 Mar 2023 05:30:10 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 4F76A2E5675; Tue, 21 Mar 2023 00:30:10 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH 2/3] Add support for TPM devices over I2C bus
Date: Tue, 21 Mar 2023 00:30:00 -0500
Message-Id: <20230321053001.3886666-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230321053001.3886666-1-ninad@linux.ibm.com>
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HxDJXvv40n1tiG4X2jHIDT79mFm_kd6d
X-Proofpoint-ORIG-GUID: HxDJXvv40n1tiG4X2jHIDT79mFm_kd6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_02,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210040
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Mar 2023 09:22:50 -0400
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
 hw/tpm/tpm_tis.h        |  2 ++
 hw/tpm/tpm_tis_common.c | 33 +++++++++++++++++++++++++++++++++
 include/hw/acpi/tpm.h   |  2 ++
 3 files changed, 37 insertions(+)

diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
index f6b5872ba6..16b7baddd8 100644
--- a/hw/tpm/tpm_tis.h
+++ b/hw/tpm/tpm_tis.h
@@ -86,5 +86,7 @@ int tpm_tis_pre_save(TPMState *s);
 void tpm_tis_reset(TPMState *s);
 enum TPMVersion tpm_tis_get_tpm_version(TPMState *s);
 void tpm_tis_request_completed(TPMState *s, int ret);
+uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size);
+void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, uint32_t size);
 
 #endif /* TPM_TPM_TIS_H */
diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
index 503be2a541..3c82f63179 100644
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
@@ -422,6 +424,9 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
             shift = 0; /* no more adjustments */
         }
         break;
+    case TPM_TIS_REG_DATA_CSUM_GET:
+        val = bswap16(crc_ccitt(0, s->buffer, s->rw_offset));
+        break;
     case TPM_TIS_REG_INTERFACE_ID:
         val = s->loc[locty].iface_id;
         break;
@@ -447,6 +452,15 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
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
 /*
  * Write a value to a register of the TIS interface
  * See specs pages 33-63 for description of the registers
@@ -600,6 +614,15 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
     case TPM_TIS_REG_INT_VECTOR:
         /* hard wired -- ignore */
         break;
+    case TPM_TIS_REG_DATA_CSUM_ENABLE:
+        /*
+         * Checksum implemented by common code so no need to set
+         * any flags.
+         */
+        break;
+    case TPM_TIS_REG_DATA_CSUM_GET:
+        /* This is readonly register so ignore */
+        break;
     case TPM_TIS_REG_INT_STATUS:
         if (s->active_locty != locty) {
             break;
@@ -703,6 +726,7 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
         break;
     case TPM_TIS_REG_DATA_FIFO:
     case TPM_TIS_REG_DATA_XFIFO ... TPM_TIS_REG_DATA_XFIFO_END:
+
         /* data fifo */
         if (s->active_locty != locty) {
             break;
@@ -767,6 +791,15 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
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
index 559ba6906c..db12c002f4 100644
--- a/include/hw/acpi/tpm.h
+++ b/include/hw/acpi/tpm.h
@@ -40,6 +40,8 @@
 #define TPM_TIS_REG_STS                   0x18
 #define TPM_TIS_REG_DATA_FIFO             0x24
 #define TPM_TIS_REG_INTERFACE_ID          0x30
+#define TPM_TIS_REG_DATA_CSUM_ENABLE      0x40
+#define TPM_TIS_REG_DATA_CSUM_GET         0x44
 #define TPM_TIS_REG_DATA_XFIFO            0x80
 #define TPM_TIS_REG_DATA_XFIFO_END        0xbc
 #define TPM_TIS_REG_DID_VID               0xf00
-- 
2.37.2


