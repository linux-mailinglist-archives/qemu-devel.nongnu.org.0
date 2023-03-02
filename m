Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F396A7D9C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfAY-0006Gq-4L; Thu, 02 Mar 2023 04:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAV-0006FC-Rk
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAU-0002zI-1p
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:07 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3228ZlEO021904; Thu, 2 Mar 2023 09:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vPLk/e2oosadXWIcQOfevRiTO6C/yOzd4FWWULnuD1s=;
 b=Hdbutq4lYE9zhHqKA6oHBc1DlUxoUKmv7cMv0KvBFlw+UiiiV+2v/pBUQ+YObryusH4i
 YJ9SCMzpQ8TPSPi29C0j5Xg+w3Aoy/yCFpHDxfFGkZZXRu9aKFvJNkUMWmXq6w9gmfa1
 hsiu9kuiVe5A0P/ff+zlWp88h9TBdEDT5D1cCqmTI4ANDyRLRbBMG9vIqtpp+/Wc6m/f
 5FmPv11SPMdZdX8Y6rvreeJWGWsIeVeqWv/O7LBK6Ngb8GTnLxH8oXL1Vq4EWPZdzvnY
 6h5vYkv8PpfJ3+7mIf4/m/sCZ1BH3aQdZL9lyX4Cc86gX2pQJhnudpwvxa1tgJqx4QO4 Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2re31bws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:24:03 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32290Mh2029080;
 Thu, 2 Mar 2023 09:24:02 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2re31bw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:24:02 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3226KaPC024608;
 Thu, 2 Mar 2023 09:24:01 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3nybe9v1w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:24:01 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3229O0o543581842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 09:24:00 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F75F5805D;
 Thu,  2 Mar 2023 09:24:00 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4CAA58061;
 Thu,  2 Mar 2023 09:23:58 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 09:23:58 +0000 (GMT)
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
Subject: [RFC PATCH v3 4/4] i386/sev: Allow measured direct kernel boot on SNP
Date: Thu,  2 Mar 2023 09:23:47 +0000
Message-Id: <20230302092347.1988853-5-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
References: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jgbc9TQqoLwV-E0tPTkh-LVw3JJCY1jM
X-Proofpoint-ORIG-GUID: liQZoXhzBQJ3lJrtW2djRp2NnCXATgd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_04,2023-03-02_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020078
Received-SPF: pass client-ip=148.163.158.5;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In SNP, the hashes page designated with a specific metadata entry
published in AmdSev OVMF.

Therefore, if the user enabled kernel hashes (for measured direct boot),
QEMU should prepare the content of hashes table, and during the
processing of the metadata entry it copy the content into the designated
page and encrypt it.

Note that in SNP (unlike SEV and SEV-ES) the measurements is done in
whole 4KB pages.  Therefore QEMU zeros the whole page that includes the
hashes table, and fills in the kernel hashes area in that page, and then
encrypts the whole page.  The rest of the page is reserved for SEV
launch secrets which are not usable anyway on SNP.

If the user disabled kernel hashes, QEMU pre-validates the kernel hashes
page as a zero page.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 include/hw/i386/pc.h |  2 ++
 target/i386/sev.c    | 40 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2b8212b416..32b5ca45ec 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -163,6 +163,8 @@ typedef enum {
     SEV_DESC_TYPE_SNP_SECRETS,
     /* The section contains address that can be used as a CPUID page */
     SEV_DESC_TYPE_CPUID,
+    /* The section contains the region for kernel hashes for measured direct boot */
+    SEV_DESC_TYPE_SNP_KERNEL_HASHES = 0x10,
 
 } ovmf_sev_metadata_desc_type;
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 126e40ec26..ef47fd748f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -131,6 +131,9 @@ struct SevSnpGuestState {
     struct kvm_snp_init kvm_init_conf;
     struct kvm_sev_snp_launch_start kvm_start_conf;
     struct kvm_sev_snp_launch_finish kvm_finish_conf;
+
+    uint32_t kernel_hashes_offset;
+    PaddedSevHashTable *kernel_hashes_data;
 };
 
 #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
@@ -1529,6 +1532,23 @@ snp_launch_update_cpuid(SevSnpGuestState *sev_snp, uint32_t cpuid_addr,
     return 0;
 }
 
+static int
+snp_launch_update_kernel_hashes(SevSnpGuestState *sev_snp, uint32_t addr,
+                                void *hva, uint32_t len)
+{
+    int type = KVM_SEV_SNP_PAGE_TYPE_ZERO;
+    if (sev_snp->sev_common.kernel_hashes) {
+        assert(sev_snp->kernel_hashes_data);
+        assert((sev_snp->kernel_hashes_offset +
+                sizeof(*sev_snp->kernel_hashes_data)) <= len);
+        memset(hva, 0, len);
+        memcpy(hva + sev_snp->kernel_hashes_offset, sev_snp->kernel_hashes_data,
+               sizeof(*sev_snp->kernel_hashes_data));
+        type = KVM_SEV_SNP_PAGE_TYPE_NORMAL;
+    }
+    return sev_snp_launch_update(sev_snp, addr, hva, len, type);
+}
+
 static int
 snp_metadata_desc_to_page_type(int desc_type)
 {
@@ -1537,6 +1557,7 @@ snp_metadata_desc_to_page_type(int desc_type)
     case SEV_DESC_TYPE_SNP_SEC_MEM: return KVM_SEV_SNP_PAGE_TYPE_ZERO;
     case SEV_DESC_TYPE_SNP_SECRETS: return KVM_SEV_SNP_PAGE_TYPE_SECRETS;
     case SEV_DESC_TYPE_CPUID: return KVM_SEV_SNP_PAGE_TYPE_CPUID;
+    case SEV_DESC_TYPE_SNP_KERNEL_HASHES: return KVM_SEV_SNP_PAGE_TYPE_NORMAL;
     default: return -1;
     }
 }
@@ -1568,6 +1589,9 @@ snp_populate_metadata_pages(SevSnpGuestState *sev_snp,
 
         if (type == KVM_SEV_SNP_PAGE_TYPE_CPUID) {
             ret = snp_launch_update_cpuid(sev_snp, desc->base, hva, desc->len);
+        } else if (desc->type == SEV_DESC_TYPE_SNP_KERNEL_HASHES) {
+            ret = snp_launch_update_kernel_hashes(sev_snp, desc->base, hva,
+                                                  desc->len);
         } else {
             ret = sev_snp_launch_update(sev_snp, desc->base, hva, desc->len,
                                         type);
@@ -2162,10 +2186,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         return false;
     }
 
-    if (sev_snp_enabled()) {
-        return false;
-    }
-
     area = (SevHashTableDescriptor *)data;
     if (!area->base || area->size < sizeof(PaddedSevHashTable)) {
         error_setg(errp, "SEV: guest firmware hashes table area is invalid "
@@ -2173,6 +2193,18 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         return false;
     }
 
+    if (sev_snp_enabled()) {
+        /*
+         * SNP: Populate the hashes table in an area that later in
+         * snp_launch_update_kernel_hashes() will be copied to the guest memory
+         * and encrypted.
+         */
+        SevSnpGuestState *sev_snp_guest = SEV_SNP_GUEST(sev_common);
+        sev_snp_guest->kernel_hashes_offset = area->base & ~TARGET_PAGE_MASK;
+        sev_snp_guest->kernel_hashes_data = g_new0(PaddedSevHashTable, 1);
+        return build_kernel_loader_hashes(sev_snp_guest->kernel_hashes_data, ctx, errp);
+    }
+
     /*
      * Populate the hashes table in the guest's memory at the OVMF-designated
      * area for the SEV hashes table
-- 
2.25.1


