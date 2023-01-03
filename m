Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C365BEB4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:11:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfA8-0005SQ-1L; Tue, 03 Jan 2023 06:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCfA5-0005QD-Tf
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:08:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCfA4-0005En-Bt
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672744131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PreR5Ei6Fw8qP9AzrblH/jDo7Gi98t8fcPxixkCwUo=;
 b=UpWkjTwf2fsfmi5cbfG6dE/pUCnCGoBYvlH3smCM0aD4SnRtV2EZdIMGckdWHjPxYIV4Gk
 kaw0n9UBZhmO1owf2JYti91Gku0ZtgkGX4BkzAmxtb/9YYdhYLB168bHCVh542Er4B4ZPH
 Yl71XLqZd3fRHBzsduQD8HHnW2rjIhc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-iSX3FzyIODiCMXX-eesPow-1; Tue, 03 Jan 2023 06:08:50 -0500
X-MC-Unique: iSX3FzyIODiCMXX-eesPow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E46BC3806713;
 Tue,  3 Jan 2023 11:08:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28658140EBF4;
 Tue,  3 Jan 2023 11:08:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 07/10] qmp: 'add_client' actually expects sockets
Date: Tue,  3 Jan 2023 15:08:11 +0400
Message-Id: <20230103110814.3726795-8-marcandre.lureau@redhat.com>
In-Reply-To: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
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
---
 monitor/qmp-cmds.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 2932b3f3a5..c491eb262b 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -20,6 +20,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/config-file.h"
 #include "qemu/uuid.h"
+#include "qemu/sockets.h"
 #include "chardev/char.h"
 #include "ui/qemu-spice.h"
 #include "ui/console.h"
@@ -248,16 +249,22 @@ void qmp_add_client(const char *protocol, const char *fdname,
         return;
     }
 
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "add_client expects a socket");
+        close(fd);
+        return;
+    }
+
     if (strcmp(protocol, "spice") == 0) {
         if (!qemu_using_spice(errp)) {
-            close(fd);
+            closesocket(fd);
             return;
         }
         skipauth = has_skipauth ? skipauth : false;
         tls = has_tls ? tls : false;
         if (qemu_spice.display_add_client(fd, skipauth, tls) < 0) {
             error_setg(errp, "spice failed to add client");
-            close(fd);
+            closesocket(fd);
         }
         return;
 #ifdef CONFIG_VNC
@@ -269,11 +276,11 @@ void qmp_add_client(const char *protocol, const char *fdname,
 #ifdef CONFIG_DBUS_DISPLAY
     } else if (strcmp(protocol, "@dbus-display") == 0) {
         if (!qemu_using_dbus_display(errp)) {
-            close(fd);
+            closesocket(fd);
             return;
         }
         if (!qemu_dbus_display.add_client(fd, errp)) {
-            close(fd);
+            closesocket(fd);
             return;
         }
         return;
@@ -281,14 +288,14 @@ void qmp_add_client(const char *protocol, const char *fdname,
     } else if ((s = qemu_chr_find(protocol)) != NULL) {
         if (qemu_chr_add_client(s, fd) < 0) {
             error_setg(errp, "failed to add client");
-            close(fd);
+            closesocket(fd);
             return;
         }
         return;
     }
 
     error_setg(errp, "protocol '%s' is invalid", protocol);
-    close(fd);
+    closesocket(fd);
 }
 
 
-- 
2.39.0


