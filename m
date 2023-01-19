Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D1673FDB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 18:26:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIYeX-0005Ic-DV; Thu, 19 Jan 2023 12:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1pIYeW-0005IT-70
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 12:24:40 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1pIYeT-0006So-Nv
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 12:24:39 -0500
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646--PSKBDw6NRuXob42NeBBqQ-1; Thu, 19 Jan 2023 12:24:32 -0500
X-MC-Unique: -PSKBDw6NRuXob42NeBBqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2ADC29AA3AE;
 Thu, 19 Jan 2023 17:24:31 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.195.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC44C1121315;
 Thu, 19 Jan 2023 17:24:29 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yajun Wu <yajunw@nvidia.com>, Peter Maydell <peter.maydell@linaro.org>,
 Parav Pandit <parav@nvidia.com>, qemu-stable@nongnu.org,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH 2/2] Revert "vhost-user: Introduce nested event loop in
 vhost_user_read()"
Date: Thu, 19 Jan 2023 18:24:24 +0100
Message-Id: <20230119172424.478268-3-groug@kaod.org>
In-Reply-To: <20230119172424.478268-1-groug@kaod.org>
References: <20230119172424.478268-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This reverts commit a7f523c7d114d445c5d83aecdba3efc038e5a692.

The nested event loop is broken by design. It's only user was removed.
Drop the code as well so that nobody ever tries to use it again.

I had to fix a couple of trivial conflicts around return values because
of 025faa872bcf ("vhost-user: stick to -errno error return convention").

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/virtio/vhost-user.c | 65 ++++--------------------------------------
 1 file changed, 5 insertions(+), 60 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 7fb78af22c56..e14895c919ef 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -305,19 +305,8 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
     return 0;
 }
 
-struct vhost_user_read_cb_data {
-    struct vhost_dev *dev;
-    VhostUserMsg *msg;
-    GMainLoop *loop;
-    int ret;
-};
-
-static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition condition,
-                                   gpointer opaque)
+static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 {
-    struct vhost_user_read_cb_data *data = opaque;
-    struct vhost_dev *dev = data->dev;
-    VhostUserMsg *msg = data->msg;
     struct vhost_user *u = dev->opaque;
     CharBackend *chr = u->user->chr;
     uint8_t *p = (uint8_t *) msg;
@@ -325,8 +314,7 @@ static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition condition,
 
     r = vhost_user_read_header(dev, msg);
     if (r < 0) {
-        data->ret = r;
-        goto end;
+        return r;
     }
 
     /* validate message size is sane */
@@ -334,8 +322,7 @@ static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition condition,
         error_report("Failed to read msg header."
                 " Size %d exceeds the maximum %zu.", msg->hdr.size,
                 VHOST_USER_PAYLOAD_SIZE);
-        data->ret = -EPROTO;
-        goto end;
+        return -EPROTO;
     }
 
     if (msg->hdr.size) {
@@ -346,53 +333,11 @@ static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition condition,
             int saved_errno = errno;
             error_report("Failed to read msg payload."
                          " Read %d instead of %d.", r, msg->hdr.size);
-            data->ret = r < 0 ? -saved_errno : -EIO;
-            goto end;
+            return r < 0 ? -saved_errno : -EIO;
         }
     }
 
-end:
-    g_main_loop_quit(data->loop);
-    return G_SOURCE_REMOVE;
-}
-
-static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
-{
-    struct vhost_user *u = dev->opaque;
-    CharBackend *chr = u->user->chr;
-    GMainContext *prev_ctxt = chr->chr->gcontext;
-    GMainContext *ctxt = g_main_context_new();
-    GMainLoop *loop = g_main_loop_new(ctxt, FALSE);
-    struct vhost_user_read_cb_data data = {
-        .dev = dev,
-        .loop = loop,
-        .msg = msg,
-        .ret = 0
-    };
-
-    /*
-     * We want to be able to monitor the slave channel fd while waiting
-     * for chr I/O. This requires an event loop, but we can't nest the
-     * one to which chr is currently attached : its fd handlers might not
-     * be prepared for re-entrancy. So we create a new one and switch chr
-     * to use it.
-     */
-    qemu_chr_be_update_read_handlers(chr->chr, ctxt);
-    qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &data);
-
-    g_main_loop_run(loop);
-
-    /*
-     * Restore the previous event loop context. This also destroys/recreates
-     * event sources : this guarantees that all pending events in the original
-     * context that have been processed by the nested loop are purged.
-     */
-    qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
-
-    g_main_loop_unref(loop);
-    g_main_context_unref(ctxt);
-
-    return data.ret;
+    return 0;
 }
 
 static int process_message_reply(struct vhost_dev *dev,
-- 
2.39.0


