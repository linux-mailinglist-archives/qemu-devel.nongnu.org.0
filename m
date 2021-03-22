Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53743449C8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:53:05 +0100 (CET)
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMrY-0004bv-OQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjg-0004qP-Mj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMje-0006wK-FV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6xWs/CEw54bPeKwwY9J/GoUWPgYTmmSzfK7BGIvIz68=;
 b=RVd4v4BnAxezo1IuOB/5ELswDKRlxvy3H2lqsW5isSXnkN39D702Ouwq1Rbhgr6MJHEXJy
 ZSAgnT0GdNeye+8xwtf5PG/e1FiUrdQP1LfD5eSToxEd7j3IvXM5pdv7cLy1rrenxFefpR
 9rgyPJiws9udWcv8WZoUhMq1UKSk9lo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-uWHFZlekM-WtVUjVSo7ypg-1; Mon, 22 Mar 2021 11:44:51 -0400
X-MC-Unique: uWHFZlekM-WtVUjVSo7ypg-1
Received: by mail-wm1-f69.google.com with SMTP id i14so15009763wmq.7
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6xWs/CEw54bPeKwwY9J/GoUWPgYTmmSzfK7BGIvIz68=;
 b=nfCeYGtaJOJewsu8WD1geK66NRy9WbJtJTL9clFdpGn30qr71fZJoe3rBTlDuwAVL6
 k/QT6IXGed59zjHKHCx4wohwMjiRemsqJWybbXJtYHC8s77b8nW/wmp+o/ry86ovy0nv
 bXe4fFvNVBoGPnCaaSwjLCAT3HB7Bv8sEFLtt8XUUUe3UtxZbPGZgOzKhijLeARS22lv
 WRUUmRS/Y+sy/xloZzFh2FbKcIbmnbRe4fJPOMW7meOSuuU6kgHd9gEzVs+yKvVoopgP
 ZU3/E4ujCh6gNmBPB+iqQ5MXUJ6twwEzsR1YDMbrQga+tLHoG/rjOKpdcbd0SbTgr7CS
 WXOw==
X-Gm-Message-State: AOAM530cFXS3LWTcFNjS5k+VheIgxHyGVw+OwFKvcaDQlaPaXZ7iUtbU
 uOtKYFFnXCcX84TSNpTS05+V35gGegngperdC+IyuN6D3851DmaHvnLo6YPPBUVc9DXE5bk7Nsv
 1k83FqjTeSjkijEjMl6eLL0fvSG8Hhd3WGBBIGDgne2GLiudZ5uddc4p2dz8P
X-Received: by 2002:adf:e548:: with SMTP id z8mr189369wrm.246.1616427889846;
 Mon, 22 Mar 2021 08:44:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywO3wziiYkQtK59DGOMe3eRvsrm0gKqCN1ljZRLJahUtTAipk9hr7APEPIIYyD8k7C1FFHeQ==
X-Received: by 2002:adf:e548:: with SMTP id z8mr189348wrm.246.1616427889573;
 Mon, 22 Mar 2021 08:44:49 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id q4sm17255582wma.20.2021.03.22.08.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:44:49 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:44:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] vhost-user: Introduce nested event loop in
 vhost_user_read()
Message-ID: <20210322154417.524229-7-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

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
Message-Id: <20210312092212.782255-6-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost-user.c | 65 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 3c1e1611b0..00256fa318 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -296,15 +296,27 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
     return 0;
 }
 
-static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
+struct vhost_user_read_cb_data {
+    struct vhost_dev *dev;
+    VhostUserMsg *msg;
+    GMainLoop *loop;
+    int ret;
+};
+
+static gboolean vhost_user_read_cb(GIOChannel *source, GIOCondition condition,
+                                   gpointer opaque)
 {
+    struct vhost_user_read_cb_data *data = opaque;
+    struct vhost_dev *dev = data->dev;
+    VhostUserMsg *msg = data->msg;
     struct vhost_user *u = dev->opaque;
     CharBackend *chr = u->user->chr;
     uint8_t *p = (uint8_t *) msg;
     int r, size;
 
     if (vhost_user_read_header(dev, msg) < 0) {
-        return -1;
+        data->ret = -1;
+        goto end;
     }
 
     /* validate message size is sane */
@@ -312,7 +324,8 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
         error_report("Failed to read msg header."
                 " Size %d exceeds the maximum %zu.", msg->hdr.size,
                 VHOST_USER_PAYLOAD_SIZE);
-        return -1;
+        data->ret = -1;
+        goto end;
     }
 
     if (msg->hdr.size) {
@@ -322,11 +335,53 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
         if (r != size) {
             error_report("Failed to read msg payload."
                          " Read %d instead of %d.", r, msg->hdr.size);
-            return -1;
+            data->ret = -1;
+            goto end;
         }
     }
 
-    return 0;
+end:
+    g_main_loop_quit(data->loop);
+    return G_SOURCE_REMOVE;
+}
+
+static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
+{
+    struct vhost_user *u = dev->opaque;
+    CharBackend *chr = u->user->chr;
+    GMainContext *prev_ctxt = chr->chr->gcontext;
+    GMainContext *ctxt = g_main_context_new();
+    GMainLoop *loop = g_main_loop_new(ctxt, FALSE);
+    struct vhost_user_read_cb_data data = {
+        .dev = dev,
+        .loop = loop,
+        .msg = msg,
+        .ret = 0
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
+    qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &data);
+
+    g_main_loop_run(loop);
+
+    /*
+     * Restore the previous event loop context. This also destroys/recreates
+     * event sources : this guarantees that all pending events in the original
+     * context that have been processed by the nested loop are purged.
+     */
+    qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
+
+    g_main_loop_unref(loop);
+    g_main_context_unref(ctxt);
+
+    return data.ret;
 }
 
 static int process_message_reply(struct vhost_dev *dev,
-- 
MST


