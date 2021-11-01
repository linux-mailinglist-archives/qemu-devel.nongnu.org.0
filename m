Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28E4419F5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:33:12 +0100 (CET)
Received: from localhost ([::1]:45118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUcp-0006C2-76
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhUS6-0007nW-HN
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:22:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhURz-0008Gt-RN
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:22:06 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A198MYq012726; 
 Mon, 1 Nov 2021 10:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EMoXJu8g5VsDfZQzPUnQu4ZEdFZXgqZjzeAq6TLb5eA=;
 b=fgIkNe4TrSWkCYzAUHjaQ7KQkPE/emkvlOT/RBxPJRYUZNSXrE6GL2TiDHftYh/B4Uwx
 gzSKEgSM5XclfHPF5byAsr4JXbkpgZSv60RDG1+8tEtihJSh1GNYiucqcbmSd1vcdE9o
 7vUqJXJBpJe7m1bbjTtTaDEvo7bH3F6fy+Rm3Fjh8joz9qbxh3PD5N8LAoEhC9YTWhYy
 3f/k9dla+gDO/36LOAO/Dr7kTugYm4RXOZOfDSkn6VPuezcea9aZb3WuJ9k8KdNAXsnB
 AaMX1D4tJHo0i85Bjdo1fA2A8KnVYIO73uQ+vZ7r4AZnMCAFRHYuTdyXrlYXA9FHQc1X Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c2cp09rrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 10:21:56 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A19wQoL006685;
 Mon, 1 Nov 2021 10:21:55 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c2cp09rr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 10:21:55 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A1AIoe4029534;
 Mon, 1 Nov 2021 10:21:54 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3c0wp9t86r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 10:21:54 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A1ALqJX36634914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Nov 2021 10:21:52 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 605D46A047;
 Mon,  1 Nov 2021 10:21:52 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9AA16A051;
 Mon,  1 Nov 2021 10:21:51 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  1 Nov 2021 10:21:51 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] sev/i386: Warn if using -kernel with invalid OVMF hashes
 table area
Date: Mon,  1 Nov 2021 10:21:35 +0000
Message-Id: <20211101102136.1706421-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ncLjjFoachKwAcxd92DfPqyHtD60IuVC
X-Proofpoint-GUID: ACG43ZCuphqNtcBqulPV-2OYN3Jg9vNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_04,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111010058
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
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
table, warn and skip the hashes entries addition.  In such case, the
following warning will be displayed:

    qemu-system-x86_64: warning: SEV: OVMF's hashes table area is invalid (base=0x0 size=0x0)

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reported-by: Brijesh Singh <brijesh.singh@amd.com>
---
 target/i386/sev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 682b8ccf6c..a20ddb545e 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1201,13 +1201,18 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     uint8_t kernel_hash[HASH_SIZE];
     uint8_t *hashp;
     size_t hash_len = HASH_SIZE;
-    int aligned_len;
+    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
 
     if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
         warn_report("SEV: kernel specified but OVMF has no hash table guid");
         return false;
     }
     area = (SevHashTableDescriptor *)data;
+    if (!area->base || area->size < aligned_len) {
+        warn_report("SEV: OVMF's hashes table area is invalid (base=0x%x size=0x%x)",
+                    area->base, area->size);
+        return false;
+    }
 
     /*
      * Calculate hash of kernel command-line with the terminating null byte. If
@@ -1266,7 +1271,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
 
     /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
-    aligned_len = ROUND_UP(ht->len, 16);
     if (aligned_len != ht->len) {
         /* zero the excess data so the measurement can be reliably calculated */
         memset(ht->padding, 0, aligned_len - ht->len);
-- 
2.25.1


