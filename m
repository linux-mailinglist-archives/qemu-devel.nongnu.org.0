Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C632ABFA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:01:12 +0100 (CET)
Received: from localhost ([::1]:35428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHC8l-0006vy-K3
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwe-0001Qg-2s
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwc-00085g-5Q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KiCZJ092135; Tue, 2 Mar 2021 15:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cadysZuPx8vVG+UCWHCyjS7plfrBRgsJd08921TQ8hA=;
 b=BRl76bPHJpZaFTM1Fx/NpU1bNqkBm9RIHRw5Rn3pW4Cc/Ykd9KEoOLoia2khoNM4Wxw3
 AhjHtEbAA9DDAFKb4mO4Ba8fvW27A97FUwT44cGMlog6ocdYrogJEenAUCdPh5/tUiTT
 7jsNZYVfd9H/P+ld5LTSGk7UL4RDYiX2YsKojCdojG0cWDlCj1GK3wXq6fQ8zBwRapYy
 UOJZ0zeJ56GAinoZWPQml6LCtNSOTkv3V9A3Mx+vr+NKI/W97gcFpWTstLmeHzbWy63/
 wGcg8cxnx6wG1jX5fgrMvGAR0ClEXwKVFQrQERFkF55le8a/e+nj1DHiLlhvqRBw/8nW hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnf0657-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KkeTc112164;
 Tue, 2 Mar 2021 15:48:34 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnf064e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122Km3td009935;
 Tue, 2 Mar 2021 20:48:32 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3712phhu85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmVwd15073740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7E2B28059;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD2B328058;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/26] migration: Add helpers to load confidential RAM
Date: Tue,  2 Mar 2021 15:48:09 -0500
Message-Id: <20210302204822.81901-14-dovmurik@linux.vnet.ibm.com>
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
 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020156
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

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
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
index 65a588e7f6..fe317ee74b 100644
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
+                     "when loading gpa %" PRIu64, page_hdr_len, dest_gpa);
+        return -EINVAL;
+    }
+    cmhs.io_page_hdr->len = page_hdr_len;
+    qemu_get_buffer(f, cmhs.io_page_hdr->data, page_hdr_len);
+
+    /* Read encrypted page */
+    enc_page_len = qemu_get_be32(f);
+    if (enc_page_len != TARGET_PAGE_SIZE) {
+        error_report("confidential-ram: encrypted page is too large (%d bytes) "
+                     "when loading gpa %" PRIu64, enc_page_len, dest_gpa);
+        return -EINVAL;
+    }
+    qemu_get_buffer(f, cmhs.io_page, enc_page_len);
+
+    trace_encrypted_ram_load_page(page_hdr_len, enc_page_len, dest_gpa);
+    ret = send_command_to_cgs_mig_helper(CGS_MIG_HELPER_CMD_DECRYPT, dest_gpa);
+    if (ret) {
+        error_report("confidential-ram: failed loading page at dest_gpa "
+                     "%" PRIu64 ": ret=%d", dest_gpa, ret);
+    }
+    return ret;
+}
diff --git a/migration/trace-events b/migration/trace-events
index 929de4ca98..ef31cf78cb 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -345,4 +345,5 @@ migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRI
 migration_pagecache_insert(void) "Error allocating page"
 
 # confidential-ram.c
+encrypted_ram_load_page(uint32_t hdr_len, uint32_t trans_len, uint64_t gpa) "hdr_len: %u, trans_len: %u, gpa: 0x%" PRIx64
 encrypted_ram_save_page(uint32_t size, uint64_t gpa) "size: %u, gpa: 0x%" PRIx64
-- 
2.20.1


