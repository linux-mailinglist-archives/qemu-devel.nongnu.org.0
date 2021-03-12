Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A9338888
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:24:28 +0100 (CET)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe1z-0002QE-ES
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0Q-0000SS-A8
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:51 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0O-0004Df-Ga
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:50 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-A6I8dQHHPemV_Vg_1RMP1g-1; Fri, 12 Mar 2021 04:22:44 -0500
X-MC-Unique: A6I8dQHHPemV_Vg_1RMP1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F122180364C;
 Fri, 12 Mar 2021 09:22:42 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F5646A046;
 Fri, 12 Mar 2021 09:22:32 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] vhost-user: Introduce nested event loop in
 vhost_user_read()
Date: Fri, 12 Mar 2021 10:22:10 +0100
Message-Id: <20210312092212.782255-6-groug@kaod.org>
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

A deadlock condition potentially exists if a vhost-user process needs
to request something to QEMU on the slave channel while processing a
vhost-user message.

This doesn't seem to affect any vhost-user implementation so far, but
this is currently biting the upcoming enablement of DAX with virtio-fs.
The issue is being observed when the guest does an emergency reboot while
a mapping still exits in the DAX window, which is very easy to get with
a busy enough workload (e.g. as simulated by blogbench [1]) :

- QEMU sends VHOST_USER_GET_VRING_BASE to virtiofsd.

- In order to complete the request, virtiofsd then asks QEMU to remove
  the mapping on the slave channel.

All these dialogs are synchronous, hence the deadlock.

As pointed out by Stefan Hajnoczi:

When QEMU's vhost-user master implementation sends a vhost-user protocol
message, vhost_user_read() does a "blocking" read during which slave_fd
is not monitored by QEMU.

The natural solution for this issue is an event loop. The main event
loop cannot be nested though since we have no guarantees that its
fd handlers are prepared for re-entrancy.

Introduce a new event loop that only monitors the chardev I/O for now
in vhost_user_read() and push the actual reading to a one-shot handler.
A subsequent patch will teach the loop to monitor and process messages
from the slave channel as well.

[1] https://github.com/jedisct1/Blogbench

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: - Document why a nested loop is needed in vhost_user_read() (Stefan)
---
 hw/virtio/vhost-user.c | 65 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 3c1e1611b087..00256fa318a6 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -296,15 +296,27 @@ static int vhost_user_read_header(struct vhost_dev *d=
ev, VhostUserMsg *msg)
     return 0;
 }
=20
-static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
+struct vhost_user_read_cb_data {
+    struct vhost_dev *dev;
+    VhostUserMsg *msg;
+    GMainLoop *loop;
+    int ret;
+};
+
+static gboolean vhost_user_read_cb(GIOChannel *source, GIOCondition condit=
ion,
+                                   gpointer opaque)
 {
+    struct vhost_user_read_cb_data *data =3D opaque;
+    struct vhost_dev *dev =3D data->dev;
+    VhostUserMsg *msg =3D data->msg;
     struct vhost_user *u =3D dev->opaque;
     CharBackend *chr =3D u->user->chr;
     uint8_t *p =3D (uint8_t *) msg;
     int r, size;
=20
     if (vhost_user_read_header(dev, msg) < 0) {
-        return -1;
+        data->ret =3D -1;
+        goto end;
     }
=20
     /* validate message size is sane */
@@ -312,7 +324,8 @@ static int vhost_user_read(struct vhost_dev *dev, Vhost=
UserMsg *msg)
         error_report("Failed to read msg header."
                 " Size %d exceeds the maximum %zu.", msg->hdr.size,
                 VHOST_USER_PAYLOAD_SIZE);
-        return -1;
+        data->ret =3D -1;
+        goto end;
     }
=20
     if (msg->hdr.size) {
@@ -322,11 +335,53 @@ static int vhost_user_read(struct vhost_dev *dev, Vho=
stUserMsg *msg)
         if (r !=3D size) {
             error_report("Failed to read msg payload."
                          " Read %d instead of %d.", r, msg->hdr.size);
-            return -1;
+            data->ret =3D -1;
+            goto end;
         }
     }
=20
-    return 0;
+end:
+    g_main_loop_quit(data->loop);
+    return G_SOURCE_REMOVE;
+}
+
+static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
+{
+    struct vhost_user *u =3D dev->opaque;
+    CharBackend *chr =3D u->user->chr;
+    GMainContext *prev_ctxt =3D chr->chr->gcontext;
+    GMainContext *ctxt =3D g_main_context_new();
+    GMainLoop *loop =3D g_main_loop_new(ctxt, FALSE);
+    struct vhost_user_read_cb_data data =3D {
+        .dev =3D dev,
+        .loop =3D loop,
+        .msg =3D msg,
+        .ret =3D 0
+    };
+
+    /*
+     * We want to be able to monitor the slave channel fd while waiting
+     * for chr I/O. This requires an event loop, but we can't nest the
+     * one to which chr is currently attached : its fd handlers might not
+     * be prepared for re-entrancy. So we create a new one and switch chr
+     * to use it.
+     */
+    qemu_chr_be_update_read_handlers(chr->chr, ctxt);
+    qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &da=
ta);
+
+    g_main_loop_run(loop);
+
+    /*
+     * Restore the previous event loop context. This also destroys/recreat=
es
+     * event sources : this guarantees that all pending events in the orig=
inal
+     * context that have been processed by the nested loop are purged.
+     */
+    qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
+
+    g_main_loop_unref(loop);
+    g_main_context_unref(ctxt);
+
+    return data.ret;
 }
=20
 static int process_message_reply(struct vhost_dev *dev,
--=20
2.26.2


