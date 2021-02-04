Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1B030FD3E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:50:08 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kdj-00055w-2p
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l7kUJ-0002le-Da
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:40:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l7kUH-00068s-9Z
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:40:23 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114JZaeR047819; Thu, 4 Feb 2021 14:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XeF6SjxQBRr1vOUBLVNYEP4918ZfK22ED/VcSJPDxWU=;
 b=sH8kaZDyyhhdW8f6/cbxHvueLMJpg4RkIzpA0wXl87dGTAl6lFAnuD2t7cMe3dhS/sTl
 4Ooe91HgbD+DGbAlEBKX6cntxwYDql2v3c5eGaqXys1j0MkTYoMF953LHQPrLejWZ5pv
 jqww4dZ3Zzd84TcBDZL7fTYfJo/0d62XQJ4jnJy6AG0Aae7XR652Q2tP7AE3wDl3SKmn
 ImYNxY2jE98wH+YKT5taO0NlulNjCNPoUlbarLvqKvWLN9kXwJT9k1U/YOmjSwDlOyDU
 f9NNq0s4tO9v3Pxs1zXBklW05aFCLDfhvpGd6gKoS1HXr0ee6KiOZ0NU55VSdw+hMaTr xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gn5tbjsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 14:40:18 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114JZsdB050256;
 Thu, 4 Feb 2021 14:40:18 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gn5tbjs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 14:40:18 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114Jc8ks019409;
 Thu, 4 Feb 2021 19:40:17 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 36f3kvs1f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 19:40:17 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114JeD4x24772936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 19:40:14 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D90336A051;
 Thu,  4 Feb 2021 19:40:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7703D6A047;
 Thu,  4 Feb 2021 19:40:11 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.153.205])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 19:40:11 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] pc: add parser for OVMF reset block
Date: Thu,  4 Feb 2021 11:39:38 -0800
Message-Id: <20210204193939.16617-2-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204193939.16617-1-jejb@linux.ibm.com>
References: <20210204193939.16617-1-jejb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_10:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040114
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

v2: fix brace warnings and return values
v3: add bounds checking for flash tables
---
 hw/i386/pc_sysfw.c   | 112 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h |   4 ++
 2 files changed, 116 insertions(+)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 92e90ff013..8ef73dbc3a 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -124,6 +124,113 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
     }
 }
 
+#define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
+
+static uint8_t *ovmf_table;
+static int ovmf_table_len;
+
+static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
+{
+    uint8_t *ptr;
+    QemuUUID guid;
+    int tot_len;
+
+    /* should only be called once */
+    if (ovmf_table) {
+        return;
+    }
+
+    if (flash_size < TARGET_PAGE_SIZE) {
+        return;
+    }
+
+    /*
+     * if this is OVMF there will be a table footer
+     * guid 48 bytes before the end of the flash file.  If it's
+     * not found, silently abort the flash parsing.
+     */
+    qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
+    guid = qemu_uuid_bswap(guid); /* guids are LE */
+    ptr = flash_ptr + flash_size - 48;
+    if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
+        return;
+    }
+
+    /* if found, just before is two byte table length */
+    ptr -= sizeof(uint16_t);
+    tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
+
+    if (tot_len <= 0) {
+        return;
+    }
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
+    if (qemu_uuid_parse(entry, &entry_guid) < 0) {
+        return false;
+    }
+
+    if (!ptr) {
+        return false;
+    }
+
+    entry_guid = qemu_uuid_bswap(entry_guid); /* guids are LE */
+    while (tot_len >= sizeof(QemuUUID) + sizeof(uint16_t)) {
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
+        /*
+         * just in case the table is corrupt, wouldn't want to spin in
+         * the zero case
+         */
+        if (len < sizeof(QemuUUID) + sizeof(uint16_t)) {
+            return false;
+        } else if (len > tot_len) {
+            return false;
+        }
+
+        ptr -= len;
+        tot_len -= len;
+        if (qemu_uuid_is_equal(guid, &entry_guid)) {
+            if (data) {
+                *data = ptr;
+            }
+            if (data_len) {
+                *data_len = len - sizeof(QemuUUID) - sizeof(uint16_t);
+            }
+            return true;
+        }
+    }
+    return false;
+}
+
 /*
  * Map the pcms->flash[] from 4GiB downward, and realize.
  * Map them in descending order, i.e. pcms->flash[0] at the top,
@@ -195,6 +302,11 @@ static void pc_system_flash_map(PCMachineState *pcms,
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
index 2aa8797c6e..19a53f745f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -3,6 +3,7 @@
 
 #include "qemu/notify.h"
 #include "qapi/qapi-types-common.h"
+#include "qemu/uuid.h"
 #include "hw/boards.h"
 #include "hw/block/fdc.h"
 #include "hw/block/flash.h"
@@ -188,6 +189,9 @@ ISADevice *pc_find_fdc0(void);
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


