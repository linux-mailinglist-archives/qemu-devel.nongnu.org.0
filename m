Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3013F7087
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:37:41 +0200 (CEST)
Received: from localhost ([::1]:60512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInTg-0004uV-73
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mInRy-0000lp-LG
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:35:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27556
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mInRw-0004q5-F1
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:35:54 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17P7YoP1058144; Wed, 25 Aug 2021 03:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=z620+Oo+LZMQ2ssYHIGRxiCvRnBNGHOm9BSjwnkbSL8=;
 b=bDnzAyjqsh5JCUBbLwxqK8ckVlIyYMX0YVdjMpbQ7MkLW8aC2Cu3w9jAglfz2Oa+NNOl
 ZqmvFFZ6tmrRhhio3j8hmmytOx9gsx3nK1DLQ32v4ANMITIcx4KrAyzlqa2J1I5koo7i
 8NP8wT6AiN69j0+KjX7IOzm8GJzLldN7Etuk2p7TxgviuugZWhDcK5NroNLtaZv5+R55
 DRj9dN4M5ynhrmsCG+/j2nEMmMtwfKdCZKhBV7LMU/qKzPpkuRAU0JXdVQFs5m4VxWGI
 M0NkK3p2aDi2TSJJm6f7TcI2s42Poh+sHzRosQ6EHk2hCQSjXuns4N6+NiB6Zc81ERog Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3anhhq03j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 03:35:49 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17P7Ys8b058821;
 Wed, 25 Aug 2021 03:35:48 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3anhhq03ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 03:35:48 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17P7YLhw023022;
 Wed, 25 Aug 2021 07:35:48 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3ajs4cqm80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 07:35:48 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17P7ZkUj27722034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 07:35:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56955C606C;
 Wed, 25 Aug 2021 07:35:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 291A1C6059;
 Wed, 25 Aug 2021 07:35:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 Aug 2021 07:35:45 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes for
 measured linux boot
Date: Wed, 25 Aug 2021 07:35:37 +0000
Message-Id: <20210825073538.959525-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825073538.959525-1-dovmurik@linux.ibm.com>
References: <20210825073538.959525-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -60ReOrtdxvtd_kc0QOoddFcIKVWb5zT
X-Proofpoint-ORIG-GUID: GaHhrQI2TRCny1CT8yh5_NX4Fxw_qrKc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_02:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108250044
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
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
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
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
---
 target/i386/sev_i386.h |  12 ++++
 target/i386/sev-stub.c |   5 ++
 target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)

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
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 0227cb5177..addb089f36 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -81,3 +81,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
+
+bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp)
+{
+    g_assert_not_reached();
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 83df8c09f6..857d75bd3e 100644
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
@@ -83,6 +84,32 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
     uint32_t reset_addr;
 } SevInfoBlock;
 
+#define SEV_HASH_TABLE_RV_GUID  "7255371f-3a3b-4b04-927b-1da6efa8d454"
+typedef struct QEMU_PACKED SevHashTableDescriptor {
+    /* SEV hash table area guest address */
+    uint32_t base;
+    /* SEV hash table area size (in bytes) */
+    uint32_t size;
+} SevHashTableDescriptor;
+
+/* hard code sha256 digest size */
+#define HASH_SIZE 32
+
+typedef struct QEMU_PACKED SevHashTableEntry {
+    QemuUUID guid;
+    uint16_t len;
+    uint8_t hash[HASH_SIZE];
+} SevHashTableEntry;
+
+typedef struct QEMU_PACKED SevHashTable {
+    QemuUUID guid;
+    uint16_t len;
+    SevHashTableEntry cmdline;
+    SevHashTableEntry initrd;
+    SevHashTableEntry kernel;
+    uint8_t padding[];
+} SevHashTable;
+
 static SevGuestState *sev_guest;
 static Error *sev_mig_blocker;
 
@@ -1077,6 +1104,116 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
     return 0;
 }
 
+static const QemuUUID sev_hash_table_header_guid = {
+    .data = UUID_LE(0x9438d606, 0x4f22, 0x4cc9, 0xb4, 0x79, 0xa7, 0x93,
+                    0xd4, 0x11, 0xfd, 0x21)
+};
+
+static const QemuUUID sev_kernel_entry_guid = {
+    .data = UUID_LE(0x4de79437, 0xabd2, 0x427f, 0xb8, 0x35, 0xd5, 0xb1,
+                    0x72, 0xd2, 0x04, 0x5b)
+};
+static const QemuUUID sev_initrd_entry_guid = {
+    .data = UUID_LE(0x44baf731, 0x3a2f, 0x4bd7, 0x9a, 0xf1, 0x41, 0xe2,
+                    0x91, 0x69, 0x78, 0x1d)
+};
+static const QemuUUID sev_cmdline_entry_guid = {
+    .data = UUID_LE(0x97d02dd8, 0xbd20, 0x4c94, 0xaa, 0x78, 0xe7, 0x71,
+                    0x4d, 0x36, 0xab, 0x2a)
+};
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
+    uint8_t cmdline_hash[HASH_SIZE];
+    uint8_t initrd_hash[HASH_SIZE];
+    uint8_t kernel_hash[HASH_SIZE];
+    uint8_t *hashp;
+    size_t hash_len = HASH_SIZE;
+    int aligned_len;
+
+    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
+        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
+        return false;
+    }
+    area = (SevHashTableDescriptor *)data;
+
+    /*
+     * Calculate hash of kernel command-line with the terminating null byte. If
+     * the user doesn't supply a command-line via -append, the 1-byte "\0" will
+     * be used.
+     */
+    hashp = cmdline_hash;
+    if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->cmdline_data,
+                           ctx->cmdline_size, &hashp, &hash_len, errp) < 0) {
+        return false;
+    }
+    assert(hash_len == HASH_SIZE);
+
+    /*
+     * Calculate hash of initrd. If the user doesn't supply an initrd via
+     * -initrd, an empty buffer will be used (ctx->initrd_size == 0).
+     */
+    hashp = initrd_hash;
+    if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->initrd_data,
+                           ctx->initrd_size, &hashp, &hash_len, errp) < 0) {
+        return false;
+    }
+    assert(hash_len == HASH_SIZE);
+
+    /* Calculate hash of the kernel */
+    hashp = kernel_hash;
+    struct iovec iov[2] = {
+        { .iov_base = ctx->setup_data, .iov_len = ctx->setup_size },
+        { .iov_base = ctx->kernel_data, .iov_len = ctx->kernel_size }
+    };
+    if (qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_SHA256, iov, ARRAY_SIZE(iov),
+                            &hashp, &hash_len, errp) < 0) {
+        return false;
+    }
+    assert(hash_len == HASH_SIZE);
+
+    /*
+     * Populate the hashes table in the guest's memory at the OVMF-designated
+     * area for the SEV hashes table
+     */
+    ht = qemu_map_ram_ptr(NULL, area->base);
+
+    ht->guid = sev_hash_table_header_guid;
+    ht->len = sizeof(*ht);
+
+    ht->cmdline.guid = sev_cmdline_entry_guid;
+    ht->cmdline.len = sizeof(ht->cmdline);
+    memcpy(ht->cmdline.hash, cmdline_hash, sizeof(ht->cmdline.hash));
+
+    ht->initrd.guid = sev_initrd_entry_guid;
+    ht->initrd.len = sizeof(ht->initrd);
+    memcpy(ht->initrd.hash, initrd_hash, sizeof(ht->initrd.hash));
+
+    ht->kernel.guid = sev_kernel_entry_guid;
+    ht->kernel.len = sizeof(ht->kernel);
+    memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
+
+    /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
+    aligned_len = ROUND_UP(ht->len, 16);
+    if (aligned_len != ht->len) {
+        /* zero the excess data so the measurement can be reliably calculated */
+        memset(ht->padding, 0, aligned_len - ht->len);
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
-- 
2.25.1


