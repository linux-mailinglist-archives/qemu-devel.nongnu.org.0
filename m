Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0913105A4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:13:39 +0100 (CET)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vJC-0005P4-NW
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v36-0001LA-3H
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v34-0001Co-6f
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rbKUK1YACh1m9EOUDxBU6NWCc/WUenP4T8pLkl7ddw=;
 b=NJ4EgvJPVegqj+jdhrAdyAjLVCJHMh/CSAShgujgirvCM5UVNl2H/V5dsnYXWEL4sahA2N
 Tu90ROl+WjIazfLd6Gx+nWwwICdx10Fn4H+/YRxmUNKfWy6wuggJPvuDNHcOqnlBrVmjsV
 tsGnYIFAnoFmrce2ujQ3tqfBG+/VFnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-JkYDlnHxNtmY9-HyLP4_Og-1; Fri, 05 Feb 2021 01:56:55 -0500
X-MC-Unique: JkYDlnHxNtmY9-HyLP4_Og-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D247C1005501
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6395560C5F;
 Fri,  5 Feb 2021 06:56:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE8B51800866; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/24] chardev: check if the chardev is registered for yanking
Date: Fri,  5 Feb 2021 07:56:19 +0100
Message-Id: <20210205065620.1726554-24-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Not all chardevs are created via qmp_chardev_open_socket(), and those
should not call the yank function registration, as this will eventually
assert() not being registered.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-20-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 chardev/char-socket.c | 53 +++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 8a707d766c16..9061981f6d3e 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -417,8 +417,9 @@ static void tcp_chr_free_connection(Chardev *chr)
 
     tcp_set_msgfds(chr, NULL, 0);
     remove_fd_in_watch(chr);
-    if (s->state == TCP_CHARDEV_STATE_CONNECTING
-        || s->state == TCP_CHARDEV_STATE_CONNECTED) {
+    if (s->registered_yank &&
+        (s->state == TCP_CHARDEV_STATE_CONNECTING
+        || s->state == TCP_CHARDEV_STATE_CONNECTED)) {
         yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
                                  yank_generic_iochannel,
                                  QIO_CHANNEL(s->sioc));
@@ -940,9 +941,11 @@ static int tcp_chr_add_client(Chardev *chr, int fd)
     }
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, sioc);
-    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                           yank_generic_iochannel,
-                           QIO_CHANNEL(sioc));
+    if (s->registered_yank) {
+        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                               yank_generic_iochannel,
+                               QIO_CHANNEL(sioc));
+    }
     ret = tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
     return ret;
@@ -957,9 +960,11 @@ static void tcp_chr_accept(QIONetListener *listener,
 
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, cioc);
-    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                           yank_generic_iochannel,
-                           QIO_CHANNEL(cioc));
+    if (s->registered_yank) {
+        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                               yank_generic_iochannel,
+                               QIO_CHANNEL(cioc));
+    }
     tcp_chr_new_client(chr, cioc);
 }
 
@@ -975,9 +980,11 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
         object_unref(OBJECT(sioc));
         return -1;
     }
-    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                           yank_generic_iochannel,
-                           QIO_CHANNEL(sioc));
+    if (s->registered_yank) {
+        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                               yank_generic_iochannel,
+                               QIO_CHANNEL(sioc));
+    }
     tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
     return 0;
@@ -993,9 +1000,11 @@ static void tcp_chr_accept_server_sync(Chardev *chr)
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     sioc = qio_net_listener_wait_client(s->listener);
     tcp_chr_set_client_ioc_name(chr, sioc);
-    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                           yank_generic_iochannel,
-                           QIO_CHANNEL(sioc));
+    if (s->registered_yank) {
+        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                               yank_generic_iochannel,
+                               QIO_CHANNEL(sioc));
+    }
     tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
 }
@@ -1124,9 +1133,11 @@ static void qemu_chr_socket_connected(QIOTask *task, void *opaque)
 
     if (qio_task_propagate_error(task, &err)) {
         tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
-        yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
-                                 yank_generic_iochannel,
-                                 QIO_CHANNEL(sioc));
+        if (s->registered_yank) {
+            yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
+                                     yank_generic_iochannel,
+                                     QIO_CHANNEL(sioc));
+        }
         check_report_connect_error(chr, err);
         goto cleanup;
     }
@@ -1160,9 +1171,11 @@ static void tcp_chr_connect_client_async(Chardev *chr)
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     sioc = qio_channel_socket_new();
     tcp_chr_set_client_ioc_name(chr, sioc);
-    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                           yank_generic_iochannel,
-                           QIO_CHANNEL(sioc));
+    if (s->registered_yank) {
+        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                               yank_generic_iochannel,
+                               QIO_CHANNEL(sioc));
+    }
     /*
      * Normally code would use the qio_channel_socket_connect_async
      * method which uses a QIOTask + qio_task_set_error internally
-- 
2.29.2


