Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54A1526907
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:11:25 +0200 (CEST)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZl6-0003eu-H9
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiV-0000p8-Nb
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiU-00070Z-5k
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652465321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuAqkUPEiEthZ35kiz/2rgeUeVaqzBg0dF3Oi579Z68=;
 b=Gq10KYCA0dVvErL4pz+ise9C6BSM3XsFfMgE3y+uXnSkQACH34xAZdJa0pN767KxwczREP
 tc89elE0yQWLr4d0uLIxqCKzCjuD779CR5M3IgTS0Aesw2AcUZTMCH4B5p8mLnqij456yP
 2s+uRKj38tjixqOJHlg0OjXV5eQ0FDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-b-llxf2SOS-0jsYVqBYi7Q-1; Fri, 13 May 2022 14:08:38 -0400
X-MC-Unique: b-llxf2SOS-0jsYVqBYi7Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DCD9185A794;
 Fri, 13 May 2022 18:08:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD9A4416369;
 Fri, 13 May 2022 18:08:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 06/15] qga: use qemu_open_cloexec() for
 safe_open_or_create()
Date: Fri, 13 May 2022 20:08:12 +0200
Message-Id: <20220513180821.905149-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-1-marcandre.lureau@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

The function takes care of setting CLOEXEC, and reporting error.

The reported error message will differ, from:
  "failed to open file 'foo' (mode: 'r')"
to:
  "Failed to open file 'foo'"

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 15eb7cb77d..7761458ce1 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -339,6 +339,7 @@ find_open_flag(const char *mode_str, Error **errp)
 static FILE *
 safe_open_or_create(const char *path, const char *mode, Error **errp)
 {
+    ERRP_GUARD();
     int oflag;
     int fd = -1;
     FILE *f = NULL;
@@ -370,21 +371,17 @@ safe_open_or_create(const char *path, const char *mode, Error **errp)
      * open() is decisive and its third argument is ignored, and the second
      * open() and the fchmod() are never called.
      */
-    fd = open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
+    fd = qemu_open_cloexec(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0, errp);
     if (fd == -1 && errno == EEXIST) {
+        error_free(*errp);
+        *errp = NULL;
         oflag &= ~(unsigned)O_CREAT;
-        fd = open(path, oflag);
+        fd = qemu_open_cloexec(path, oflag, 0, errp);
     }
     if (fd == -1) {
-        error_setg_errno(errp, errno,
-                         "failed to open file '%s' "
-                         "(mode: '%s')",
-                         path, mode);
         goto end;
     }
 
-    qemu_set_cloexec(fd);
-
     if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) == -1) {
         error_setg_errno(errp, errno,
                          "failed to set permission 0%03o on new file '%s' (mode: '%s')",
-- 
2.36.1


