Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECB4681B7F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:28:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMagw-0000rY-Bx; Mon, 30 Jan 2023 15:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaf5-0007Tj-SF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaf1-0007UA-UQ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7bkv3H4oi99LAs4yrO/kNIruXsTWrhvBwWJpGtw2osc=;
 b=QGDbR95c0Sv/6DsDMnVrZI90suzoQJ6WapN/3gfb6BUd/520+k5M6D9ovMQ499TTEXAlTm
 OUyLELSsBoFBdr/F46l/UfLWFZEXMmI0iwyJ5gFy6eK4RfHFDRP6P59XVhAoX168SD3KQe
 YTiqU/RjPupOlbpjxe7q71njXc70YEk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-yqMhZdjlNJ2zddjRemPIgg-1; Mon, 30 Jan 2023 15:21:44 -0500
X-MC-Unique: yqMhZdjlNJ2zddjRemPIgg-1
Received: by mail-ed1-f71.google.com with SMTP id
 q20-20020a056402519400b0049e5b8c71b3so8948516edd.17
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7bkv3H4oi99LAs4yrO/kNIruXsTWrhvBwWJpGtw2osc=;
 b=qY8mwJjvitAfKwRkp454GYf67P5rdODdpvoU+45gHxh9jaikJ8mrMbk/aU/KuGsf0a
 RaeuJ1kh8tJPgJptBnvrUOBsE2cYMv9t9mBBzbyD0MqFgLCJlxeDmkLNXeZCn2RE8LNQ
 l9oHBQMUlKFj1bTc9N6JejC+boS46DhqVzf3zbCY1S6Sfu5UERtpyCXkeABiR2h+Vtw8
 /CJULe2Vr3B+qz0PCM+oFDEEo4G5pMN+4/RGr2w00w6ZLGBRg3aIxyNde5KoVgNOpikP
 qyCeCJd7qPIiSza875+reVZt5IoTnOOFoDrufwRjrHR9WF40eewRjPbJzU2/ut8W1zNM
 HVFA==
X-Gm-Message-State: AO0yUKWL0ZjsHtH8Y5A+WhFLYfV0kFIQospKbKPc6sxpre0mmLfbYlSs
 uExP00IUF530+XNa/dL8pQfKxw1N2HPlfjzriXb6GFAKDqM2Hwuh3KcN5R8dnT1orQVKJU01ayz
 2AElTjwmkCRVKAj6bHDp3+gNnJe5Vdt25r4wwPF8nkrp8pDQRnx+a1hFJegtg
X-Received: by 2002:a17:906:7c07:b0:887:66bc:97 with SMTP id
 t7-20020a1709067c0700b0088766bc0097mr6762085ejo.49.1675110102761; 
 Mon, 30 Jan 2023 12:21:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9mxoDq3sGUVaE42tF01Iz/jfyt8QQ6japb5VRCmUdXXGmMLQ/80Sx6r4Qp748plGzTh12dEg==
X-Received: by 2002:a17:906:7c07:b0:887:66bc:97 with SMTP id
 t7-20020a1709067c0700b0088766bc0097mr6762062ejo.49.1675110102483; 
 Mon, 30 Jan 2023 12:21:42 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 g18-20020a170906595200b00888d593ce76sm1999837ejr.72.2023.01.30.12.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:41 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yanghang Liu <yanghliu@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: [PULL 54/56] Revert "vhost-user: Monitor slave channel in
 vhost_user_read()"
Message-ID: <20230130201810.11518-55-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Greg Kurz <groug@kaod.org>

This reverts commit db8a3772e300c1a656331a92da0785d81667dc81.

Motivation : this is breaking vhost-user with DPDK as reported in [0].

Received unexpected msg type. Expected 22 received 40
Fail to update device iotlb
Received unexpected msg type. Expected 40 received 22
Received unexpected msg type. Expected 22 received 11
Fail to update device iotlb
Received unexpected msg type. Expected 11 received 22
vhost VQ 1 ring restore failed: -71: Protocol error (71)
Received unexpected msg type. Expected 22 received 11
Fail to update device iotlb
Received unexpected msg type. Expected 11 received 22
vhost VQ 0 ring restore failed: -71: Protocol error (71)
unable to start vhost net: 71: falling back on userspace virtio

The failing sequence that leads to the first error is :
- QEMU sends a VHOST_USER_GET_STATUS (40) request to DPDK on the master
  socket
- QEMU starts a nested event loop in order to wait for the
  VHOST_USER_GET_STATUS response and to be able to process messages from
  the slave channel
- DPDK sends a couple of legitimate IOTLB miss messages on the slave
  channel
- QEMU processes each IOTLB request and sends VHOST_USER_IOTLB_MSG (22)
  updates on the master socket
- QEMU assumes to receive a response for the latest VHOST_USER_IOTLB_MSG
  but it gets the response for the VHOST_USER_GET_STATUS instead

The subsequent errors have the same root cause : the nested event loop
breaks the order by design. It lures QEMU to expect responses to the
latest message sent on the master socket to arrive first.

Since this was only needed for DAX enablement which is still not merged
upstream, just drop the code for now. A working solution will have to
be merged later on. Likely protect the master socket with a mutex
and service the slave channel with a separate thread, as discussed with
Maxime in the mail thread below.

[0] https://lore.kernel.org/qemu-devel/43145ede-89dc-280e-b953-6a2b436de395@redhat.com/

Reported-by: Yanghang Liu <yanghliu@redhat.com>
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2155173
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20230119172424.478268-2-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
 hw/virtio/vhost-user.c | 35 +++--------------------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index eca9e104ba..ad8883113b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -356,35 +356,6 @@ end:
     return G_SOURCE_REMOVE;
 }
 
-static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
-                           gpointer opaque);
-
-/*
- * This updates the read handler to use a new event loop context.
- * Event sources are removed from the previous context : this ensures
- * that events detected in the previous context are purged. They will
- * be re-detected and processed in the new context.
- */
-static void slave_update_read_handler(struct vhost_dev *dev,
-                                      GMainContext *ctxt)
-{
-    struct vhost_user *u = dev->opaque;
-
-    if (!u->slave_ioc) {
-        return;
-    }
-
-    if (u->slave_src) {
-        g_source_destroy(u->slave_src);
-        g_source_unref(u->slave_src);
-    }
-
-    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
-                                                G_IO_IN | G_IO_HUP,
-                                                slave_read, dev, NULL,
-                                                ctxt);
-}
-
 static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 {
     struct vhost_user *u = dev->opaque;
@@ -406,7 +377,6 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
      * be prepared for re-entrancy. So we create a new one and switch chr
      * to use it.
      */
-    slave_update_read_handler(dev, ctxt);
     qemu_chr_be_update_read_handlers(chr->chr, ctxt);
     qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &data);
 
@@ -418,7 +388,6 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
      * context that have been processed by the nested loop are purged.
      */
     qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
-    slave_update_read_handler(dev, NULL);
 
     g_main_loop_unref(loop);
     g_main_context_unref(ctxt);
@@ -1809,7 +1778,9 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
         return -ECONNREFUSED;
     }
     u->slave_ioc = ioc;
-    slave_update_read_handler(dev, NULL);
+    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
+                                                G_IO_IN | G_IO_HUP,
+                                                slave_read, dev, NULL, NULL);
 
     if (reply_supported) {
         msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
-- 
MST


