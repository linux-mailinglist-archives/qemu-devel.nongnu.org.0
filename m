Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6DE47BB41
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:43:33 +0100 (CET)
Received: from localhost ([::1]:54418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZo4-0000by-3v
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:43:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZFg-0002oQ-P7
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:08:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZFe-0002X4-VU
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WB0EunlAyKZDmJ6/3zULe+xmztbtKydoO4wGd40k5FY=;
 b=S/OkJHPeCJ7YeMyRiGYQI5p+sU2SRyRKewHiVhVcLYFCTw+wltsppT0et0/c/DqEpfHGjV
 DJDb0ks2TqI8PS/Uj5P0ec9DLflwta0oaTn3vXD5+DALJRPPFAKTJQHEDbHaCJxBp3fnBz
 J2d70FcPc31Nd424m+iNFT9vvmv1rtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-4-_6HyXyOHG6C3D6sOgm1g-1; Tue, 21 Dec 2021 02:07:55 -0500
X-MC-Unique: 4-_6HyXyOHG6C3D6sOgm1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B68F01006AA5;
 Tue, 21 Dec 2021 07:07:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BBB4105B20B;
 Tue, 21 Dec 2021 07:07:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 31/36] chardev: teach socket to accept no addresses
Date: Tue, 21 Dec 2021 10:58:50 +0400
Message-Id: <20211221065855.142578-32-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
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


