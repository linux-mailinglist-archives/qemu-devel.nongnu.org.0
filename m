Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207F25B2BA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 19:10:50 +0200 (CEST)
Received: from localhost ([::1]:33556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDWHZ-0007PI-Fc
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 13:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDWGI-0005fm-2e
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 13:09:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59070
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDWGD-0001GW-RL
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 13:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599066564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1hha9PIa2FJ8SMNSlMRf79eWh4k+9P2UGtw/inSXNVs=;
 b=OPaxVx8ORm2GyrbySxYk+AsIgDDNXE5VywF4yn1YuzFb9Ztq/JpFGR6dnF/OqW38Y8DhJz
 kVsI7x0dMy6gDcN/ZjLfLIfGPQZCwlRcikT8gSA/x7UNadcjHUjzJ+nKVSWALUlPcX0h0S
 Jgknh2x52xlVH42TV9EBJwW2B8Sc3Yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-2B3aDI1oOxqm3e6S1cIvJg-1; Wed, 02 Sep 2020 13:09:21 -0400
X-MC-Unique: 2B3aDI1oOxqm3e6S1cIvJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 341A5107464D;
 Wed,  2 Sep 2020 17:09:20 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F050819C71;
 Wed,  2 Sep 2020 17:09:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/8] monitor: simplify functions for getting a dup'd fdset
 entry
Date: Wed,  2 Sep 2020 18:09:06 +0100
Message-Id: <20200902170913.1785194-2-berrange@redhat.com>
In-Reply-To: <20200902170913.1785194-1-berrange@redhat.com>
References: <20200902170913.1785194-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:26:30
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
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently code has to call monitor_fdset_get_fd, then dup
the return fd, and then add the duplicate FD back into the
fdset. This dance is overly verbose for the caller and
introduces extra failure modes which can be avoided by
folding all the logic into monitor_fdset_dup_fd_add and
removing monitor_fdset_get_fd entirely.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/monitor/monitor.h |  3 +-
 include/qemu/osdep.h      |  1 +
 monitor/misc.c            | 58 +++++++++++++++++----------------------
 stubs/fdset.c             |  8 ++----
 util/osdep.c              | 19 ++-----------
 5 files changed, 32 insertions(+), 57 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1018d754a6..c0170773d4 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -43,8 +43,7 @@ int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
 AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
                                 bool has_opaque, const char *opaque,
                                 Error **errp);
-int monitor_fdset_get_fd(int64_t fdset_id, int flags);
-int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd);
+int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags);
 void monitor_fdset_dup_fd_remove(int dup_fd);
 int64_t monitor_fdset_dup_fd_find(int dup_fd);
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 412962d91a..66ee5bc45d 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -501,6 +501,7 @@ int qemu_open(const char *name, int flags, ...);
 int qemu_close(int fd);
 int qemu_unlink(const char *name);
 #ifndef _WIN32
+int qemu_dup_flags(int fd, int flags);
 int qemu_dup(int fd);
 #endif
 int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
diff --git a/monitor/misc.c b/monitor/misc.c
index e847b58a8c..98e389e4a8 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1547,69 +1547,61 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
     return fdinfo;
 }
 
-int monitor_fdset_get_fd(int64_t fdset_id, int flags)
+
+int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags)
 {
 #ifdef _WIN32
     return -ENOENT;
 #else
     MonFdset *mon_fdset;
-    MonFdsetFd *mon_fdset_fd;
-    int mon_fd_flags;
-    int ret;
 
     qemu_mutex_lock(&mon_fdsets_lock);
     QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+        MonFdsetFd *mon_fdset_fd;
+        MonFdsetFd *mon_fdset_fd_dup;
+        int fd = -1;
+        int dup_fd;
+        int mon_fd_flags;
+
         if (mon_fdset->id != fdset_id) {
             continue;
         }
+
         QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
             mon_fd_flags = fcntl(mon_fdset_fd->fd, F_GETFL);
             if (mon_fd_flags == -1) {
-                ret = -errno;
-                goto out;
+                qemu_mutex_unlock(&mon_fdsets_lock);
+                return -1;
             }
 
             if ((flags & O_ACCMODE) == (mon_fd_flags & O_ACCMODE)) {
-                ret = mon_fdset_fd->fd;
-                goto out;
+                fd = mon_fdset_fd->fd;
+                break;
             }
         }
-        ret = -EACCES;
-        goto out;
-    }
-    ret = -ENOENT;
 
-out:
-    qemu_mutex_unlock(&mon_fdsets_lock);
-    return ret;
-#endif
-}
-
-int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd)
-{
-    MonFdset *mon_fdset;
-    MonFdsetFd *mon_fdset_fd_dup;
-
-    qemu_mutex_lock(&mon_fdsets_lock);
-    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-        if (mon_fdset->id != fdset_id) {
-            continue;
+        if (fd == -1) {
+            errno = EINVAL;
+            return -1;
         }
-        QLIST_FOREACH(mon_fdset_fd_dup, &mon_fdset->dup_fds, next) {
-            if (mon_fdset_fd_dup->fd == dup_fd) {
-                goto err;
-            }
+
+        dup_fd = qemu_dup_flags(fd, flags);
+        if (dup_fd == -1) {
+            qemu_mutex_unlock(&mon_fdsets_lock);
+            return -1;
         }
+
         mon_fdset_fd_dup = g_malloc0(sizeof(*mon_fdset_fd_dup));
         mon_fdset_fd_dup->fd = dup_fd;
         QLIST_INSERT_HEAD(&mon_fdset->dup_fds, mon_fdset_fd_dup, next);
         qemu_mutex_unlock(&mon_fdsets_lock);
-        return 0;
+        return dup_fd;
     }
 
-err:
     qemu_mutex_unlock(&mon_fdsets_lock);
+    errno = ENOENT;
     return -1;
+#endif
 }
 
 static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
diff --git a/stubs/fdset.c b/stubs/fdset.c
index 67dd5e1d34..56b3663d58 100644
--- a/stubs/fdset.c
+++ b/stubs/fdset.c
@@ -1,8 +1,9 @@
 #include "qemu/osdep.h"
 #include "monitor/monitor.h"
 
-int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd)
+int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags)
 {
+    errno = ENOSYS;
     return -1;
 }
 
@@ -11,11 +12,6 @@ int64_t monitor_fdset_dup_fd_find(int dup_fd)
     return -1;
 }
 
-int monitor_fdset_get_fd(int64_t fdset_id, int flags)
-{
-    return -ENOENT;
-}
-
 void monitor_fdset_dup_fd_remove(int dupfd)
 {
 }
diff --git a/util/osdep.c b/util/osdep.c
index 4829c07ff6..3d94b4d732 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -122,7 +122,7 @@ static int fcntl_op_getlk = -1;
 /*
  * Dups an fd and sets the flags
  */
-static int qemu_dup_flags(int fd, int flags)
+int qemu_dup_flags(int fd, int flags)
 {
     int ret;
     int serrno;
@@ -293,7 +293,7 @@ int qemu_open(const char *name, int flags, ...)
     /* Attempt dup of fd from fd set */
     if (strstart(name, "/dev/fdset/", &fdset_id_str)) {
         int64_t fdset_id;
-        int fd, dupfd;
+        int dupfd;
 
         fdset_id = qemu_parse_fdset(fdset_id_str);
         if (fdset_id == -1) {
@@ -301,24 +301,11 @@ int qemu_open(const char *name, int flags, ...)
             return -1;
         }
 
-        fd = monitor_fdset_get_fd(fdset_id, flags);
-        if (fd < 0) {
-            errno = -fd;
-            return -1;
-        }
-
-        dupfd = qemu_dup_flags(fd, flags);
+        dupfd = monitor_fdset_dup_fd_add(fdset_id, flags);
         if (dupfd == -1) {
             return -1;
         }
 
-        ret = monitor_fdset_dup_fd_add(fdset_id, dupfd);
-        if (ret == -1) {
-            close(dupfd);
-            errno = EINVAL;
-            return -1;
-        }
-
         return dupfd;
     }
 #endif
-- 
2.26.2


