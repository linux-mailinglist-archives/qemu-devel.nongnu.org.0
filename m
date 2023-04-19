Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B606E7F71
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:19:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAVV-0004xp-HR; Wed, 19 Apr 2023 12:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAVR-0004xa-RJ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAVH-00052E-Hb
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/FOp5RoEvZsdKDojoZTalUYPOQEiXwIeboDhJsCmqw=;
 b=hkVmBAY0HUnemexpYqkIrpTV260J1AAuNLnqcfFOOagx4tfMfaxiFFWhSVDBhcLnRIxDYS
 K/Oe5u0cbFc5hZc0qYY7GkcUk9DKAQ6jmxssqWs8HJo3gay1ph1GsuCsY05j0x57aSZONK
 JAAvsQKLkfE7y5hQBNuHqxYhSndyP6M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-fra7LjG6OaSHjrRQXXggqw-1; Wed, 19 Apr 2023 12:17:51 -0400
X-MC-Unique: fra7LjG6OaSHjrRQXXggqw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-74a7c661208so1735685a.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921069; x=1684513069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/FOp5RoEvZsdKDojoZTalUYPOQEiXwIeboDhJsCmqw=;
 b=bRJkxr5pX2GDjkKafAX9HPWhQK6oV+jNihvHQz57rgQv5lnJWvTlFQgnWdFLnrOD1T
 2miABKvZvrBPnjuJe1sc6pqE++cdiLxU+mei7RJ2cEop4CbpQ5BDhtM97oIuyXpSMtJw
 t1HHVrEH1WDfYuke35Mg72Y9SMqQAyvLmunvYrn+qni+GmRrPvYj3MY0AMl0YpkO3AKG
 F4Ql9XurpcYp2fKn+c+RUv0jjojndsdYyQH7qmk6BhrHMoVRVuH8RyzqmWu3xEmJ3cpH
 FRpetT8B0Zj0MXKgq/tJL27B0WEcoIG1/61ClTeY7wLzLCEa6A4r4PNf9WU28QbQqo4X
 RshA==
X-Gm-Message-State: AAQBX9c+6acFOA6qcBJCksB87l6q9gTHLaY+VeTmuElnCC7RThx21Bei
 yMhXYfVYmwU+p+qBu9WEoxSiH+stW+yCsjjkgulfOXA91tLctnv36jkZ7wyQ1HhgDcU2wV50ZJP
 hwI8390PP4Rz2fTlFBEyHjjaTJ63/NRGFEeZaQ/yaaX7OI079Y78ZPYcCTrkYE1T2B+tPK9Xd
X-Received: by 2002:a05:622a:316:b0:3ef:4a7c:d7c5 with SMTP id
 q22-20020a05622a031600b003ef4a7cd7c5mr702669qtw.4.1681921069653; 
 Wed, 19 Apr 2023 09:17:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yc0fuxYD88+++mDM/MipGg762Bxi42HCm3LiSXHdI9SZN2dCLc9l/Lc6iDLtI7MEtBd7ApyQ==
X-Received: by 2002:a05:622a:316:b0:3ef:4a7c:d7c5 with SMTP id
 q22-20020a05622a031600b003ef4a7cd7c5mr702613qtw.4.1681921069188; 
 Wed, 19 Apr 2023 09:17:49 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05620a0b0c00b007468b183a65sm351481qkg.30.2023.04.19.09.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:17:48 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 3/4] migration/postcopy: Detect file system on dest host
Date: Wed, 19 Apr 2023 12:17:38 -0400
Message-Id: <20230419161739.1129988-4-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230419161739.1129988-1-peterx@redhat.com>
References: <20230419161739.1129988-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 migration/postcopy-ram.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 93f39f8e06..bbb8af61ae 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -36,6 +36,7 @@
 #include "yank_functions.h"
 #include "tls.h"
 #include "qemu/userfaultfd.h"
+#include "qemu/mmap-alloc.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -336,11 +337,12 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
 
 /* Callback from postcopy_ram_supported_by_host block iterator.
  */
-static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
+static int test_ramblock_postcopiable(RAMBlock *rb)
 {
     const char *block_name = qemu_ram_get_idstr(rb);
     ram_addr_t length = qemu_ram_get_used_length(rb);
     size_t pagesize = qemu_ram_pagesize(rb);
+    QemuFsType fs;
 
     if (length % pagesize) {
         error_report("Postcopy requires RAM blocks to be a page size multiple,"
@@ -348,6 +350,15 @@ static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
                      "page size of 0x%zx", block_name, length, pagesize);
         return 1;
     }
+
+    if (rb->fd >= 0) {
+        fs = qemu_fd_getfs(rb->fd);
+        if (fs != QEMU_FS_TYPE_TMPFS && fs != QEMU_FS_TYPE_HUGETLBFS) {
+            error_report("Host backend files need to be TMPFS or HUGETLBFS only");
+            return 1;
+        }
+    }
+
     return 0;
 }
 
@@ -366,6 +377,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     struct uffdio_range range_struct;
     uint64_t feature_mask;
     Error *local_err = NULL;
+    RAMBlock *block;
 
     if (qemu_target_page_size() > pagesize) {
         error_report("Target page size bigger than host page size");
@@ -390,9 +402,23 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
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
+     *
+     * A side effect of this is we'll also check against RAM_SHARED
+     * ramblocks even if migrate_ignore_shared() is set (in which case
+     * we'll never migrate RAM_SHARED at all), but normally this shouldn't
+     * affect in reality, or we can revisit.
+     */
+    RAMBLOCK_FOREACH(block) {
+        if (test_ramblock_postcopiable(block)) {
+            goto out;
+        }
     }
 
     /*
-- 
2.39.1


