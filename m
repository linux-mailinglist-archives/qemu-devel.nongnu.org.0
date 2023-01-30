Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8757681B65
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:26:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMagw-0000rW-BM; Mon, 30 Jan 2023 15:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaf3-0007T4-Vo
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaf1-0007U3-U0
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9w+cbK177ihiLbeA3SL3UjuA+A67HnTnafScmxGI1UY=;
 b=bIUwKupYNNzd9tF8JtTsnUfv/642sDKdltJ/px8TVEHPqOacqynRQ9LtFrUhA3optuqkKl
 Mi8rOkWn61dlyteZ5IumbNoR3UjsJxJao8RyL6SPP5ZEEK7V1q6l6/I1N672UCiyy26pG2
 gbwk9jVCbuS9u9BG1fxaCc/hPGzvDDg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-lB5CBKhePbCXjssganCJ8A-1; Mon, 30 Jan 2023 15:21:47 -0500
X-MC-Unique: lB5CBKhePbCXjssganCJ8A-1
Received: by mail-ed1-f72.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso8952554edd.14
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9w+cbK177ihiLbeA3SL3UjuA+A67HnTnafScmxGI1UY=;
 b=D+Yr5Q3Sx+88IAdgUzjkAlfxc2O1fEgkDP0WIrsquXgQepR6k+OfPL2QFv0vCBmU6G
 dv45piDcOAzDpapamRgjtJJ9aAXMq5m32fTZ/YgjNwqtfj1ZL/eoetSEPLhSsesmTI7o
 ZPhsTj/fQTzvGedt+mLAT5iQSzSZtMBYD0/bPtSnf8LOqKzEct/JPqtI/tgWANIdfw99
 KesA2967QLN2vg17J9GOyp4IzHNWQC0VaH33f9eRoDVM0a7xFLT/Rkg7CXWJbc079RAY
 0fwXCK0CUQbcovAct8WophoJof5Cx3eaV5O6JVS0P6faDy9ahlPkVoOCeJy/RMla4yZ1
 UBFg==
X-Gm-Message-State: AFqh2kqJPTkDKM48qfKiCzHiosblyiqriht+GOue0cGRzJXnry6NTiXQ
 U3dp3wQ2EUNkiOxgJlg0kvfMar0phJuFodypBxKGOyWj0WeJh+CfaQQuyYDmSbXhuJzIkIN65Do
 HfUi9PUwtENsGHV8whdyPLR4ZEONlpwF0lkYDIDK86leNJ4QVBTQxT/D/am/L
X-Received: by 2002:a17:906:cccc:b0:846:56fe:6c68 with SMTP id
 ot12-20020a170906cccc00b0084656fe6c68mr49254120ejb.21.1675110105892; 
 Mon, 30 Jan 2023 12:21:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXubdPgExocQ7PSfMHgGb5FeJyK0X++2URbrw6tMJi0j4/DSlnUcLwL+nn+I/0Dp7G1cWia8hg==
X-Received: by 2002:a17:906:cccc:b0:846:56fe:6c68 with SMTP id
 ot12-20020a170906cccc00b0084656fe6c68mr49254100ejb.21.1675110105672; 
 Mon, 30 Jan 2023 12:21:45 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 fm19-20020a1709072ad300b007c10d47e748sm7244762ejc.36.2023.01.30.12.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:44 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: [PULL 55/56] Revert "vhost-user: Introduce nested event loop in
 vhost_user_read()"
Message-ID: <20230130201810.11518-56-mst@redhat.com>
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

This reverts commit a7f523c7d114d445c5d83aecdba3efc038e5a692.

The nested event loop is broken by design. It's only user was removed.
Drop the code as well so that nobody ever tries to use it again.

I had to fix a couple of trivial conflicts around return values because
of 025faa872bcf ("vhost-user: stick to -errno error return convention").

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20230119172424.478268-3-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
 hw/virtio/vhost-user.c | 65 ++++--------------------------------------
 1 file changed, 5 insertions(+), 60 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ad8883113b..e68daa35d4 100644
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
MST


