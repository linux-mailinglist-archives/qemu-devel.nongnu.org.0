Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA36800CB
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 19:26:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMCMI-0004ij-J1; Sun, 29 Jan 2023 13:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMCMG-0004i7-8Y
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 13:24:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMCME-0005zp-Qy
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 13:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675016690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apJdQ+o1YhG8ScRQIxIghn17nASfmTDA/hRxwYhs2Rg=;
 b=ZeLK2Eh7lvhNZRu2YMCegXaTbbedLJ8NrniWfCTXXprwDFqYe80cHP858pXhn4DPQaU2sl
 PzoBsJgyBVgZWAtaU9La1NpYYn2ZGWITs5xFHzjnT1+wX1VHsgGCmmiiTJ6+Qh2G3aoUdO
 jRkb0ek7XzyeMZfKcaEerDLOzXIEJRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-thKjvrAyOjuFjajCsx9KlA-1; Sun, 29 Jan 2023 13:24:47 -0500
X-MC-Unique: thKjvrAyOjuFjajCsx9KlA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C70285A588;
 Sun, 29 Jan 2023 18:24:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31CF8492B06;
 Sun, 29 Jan 2023 18:24:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 5/9] qmp: 'add_client' actually expects sockets
Date: Sun, 29 Jan 2023 22:24:10 +0400
Message-Id: <20230129182414.583349-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230129182414.583349-1-marcandre.lureau@redhat.com>
References: <20230129182414.583349-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Whether it is SPICE, VNC, D-Bus, or the socket chardev, they all
actually expect a socket kind or will fail in different ways at runtime.

Throw an error early if the given 'add_client' fd is not a socket, and
close it to avoid leaks.

This allows to replace the close() call with a more correct & portable
closesocket() version.

(this will allow importing sockets on Windows with a specialized command
in the following patch, while keeping the remaining monitor associated
sockets/add_client code & usage untouched)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 monitor/qmp-cmds.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index bf22a8c5a6..01cfc23407 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -22,6 +22,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/config-file.h"
 #include "qemu/uuid.h"
+#include "qemu/sockets.h"
 #include "chardev/char.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
@@ -190,11 +191,17 @@ void qmp_add_client(const char *protocol, const char *fdname,
         return;
     }
 
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "add_client expects a socket");
+        close(fd);
+        return;
+    }
+
     for (i = 0; i < ARRAY_SIZE(protocol_table); i++) {
         if (!strcmp(protocol, protocol_table[i].name)) {
             if (!protocol_table[i].add_client(fd, has_skipauth, skipauth,
                                               has_tls, tls, errp)) {
-                close(fd);
+                closesocket(fd);
             }
             return;
         }
@@ -203,12 +210,12 @@ void qmp_add_client(const char *protocol, const char *fdname,
     s = qemu_chr_find(protocol);
     if (!s) {
         error_setg(errp, "protocol '%s' is invalid", protocol);
-        close(fd);
+        closesocket(fd);
         return;
     }
     if (qemu_chr_add_client(s, fd) < 0) {
         error_setg(errp, "failed to add client");
-        close(fd);
+        closesocket(fd);
         return;
     }
 }
-- 
2.39.1


