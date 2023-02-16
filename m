Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367A698F04
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:49:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZxS-0004Hd-EV; Thu, 16 Feb 2023 03:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSZxP-0004HV-V7
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:49:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSZxO-0005gs-5n
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:49:35 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31G7nbvX029340; Thu, 16 Feb 2023 08:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Y9PUzJi3N2XGUg4fSoplmUMLHM38bK9DaaigJeHYllY=;
 b=L4X6jCBPjHNqRtTIlIfoeMqgQOPDgbhSjeDzAKaxVH23ABZUijLIEUCF04Ee6gBX9Ftz
 s6ITA6BOvs2JM+lKUZQdU69vyJFTZ3Wn7b8UQ8Z0DGAgJdoNRM30n3leyX5RKscbMBfP
 O4gej9JyFXSBF+7dzFYiiRRy3O6DHWTQIix1F7h/nDOb8oWDS24lE8QUrjQr877tJ/G3
 RiN7hiuKs1/VwxgTtEoPuSkjfejBHrBjGSWnA37i9yerr2ctY0q3jXU09/ppeWQhh9NL
 nSDBBR/aEay9+aNXNIGYSS55ZxTSZaUntggDIbLxYjT++o7qFcb5YRs0/RlEMMgrzcHp xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsgebha55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:31 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31G8kP8v018905;
 Thu, 16 Feb 2023 08:49:31 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsgebha4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:31 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G7Qki7023603;
 Thu, 16 Feb 2023 08:49:30 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3np2n7qyvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:30 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31G8nSCQ13370092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Feb 2023 08:49:29 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE1D85805B;
 Thu, 16 Feb 2023 08:49:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6348B58058;
 Thu, 16 Feb 2023 08:49:27 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Feb 2023 08:49:27 +0000 (GMT)
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
Subject: [RFC PATCH v2 2/2] i386/sev: Allow measured direct kernel boot on SNP
Date: Thu, 16 Feb 2023 08:49:13 +0000
Message-Id: <20230216084913.2148508-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
References: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FDUWxMKYDmJG4JOITwHmudFNyKY1TiQm
X-Proofpoint-ORIG-GUID: GPEN-Jfn9Widm9eHd34uFiSJkU86OZit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_06,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=780
 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160070
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In SNP, the hashes page is not included in the ranges to pre-validate
that appear in the SNP metadata published by AmdSev OVMF.

Therefore, if the user enabled kernel hashes (for measured direct boot),
QEMU should fill hashes table and encrypt the page.  Note that in SNP
(unlike SEV and SEV-ES) the measurements is done in whole 4KB pages.
Therefore QEMU zeros the whole page that includes the hashes table, and
fills in the kernel hashes area in that page, and then encrypts the
whole page.  The rest of the page is reserved for SEV launch secrets
which are not usable anyway on SNP.

If the user disabled kernel hashes, QEMU pre-validates the page as a
zero page.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 target/i386/sev.c | 51 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 6b8e85888f..c36ba9a541 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -2079,8 +2079,11 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     uint8_t initrd_hash[HASH_SIZE];
     uint8_t kernel_hash[HASH_SIZE];
     uint8_t *hashp;
+    hwaddr mapped_gpa, mapped_offset, mapped_len, expected_mapped_len;
+    uint8_t *mapped_area = NULL;
+    MemoryRegion *mr = NULL;
+    void *hva;
     size_t hash_len = HASH_SIZE;
-    hwaddr mapped_len = sizeof(*padded_ht);
     MemTxAttrs attrs = { 0 };
     bool ret = true;
     SevCommonState *sev_common = SEV_COMMON(MACHINE(qdev_get_machine())->cgs);
@@ -2090,6 +2093,25 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
      * stated kernel-hashes=on.
      */
     if (!sev_common->kernel_hashes) {
+        if (sev_snp_enabled()) {
+            /* Mark the hashes page (if defined) as a zero page */
+            if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
+                return false;
+            }
+
+            area = (SevHashTableDescriptor *)data;
+            if (!area->base || area->size < sizeof(PaddedSevHashTable)) {
+                return false;
+            }
+
+            mapped_gpa = area->base & TARGET_PAGE_MASK;
+            hva = gpa2hva(&mr, mapped_gpa, TARGET_PAGE_SIZE, NULL);
+            if (sev_snp_launch_update(SEV_SNP_GUEST(sev_common), mapped_gpa, hva,
+                                      TARGET_PAGE_SIZE, KVM_SEV_SNP_PAGE_TYPE_ZERO)) {
+                error_setg(errp, "SEV: error marking kernel hashes page as zero");
+            }
+            return false;
+        }
         return false;
     }
 
@@ -2099,10 +2121,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         return false;
     }
 
-    if (sev_snp_enabled()) {
-        return false;
-    }
-
     area = (SevHashTableDescriptor *)data;
     if (!area->base || area->size < sizeof(PaddedSevHashTable)) {
         error_setg(errp, "SEV: guest firmware hashes table area is invalid "
@@ -2149,12 +2167,25 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
      * Populate the hashes table in the guest's memory at the OVMF-designated
      * area for the SEV hashes table
      */
-    padded_ht = address_space_map(&address_space_memory, area->base,
-                                  &mapped_len, true, attrs);
-    if (!padded_ht || mapped_len != sizeof(*padded_ht)) {
+    if (sev_snp_enabled()) {
+        /* SNP encrypts and measures memory in whole pages */
+        mapped_gpa = area->base & TARGET_PAGE_MASK;
+        mapped_offset = area->base & ~TARGET_PAGE_MASK;
+        mapped_len = TARGET_PAGE_SIZE;
+    } else {
+        mapped_gpa = area->base;
+        mapped_offset = 0;
+        mapped_len = sizeof(*padded_ht);
+    }
+    expected_mapped_len = mapped_len;
+    mapped_area = address_space_map(&address_space_memory, mapped_gpa,
+                                    &mapped_len, true, attrs);
+    if (!mapped_area || mapped_len != expected_mapped_len) {
         error_setg(errp, "SEV: cannot map hashes table guest memory area");
         return false;
     }
+    memset(mapped_area, 0, mapped_len);
+    padded_ht = (PaddedSevHashTable *)(mapped_area + mapped_offset);
     ht = &padded_ht->ht;
 
     ht->guid = sev_hash_table_header_guid;
@@ -2175,11 +2206,11 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     /* zero the excess data so the measurement can be reliably calculated */
     memset(padded_ht->padding, 0, sizeof(padded_ht->padding));
 
-    if (sev_encrypt_flash(area->base, (uint8_t *)padded_ht, sizeof(*padded_ht), errp) < 0) {
+    if (sev_encrypt_flash(mapped_gpa, mapped_area, mapped_len, errp) < 0) {
         ret = false;
     }
 
-    address_space_unmap(&address_space_memory, padded_ht,
+    address_space_unmap(&address_space_memory, mapped_area,
                         mapped_len, true, mapped_len);
 
     return ret;
-- 
2.25.1


