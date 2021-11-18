Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC1455D1D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:57:34 +0100 (CET)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhuv-0001O2-V8
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:57:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnhaR-0008Ms-JR
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnhaP-0002py-50
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637242580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uo8I2c5dBIybD98Va+nuEDj8eGhYueQwVlnbeu2P2bM=;
 b=K2CcSQ/7gnSBUnvpfXQ/u/YXXNVCVbEh63JOCHdkjcjdm4ZUsoLTlk9pv/A3kphJM8JZit
 qUU8qZTY8sG4NYK7noJt810TlaYBKlbonwQN8nNxGhJfPyQRp2uOsiEO5dj/yr/Hk3U9p2
 Pl/PLEQYy7vW2ry5iyXWsuMrBUR/HyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-71-BxsWHeKaMvKwOhrraaIk3Q-1; Thu, 18 Nov 2021 08:36:17 -0500
X-MC-Unique: BxsWHeKaMvKwOhrraaIk3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A80D100E325;
 Thu, 18 Nov 2021 13:36:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 476595F4ED;
 Thu, 18 Nov 2021 13:36:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] target/i386/sev: Perform padding calculations at
 compile-time
Date: Thu, 18 Nov 2021 13:35:31 +0000
Message-Id: <20211118133532.2029166-6-berrange@redhat.com>
In-Reply-To: <20211118133532.2029166-1-berrange@redhat.com>
References: <20211118133532.2029166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

In sev_add_kernel_loader_hashes, the sizes of structs are known at
compile-time, so calculate needed padding at compile-time.

No functional change intended.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/sev.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index d11b512361..4fd258a570 100644
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
2.31.1


