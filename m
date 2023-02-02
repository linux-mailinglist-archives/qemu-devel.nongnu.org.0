Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AE16883BC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNc8M-0000nn-GS; Thu, 02 Feb 2023 11:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc8G-0000Ti-HN
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:08:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc8D-0005Ej-GP
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675354092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6xgzsWlUhmuOPM7TIr+7bMZ5VQ/A7gez5YeTOVRjsI=;
 b=I9mImTkM9ZgByTvvesYsdLEmroyypAgygdY+7sLqlKdVCBoV4EOetOJyhz6XDF9yQJJbOk
 0SFKG8reLp/6xbB6cTlBF/C3pFOqGgLW4wQCk6EGDf7/RjIJCTyhJ+zP/7V2NRFM8ZlYIP
 6dpc9x0LJCaSQlOcsObrMNGEqTgeXCM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-ob9HKgVtMmq5LDho8FBvJA-1; Thu, 02 Feb 2023 11:07:32 -0500
X-MC-Unique: ob9HKgVtMmq5LDho8FBvJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D9743847987;
 Thu,  2 Feb 2023 16:07:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 457C951E5;
 Thu,  2 Feb 2023 16:07:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Peter Xu <peterx@redhat.com>
Subject: [PULL 06/26] util/userfaultfd: Add uffd_open()
Date: Thu,  2 Feb 2023 17:06:20 +0100
Message-Id: <20230202160640.2300-7-quintela@redhat.com>
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com>
References: <20230202160640.2300-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a helper to create the uffd handle.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/qemu/userfaultfd.h   |  8 ++++++++
 migration/postcopy-ram.c     | 11 +++++------
 tests/qtest/migration-test.c |  3 ++-
 util/userfaultfd.c           | 13 +++++++++++--
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
index 6b74f92792..2101115f70 100644
--- a/include/qemu/userfaultfd.h
+++ b/include/qemu/userfaultfd.h
@@ -17,6 +17,14 @@
 #include "exec/hwaddr.h"
 #include <linux/userfaultfd.h>
 
+/**
+ * uffd_open(): Open an userfaultfd handle for current context.
+ *
+ * @flags: The flags we want to pass in when creating the handle.
+ *
+ * Returns: the uffd handle if >=0, or <0 if error happens.
+ */
+int uffd_open(int flags);
 int uffd_query_features(uint64_t *features);
 int uffd_create_fd(uint64_t features, bool non_blocking);
 void uffd_close_fd(int uffd_fd);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..0c55df0e52 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -37,6 +37,7 @@
 #include "qemu-file.h"
 #include "yank_functions.h"
 #include "tls.h"
+#include "qemu/userfaultfd.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -226,11 +227,9 @@ static bool receive_ufd_features(uint64_t *features)
     int ufd;
     bool ret = true;
 
-    /* if we are here __NR_userfaultfd should exists */
-    ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    ufd = uffd_open(O_CLOEXEC);
     if (ufd == -1) {
-        error_report("%s: syscall __NR_userfaultfd failed: %s", __func__,
-                     strerror(errno));
+        error_report("%s: uffd_open() failed: %s", __func__, strerror(errno));
         return false;
     }
 
@@ -375,7 +374,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
         goto out;
     }
 
-    ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    ufd = uffd_open(O_CLOEXEC);
     if (ufd == -1) {
         error_report("%s: userfaultfd not available: %s", __func__,
                      strerror(errno));
@@ -1160,7 +1159,7 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     /* Open the fd for the kernel to give us userfaults */
-    mis->userfault_fd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+    mis->userfault_fd = uffd_open(O_CLOEXEC | O_NONBLOCK);
     if (mis->userfault_fd == -1) {
         error_report("%s: Failed to open userfault fd: %s", __func__,
                      strerror(errno));
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1dd32c9506..7a5d1922dd 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -62,13 +62,14 @@ static bool uffd_feature_thread_id;
 #include <sys/eventfd.h>
 #include <sys/ioctl.h>
 #include <linux/userfaultfd.h>
+#include "qemu/userfaultfd.h"
 
 static bool ufd_version_check(void)
 {
     struct uffdio_api api_struct;
     uint64_t ioctl_mask;
 
-    int ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    int ufd = uffd_open(O_CLOEXEC);
 
     if (ufd == -1) {
         g_test_message("Skipping test: userfaultfd not available");
diff --git a/util/userfaultfd.c b/util/userfaultfd.c
index f1cd6af2b1..4953b3137d 100644
--- a/util/userfaultfd.c
+++ b/util/userfaultfd.c
@@ -19,6 +19,15 @@
 #include <sys/syscall.h>
 #include <sys/ioctl.h>
 
+int uffd_open(int flags)
+{
+#if defined(__NR_userfaultfd)
+    return syscall(__NR_userfaultfd, flags);
+#else
+    return -EINVAL;
+#endif
+}
+
 /**
  * uffd_query_features: query UFFD features
  *
@@ -32,7 +41,7 @@ int uffd_query_features(uint64_t *features)
     struct uffdio_api api_struct = { 0 };
     int ret = -1;
 
-    uffd_fd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    uffd_fd = uffd_open(O_CLOEXEC);
     if (uffd_fd < 0) {
         trace_uffd_query_features_nosys(errno);
         return -1;
@@ -69,7 +78,7 @@ int uffd_create_fd(uint64_t features, bool non_blocking)
     uint64_t ioctl_mask = BIT(_UFFDIO_REGISTER) | BIT(_UFFDIO_UNREGISTER);
 
     flags = O_CLOEXEC | (non_blocking ? O_NONBLOCK : 0);
-    uffd_fd = syscall(__NR_userfaultfd, flags);
+    uffd_fd = uffd_open(flags);
     if (uffd_fd < 0) {
         trace_uffd_create_fd_nosys(errno);
         return -1;
-- 
2.39.1


