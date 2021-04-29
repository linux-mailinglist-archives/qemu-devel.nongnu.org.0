Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D809D36EA7E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:29:31 +0200 (CEST)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5nO-0007oo-TX
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R2-00089m-UH
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:25 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qr-0000bV-59
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:24 -0400
Received: by mail-pf1-x433.google.com with SMTP id a12so3619880pfc.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uLBtfbqH8J3EHVhSF1F5M9+NmnEaU+y5Z8djRQCP00Q=;
 b=UR0LbY8uistU7Y5d0p135bc4tF1uQs5j08NcGFqnZAbtyx/GOWGeSCs1uiKSlTgtDx
 QFiW6ZRLeQVuJlN2hity1PtGmlpAU058KUI6YcnCokCmA2OxK6Ve86/WYyXpaQOamXDE
 E6E3WTfr+mR8ZNxnvvjeHiAP+waj2T4WsW+lyPXHTyn0xLWIZKIN+XKZvxfC96dZBMoz
 YYdRkU4eKa8ft0usVIoUSxpeIS7J6nwK3Rx19VU/MvWprGhykKFi85BTyUGLKGV1NVRW
 84pCE4yinhSvz3a9FvM9VmW1rTsJ71Sd8bcwW1ToI5RqaiILthvpZkUHqGogMaP8thDe
 UN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLBtfbqH8J3EHVhSF1F5M9+NmnEaU+y5Z8djRQCP00Q=;
 b=KhnqXh667MSbzFLWitrclTtCqzXP4Bw5Jd0xYrt3dZHSNbx94IPKms8Bdpz0nyiVHo
 WSeMqD0UYuxx8mK6QGbfOg/gMoV+onSiH/kH+BiqADiWI2CBecdCYir3HY59PoFUHq4z
 TVpC0eIaGnprR4FPrqVbBgwW8PN+DF/T4rdm5oXoI/RcSe8q6oIquJwXoZB5gBdy1LiK
 hx7GGt92rprzHac2qcC6dUiT4JGefYrgClzXCE89V+uF7Gx08AXLy//95d9ybWJVogUG
 W64LfwcU/YkNie4Y1sdePC0lcysfmJkeRCzWrcw9bx/nO7G3D3KyeDKpaT+cWApIJTfk
 a62A==
X-Gm-Message-State: AOAM532aZbSjnfam/ZkPpp5JxrfLkU/AhFTgyVkoNDIPwysBLVukWXRG
 4V01rpdMsmhbN6cjPcg3OOM=
X-Google-Smtp-Source: ABdhPJwSTTsZn4GZ77Y/d3Zpuiz7p7wR1J6YRA5NTFIw/hax8D9AEuSKfLxNXjtYkx4FXvNjH91KgQ==
X-Received: by 2002:a63:4866:: with SMTP id x38mr31865597pgk.135.1619697971655; 
 Thu, 29 Apr 2021 05:06:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:11 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 16/27] virtio-snd: Add VIRITO_SND_R_PCM_SET_PARAMS handle
Date: Thu, 29 Apr 2021 17:34:34 +0530
Message-Id: <20210429120445.694420-17-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x433.google.com
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

Added handler for the VIRTIO_SND_R_PCM_SET_PARAMS control request.
The handler was split up into two functions in so that the code
could be reused in the realize function.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 100 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index bc99cd58d6..4e9764de08 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -281,6 +281,103 @@ done:
     return sizeof(virtio_snd_hdr) + sz;
 }
 
+/*
+ * Set the given stream params.
+ * Called by both virtio_snd_handle_pcm_set_params and during device
+ * initialization.
+ * Returns a virtio sound status VIRTIO_SND_S_*
+ *
+ * @s: VirtIOSound card device
+ * @params: The PCM params as defined in the virtio specification
+ */
+static uint32_t virtio_snd_pcm_set_params_impl(VirtIOSound *s,
+                                               virtio_snd_pcm_set_params *params)
+{
+    uint32_t st = params->hdr.stream_id;
+    if (st > s->snd_conf.streams || !(s->pcm_params)) {
+        virtio_error(VIRTIO_DEVICE(s), "Streams not initalized\n");
+        return VIRTIO_SND_S_BAD_MSG;
+    }
+
+    if (!s->pcm_params[st]) {
+        s->pcm_params[st] = g_new0(virtio_snd_pcm_params, 1);
+    }
+    virtio_snd_pcm_params *st_params = s->pcm_params[st];
+
+    st_params->features = params->features;
+    st_params->buffer_bytes = params->buffer_bytes;
+    st_params->period_bytes = params->period_bytes;
+
+    if (params->channel < 1 || params->channel > AUDIO_MAX_CHANNELS) {
+        virtio_snd_err("Number of channels not supported\n");
+        return VIRTIO_SND_S_NOT_SUPP;
+    }
+    st_params->channel = params->channel;
+
+    uint32_t supported_formats = 1 << VIRTIO_SND_PCM_FMT_S8 |
+                                 1 << VIRTIO_SND_PCM_FMT_U8 |
+                                 1 << VIRTIO_SND_PCM_FMT_S16 |
+                                 1 << VIRTIO_SND_PCM_FMT_U16 |
+                                 1 << VIRTIO_SND_PCM_FMT_S32 |
+                                 1 << VIRTIO_SND_PCM_FMT_U32 |
+                                 1 << VIRTIO_SND_PCM_FMT_FLOAT;
+
+    uint32_t supported_rates = 1 << VIRTIO_SND_PCM_RATE_5512 |
+                               1 << VIRTIO_SND_PCM_RATE_8000 |
+                               1 << VIRTIO_SND_PCM_RATE_11025 |
+                               1 << VIRTIO_SND_PCM_RATE_16000 |
+                               1 << VIRTIO_SND_PCM_RATE_22050 |
+                               1 << VIRTIO_SND_PCM_RATE_32000 |
+                               1 << VIRTIO_SND_PCM_RATE_44100 |
+                               1 << VIRTIO_SND_PCM_RATE_48000 |
+                               1 << VIRTIO_SND_PCM_RATE_64000 |
+                               1 << VIRTIO_SND_PCM_RATE_88200 |
+                               1 << VIRTIO_SND_PCM_RATE_96000 |
+                               1 << VIRTIO_SND_PCM_RATE_176399 |
+                               1 << VIRTIO_SND_PCM_RATE_192000 |
+                               1 << VIRTIO_SND_PCM_RATE_384000;
+
+    if (!(supported_formats & (1 << params->format))) {
+        virtio_snd_err("Stream format not supported\n");
+        return VIRTIO_SND_S_NOT_SUPP;
+    }
+    st_params->format = params->format;
+
+    if (!(supported_rates & (1 << params->rate))) {
+        virtio_snd_err("Stream rate not supported\n");
+        return VIRTIO_SND_S_NOT_SUPP;
+    }
+    st_params->rate = params->rate;
+
+    st_params->period_bytes = params->period_bytes;
+    st_params->buffer_bytes = params->buffer_bytes;
+    return VIRTIO_SND_S_OK;
+}
+
+/*
+ * Handles the VIRTIO_SND_R_PCM_SET_PARAMS request.
+ * The function writes the response to the virtqueue element.
+ * Returns the used size in bytes.
+ *
+ * @s: VirtIOSound card device
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_pcm_set_params(VirtIOSound *s,
+                                                 VirtQueueElement *elem)
+{
+    virtio_snd_pcm_set_params req;
+    uint32_t sz;
+    sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
+    assert(sz == sizeof(virtio_snd_pcm_set_params));
+
+    virtio_snd_hdr resp;
+    resp.code = virtio_snd_pcm_set_params_impl(s, &req);
+
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -329,7 +426,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_pcm_info(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_SET_PARAMS) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_SET_PARAMS");
+            sz = virtio_snd_handle_pcm_set_params(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_PREPARE) {
             virtio_snd_log("VIRTIO_SND_R_PCM_PREPARE");
         } else if (ctrl.code == VIRTIO_SND_R_PCM_START) {
-- 
2.25.1


