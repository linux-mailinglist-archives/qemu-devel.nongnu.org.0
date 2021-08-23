Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C333F4C37
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:19:02 +0200 (CEST)
Received: from localhost ([::1]:43666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAmz-0000wr-Hx
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl0-0006jp-Cu
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:16:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAkw-0000tc-Vo
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:16:58 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NE70YS154199; Mon, 23 Aug 2021 10:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tGjOf/3bcu6EQF+Z5Hw4WgQQacNaqqY3qF2Lh/PjfPM=;
 b=ExDP9Hu8WrJz2+0kN+9tGXNDWfxA1DxbHP0OUSrbsxOiGsDI5WRkCKZxG5ADxUoJdm+g
 LvDsGBXlmghugC5jDJRgQQN+QAqbhbRdqPQkXh1mh9ts+KPYP4sDFzxDxl93G/Q3AXHo
 xdTLtgnWFQ6ZqRonAqMNF6H5dhzrSUJLtkcJqs8MODMc35ikkfrzd/eaxg+44cHkxwQH
 KrSpurZOhOoiazaFQ+Oc/4c32wBhhiRDBx79IQHjdM7UIk7effHcqiHIGB7UbEvZskmU
 i963g3IffGUXk6gij59snLuWmKH6lj7TE5b9QA2yzePG7Ry4ITKFekZP3fSoookg9ZA2 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akf28sdtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE7CnD155544;
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akf28sdtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDHhf031972;
 Mon, 23 Aug 2021 14:16:48 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3ajs4ax6e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:16:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGlVK17367460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB437112065;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB0D6112066;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 02/12] migration: Add helpers to load confidential RAM
Date: Mon, 23 Aug 2021 10:16:26 -0400
Message-Id: <20210823141636.65975-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823141636.65975-1-dovmurik@linux.ibm.com>
References: <20210823141636.65975-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RkQCRBHVK1VeMXIJeL9YvtQYxTvYiKt-
X-Proofpoint-ORIG-GUID: InJLUgzJWzjd1Hpe-pz9l8kSfS1FXPJ-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_02:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230098
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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

QEMU cannot write directly to the memory of memory-encrypted guests;
this breaks normal RAM-load in the migration target.  Instead, QEMU
asks a migration helper running on an auxiliary vcpu in the guest to
restore encrypted pages as they were received from the source to a
specific GPA.

The migration helper running inside the guest can safely decrypt the
pages arrived from the source and load them into their proper location
in the guest's memory.

Loading pages uses the same shared (unencrypted) pages which both QEMU
and the guest can read from and write to.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 migration/confidential-ram.h |  2 ++
 migration/confidential-ram.c | 37 ++++++++++++++++++++++++++++++++++++
 migration/trace-events       |  1 +
 3 files changed, 40 insertions(+)

diff --git a/migration/confidential-ram.h b/migration/confidential-ram.h
index 0d49718d31..ebe4073bce 100644
--- a/migration/confidential-ram.h
+++ b/migration/confidential-ram.h
@@ -14,4 +14,6 @@ void cgs_mh_cleanup(void);
 int cgs_mh_save_encrypted_page(QEMUFile *f, ram_addr_t src_gpa, uint32_t size,
                                uint64_t *bytes_sent);
 
+int cgs_mh_load_encrypted_page(QEMUFile *f, ram_addr_t dest_gpa);
+
 #endif
diff --git a/migration/confidential-ram.c b/migration/confidential-ram.c
index 65a588e7f6..053ecea1d4 100644
--- a/migration/confidential-ram.c
+++ b/migration/confidential-ram.c
@@ -182,3 +182,40 @@ int cgs_mh_save_encrypted_page(QEMUFile *f, ram_addr_t src_gpa, uint32_t size,
 
     return ret;
 }
+
+int cgs_mh_load_encrypted_page(QEMUFile *f, ram_addr_t dest_gpa)
+{
+    int ret = 1;
+    uint32_t page_hdr_len, enc_page_len;
+
+    init_cgs_mig_helper_if_needed();
+
+    assert((dest_gpa & TARGET_PAGE_MASK) == dest_gpa);
+
+    /* Read page header */
+    page_hdr_len = qemu_get_be32(f);
+    if (page_hdr_len > 1024) {
+        error_report("confidential-ram: page header is too large (%d bytes) "
+                     "when loading gpa 0x%" PRIx64, page_hdr_len, dest_gpa);
+        return -EINVAL;
+    }
+    cmhs.io_page_hdr->len = page_hdr_len;
+    qemu_get_buffer(f, cmhs.io_page_hdr->data, page_hdr_len);
+
+    /* Read encrypted page */
+    enc_page_len = qemu_get_be32(f);
+    if (enc_page_len != TARGET_PAGE_SIZE) {
+        error_report("confidential-ram: encrypted page is too large (%d bytes) "
+                     "when loading gpa 0x%" PRIx64, enc_page_len, dest_gpa);
+        return -EINVAL;
+    }
+    qemu_get_buffer(f, cmhs.io_page, enc_page_len);
+
+    trace_encrypted_ram_load_page(page_hdr_len, enc_page_len, dest_gpa);
+    ret = send_command_to_cgs_mig_helper(CGS_MIG_HELPER_CMD_DECRYPT, dest_gpa);
+    if (ret) {
+        error_report("confidential-ram: failed loading page at gpa "
+                     "0x%" PRIx64 ": ret=%d", dest_gpa, ret);
+    }
+    return ret;
+}
diff --git a/migration/trace-events b/migration/trace-events
index 3d442a767f..5a6b5c8230 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -346,4 +346,5 @@ migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRI
 migration_pagecache_insert(void) "Error allocating page"
 
 # confidential-ram.c
+encrypted_ram_load_page(uint32_t hdr_len, uint32_t trans_len, uint64_t gpa) "hdr_len: %u, trans_len: %u, gpa: 0x%" PRIx64
 encrypted_ram_save_page(uint32_t size, uint64_t gpa) "size: %u, gpa: 0x%" PRIx64
-- 
2.20.1


