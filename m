Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CA25C557
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 17:28:20 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDr9w-0001eS-25
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 11:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDr4V-0000YI-T3
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:22:43 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60732
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDr4T-000836-95
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:22:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599146560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzs3aUJxV2cZ6h1cobn1/ATKpeDKXdCUHXnxMVc3LTc=;
 b=R72xCMiQMuLDXOHAi0bia/XCiI4f00YA2woea2rohDiDlKwfUZZfJnFtzNl5RPpuVzInx6
 xCUvWxAvydKCsdAb4lcQg2kqyABdZfN682wWq2LzCT3/pmM5ZXK6H7xbqZa5a9V1hSSNOE
 CgmIjWdyY20UMazD2vKXPami5tmfkCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-cwTEiPnbMYyijGal7uzGcA-1; Thu, 03 Sep 2020 11:22:36 -0400
X-MC-Unique: cwTEiPnbMYyijGal7uzGcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30ECC425E9;
 Thu,  3 Sep 2020 15:22:35 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D94162D07D;
 Thu,  3 Sep 2020 15:22:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 8/8] block/file: switch to use qemu_open/qemu_create for
 improved errors
Date: Thu,  3 Sep 2020 16:22:10 +0100
Message-Id: <20200903152210.1917355-9-berrange@redhat.com>
In-Reply-To: <20200903152210.1917355-1-berrange@redhat.com>
References: <20200903152210.1917355-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently at startup if using cache=none on a filesystem lacking
O_DIRECT such as tmpfs, at startup QEMU prints

qemu-system-x86_64: -drive file=/tmp/foo.img,cache=none: file system may not support O_DIRECT
qemu-system-x86_64: -drive file=/tmp/foo.img,cache=none: Could not open '/tmp/foo.img': Invalid argument

while at QMP level the hint is missing, so QEMU reports just

  "error": {
      "class": "GenericError",
      "desc": "Could not open '/tmp/foo.img': Invalid argument"
  }

which is close to useless for the end user trying to figure out what
they did wrong.

With this change at startup QEMU prints

qemu-system-x86_64: -drive file=/tmp/foo.img,cache=none: Unable to open '/tmp/foo.img': filesystem does not support O_DIRECT

while at the QMP level QEMU reports a massively more informative

  "error": {
     "class": "GenericError",
     "desc": "Unable to open '/tmp/foo.img': filesystem does not support O_DIRECT"
  }

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/file-posix.c | 18 +++++++-----------
 block/file-win32.c |  6 ++----
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index bac2566f10..c63926d592 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -630,11 +630,10 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     raw_parse_flags(bdrv_flags, &s->open_flags, false);
 
     s->fd = -1;
-    fd = qemu_open_old(filename, s->open_flags, 0644);
+    fd = qemu_open(filename, s->open_flags, errp);
     ret = fd < 0 ? -errno : 0;
 
     if (ret < 0) {
-        error_setg_file_open(errp, -ret, filename);
         if (ret == -EROFS) {
             ret = -EACCES;
         }
@@ -1032,15 +1031,13 @@ static int raw_reconfigure_getfd(BlockDriverState *bs, int flags,
         }
     }
 
-    /* If we cannot use fcntl, or fcntl failed, fall back to qemu_open_old() */
+    /* If we cannot use fcntl, or fcntl failed, fall back to qemu_open() */
     if (fd == -1) {
         const char *normalized_filename = bs->filename;
         ret = raw_normalize_devicepath(&normalized_filename, errp);
         if (ret >= 0) {
-            assert(!(*open_flags & O_CREAT));
-            fd = qemu_open_old(normalized_filename, *open_flags);
+            fd = qemu_open(normalized_filename, *open_flags, errp);
             if (fd == -1) {
-                error_setg_errno(errp, errno, "Could not reopen file");
                 return -1;
             }
         }
@@ -2411,10 +2408,9 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
     }
 
     /* Create file */
-    fd = qemu_open_old(file_opts->filename, O_RDWR | O_CREAT | O_BINARY, 0644);
+    fd = qemu_create(file_opts->filename, O_RDWR | O_BINARY, 0644, errp);
     if (fd < 0) {
         result = -errno;
-        error_setg_errno(errp, -result, "Could not create file");
         goto out;
     }
 
@@ -3335,7 +3331,7 @@ static bool setup_cdrom(char *bsd_path, Error **errp)
     for (index = 0; index < num_of_test_partitions; index++) {
         snprintf(test_partition, sizeof(test_partition), "%ss%d", bsd_path,
                  index);
-        fd = qemu_open_old(test_partition, O_RDONLY | O_BINARY | O_LARGEFILE);
+        fd = qemu_open(test_partition, O_RDONLY | O_BINARY | O_LARGEFILE, NULL);
         if (fd >= 0) {
             partition_found = true;
             qemu_close(fd);
@@ -3653,7 +3649,7 @@ static int cdrom_probe_device(const char *filename)
     int prio = 0;
     struct stat st;
 
-    fd = qemu_open_old(filename, O_RDONLY | O_NONBLOCK);
+    fd = qemu_open(filename, O_RDONLY | O_NONBLOCK, NULL);
     if (fd < 0) {
         goto out;
     }
@@ -3787,7 +3783,7 @@ static int cdrom_reopen(BlockDriverState *bs)
      */
     if (s->fd >= 0)
         qemu_close(s->fd);
-    fd = qemu_open_old(bs->filename, s->open_flags, 0644);
+    fd = qemu_open(bs->filename, s->open_flags, NULL);
     if (fd < 0) {
         s->fd = -1;
         return -EIO;
diff --git a/block/file-win32.c b/block/file-win32.c
index 8c1845830e..1a31f8a5ba 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -576,11 +576,9 @@ static int raw_co_create(BlockdevCreateOptions *options, Error **errp)
         return -EINVAL;
     }
 
-    fd = qemu_open_old(file_opts->filename,
-                       O_WRONLY | O_CREAT | O_TRUNC | O_BINARY,
-                       0644);
+    fd = qemu_create(file_opts->filename, O_WRONLY | O_TRUNC | O_BINARY,
+                     0644, errp);
     if (fd < 0) {
-        error_setg_errno(errp, errno, "Could not create file");
         return -EIO;
     }
     set_sparse(fd);
-- 
2.26.2


