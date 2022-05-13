Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54652690F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:14:17 +0200 (CEST)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZns-0001B2-IK
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiS-0000fM-Ok
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiQ-000708-Su
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652465318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o9fChlsjwtRFsvSIL+alf7xKwV3z5PfCag2L300olU=;
 b=bQbQpEZHjm2h3vIvusGJVLenm4i1SeaGhjdMSHirt1kEKOGTukwn4bZ1y+AESmsfXRH07n
 xwgXv2qy2YnWH6IiKQsCX+jC6Dtf/+kaz0Ky0kMDbZ33vvpwth1NJIsf6fQZ2R4st2cku3
 2aCN739RHn7gSB/xA3P9mEg//cJaCCA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-kpUkhDgnNh252WU0cgOvLA-1; Fri, 13 May 2022 14:08:34 -0400
X-MC-Unique: kpUkhDgnNh252WU0cgOvLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0C6B2919EBE;
 Fri, 13 May 2022 18:08:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2516740D2820;
 Fri, 13 May 2022 18:08:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 04/15] qga: flatten safe_open_or_create()
Date: Fri, 13 May 2022 20:08:10 +0200
Message-Id: <20220513180821.905149-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-1-marcandre.lureau@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

There is a bit too much nesting in the function, this can be simplified
a bit to improve readability.

This also helps with the following error handling changes.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 122 ++++++++++++++++++++++---------------------
 1 file changed, 62 insertions(+), 60 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 69f209af87..15eb7cb77d 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -339,73 +339,75 @@ find_open_flag(const char *mode_str, Error **errp)
 static FILE *
 safe_open_or_create(const char *path, const char *mode, Error **errp)
 {
-    Error *local_err = NULL;
     int oflag;
+    int fd = -1;
+    FILE *f = NULL;
+
+    oflag = find_open_flag(mode, errp);
+    if (oflag < 0) {
+        goto end;
+    }
+
+    /* If the caller wants / allows creation of a new file, we implement it
+     * with a two step process: open() + (open() / fchmod()).
+     *
+     * First we insist on creating the file exclusively as a new file. If
+     * that succeeds, we're free to set any file-mode bits on it. (The
+     * motivation is that we want to set those file-mode bits independently
+     * of the current umask.)
+     *
+     * If the exclusive creation fails because the file already exists
+     * (EEXIST is not possible for any other reason), we just attempt to
+     * open the file, but in this case we won't be allowed to change the
+     * file-mode bits on the preexistent file.
+     *
+     * The pathname should never disappear between the two open()s in
+     * practice. If it happens, then someone very likely tried to race us.
+     * In this case just go ahead and report the ENOENT from the second
+     * open() to the caller.
+     *
+     * If the caller wants to open a preexistent file, then the first
+     * open() is decisive and its third argument is ignored, and the second
+     * open() and the fchmod() are never called.
+     */
+    fd = open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
+    if (fd == -1 && errno == EEXIST) {
+        oflag &= ~(unsigned)O_CREAT;
+        fd = open(path, oflag);
+    }
+    if (fd == -1) {
+        error_setg_errno(errp, errno,
+                         "failed to open file '%s' "
+                         "(mode: '%s')",
+                         path, mode);
+        goto end;
+    }
 
-    oflag = find_open_flag(mode, &local_err);
-    if (local_err == NULL) {
-        int fd;
-
-        /* If the caller wants / allows creation of a new file, we implement it
-         * with a two step process: open() + (open() / fchmod()).
-         *
-         * First we insist on creating the file exclusively as a new file. If
-         * that succeeds, we're free to set any file-mode bits on it. (The
-         * motivation is that we want to set those file-mode bits independently
-         * of the current umask.)
-         *
-         * If the exclusive creation fails because the file already exists
-         * (EEXIST is not possible for any other reason), we just attempt to
-         * open the file, but in this case we won't be allowed to change the
-         * file-mode bits on the preexistent file.
-         *
-         * The pathname should never disappear between the two open()s in
-         * practice. If it happens, then someone very likely tried to race us.
-         * In this case just go ahead and report the ENOENT from the second
-         * open() to the caller.
-         *
-         * If the caller wants to open a preexistent file, then the first
-         * open() is decisive and its third argument is ignored, and the second
-         * open() and the fchmod() are never called.
-         */
-        fd = open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
-        if (fd == -1 && errno == EEXIST) {
-            oflag &= ~(unsigned)O_CREAT;
-            fd = open(path, oflag);
-        }
+    qemu_set_cloexec(fd);
 
-        if (fd == -1) {
-            error_setg_errno(&local_err, errno, "failed to open file '%s' "
-                             "(mode: '%s')", path, mode);
-        } else {
-            qemu_set_cloexec(fd);
+    if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) == -1) {
+        error_setg_errno(errp, errno,
+                         "failed to set permission 0%03o on new file '%s' (mode: '%s')",
+                         (unsigned)DEFAULT_NEW_FILE_MODE, path, mode);
+        goto end;
+    }
 
-            if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) == -1) {
-                error_setg_errno(&local_err, errno, "failed to set permission "
-                                 "0%03o on new file '%s' (mode: '%s')",
-                                 (unsigned)DEFAULT_NEW_FILE_MODE, path, mode);
-            } else {
-                FILE *f;
-
-                f = fdopen(fd, mode);
-                if (f == NULL) {
-                    error_setg_errno(&local_err, errno, "failed to associate "
-                                     "stdio stream with file descriptor %d, "
-                                     "file '%s' (mode: '%s')", fd, path, mode);
-                } else {
-                    return f;
-                }
-            }
+    f = fdopen(fd, mode);
+    if (f == NULL) {
+        error_setg_errno(errp, errno,
+                         "failed to associate stdio stream with file descriptor %d, "
+                         "file '%s' (mode: '%s')",
+                         fd, path, mode);
+    }
 
-            close(fd);
-            if (oflag & O_CREAT) {
-                unlink(path);
-            }
+end:
+    if (f == NULL && fd != -1) {
+        close(fd);
+        if (oflag & O_CREAT) {
+            unlink(path);
         }
     }
-
-    error_propagate(errp, local_err);
-    return NULL;
+    return f;
 }
 
 int64_t qmp_guest_file_open(const char *path, bool has_mode, const char *mode,
-- 
2.36.1


