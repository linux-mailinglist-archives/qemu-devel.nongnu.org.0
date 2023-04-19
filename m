Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA86E7F6C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:18:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAVM-0004vj-5E; Wed, 19 Apr 2023 12:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAVK-0004vH-3e
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAVG-00054K-Uq
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W25etzIGKC7y8UWxpjpw9PYTe8JfLidmdz7SbNUF1G0=;
 b=Zmerk4G9i7O4fqAKM+11dVmU44OAy92cs/LZgPyjBTQXOnPv393msYOWDInys7zQJ450cf
 IVBA9z/JBLjy74XoS3k5odx2eRxTaHzYyLy6HIvcdwcSG1JmZdzahTAXOJEY71KR2QL4HW
 yP646CkkpLmj1VZq97niQLwLd3qwRUk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-qQgRu5BnO4eW-aE-xr8kGg-1; Wed, 19 Apr 2023 12:17:52 -0400
X-MC-Unique: qQgRu5BnO4eW-aE-xr8kGg-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so13083541cf.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921071; x=1684513071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W25etzIGKC7y8UWxpjpw9PYTe8JfLidmdz7SbNUF1G0=;
 b=evfKkLo0SgCoMGx8crSAdJoWmioz0LaMjTyHbrNToy1bgWfoogSHORXoqwd7nUrFMB
 kAqNgvlEz5zo0GyOR79vozGplJBsl5FXw8Jz700LQxIxBmR4Ei03mHmt6BozYHm6W/sD
 9Qc7hnFibNIbY4y82JVOdLpZh9L7voeRfNn6bHh8WqGGRtVMjQCJEmt/Hr/3harfbHZm
 Vm/F/P0JdE+6axMI1IfHIz5bjDpjlhwzmLxVevshboqrQaZ88GX10vLDHnvoj/qJ6B6J
 hYR4Fo1Udsyqocby3XImluBAUVt5q3g5j76e7rDVcIGyxOeJqAvzQ0OIuF2djpOQy2XZ
 B4Ig==
X-Gm-Message-State: AAQBX9cjmiXc4NX/yUqKkcvi8no9FvlDHM2b+nJpYeUyxqjA74rrKg5a
 AZAK6Q+5l6pas0R8w1VCTeM7+NupZ1GWplWjAuxX97m5UcJdpRTtcecREHu+y1PFkZLyVys7ADt
 2sFqUQg9qeZVwzbf8j/fYhrgDSr0BEJLbsRtVBjLxYkRVLrtNqm7TDnRUBbBIOG6/S3ZU7I/H
X-Received: by 2002:a05:622a:316:b0:3ef:4a7c:d7c5 with SMTP id
 q22-20020a05622a031600b003ef4a7cd7c5mr702781qtw.4.1681921070730; 
 Wed, 19 Apr 2023 09:17:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350afryS4i6Z038XBu6j6UnGF6Uo99pCTFZlcXOh/6ucmdgWxBx4/XtH6/qTGJoPstOPfHcoWPQ==
X-Received: by 2002:a05:622a:316:b0:3ef:4a7c:d7c5 with SMTP id
 q22-20020a05622a031600b003ef4a7cd7c5mr702732qtw.4.1681921070307; 
 Wed, 19 Apr 2023 09:17:50 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05620a0b0c00b007468b183a65sm351481qkg.30.2023.04.19.09.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:17:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 4/4] migration: Allow postcopy_ram_supported_by_host() to
 report err
Date: Wed, 19 Apr 2023 12:17:39 -0400
Message-Id: <20230419161739.1129988-5-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230419161739.1129988-1-peterx@redhat.com>
References: <20230419161739.1129988-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Instead of print it to STDERR, bring the error upwards so that it can be
reported via QMP responses.

E.g.:

{ "execute": "migrate-set-capabilities" ,
  "arguments": { "capabilities":
  [ { "capability": "postcopy-ram", "state": true } ] } }

{ "error":
  { "class": "GenericError",
    "desc": "Postcopy is not supported: Host backend files need to be TMPFS
    or HUGETLBFS only" } }

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    |  9 +++---
 migration/postcopy-ram.c | 61 ++++++++++++++++++++++------------------
 migration/postcopy-ram.h |  3 +-
 migration/savevm.c       |  3 +-
 4 files changed, 42 insertions(+), 34 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bda4789193..ac15fa6092 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1313,6 +1313,7 @@ static bool migrate_caps_check(bool *cap_list,
     MigrationCapabilityStatusList *cap;
     bool old_postcopy_cap;
     MigrationIncomingState *mis = migration_incoming_get_current();
+    Error *local_err = NULL;
 
     old_postcopy_cap = cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM];
 
@@ -1344,11 +1345,9 @@ static bool migrate_caps_check(bool *cap_list,
          * special support.
          */
         if (!old_postcopy_cap && runstate_check(RUN_STATE_INMIGRATE) &&
-            !postcopy_ram_supported_by_host(mis)) {
-            /* postcopy_ram_supported_by_host will have emitted a more
-             * detailed message
-             */
-            error_setg(errp, "Postcopy is not supported");
+            !postcopy_ram_supported_by_host(mis, &local_err)) {
+            error_propagate_prepend(errp, local_err,
+                                    "Postcopy is not supported: ");
             return false;
         }
 
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index bbb8af61ae..0713ddeeef 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -282,11 +282,14 @@ static bool request_ufd_features(int ufd, uint64_t features)
     return true;
 }
 
-static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
+static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis,
+                                Error **errp)
 {
     uint64_t asked_features = 0;
     static uint64_t supported_features;
 
+    assert(errp);
+
     /*
      * it's not possible to
      * request UFFD_API twice per one fd
@@ -294,7 +297,7 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
      */
     if (!supported_features) {
         if (!receive_ufd_features(&supported_features)) {
-            error_report("%s failed", __func__);
+            error_setg(errp, "Userfault feature detection failed");
             return false;
         }
     }
@@ -316,8 +319,7 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
      * userfault file descriptor
      */
     if (!request_ufd_features(ufd, asked_features)) {
-        error_report("%s failed: features %" PRIu64, __func__,
-                     asked_features);
+        error_setg(errp, "Failed features %" PRIu64, asked_features);
         return false;
     }
 
@@ -328,7 +330,8 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
         have_hp = supported_features & UFFD_FEATURE_MISSING_HUGETLBFS;
 #endif
         if (!have_hp) {
-            error_report("Userfault on this host does not support huge pages");
+            error_setg(errp,
+                       "Userfault on this host does not support huge pages");
             return false;
         }
     }
@@ -337,7 +340,7 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
 
 /* Callback from postcopy_ram_supported_by_host block iterator.
  */
-static int test_ramblock_postcopiable(RAMBlock *rb)
+static int test_ramblock_postcopiable(RAMBlock *rb, Error **errp)
 {
     const char *block_name = qemu_ram_get_idstr(rb);
     ram_addr_t length = qemu_ram_get_used_length(rb);
@@ -345,16 +348,18 @@ static int test_ramblock_postcopiable(RAMBlock *rb)
     QemuFsType fs;
 
     if (length % pagesize) {
-        error_report("Postcopy requires RAM blocks to be a page size multiple,"
-                     " block %s is 0x" RAM_ADDR_FMT " bytes with a "
-                     "page size of 0x%zx", block_name, length, pagesize);
+        error_setg(errp,
+                   "Postcopy requires RAM blocks to be a page size multiple,"
+                   " block %s is 0x" RAM_ADDR_FMT " bytes with a "
+                   "page size of 0x%zx", block_name, length, pagesize);
         return 1;
     }
 
     if (rb->fd >= 0) {
         fs = qemu_fd_getfs(rb->fd);
         if (fs != QEMU_FS_TYPE_TMPFS && fs != QEMU_FS_TYPE_HUGETLBFS) {
-            error_report("Host backend files need to be TMPFS or HUGETLBFS only");
+            error_setg(errp,
+                       "Host backend files need to be TMPFS or HUGETLBFS only");
             return 1;
         }
     }
@@ -367,7 +372,8 @@ static int test_ramblock_postcopiable(RAMBlock *rb)
  * normally fine since if the postcopy succeeds it gets turned back on at the
  * end.
  */
-bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
+bool postcopy_ram_supported_by_host(MigrationIncomingState *mis,
+                                    Error **errp)
 {
     long pagesize = qemu_real_host_page_size();
     int ufd = -1;
@@ -376,29 +382,28 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     struct uffdio_register reg_struct;
     struct uffdio_range range_struct;
     uint64_t feature_mask;
-    Error *local_err = NULL;
     RAMBlock *block;
 
+    assert(errp);
+
     if (qemu_target_page_size() > pagesize) {
-        error_report("Target page size bigger than host page size");
+        error_setg(errp, "Target page size bigger than host page size");
         goto out;
     }
 
     ufd = uffd_open(O_CLOEXEC);
     if (ufd == -1) {
-        error_report("%s: userfaultfd not available: %s", __func__,
-                     strerror(errno));
+        error_setg(errp, "Userfaultfd not available: %s", strerror(errno));
         goto out;
     }
 
     /* Give devices a chance to object */
-    if (postcopy_notify(POSTCOPY_NOTIFY_PROBE, &local_err)) {
-        error_report_err(local_err);
+    if (postcopy_notify(POSTCOPY_NOTIFY_PROBE, errp)) {
         goto out;
     }
 
     /* Version and features check */
-    if (!ufd_check_and_apply(ufd, mis)) {
+    if (!ufd_check_and_apply(ufd, mis, errp)) {
         goto out;
     }
 
@@ -416,7 +421,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
      * affect in reality, or we can revisit.
      */
     RAMBLOCK_FOREACH(block) {
-        if (test_ramblock_postcopiable(block)) {
+        if (test_ramblock_postcopiable(block, errp)) {
             goto out;
         }
     }
@@ -426,7 +431,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
      * it was enabled.
      */
     if (munlockall()) {
-        error_report("%s: munlockall: %s", __func__,  strerror(errno));
+        error_setg(errp, "munlockall() failed: %s", strerror(errno));
         goto out;
     }
 
@@ -438,8 +443,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     testarea = mmap(NULL, pagesize, PROT_READ | PROT_WRITE, MAP_PRIVATE |
                                     MAP_ANONYMOUS, -1, 0);
     if (testarea == MAP_FAILED) {
-        error_report("%s: Failed to map test area: %s", __func__,
-                     strerror(errno));
+        error_setg(errp, "Failed to map test area: %s", strerror(errno));
         goto out;
     }
     g_assert(QEMU_PTR_IS_ALIGNED(testarea, pagesize));
@@ -449,14 +453,14 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     reg_struct.mode = UFFDIO_REGISTER_MODE_MISSING;
 
     if (ioctl(ufd, UFFDIO_REGISTER, &reg_struct)) {
-        error_report("%s userfault register: %s", __func__, strerror(errno));
+        error_setg(errp, "UFFDIO_REGISTER failed: %s", strerror(errno));
         goto out;
     }
 
     range_struct.start = (uintptr_t)testarea;
     range_struct.len = pagesize;
     if (ioctl(ufd, UFFDIO_UNREGISTER, &range_struct)) {
-        error_report("%s userfault unregister: %s", __func__, strerror(errno));
+        error_setg(errp, "UFFDIO_UNREGISTER failed: %s", strerror(errno));
         goto out;
     }
 
@@ -464,8 +468,8 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
                    (__u64)1 << _UFFDIO_COPY |
                    (__u64)1 << _UFFDIO_ZEROPAGE;
     if ((reg_struct.ioctls & feature_mask) != feature_mask) {
-        error_report("Missing userfault map features: %" PRIx64,
-                     (uint64_t)(~reg_struct.ioctls & feature_mask));
+        error_setg(errp, "Missing userfault map features: %" PRIx64,
+                   (uint64_t)(~reg_struct.ioctls & feature_mask));
         goto out;
     }
 
@@ -1187,6 +1191,8 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
 
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
+    Error *local_err = NULL;
+
     /* Open the fd for the kernel to give us userfaults */
     mis->userfault_fd = uffd_open(O_CLOEXEC | O_NONBLOCK);
     if (mis->userfault_fd == -1) {
@@ -1199,7 +1205,8 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
      * Although the host check already tested the API, we need to
      * do the check again as an ABI handshake on the new fd.
      */
-    if (!ufd_check_and_apply(mis->userfault_fd, mis)) {
+    if (!ufd_check_and_apply(mis->userfault_fd, mis, &local_err)) {
+        error_report_err(local_err);
         return -1;
     }
 
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index b4867a32d5..442ab89752 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -14,7 +14,8 @@
 #define QEMU_POSTCOPY_RAM_H
 
 /* Return true if the host supports everything we need to do postcopy-ram */
-bool postcopy_ram_supported_by_host(MigrationIncomingState *mis);
+bool postcopy_ram_supported_by_host(MigrationIncomingState *mis,
+                                    Error **errp);
 
 /*
  * Make all of RAM sensitive to accesses to areas that haven't yet been written
diff --git a/migration/savevm.c b/migration/savevm.c
index aa54a67fda..0d61ab6c19 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1752,7 +1752,8 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
         return -EINVAL;
     }
 
-    if (!postcopy_ram_supported_by_host(mis)) {
+    if (!postcopy_ram_supported_by_host(mis, &local_err)) {
+        error_report_err(local_err);
         postcopy_state_set(POSTCOPY_INCOMING_NONE);
         return -1;
     }
-- 
2.39.1


