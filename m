Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B32B4B30C9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:38:00 +0100 (CET)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeYA-00043S-SQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:37:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeDa-0007uy-0Y
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:42 -0500
Received: from [2607:f8b0:4864:20::42c] (port=46900
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeDX-0003Pj-SK
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:16:41 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i21so17127742pfd.13
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Faef91Kdn3mtYvJYIByHGEH6KrFfsSXC/7T24yfpM+A=;
 b=OV2pZE7i+tWaDcqeRSTAKSfkMpOKLXIkHt7Bw/daIgLtRK5udvxa2nn3MUAIZ51Afh
 5xMOUSNe/TZrJjnO+UQTxUT7NTD9unOUiGSgMJlSkV6wgTlaAqbvd/RELPijpcD3E2yA
 k0ElGrFgno452Arx13d/mDHo6Ah6+Cu6fGwWTw3+zj0xs+sEYD8WJQKGeICaqa6xkaHV
 ej/nlDVOG0FEwJR9KUFeUrlAaAcgqgFdIoheNwVO5nHQ8YZ3AgOZL9j+55bx/1AVkqm2
 1qAQWcWo8fPn6dr30cabRMldIi3hJ17aDWGmZi5bPRUZDTDlGTzeKuAu5dp48KfwGLBj
 MR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Faef91Kdn3mtYvJYIByHGEH6KrFfsSXC/7T24yfpM+A=;
 b=XNNt3u2HIs3u19vY0zt7LaNdjBHVfjSyMuK7FyXKUVQJhZc6f9tU413hGeYRYZpkuw
 i8Pag3Bop1MEq6yaUVZ8IG/H8OYixcQABzFr/1OlcQhFdzJMAD9KGoSm6F/vG/xcGiJ3
 6QwsXnacY9CjhFpUiFyUFcsewdypJKz4TvusqIGN3Ane9mBeMQ2EOLDCeb0UoTCixc8T
 dy+7y1a4aRDNihh0qadruWBiocyo1k+kzPMHGmT17QCk/rE7RoYZPOhbKKWz9rVO577F
 hi3zqw1ob+1xXWG4gquLSTIdu+EDWKF1rCq2bWTABULobvWC/9T7KPKoLWqSoA5VX38b
 X8Yw==
X-Gm-Message-State: AOAM530V2YcIQhCuLH1klUm4/4YuFwDn8QWJUkXZ+GZDzvxmaYnP9J9b
 1ta+KfPuJ7eBf32RUD2XlNo=
X-Google-Smtp-Source: ABdhPJxCspGSiqvnx/fqCObH5L6t5utBIalRfy6PQVUKea/qaXiTj7w3ZHq+3NAkTDyp90Aev0ET2A==
X-Received: by 2002:a63:6c43:: with SMTP id h64mr3051077pgc.72.1644617798565; 
 Fri, 11 Feb 2022 14:16:38 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:16:38 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 19/25] virtio-snd: Add start/stop handler
Date: Sat, 12 Feb 2022 03:43:13 +0530
Message-Id: <20220211221319.193404-20-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42c.google.com
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

Added handlers for VIRTIO_SND_PCM_START and VIRTIO_SND_PCM_STOP.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index b74c9e4a1f..1b3e1f75f4 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -828,6 +828,36 @@ static uint32_t virtio_snd_handle_pcm_prepare(VirtIOSound *s,
     return sz;
 }
 
+/*
+ * Handles VIRTIO_SND_R_PCM_START.
+ * The function writes the response to the virtqueue element.
+ * Returns the used size in bytes.
+ *
+ * @s: VirtIOSound card
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_pcm_start_stop(VirtIOSound *s,
+                                                 VirtQueueElement *elem,
+                                                 bool start)
+{
+    virtio_snd_pcm_hdr req;
+    size_t sz;
+
+    sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
+    assert(sz == sizeof(virtio_snd_pcm_hdr));
+
+    virtio_snd_hdr resp;
+    resp.code = VIRTIO_SND_S_OK;
+
+    virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, req.stream_id);
+    if (st->direction == VIRTIO_SND_D_OUTPUT)
+        AUD_set_active_out(st->voice.out, start);
+
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -882,9 +912,10 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_pcm_prepare(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_START) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_START");
+            sz = virtio_snd_handle_pcm_start_stop(s, elem, true);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_STOP) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_STOP");
+            sz = virtio_snd_handle_pcm_start_stop(s, elem, false);
         } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
             virtio_snd_log("VIRTIO_SND_R_PCM_RELEASE");
         } else if (ctrl.code == VIRTIO_SND_R_CHMAP_INFO) {
-- 
2.31.1


