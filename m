Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F64B3077
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:32:15 +0100 (CET)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeSc-0004Ym-Gi
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:32:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE9-0008Gf-5g
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:17 -0500
Received: from [2607:f8b0:4864:20::636] (port=40954
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE4-0003Sw-NX
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:15 -0500
Received: by mail-pl1-x636.google.com with SMTP id y17so5741024plg.7
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bad0khSQg4aEeFpR6OgB+Lc91CmrgeIaURNQVgBSxxk=;
 b=q0rwXGOCXS+5s5QXVG2axc4ZiKJEXtuCjqm3VQrC7r5kz1jhwWlxI/QSxnF9yhIzd/
 Bo0yVuJzSsgu9zH21B79UIqOgj/cSmqrXSL+VinDaZKbntpXNqSiLH3mlRXRiOF1jbi8
 z//l4dgGD83Hjqq18BhuupavMKcieNFxyKUR+VNZ0q3w3zsEulV9Fi53o2sByMDCGe36
 +1+rzmrCVmBmXtqYXhe5UIbsph6RJ5exWG822Bt3cXV+hJJ13I2yiDSqXoSmK/xuQ61u
 +G78sMcMh+uwdM5JpIddEDe+i83E6piHWRVMoFW8iv8lcFNDOXg6KWxcd2NxATXrP/MN
 JP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bad0khSQg4aEeFpR6OgB+Lc91CmrgeIaURNQVgBSxxk=;
 b=hHYgtzpWr0Xt5TMTnCF/0W7cYFuv4wSI7EGydkoI/nQzakINxlmmKPlmN5mt7iAoa3
 wLtA7LWCfoZ84T9A7B+UEo9FgZqmHbb9nQrNKFSYkQPXpVjg60gTNojBVYey+iKyh8sr
 oRtJV3iz9VGBYh8jJXk0QAABi5Of9onpVTRi/FVK4gL3k8IupQcvId3gmiEtcLtBAWKY
 /oZfOT/PJqA3CIVeRcS7fM0VfPnH/QHLNnf8GhWb4lSTyGvDOgbw5GkwdZs9qLN9MuMc
 k2ft3PizsoRo/1ko+pLmhcFJmqvVEyJ/syNF1WX0kThvrX5I8O8CQjxSK9MxKgPbjNW0
 UvVQ==
X-Gm-Message-State: AOAM5304o9+7c00sTDJnSWDkGePfeTiZp7GchKEeWGVh2ZJonyVZLkko
 Ye61s82UTI7wKj9P3jukBp1MaDwA58g=
X-Google-Smtp-Source: ABdhPJwCZ1z7+/EM3PHNku1+zJ0/nod78EEU1sZAITcIVasSKy7VvkG1Wzkm9FQn9vQc4Boxg9nlPg==
X-Received: by 2002:a17:902:db11:: with SMTP id
 m17mr145828plx.103.1644617826144; 
 Fri, 11 Feb 2022 14:17:06 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:17:05 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 23/25] virtio-snd: Add xfer handler
Date: Sat, 12 Feb 2022 03:43:17 +0530
Message-Id: <20220211221319.193404-24-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The handler demultiplexes the buffers recieved in the
tx/rx virtqueue. It uses a helper function for adding these
buffers, (along with the entire virtqueue element,) to
their respective streams.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 71 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 7dd89c444b..80a34e1207 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -1012,6 +1012,74 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
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
+    virtio_snd_log("add_buf called\n");
+
+    virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, stream);
+    uint32_t buf_size, dir;
+    int i;
+
+    // get the direction opposite to the stream. We need read position if we are
+    // writing because we want to add data to the buffer and not consume it.
+    dir = VIRTIO_SND_D_INPUT ^ VIRTIO_SND_D_OUTPUT ^ st->direction;
+    i = virtio_snd_pcm_get_curr_elem(st, dir);
+
+    if (st->elems[i]) {
+        return;
+    }
+
+    buf_size = iov_size(elem->out_sg, elem->out_num)
+               - sizeof(virtio_snd_pcm_xfer);
+
+    st->elems[i] = elem;
+    virtio_snd_pcm_update_buf_pos(st, dir, buf_size);
+}
+
+/*
+ * The tx virtqueue handler. Makes the buffers available to their respective
+ * streams for consumption.
+ *
+ * @vdev: VirtIOSound card
+ * @vq: tx virtqueue
+ */
+static void virtio_snd_handle_xfer(VirtIODevice *vdev, VirtQueue *vq)
+{
+    virtio_snd_log("tx/rx queue callback called\n");
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
+        assert(sz == sizeof(hdr));
+
+        virtio_snd_pcm_add_buf(s, hdr.stream_id, elem);
+    }
+}
+
 /*
  * Initializes the VirtIOSound card device. Validates the configuration
  * passed by the command line. Initializes the virtqueues. Allocates resources
@@ -1056,6 +1124,8 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     default_params.rate = VIRTIO_SND_PCM_RATE_44100;
 
     s->ctrl_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_ctrl);
+    s->tx_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_xfer);
+    s->rx_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_xfer);
 
     s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
     s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
@@ -1123,7 +1193,6 @@ static void virtio_snd_device_unrealize(DeviceState *dev)
 
     virtio_delete_queue(s->ctrl_vq);
     virtio_delete_queue(s->tx_vq);
-    virtio_delete_queue(s->event_vq);
     virtio_delete_queue(s->rx_vq);
 }
 
-- 
2.31.1


