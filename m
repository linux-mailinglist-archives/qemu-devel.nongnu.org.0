Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543CD478F56
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:17:23 +0100 (CET)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEz4-0000wv-Df
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:17:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myETW-0006GF-4v
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:44:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myETQ-0002fw-0V
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WB0EunlAyKZDmJ6/3zULe+xmztbtKydoO4wGd40k5FY=;
 b=B/NEqptA8Xflm7za74zqX7BY77og8exeTkwKz3IAPgXXfBUySxJZC0I4KHv5fm2DdynTXc
 /prAt1BpS46kHeXc9QTTD8CbPV9qB9a9j1+GYqUp3Z5k7aGTVWluu6sgufKwiT9eMcL3C3
 E18z5+Lzfd3lBA1YH3XaYQAWQ6pIWjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-9ThX6ZZJO9eGpeYZK5ZDqg-1; Fri, 17 Dec 2021 09:44:33 -0500
X-MC-Unique: 9ThX6ZZJO9eGpeYZK5ZDqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C525A10151E1;
 Fri, 17 Dec 2021 14:44:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AEEF45D8D;
 Fri, 17 Dec 2021 14:44:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 31/36] chardev: teach socket to accept no addresses
Date: Fri, 17 Dec 2021 18:37:51 +0400
Message-Id: <20211217143756.1831099-32-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following patches are going to use CharSocket as a base class for
sockets that are created with a given fd (without a given address).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 chardev/char-socket.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 836cfa0bc21b..a2b02e021d6b 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1248,6 +1248,10 @@ static int qmp_chardev_open_socket_server(Chardev *chr,
     qio_net_listener_set_name(s->listener, name);
     g_free(name);
 
+    if (s->addr->type == SOCKET_ADDRESS_TYPE_FD && !*s->addr->u.fd.str) {
+        goto skip_listen;
+    }
+
     if (qio_net_listener_open_sync(s->listener, s->addr, 1, errp) < 0) {
         object_unref(OBJECT(s->listener));
         s->listener = NULL;
@@ -1256,6 +1260,8 @@ static int qmp_chardev_open_socket_server(Chardev *chr,
 
     qapi_free_SocketAddress(s->addr);
     s->addr = socket_local_address(s->listener->sioc[0]->fd, errp);
+
+skip_listen:
     update_disconnected_filename(s);
 
     if (is_waitconnect) {
@@ -1466,9 +1472,9 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     SocketAddressLegacy *addr;
     ChardevSocket *sock;
 
-    if ((!!path + !!fd + !!host) != 1) {
+    if ((!!path + !!fd + !!host) > 1) {
         error_setg(errp,
-                   "Exactly one of 'path', 'fd' or 'host' required");
+                   "None or one of 'path', 'fd' or 'host' option required.");
         return;
     }
 
@@ -1542,12 +1548,10 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
             .has_ipv6 = qemu_opt_get(opts, "ipv6"),
             .ipv6 = qemu_opt_get_bool(opts, "ipv6", 0),
         };
-    } else if (fd) {
+    } else {
         addr->type = SOCKET_ADDRESS_TYPE_FD;
         addr->u.fd.data = g_new(String, 1);
         addr->u.fd.data->str = g_strdup(fd);
-    } else {
-        g_assert_not_reached();
     }
     sock->addr = addr;
 }
-- 
2.34.1.8.g35151cf07204


