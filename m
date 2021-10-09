Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0968427DAD
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:33:10 +0200 (CEST)
Received: from localhost ([::1]:46676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJxt-0007pL-PV
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJiI-0001uP-Jw
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJiF-0002Zx-0C
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLHfevTD6qhiYwV1WGkhDSKeyYigHT1Xf3PmxuI86dw=;
 b=cfPHJmAxIEZbS6+2VN4APThaOfX6nQMjgDESQ4RO50L3j7IAV0quL/D+DwEVVp0Kbw0uET
 /a4ZrHB95DNGpwpVqcn4PdLOh3lIaMsZlWSMNCt33CsX0Ta00IVgqLQrsTqiumrOwfn9Tl
 Rlg+scQhhhy/Eve0BKAVuUZntR8Av2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-0L01FMRfNWa2wr1E-ydtDA-1; Sat, 09 Oct 2021 17:16:47 -0400
X-MC-Unique: 0L01FMRfNWa2wr1E-ydtDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C131110A8E00
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:16:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 224F85D9D3;
 Sat,  9 Oct 2021 21:16:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/37] chardev: teach socket to accept no addresses
Date: Sun, 10 Oct 2021 01:08:33 +0400
Message-Id: <20211009210838.2219430-33-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
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

The following patches are going to use CharSocket as a base class for
sockets that are created with a given fd (without a given address).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-socket.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 836cfa0bc2..a2b02e021d 100644
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
2.33.0.721.g106298f7f9


