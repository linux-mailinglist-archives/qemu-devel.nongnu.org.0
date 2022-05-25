Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5B533FB3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:58:51 +0200 (CEST)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsTK-0001Z8-Tj
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntsGl-00039a-MG
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntsDA-00067r-4G
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653489727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+wrMyYVWWFGnPXi/rJyzvNkUQBqAEAKXc6ego1U/n4=;
 b=Irc4oxsaA44LxJRWYwU5Kye+JmqVqQ5dgbxNKJeawZAtdfZ39S01GxZ42TUdWbCapeSQMJ
 nq0cDETzUQTEqlom8scIik0guHv6mDf0DddPziHeR7gO8Y1FIvrr/ZizKyVJt5rDymmcV4
 W4AnnX2tvXyF+n8+FPfFqBaWb3lvn/Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-T9617xrSPjKWyQQ38uq01g-1; Wed, 25 May 2022 10:41:56 -0400
X-MC-Unique: T9617xrSPjKWyQQ38uq01g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C81480418B
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 14:41:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1940582872;
 Wed, 25 May 2022 14:41:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v5 09/15] qga: make build_fs_mount_list() return a bool
Date: Wed, 25 May 2022 16:41:34 +0200
Message-Id: <20220525144140.591926-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220525144140.591926-1-marcandre.lureau@redhat.com>
References: <20220525144140.591926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Change build_fs_mount_list() to return bool, in accordance
with the guidance under = Rules = in include/qapi/error.h

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Suggested-by: Markus Armbruster <armbru@redhat.com>
---
 qga/commands-posix.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ff2d21d394..af93faae97 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -673,7 +673,7 @@ static int dev_major_minor(const char *devpath,
 /*
  * Walk the mount table and build a list of local file systems
  */
-static void build_fs_mount_list_from_mtab(FsMountList *mounts, Error **errp)
+static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error **errp)
 {
     struct mntent *ment;
     FsMount *mount;
@@ -684,7 +684,7 @@ static void build_fs_mount_list_from_mtab(FsMountList *mounts, Error **errp)
     fp = setmntent(mtab, "r");
     if (!fp) {
         error_setg(errp, "failed to open mtab file: '%s'", mtab);
-        return;
+        return false;
     }
 
     while ((ment = getmntent(fp))) {
@@ -714,6 +714,7 @@ static void build_fs_mount_list_from_mtab(FsMountList *mounts, Error **errp)
     }
 
     endmntent(fp);
+    return true;
 }
 
 static void decode_mntname(char *name, int len)
@@ -738,7 +739,7 @@ static void decode_mntname(char *name, int len)
     }
 }
 
-static void build_fs_mount_list(FsMountList *mounts, Error **errp)
+static bool build_fs_mount_list(FsMountList *mounts, Error **errp)
 {
     FsMount *mount;
     char const *mountinfo = "/proc/self/mountinfo";
@@ -751,8 +752,7 @@ static void build_fs_mount_list(FsMountList *mounts, Error **errp)
 
     fp = fopen(mountinfo, "r");
     if (!fp) {
-        build_fs_mount_list_from_mtab(mounts, errp);
-        return;
+        return build_fs_mount_list_from_mtab(mounts, errp);
     }
 
     while (getline(&line, &n, fp) != -1) {
@@ -794,6 +794,7 @@ static void build_fs_mount_list(FsMountList *mounts, Error **errp)
     free(line);
 
     fclose(fp);
+    return true;
 }
 #endif
 
@@ -1592,8 +1593,7 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
     Error *local_err = NULL;
 
     QTAILQ_INIT(&mounts);
-    build_fs_mount_list(&mounts, &local_err);
-    if (local_err) {
+    if (!build_fs_mount_list(&mounts, &local_err)) {
         error_propagate(errp, local_err);
         return NULL;
     }
@@ -1716,8 +1716,7 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
     }
 
     QTAILQ_INIT(&mounts);
-    build_fs_mount_list(&mounts, &local_err);
-    if (local_err) {
+    if (!build_fs_mount_list(&mounts, &local_err)) {
         error_propagate(errp, local_err);
         return -1;
     }
@@ -1798,8 +1797,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **errp)
     Error *local_err = NULL;
 
     QTAILQ_INIT(&mounts);
-    build_fs_mount_list(&mounts, &local_err);
-    if (local_err) {
+    if (!build_fs_mount_list(&mounts, &local_err)) {
         error_propagate(errp, local_err);
         return 0;
     }
@@ -1872,15 +1870,12 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
     FsMountList mounts;
     struct FsMount *mount;
     int fd;
-    Error *local_err = NULL;
     struct fstrim_range r;
 
     slog("guest-fstrim called");
 
     QTAILQ_INIT(&mounts);
-    build_fs_mount_list(&mounts, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!build_fs_mount_list(&mounts, errp)) {
         return NULL;
     }
 
-- 
2.36.1


