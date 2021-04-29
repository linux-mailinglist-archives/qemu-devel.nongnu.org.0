Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB536EA88
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:32:41 +0200 (CEST)
Received: from localhost ([::1]:49274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5qS-0002A8-GG
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qi-0007yN-Os
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:04 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qg-0000X3-DG
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:04 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b21so6124242plz.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3xR38+NzyThoRVU0jSAuoCwnc7m9ZjPRZZg+WXMtU14=;
 b=nm6mKVoR3XbiBGMCe1yKRlvZKzWVyIZYydKAF1rA3E/UQ8ghC/K9T75i9JlWWSXJ5C
 O9XX4mwhgmU88vFHiHEgBv5eFBlDfp7/W1zpdKSqz3o46R5drpivRX+kHzwJidZnOg/v
 pFcYYjB8oSxmj9v/WXpAPlAS7dlsae+xy8lY+hAMJ3C+WN4fPr1/S5tY/WQWuw+O5Ki6
 9+YSWRsk2kxQEPzlH/8s0AzMfxJoPFsNzWsGe4i9lpJt8CfZb+86W6zZeoUlasWl6Qkj
 SM/xsSL80K/Xrv+C3FgB/BHpEo6Em00Vw2FdVNEOtGCJPn75S+2eea3cssBr3pKDKFi6
 +yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3xR38+NzyThoRVU0jSAuoCwnc7m9ZjPRZZg+WXMtU14=;
 b=Luwv/tz9Agv3/NHQFZemG4r4WvjGwqvOQth4ReAIy22kSe0QvzM8b/F+q6HeCgkLLx
 TDDIKpaoUqCnWTv46KBqjB2FDXu19tDzaXiBkY5mQ6T2BU3dmcbFVxc3pJ/6ZHSqYWy9
 5TxWXRCP+QmD7i3n8dxKNlho+Z/hSB/ksvo9J7m1cwzHaOY0cDex3raT6NppFIZL9tYq
 aEdw2x3Oiv/SvncDiit464jvVIJ4Tt+0NlR9YI8lPjkPxf0dWZ5ZHmWk9KPC//W8u/2e
 4iBxNeRzbtElHNcoYjBy0H/Yavh1+/4baV54Eqh23bVc1liCBTZy7jMzG5nG9bRUUgO+
 CEFA==
X-Gm-Message-State: AOAM533m9qtyagVzSo9f+Ss2yXuPRknLxUhtcjA8YRN6R5SaBYC3itg4
 Z7mbKcLQ6XK0ZQFCwt2apxI=
X-Google-Smtp-Source: ABdhPJwVeM4RD6MHddiOszTHgDUoaYs1tbUc3eHp/PeyeQ3PoQ3VWDUj+jZROKQe+kkkyxK4VSjiFw==
X-Received: by 2002:a17:90b:1995:: with SMTP id
 mv21mr9520896pjb.19.1619697961157; 
 Thu, 29 Apr 2021 05:06:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:00 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 12/27] virtio-snd: Add control virtqueue handler
Date: Thu, 29 Apr 2021 17:34:30 +0530
Message-Id: <20210429120445.694420-13-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x62e.google.com
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

The handler prints the requests that came in the ctrl virtqueue.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 71 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index a93674ea72..435870e3ba 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -101,6 +101,75 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
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
@@ -135,6 +204,8 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     /* set up QEMUSoundCard and audiodev */
     AUD_register_card ("virtio_snd_card", &s->card);
 
+    s->ctrl_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_ctrl);
+
     s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
     s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
     s->jacks = g_new0(virtio_snd_jack *, s->snd_conf.jacks);
-- 
2.25.1


