Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484286C5CFE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 04:02:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfBCx-0005qJ-Qp; Wed, 22 Mar 2023 23:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfBCu-0005q4-U0
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 23:01:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfBCs-0004yY-DU
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 23:01:40 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32N0Rq7I000611; Thu, 23 Mar 2023 03:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/WuEojjjbMeWSu1DKfvmbV5koJKubc4PFj1gw7fT42Q=;
 b=odNnL8i40CxuBsvF8gMcQNVdw7euGs1vQcPzzb73PnHm1eAJibszKW0U3gvwdRkVGqxS
 GW/nGp5k5zEx4Y9mq2wuhnwTgGzEC1zdUG/6a9vCE3va1FV0+ucg3yjijfgW49BBwdb5
 kuboguBEJgYD1LCVooji1iQYEJNRLp5NMBfnfOO2eGNJVds7fRg45s2lrDzaJQPHCEP/
 wJH78xBaVIWVI4TmMm+bKgfw9LITMaXXQXNcxp3R2HnBkLYOnyhqVtYgqgrc7aLPsdso
 6f5CkhhbCaqWml6tQTtrQx4mSE7Kxor8gu21waA7IoegiRpEOGZw7tRMc66dAXp+jLGZ DA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgc8damt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 03:01:26 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32N1Y66K019559;
 Thu, 23 Mar 2023 03:01:25 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x73n1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 03:01:25 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32N31Mh131851164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 03:01:22 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71F0D58065;
 Thu, 23 Mar 2023 03:01:22 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 635ED58062;
 Thu, 23 Mar 2023 03:01:22 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Mar 2023 03:01:22 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 1D3102E5675; Wed, 22 Mar 2023 22:01:22 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH 2/3] TPM TIS: Add support for TPM devices over I2C bus
Date: Wed, 22 Mar 2023 22:01:18 -0500
Message-Id: <20230323030119.2113570-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323030119.2113570-1-ninad@linux.ibm.com>
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AAiAmV1mYMgz3WvtDkGiN2UKKUqxPgi-
X-Proofpoint-GUID: AAiAmV1mYMgz3WvtDkGiN2UKKUqxPgi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230018
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/tpm/tpm_tis.h        |  3 +++
 hw/tpm/tpm_tis_common.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

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
index 503be2a541..b1acde74cb 100644
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
@@ -447,6 +449,27 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
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
+    uint16_t val = 0xffff;
+
+    val = cpu_to_be16(crc_ccitt(0, s->buffer, s->rw_offset));
+
+    return val;
+}
+
 /*
  * Write a value to a register of the TIS interface
  * See specs pages 33-63 for description of the registers
@@ -767,6 +790,15 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
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
-- 
2.37.2


