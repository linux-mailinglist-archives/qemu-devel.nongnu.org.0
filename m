Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E632ABE2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:53:52 +0100 (CET)
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHC1f-0006l3-Hi
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwc-0001O9-W6
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwb-00085V-6q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:38 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KhIto124551; Tue, 2 Mar 2021 15:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=stM31GpidGLQm+iESbp31GnriOMFeKwCOv8cg0AjbQk=;
 b=h5JCSHTRlTt6vqc6mIMT9EzGbPE1O/x2ylcHLGq9DfHlrWJUbmJER+Fd/AWr41ROyraU
 L4Tp8TUxihe1oe7v6lhZr55Amj33zHfiTz7ET62JEmLqbADCKGAn79GVPIEgbOy+4Lx1
 F+l2nYhSZEiK9Alfhja6uiAzeaIVbckDfcHkju4EPuXBFVWv+QjnHQYvNqNy/Q6xJICn
 cq2fwDqpKh3d44d8PkjqiHDidCR2LwQYOdXBGUUnbvuGqv0T6aSG8achbGfS6jrtUBzt
 j1irMdJ0PMPy7LvwNI39F/hywoq3XNJduGU7Kslo9jfbmtEgWDDWdpxaGwWXDMborTcY RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn7r7dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KhTsN125901;
 Tue, 2 Mar 2021 15:48:34 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn7r7d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122Km5K2009951;
 Tue, 2 Mar 2021 20:48:33 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3712phhu8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:33 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmWja26935610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F4622805A;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E8BF28058;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/26] migration: Load confidential guest RAM using
 migration helper
Date: Tue,  2 Mar 2021 15:48:12 -0500
Message-Id: <20210302204822.81901-17-dovmurik@linux.vnet.ibm.com>
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
 phishscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=981 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

When loading encrypted RAM pages of a confidential guest, ask the
in-guest migration helper to decrypt the incoming page and place it
correctly in the guest memory at the appropriate address.  This way the
page's plaintext content remains inaccessible to the host.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 migration/ram.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 8e55ed49fd..82a1d13f5f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3519,6 +3519,10 @@ void colo_release_ram_cache(void)
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
@@ -3812,6 +3816,8 @@ void colo_flush_ram_cache(void)
 static int ram_load_precopy(QEMUFile *f)
 {
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
+    ram_addr_t gpa;
+
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
     bool postcopy_advised = postcopy_is_advised();
     if (!migrate_use_compression()) {
@@ -3848,7 +3854,8 @@ static int ram_load_precopy(QEMUFile *f)
         }
 
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
-                     RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
+                     RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE |
+                     RAM_SAVE_FLAG_GUEST_ENCRYPTED_PAGE)) {
             RAMBlock *block = ram_block_from_stream(f, flags);
 
             host = host_from_ram_block_offset(block, addr);
@@ -3977,6 +3984,16 @@ static int ram_load_precopy(QEMUFile *f)
                 break;
             }
             break;
+
+        case RAM_SAVE_FLAG_GUEST_ENCRYPTED_PAGE:
+            if (!kvm_physical_memory_addr_from_host(kvm_state, host, &gpa)) {
+                error_report("%s: failed to get gpa for host %p", __func__, host);
+                ret = -EINVAL;
+                break;
+            }
+            ret = cgs_mh_load_encrypted_page(f, gpa);
+            break;
+
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             multifd_recv_sync_main();
-- 
2.20.1


