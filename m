Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C664B309C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:34:33 +0100 (CET)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeUq-0008R7-3C
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeDU-0007qk-9T
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:36 -0500
Received: from [2607:f8b0:4864:20::42e] (port=35695
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeDQ-0003Oq-Pf
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:35 -0500
Received: by mail-pf1-x42e.google.com with SMTP id l19so12796487pfu.2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R+gZanYvSiYsqszSadoV2CrOjIuLLkH7qYIDt5MtvJU=;
 b=CGicqu2/0PQbEpzTymh8m65uBsDmNEYQYaa95g0S/WjZkY8pzZytRG/zKJ1xxhrQXr
 F/NOs73jSpKjvb/uUt5D5LoQqIMTcVe/ShSXBZqlkCBU301VqWAEb0N5EKfzaIReXK6O
 fP+Vtc8HDvLASe4S8FeCMFYPeU7KVARuKDH29SDxtLkYshXd1pT5MVMW/6paii+zlYGY
 P1DXI1udNBQOEoEzTYOqFueYSpel/ZQ6/ATze3IKZ/p+GMNKHJ/fi/zNnptz4f9e+h2N
 eVZhCdCnatseN0gSE49VuC48Tf0T98yIMz0uyMZnkI6jJwnR8KOiSBiSpimk0rd2hvNY
 5yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+gZanYvSiYsqszSadoV2CrOjIuLLkH7qYIDt5MtvJU=;
 b=JlplCjjsf0EM5cqdKlZwWxitPh0j3LjSkkdXQhtbV66Q015oscmlYYuPxMbG6upQxy
 oQLbmmckJoOPfTvyMGNypLmYYNw2m3NK6PeudFpnbXab5WzD/RIOpdCbXENDTiNf20gB
 1sxJtskLrp4NsLoS7vxv9o0NWeZqKpBcUZQ4SvaJsjF7W20wDzsO400dHZ8hyhvgyCwK
 RQP6FqoF7RXqHK+T0fOOvftEdW9ylxKFjpFt6mIOooo7LWrB1HvOU5Fga8CltMwEGELL
 BbBAsbwB16ptJ9kL7kgE/APfWoNCaMgFQ0PTC+rSLZMDdrpIWGEQfEsUB7XxJ6erHt83
 C1uw==
X-Gm-Message-State: AOAM532n8Edr/mle1KwKhdv81pc8w0jigDi8gEHsvJ0AvWEvlzHysnBS
 5J45/Ohowvpj7IelDaT6bwI=
X-Google-Smtp-Source: ABdhPJwUkHMIp7wy4BKRiN1PoXxQKJX629Gybz5F26VqlmXgEQtcY72FkqnQITB39wsults1xAWWGQ==
X-Received: by 2002:a63:257:: with SMTP id 84mr2985016pgc.121.1644617791455;
 Fri, 11 Feb 2022 14:16:31 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:16:31 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 18/25] virtio-snd: Add callback for SWVoiceOut
Date: Sat, 12 Feb 2022 03:43:12 +0530
Message-Id: <20220211221319.193404-19-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42e.google.com
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

Added the callback for writing audio using AUD_write. The callback uses
two helper functions for reading the buffers from the streams and
handling the buffers that were written. initialized the
SWVoiceOut using this callback.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 254 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 248 insertions(+), 6 deletions(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 5ed8e524a6..b74c9e4a1f 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -476,6 +476,248 @@ static int virtio_snd_pcm_get_nelems(virtio_snd_pcm_stream *st)
            + !!(st->buffer_bytes % st->period_bytes);
 }
 
+static uint32_t virtio_snd_pcm_get_buf_pos(virtio_snd_pcm_stream *st,
+                                           uint32_t dir)
+{
+    return (dir == VIRTIO_SND_D_OUTPUT) ? st->w_pos : st->r_pos;
+}
+
+static uint32_t virtio_snd_pcm_get_curr_elem(virtio_snd_pcm_stream *st,
+                                            uint32_t dir)
+{
+    uint32_t pos;
+    int nelems;
+
+    nelems = virtio_snd_pcm_get_nelems(st);
+    pos = virtio_snd_pcm_get_buf_pos(st, dir);
+
+    return (pos / st->period_bytes) % nelems;
+}
+
+static uint32_t virtio_snd_pcm_get_curr_elem_cap(virtio_snd_pcm_stream *st,
+                                                 uint32_t dir)
+{
+    uint32_t cap_bytes;
+    int i;
+
+    i = virtio_snd_pcm_get_curr_elem(st, dir);
+
+    if (dir == VIRTIO_SND_D_OUTPUT)
+        cap_bytes = iov_size(st->elems[i]->out_sg, st->elems[i]->out_num)
+                    - sizeof(virtio_snd_pcm_xfer);
+    else
+        cap_bytes = iov_size(st->elems[i]->in_sg, st->elems[i]->in_num)
+                    - sizeof(virtio_snd_pcm_status);
+
+    return cap_bytes;
+}
+
+static uint32_t virtio_snd_pcm_get_curr_elem_used(virtio_snd_pcm_stream *st,
+                                                  uint32_t dir)
+{
+    uint32_t pos;
+
+    pos = virtio_snd_pcm_get_buf_pos(st, dir);
+
+    return pos % st->period_bytes;
+}
+
+static uint32_t virtio_snd_pcm_get_curr_elem_free(virtio_snd_pcm_stream *st,
+                                                  uint32_t dir)
+{
+    uint32_t free_bytes, used;
+
+    used = virtio_snd_pcm_get_curr_elem_used(st, dir);
+    free_bytes = virtio_snd_pcm_get_curr_elem_cap(st, dir) - used;
+
+    return free_bytes;
+}
+
+/*
+ * Get the size in bytes of the buffer that still has to be written.
+ *
+ * @st: virtio sound pcm stream
+ */
+static uint32_t virtio_snd_pcm_get_pending_bytes(virtio_snd_pcm_stream *st)
+{
+    return (st->direction == VIRTIO_SND_D_OUTPUT) ?
+            st->r_pos - st->w_pos :
+            st->w_pos - st->r_pos;
+}
+
+static uint32_t virtio_snd_pcm_get_buf_to_proc(virtio_snd_pcm_stream *st,
+                                               size_t size)
+{
+    uint32_t to_proc, elem_free;
+
+    elem_free = virtio_snd_pcm_get_curr_elem_free(st, st->direction);
+    to_proc = MIN(elem_free, size);
+
+    return to_proc;
+}
+
+static void virtio_snd_pcm_update_buf_pos(virtio_snd_pcm_stream *st, uint32_t dir,
+                                          uint32_t size)
+{
+    if (dir == VIRTIO_SND_D_OUTPUT)
+        st->w_pos += size;
+    else
+        st->r_pos += size;
+}
+
+/*
+ * Get data from a stream of the virtio sound device. Only reads upto the
+ * end of the current virtqueue element. Returns the number of bytes read.
+ *
+ * @buffer: Write to this buffer
+ * @size: The number of bytes to read
+ * @st: VirtIOSound card stream
+ * @offset: Start reading from this offseta in the stream (in bytes)
+ */
+static size_t virtio_snd_pcm_buf_read(void *buf, size_t to_read,
+                                  virtio_snd_pcm_stream *st)
+{
+    size_t sz;
+    int i, used;
+
+    used = virtio_snd_pcm_get_curr_elem_used(st, st->direction);
+    i = virtio_snd_pcm_get_curr_elem(st, st->direction);
+
+    sz = iov_to_buf(st->elems[i]->out_sg, st->elems[i]->out_num,
+                    sizeof(virtio_snd_pcm_xfer) + used, buf, to_read);
+
+    assert(sz == to_read);
+    return sz;
+}
+
+/*
+ * Marks an element as used, pushes it to queue and notifies the device.
+ * Also frees the element
+ */
+static void virtio_snd_pcm_handle_elem_used(virtio_snd_pcm_stream *st)
+{
+    int elem_size, i;
+    size_t sz, offset;
+
+    virtio_snd_pcm_status status;
+    status.status = VIRTIO_SND_S_OK;
+    status.latency_bytes = 0;
+
+    i = virtio_snd_pcm_get_curr_elem(st, st->direction);
+    elem_size = iov_size(st->elems[i]->out_sg, st->elems[i]->out_num)
+                + iov_size(st->elems[i]->in_sg, st->elems[i]->in_num);
+    offset = iov_size(st->elems[i]->in_sg, st->elems[i]->in_num)
+             - sizeof(virtio_snd_pcm_status);
+
+    sz = iov_from_buf(st->elems[i]->in_sg, st->elems[i]->in_num, offset,
+                      &status, sizeof(status));
+    assert(sz == sizeof(virtio_snd_pcm_status));
+
+    virtqueue_push(st->s->tx_vq, st->elems[i], elem_size);
+    virtio_notify(VIRTIO_DEVICE(st->s), st->s->tx_vq);
+
+    g_free(st->elems[i]);
+    st->elems[i] = NULL;
+}
+
+/*
+ * Handle a buffer after it has been written by AUD_write.
+ * It writes the status for the I/O messages that have been completed and
+ * marks the tx virtqueue elmenets as used. It notifies the device
+ * about I/O completion. Returns the number of bytes handled.
+ *
+ * @st: VirtIOSound card stream
+ * @size: Size that was written by AUD_write
+ *        If size = 0, write for the last element failed
+ */
+static size_t virtio_snd_pcm_handle_used(virtio_snd_pcm_stream *st,
+                                         size_t size)
+{
+    if (size == 0)
+        // error
+        return 0;
+
+    size_t used, elem_buf_size;
+
+    used = virtio_snd_pcm_get_curr_elem_used(st, st->direction);
+    elem_buf_size = virtio_snd_pcm_get_curr_elem_cap(st, st->direction);
+
+    if (used + size == elem_buf_size)
+        virtio_snd_pcm_handle_elem_used(st);
+
+    virtio_snd_pcm_update_buf_pos(st, st->direction, size);
+
+    return size;
+}
+
+/*
+ * Writes upto the end of the current virtqueue element.
+ * Returns the numbre of bytes written.
+ *
+ * @st: Virtio sound card stream
+ * @size: Number of bytes to write to HWVoiceOut
+ */
+static size_t write_audio(virtio_snd_pcm_stream *st,
+                                     uint32_t size)
+{
+    size_t to_write, handled, written;
+    void *mixbuf;
+
+    to_write = virtio_snd_pcm_get_buf_to_proc(st, size);
+    mixbuf = g_malloc0(to_write);
+    to_write = virtio_snd_pcm_buf_read(mixbuf, to_write, st);
+    written = AUD_write(st->voice.out, mixbuf, to_write);
+    handled = virtio_snd_pcm_handle_used(st, written);
+    assert(handled == written);
+
+    g_free(mixbuf);
+    return written;
+}
+
+/*
+ * Callback for AUD_open_out.
+ * Reads a buffer from the VirtIOSound card stream and writes it
+ * using AUD_write.
+ *
+ * @opaque: VirtIOSound card stream
+ * @free: Size in bytes that can be written via AUD_write
+ */
+static void virtio_snd_output_cb(void *opaque, int free)
+{
+    int to_play, pending;
+    virtio_snd_pcm_stream *st = opaque;
+    int written = 0;
+
+    pending = virtio_snd_pcm_get_pending_bytes(st);
+
+    if (!pending && st->flushing) {
+        st->flushing = false;
+
+        if (st->direction == VIRTIO_SND_D_OUTPUT)
+            AUD_set_active_out(st->voice.out, false);
+        else
+            AUD_set_active_in(st->voice.in, false);
+        return;
+    }
+
+    to_play = MIN(free, pending);
+
+    virtio_snd_log("to_play: %d, free: %d, pending: %d\n", to_play, free, pending);
+    while (to_play) {
+        int wbytes = write_audio(st, to_play);
+
+        if (!wbytes)
+            break;
+
+        to_play -= wbytes;
+        free -= wbytes;
+        written += wbytes;
+        pending -= wbytes;
+    }
+
+    virtio_snd_log("written: %d\n", written);
+}
+
 /*
  * Prepares a VirtIOSound card stream.
  * Returns a virtio sound status (VIRTIO_SND_S_*).
@@ -537,12 +779,12 @@ static uint32_t virtio_snd_pcm_prepare_impl(VirtIOSound *s, uint32_t stream)
     virtio_snd_get_qemu_audsettings(&as, params);
 
     if (st->direction == VIRTIO_SND_D_OUTPUT) {
-        /* st->voice.out = AUD_open_out(&s->card,
-         *                              st->voice.out,
-         *                              "virtio_snd_card",
-         *                              st,
-         *                              virtio_snd_output_cb, &as);
-         */
+        st->voice.out = AUD_open_out(&s->card,
+                                     st->voice.out,
+                                     "virtio_snd_card",
+                                     st,
+                                     virtio_snd_output_cb, &as);
+
     } else {
         /* st->voice.in = AUD_open_in(&s->card,
          *                            st->voice.in,
-- 
2.31.1


