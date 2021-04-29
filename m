Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942EA36EAB3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:42:45 +0200 (CEST)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc60C-0002fq-Nb
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RF-0008Md-0W
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:40 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RD-0000n8-1C
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:36 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i190so6349088pfc.12
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8QxPCFI6EFxehLWO26ThoRdz/R0s7GDhey0ZK+cuoLY=;
 b=ixJiWrnhBKdBK2B4L7KyLNXFsLh9DNkR0C2NhuATlbKY9XTrcufR7vxwyFiJMFDkny
 FSJqen5qfhq04By1qnZZfh7KLkKLGBeh3V7b3pTRIZSDe4HSAK0MeRMFwph9e5X09Dfx
 +VGLndUGjHswlMoIE7WRAnc1c+00KbsixXKOsbM91OhHCON3Z4827qi0UcxEVVlujVrE
 k2MyVPUbztWS2F63kbf8rM3RWELoTR5p2Ptng5dsIKh5w3btSh3scVBBrhtMMn3fgFGT
 gGxgD1R/fjfxFQtOo2nimZOgZJTwyb4UOUU5/qedeWNmw+WxqkhfCey8VIOXfEvIKgw9
 YvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8QxPCFI6EFxehLWO26ThoRdz/R0s7GDhey0ZK+cuoLY=;
 b=SREFD/Y1lylr/Oy/QeFdrntx/86Al7zzz4WrEIYBPRQ1UQ+wJ8yQjV8GONGfG5qpE4
 6DhH7fshHiAobkwBV6wvcVRTCKnxeR7+czFWKMojxZME7w/AvTy0x1zDRyRc6ZKtiums
 oV4FbFFbeEltT+3p54aPVKzp5yzfSl/FoIZJQ0R0LVwluebpXAa7fUK6nQk02/zy1JH3
 vccax855Vml3GpZnBgOZJKcz1cjW86Bvd7AeO7EltnczmjD6IFITVCR1urh/TO0/wMwB
 /K7qj1zjoXk6qI71PKGyIyLarJ96AH8QeyqIF2zDksDo91c9gfV2OXShD+SKNI6xSa5y
 yTzw==
X-Gm-Message-State: AOAM532lRESygXJzq9pfdhIolVNnv9HxyTJYltSx1IpBqNK2NZ+zszRX
 lfFyUC2GZFLAghdOSeamiH4=
X-Google-Smtp-Source: ABdhPJwphd1jbVwl8Osw6hee6r4WcU6X1gWyKvnXkJmmUg4Pw/7/dabnStJHD6d1yipuCbioZ4IvRg==
X-Received: by 2002:aa7:9696:0:b029:259:efef:e1e0 with SMTP id
 f22-20020aa796960000b0290259efefe1e0mr34082206pfk.0.1619697993677; 
 Thu, 29 Apr 2021 05:06:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:33 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 25/27] virtio-snd: Add tx vq and handler
Date: Thu, 29 Apr 2021 17:34:43 +0530
Message-Id: <20210429120445.694420-26-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The handler demultiplexes the buffers recieved in the
tx virtqueue. It uses a helper function for adding these
buffers, (along with the entire virtqueue element,) to
their respective streams.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index e2e47e9467..be9ea05e3f 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -925,6 +925,66 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     }
 }
 
+/*
+ * Adds a virtqueue element to a VirtIOSound card stream. Makes the buffer
+ * available to the stream for consumption.
+ *
+ * @s: VirtIOSound card
+ * @stream: stream id
+ * @elem: The tx virtqueue element that contains the I/O message
+ */
+static void virtio_snd_pcm_add_buf(VirtIOSound *s, uint32_t stream,
+                                   VirtQueueElement *elem)
+{
+    virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, stream);
+    int nelems = virtio_snd_pcm_get_nelems(st);
+    st->tail++;
+    st->tail %= nelems;
+
+    if (st->elems[st->tail]) {
+        return;
+    }
+
+    st->elems[st->tail] = elem;
+    st->r_pos += iov_size(elem->out_sg, elem->out_num)
+                 - sizeof(virtio_snd_pcm_xfer);
+    st->r_pos %= st->buffer_bytes + 1;
+}
+
+/*
+ * The tx virtqueue handler. Makes the buffers available to their respective
+ * streams for consumption.
+ *
+ * @vdev: VirtIOSound card
+ * @vq: tx virtqueue
+ */
+static void virtio_snd_handle_tx(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOSound *s = VIRTIO_SOUND(vdev);
+    VirtQueueElement *elem;
+    size_t sz;
+    virtio_snd_pcm_xfer hdr;
+
+    for (;;) {
+        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
+        if (!elem) {
+            break;
+        }
+        if (iov_size(elem->in_sg, elem->in_num) < sizeof(virtio_snd_pcm_status) ||
+            iov_size(elem->out_sg, elem->out_num) < sizeof(virtio_snd_pcm_xfer)) {
+            virtqueue_detach_element(vq, elem, 0);
+            g_free(elem);
+            break;
+        }
+
+        /* get the message hdr object */
+        sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &hdr, sizeof(hdr));
+        assert(sz == sizeof(virtio_snd_pcm_xfer));
+
+        virtio_snd_pcm_add_buf(s, hdr.stream_id, elem);
+    }
+}
+
 /*
  * Initializes the VirtIOSound card device. Validates the configuration
  * passed by the command line. Initializes the virtqueues. Allocates resources
@@ -969,6 +1029,7 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     default_params.rate = VIRTIO_SND_PCM_RATE_44100;
 
     s->ctrl_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_ctrl);
+    s->tx_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_tx);
 
     s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
     s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
@@ -1034,6 +1095,7 @@ static void virtio_snd_device_unrealize(DeviceState *dev)
     s->jacks = NULL;
 
     virtio_delete_queue(s->ctrl_vq);
+    virtio_delete_queue(s->tx_vq);
 }
 
 static void virtio_snd_reset(VirtIODevice *vdev)
-- 
2.25.1


