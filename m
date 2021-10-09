Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F31427DB2
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:36:25 +0200 (CEST)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZK12-0004iv-K3
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJiP-0001v0-HL
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJiI-0002a6-Ca
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNGrJgt5MKg3Fp/9lvCSM45JHUBUq+jBn6yHHCz8Fzg=;
 b=LTaeHsZMWAomwtOd4zgzHtFmrsCg/jrrUXH9UOhHpDJioW4jjYCRDIdby0lcP5HyzPKTA+
 chMcU2dM4feUbS4lp9rMiDxyJy7H2AQHH9ycgPtMJSOxRA2HpFxFTHnKjDuD0cHVNM1ey7
 yu3pZqD4119cLH/Pwf3elHYlxhYr8cU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-WyzTCNSWMh-Aw9sgaaCmJA-1; Sat, 09 Oct 2021 17:17:00 -0400
X-MC-Unique: WyzTCNSWMh-Aw9sgaaCmJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D2C2814313
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:16:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAE9610016FF;
 Sat,  9 Oct 2021 21:16:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/37] chardev: make socket derivable
Date: Sun, 10 Oct 2021 01:08:34 +0400
Message-Id: <20211009210838.2219430-34-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/chardev/char-socket.h | 84 +++++++++++++++++++++++++++++++++++
 chardev/char-socket.c         | 58 +-----------------------
 2 files changed, 85 insertions(+), 57 deletions(-)
 create mode 100644 include/chardev/char-socket.h

diff --git a/include/chardev/char-socket.h b/include/chardev/char-socket.h
new file mode 100644
index 0000000000..1a9274f2e3
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
index a2b02e021d..d619088232 100644
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
2.33.0.721.g106298f7f9


