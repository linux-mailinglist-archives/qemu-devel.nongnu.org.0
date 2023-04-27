Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604416F0286
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:27:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwxD-0001K0-EH; Thu, 27 Apr 2023 04:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwxA-0001J9-Sv
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx8-0001G2-Rj
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKTvOAXbI1JstZ1u59FjZDtpcWo/Ovq1Kwu3l6QFc5M=;
 b=BQNFL3fMFvvqUo6UDgvMEOqrGCfX+EXglRIKpkcRrsgpfeBbawL9YLzLD6fZEPAUm7hSOg
 wtW0DPi+s5XvRTFc1s+kshfvGuthwU+UDailmYDstgoKRai/Xc0suttNuXLAZ3VbJ/AWfi
 iy0XS1uJqNrroFtXGPXniPH+fOef+ME=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-hDAl98qUPDSZBJ9sH59cnw-1; Thu, 27 Apr 2023 04:26:08 -0400
X-MC-Unique: hDAl98qUPDSZBJ9sH59cnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2836428237C9
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:26:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0B8FC15BA0;
 Thu, 27 Apr 2023 08:26:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PULL 5/7] migration: Allow postcopy_ram_supported_by_host() to
 report err
Date: Thu, 27 Apr 2023 10:25:55 +0200
Message-Id: <20230427082557.20994-6-quintela@redhat.com>
In-Reply-To: <20230427082557.20994-1-quintela@redhat.com>
References: <20230427082557.20994-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

From: Peter Xu <peterx@redhat.com>

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
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.c      |  8 ++----
 migration/postcopy-ram.c | 60 +++++++++++++++++++++-------------------
 migration/postcopy-ram.h |  3 +-
 migration/savevm.c       |  3 +-
 4 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index fe7d7754c4..c6030587cf 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -302,6 +302,7 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
+    ERRP_GUARD();
 #ifndef CONFIG_LIVE_BLOCK_MIGRATION
     if (new_caps[MIGRATION_CAPABILITY_BLOCK]) {
         error_setg(errp, "QEMU compiled without old-style (blk/-b, inc/-i) "
@@ -327,11 +328,8 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
          */
         if (!old_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM] &&
             runstate_check(RUN_STATE_INMIGRATE) &&
-            !postcopy_ram_supported_by_host(mis)) {
-            /* postcopy_ram_supported_by_host will have emitted a more
-             * detailed message
-             */
-            error_setg(errp, "Postcopy is not supported");
+            !postcopy_ram_supported_by_host(mis, errp)) {
+            error_prepend(errp, "Postcopy is not supported: ");
             return false;
         }
 
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 0711500036..75aa276bb1 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -283,11 +283,13 @@ static bool request_ufd_features(int ufd, uint64_t features)
     return true;
 }
 
-static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
+static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis,
+                                Error **errp)
 {
     uint64_t asked_features = 0;
     static uint64_t supported_features;
 
+    ERRP_GUARD();
     /*
      * it's not possible to
      * request UFFD_API twice per one fd
@@ -295,7 +297,7 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
      */
     if (!supported_features) {
         if (!receive_ufd_features(&supported_features)) {
-            error_report("%s failed", __func__);
+            error_setg(errp, "Userfault feature detection failed");
             return false;
         }
     }
@@ -317,8 +319,7 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
      * userfault file descriptor
      */
     if (!request_ufd_features(ufd, asked_features)) {
-        error_report("%s failed: features %" PRIu64, __func__,
-                     asked_features);
+        error_setg(errp, "Failed features %" PRIu64, asked_features);
         return false;
     }
 
@@ -329,7 +330,8 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
         have_hp = supported_features & UFFD_FEATURE_MISSING_HUGETLBFS;
 #endif
         if (!have_hp) {
-            error_report("Userfault on this host does not support huge pages");
+            error_setg(errp,
+                       "Userfault on this host does not support huge pages");
             return false;
         }
     }
@@ -338,7 +340,7 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
 
 /* Callback from postcopy_ram_supported_by_host block iterator.
  */
-static int test_ramblock_postcopiable(RAMBlock *rb)
+static int test_ramblock_postcopiable(RAMBlock *rb, Error **errp)
 {
     const char *block_name = qemu_ram_get_idstr(rb);
     ram_addr_t length = qemu_ram_get_used_length(rb);
@@ -346,16 +348,18 @@ static int test_ramblock_postcopiable(RAMBlock *rb)
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
@@ -368,7 +372,7 @@ static int test_ramblock_postcopiable(RAMBlock *rb)
  * normally fine since if the postcopy succeeds it gets turned back on at the
  * end.
  */
-bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
+bool postcopy_ram_supported_by_host(MigrationIncomingState *mis, Error **errp)
 {
     long pagesize = qemu_real_host_page_size();
     int ufd = -1;
@@ -377,29 +381,27 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     struct uffdio_register reg_struct;
     struct uffdio_range range_struct;
     uint64_t feature_mask;
-    Error *local_err = NULL;
     RAMBlock *block;
 
+    ERRP_GUARD();
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
 
@@ -417,7 +419,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
      * affect in reality, or we can revisit.
      */
     RAMBLOCK_FOREACH(block) {
-        if (test_ramblock_postcopiable(block)) {
+        if (test_ramblock_postcopiable(block, errp)) {
             goto out;
         }
     }
@@ -427,7 +429,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
      * it was enabled.
      */
     if (munlockall()) {
-        error_report("%s: munlockall: %s", __func__,  strerror(errno));
+        error_setg(errp, "munlockall() failed: %s", strerror(errno));
         goto out;
     }
 
@@ -439,8 +441,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     testarea = mmap(NULL, pagesize, PROT_READ | PROT_WRITE, MAP_PRIVATE |
                                     MAP_ANONYMOUS, -1, 0);
     if (testarea == MAP_FAILED) {
-        error_report("%s: Failed to map test area: %s", __func__,
-                     strerror(errno));
+        error_setg(errp, "Failed to map test area: %s", strerror(errno));
         goto out;
     }
     g_assert(QEMU_PTR_IS_ALIGNED(testarea, pagesize));
@@ -450,14 +451,14 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
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
 
@@ -465,8 +466,8 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
                    (__u64)1 << _UFFDIO_COPY |
                    (__u64)1 << _UFFDIO_ZEROPAGE;
     if ((reg_struct.ioctls & feature_mask) != feature_mask) {
-        error_report("Missing userfault map features: %" PRIx64,
-                     (uint64_t)(~reg_struct.ioctls & feature_mask));
+        error_setg(errp, "Missing userfault map features: %" PRIx64,
+                   (uint64_t)(~reg_struct.ioctls & feature_mask));
         goto out;
     }
 
@@ -1188,6 +1189,8 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
 
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
+    Error *local_err = NULL;
+
     /* Open the fd for the kernel to give us userfaults */
     mis->userfault_fd = uffd_open(O_CLOEXEC | O_NONBLOCK);
     if (mis->userfault_fd == -1) {
@@ -1200,7 +1203,8 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
      * Although the host check already tested the API, we need to
      * do the check again as an ABI handshake on the new fd.
      */
-    if (!ufd_check_and_apply(mis->userfault_fd, mis)) {
+    if (!ufd_check_and_apply(mis->userfault_fd, mis, &local_err)) {
+        error_report_err(local_err);
         return -1;
     }
 
@@ -1360,7 +1364,7 @@ void fill_destination_postcopy_migration_info(MigrationInfo *info)
 {
 }
 
-bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
+bool postcopy_ram_supported_by_host(MigrationIncomingState *mis, Error **errp)
 {
     error_report("%s: No OS support", __func__);
     return false;
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
index 9671211339..211eff3a8b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1753,7 +1753,8 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
         return -EINVAL;
     }
 
-    if (!postcopy_ram_supported_by_host(mis)) {
+    if (!postcopy_ram_supported_by_host(mis, &local_err)) {
+        error_report_err(local_err);
         postcopy_state_set(POSTCOPY_INCOMING_NONE);
         return -1;
     }
-- 
2.40.0


