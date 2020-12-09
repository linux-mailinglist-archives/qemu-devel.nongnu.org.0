Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A402D47EF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:30:10 +0100 (CET)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3I1-0008AC-RM
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1kn3De-00064u-F3
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:25:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52254
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1kn3DZ-0001UO-6R
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:25:38 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9H2s24190082; Wed, 9 Dec 2020 12:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ch/ajEf1w21bCqbJ8O/s7tbiXtWKH0R4si53rxUB3GM=;
 b=jBVZTUK8ILxEgcZYPNbhLg9qn4rYkoi0Fswh91DphgbxiGr6VaYp5rj2CjS09OmjCF2e
 ht8IGDyv5UZiTrjXMmojGb7a3BvLY+ZYuEud0GZE9wxblrIHu0ecgr0k5c6UmNxRcsC0
 V1X9nSAl6kbrZRm4AWuRpYCqCzBjMtZNE5cAkjUURFkd50yqYOeqkRVUdp5Cazsklm2h
 wcFi87aSz/BnotJ7GTQGITYLMczZJJ0hlQE4Xqm6qtaS0cbQoaCGQQ5whWIUx/cnsnWy
 WZ2uIdj8aF8lLeT/6Q7zA29+bkc4KEcydmCH6VoJMFtxGQbI/Q4ivxpVrrc/E9j2+95W TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35b1gxjk0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:25:29 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9H35sK191389;
 Wed, 9 Dec 2020 12:25:29 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35b1gxjk09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:25:29 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HH5Rx012794;
 Wed, 9 Dec 2020 17:25:28 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3581u9sh3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:25:28 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9HPQAg27263320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:25:26 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ABCA2805A;
 Wed,  9 Dec 2020 17:25:26 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B872D28059;
 Wed,  9 Dec 2020 17:25:24 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.183.17])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:25:24 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] pc: add parser for OVMF reset block
Date: Wed,  9 Dec 2020 09:23:33 -0800
Message-Id: <20201209172334.14100-3-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209172334.14100-1-jejb@linux.ibm.com>
References: <20201209172334.14100-1-jejb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=1 phishscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jejb@linux.ibm.com, jon.grimm@amd.com, tobin@ibm.com,
 frankeh@us.ibm.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 dovmurik@linux.vnet.ibm.com, Dov.Murik1@il.ibm.com, pbonzini@redhat.com,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OVMF is developing a mechanism for depositing a GUIDed table just
below the known location of the reset vector.  The table goes
backwards in memory so all entries are of the form

<data>|len|<GUID>

Where <data> is arbtrary size and type, <len> is a uint16_t and
describes the entire length of the entry from the beginning of the
data to the end of the guid.

The foot of the table is of this form and <len> for this case
describes the entire size of the table.  The table foot GUID is
defined by OVMF as 96b582de-1fb2-45f7-baea-a366c55a082d and if the
table is present this GUID is just below the reset vector, 48 bytes
before the end of the firmware file.

Add a parser for the ovmf reset block which takes a copy of the block,
if the table foot guid is found, minus the footer and a function for
later traversal to return the data area of any specified GUIDs.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>
---
 hw/i386/pc_sysfw.c   | 95 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h |  4 ++
 2 files changed, 99 insertions(+)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index b6c0822fe3..bd8a16d620 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -133,6 +133,96 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
     }
 }
 
+#define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
+
+static uint8_t *ovmf_table;
+static int ovmf_table_len;
+
+static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, int flash_size)
+{
+    uint8_t *ptr;
+    QemuUUID guid;
+    int tot_len;
+
+    /* should only be called once */
+    if (ovmf_table)
+        return;
+
+    /*
+     * if this is OVMF there will be a table footer
+     * guid 48 bytes before the end of the flash file.  If it's
+     * not found, silently abort the flash parsing.
+     */
+    qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
+    guid = qemu_uuid_bswap(guid); /* guids are LE */
+    ptr = flash_ptr + flash_size - 48;
+    if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid))
+        return;
+
+    /* if found, just before is two byte table length */
+    ptr -= sizeof(uint16_t);
+    tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
+
+    if (tot_len <= 0)
+        return;
+
+    ovmf_table = g_malloc(tot_len);
+    ovmf_table_len = tot_len;
+
+    /*
+     * ptr is the foot of the table, so copy it all to the newly
+     * allocated ovmf_table and then set the ovmf_table pointer
+     * to the table foot
+     */
+    memcpy(ovmf_table, ptr - tot_len, tot_len);
+    ovmf_table += tot_len;
+}
+
+bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
+                               int *data_len)
+{
+    uint8_t *ptr = ovmf_table;
+    int tot_len = ovmf_table_len;
+    QemuUUID entry_guid;
+
+    if (qemu_uuid_parse(entry, &entry_guid) < 0)
+        return false;
+
+    if (!ptr)
+        return false;
+
+    entry_guid = qemu_uuid_bswap(entry_guid); /* guids are LE */
+    while (tot_len > 0) {
+        int len;
+        QemuUUID *guid;
+
+        /*
+         * The data structure is
+         *   arbitrary length data
+         *   2 byte length of entire entry
+         *   16 byte guid
+         */
+        guid = (QemuUUID *)(ptr - sizeof(QemuUUID));
+        len = le16_to_cpu(*(uint16_t *)(ptr - sizeof(QemuUUID) -
+                                        sizeof(uint16_t)));
+
+        /* just in case the table is corrupt, wouldn't want to spin */
+        if (!len)
+                return false;
+
+        ptr -= len;
+        tot_len -= len;
+        if (qemu_uuid_is_equal(guid, &entry_guid)) {
+            if (data)
+                *data = ptr;
+            if (data_len)
+                *data_len = len;
+            return true;
+        }
+    }
+    return false;
+}
+
 /*
  * Map the pcms->flash[] from 4GiB downward, and realize.
  * Map them in descending order, i.e. pcms->flash[0] at the top,
@@ -204,6 +294,11 @@ static void pc_system_flash_map(PCMachineState *pcms,
             if (kvm_memcrypt_enabled()) {
                 flash_ptr = memory_region_get_ram_ptr(flash_mem);
                 flash_size = memory_region_size(flash_mem);
+                /*
+                 * OVMF places a GUIDed structures in the flash, so
+                 * search for them
+                 */
+                pc_system_parse_ovmf_flash(flash_ptr, flash_size);
                 ret = kvm_memcrypt_encrypt_data(flash_ptr, flash_size);
                 if (ret) {
                     error_report("failed to encrypt pflash rom");
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 911e460097..a8c97fe822 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -3,6 +3,7 @@
 
 #include "qemu/notify.h"
 #include "qapi/qapi-types-common.h"
+#include "qemu/uuid.h"
 #include "hw/boards.h"
 #include "hw/block/fdc.h"
 #include "hw/block/flash.h"
@@ -186,6 +187,9 @@ ISADevice *pc_find_fdc0(void);
 void pc_system_flash_create(PCMachineState *pcms);
 void pc_system_flash_cleanup_unused(PCMachineState *pcms);
 void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
+bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
+                               int *data_len);
+
 
 /* acpi-build.c */
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-- 
2.26.2


