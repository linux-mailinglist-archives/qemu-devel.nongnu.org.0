Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B847BB48
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:48:30 +0100 (CET)
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZsr-0001Ru-Jw
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZG0-0002yy-Fu
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:08:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZFy-0002Y0-Q8
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfIbodvuKLf+0Hux9L/KexjKL4WEUJTO8nSSAZV7rLg=;
 b=P75Yv98rmi2knjhmdZSI7odG8Iajaf55HcAa6E9DDDzzwvJMEWWG0sPBI3SvxP18TuIGGI
 3zSNVQFkrUTlnLpEKK4Bt67M1givLOawYNttR+BJmcwGB2Cnb3/x70JVetzZA1KLNJAG4/
 g2gG/dzdGaNoFAK7fhLaoVkD/UXtKTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-9wESNo6ENsCWMovwqpLCtg-1; Tue, 21 Dec 2021 02:08:15 -0500
X-MC-Unique: 9wESNo6ENsCWMovwqpLCtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19FFD1023F54;
 Tue, 21 Dec 2021 07:08:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C96A97A3FB;
 Tue, 21 Dec 2021 07:07:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 32/36] chardev: make socket derivable
Date: Tue, 21 Dec 2021 10:58:51 +0400
Message-Id: <20211221065855.142578-33-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/chardev/char-socket.h | 84 +++++++++++++++++++++++++++++++++++
 chardev/char-socket.c         | 58 +-----------------------
 2 files changed, 85 insertions(+), 57 deletions(-)
 create mode 100644 include/chardev/char-socket.h

diff --git a/include/chardev/char-socket.h b/include/chardev/char-socket.h
new file mode 100644
index 000000000000..1a9274f2e3ac
--- /dev/null
+++ b/include/chardev/char-socket.h
@@ -0,0 +1,84 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef CHAR_SOCKET_H_
+#define CHAR_SOCKET_H_
+
+#include "io/channel-socket.h"
+#include "io/channel-tls.h"
+#include "io/net-listener.h"
+#include "chardev/char.h"
+#include "qom/object.h"
+
+#define TCP_MAX_FDS 16
+
+typedef struct {
+    char buf[21];
+    size_t buflen;
+} TCPChardevTelnetInit;
+
+typedef enum {
+    TCP_CHARDEV_STATE_DISCONNECTED,
+    TCP_CHARDEV_STATE_CONNECTING,
+    TCP_CHARDEV_STATE_CONNECTED,
+} TCPChardevState;
+
+struct SocketChardev {
+    Chardev parent;
+    QIOChannel *ioc; /* Client I/O channel */
+    QIOChannelSocket *sioc; /* Client master channel */
+    QIONetListener *listener;
+    GSource *hup_source;
+    QCryptoTLSCreds *tls_creds;
+    char *tls_authz;
+    TCPChardevState state;
+    int max_size;
+    int do_telnetopt;
+    int do_nodelay;
+    int *read_msgfds;
+    size_t read_msgfds_num;
+    int *write_msgfds;
+    size_t write_msgfds_num;
+    bool registered_yank;
+
+    SocketAddress *addr;
+    bool is_listen;
+    bool is_telnet;
+    bool is_tn3270;
+    GSource *telnet_source;
+    TCPChardevTelnetInit *telnet_init;
+
+    bool is_websock;
+
+    GSource *reconnect_timer;
+    int64_t reconnect_time;
+    bool connect_err_reported;
+
+    QIOTask *connect_task;
+};
+typedef struct SocketChardev SocketChardev;
+
+DECLARE_INSTANCE_CHECKER(SocketChardev, SOCKET_CHARDEV,
+                         TYPE_CHARDEV_SOCKET)
+
+#endif /* CHAR_SOCKET_H_ */
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index a2b02e021d6b..d619088232d3 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -25,9 +25,7 @@
 #include "qemu/osdep.h"
 #include "chardev/char.h"
 #include "io/channel-socket.h"
-#include "io/channel-tls.h"
 #include "io/channel-websock.h"
-#include "io/net-listener.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -37,61 +35,7 @@
 #include "qemu/yank.h"
 
 #include "chardev/char-io.h"
-#include "qom/object.h"
-
-/***********************************************************/
-/* TCP Net console */
-
-#define TCP_MAX_FDS 16
-
-typedef struct {
-    char buf[21];
-    size_t buflen;
-} TCPChardevTelnetInit;
-
-typedef enum {
-    TCP_CHARDEV_STATE_DISCONNECTED,
-    TCP_CHARDEV_STATE_CONNECTING,
-    TCP_CHARDEV_STATE_CONNECTED,
-} TCPChardevState;
-
-struct SocketChardev {
-    Chardev parent;
-    QIOChannel *ioc; /* Client I/O channel */
-    QIOChannelSocket *sioc; /* Client master channel */
-    QIONetListener *listener;
-    GSource *hup_source;
-    QCryptoTLSCreds *tls_creds;
-    char *tls_authz;
-    TCPChardevState state;
-    int max_size;
-    int do_telnetopt;
-    int do_nodelay;
-    int *read_msgfds;
-    size_t read_msgfds_num;
-    int *write_msgfds;
-    size_t write_msgfds_num;
-    bool registered_yank;
-
-    SocketAddress *addr;
-    bool is_listen;
-    bool is_telnet;
-    bool is_tn3270;
-    GSource *telnet_source;
-    TCPChardevTelnetInit *telnet_init;
-
-    bool is_websock;
-
-    GSource *reconnect_timer;
-    int64_t reconnect_time;
-    bool connect_err_reported;
-
-    QIOTask *connect_task;
-};
-typedef struct SocketChardev SocketChardev;
-
-DECLARE_INSTANCE_CHECKER(SocketChardev, SOCKET_CHARDEV,
-                         TYPE_CHARDEV_SOCKET)
+#include "chardev/char-socket.h"
 
 static gboolean socket_reconnect_timeout(gpointer opaque);
 static void tcp_chr_telnet_init(Chardev *chr);
-- 
2.34.1.8.g35151cf07204


