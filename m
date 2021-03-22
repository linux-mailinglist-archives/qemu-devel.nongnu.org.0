Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C413452C5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:07:03 +0100 (CET)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTdW-0004Eh-2T
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWy-0006u2-Mi
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWw-0001BC-QR
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nQQq4fHiGykQygfi1oKmBz5Z/Rv0I+HheOSqIDO6h3I=;
 b=TuY5FvYwpRCOYLAwzX0CSktYIdFDWTGYwl5ANd98nNQJai5/EvEDPkY5kndnfGnF57bcvh
 wQmYZHWrYVyvJm0BRqp0BqU6Mro5alxqt4YUvwMS+U5wmA1ofEoiSg3ZPvNymMy6eol/N0
 kqSwC1I6/eaUWCeubpQRxX3cHivpVhQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Rs81GhhcN3GTbysF3gU4Xw-1; Mon, 22 Mar 2021 19:00:12 -0400
X-MC-Unique: Rs81GhhcN3GTbysF3gU4Xw-1
Received: by mail-wr1-f72.google.com with SMTP id x9so150298wro.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nQQq4fHiGykQygfi1oKmBz5Z/Rv0I+HheOSqIDO6h3I=;
 b=luB4REoGXIZ3Cps5033VuY/4jPksyQKaiTPr47PYU3gZnDVs5npTjuNc8pjbj+YXO6
 zy2vG8zAAmoBc/A6JeEcnolNUKt5slvHvvBq8SyM1cWGxNS/d5VGHHpbgL1jqKhFYXBe
 ruAZ1aaZnLDBZX7JrGCJ239bGr0uHP3gQEKLF0DaBImflpTHGEj3ipjN470H7e1mxV1S
 oHdldemkGug9YmGkxgWeob9pC7gNBF2O8wHarFm/EULbZgMBhMrSHXN2QpIAZ4g/6Cao
 NDyXXZjZHDYvU6vCpxSljdPXModpj114TcNrzLW6zDYpm7ch3qxGSf/qLr2PbxM+GkCO
 98cA==
X-Gm-Message-State: AOAM530He++XfZzZQPAHOcAIEEJEZCj+i3AnwiW8AzlrPimN4Yf9jF6+
 9vn7t5r/y1lIXUkS7UrGVZnxzcrino329g2LZ9WfrHLNcr6Lra6yoQnF57AcPHK/bslOCtP17/M
 vOjzBAfAMIIYO6T8wERHNrxzsxjl6QWBpgRY0AUWgNLuQLtoOlMzUUD5qBycj
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr582538wmg.81.1616454010826; 
 Mon, 22 Mar 2021 16:00:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxHPT4pWG7HeQh3lhzsaUfK5/+F+e4KssYRxcUMgk3fkRwXCjb2XaRGfxRV+c5H5b8E04FGQ==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr582517wmg.81.1616454010591; 
 Mon, 22 Mar 2021 16:00:10 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id v14sm20516842wrd.48.2021.03.22.16.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:10 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/19] vhost-user: Monitor slave channel in vhost_user_read()
Message-ID: <20210322225907.541943-8-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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

Now that everything is in place, have the nested event loop to monitor
the slave channel. The source in the main event loop is destroyed and
recreated to ensure any pending even for the slave channel that was
previously detected is purged. This guarantees that the main loop
wont invoke slave_read() based on an event that was already handled
by the nested loop.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210312092212.782255-7-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost-user.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 00256fa318..ded0c10453 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -345,6 +345,35 @@ end:
     return G_SOURCE_REMOVE;
 }
 
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
+    struct vhost_user *u = dev->opaque;
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
+    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
+                                                G_IO_IN | G_IO_HUP,
+                                                slave_read, dev, NULL,
+                                                ctxt);
+}
+
 static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 {
     struct vhost_user *u = dev->opaque;
@@ -366,6 +395,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
      * be prepared for re-entrancy. So we create a new one and switch chr
      * to use it.
      */
+    slave_update_read_handler(dev, ctxt);
     qemu_chr_be_update_read_handlers(chr->chr, ctxt);
     qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &data);
 
@@ -377,6 +407,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
      * context that have been processed by the nested loop are purged.
      */
     qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
+    slave_update_read_handler(dev, NULL);
 
     g_main_loop_unref(loop);
     g_main_context_unref(ctxt);
@@ -1580,9 +1611,7 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
         return -1;
     }
     u->slave_ioc = ioc;
-    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
-                                                G_IO_IN | G_IO_HUP,
-                                                slave_read, dev, NULL, NULL);
+    slave_update_read_handler(dev, NULL);
 
     if (reply_supported) {
         msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
-- 
MST


