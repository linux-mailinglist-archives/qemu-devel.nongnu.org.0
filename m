Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82CE36EA10
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:09:56 +0200 (CEST)
Received: from localhost ([::1]:35792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5US-0001QM-1X
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Ql-00082V-RV
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:08 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qj-0000YZ-Sx
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:07 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s22so25870533pgk.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fhUCjea0Osiy4d9haQy+05RIOPgeL7lswjdR+LAtpC0=;
 b=NHMmanD4xwwW/dZSgXzPjkad2qlbOoND5a9IDkrkCNEYgDQpkSzG+ChK4TGJEJz+8i
 w8zmKuF/Z/8KR1yHVIhvGr8JAuq+Z9VeiOBbfbVg4dvtg36aCrhPHdp+ZoWbfpHj7FDQ
 WKoF0s1+A9eNdzaDSLgU3U2wXAp/m8q1TZw9c+cQvojCbB3pGyVe48r961XBn55c048C
 LcYxx7PgH+YVwT2NRC1l7fV095x1XhUqcAWYxYt884//PHAyW1h3SMZQ3ay1tNHWxaTi
 REVlZLkJ9INB0K0k0kmLx+zAZhv4sClJcBPfl6RdzX/4iXapeeZICMkBJkzg2KqGrfOR
 SK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fhUCjea0Osiy4d9haQy+05RIOPgeL7lswjdR+LAtpC0=;
 b=DifZUBSp7fXXmYuz2fhRIJ8f5ISCJfz5EvKZFObrEaEuQP5WGWNWgqdU29bUAeZTh6
 Ay9c7KUMFtnsmyi83v+wLTL3dYo062pHHHexca90L7kvZC+dh4HBSCdLCFVDVJvYn/eO
 eltMInjL6hmVorZVFoMhLIa9JdNeSfzV8UftTGZWaWD8IEkz6jsvHn2K8iWbcbyuc09d
 Yj8+3cFtnm2gHWEqFYZhkqGJpPtqY0rZSFzFpx5MuzZULdyZjngFMVe2VfsolNvJlM5n
 Ho4p1Cg91ZW3FUvpIYBowIjqcCf6dElUld0iYiJsvg1SMrwlN9zsPprrlrMq5c6GxXT2
 8qNg==
X-Gm-Message-State: AOAM533Wlac9reb5Xw0J/otZAhiZ6zVwfsF1wGrx96V+gECQYRkL8B/0
 vZd3H6nIUQbCldmAUE8PZIRw3IQ8ORaGowne+tY=
X-Google-Smtp-Source: ABdhPJxnKZ8We9gH9S2ftxCLzqZte6/w1e+AhFaKpKWGKz75CsasQj61Adhc2RhGyAoQCeioaGtP4Q==
X-Received: by 2002:a63:4d50:: with SMTP id n16mr30987930pgl.237.1619697964397; 
 Thu, 29 Apr 2021 05:06:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:03 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 13/27] virtio-snd: Add VIRTIO_SND_R_JACK_INFO handler
Date: Thu, 29 Apr 2021 17:34:31 +0530
Message-Id: <20210429120445.694420-14-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x52a.google.com
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

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 81 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 2 deletions(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 435870e3ba..d50234f9a8 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -100,6 +100,80 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
 {
     return vdev->host_features;
 }
+/*
+ * Get a specific jack from the VirtIOSound card.
+ *
+ * @s: VirtIOSound card device.
+ * @id: Jack id
+ */
+static virtio_snd_jack *virtio_snd_get_jack(VirtIOSound *s, uint32_t id)
+{
+    if (id >= s->snd_conf.jacks) {
+        return NULL;
+    }
+    return s->jacks[id];
+}
+
+/*
+ * Handles VIRTIO_SND_R_JACK_INFO.
+ * The function writes the info structs and response to the virtqueue element.
+ * Returns the used size in bytes.
+ *
+ * @s: VirtIOSound card
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_jack_info(VirtIOSound *s,
+                                            VirtQueueElement *elem)
+{
+    virtio_snd_query_info req;
+    size_t sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
+    assert(sz == sizeof(virtio_snd_query_info));
+
+    virtio_snd_hdr resp;
+
+    if (iov_size(elem->in_sg, elem->in_num) <
+        sizeof(virtio_snd_hdr) + req.count * req.size) {
+        virtio_snd_err("jack info: buffer too small got: %lu needed: %lu\n",
+                       iov_size(elem->in_sg, elem->in_num),
+                       sizeof(virtio_snd_hdr) + req.count * req.size);
+        resp.code = VIRTIO_SND_S_BAD_MSG;
+        goto done;
+    }
+
+    virtio_snd_jack_info *jack_info = g_new0(virtio_snd_jack_info, req.count);
+    for (int i = req.start_id; i < req.count + req.start_id; i++) {
+        virtio_snd_jack *jack = virtio_snd_get_jack(s, i);
+        if (!jack) {
+            virtio_snd_err("Invalid jack id: %d\n", i);
+            resp.code = VIRTIO_SND_S_BAD_MSG;
+            goto done;
+        }
+
+        jack_info[i - req.start_id].hdr.hda_fn_nid = jack->hda_fn_nid;
+        jack_info[i - req.start_id].features = jack->features;
+        jack_info[i - req.start_id].hda_reg_defconf = jack->hda_reg_defconf;
+        jack_info[i - req.start_id].hda_reg_caps = jack->hda_reg_caps;
+        jack_info[i - req.start_id].connected = jack->connected;
+        memset(jack_info[i - req.start_id].padding, 0,
+               sizeof(jack_info[i - req.start_id].padding));
+    }
+
+    resp.code = VIRTIO_SND_S_OK;
+done:
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+
+    if (resp.code == VIRTIO_SND_S_BAD_MSG) {
+        g_free(jack_info);
+        return sz;
+    }
+
+    sz = iov_from_buf(elem->in_sg, elem->in_num, sizeof(virtio_snd_hdr),
+                      jack_info, sizeof(virtio_snd_jack_info) * req.count);
+    assert(sz == req.count * req.size);
+    g_free(jack_info);
+    return sizeof(virtio_snd_hdr) + sz;
+}
 
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
@@ -110,6 +184,7 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
  */
 static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
+    VirtIOSound *s = VIRTIO_SOUND(vdev);
     virtio_snd_hdr ctrl;
 
     VirtQueueElement *elem = NULL;
@@ -139,7 +214,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             /* error */
             virtio_snd_err("virtio snd ctrl could not read header\n");
         } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
-            virtio_snd_log("VIRTIO_SND_R_JACK_INFO");
+            sz = virtio_snd_handle_jack_info(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_JACK_REMAP) {
             virtio_snd_log("VIRTIO_SND_R_JACK_REMAP");
         } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
@@ -162,8 +238,9 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         virtio_snd_hdr resp;
         resp.code = VIRTIO_SND_S_OK;
         sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
-        virtqueue_push(vq, elem, sz);
 
+done:
+        virtqueue_push(vq, elem, sz);
         virtio_notify(vdev, vq);
         g_free(iov2);
         g_free(elem);
-- 
2.25.1


