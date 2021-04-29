Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07C36EA2D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:15:36 +0200 (CEST)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5Zv-00053H-N6
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qs-00087N-T3
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:16 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qo-0000bD-If
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:14 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso10829291pjs.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FUwTYo4Bm975EnC5JO2hCKsveB8utELXrho2hxTNlIs=;
 b=BLKOs7bnYq36gzkpR9w57P5pqMcpng4xPW91M9/+0D5VvLc0tG2VduOIUgCad0DTgd
 vGLbTZgj5N/3kPC4XjuOKkkj5NZk0OT/P0Td91SZXH/pv6lN4oBexS7u0kb0pHs0ln04
 27b+HVWxRTL0hi3/93ZE4WADQ4B6/NInv2rzDdIHBwqdfM6c0Hafv687wo/Vn8ubwxtC
 3IMA3uUN1LyQvl8VQF05eFywCIml1ByuA0Znq2wSJYq5Wmhr2zR5J4YcJ9afeyM9IFJz
 zfqnRbPvY9khl2RILMsCo8C/hEvLnJzPxT58uXf+ajO8Gh6F7rqzspdok2E6YQa61IVq
 7Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FUwTYo4Bm975EnC5JO2hCKsveB8utELXrho2hxTNlIs=;
 b=Hc6UD5uSEvoaNcx752Trwx8LeaNElmacAuYNDibxzZTylmsDA9cXgNPdgEucdVmCdL
 FjrGqOKX+826yQbxlKY3Rgb0F8ATOvh81EppGbga28ZPzhlwDcLwDXmPMFURU1NLx17G
 6imDNETwLEBAl8tymPesktRaiTAImZg9MX0tCTV9iy7yavPl7BBc2FYhe8+wgegxKA6x
 VMMVCR2Pmx45BL3OoS3ederPYU3VWPERFUNpZSpfwl82nKsUcZhL6Vue6mTe6zTitor1
 58sWtMr0WFI2fDzlQC7kgYAIPstvPaYUuOSMThpTA4E6Bqe9czWTwUZcsFFWs0KhcvbO
 2Rrg==
X-Gm-Message-State: AOAM5331JoP2zMPVVsHitTsQLrmrCquy9O1N0GjvqDZ2+PrVFiTiVvE8
 nkwAQC6Twe7orll/CvEjMs8=
X-Google-Smtp-Source: ABdhPJyuERrK+7ev+eBqpXkN+T5A1hUuY1qqeVd7Y7dpduyVEn6Dgxk8oxPyix/vSKZPrfh1Rx46Wg==
X-Received: by 2002:a17:90a:ce92:: with SMTP id
 g18mr9079916pju.214.1619697969302; 
 Thu, 29 Apr 2021 05:06:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:09 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 15/27] virtio-snd: Add VIRTIO_SND_R_PCM_INFO handler
Date: Thu, 29 Apr 2021 17:34:33 +0530
Message-Id: <20210429120445.694420-16-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 88 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 527eed6132..bc99cd58d6 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -196,6 +196,91 @@ static uint32_t virtio_snd_handle_jack_remap(VirtIOSound *s,
     return sz;
 }
 
+/*
+ * Get a specific stream from the virtio sound card device.
+ *
+ * @s: VirtIOSound card device
+ * @stream: Stream id
+ *
+ * Returns NULL if function fails.
+ * TODO: Make failure more explicit. Output can be NULL if the stream number
+ *       is valid but the stream hasn't been allocated yet.
+ */
+static virtio_snd_pcm_stream *virtio_snd_pcm_get_stream(VirtIOSound *s,
+                                                        uint32_t stream)
+{
+    if (stream >= s->snd_conf.streams) {
+        virtio_snd_err("Invalid stream request %d\n", stream);
+        return NULL;
+    }
+    return s->streams[stream];
+}
+
+/*
+ * Handle the VIRTIO_SND_R_PCM_INFO request.
+ * The function writes the info structs to the request element.
+ * Returns the used size in bytes.
+ *
+ * @s: VirtIOSound card device
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_pcm_info(VirtIOSound *s,
+                                           VirtQueueElement *elem)
+{
+    virtio_snd_query_info req;
+    uint32_t sz;
+    sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
+    assert(sz == sizeof(virtio_snd_query_info));
+
+    virtio_snd_hdr resp;
+    if (iov_size(elem->in_sg, elem->in_num) <
+        sizeof(virtio_snd_hdr) + req.size * req.count) {
+        virtio_snd_err("pcm info: buffer too small, got: %lu, needed: %lu\n",
+                iov_size(elem->in_sg, elem->in_num),
+                sizeof(virtio_snd_pcm_info));
+        resp.code = VIRTIO_SND_S_BAD_MSG;
+        goto done;
+    }
+
+    virtio_snd_pcm_stream *stream;
+    virtio_snd_pcm_info *pcm_info = g_new0(virtio_snd_pcm_info, req.count);
+    for (int i = req.start_id; i < req.start_id + req.count; i++) {
+        stream = virtio_snd_pcm_get_stream(s, i);
+
+        if (!stream) {
+            virtio_snd_err("Invalid stream id: %d\n", i);
+            resp.code = VIRTIO_SND_S_BAD_MSG;
+            goto done;
+        }
+
+        pcm_info[i - req.start_id].hdr.hda_fn_nid = stream->hda_fn_nid;
+        pcm_info[i - req.start_id].features = stream->features;
+        pcm_info[i - req.start_id].formats = stream->formats;
+        pcm_info[i - req.start_id].rates = stream->rates;
+        pcm_info[i - req.start_id].direction = stream->direction;
+        pcm_info[i - req.start_id].channels_min = stream->channels_min;
+        pcm_info[i - req.start_id].channels_max = stream->channels_max;
+
+        memset(&pcm_info[i].padding, 0, sizeof(pcm_info[i].padding));
+    }
+
+    resp.code = VIRTIO_SND_S_OK;
+done:
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+
+    if (resp.code == VIRTIO_SND_S_BAD_MSG) {
+        g_free(pcm_info);
+        return sz;
+    }
+
+    sz = iov_from_buf(elem->in_sg, elem->in_num, sizeof(virtio_snd_hdr),
+                      pcm_info, sizeof(virtio_snd_pcm_info) * req.count);
+    assert(sz == req.size * req.count);
+    g_free(pcm_info);
+    return sizeof(virtio_snd_hdr) + sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -241,7 +326,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_jack_remap(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_INFO");
+            sz = virtio_snd_handle_pcm_info(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_SET_PARAMS) {
             virtio_snd_log("VIRTIO_SND_R_PCM_SET_PARAMS");
         } else if (ctrl.code == VIRTIO_SND_R_PCM_PREPARE) {
-- 
2.25.1


