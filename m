Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6AFDC473
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 14:11:02 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLR5x-0007xG-4j
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 08:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iLR4x-0007Ab-57
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 08:10:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iLR4v-0002Ul-R4
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 08:09:59 -0400
Received: from relay.sw.ru ([185.231.240.75]:48416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iLR4s-0002Rj-CY; Fri, 18 Oct 2019 08:09:54 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iLR4p-00059I-A0; Fri, 18 Oct 2019 15:09:51 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] blockdev: modify blockdev-change-medium to change
 non-removable device
Date: Fri, 18 Oct 2019 15:09:50 +0300
Message-Id: <20191018120950.26849-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, den@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The modification is useful to workaround exclusive file access restrictions,
e.g. to implement VM migration with shared disk stored on a storage with
the exclusive file opening model: a destination VM is started waiting for
incomming migration with a fake image drive, and later, on the last migration
phase, the fake image file is replaced with the real one.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 blockdev.c           | 69 +++++++++++++++++++++++++++++++-------------
 hmp.c                |  2 ++
 qapi/block-core.json |  7 +++--
 qmp.c                |  3 +-
 4 files changed, 57 insertions(+), 24 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index d358169995..23f3465cfc 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2609,6 +2609,8 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
                                 bool has_format, const char *format,
                                 bool has_read_only,
                                 BlockdevChangeReadOnlyMode read_only,
+                                bool has_medium_name,
+                                const char *medium_name,
                                 Error **errp)
 {
     BlockBackend *blk;
@@ -2667,29 +2669,56 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
         goto fail;
     }
 
-    rc = do_open_tray(has_device ? device : NULL,
-                      has_id ? id : NULL,
-                      false, &err);
-    if (rc && rc != -ENOSYS) {
-        error_propagate(errp, err);
-        goto fail;
-    }
-    error_free(err);
-    err = NULL;
+    if (blk_dev_has_removable_media(blk)) {
+        rc = do_open_tray(has_device ? device : NULL,
+                          has_id ? id : NULL,
+                          false, &err);
+        if (rc && rc != -ENOSYS) {
+            error_propagate(errp, err);
+            goto fail;
+        }
+        error_free(err);
+        err = NULL;
 
-    blockdev_remove_medium(has_device, device, has_id, id, &err);
-    if (err) {
-        error_propagate(errp, err);
-        goto fail;
-    }
+        blockdev_remove_medium(has_device, device, has_id, id, &err);
+        if (err) {
+            error_propagate(errp, err);
+            goto fail;
+        }
 
-    qmp_blockdev_insert_anon_medium(blk, medium_bs, &err);
-    if (err) {
-        error_propagate(errp, err);
-        goto fail;
-    }
+        qmp_blockdev_insert_anon_medium(blk, medium_bs, &err);
+        if (err) {
+            error_propagate(errp, err);
+            goto fail;
+        }
+
+        qmp_blockdev_close_tray(has_device, device, has_id, id, errp);
+    } else {
+        if (!medium_name) {
+            error_setg(errp, "A medium name should be given");
+            goto fail;
+        }
 
-    qmp_blockdev_close_tray(has_device, device, has_id, id, errp);
+        if (runstate_is_running()) {
+            error_setg(errp, "Can't set a medium for non-removable device "
+                    "in a running VM");
+            goto fail;
+        }
+
+        if (strlen(blk_name(blk))) {
+            error_setg(errp, "The device already has a medium");
+            goto fail;
+        }
+
+        if (blk_insert_bs(blk, medium_bs, &err) < 0) {
+            error_propagate(errp, err);
+            goto fail;
+        }
+
+        if (!monitor_add_blk(blk, medium_name, &err)) {
+            error_propagate(errp, err);
+        }
+    }
 
 fail:
     /* If the medium has been inserted, the device has its own reference, so
diff --git a/hmp.c b/hmp.c
index 8eec768088..fc7bac5b4b 100644
--- a/hmp.c
+++ b/hmp.c
@@ -1948,6 +1948,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
     const char *target = qdict_get_str(qdict, "target");
     const char *arg = qdict_get_try_str(qdict, "arg");
     const char *read_only = qdict_get_try_str(qdict, "read-only-mode");
+    const char *target_name = qdict_get_try_str(qdict, "target-name");
     BlockdevChangeReadOnlyMode read_only_mode = 0;
     Error *err = NULL;
 
@@ -1982,6 +1983,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
 
         qmp_blockdev_change_medium(true, device, false, NULL, target,
                                    !!arg, arg, !!read_only, read_only_mode,
+                                   !!target_name, target_name,
                                    &err);
     }
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7ccbfff9d0..f493a7c737 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4769,6 +4769,8 @@
 # @read-only-mode:  change the read-only mode of the device; defaults
 #                   to 'retain'
 #
+# @medium-name:     drive-name when changing the media in non-removable devices
+#                   ignored when changing media in removable devices
 # Since: 2.5
 #
 # Examples:
@@ -4807,9 +4809,8 @@
             '*id': 'str',
             'filename': 'str',
             '*format': 'str',
-            '*read-only-mode': 'BlockdevChangeReadOnlyMode' } }
-
-
+            '*read-only-mode': 'BlockdevChangeReadOnlyMode',
+            '*medium-name': 'str' } }
 ##
 # @BlockErrorAction:
 #
diff --git a/qmp.c b/qmp.c
index b92d62cd5f..c95831a49f 100644
--- a/qmp.c
+++ b/qmp.c
@@ -399,7 +399,8 @@ void qmp_change(const char *device, const char *target,
 #endif
     } else {
         qmp_blockdev_change_medium(true, device, false, NULL, target,
-                                   has_arg, arg, false, 0, errp);
+                                   has_arg, arg, false, 0, false, NULL,
+                                   errp);
     }
 }
 
-- 
2.17.0


