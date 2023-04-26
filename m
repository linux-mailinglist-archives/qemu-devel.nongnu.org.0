Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D639F6EEBD3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 03:15:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTkn-0002Wv-QT; Tue, 25 Apr 2023 21:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prTkk-0002Vv-NH
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 21:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prTki-0004t9-Lq
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 21:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682471723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=v3+4iPKUfwtVRVMSQ6WYaOP/gPedpOYcn0mV28WpLUQ=;
 b=aNWJB1kC3VEkrCN0EyRzclxsWJ2kf0YhMil4f7axIQbGJC1pfPP+XoSKdlK/eR+abDMDGn
 0nhZU8mdwHw/Hni+ud0kRND76t7umxb72xXI0q6XR1Ygn53chLDZ/NNfoXR7IPQeO6lFOH
 ionNcvYg2GZN0cYF4n1oaI5Fj5EbDbc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-C7h7TUdQPRCnStjUdb5z-g-1; Tue, 25 Apr 2023 21:15:19 -0400
X-MC-Unique: C7h7TUdQPRCnStjUdb5z-g-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so18949021cf.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 18:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682471717; x=1685063717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v3+4iPKUfwtVRVMSQ6WYaOP/gPedpOYcn0mV28WpLUQ=;
 b=SPFTJImivGA8zp4+wZoKVzaQyv1yOksKob03/Bj8m3MN5PtjEWsDTP+abW6zj+fSv6
 4NRDtIYWffb7t8gRNMLRn3sXG+DBjOTThLZpeMMsDCtA+NjjcaTmLKXVgES9b7pBq5kA
 +I92tWcib3rOhNerF8UJ54MKGIdhHDXWK7WqdU88u15Yp4BnjoDk9RCwqGIjoigIwj90
 4mRZOrzHWLGvqE6z7V7c15FSbQMAhB0xCHquFqFXR4fTabac0gRwXoGQHOa7WimABuOZ
 VykDY8xN8b5oWfsn8YJCaaX4ebZ82AWRKbo61j5CpxzTY+AdvJEc8NBQknvrs7dVMIKi
 CGsA==
X-Gm-Message-State: AAQBX9f9i8YyHMatiTctavIG64MMNDj1xs0UIj2cvqKs+HlZenMhINl4
 9XYo3160s3QT1OBrj7JcoklbvRzqxeUhhakTLFI1GbsndwAbcely8A/bdJfzTEWWMQP5d00/b1u
 kNtMUReVS+YLmxtqT2vG2U8EiqfE3qeJ1VtdM8sQUERh5/372ebjn7f/uCm/34Jw+jI30z/eg
X-Received: by 2002:ac8:7f4a:0:b0:3ef:4a7c:d7c5 with SMTP id
 g10-20020ac87f4a000000b003ef4a7cd7c5mr7238449qtk.4.1682471717230; 
 Tue, 25 Apr 2023 18:15:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z3zf9UZUdM48lkfZb5MOiQX/nijD98WskVoQOpn7a+6lwQhilN/U8t2vsGNFcTC8ajuHimYg==
X-Received: by 2002:ac8:7f4a:0:b0:3ef:4a7c:d7c5 with SMTP id
 g10-20020ac87f4a000000b003ef4a7cd7c5mr7238408qtk.4.1682471716843; 
 Tue, 25 Apr 2023 18:15:16 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 fp3-20020a05622a508300b003ef239e3d5csm4874074qtb.17.2023.04.25.18.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 18:15:16 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peterx@redhat.com
Subject: [PATCH v3] migration: Allow postcopy_ram_supported_by_host() to
 report err
Date: Tue, 25 Apr 2023 21:15:14 -0400
Message-Id: <20230426011514.1972344-1-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
 migration/options.c      |  8 ++----
 migration/postcopy-ram.c | 59 ++++++++++++++++++++++------------------
 migration/postcopy-ram.h |  3 +-
 migration/savevm.c       |  3 +-
 4 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 8e8753d9be..4026b5e126 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -285,6 +285,7 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
+    ERRP_GUARD();
 #ifndef CONFIG_LIVE_BLOCK_MIGRATION
     if (new_caps[MIGRATION_CAPABILITY_BLOCK]) {
         error_setg(errp, "QEMU compiled without old-style (blk/-b, inc/-i) "
@@ -310,11 +311,8 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
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
index 0711500036..7c280480c2 100644
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
@@ -368,7 +372,8 @@ static int test_ramblock_postcopiable(RAMBlock *rb)
  * normally fine since if the postcopy succeeds it gets turned back on at the
  * end.
  */
-bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
+bool postcopy_ram_supported_by_host(MigrationIncomingState *mis,
+                                    Error **errp)
 {
     long pagesize = qemu_real_host_page_size();
     int ufd = -1;
@@ -377,29 +382,27 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
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
 
@@ -417,7 +420,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
      * affect in reality, or we can revisit.
      */
     RAMBLOCK_FOREACH(block) {
-        if (test_ramblock_postcopiable(block)) {
+        if (test_ramblock_postcopiable(block, errp)) {
             goto out;
         }
     }
@@ -427,7 +430,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
      * it was enabled.
      */
     if (munlockall()) {
-        error_report("%s: munlockall: %s", __func__,  strerror(errno));
+        error_setg(errp, "munlockall() failed: %s", strerror(errno));
         goto out;
     }
 
@@ -439,8 +442,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     testarea = mmap(NULL, pagesize, PROT_READ | PROT_WRITE, MAP_PRIVATE |
                                     MAP_ANONYMOUS, -1, 0);
     if (testarea == MAP_FAILED) {
-        error_report("%s: Failed to map test area: %s", __func__,
-                     strerror(errno));
+        error_setg(errp, "Failed to map test area: %s", strerror(errno));
         goto out;
     }
     g_assert(QEMU_PTR_IS_ALIGNED(testarea, pagesize));
@@ -450,14 +452,14 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
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
 
@@ -465,8 +467,8 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
                    (__u64)1 << _UFFDIO_COPY |
                    (__u64)1 << _UFFDIO_ZEROPAGE;
     if ((reg_struct.ioctls & feature_mask) != feature_mask) {
-        error_report("Missing userfault map features: %" PRIx64,
-                     (uint64_t)(~reg_struct.ioctls & feature_mask));
+        error_setg(errp, "Missing userfault map features: %" PRIx64,
+                   (uint64_t)(~reg_struct.ioctls & feature_mask));
         goto out;
     }
 
@@ -1188,6 +1190,8 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
 
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
+    Error *local_err = NULL;
+
     /* Open the fd for the kernel to give us userfaults */
     mis->userfault_fd = uffd_open(O_CLOEXEC | O_NONBLOCK);
     if (mis->userfault_fd == -1) {
@@ -1200,7 +1204,8 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
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
2.39.1


