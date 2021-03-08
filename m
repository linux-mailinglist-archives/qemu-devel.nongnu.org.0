Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D799C330EF8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:16:52 +0100 (CET)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFkh-0001bV-Uh
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJF3R-0000UX-FB
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:32:09 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:38224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJF3P-0001wh-OU
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:32:09 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-rTogx99wNSKYiuBl4lAMMw-1; Mon, 08 Mar 2021 07:31:55 -0500
X-MC-Unique: rTogx99wNSKYiuBl4lAMMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B72872F7A0;
 Mon,  8 Mar 2021 12:31:54 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 691605D9D0;
 Mon,  8 Mar 2021 12:31:53 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] vhost-user: Monitor slave channel in vhost_user_read()
Date: Mon,  8 Mar 2021 13:31:40 +0100
Message-Id: <20210308123141.26444-4-groug@kaod.org>
In-Reply-To: <20210308123141.26444-1-groug@kaod.org>
References: <20210308123141.26444-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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
 hw/virtio/vhost-user.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index e395d0d1fd81..7669b3f2a99f 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -345,6 +345,9 @@ end:
     return G_SOURCE_REMOVE;
 }
=20
+static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
+                           gpointer opaque);
+
 static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 {
     struct vhost_user *u =3D dev->opaque;
@@ -352,6 +355,7 @@ static int vhost_user_read(struct vhost_dev *dev, Vhost=
UserMsg *msg)
     GMainContext *prev_ctxt =3D chr->chr->gcontext;
     GMainContext *ctxt =3D g_main_context_new();
     GMainLoop *loop =3D g_main_loop_new(ctxt, FALSE);
+    GSource *slave_src =3D NULL;
     struct vhost_user_read_cb_data data =3D {
         .dev =3D dev,
         .loop =3D loop,
@@ -363,8 +367,30 @@ static int vhost_user_read(struct vhost_dev *dev, Vhos=
tUserMsg *msg)
     qemu_chr_be_update_read_handlers(chr->chr, ctxt);
     qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &da=
ta);
=20
+    if (u->slave_ioc) {
+        /*
+         * This guarantees that all pending events in the main context
+         * for the slave channel are purged. They will be re-detected
+         * and processed now by the nested loop.
+         */
+        g_source_destroy(u->slave_src);
+        g_source_unref(u->slave_src);
+        u->slave_src =3D NULL;
+        slave_src =3D qio_channel_add_watch_source(u->slave_ioc, G_IO_IN,
+                                                 slave_read, dev, NULL,
+                                                 ctxt);
+    }
+
     g_main_loop_run(loop);
=20
+    if (u->slave_ioc) {
+        g_source_destroy(slave_src);
+        g_source_unref(slave_src);
+        u->slave_src =3D qio_channel_add_watch_source(u->slave_ioc, G_IO_I=
N,
+                                                    slave_read, dev, NULL,
+                                                    NULL);
+    }
+
     /*
      * Restore the previous context. This also destroys/recreates event
      * sources : this guarantees that all pending events in the original
@@ -372,6 +398,7 @@ static int vhost_user_read(struct vhost_dev *dev, Vhost=
UserMsg *msg)
      */
     qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
=20
+
     g_main_loop_unref(loop);
     g_main_context_unref(ctxt);
=20
--=20
2.26.2


