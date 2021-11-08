Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571A448099
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 14:51:59 +0100 (CET)
Received: from localhost ([::1]:38436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk542-00011a-42
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 08:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk515-0007PR-R0
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:48:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49452
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk513-0004TW-FC
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:48:55 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8D3XGw020613; 
 Mon, 8 Nov 2021 13:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2zXCAVfRbbgXDTY+dKq0RHKfqnE1LF+kyfa05/HbqjI=;
 b=I0eqvpG31RWlkFSzsOckL7gKdHMImCZ159O/XvlGeCLd8W7bjV+deZtYvCd4i8VGTIgG
 YjjWsa/bosneG+3hYlJJTn/xUvHKPPDKBwKtjt2UrxqtiK0+vmUBnsvCxp3T/OSjfa+1
 262vmrFOtrjFdV2+If6Z/PVJbaLTm3688VRhZu3Vpn9sgiH/IE7vPgC2QZk8k/ryHViq
 VdC4fLNKEtk9+SnRnsl7A7PjyAMHsMk0pfNwuLoCVF/9DMxKSAxOA+GPeOPxgyBdlUDO
 vjWDJXf8QoEFsMqYUHQ2rqnMOTclxcAwkzEn0VZaVMbzmCDtvAI/cCpJprUS7FOG0SjP sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c6rs5seas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:49 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8DNKdA019359;
 Mon, 8 Nov 2021 13:48:48 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c6rs5seaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:48 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8DYX0w005750;
 Mon, 8 Nov 2021 13:48:48 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3c5hba4hsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:48 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8DmlYQ46989806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 13:48:47 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33D40124054;
 Mon,  8 Nov 2021 13:48:47 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F154D12405C;
 Mon,  8 Nov 2021 13:48:46 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 13:48:46 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] target/i386/sev: Fail when invalid hashes table area
 detected
Date: Mon,  8 Nov 2021 13:48:38 +0000
Message-Id: <20211108134840.2757206-5-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f4qKJoB6bsTIOUlW5kOATZ4qICncPw3J
X-Proofpoint-ORIG-GUID: JkF53nYa8xsHUCtnbRB6EV5xywb3UBcd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111080084
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
for measured linux boot", 2021-09-30) introduced measured direct boot
with -kernel, using an OVMF-designated hashes table which QEMU fills.

However, no checks are performed on the validity of the hashes area
designated by OVMF.  Specifically, if OVMF publishes the
SEV_HASH_TABLE_RV_GUID entry but it is filled with zeroes, this will
cause QEMU to write the hashes entries over the first page of the
guest's memory (GPA 0).

Add validity checks to the published area.  If the hashes table area's
base address is zero, or its size is too small to fit the aligned hashes
table, display an error and stop the guest launch.  In such case, the
following error will be displayed:

    qemu-system-x86_64: SEV: guest firmware hashes table area is invalid (base=0x0 size=0x0)

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reported-by: Brijesh Singh <brijesh.singh@amd.com>
---
 target/i386/sev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index c71d23654f..2588bd623f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1221,7 +1221,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     uint8_t kernel_hash[HASH_SIZE];
     uint8_t *hashp;
     size_t hash_len = HASH_SIZE;
-    int aligned_len;
+    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
 
     /*
      * Only add the kernel hashes if the sev-guest configuration explicitly
@@ -1237,6 +1237,11 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         return false;
     }
     area = (SevHashTableDescriptor *)data;
+    if (!area->base || area->size < aligned_len) {
+        error_setg(errp, "SEV: guest firmware hashes table area is invalid "
+                         "(base=0x%x size=0x%x)", area->base, area->size);
+        return false;
+    }
 
     /*
      * Calculate hash of kernel command-line with the terminating null byte. If
@@ -1295,7 +1300,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
 
     /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
-    aligned_len = ROUND_UP(ht->len, 16);
     if (aligned_len != ht->len) {
         /* zero the excess data so the measurement can be reliably calculated */
         memset(ht->padding, 0, aligned_len - ht->len);
-- 
2.25.1


