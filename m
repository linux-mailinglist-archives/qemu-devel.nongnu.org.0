Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D634851AB6A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:44:40 +0200 (CEST)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmJ3H-0007ba-O0
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqq-0007IT-4t
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqn-0003o9-U7
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4vSwJHWmFQECwx+oJjGuP7qDO2O/SFfCD8FinkaMz8=;
 b=AudSPCI6LkuourumDYod4loIvfpLbW0jEbDfGZ6sIVVmyBACTZiR8PYEHzL9RyEx/7T7l/
 rSm3/P400df384APwx51h5orE+zEmV9bohMCFepR+NZ1InrFlmg3UL5t7Y4yJnt4Xq85zB
 I1HW+BmUwRMymLubHnAY+J1Jg4afRto=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-bOwFLYWXPzex3J0dspsGjA-1; Wed, 04 May 2022 13:31:43 -0400
X-MC-Unique: bOwFLYWXPzex3J0dspsGjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C12B786B8AB;
 Wed,  4 May 2022 17:31:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3734156A4EA;
 Wed,  4 May 2022 17:31:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 09/16] qga: use qemu_open_cloexec() for safe_open_or_create()
Date: Wed,  4 May 2022 21:30:18 +0400
Message-Id: <20220504173025.650167-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220504173025.650167-1-marcandre.lureau@redhat.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index 98d481a58485..974bcbee7e97 100644
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
                          "failed to set permission "
-- 
2.36.0.44.g0f828332d5ac


