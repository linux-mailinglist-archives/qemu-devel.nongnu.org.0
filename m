Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42F422F6C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:53:40 +0200 (CEST)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXodH-0004Dk-KJ
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYA-0007oB-4a
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnY7-0003u8-TZ
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:17 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g10so1119377edj.1
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mDdKhyGtGxh7guoKQYRKq/mY/zRbnYfe1vCaNSp/edY=;
 b=B9kzW9H1zdyg/BemUo+kjmjWRvio7Nq5WyKTPnfiebEb/zcC32GkoNFCmmfJO6BUvF
 uGErd5+PdB5olQ7T4X52hzWIVmsZZGrPwEKozAkJq8JNvdNrpDB0jDJ5/Sr02cXaieIL
 AvjrHhfPmamNsTD0VXWPinxCj7ZEBjRwDurOHlBb7o/eS9L6JWobGuhF2uBN6x794bJ9
 tBueiAUBPeqns4sbhCjYct4ZvHWRF27pMR/62WwEsMIl+7bsjx7syk9WMlFFKaGjm3UM
 Z50/HSf6ss6eerlACkJetAOUsMVBzDVaQ7wNHDnxmu2lRwWkOJtuQ4jKG0uT/7Q5mUrf
 A3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mDdKhyGtGxh7guoKQYRKq/mY/zRbnYfe1vCaNSp/edY=;
 b=kETwyVBlbxa2UFAcFlB9xiT7qrumCC+N+vSrKrXVbyRxnZXJvm5JtN3JViIp/WwfEL
 JbesKFiudk9X6AiPi2X4kwbUNUpjQStQzAHYEJI5BzWahhBNOzovUIaAg0cg4CJYZmBs
 BpBh3UKUsOPIB7Gr/1li4/P/3RgPrGvz1JETBIKwz/Pll++VQnpxPSlGj1uReW8iDjGQ
 lshWUfWbp9JatonGtsl5cwMv4YfrxvlZcG20uZEdA0jtNFwxpNY3L1ZU3HB+tFMprFqE
 vWaLTFqfszUvvtpK8G8ZbbPYOsp+fCy8HcpE6k+i79G9uaLJ7VKg7fQZwVjHe3nv7v0H
 tHDw==
X-Gm-Message-State: AOAM532mW0qN4Qz9zTaJSZ+kqNIiYAi63ZX9ej3/hST2aeoFpO43Pi1S
 02bWUKvknNsrSSdxeWoHo70ySEK/mRU=
X-Google-Smtp-Source: ABdhPJzX3dDDsV0bJCWwDMaMQPLe4+v2ElYHnXauSuWNFSojp8f6kuqlke/NB3osaadZhG4T/g5vfQ==
X-Received: by 2002:a17:906:640f:: with SMTP id
 d15mr26853303ejm.419.1633452253232; 
 Tue, 05 Oct 2021 09:44:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] sev/i386: Introduce sev_add_kernel_loader_hashes for
 measured linux boot
Date: Tue,  5 Oct 2021 18:43:58 +0200
Message-Id: <20211005164408.288128-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Add the sev_add_kernel_loader_hashes function to calculate the hashes of
the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
table area.  For this to work, OVMF must support an encrypted area to
place the data which is advertised via a special GUID in the OVMF reset
table.

The hashes of each of the files is calculated (or the string in the case
of the cmdline with trailing '\0' included).  Each entry in the hashes
table is GUID identified and since they're passed through the
sev_encrypt_flash interface, the hashes will be accumulated by the AMD
PSP measurement (SEV_LAUNCH_MEASURE).

Co-developed-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210930054915.13252-2-dovmurik@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev-stub.c |   5 ++
 target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
 target/i386/sev_i386.h |  12 ++++
 3 files changed, 154 insertions(+)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 0227cb5177..d8e6583171 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -81,3 +81,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
+
+bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
+{
+    g_assert_not_reached();
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index fa7210473a..bcd9260fa4 100644
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
 
@@ -1071,6 +1098,116 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
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
+bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
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
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index ae6d840478..2afe108069 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -28,6 +28,17 @@
 #define SEV_POLICY_DOMAIN       0x10
 #define SEV_POLICY_SEV          0x20
 
+typedef struct SevKernelLoaderContext {
+    char *setup_data;
+    size_t setup_size;
+    char *kernel_data;
+    size_t kernel_size;
+    char *initrd_data;
+    size_t initrd_size;
+    char *cmdline_data;
+    size_t cmdline_size;
+} SevKernelLoaderContext;
+
 extern bool sev_es_enabled(void);
 extern uint64_t sev_get_me_mask(void);
 extern SevInfo *sev_get_info(void);
@@ -37,5 +48,6 @@ extern char *sev_get_launch_measurement(void);
 extern SevCapability *sev_get_capabilities(Error **errp);
 extern SevAttestationReport *
 sev_get_attestation_report(const char *mnonce, Error **errp);
+extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
 #endif
-- 
2.31.1



