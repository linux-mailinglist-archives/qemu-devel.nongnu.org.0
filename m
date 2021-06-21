Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350B13AF5DC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:09:53 +0200 (CEST)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPIu-0004jT-8r
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvPFN-0000mj-MO
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:06:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45286
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvPFL-0004lH-Ju
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:06:13 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LJ3gh1023109; Mon, 21 Jun 2021 15:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NQzDLDP1laRCLkR8rW/PE9zGfyyFe6NPZhPwywtJrQs=;
 b=Ie2lyO6becMBJMzulIarvntO8IAUq/V5lkLa1C6693Qwn3vv8kjrI9QWPgfsBm+pMyMU
 Z6qboWgl+jVAF074P5EMfSSNH7ZJlFcoZnGap1Y8nwhVpGytsBntfPgcTVrc7gQXUj1w
 jZj01wcQMaxegY0+eB+wvPL6HwjI4SacdujRmXclw1fhaJIS0ZotUdhnWb/k2uAweTsy
 YRb5Hek4qTH6AK+KFMtxpK/eau6ZGbTlcBnf3gm7aNwSYq597yZIrcYaAcHI53pSGjca
 9p6SHY4b4wC+7SnaIrWFRhEAOClLa3uLuDQhzSIdQ97YLKFkAtSnxH2U4YxSYsVHRFpT OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39b0jd02rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 15:06:08 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LJ67ZZ033261;
 Mon, 21 Jun 2021 15:06:07 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39b0jd02qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 15:06:07 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LJ3jB4031184;
 Mon, 21 Jun 2021 19:06:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 399879dwcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 19:06:06 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LJ65TW28639546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 19:06:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DE656A04D;
 Mon, 21 Jun 2021 19:06:05 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0A5C6A04F;
 Mon, 21 Jun 2021 19:06:03 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 19:06:03 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes for
 measured linux boot
Date: Mon, 21 Jun 2021 19:05:52 +0000
Message-Id: <20210621190553.1763020-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BFGfl6dbqsLioJr4n6UFO_aLI7I8et7k
X-Proofpoint-ORIG-GUID: yN2MD8HALHHJX0JUZkbLK71nlNLlx05E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_10:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106210112
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the sev_add_kernel_loader_hashes function to calculate the hashes of
the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
table area.  For this to work, OVMF must support an encrypted area to
place the data which is advertised via a special GUID in the OVMF reset
table.

The hashes of each of the files is calculated (or the string in the case
of the cmdline with trailing '\0' included).  Each entry in the hashes
table is GUID identified and since they're passed through the
sev_encrypt_flash interface, the hashes will be accumulated by the PSP
measurement (SEV_LAUNCH_MEASURE).

Co-developed-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 target/i386/sev-stub.c |   5 ++
 target/i386/sev.c      | 121 +++++++++++++++++++++++++++++++++++++++++
 target/i386/sev_i386.h |  12 ++++
 3 files changed, 138 insertions(+)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 0227cb5177..2b5e42d644 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -81,3 +81,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
+
+bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp)
+{
+    return false;
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 83df8c09f6..8e3f601bb6 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -23,6 +23,7 @@
 #include "qemu/base64.h"
 #include "qemu/module.h"
 #include "qemu/uuid.h"
+#include "crypto/hash.h"
 #include "sysemu/kvm.h"
 #include "sev_i386.h"
 #include "sysemu/sysemu.h"
@@ -83,6 +84,29 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
     uint32_t reset_addr;
 } SevInfoBlock;
 
+#define SEV_HASH_TABLE_RV_GUID  "7255371f-3a3b-4b04-927b-1da6efa8d454"
+typedef struct __attribute__((__packed__)) SevHashTableDescriptor {
+    /* SEV hash table area guest address */
+    uint32_t base;
+    /* SEV hash table area size (in bytes) */
+    uint32_t size;
+} SevHashTableDescriptor;
+
+/* hard code sha256 digest size */
+#define HASH_SIZE 32
+
+typedef struct __attribute__((__packed__)) SevHashTableEntry {
+    uint8_t guid[16];
+    uint16_t len;
+    uint8_t hash[HASH_SIZE];
+} SevHashTableEntry;
+
+typedef struct __attribute__((__packed__)) SevHashTable {
+    uint8_t guid[16];
+    uint16_t len;
+    SevHashTableEntry entries[];
+} SevHashTable;
+
 static SevGuestState *sev_guest;
 static Error *sev_mig_blocker;
 
@@ -1077,6 +1101,103 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
     return 0;
 }
 
+static const uint8_t sev_hash_table_header_guid[] =
+        UUID_LE(0x9438d606, 0x4f22, 0x4cc9, 0xb4, 0x79, 0xa7, 0x93,
+                0xd4, 0x11, 0xfd, 0x21);
+
+static const uint8_t sev_kernel_entry_guid[] =
+        UUID_LE(0x4de79437, 0xabd2, 0x427f, 0xb8, 0x35, 0xd5, 0xb1,
+                0x72, 0xd2, 0x04, 0x5b);
+static const uint8_t sev_initrd_entry_guid[] =
+        UUID_LE(0x44baf731, 0x3a2f, 0x4bd7, 0x9a, 0xf1, 0x41, 0xe2,
+                0x91, 0x69, 0x78, 0x1d);
+static const uint8_t sev_cmdline_entry_guid[] =
+        UUID_LE(0x97d02dd8, 0xbd20, 0x4c94, 0xaa, 0x78, 0xe7, 0x71,
+                0x4d, 0x36, 0xab, 0x2a);
+
+static void fill_sev_hash_table_entry(SevHashTableEntry *e, const uint8_t *guid,
+                                      const uint8_t *hash, size_t hash_len)
+{
+    memcpy(e->guid, guid, sizeof(e->guid));
+    e->len = sizeof(*e);
+    memcpy(e->hash, hash, hash_len);
+}
+
+/*
+ * Add the hashes of the linux kernel/initrd/cmdline to an encrypted guest page
+ * which is included in SEV's initial memory measurement.
+ */
+bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp)
+{
+    uint8_t *data;
+    SevHashTableDescriptor *area;
+    SevHashTable *ht;
+    SevHashTableEntry *e;
+    uint8_t hash_buf[HASH_SIZE];
+    uint8_t *hash = hash_buf;
+    size_t hash_len = sizeof(hash_buf);
+    int ht_index = 0;
+    int aligned_len;
+
+    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
+        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
+        return false;
+    }
+    area = (SevHashTableDescriptor *)data;
+
+    ht = qemu_map_ram_ptr(NULL, area->base);
+
+    /* Populate the hashes table header */
+    memcpy(ht->guid, sev_hash_table_header_guid, sizeof(ht->guid));
+    ht->len = sizeof(*ht);
+
+    /* Calculate hash of kernel command-line */
+    if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->cmdline_data,
+                           ctx->cmdline_size,
+                           &hash, &hash_len, errp) < 0) {
+        return false;
+    }
+    e = &ht->entries[ht_index++];
+    fill_sev_hash_table_entry(e, sev_cmdline_entry_guid, hash, hash_len);
+
+    /* Calculate hash of initrd */
+    if (ctx->initrd_data) {
+        if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->initrd_data,
+                               ctx->initrd_size, &hash, &hash_len, errp) < 0) {
+            return false;
+        }
+        e = &ht->entries[ht_index++];
+        fill_sev_hash_table_entry(e, sev_initrd_entry_guid, hash, hash_len);
+    }
+
+    /* Calculate hash of the kernel */
+    struct iovec iov[2] = {
+        { .iov_base = ctx->setup_data, .iov_len = ctx->setup_size },
+        { .iov_base = ctx->kernel_data, .iov_len = ctx->kernel_size }
+    };
+    if (qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_SHA256, iov, 2,
+                            &hash, &hash_len, errp) < 0) {
+        return false;
+    }
+    e = &ht->entries[ht_index++];
+    fill_sev_hash_table_entry(e, sev_kernel_entry_guid, hash, hash_len);
+
+    /* now we have all the possible entries, finalize the hashes table */
+    ht->len += ht_index * sizeof(*e);
+    /* SEV len has to be 16 byte aligned */
+    aligned_len = ROUND_UP(ht->len, 16);
+    if (aligned_len != ht->len) {
+        /* zero the excess data so the measurement can be reliably calculated */
+        memset(&ht->entries[ht_index], 0, aligned_len - ht->len);
+    }
+
+    if (sev_encrypt_flash((uint8_t *)ht, aligned_len, errp) < 0) {
+        return false;
+    }
+
+    return true;
+}
+
 static void
 sev_register_types(void)
 {
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index ae6d840478..deb3eec409 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -28,6 +28,17 @@
 #define SEV_POLICY_DOMAIN       0x10
 #define SEV_POLICY_SEV          0x20
 
+typedef struct KernelLoaderContext {
+    char *setup_data;
+    size_t setup_size;
+    char *kernel_data;
+    size_t kernel_size;
+    char *initrd_data;
+    size_t initrd_size;
+    char *cmdline_data;
+    size_t cmdline_size;
+} KernelLoaderContext;
+
 extern bool sev_es_enabled(void);
 extern uint64_t sev_get_me_mask(void);
 extern SevInfo *sev_get_info(void);
@@ -37,5 +48,6 @@ extern char *sev_get_launch_measurement(void);
 extern SevCapability *sev_get_capabilities(Error **errp);
 extern SevAttestationReport *
 sev_get_attestation_report(const char *mnonce, Error **errp);
+extern bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp);
 
 #endif
-- 
2.25.1


