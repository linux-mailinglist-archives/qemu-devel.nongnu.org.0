Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53C51BA28
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:20:47 +0200 (CEST)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWj6-0003Av-Eo
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWeX-0006oj-70
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:01 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:48029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWeV-0007ur-Nk
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzLfXaSZU74ozme9WubVrM5Ht+PC6ZsnOZ+umHLbX6U=;
 b=XEyIpqEAMb+mbBJMimLloXYk9fH0JomdH18AJh1231cfxh5D6PENFlkRV1YEyBONDJE2+p
 ZQz5AMnCr8dXnhQKTHNpgz+yRmIBn/6ywahqkAI5WnaCcJYvvmjuy2bI0Ay3xKJJHjBdR2
 o6iH6B7KbiY0oqLgaRgI2HW6xBSpwkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-V-vzBnFGODWnK642T6hO9g-1; Thu, 05 May 2022 04:15:56 -0400
X-MC-Unique: V-vzBnFGODWnK642T6hO9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ED50857AA8;
 Thu,  5 May 2022 08:15:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39C3740CF900;
 Thu,  5 May 2022 08:15:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 07/15] qga: use qemu_open_cloexec() for
 safe_open_or_create()
Date: Thu,  5 May 2022 12:14:23 +0400
Message-Id: <20220505081431.934739-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-1-marcandre.lureau@redhat.com>
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 0ef049650e31..8ebc327c5e02 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -370,21 +370,16 @@ safe_open_or_create(const char *path, const char *mode, Error **errp)
      * open() is decisive and its third argument is ignored, and the second
      * open() and the fchmod() are never called.
      */
-    fd = open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
+    fd = qemu_open_cloexec(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0, errp);
     if (fd == -1 && errno == EEXIST) {
+        g_clear_pointer(errp, error_free);
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
2.36.0.44.g0f828332d5ac


