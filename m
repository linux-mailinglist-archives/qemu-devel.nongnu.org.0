Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C74EA811
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 08:45:32 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ5bf-0001jn-9w
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 02:45:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nZ5XK-00009J-1A
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 02:41:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nZ5XI-00065v-29
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 02:41:01 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22T5B97Q025012; 
 Tue, 29 Mar 2022 06:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ruUAPxFCCsLCY2eoBiGlRMH68s+SK8/+wuuEGjhqWoE=;
 b=tBFwuuu14PjipvKuSYuCoei3JytnozhFTCkRKxEqxEwZBZHkgQzJJfHa0vGYBm2Sdb5j
 pYfNc1fdk+vLb2W4M0xb2RPf17HvBW1YGdk4v3nt+ML3J2el1G3HKD3bNt9C9kiCiero
 TtkYSYSXia9vyYDt+yz63V39zf1xjJXdvHnidxUp1Cpzc/IlJR5lXXWKRcNlhILjajr7
 6L8kxWepzC1zLLMAEYdLoubCoO3z87CtI9u1VIY1uMki5vqwR/LRnIo+dS35XRRkVaYy
 nu7r+6aBLOA1/vDiwqdT4s8FEOsEGeuNrJNufo+Iy8MkkAEn6O1GnTA1HBj+iicGnLYw mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3uae1tgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 06:40:48 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22T6UbtO016863;
 Tue, 29 Mar 2022 06:40:48 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3uae1tg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 06:40:48 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22T6dTgp020232;
 Tue, 29 Mar 2022 06:40:47 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3f1tf9jje5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 06:40:47 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22T6ekXu21037312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 06:40:46 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A90E628066;
 Tue, 29 Mar 2022 06:40:46 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72CD32805E;
 Tue, 29 Mar 2022 06:40:46 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 29 Mar 2022 06:40:46 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] i386/sev: Support measured direct -kernel boot on SNP
Date: Tue, 29 Mar 2022 06:40:38 +0000
Message-Id: <20220329064038.96006-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J8LUYJNoGRn-PsA7f9X7UVB_U-FPXzWB
X-Proofpoint-ORIG-GUID: 1LNP2DSQMunHk-vnYl7dURPNLvFAm72v
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 adultscore=0 spamscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203290039
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an RFC patch based on AMD's RFC snp-v3 tree [1].

In SNP, the hashes page is not included in the ranges to pre-validate
that appear in the SNP metadata published by OVMF (See [2] for proposed
OVMF patches).

Therefore, if the user enabled kernel hashes (for measured direct boot),
we should fill hashes table and encrypt the page.  Note that in SNP
(unlike SEV and SEV-ES) the measurements is done in whole 4KB pages.
Therefore we zero the whole page that includes the hashes table, and
fill in the kernel hashes area in that page, and then encrypt the whole
page.  The rest of the page is reserved for SEV launch secrets which are
not usable anyway on SNP.

If the user disabled kernel hashes, QEMU pre-validates the page as a
zero page.

Note that the base branch [1] doesn't yet include the kernel-hashes
flag.

[1] https://github.com/AMDESE/qemu/tree/snp-v3
[2] https://edk2.groups.io/g/devel/message/88137

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 target/i386/sev.c | 40 ++++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 3c296a59ae..dbc9d570a9 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1818,6 +1818,8 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     uint8_t initrd_hash[HASH_SIZE];
     uint8_t kernel_hash[HASH_SIZE];
     uint8_t *hashp;
+    uint8_t *full_page = NULL;
+    int ret;
     size_t hash_len = HASH_SIZE;
     int aligned_len;
 
@@ -1826,12 +1828,25 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         return false;
     }
 
-    if (sev_snp_enabled()) {
-        return false;
-    }
-
     area = (SevHashTableDescriptor *)data;
 
+    /*
+     * TODO: this is an RFC patch on top of an old tree that doesn't support
+     * the kernel-hashes=on flag.
+     *
+     * But, when kernel-hashes=off and SNP is active, we need to mark the
+     * pre-validate the hashes page as a zero page:
+     *
+     * if (kernel_hashes flag is off) {
+     *     uint32_t gpa = area->base & TARGET_PAGE_MASK
+     *     void *hva = gpa2hva(&mr, gpa, TARGET_PAGE_SIZE, NULL);
+     *     if (!hva) { ... }
+     *     ret = sev_snp_launch_update(sev_snp, gpa, hva, TARGET_PAGE_SIZE,
+     *                                 KVM_SEV_SNP_PAGE_TYPE_ZERO);
+     *     return ret == 0;
+     * }
+     */
+
     /*
      * Calculate hash of kernel command-line with the terminating null byte. If
      * the user doesn't supply a command-line via -append, the 1-byte "\0" will
@@ -1871,7 +1886,13 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
      * Populate the hashes table in the guest's memory at the OVMF-designated
      * area for the SEV hashes table
      */
-    ht = qemu_map_ram_ptr(NULL, area->base);
+    if (sev_snp_enabled()) {
+        full_page = qemu_map_ram_ptr(NULL, area->base & TARGET_PAGE_MASK);
+        memset(full_page, 0, TARGET_PAGE_SIZE);
+        ht = (SevHashTable *)(full_page + (area->base & ~TARGET_PAGE_MASK));
+    } else {
+        ht = (SevHashTable *)qemu_map_ram_ptr(NULL, area->base);
+    }
 
     ht->guid = sev_hash_table_header_guid;
     ht->len = sizeof(*ht);
@@ -1895,11 +1916,14 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         memset(ht->padding, 0, aligned_len - ht->len);
     }
 
-    if (sev_encrypt_flash(area->base, (uint8_t *)ht, aligned_len, errp) < 0) {
-        return false;
+    if (sev_snp_enabled()) {
+        ret = sev_encrypt_flash(area->base & TARGET_PAGE_MASK, full_page,
+                                TARGET_PAGE_SIZE, errp);
+    } else {
+        ret = sev_encrypt_flash(area->base, (uint8_t *)ht, aligned_len, errp);
     }
 
-    return true;
+    return ret >= 0;
 }
 
 static void
-- 
2.20.1


