Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF88455CF7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:48:11 +0100 (CET)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhlq-0003G5-PV
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:48:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnhaE-0008Fg-8D
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnhaC-0002n6-3R
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637242566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0jWfCVy5hsGWWk378HfV5JQITTylC4Ln+G643a7bz0=;
 b=BfaWSy69O7wppG2FBjX1/K45KqUl4bsAJCGw5CoOr/bzAxr6lB5B8QHtka4pjSuEicO+9l
 AVL8Zf8RiMWIvVjEJ1Xx23g5UDx4NX8/9k857yw9sgvVxwnQFBuQ5L0TDea65jJP5LUuti
 80+3kOkFD16tQs++4g+8hxFfcWcFB1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-hUyKkSDmOT6NqcLCvhAdkA-1; Thu, 18 Nov 2021 08:36:05 -0500
X-MC-Unique: hUyKkSDmOT6NqcLCvhAdkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03DBE100E320;
 Thu, 18 Nov 2021 13:36:04 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ECC756A90;
 Thu, 18 Nov 2021 13:36:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] target/i386/sev: Fail when invalid hashes table area
 detected
Date: Thu, 18 Nov 2021 13:35:30 +0000
Message-Id: <20211118133532.2029166-5-berrange@redhat.com>
In-Reply-To: <20211118133532.2029166-1-berrange@redhat.com>
References: <20211118133532.2029166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

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
table, display an error and stop the guest launch.  In such case, the
following error will be displayed:

    qemu-system-x86_64: SEV: guest firmware hashes table area is invalid (base=0x0 size=0x0)

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reported-by: Brijesh Singh <brijesh.singh@amd.com>
Acked-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/sev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 6ff196f7ad..d11b512361 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1221,7 +1221,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     uint8_t kernel_hash[HASH_SIZE];
     uint8_t *hashp;
     size_t hash_len = HASH_SIZE;
-    int aligned_len;
+    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
 
     /*
      * Only add the kernel hashes if the sev-guest configuration explicitly
@@ -1237,6 +1237,11 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         return false;
     }
     area = (SevHashTableDescriptor *)data;
+    if (!area->base || area->size < aligned_len) {
+        error_setg(errp, "SEV: guest firmware hashes table area is invalid "
+                         "(base=0x%x size=0x%x)", area->base, area->size);
+        return false;
+    }
 
     /*
      * Calculate hash of kernel command-line with the terminating null byte. If
@@ -1295,7 +1300,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
 
     /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
-    aligned_len = ROUND_UP(ht->len, 16);
     if (aligned_len != ht->len) {
         /* zero the excess data so the measurement can be reliably calculated */
         memset(ht->padding, 0, aligned_len - ht->len);
-- 
2.31.1


