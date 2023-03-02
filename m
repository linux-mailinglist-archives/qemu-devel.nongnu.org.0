Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C06A7D9D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfAX-0006GK-B3; Thu, 02 Mar 2023 04:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAV-0006Eo-Oj
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAS-0002yw-Ln
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:07 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3228HNto007430; Thu, 2 Mar 2023 09:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tjt2l/Ru2eYa0JCmd9E9NLId+1aX4WjU2UiGwTwLCVM=;
 b=sWZYQlEWI1S5KrRhnr2nKedWJPKbhSXMpPLu2hC3LR8bl/0a51nT6oNJf+k5kgr7VzNd
 xJHPdok1ivxSlhWtHChOGdynyDGgsxWj+EUhfh5ayfpQdBe9VIh0WFQkyWMFRov6ezFM
 k5sNlofq9JonqUP6AcUDttZo+Gul6n31Mupz4FHevDEijPNr4c35rBd4Ar3q1Bjnejqi
 w6Gq5als7u06rF8XquaZvEVTspE4/q+1qKwad0kCTgEFV2La9rCL40kOYODGVLOzK1kT
 JXApZQaqMNlL/fXFozP6G1q7BtZpncHAaT06gexEc9II6Yu3Mf0IRfkIqr+Bwgy/i52K Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2r5essrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:24:01 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3228jQqN025947;
 Thu, 2 Mar 2023 09:24:00 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2r5essra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:24:00 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3227PUoQ017448;
 Thu, 2 Mar 2023 09:23:59 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3nybchtwg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:23:59 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3229Nvo14194958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 09:23:57 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AD0E58053;
 Thu,  2 Mar 2023 09:23:57 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 904FA58059;
 Thu,  2 Mar 2023 09:23:55 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 09:23:55 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Mario Smarduch <mario.smarduch@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: [RFC PATCH v3 2/4] i386/sev: Extract build_kernel_loader_hashes
Date: Thu,  2 Mar 2023 09:23:45 +0000
Message-Id: <20230302092347.1988853-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
References: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6I4nRYyxb0z6an6Jusdlnq1XcpS9K0xh
X-Proofpoint-ORIG-GUID: koVNGdW3Em589boMeZ8P6_1_lLZMccSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_04,2023-03-02_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020078
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Extract the building of the kernel hashes table out from
sev_add_kernel_loader_hashes() to allow building it in
other memory areas (for SNP support).

No functional change intended.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 target/i386/sev.c | 110 ++++++++++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 48 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 6b8e85888f..a3c5c10f5f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -2065,50 +2065,16 @@ static const QemuUUID sev_cmdline_entry_guid = {
                     0x4d, 0x36, 0xab, 0x2a)
 };
 
-/*
- * Add the hashes of the linux kernel/initrd/cmdline to an encrypted guest page
- * which is included in SEV's initial memory measurement.
- */
-bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
+static bool build_kernel_loader_hashes(PaddedSevHashTable *padded_ht,
+                                       SevKernelLoaderContext *ctx,
+                                       Error **errp)
 {
-    uint8_t *data;
-    SevHashTableDescriptor *area;
     SevHashTable *ht;
-    PaddedSevHashTable *padded_ht;
     uint8_t cmdline_hash[HASH_SIZE];
     uint8_t initrd_hash[HASH_SIZE];
     uint8_t kernel_hash[HASH_SIZE];
     uint8_t *hashp;
     size_t hash_len = HASH_SIZE;
-    hwaddr mapped_len = sizeof(*padded_ht);
-    MemTxAttrs attrs = { 0 };
-    bool ret = true;
-    SevCommonState *sev_common = SEV_COMMON(MACHINE(qdev_get_machine())->cgs);
-
-    /*
-     * Only add the kernel hashes if the sev-guest configuration explicitly
-     * stated kernel-hashes=on.
-     */
-    if (!sev_common->kernel_hashes) {
-        return false;
-    }
-
-    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
-        error_setg(errp, "SEV: kernel specified but guest firmware "
-                         "has no hashes table GUID");
-        return false;
-    }
-
-    if (sev_snp_enabled()) {
-        return false;
-    }
-
-    area = (SevHashTableDescriptor *)data;
-    if (!area->base || area->size < sizeof(PaddedSevHashTable)) {
-        error_setg(errp, "SEV: guest firmware hashes table area is invalid "
-                         "(base=0x%x size=0x%x)", area->base, area->size);
-        return false;
-    }
 
     /*
      * Calculate hash of kernel command-line with the terminating null byte. If
@@ -2145,16 +2111,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     }
     assert(hash_len == HASH_SIZE);
 
-    /*
-     * Populate the hashes table in the guest's memory at the OVMF-designated
-     * area for the SEV hashes table
-     */
-    padded_ht = address_space_map(&address_space_memory, area->base,
-                                  &mapped_len, true, attrs);
-    if (!padded_ht || mapped_len != sizeof(*padded_ht)) {
-        error_setg(errp, "SEV: cannot map hashes table guest memory area");
-        return false;
-    }
     ht = &padded_ht->ht;
 
     ht->guid = sev_hash_table_header_guid;
@@ -2175,7 +2131,65 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     /* zero the excess data so the measurement can be reliably calculated */
     memset(padded_ht->padding, 0, sizeof(padded_ht->padding));
 
-    if (sev_encrypt_flash(area->base, (uint8_t *)padded_ht, sizeof(*padded_ht), errp) < 0) {
+    return true;
+}
+
+/*
+ * Add the hashes of the linux kernel/initrd/cmdline to an encrypted guest page
+ * which is included in SEV's initial memory measurement.
+ */
+bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
+{
+    uint8_t *data;
+    SevHashTableDescriptor *area;
+    PaddedSevHashTable *padded_ht;
+    hwaddr mapped_len = sizeof(*padded_ht);
+    MemTxAttrs attrs = { 0 };
+    bool ret = true;
+    SevCommonState *sev_common = SEV_COMMON(MACHINE(qdev_get_machine())->cgs);
+
+    /*
+     * Only add the kernel hashes if the sev-guest configuration explicitly
+     * stated kernel-hashes=on.
+     */
+    if (!sev_common->kernel_hashes) {
+        return false;
+    }
+
+    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
+        error_setg(errp, "SEV: kernel specified but guest firmware "
+                         "has no hashes table GUID");
+        return false;
+    }
+
+    if (sev_snp_enabled()) {
+        return false;
+    }
+
+    area = (SevHashTableDescriptor *)data;
+    if (!area->base || area->size < sizeof(PaddedSevHashTable)) {
+        error_setg(errp, "SEV: guest firmware hashes table area is invalid "
+                         "(base=0x%x size=0x%x)", area->base, area->size);
+        return false;
+    }
+
+    /*
+     * Populate the hashes table in the guest's memory at the OVMF-designated
+     * area for the SEV hashes table
+     */
+    padded_ht = address_space_map(&address_space_memory, area->base,
+                                  &mapped_len, true, attrs);
+    if (!padded_ht || mapped_len != sizeof(*padded_ht)) {
+        error_setg(errp, "SEV: cannot map hashes table guest memory area");
+        return false;
+    }
+
+    if (build_kernel_loader_hashes(padded_ht, ctx, errp)) {
+        if (sev_encrypt_flash(area->base, (uint8_t *)padded_ht,
+                              sizeof(*padded_ht), errp) < 0) {
+            ret = false;
+        }
+    } else {
         ret = false;
     }
 
-- 
2.25.1


