Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE783F4C4E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:25:57 +0200 (CEST)
Received: from localhost ([::1]:39302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAtg-0008RW-Bn
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl4-0006kb-1b
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAky-0000vE-7e
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:01 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NE741a154591; Mon, 23 Aug 2021 10:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XZDmJ0tDMaBAMxIIo406E/MbWwxOLYIAzQ9Ynr9WldE=;
 b=DbpyazF8DlruO6SnY162A+dYmsv4OSpIMXkJ4tlWSAiaGFv0wSCmGt2b+Hi1ZpaJ/1Aa
 vLdd7YJ1feMkkXQIjLvQsen5vztjG4rxMIamcCahKamZfoQlBA/gy7ko6tUfPcWG6+bU
 v/nwVw0HTMOVO8le7qFSeShcu8lGkU6D/hJ5zurrdH1sClSUOLAsod52azQ6mgO4rKV1
 goKFd5yZ7U1o1Cuvi7wb0nmKwC65+wUqKDPsP2ERFznXpgBM2FysET6YsshPmcboA9jP
 /XXTX5muFWO46GidifPmTXadqiA3JuvZeYLh3X3utfDTbko6EdF43xqzO8j/ddapL6q4 nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akf28sdua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:50 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE71q1154229;
 Mon, 23 Aug 2021 10:16:50 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akf28sdty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:50 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDDsH023036;
 Mon, 23 Aug 2021 14:16:49 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3ajs4bkk3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:16:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGlA010224132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0AF311206D;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91315112063;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 05/12] migration: Load confidential guest RAM using
 migration helper
Date: Mon, 23 Aug 2021 10:16:29 -0400
Message-Id: <20210823141636.65975-6-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823141636.65975-1-dovmurik@linux.ibm.com>
References: <20210823141636.65975-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fWTm2OU7Hy2TzwPtVzctzfcczSNoRpnd
X-Proofpoint-ORIG-GUID: 2cDRxgUVOLoP4Yxg6WuUhDFdAZS0bFJz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_02:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=952 clxscore=1011
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

When loading encrypted RAM pages of a confidential guest, ask the
in-guest migration helper to decrypt the incoming page and place it
correctly in the guest memory at the appropriate address.  This way the
page's plaintext content remains inaccessible to the host.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 migration/ram.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index a1f89445d4..2d5889f795 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1250,6 +1250,7 @@ static int load_encrypted_data(QEMUFile *f, uint8_t *ptr)
         cgs_class->memory_encryption_ops;
 
     int flag;
+    hwaddr gpa;
 
     flag = qemu_get_be32(f);
 
@@ -1257,6 +1258,12 @@ static int load_encrypted_data(QEMUFile *f, uint8_t *ptr)
         return ops->load_incoming_page(f, ptr);
     } else if (flag == RAM_SAVE_SHARED_REGIONS_LIST) {
         return ops->load_incoming_shared_regions_list(f);
+    } else if (flag == RAM_SAVE_GUEST_MH_ENCRYPTED_PAGE) {
+        if (!kvm_physical_memory_addr_from_host(kvm_state, ptr, &gpa)) {
+            error_report("%s: failed to get gpa for host ptr %p", __func__, ptr);
+            return -EINVAL;
+        }
+        return cgs_mh_load_encrypted_page(f, gpa);
     } else {
         error_report("unknown encrypted flag %x", flag);
         return 1;
@@ -3728,6 +3735,10 @@ void colo_release_ram_cache(void)
  */
 static int ram_load_setup(QEMUFile *f, void *opaque)
 {
+    if (confidential_guest()) {
+        cgs_mh_init();
+    }
+
     if (compress_threads_load_setup(f)) {
         return -1;
     }
@@ -3754,6 +3765,10 @@ static int ram_load_cleanup(void *opaque)
         rb->receivedmap = NULL;
     }
 
+    if (confidential_guest()) {
+        cgs_mh_cleanup();
+    }
+
     return 0;
 }
 
@@ -4024,6 +4039,7 @@ void colo_flush_ram_cache(void)
 static int ram_load_precopy(QEMUFile *f)
 {
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
+
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
     bool postcopy_advised = postcopy_is_advised();
     if (!migrate_use_compression()) {
-- 
2.20.1


