Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509764B30CD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:38:33 +0100 (CET)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeYi-0004Mm-9C
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCx-0007Im-24
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:06 -0500
Received: from [2607:f8b0:4864:20::1034] (port=54107
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCu-0003LT-PI
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id qe15so9259208pjb.3
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q5eYOOn7M4bFWzYVkQXLPOt/0HOarT7RU0dsGoD8OIg=;
 b=hnRLOigjwdaXmTziorK1KzXfUom9dMUH+3kNflmAsC84aUaDjJAXsvFYz83ulqthdZ
 jAJ3Cvte+RSSac9WSoNLxyuDj1H9j2x6I8Q4Ch7VMtjxnBivayn8r+LzmyO7l3PoJhOB
 a/CuhnX4f+5TP57jP10+1a52Ts84YOdFubBPSHLts6Xd7Y33waIhrSE2CdrtQNEQkb2+
 pyda5FSca/c1GzvtGeJ0DilbhziFgk71bQrJTDDu6REgC3fum9S3pkhECmYYTB7JNzmK
 VZtEOyWPEmjqS3Z5TD04BAI5P5pXTzn+fvBpEdQL9dBQ4JABvhNktpQoSE93DO9949U/
 9+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q5eYOOn7M4bFWzYVkQXLPOt/0HOarT7RU0dsGoD8OIg=;
 b=ckgr0bi55RvjauYH51ay/BZKEOAQorvQQ3kXsGGkpF46M2H7t61URN4TK2SwdGGaCI
 /6cKbGeY07ZFst4FiF5yAu0wGO9+ALCE5W0Z3X2CxCduLTe/dmjwt/948eaGC7THAKtX
 9g5milGV38MUVj1rI05Uajc2AFo/66/993YtPYTwpc6bC7Ko+ZKiUHDhfJIzp6N37YhU
 5KD8tQKnhGWhtE+QHWX7J8FaEL/QkC0HKfi7sw/Z3DC+8LhsuOHXGYPi1BNUHR+eL93I
 9P+U7v1ClGJWUzPfMw/3Zcrw2FBe2TeLuuvtaboRjHWSdZKf9cTfsqlQVC1h9EmrtiFQ
 fxTQ==
X-Gm-Message-State: AOAM5303QaS5KgoT5yA101em8uI3p2pNj5C9X5y+yDIfVuxDPpInVHtl
 t5p8lBT/kDIkCqK3VoK8T5/MiH4x6tg=
X-Google-Smtp-Source: ABdhPJw6cF93BOsPPiEWU73A/hhdotCOx9z4LqMzXpNCJhyJiXBH0a+ie4BjAdUkYm5ddKRb5lpGhA==
X-Received: by 2002:a17:902:b487:: with SMTP id
 y7mr3485726plr.81.1644617759613; 
 Fri, 11 Feb 2022 14:15:59 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:59 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 14/25] virtio-snd: Add VIRTIO_SND_R_PCM_INFO handler
Date: Sat, 12 Feb 2022 03:43:08 +0530
Message-Id: <20220211221319.193404-15-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1034.google.com
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

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 88 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index aec3e86db2..a53a6be168 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -188,6 +188,91 @@ static uint32_t virtio_snd_handle_jack_remap(VirtIOSound *s,
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
@@ -233,7 +318,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
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
2.31.1


