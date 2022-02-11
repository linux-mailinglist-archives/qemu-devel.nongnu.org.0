Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDB94B306B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:28:25 +0100 (CET)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeOu-0005Lb-6l
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:28:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE8-0008HV-KL
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:16 -0500
Received: from [2607:f8b0:4864:20::1036] (port=35535
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE4-0003S6-Os
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:16 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso13283927pjg.0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jcgKVdBYGz26iJeK3I58GmgBcZbgtQiGq0IgH+jovVI=;
 b=QXRLo02SCKYwO5OVn/qPEINHcDeo/vTBji5kAw3vDjkjKI3vyNQmvymCK7bLxlsEcV
 HNsYW6RXKyqnbEA5WTEP188NdhRCnjftDUlvt8lbpSEojE2nm+lRouXF6j+FWze1KySq
 xbMYtvXbXIomw12n/rZLQKAAtyobKii7XNjgoAb5VC+gdS5Ym8IipnLbqg2NXAKBBW3A
 MbNhW3FC2EZiR5TAAt4qa+8Oucvf4unZplaiGBKHYwOZ0Vw2pG3JwTRVWPQrnzXhEHz9
 4fziHKuCluzSG+T0AN2PNI9txOfvnlgfnnqEnvExPlt7iEIMUDLOcJtyLQ2Ent9qUypo
 8ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcgKVdBYGz26iJeK3I58GmgBcZbgtQiGq0IgH+jovVI=;
 b=j9MkdL3zl4WPQ4KhM1Pucm34ApdXkS+VVkSuOcwswH/dGheT4rHfj973xSRT98W7Yr
 Qw1MchdjCawWTIRTUVzeZRxNGlwIbraY9UX2XMgeGBplbCu8QnwDAzq7FMc/7Chaqx00
 JjAVt1XCs3oRN+JqsFamINWgZaqrEwPvBmq6Q0+2pEG6sTLjzK33F3Tyv32jX18nrF9o
 9GlcIPJ2qgp/+ET34vNj2D5oFe0P/oKpJo4Zoip5kJfMzT8ROsvw9lQ4XudEri7yFzmG
 4+KfvQsd/+EoNRxzpfYSnA+5uss1CYniNPm+WXqibvNp52xu3KaHuWVzZE8HBrDmesnW
 Q5nQ==
X-Gm-Message-State: AOAM530bWRFiFnVShE2yIrDJdrzIROX5NS9pnfQ+xxCB23JJXHWSuIlt
 Fm7Z6WEez65ZvLqQeAl5S6s=
X-Google-Smtp-Source: ABdhPJzRtY0RWdIVGkvDxgHDjePbd5QND5S9Mcuh7iDRJ9mxivgFgtnSs1peyAb+nG7j6CiNSVAGbQ==
X-Received: by 2002:a17:90a:601:: with SMTP id
 j1mr2560600pjj.192.1644617809164; 
 Fri, 11 Feb 2022 14:16:49 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:16:48 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 20/25] virtio-snd: Add VIRTIO_SND_R_PCM_RELEASE handler
Date: Sat, 12 Feb 2022 03:43:14 +0530
Message-Id: <20220211221319.193404-21-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1036.google.com
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
 hw/audio/virtio-snd.c | 82 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 1b3e1f75f4..7b80a92737 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -858,6 +858,85 @@ static uint32_t virtio_snd_handle_pcm_start_stop(VirtIOSound *s,
     return sz;
 }
 
+/*
+ * Releases the resources allocated to a stream. Sepearated from the handler
+ * so that the code could be reused in the unrealize function.
+ *
+ * TODO: Doesn't handle the stream buffers that are yet to be played.
+ *
+ * @s: VirtIOSound card
+ * @stream: stream id
+ */
+static uint32_t virtio_snd_pcm_release_impl(virtio_snd_pcm_stream *st, uint32_t stream)
+{
+    // if there are still pending io messages do nothing
+    if (virtio_snd_pcm_get_pending_bytes(st)) {
+        // flush the stream
+        virtio_snd_log("Started flushing stream");
+
+        // set flushing to true, the callback will automatically close the
+        // stream once the flushing is done
+        st->flushing = true;
+
+        if (st->direction == VIRTIO_SND_D_OUTPUT)
+            AUD_set_active_out(st->voice.out, true);
+        else
+            AUD_set_active_in(st->voice.in, true);
+        return VIRTIO_SND_S_OK;
+    }
+
+    if (st->direction == VIRTIO_SND_D_OUTPUT)
+        AUD_close_out(&st->s->card, st->voice.out);
+    else
+        AUD_close_in(&st->s->card, st->voice.in);
+
+    if (st->elems) {
+        int nelems = virtio_snd_pcm_get_nelems(st);
+        for (int i = 0; i < nelems; i++) {
+            g_free(st->elems[i]);
+            st->elems[i] = NULL;
+        }
+        g_free(st->elems);
+        st->elems = NULL;
+    }
+
+    g_free(st->s->streams[stream]);
+    st->s->streams[stream] = NULL;
+    return VIRTIO_SND_S_OK;
+}
+
+/*
+ * Handles VIRTIO_SND_R_PCM_RELEASE.
+ * The function writes the response to the virtqueue element.
+ * Returns the used size in bytes.
+ * TODO: Doesn't handle the stream buffers that are yet to be played.
+ *
+ * @s: VirtIOSound card
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_pcm_release(VirtIOSound *s,
+                                              VirtQueueElement *elem)
+{
+    virtio_snd_pcm_hdr req;
+    virtio_snd_hdr resp;
+    size_t sz;
+    sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
+    assert(sz == sizeof(virtio_snd_pcm_hdr));
+
+    virtio_snd_log("Release called\n");
+
+    virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, req.stream_id);
+    if (!st) {
+        virtio_snd_err("already released %d\n", req.stream_id);
+        return VIRTIO_SND_S_BAD_MSG;
+    }
+
+    resp.code = virtio_snd_pcm_release_impl(st, req.stream_id);
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -917,9 +996,10 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         } else if (ctrl.code == VIRTIO_SND_R_PCM_STOP) {
             sz = virtio_snd_handle_pcm_start_stop(s, elem, false);
         } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_RELEASE");
+            sz = virtio_snd_handle_pcm_release(s, elem);
         } else if (ctrl.code == VIRTIO_SND_R_CHMAP_INFO) {
             virtio_snd_log("VIRTIO_SND_R_CHMAP_INFO");
+            goto done;
         } else {
             /* error */
             virtio_snd_err("virtio snd header not recognized: %d\n", ctrl.code);
-- 
2.31.1


