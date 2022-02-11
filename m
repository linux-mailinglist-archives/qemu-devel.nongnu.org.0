Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555874B3076
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:31:45 +0100 (CET)
Received: from localhost ([::1]:42362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeS8-00043Q-Fz
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:31:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCf-0006i7-3m
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:45 -0500
Received: from [2607:f8b0:4864:20::632] (port=44589
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCc-0003Ig-OE
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:44 -0500
Received: by mail-pl1-x632.google.com with SMTP id y18so5734036plb.11
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iceLQWqrwhvZQY4LbzeSdb7PUfk0jiwUs6JgPBejn/4=;
 b=Kyajiu++W5if+VoVElHnijP8e2tTptO53MVxgcUGc7vydnwUm8Nfz0FEwOoH6Kh7DB
 ta4ptH6TESKIdF6Lgsu8OxWftIIPeJ54J8vQCUtxJcLSwRmscPU17Jgn4dt8hcmYAWgL
 StdoDAwysoX6evDF1b+Lp7jcUb+zTPfybo7DD9ofvOdyq2kG1BmcAmrP2XzWgixo7H+a
 NP7G/M5Vjvwz1eNC7hpOTvMBIbj6rQQ0gRDJ2ha9PjoJ92tUGtxI2cxGzgLy0v2ilBWJ
 7fqB/gQKZA3isnq5JYg384mw0PPBsY9sPhg6ezyJ0umV4f/f718/CRSTfiApswKUKSqm
 5jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iceLQWqrwhvZQY4LbzeSdb7PUfk0jiwUs6JgPBejn/4=;
 b=xDc5O3DIufkDarGHjNOZ8cjoHfocyIDIVv56L6nOzq5h5gS0tW3QP7g/vhA0iwhVYT
 9Y153pT1CXsgtaeA3bnADEb+5GN6QX34dVZ2QffkF74pCsZBUC9bGri09beAwjtxxZvV
 RsjDwp0vaqzI4jaf5z/ZB/7bHGBHWh84b5h6Ctk4+g0n/TP4UgVVWvnNWbK3ytA4EQxi
 m+InqXxmc++vbF1t+E4wuUXydPtSddXUPtaZlTF5+5k7ywiG8ph0WTekjN98CsYZ0Cox
 1kGasxo1133vAL4XxtJK1IoAb2CtGn7vsph+09AwDFhhJNchF9fFt2n2gk1gL3Iejh7K
 nzIg==
X-Gm-Message-State: AOAM531yroFtgr2Tmv/A3OdzafMhV9MK5OCDDQzr02qEBKYYGg3U7PIr
 oU7FRLlXTSQAWyZuBjCDzBrpxWoZ+O4=
X-Google-Smtp-Source: ABdhPJxPe484hFqJbDQht7tC+yJSH5ltK/5/usrasaHxLHVvBgi4KyLOBEpqe+dcDsoo2oR2Lv6qnw==
X-Received: by 2002:a17:902:d4c1:: with SMTP id
 o1mr3582593plg.167.1644617741394; 
 Fri, 11 Feb 2022 14:15:41 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:41 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 11/25] virtio-snd: Add control virtqueue handler
Date: Sat, 12 Feb 2022 03:43:05 +0530
Message-Id: <20220211221319.193404-12-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x632.google.com
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

The handler prints the requests that came in the ctrl virtqueue.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 40829fa329..a87922f91b 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -93,6 +93,77 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
     return vdev->host_features;
 }
 
+/* The control queue handler. Pops an element from the control virtqueue,
+ * checks the header and performs the requested action. Finally marks the
+ * element as used.
+ *
+ * @vdev: VirtIOSound card device
+ * @vq: Control virtqueue
+ */
+static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
+{
+    virtio_snd_hdr ctrl;
+
+    VirtQueueElement *elem = NULL;
+    size_t sz;
+    struct iovec *iov, *iov2;
+    unsigned int iov_cnt;
+
+    for (;;) {
+        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
+        if (!elem) {
+            break;
+        }
+        if (iov_size(elem->in_sg, elem->in_num) < sizeof(ctrl) ||
+                iov_size(elem->out_sg, elem->out_num) < sizeof(ctrl)) {
+            virtio_snd_err("virtio-snd ctrl missing headers\n");
+            virtqueue_detach_element(vq, elem, 0);
+            g_free(elem);
+            break;
+        }
+
+        iov_cnt = elem->out_num;
+        iov2 = iov = g_memdup(elem->out_sg,
+                              sizeof(struct iovec) * elem->out_num);
+        sz = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
+        iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
+        if (sz != sizeof(ctrl)) {
+            /* error */
+            virtio_snd_err("virtio snd ctrl could not read header\n");
+        } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
+            virtio_snd_log("VIRTIO_SND_R_JACK_INFO");
+        } else if (ctrl.code == VIRTIO_SND_R_JACK_REMAP) {
+            virtio_snd_log("VIRTIO_SND_R_JACK_REMAP");
+        } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
+            virtio_snd_log("VIRTIO_SND_R_PCM_INFO");
+        } else if (ctrl.code == VIRTIO_SND_R_PCM_SET_PARAMS) {
+            virtio_snd_log("VIRTIO_SND_R_PCM_SET_PARAMS");
+        } else if (ctrl.code == VIRTIO_SND_R_PCM_PREPARE) {
+            virtio_snd_log("VIRTIO_SND_R_PCM_PREPARE");
+        } else if (ctrl.code == VIRTIO_SND_R_PCM_START) {
+            virtio_snd_log("VIRTIO_SND_R_PCM_START");
+        } else if (ctrl.code == VIRTIO_SND_R_PCM_STOP) {
+            virtio_snd_log("VIRTIO_SND_R_PCM_STOP");
+        } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
+            virtio_snd_log("VIRTIO_SND_R_PCM_RELEASE");
+        } else if (ctrl.code == VIRTIO_SND_R_CHMAP_INFO) {
+            virtio_snd_log("VIRTIO_SND_R_CHMAP_INFO");
+        } else {
+            /* error */
+            virtio_snd_err("virtio snd header not recognized: %d\n", ctrl.code);
+        }
+
+        virtio_snd_hdr resp;
+        resp.code = VIRTIO_SND_S_OK;
+        sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+        virtqueue_push(vq, elem, sz);
+
+        virtio_notify(vdev, vq);
+        g_free(iov2);
+        g_free(elem);
+    }
+}
+
 /*
  * Initializes the VirtIOSound card device. Validates the configuration
  * passed by the command line. Initializes the virtqueues. Allocates resources
@@ -127,6 +198,8 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     /* set up QEMUSoundCard and audiodev */
     AUD_register_card ("virtio_snd_card", &s->card);
 
+    s->ctrl_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_ctrl);
+
     s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
     s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
     s->jacks = g_new0(virtio_snd_jack *, s->snd_conf.jacks);
-- 
2.31.1


