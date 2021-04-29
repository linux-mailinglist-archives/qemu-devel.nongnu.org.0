Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E2236EA9D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:38:13 +0200 (CEST)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5vo-0007Xj-6I
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R4-0008AO-Eu
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qu-0000cN-Kr
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m37so4410305pgb.8
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZeWvOpI4hMofN2MRXV5vwzCRjmyAQtHko1ftmTNmoLw=;
 b=bkog44gXzim1+hP+3Au9pfIBEH7/rgGnyDpSmh5o1SnqKwlpkUEQTHkbV4qDLbLvy5
 q4pI66TYL9Me+0e9ektyv1D0OXpnQXufMCdnWQV0aJTzaYkBucYss2TSum0TjjD1sfJd
 dVQxN0Yz0kezMIj9Tm9lUrI59DO7D10JOHuMVq4EaCxuaQgFQ2bBKYbn0Hra21Jyv1Dh
 uLMmk6Pna7ibp9c+fGg5l66cn2pvP1tGIFDqQWZj1kh7zn75LTbHHq4JiZAIpPkXvsYf
 1UFDPgN17wxwOuxy/STDBg9cTp2fMdHOxkfe/j0uX/qCukT+u53GUWlVU3h44JEf/de1
 UosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZeWvOpI4hMofN2MRXV5vwzCRjmyAQtHko1ftmTNmoLw=;
 b=KaWTcQuvOmvxrqv/XVx7Xen0PbIHHwrreaepatOuWjgAydw5YQin20OvT6ItJDxZ/j
 aM4nUZwsDco4ckelwpSAt8/ahrQJAX2gg9fNle+JBDfQvTh4xwqQjgcaIH7Bz1Kcbua2
 OrBHT9LSlksaBCFHU+oiyDAB3u0aSk6/uj6Ck2kdm131qHKCVcfMcIg4rJAYoLMUg8Ux
 l+jvEPUDYcUoETXlqWHtHJJ8pcajL7pVe0MGolzjnlDfle/AQAeQ/a+9h/+Damp1lAfU
 Z3DdvMDTNrhIX+vmgStPJB7SMjUVEQdyE7JDN4EwQxXo0rkwpjkrmu35b9SrQPsKr48w
 WGug==
X-Gm-Message-State: AOAM5318ks/qShl3bQHDdxx0EHQKAoRmhLZeDP36gMQifOJXg2nFe3sY
 be/Yj0paTVASLxQT4+HnAUiCETvksUYp6M2b/t0=
X-Google-Smtp-Source: ABdhPJxG09c5LyQ3cZvYS5aYdkrta6BF4+x93E/sv5qTzjU8LFTjl2KsSvDePS0RXNi5ISL91VSnEg==
X-Received: by 2002:a63:9d0d:: with SMTP id i13mr20293337pgd.197.1619697974156; 
 Thu, 29 Apr 2021 05:06:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:13 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 17/27] virtio-snd: Add VIRTIO_SND_R_PCM_PREPARE handler
Date: Thu, 29 Apr 2021 17:34:35 +0530
Message-Id: <20210429120445.694420-18-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x52c.google.com
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

The handler doesn't intialize the SWVoiceOut streams for now.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 198 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 197 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 4e9764de08..dba90cc4a7 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -378,6 +378,201 @@ static uint32_t virtio_snd_handle_pcm_set_params(VirtIOSound *s,
     return sz;
 }
 
+/*
+ * Get a QEMU Audiosystem compatible format value from a VIRTIO_SND_PCM_FMT_*
+ */
+static AudioFormat virtio_snd_get_qemu_format(uint32_t format)
+{
+    switch (format) {
+    case VIRTIO_SND_PCM_FMT_U8:
+        return AUDIO_FORMAT_U8;
+    case VIRTIO_SND_PCM_FMT_S8:
+        return AUDIO_FORMAT_S8;
+    case VIRTIO_SND_PCM_FMT_U16:
+        return AUDIO_FORMAT_U16;
+    case VIRTIO_SND_PCM_FMT_S16:
+        return AUDIO_FORMAT_S16;
+    case VIRTIO_SND_PCM_FMT_U32:
+        return AUDIO_FORMAT_U32;
+    case VIRTIO_SND_PCM_FMT_S32:
+        return AUDIO_FORMAT_S32;
+    case VIRTIO_SND_PCM_FMT_FLOAT:
+        return AUDIO_FORMAT_F32;
+    default:
+        return -1;
+    }
+}
+
+/*
+ * Get a QEMU Audiosystem compatible frequency value from a
+ * VIRTIO_SND_PCM_RATE_*
+ */
+static uint32_t virtio_snd_get_qemu_freq(uint32_t rate)
+{
+    switch (rate) {
+    case VIRTIO_SND_PCM_RATE_5512:
+        return 5512;
+    case VIRTIO_SND_PCM_RATE_8000:
+        return 8000;
+    case VIRTIO_SND_PCM_RATE_11025:
+        return 11025;
+    case VIRTIO_SND_PCM_RATE_16000:
+        return 16000;
+    case VIRTIO_SND_PCM_RATE_22050:
+        return 22050;
+    case VIRTIO_SND_PCM_RATE_32000:
+        return 32000;
+    case VIRTIO_SND_PCM_RATE_44100:
+        return 44100;
+    case VIRTIO_SND_PCM_RATE_48000:
+        return 48000;
+    case VIRTIO_SND_PCM_RATE_64000:
+        return 64000;
+    case VIRTIO_SND_PCM_RATE_88200:
+        return 88200;
+    case VIRTIO_SND_PCM_RATE_96000:
+        return 96000;
+    case VIRTIO_SND_PCM_RATE_176399:
+        return 176399;
+    case VIRTIO_SND_PCM_RATE_192000:
+        return 192000;
+    case VIRTIO_SND_PCM_RATE_384000:
+        return 384000;
+    default:
+        return -1;
+    }
+}
+
+/*
+ * Get QEMU Audiosystem compatible audsettings from virtio based pcm stream
+ * params.
+ */
+static void virtio_snd_get_qemu_audsettings(audsettings *as,
+                                            virtio_snd_pcm_params *params)
+{
+    as->nchannels = params->channel;
+    as->fmt = virtio_snd_get_qemu_format(params->format);
+    as->freq = virtio_snd_get_qemu_freq(params->rate);
+    as->endianness = AUDIO_HOST_ENDIANNESS;
+}
+
+/*
+ * Get the maximum number of virtqueue elements that can be inserted
+ * into a virtio sound pcm stream
+ *
+ * @st: virtio sound pcm stream
+ */
+static int virtio_snd_pcm_get_nelems(virtio_snd_pcm_stream *st)
+{
+    return st->buffer_bytes / st->period_bytes
+           + !!(st->buffer_bytes % st->period_bytes);
+}
+
+/*
+ * Prepares a VirtIOSound card stream.
+ * Returns a virtio sound status (VIRTIO_SND_S_*).
+ *
+ * @s: VirtIOSound card
+ * @stream: stream id
+ */
+static uint32_t virtio_snd_pcm_prepare_impl(VirtIOSound *s, uint32_t stream)
+{
+    if (!s->streams || !s->pcm_params || !s->pcm_params[stream]) {
+        virtio_snd_err("Cannot prepare stream %d without params.\n", stream);
+        return VIRTIO_SND_S_BAD_MSG;
+    }
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
+    virtio_snd_pcm_stream *st = g_new0(virtio_snd_pcm_stream, 1);
+    st->hda_fn_nid = VIRTIO_SOUND_HDA_FN_NID_OUT;
+    st->features = 0;
+    st->direction = stream <= s->snd_conf.streams / 2 ?
+                    VIRTIO_SND_D_OUTPUT : VIRTIO_SND_D_INPUT;
+    st->channels_min = 1;
+    st->channels_max = AUDIO_MAX_CHANNELS;
+    st->formats = supported_formats;
+    st->rates = supported_rates;
+    st->s = s;
+
+    st->buffer_bytes = s->pcm_params[stream]->buffer_bytes;
+    st->period_bytes = s->pcm_params[stream]->period_bytes;
+
+    audsettings as;
+    virtio_snd_get_qemu_audsettings(&as, s->pcm_params[stream]);
+
+    if (st->direction == VIRTIO_SND_D_OUTPUT) {
+        /* st->voice.out = AUD_open_out(&s->card,
+         *                              st->voice.out,
+         *                              "virtio_snd_card",
+         *                              st,
+         *                              virtio_snd_output_cb, &as);
+         */
+    } else {
+        /* st->voice.in = AUD_open_in(&s->card,
+         *                            st->voice.in,
+         *                            "virtio_snd_card",
+         *                            st,
+         *                            virtio_snd_input_cb,
+         *                            &as);
+         */
+    }
+
+    uint32_t nelems = virtio_snd_pcm_get_nelems(st);
+    st->elems = g_new0(VirtQueueElement *, nelems);
+    st->tail = -1;
+    st->w_pos = 0;
+    st->r_pos = 0;
+    s->streams[stream] = st;
+
+    return VIRTIO_SND_S_OK;
+}
+
+/*
+ * Handles VIRTIO_SND_R_PCM_PREPARE.
+ * The function writes the response to the virtqueue element.
+ * Returns the used size in bytes.
+ *
+ * @s: VirtIOSound card
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_pcm_prepare(VirtIOSound *s,
+                                              VirtQueueElement *elem)
+{
+    virtio_snd_pcm_hdr req;
+    size_t sz;
+
+    sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
+    assert(sz == sizeof(virtio_snd_pcm_hdr));
+
+    virtio_snd_hdr resp;
+    resp.code = virtio_snd_pcm_prepare_impl(s, req.stream_id);
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -429,7 +624,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_pcm_set_params(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_PREPARE) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_PREPARE");
+            sz = virtio_snd_handle_pcm_prepare(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_START) {
             virtio_snd_log("VIRTIO_SND_R_PCM_START");
         } else if (ctrl.code == VIRTIO_SND_R_PCM_STOP) {
-- 
2.25.1


