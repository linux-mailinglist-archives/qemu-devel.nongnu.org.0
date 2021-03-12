Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992C73388C9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:37:38 +0100 (CET)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeEj-0003F3-M0
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0P-0000Rs-VX
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:49 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0O-0004Db-Fd
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:49 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Doy5YkP-PnWhZpa0K8BhAw-1; Fri, 12 Mar 2021 04:22:46 -0500
X-MC-Unique: Doy5YkP-PnWhZpa0K8BhAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE85107ACCA;
 Fri, 12 Mar 2021 09:22:44 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6CF60C9B;
 Fri, 12 Mar 2021 09:22:43 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] vhost-user: Monitor slave channel in vhost_user_read()
Date: Fri, 12 Mar 2021 10:22:11 +0100
Message-Id: <20210312092212.782255-7-groug@kaod.org>
In-Reply-To: <20210312092212.782255-1-groug@kaod.org>
References: <20210312092212.782255-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that everything is in place, have the nested event loop to monitor
the slave channel. The source in the main event loop is destroyed and
recreated to ensure any pending even for the slave channel that was
previously detected is purged. This guarantees that the main loop
wont invoke slave_read() based on an event that was already handled
by the nested loop.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: - also monitor G_IO_HUP (Stefan)
    - refactored the code a bit
---
 hw/virtio/vhost-user.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 00256fa318a6..ded0c1045309 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -345,6 +345,35 @@ end:
     return G_SOURCE_REMOVE;
 }
=20
+static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
+                           gpointer opaque);
+
+/*
+ * This updates the read handler to use a new event loop context.
+ * Event sources are removed from the previous context : this ensures
+ * that events detected in the previous context are purged. They will
+ * be re-detected and processed in the new context.
+ */
+static void slave_update_read_handler(struct vhost_dev *dev,
+                                      GMainContext *ctxt)
+{
+    struct vhost_user *u =3D dev->opaque;
+
+    if (!u->slave_ioc) {
+        return;
+    }
+
+    if (u->slave_src) {
+        g_source_destroy(u->slave_src);
+        g_source_unref(u->slave_src);
+    }
+
+    u->slave_src =3D qio_channel_add_watch_source(u->slave_ioc,
+                                                G_IO_IN | G_IO_HUP,
+                                                slave_read, dev, NULL,
+                                                ctxt);
+}
+
 static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 {
     struct vhost_user *u =3D dev->opaque;
@@ -366,6 +395,7 @@ static int vhost_user_read(struct vhost_dev *dev, Vhost=
UserMsg *msg)
      * be prepared for re-entrancy. So we create a new one and switch chr
      * to use it.
      */
+    slave_update_read_handler(dev, ctxt);
     qemu_chr_be_update_read_handlers(chr->chr, ctxt);
     qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &da=
ta);
=20
@@ -377,6 +407,7 @@ static int vhost_user_read(struct vhost_dev *dev, Vhost=
UserMsg *msg)
      * context that have been processed by the nested loop are purged.
      */
     qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
+    slave_update_read_handler(dev, NULL);
=20
     g_main_loop_unref(loop);
     g_main_context_unref(ctxt);
@@ -1580,9 +1611,7 @@ static int vhost_setup_slave_channel(struct vhost_dev=
 *dev)
         return -1;
     }
     u->slave_ioc =3D ioc;
-    u->slave_src =3D qio_channel_add_watch_source(u->slave_ioc,
-                                                G_IO_IN | G_IO_HUP,
-                                                slave_read, dev, NULL, NUL=
L);
+    slave_update_read_handler(dev, NULL);
=20
     if (reply_supported) {
         msg.hdr.flags |=3D VHOST_USER_NEED_REPLY_MASK;
--=20
2.26.2


