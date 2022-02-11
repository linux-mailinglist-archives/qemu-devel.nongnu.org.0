Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017634B30FE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:49:40 +0100 (CET)
Received: from localhost ([::1]:37684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIejS-00048Q-Kn
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:49:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeEY-0008WB-3P
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:42 -0500
Received: from [2607:f8b0:4864:20::636] (port=38422
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeES-0003UX-6Z
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:41 -0500
Received: by mail-pl1-x636.google.com with SMTP id c3so5761052pls.5
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CzckWGzCigRKzVXhEUdOKkrHP3nRB0Znf4+2cGdy/aQ=;
 b=MKacs3QhphatKYXVZnbDb1WmyRUy3etlLQ6KC8Vr0TqpgwDt34olRh8Q4OqMEO+oA7
 VIS4dD+tGzmKTr+wJnrENPFZWEjzYEbIhD4exXp/RyLvu2HHwrIf9Wfqo+0FWnVw/f2/
 BHMWahA4o9sKRPusWx8+sOowQaUaRq69NBcoc/hy0vDMVnvqUk/HyWj+KlrKoTJeHvT4
 85IJ9CLlNVBCJ5oBm6rGgVlY2CjDZkNHLz2MWWSmAvkzJuVNlM+do0dj8zmZHG+RhQN1
 3OX54g69JLwI+l7N1FLiygXsF9Rh0MKGNL6xhZ7t7I92kupnvez0/uBu+pFs9ZJFqTJ2
 2Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzckWGzCigRKzVXhEUdOKkrHP3nRB0Znf4+2cGdy/aQ=;
 b=njopFWC6492fER5+SaAGUkX6c5gyORSr2yi6SD1XVUgJQrXLTrrlsT4rQlCn/rJRlg
 jQ1961Ft+/G49oQKSYaARHPAPZVOkR7kDegJCngCK4B/qqOPC0TmXIoWN1tQYSWKKPKg
 rSACGrHWs+Tb/W62RCJ9qeeWRdj0V2OopgHvl2JkJI8+Sf9qmKlswF/VkKlWTooAU169
 XUTJ495vMjBRaawusi+HzQPbbdbX91+vxRowJPgJa77l/NzOhvygJ+PkaCz/hFinbgSf
 PKWK2fhsIio2VlvkhhHp/i3fVyorUvb2UZspkWiFyWGR0XrsfA25TSVTW3FSeEvSMKQf
 WrZA==
X-Gm-Message-State: AOAM531+nFYYkdO3uPAjvX9IDel+AsSzfYAICMLOIYCfY/pqviAJowZg
 esfVAo0qQkipAf+WRD4T8bhgRkJo5mk=
X-Google-Smtp-Source: ABdhPJzpBlbENBaT7z5D9k68HTx21FKeMPwy/qzas0nGfEE83mm8v173j7FK9RGv7lGWtgehh8NHzg==
X-Received: by 2002:a17:90b:1c8d:: with SMTP id
 oo13mr2480987pjb.201.1644617841940; 
 Fri, 11 Feb 2022 14:17:21 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:17:21 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 25/25] virtio-snd: Replaced AUD_log with tracepoints
Date: Sat, 12 Feb 2022 03:43:19 +0530
Message-Id: <20220211221319.193404-26-chouhan.shreyansh2702@gmail.com>
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

Replaced the use of AUD_log via macros in virtio sound with
tracepoints.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/trace-events | 14 +++++++++++
 hw/audio/virtio-snd.c | 55 +++++++++++++++++--------------------------
 2 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/hw/audio/trace-events b/hw/audio/trace-events
index e0e71cd9b1..a747648e4d 100644
--- a/hw/audio/trace-events
+++ b/hw/audio/trace-events
@@ -11,3 +11,17 @@ hda_audio_running(const char *stream, int nr, bool running) "st %s, nr %d, run %
 hda_audio_format(const char *stream, int chan, const char *fmt, int freq) "st %s, %d x %s @ %d Hz"
 hda_audio_adjust(const char *stream, int pos) "st %s, pos %d"
 hda_audio_overrun(const char *stream) "st %s"
+
+#virtio-snd.c
+virtio_snd_pcm_stream_flush(int stream) "flushing st %d"
+virtio_snd_handle_jack_info(int jack) "VIRTIO_SND_JACK_INFO called for jack %d"
+virtio_snd_handle_jack_remap(void) "VIRTIO_SND_PCM_JACK_REMAP called"
+virtio_snd_handle_pcm_info(int stream) "VIRTIO_SND_PCM_INFO called for stream %d"
+virtio_snd_handle_pcm_set_params(int stream) "VIRTIO_SND_PCM_SET_PARAMS called for stream %d"
+virtio_snd_handle_pcm_start(int stream) "VIRTIO_SND_PCM_START called for stream %d"
+virtio_snd_handle_pcm_stop(int stream) "VIRTIO_SND_PCM_STOP called for stream %id"
+virtio_snd_handle_pcm_release(int stream) "VIRTIO_SND_PCM_RELEASE called for stream %id"
+virtio_snd_handle_chmap_info(void) "VIRTIO_SND_CHMAP_INFO called"
+virtio_snd_output_cb(int to_play, int written) "to play: %d, written: %d"
+virtio_snd_handle_xfer(void) "tx/rx queue callback called"
+virtio_snd_handle_event(void) "event queue callback called"
diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 81a478d039..38a3b5e555 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -39,10 +39,6 @@
 #define VIRTIO_SOUND_HDA_FN_NID_OUT 0
 #define VIRTIO_SOUND_HDA_FN_NID_IN 1
 
-#define virtio_snd_log(...) AUD_log("virtio sound info", __VA_ARGS__)
-#define virtio_snd_warn(...) AUD_log("virtio sound warn", __VA_ARGS__)
-#define virtio_snd_err(...) AUD_log("virtio sound err", __VA_ARGS__)
-
 static void virtio_snd_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VirtIOSound *s = VIRTIO_SOUND(vdev);
@@ -125,7 +121,7 @@ static uint32_t virtio_snd_handle_jack_info(VirtIOSound *s,
 
     if (iov_size(elem->in_sg, elem->in_num) <
         sizeof(virtio_snd_hdr) + req.count * req.size) {
-        virtio_snd_err("jack info: buffer too small got: %lu needed: %lu\n",
+        error_report("jack info: buffer too small got: %lu needed: %lu\n",
                        iov_size(elem->in_sg, elem->in_num),
                        sizeof(virtio_snd_hdr) + req.count * req.size);
         resp.code = VIRTIO_SND_S_BAD_MSG;
@@ -134,9 +130,10 @@ static uint32_t virtio_snd_handle_jack_info(VirtIOSound *s,
 
     virtio_snd_jack_info *jack_info = g_new0(virtio_snd_jack_info, req.count);
     for (int i = req.start_id; i < req.count + req.start_id; i++) {
+        trace_virtio_snd_handle_jack_info(i);
         virtio_snd_jack *jack = virtio_snd_get_jack(s, i);
         if (!jack) {
-            virtio_snd_err("Invalid jack id: %d\n", i);
+            error_report("Invalid jack id: %d\n", i);
             resp.code = VIRTIO_SND_S_BAD_MSG;
             goto done;
         }
@@ -180,6 +177,7 @@ static uint32_t virtio_snd_handle_jack_remap(VirtIOSound *s,
     virtio_snd_hdr resp;
     resp.code = VIRTIO_SND_S_OK;
 
+    trace_virtio_snd_handle_jack_remap();
     /* TODO: implement remap */
 
     size_t sz;
@@ -202,7 +200,6 @@ static virtio_snd_pcm_stream *virtio_snd_pcm_get_stream(VirtIOSound *s,
                                                         uint32_t stream)
 {
     if (stream >= s->snd_conf.streams) {
-        virtio_snd_err("Invalid stream request %d\n", stream);
         return NULL;
     }
     return s->streams[stream];
@@ -218,7 +215,6 @@ static virtio_snd_pcm_params *virtio_snd_pcm_get_params(VirtIOSound *s,
                                                         uint32_t stream)
 {
     if (stream >= s->snd_conf.streams) {
-        virtio_snd_err("Invalid stream request %d\n", stream);
         return NULL;
     }
     return s->pcm_params[stream];
@@ -243,7 +239,7 @@ static uint32_t virtio_snd_handle_pcm_info(VirtIOSound *s,
     virtio_snd_hdr resp;
     if (iov_size(elem->in_sg, elem->in_num) <
         sizeof(virtio_snd_hdr) + req.size * req.count) {
-        virtio_snd_err("pcm info: buffer too small, got: %lu, needed: %lu\n",
+        error_report("pcm info: buffer too small, got: %lu, needed: %lu\n",
                 iov_size(elem->in_sg, elem->in_num),
                 sizeof(virtio_snd_pcm_info));
         resp.code = VIRTIO_SND_S_BAD_MSG;
@@ -253,10 +249,11 @@ static uint32_t virtio_snd_handle_pcm_info(VirtIOSound *s,
     virtio_snd_pcm_stream *stream;
     virtio_snd_pcm_info *pcm_info = g_new0(virtio_snd_pcm_info, req.count);
     for (int i = req.start_id; i < req.start_id + req.count; i++) {
+        trace_virtio_snd_handle_pcm_info(i);
         stream = virtio_snd_pcm_get_stream(s, i);
 
         if (!stream) {
-            virtio_snd_err("Invalid stream id: %d\n", i);
+            error_report("Invalid stream id: %d\n", i);
             resp.code = VIRTIO_SND_S_BAD_MSG;
             goto done;
         }
@@ -317,7 +314,7 @@ static uint32_t virtio_snd_pcm_set_params_impl(VirtIOSound *s,
     st_params->period_bytes = params->period_bytes;
 
     if (params->channel < 1 || params->channel > AUDIO_MAX_CHANNELS) {
-        virtio_snd_err("Number of channels not supported\n");
+        error_report("Number of channels not supported\n");
         return VIRTIO_SND_S_NOT_SUPP;
     }
     st_params->channel = params->channel;
@@ -346,13 +343,13 @@ static uint32_t virtio_snd_pcm_set_params_impl(VirtIOSound *s,
                                1 << VIRTIO_SND_PCM_RATE_384000;
 
     if (!(supported_formats & (1 << params->format))) {
-        virtio_snd_err("Stream format not supported\n");
+        error_report("Stream format not supported\n");
         return VIRTIO_SND_S_NOT_SUPP;
     }
     st_params->format = params->format;
 
     if (!(supported_rates & (1 << params->rate))) {
-        virtio_snd_err("Stream rate not supported\n");
+        error_report("Stream rate not supported\n");
         return VIRTIO_SND_S_NOT_SUPP;
     }
     st_params->rate = params->rate;
@@ -378,6 +375,7 @@ static uint32_t virtio_snd_handle_pcm_set_params(VirtIOSound *s,
     sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
     assert(sz == sizeof(virtio_snd_pcm_set_params));
 
+    trace_virtio_snd_handle_pcm_set_params(req.hdr.stream_id);
     virtio_snd_hdr resp;
     resp.code = virtio_snd_pcm_set_params_impl(s, &req);
 
@@ -702,7 +700,6 @@ static void virtio_snd_output_cb(void *opaque, int free)
 
     to_play = MIN(free, pending);
 
-    virtio_snd_log("to_play: %d, free: %d, pending: %d\n", to_play, free, pending);
     while (to_play) {
         int wbytes = write_audio(st, to_play);
 
@@ -715,7 +712,7 @@ static void virtio_snd_output_cb(void *opaque, int free)
         pending -= wbytes;
     }
 
-    virtio_snd_log("written: %d\n", written);
+    trace_virtio_snd_output_cb(to_play, written);
 }
 
 /*
@@ -728,7 +725,6 @@ static void virtio_snd_output_cb(void *opaque, int free)
 static uint32_t virtio_snd_pcm_prepare_impl(VirtIOSound *s, uint32_t stream)
 {
     if (!s->streams || !s->pcm_params || !s->pcm_params[stream]) {
-        virtio_snd_err("Cannot prepare stream %d without params.\n", stream);
         return VIRTIO_SND_S_BAD_MSG;
     }
 
@@ -849,6 +845,7 @@ static uint32_t virtio_snd_handle_pcm_start_stop(VirtIOSound *s,
     virtio_snd_hdr resp;
     resp.code = VIRTIO_SND_S_OK;
 
+    trace_virtio_snd_handle_pcm_stop(req.stream_id);
     virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, req.stream_id);
     if (st->direction == VIRTIO_SND_D_OUTPUT)
         AUD_set_active_out(st->voice.out, start);
@@ -871,9 +868,6 @@ static uint32_t virtio_snd_pcm_release_impl(virtio_snd_pcm_stream *st, uint32_t
 {
     // if there are still pending io messages do nothing
     if (virtio_snd_pcm_get_pending_bytes(st)) {
-        // flush the stream
-        virtio_snd_log("Started flushing stream");
-
         // set flushing to true, the callback will automatically close the
         // stream once the flushing is done
         st->flushing = true;
@@ -923,11 +917,11 @@ static uint32_t virtio_snd_handle_pcm_release(VirtIOSound *s,
     sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
     assert(sz == sizeof(virtio_snd_pcm_hdr));
 
-    virtio_snd_log("Release called\n");
+    trace_virtio_snd_handle_pcm_release(req.stream_id);
 
     virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, req.stream_id);
     if (!st) {
-        virtio_snd_err("already released %d\n", req.stream_id);
+        error_report("already released stream %d", req.stream_id);
         return VIRTIO_SND_S_BAD_MSG;
     }
 
@@ -961,7 +955,7 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
         if (iov_size(elem->in_sg, elem->in_num) < sizeof(resp) ||
                 iov_size(elem->out_sg, elem->out_num) < sizeof(ctrl)) {
-            virtio_snd_err("virtio-snd ctrl missing headers\n");
+            error_report("virtio-snd ctrl missing headers\n");
             virtqueue_detach_element(vq, elem, 0);
             g_free(elem);
             break;
@@ -974,7 +968,7 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
         if (sz != sizeof(ctrl)) {
             /* error */
-            virtio_snd_err("virtio snd ctrl could not read header\n");
+            error_report("virtio snd ctrl could not read header\n");
             resp.code = VIRTIO_SND_S_BAD_MSG;
         } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
             sz = virtio_snd_handle_jack_info(s, elem);
@@ -993,10 +987,10 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
             sz = virtio_snd_handle_pcm_release(s, elem);
         } else if (ctrl.code == VIRTIO_SND_R_CHMAP_INFO) {
-            virtio_snd_log("VIRTIO_SND_R_CHMAP_INFO");
+            trace_virtio_snd_handle_chmap_info();
         } else {
             /* error */
-            virtio_snd_err("virtio snd header not recognized: %d\n", ctrl.code);
+            error_report("virtio snd header not recognized: %d\n", ctrl.code);
             resp.code = VIRTIO_SND_S_BAD_MSG;
         }
 
@@ -1023,8 +1017,6 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 static void virtio_snd_pcm_add_buf(VirtIOSound *s, uint32_t stream,
                                    VirtQueueElement *elem)
 {
-    virtio_snd_log("add_buf called\n");
-
     virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, stream);
     uint32_t buf_size, dir;
     int i;
@@ -1054,12 +1046,13 @@ static void virtio_snd_pcm_add_buf(VirtIOSound *s, uint32_t stream,
  */
 static void virtio_snd_handle_xfer(VirtIODevice *vdev, VirtQueue *vq)
 {
-    virtio_snd_log("tx/rx queue callback called\n");
     VirtIOSound *s = VIRTIO_SOUND(vdev);
     VirtQueueElement *elem;
     size_t sz;
     virtio_snd_pcm_xfer hdr;
 
+    trace_virtio_snd_handle_xfer();
+
     for (;;) {
         elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
         if (!elem) {
@@ -1089,7 +1082,7 @@ static void virtio_snd_handle_xfer(VirtIODevice *vdev, VirtQueue *vq)
  */
 static void virtio_snd_handle_event(VirtIODevice *vdev, VirtQueue *vq)
 {
-    virtio_snd_log("event queue callback called\n");
+    trace_virtio_snd_handle_event();
 }
 
 /*
@@ -1245,8 +1238,4 @@ static void virtio_register_types(void)
     type_register_static(&virtio_snd_dev_info);
 }
 
-#undef virtio_snd_log
-#undef virtio_snd_warn
-#undef virtio_snd_err
-
 type_init(virtio_register_types)
-- 
2.31.1


