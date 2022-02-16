Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DA4B8176
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:24:51 +0100 (CET)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEgD-0001nh-HL
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:24:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nKDzq-0000om-5y
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:41:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nKDzm-0000Rx-BW
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:41:01 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G6GXJj009174; 
 Wed, 16 Feb 2022 06:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=UplMIicmVJFETu5b03Q8fO54s06ENB3Z4mXb8hjMlD4=;
 b=QUKlZkAJnql1jBl98MyGzMueivVOoWJkj7J/G9A5F/uxyRUVkNssiT1pT3+w26G4AJTr
 aZbBRi6EkSpiP0swH4ROonSAn1AVTfc76JPgknt9lWyv6N4c6bUtcehLGiIEof6mrPKk
 OpNsZv6i8zc6kenCWDAjsbBIJi/InV/1ivdlyIC111doN8A8zoYL6i3CtVlkOIbM1JUz
 NbvUVhNf5PVhBKjwoJHh5YfxuQF/8utUyUM5pwAsMK1L2MeQj3ScBX6WBqfoglzfnBOR
 Aqi6GXIVysV92QEgK9wVjc2+Qxspni8D8/FM8/UQ5MeRQGciaVp+E2AA9xC1Jh9w1TrW cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8uuy8e7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 06:40:40 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21G6Y3PV003759;
 Wed, 16 Feb 2022 06:40:40 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8uuy8e7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 06:40:40 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G6ai6A014241;
 Wed, 16 Feb 2022 06:40:39 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3e64hbua23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 06:40:39 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G6ebfx23986612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 06:40:37 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18305B2064;
 Wed, 16 Feb 2022 06:40:37 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAE00B2068;
 Wed, 16 Feb 2022 06:40:36 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 06:40:36 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/i386: Improve bounds checking in OVMF table parsing
Date: Wed, 16 Feb 2022 06:40:24 +0000
Message-Id: <20220216064024.153423-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zpb8LutVvsKqUyztcyrmG7qJvVpLJvM_
X-Proofpoint-ORIG-GUID: EUKxBKKDKN0yIVj6t5pQfkVBtq7SdA4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_02,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160034
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When pc_system_parse_ovmf_flash() parses the optional GUIDed table in
the end of the OVMF flash memory area, the table length field is checked
for sizes that are too small, but doesn't error on sizes that are too
big (bigger than the flash content itself).

Add a check for maximal size of the OVMF table, and add an error report
in case the size is invalid.  In such a case, an error like this will be
displayed during launch:

    qemu-system-x86_64: OVMF table has invalid size 4047

and the table parsing is skipped.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

---

v2:
- add error message example to commit description
- replace magic numbers 48 and 50 with size calculations (thanks Phil MD)
---
 hw/i386/pc_sysfw_ovmf.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
index f4dd92c588..1c9a16e9e6 100644
--- a/hw/i386/pc_sysfw_ovmf.c
+++ b/hw/i386/pc_sysfw_ovmf.c
@@ -24,11 +24,14 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/i386/pc.h"
 #include "cpu.h"
 
 #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
 
+static const int bytes_after_table_footer = 32;
+
 static bool ovmf_flash_parsed;
 static uint8_t *ovmf_table;
 static int ovmf_table_len;
@@ -38,6 +41,8 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
     uint8_t *ptr;
     QemuUUID guid;
     int tot_len;
+    int max_tot_len = flash_size - (bytes_after_table_footer +
+                                    sizeof(guid) + sizeof(uint16_t));
 
     /* should only be called once */
     if (ovmf_flash_parsed) {
@@ -52,12 +57,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
 
     /*
      * if this is OVMF there will be a table footer
-     * guid 48 bytes before the end of the flash file.  If it's
-     * not found, silently abort the flash parsing.
+     * guid 48 bytes before the end of the flash file
+     * (= 32 bytes after the table + 16 bytes the GUID itself).
+     * If it's not found, silently abort the flash parsing.
      */
     qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
     guid = qemu_uuid_bswap(guid); /* guids are LE */
-    ptr = flash_ptr + flash_size - 48;
+    ptr = flash_ptr + flash_size - (bytes_after_table_footer + sizeof(guid));
     if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
         return;
     }
@@ -66,7 +72,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
     ptr -= sizeof(uint16_t);
     tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
 
-    if (tot_len <= 0) {
+    if (tot_len < 0 || tot_len > max_tot_len) {
+        error_report("OVMF table has invalid size %d", tot_len);
+        return;
+    }
+
+    if (tot_len == 0) {
+        /* no entries in the OVMF table */
         return;
     }
 

base-commit: 48033ad678ae2def43bf0d543a2c4c3d2a93feaf
-- 
2.25.1


