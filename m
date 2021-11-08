Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A1044809B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 14:52:05 +0100 (CET)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk548-0001Cm-ON
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 08:52:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk517-0007RB-Hv
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:48:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49642
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk513-0004Tg-Hs
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:48:57 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8DchHN017182; 
 Mon, 8 Nov 2021 13:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=O8zRtBdXirtCeLkTetGo4Neg4qExuH0xKycQcTBfiFg=;
 b=UNSUPKqCSmFNpP/hkLHRRZgLMLaTkIbqTsshYm7Pdb1E8o+mYxriKMEhTRL6950G2DnS
 FRtlR2ymLy4dgL2ab4xiC8tB0s5E7ucI+TpEcz6i8XLrMmMvUQYJPkDgFK9Ybd6qdXcD
 kwH8WWeXGLuDCvEVkc2RB4OuNsiJQKMi5L2pxYcJMJStjCm3sk0sR/K1G0rJOD7eRuit
 kVna2nVzjTNprbA3XCoxx94aofQxGZQnF4MzQ5j+36cIcJsfSdqqspj4p6jpPe8DxPCi
 5xIinuUYmT4tfLq8V+nCvzT4eXjDjhIsu7n4g3M+LY2xC1A5EUkC0NNstJb8463+4Ffb Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c66ayyptf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:49 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8Dks2s018400;
 Mon, 8 Nov 2021 13:48:49 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c66ayypt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:49 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8DmXtg011216;
 Mon, 8 Nov 2021 13:48:48 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3c5hba4nd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:48 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8Dmlvw46989810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 13:48:47 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72933124055;
 Mon,  8 Nov 2021 13:48:47 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C894124053;
 Mon,  8 Nov 2021 13:48:47 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 13:48:47 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] target/i386/sev: Perform padding calculations at
 compile-time
Date: Mon,  8 Nov 2021 13:48:39 +0000
Message-Id: <20211108134840.2757206-6-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JdcCXQGVrbaiYAi_mIdslMCHiy5v6d6C
X-Proofpoint-GUID: FlWQfQZ8OLmNRlfiZtj4dUUYCRNjACQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080084
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In sev_add_kernel_loader_hashes, the sizes of structs are known at
compile-time, so calculate needed padding at compile-time.

No functional change intended.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 2588bd623f..2e3a6e8ff8 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -110,9 +110,19 @@ typedef struct QEMU_PACKED SevHashTable {
     SevHashTableEntry cmdline;
     SevHashTableEntry initrd;
     SevHashTableEntry kernel;
-    uint8_t padding[];
 } SevHashTable;
 
+/*
+ * Data encrypted by sev_encrypt_flash() must be padded to a multiple of
+ * 16 bytes.
+ */
+typedef struct QEMU_PACKED PaddedSevHashTable {
+    SevHashTable ht;
+    uint8_t padding[ROUND_UP(sizeof(SevHashTable), 16) - sizeof(SevHashTable)];
+} PaddedSevHashTable;
+
+QEMU_BUILD_BUG_ON(sizeof(PaddedSevHashTable) % 16 != 0);
+
 static SevGuestState *sev_guest;
 static Error *sev_mig_blocker;
 
@@ -1216,12 +1226,12 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     uint8_t *data;
     SevHashTableDescriptor *area;
     SevHashTable *ht;
+    PaddedSevHashTable *padded_ht;
     uint8_t cmdline_hash[HASH_SIZE];
     uint8_t initrd_hash[HASH_SIZE];
     uint8_t kernel_hash[HASH_SIZE];
     uint8_t *hashp;
     size_t hash_len = HASH_SIZE;
-    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
 
     /*
      * Only add the kernel hashes if the sev-guest configuration explicitly
@@ -1237,7 +1247,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         return false;
     }
     area = (SevHashTableDescriptor *)data;
-    if (!area->base || area->size < aligned_len) {
+    if (!area->base || area->size < sizeof(PaddedSevHashTable)) {
         error_setg(errp, "SEV: guest firmware hashes table area is invalid "
                          "(base=0x%x size=0x%x)", area->base, area->size);
         return false;
@@ -1282,7 +1292,8 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
      * Populate the hashes table in the guest's memory at the OVMF-designated
      * area for the SEV hashes table
      */
-    ht = qemu_map_ram_ptr(NULL, area->base);
+    padded_ht = qemu_map_ram_ptr(NULL, area->base);
+    ht = &padded_ht->ht;
 
     ht->guid = sev_hash_table_header_guid;
     ht->len = sizeof(*ht);
@@ -1299,13 +1310,10 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     ht->kernel.len = sizeof(ht->kernel);
     memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
 
-    /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
-    if (aligned_len != ht->len) {
-        /* zero the excess data so the measurement can be reliably calculated */
-        memset(ht->padding, 0, aligned_len - ht->len);
-    }
+    /* zero the excess data so the measurement can be reliably calculated */
+    memset(padded_ht->padding, 0, sizeof(padded_ht->padding));
 
-    if (sev_encrypt_flash((uint8_t *)ht, aligned_len, errp) < 0) {
+    if (sev_encrypt_flash((uint8_t *)padded_ht, sizeof(*padded_ht), errp) < 0) {
         return false;
     }
 
-- 
2.25.1


