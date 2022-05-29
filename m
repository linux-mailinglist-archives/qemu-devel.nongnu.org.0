Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F205372DD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 00:55:26 +0200 (CEST)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvRoj-0000yI-Dj
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 18:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nvRlJ-0006gl-1N
 for qemu-devel@nongnu.org; Sun, 29 May 2022 18:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nvRlH-0002AM-IX
 for qemu-devel@nongnu.org; Sun, 29 May 2022 18:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653864711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AoC3af8qVDab0GoHo/bFL4H4GUuWAWqp9w2CRC6bztY=;
 b=gIobO0mR4SvsBszlqC8ISDiWy3xXhpg0m55EbSJ662Xwli1C+SOV0Q5WLSMDFqvTJbi8a3
 ppkxsGlJ7dE0mzg4zuHrYenvny+dv/QVN31kmBkoDBQeC1FI6ejogE3f1GyN56Dxlsh8F6
 iknm/Zod0J1dy2iIm0vldABPE/U/4Xs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-zRdVT4dePqmLTAnQlqahjw-1; Sun, 29 May 2022 18:51:47 -0400
X-MC-Unique: zRdVT4dePqmLTAnQlqahjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 728F129AA3BC;
 Sun, 29 May 2022 22:51:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 143991121314;
 Sun, 29 May 2022 22:51:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL v2 06/15] qga: use qga_open_cloexec() for safe_open_or_create()
Date: Mon, 30 May 2022 00:51:28 +0200
Message-Id: <20220529225137.232359-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220529225137.232359-1-marcandre.lureau@redhat.com>
References: <20220529225137.232359-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

The function takes care of setting CLOEXEC.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220525144140.591926-7-marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 3b2392398e..2ecc43eca9 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -27,6 +27,7 @@
 #include "qemu/cutils.h"
 #include "commands-common.h"
 #include "block/nvme.h"
+#include "cutils.h"
 
 #ifdef HAVE_UTMPX
 #include <utmpx.h>
@@ -370,10 +371,10 @@ safe_open_or_create(const char *path, const char *mode, Error **errp)
      * open() is decisive and its third argument is ignored, and the second
      * open() and the fchmod() are never called.
      */
-    fd = open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
+    fd = qga_open_cloexec(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
     if (fd == -1 && errno == EEXIST) {
         oflag &= ~(unsigned)O_CREAT;
-        fd = open(path, oflag);
+        fd = qga_open_cloexec(path, oflag, 0);
     }
     if (fd == -1) {
         error_setg_errno(errp, errno,
@@ -382,8 +383,6 @@ safe_open_or_create(const char *path, const char *mode, Error **errp)
         goto end;
     }
 
-    qemu_set_cloexec(fd);
-
     if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) == -1) {
         error_setg_errno(errp, errno, "failed to set permission "
                          "0%03o on new file '%s' (mode: '%s')",
-- 
2.36.1


