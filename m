Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F84B3066
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:26:38 +0100 (CET)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeNB-0002Wo-0d
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:26:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeDD-0007Ur-BL
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:19 -0500
Received: from [2607:f8b0:4864:20::433] (port=36470
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeDB-0003NR-If
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:19 -0500
Received: by mail-pf1-x433.google.com with SMTP id u16so12901471pfg.3
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKiWY6YdEhJQCXe0WvxM2zvB0qdzAuQNjewtFe18rH0=;
 b=FBQ2hnH0RtqqFesOrvg85LHY+2XSh1RjZkvscTEa7+pBQlnZS8dt70fWegP1/XrkVf
 wYOJbfgVvVUG3JfO7NEMO2XUqiS5aPn+KM3HEE+tsD7Qdp8uGQUBDzjJe4ZVyq8wlvUM
 yil6Sml+oX1qWzjWbOkMl95asb4laklgk/Ldp86t3IOj4Y1KZr43SuHRdmK8l0JtP+fW
 XYhUey+HoCQycCeK3pxWpfTroWBo2EZVlHTQorSNjOVfM1Eqi4QzecPE8EiNQooaxbYi
 lLN3cclGaIN41YT0zvI6hzHO04W2B1ClAIx/HIfPjqwmkLmIUlOJnrSXbGT0c4Pmq0mc
 tBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKiWY6YdEhJQCXe0WvxM2zvB0qdzAuQNjewtFe18rH0=;
 b=h5nzpwB9f22nZ1B4WioI9IGcDtHkgyy5mcBteXTqpzY8l18++dZu+vljPiFhLL5H7Q
 E3enMcd4cXptqo3n+k2f4ccMxIAspgJwPQAOsv+tWRQz8C/yag4OgUEOH52g12hIF+fD
 vbCD8VghEUZoPag3ZUR1ZOFyQljvDvcHfienr+2kzsEomYFXqPp/gr/nte9PTPEaijUn
 TCHGG9ErNwNMpmtKKh23hhV3Kriszdt2tW+gW70unqSnMmzIL1yxBnULB6eWfKczqHBp
 IHYaS3kuYf/LaLPKCzHx2Tbjp8/FmnA8/A8RTYwEhqR/+vE+KGcNrkQdfFCNO054zX+T
 EhSQ==
X-Gm-Message-State: AOAM533ToY4KT1FyLKcGeBWjf4X1acSCTBLbWQ9/a/XAjUDFCg8uEDK0
 Hp/J//r/BTK3gjDXUuLppoGBagyCmrE=
X-Google-Smtp-Source: ABdhPJwzRpki7UYPDt1NI3i6ljyowhhLX8gi8YS1+jSo6R0aepm3npaK6TH13PMNM9Ui8qs/iLbW1A==
X-Received: by 2002:a62:3603:: with SMTP id d3mr3679022pfa.2.1644617776328;
 Fri, 11 Feb 2022 14:16:16 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:16:15 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 16/25] virtio-snd: Add VIRTIO_SND_R_PCM_PREPARE handler
Date: Sat, 12 Feb 2022 03:43:10 +0530
Message-Id: <20220211221319.193404-17-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x433.google.com
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

The handler doesn't intialize the SWVoiceOut streams for now.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 203 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 202 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index acb126f392..b7c4dc691d 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -386,6 +386,206 @@ static uint32_t virtio_snd_handle_pcm_set_params(VirtIOSound *s,
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
+    virtio_snd_pcm_params *params = virtio_snd_pcm_get_params(s, stream);
+    virtio_snd_pcm_stream *st = g_new0(virtio_snd_pcm_stream, 1);
+    st->hda_fn_nid = VIRTIO_SOUND_HDA_FN_NID_OUT;
+    st->features = 0;
+    st->direction = stream < s->snd_conf.streams / 2 + (s->snd_conf.streams & 1) ?
+                    VIRTIO_SND_D_OUTPUT : VIRTIO_SND_D_INPUT;
+    st->channels_min = 1;
+    st->channels_max = AUDIO_MAX_CHANNELS;
+    st->formats = supported_formats;
+    st->rates = supported_rates;
+    st->s = s;
+
+    st->buffer_bytes = params->buffer_bytes;
+    st->period_bytes = params->period_bytes;
+
+    st->chmap[0] = VIRTIO_SND_CHMAP_FL;
+    st->chmap[1] = VIRTIO_SND_CHMAP_FR;
+
+    st->flushing = false;
+
+    audsettings as;
+    virtio_snd_get_qemu_audsettings(&as, params);
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
@@ -437,7 +637,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
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
2.31.1


