Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4C66E6FBB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 00:59:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pouH1-0001Lk-19; Tue, 18 Apr 2023 18:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pouGz-0001LP-Qa
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pouGx-0007Fa-Fm
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681858681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfe7wWvJEqhWrw/5dRu9ujTZ7gYvhKG5iAivwThgjSw=;
 b=XBO//NrxUQBBaXDfBI4i+rNK6J5lit7kccIx4g8LzbjNRLWQBISW57ebXX4ks/Jk0GG6VP
 6Ef9hG9CbqAw8mZajb+PkmXIuqq9fIBBzqh+fujQZLFkw1oe64gE8e3WQAKHpk+PyoLc40
 T7Fv2FmcnIz1hAJCd5ub33F3Jy7fZ/k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-UxbQrX1QNw6mxHvCDHLYRw-1; Tue, 18 Apr 2023 18:58:00 -0400
X-MC-Unique: UxbQrX1QNw6mxHvCDHLYRw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so10996321cf.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 15:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681858679; x=1684450679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tfe7wWvJEqhWrw/5dRu9ujTZ7gYvhKG5iAivwThgjSw=;
 b=TCQYvCpuuhTe4whqhUeJUKF+jjdGUSdNGaIVcgIbzvzhv+cVGOKBtxgvqaFKm+/Icw
 ax5w6yYnH4mMLbNkD3XmmsI4dw6Tb7Uue9/y20EfpJUAqNXtlqI58MsMon31NfFYYfkD
 P0+Te7WICI8riUVykFN0MS7HE/r9SkA78jNIe7BDMe6r+KNJouE+4zvPh5F6oJZPRwWz
 WWDlRzuUnCgRm/0LMRjsMx4W38nXLQ9izW4bOcH6maOdH+JOZqJalL6DiPVLua0qSi81
 yQw/0F4tEPpjrFPo6uFApfafjSV9kqrLuEbmxcbqeXW/S1rzObOEOAFn3mNVuQ6J9Urt
 V9aQ==
X-Gm-Message-State: AAQBX9cBXgAS1fYWQdUSHNX6g6RfQx6eOu35kgb+nvE3zAJYryHW8MH/
 MXAd5mloUqi/+PLGQyJpppWKHY+axPfJkOrJGZoBgpygMxaFKU0aJ9ypcW56zChcoWcgbiAn6nO
 L4pRCs82vmBS/mNNuzTD74WNCyT2qWf/g2KNgnjJo7bkisSPQFwg969yCRInLYMO06oo9sdRp
X-Received: by 2002:a05:6214:4109:b0:5ac:325c:a28f with SMTP id
 kc9-20020a056214410900b005ac325ca28fmr24495318qvb.0.1681858678874; 
 Tue, 18 Apr 2023 15:57:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YbmefXg08bW7IlGKeN6+wqj0iqJYaBModnTRW4SR6IGgYBYK1+7TcLdhQcBOoU3zLzRMaFKQ==
X-Received: by 2002:a05:6214:4109:b0:5ac:325c:a28f with SMTP id
 kc9-20020a056214410900b005ac325ca28fmr24495291qvb.0.1681858678508; 
 Tue, 18 Apr 2023 15:57:58 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 i3-20020ad45383000000b005e3c45c5cbdsm2937330qvv.96.2023.04.18.15.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 15:57:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com
Subject: [PATCH 3/3] migration/postcopy: Detect file system on dest host
Date: Tue, 18 Apr 2023 18:57:49 -0400
Message-Id: <20230418225749.1049185-4-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230418225749.1049185-1-peterx@redhat.com>
References: <20230418225749.1049185-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Postcopy requires the memory support userfaultfd to work.  Right now we
check it but it's a bit too late (when switching to postcopy migration).

Do that early right at enabling of postcopy.

Note that this is still only a best effort because ramblocks can be
dynamically created.  We can add check in hostmem creations and fail if
postcopy enabled, but maybe that's too aggressive.

Still, we have chance to fail the most obvious where we know there's an
existing unsupported ramblock.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 93f39f8e06..560530b758 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -336,11 +336,12 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
 
 /* Callback from postcopy_ram_supported_by_host block iterator.
  */
-static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
+static int test_ramblock_postcopiable(RAMBlock *rb)
 {
     const char *block_name = qemu_ram_get_idstr(rb);
     ram_addr_t length = qemu_ram_get_used_length(rb);
     size_t pagesize = qemu_ram_pagesize(rb);
+    const char *fs;
 
     if (length % pagesize) {
         error_report("Postcopy requires RAM blocks to be a page size multiple,"
@@ -348,6 +349,15 @@ static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
                      "page size of 0x%zx", block_name, length, pagesize);
         return 1;
     }
+
+    if (rb->fd >= 0) {
+        fs = file_memory_backend_get_fs_type(rb->mr->owner);
+        if (strcmp(fs, "tmpfs") && strcmp(fs, "hugetlbfs")) {
+            error_report("Host backend files need to be TMPFS or HUGETLBFS only");
+            return 1;
+        }
+    }
+
     return 0;
 }
 
@@ -366,6 +376,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     struct uffdio_range range_struct;
     uint64_t feature_mask;
     Error *local_err = NULL;
+    RAMBlock *block;
 
     if (qemu_target_page_size() > pagesize) {
         error_report("Target page size bigger than host page size");
@@ -390,9 +401,18 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
         goto out;
     }
 
-    /* We don't support postcopy with shared RAM yet */
-    if (foreach_not_ignored_block(test_ramblock_postcopiable, NULL)) {
-        goto out;
+    /*
+     * We don't support postcopy with some type of ramblocks.
+     *
+     * NOTE: we explicitly ignored ramblock_is_ignored() instead we checked
+     * all possible ramblocks.  This is because this function can be called
+     * when creating the migration object, during the phase RAM_MIGRATABLE
+     * is not even properly set for all the ramblocks.
+     */
+    RAMBLOCK_FOREACH(block) {
+        if (test_ramblock_postcopiable(block)) {
+            goto out;
+        }
     }
 
     /*
-- 
2.39.1


