Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB9B3F4C38
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:19:13 +0200 (CEST)
Received: from localhost ([::1]:44006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAn5-00019y-Ba
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl3-0006kY-Bf
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50756
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAky-0000uB-7d
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:01 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NE4INn102836; Mon, 23 Aug 2021 10:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zrPVXWstP3zcqRv37D+U63kE6tg7L8Q5T1W8qwO8xSE=;
 b=AAbvFAfp6DaXJJA+C9RCUrvsaJ3meh2HbqZwKbWud1KfbJFQpazX+wfGQgk4TLOFhARx
 OjP2TQi3t4ciGwqrc2c3IHnmKXLokoRttp5SjTWT+fF9POQyR91YRRKLJDexkRifeh/E
 UHmdrXH/QkdNNiQDTZaX5oa7hCD4l+HkAF+I9t8aUyJwdLu+zU1hZlw5S49/bHFTQgJd
 j51/a2jjA6H3eUFXPYi0+JnlLKmG0QsicDa+5RqeXGY5APJJJ5iUWcuYGf6KZxT8duYd
 6cChm5KISemKpc0Aj9djAqwL5nPGc8YdO7mpP+WDURo3/J/8VHpwXiUDKKo9f6A7HnlZ Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3akexysruv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:50 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE4N5D103555;
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3akexysruc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDDsG023036;
 Mon, 23 Aug 2021 14:16:49 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3ajs4bkk37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:16:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGlro10224128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87289112061;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D9A611206F;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 04/12] migration: Save confidential guest RAM using
 migration helper
Date: Mon, 23 Aug 2021 10:16:28 -0400
Message-Id: <20210823141636.65975-5-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823141636.65975-1-dovmurik@linux.ibm.com>
References: <20210823141636.65975-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PqFBxdy28VW5yN83PpUXrrTYvFmmFXuC
X-Proofpoint-ORIG-GUID: _-T8wRSMkI9EDJ59C3Nvj9p9GdTuYS5z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108230098
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Steve Rutherford <srutherford@google.com>,
 James Bottomley <jejb@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When saving RAM pages of a confidential guest, check whether a page is
encrypted.  If it is, ask the in-guest migration helper to encrypt the
page for transmission.

This patch forces the use of in-guest migration handler instead of the
PSP-based SEV migration; this is just a temporary example.  TODO
introduce migration parameter for choosing this migration mode.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 include/sysemu/sev.h |   1 +
 migration/ram.c      | 109 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 101 insertions(+), 9 deletions(-)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index d04890113c..ea52d2f41f 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -19,6 +19,7 @@
 
 #define RAM_SAVE_ENCRYPTED_PAGE           0x1
 #define RAM_SAVE_SHARED_REGIONS_LIST      0x2
+#define RAM_SAVE_GUEST_MH_ENCRYPTED_PAGE  0x4
 
 bool sev_enabled(void);
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
diff --git a/migration/ram.c b/migration/ram.c
index 4eca90cceb..a1f89445d4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -51,12 +51,14 @@
 #include "migration/colo.h"
 #include "block.h"
 #include "sysemu/cpu-throttle.h"
+#include "sysemu/kvm.h"
 #include "savevm.h"
 #include "qemu/iov.h"
 #include "multifd.h"
 #include "sysemu/runstate.h"
 #include "hw/boards.h"
 #include "exec/confidential-guest-support.h"
+#include "confidential-ram.h"
 
 /* Defines RAM_SAVE_ENCRYPTED_PAGE and RAM_SAVE_SHARED_REGION_LIST */
 #include "sysemu/sev.h"
@@ -97,6 +99,13 @@ bool memcrypt_enabled(void)
     return ms->cgs->ready;
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
@@ -2091,6 +2100,49 @@ static bool encrypted_test_list(RAMState *rs, RAMBlock *block,
     return ops->is_gfn_in_unshared_region(gfn);
 }
 
+/**
+ * ram_save_mh_encrypted_page - use the guest migration handler to encrypt
+ * a page and send it to the stream.
+ *
+ * Return the number of pages written (=1).
+ */
+static int ram_save_mh_encrypted_page(RAMState *rs, PageSearchStatus *pss,
+                                      bool last_stage)
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
+                         offset | RAM_SAVE_FLAG_ENCRYPTED_DATA);
+
+    qemu_put_be32(rs->f, RAM_SAVE_GUEST_MH_ENCRYPTED_PAGE);
+    ram_counters.transferred += sizeof(uint32_t);
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
@@ -2111,17 +2163,48 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
         return res;
     }
 
-    /*
-     * If memory encryption is enabled then use memory encryption APIs
-     * to write the outgoing buffer to the wire. The encryption APIs
-     * will take care of accessing the guest memory and re-encrypt it
-     * for the transport purposes.
-     */
-    if (memcrypt_enabled() &&
-        encrypted_test_list(rs, pss->block, pss->page)) {
-        return ram_save_encrypted_page(rs, pss, last_stage);
+    if (confidential_guest()) {
+        /*
+         * TODO: We'd like to support two migration modes for SEV guests:
+         * PSP-based and guest-assisted.  A possible solution is to add a new
+         * migration parameter ("use_guest_assistance") that will controlwhich
+         * mode should be used.
+         */
+        bool guest_assisted_confidential_migration = true;
+
+        if (guest_assisted_confidential_migration) {
+            /*
+             * If memory encryption is enabled then skip saving the data pages
+             * used by the migration handler.
+             */
+            if (gpa_inside_migration_helper_shared_area(offset)) {
+                return 0;
+            }
+
+            /*
+             * If memory encryption is enabled then use in-guest migration
+             * helper to write the outgoing buffer to the wire. The migration
+             * helper will take care of accessing the guest memory and
+             * re-encrypt it for the transport purposes.
+             */
+            if (encrypted_test_list(rs, pss->block, pss->page)) {
+                return ram_save_mh_encrypted_page(rs, pss, last_stage);
+            }
+      } else {
+            /*
+             * If memory encryption is enabled then use memory encryption APIs
+             * to write the outgoing buffer to the wire. The encryption APIs
+             * will take care of accessing the guest memory and re-encrypt it
+             * for the transport purposes.
+             */
+            if (memcrypt_enabled() &&
+                encrypted_test_list(rs, pss->block, pss->page)) {
+                return ram_save_encrypted_page(rs, pss, last_stage);
+            }
+      }
     }
 
+
     if (save_compress_page(rs, block, offset)) {
         return 1;
     }
@@ -2959,6 +3042,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
         return -1;
     }
 
+    if (confidential_guest()) {
+        cgs_mh_init();
+    }
+
     /* migration has already setup the bitmap, reuse it. */
     if (!migration_in_colo_state()) {
         if (ram_init_all(rsp) != 0) {
@@ -3167,6 +3254,10 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         }
     }
 
+    if (confidential_guest()) {
+        cgs_mh_cleanup();
+    }
+
     if (ret >= 0) {
         multifd_send_sync_main(rs->f);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-- 
2.20.1


