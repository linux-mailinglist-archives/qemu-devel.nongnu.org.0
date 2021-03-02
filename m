Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEAD32AC1F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:11:59 +0100 (CET)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCJC-0001ge-Jh
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwh-0001bD-T2
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwc-000860-NQ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:43 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KhCLd154864; Tue, 2 Mar 2021 15:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J2RxgLr7JRwgCZoLLrGN0Mxfw0E2qRB7yyRuPjyEZjc=;
 b=LxKNC5AeTgsjNtepnt9VzW+we7L5Sivr2h/c4XEmlUQlKCKU6BoCf6AkJzaJOa5OEsMU
 JkEbNlBIURjKxRVrTgvuojc9dFwMA3nJC8mrrfgxnH/37Xd9VpBko4G+jV9eUBJTweL8
 /mwy8z5dl5BMhlwUFDLoLhgR8gM36f/mAhJZ+ZaKv7O+pczuZFuMMRwCVfG3rfSBXZtV
 WKG/mWl9bh3rVxp0+0kh3KtgYeDf4UdMO0ebx+r9aKTz9N2XTUlfafONLjNJ7XX3zvtE
 +36+OG7yJ4333+UlPlzNl5jwD3y4tSEZoMNcLYBxN7xDBEy4LdQvuWFJE8879hMmF85W HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn4r8w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:35 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KhP7H159450;
 Tue, 2 Mar 2021 15:48:34 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn4r8v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KmRMl008437;
 Tue, 2 Mar 2021 20:48:33 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 36ydq988kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:33 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmWsq43909560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D5942805E;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32AA828058;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/26] migration: Save confidential guest RAM using
 migration helper
Date: Tue,  2 Mar 2021 15:48:11 -0500
Message-Id: <20210302204822.81901-16-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Juan Quintela <quintela@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When saving RAM pages of a confidential guest, check whether a page is
encrypted.  If it is, ask the in-guest migration helper to encrypt the
page for transmission.

This relies on ability to track the encryption status of each page
according to guest's reports, and thus requires the relevant patches in
the guest OS and OVMF and the host KVM and QEMU.  This is all
encapsulated in is_page_encrypted; the implementation can be modified
according to the underlying implementation of page encryption status
tracking (bitmap / KVM shared regions list / user-side list)

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 migration/ram.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 997f90cc5b..8e55ed49fd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -53,10 +53,13 @@
 #include "block.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-throttle.h"
+#include "sysemu/kvm.h"
 #include "savevm.h"
 #include "qemu/iov.h"
 #include "multifd.h"
 #include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "confidential-ram.h"
 
 #if defined(__linux__)
 #include "qemu/userfaultfd.h"
@@ -81,6 +84,7 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_GUEST_ENCRYPTED_PAGE    0x200
 
 static inline bool memcrypt_enabled(void)
 {
@@ -94,6 +98,13 @@ static inline bool is_zero_range(uint8_t *p, uint64_t size)
     return buffer_is_zero(p, size);
 }
 
+static inline bool confidential_guest(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    return ms->cgs;
+}
+
 XBZRLECacheStats xbzrle_counters;
 
 /* struct contains XBZRLE cache and a static page
@@ -660,6 +671,23 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
     }
 }
 
+/**
+ * is_page_encrypted: check if the page is encrypted
+ *
+ * Returns a bool indicating whether the page is encrypted.
+ */
+static bool is_page_encrypted(RAMState *rs, RAMBlock *block, unsigned long page)
+{
+    /* ROM devices contain unencrypted data */
+    if (memory_region_is_romd(block->mr) ||
+        memory_region_is_rom(block->mr) ||
+        !memory_region_is_ram(block->mr)) {
+        return false;
+    }
+
+    return test_bit(page, block->encbmap);
+}
+
 /**
  * xbzrle_cache_zero_page: insert a zero page in the XBZRLE cache
  *
@@ -1928,6 +1956,45 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
     return false;
 }
 
+/**
+ * ram_save_encrypted_page - send the given encrypted page to the stream
+ *
+ * Return the number of pages written (=1).
+ */
+static int ram_save_encrypted_page(RAMState *rs, PageSearchStatus *pss,
+                                   bool last_stage)
+{
+    int ret;
+    uint8_t *p;
+    RAMBlock *block = pss->block;
+    ram_addr_t offset = pss->page << TARGET_PAGE_BITS;
+    ram_addr_t gpa;
+    uint64_t bytes_sent;
+
+    p = block->host + offset;
+
+    /* Find the GPA of the page */
+    if (!kvm_physical_memory_addr_from_host(kvm_state, p, &gpa)) {
+        error_report("%s failed to get gpa for offset %" PRIu64 " block %s",
+                     __func__, offset, memory_region_name(block->mr));
+        return -1;
+    }
+
+    ram_counters.transferred +=
+        save_page_header(rs, rs->f, block,
+                    offset | RAM_SAVE_FLAG_GUEST_ENCRYPTED_PAGE);
+
+    ret = cgs_mh_save_encrypted_page(rs->f, gpa, TARGET_PAGE_SIZE, &bytes_sent);
+    if (ret) {
+        return -1;
+    }
+
+    ram_counters.transferred += bytes_sent;
+    ram_counters.normal++;
+
+    return 1;
+}
+
 /**
  * ram_save_target_page: save one target page
  *
@@ -1948,6 +2015,26 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
         return res;
     }
 
+    /*
+     * If memory encryption is enabled then skip saving the data pages used by
+     * the migration handler.
+     */
+    if (confidential_guest() &&
+        gpa_inside_migration_helper_shared_area(offset)) {
+        return 0;
+    }
+
+    /*
+     * If memory encryption is enabled then use memory encryption APIs
+     * to write the outgoing buffer to the wire. The encryption APIs
+     * will take care of accessing the guest memory and re-encrypt it
+     * for the transport purposes.
+     */
+    if (confidential_guest() &&
+        is_page_encrypted(rs, pss->block, pss->page)) {
+        return ram_save_encrypted_page(rs, pss, last_stage);
+    }
+
     if (save_compress_page(rs, block, offset)) {
         return 1;
     }
@@ -2776,6 +2863,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
         return -1;
     }
 
+    if (confidential_guest()) {
+        cgs_mh_init();
+    }
+
     /* migration has already setup the bitmap, reuse it. */
     if (!migration_in_colo_state()) {
         if (ram_init_all(rsp) != 0) {
-- 
2.20.1


