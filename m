Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A8F4B30A4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:34:44 +0100 (CET)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeV1-0000O2-4m
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:34:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCi-0006uU-RB
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:48 -0500
Received: from [2607:f8b0:4864:20::633] (port=38413
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCg-0003Jh-Qq
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id c3so5758615pls.5
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhwfTETSqRp9VzRZcb3UZ06FGN6/7kr1VwlJIC0IPZw=;
 b=l+VaAWLTjj8XuWrwaSp87EtwP+D2MEMX0M+gMQjFE3tz51NeLKvNv4H2ibwAmv2cAL
 xwUbh6IXsfKbWS5+n3B4FKQ+OJCjAc86oX8KgJJF182VE2+a7VDVAwKOefeVEwcTjXaR
 9Rwdx41AYNvOjC3VW8XoOGwMnsmzj8j67mnlzWRA2TeeCxNilEi55OL26O8lJjP4g3J8
 oAHfP96TXjkh+CVHOeOMJdxmSE2eEnDZ4L6QoerLorHfVgOR1tLqpuy7JnQ1SaNLE4Yd
 6X3kwtM4RGvCM43HOlq03VBXhdDcFvCQdTZ9RQHur1o6MI7J7LlvoCikN0AAD79OkwtI
 1Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhwfTETSqRp9VzRZcb3UZ06FGN6/7kr1VwlJIC0IPZw=;
 b=Y+PdEBif91fYIgYHrOxTtcGwLdvCZFlTciIvnEKrcAqL88lw+9VHWf1U0Ur0al5sm3
 o6O1IgoDyiTKNkId379YZFOr/2D9kTbUbfWZCrRN23GHYuO38sg/OhOxz5Lw87wwxq7u
 RtuVM2tWNFGP3DdogLVLV4Pa1H/UuRvMSlY6M5UHHpvcDw0+HrAGhtSZim84nyYAMYXy
 bW0Olge+AuFBMmyycwBRNr0SsIEWKBKV2DqpYqhiJKxbroIhwqIU2DsysuPxzYPK88jD
 UXUshbKJCk9NMFnxbbBSUk1IsDGiwjWoHglPJn1ZUyVLqN7RLUgzpJzpD3gw8b9fonTg
 Srng==
X-Gm-Message-State: AOAM530bIxW1k6c1efpdi7dUct13AVmKRWOr6Nx/FpIpMscCju8CsCqA
 QobTW1k7xamJYxSsyXbhM+T6KXgFgtI=
X-Google-Smtp-Source: ABdhPJx7y/E/5y+PIttRH3yqZAAu+DAkqKnRveFvwqLcOIbi9pj8iWHVrW3+d+hHDe2/6OMsLtt0cg==
X-Received: by 2002:a17:903:41ce:: with SMTP id
 u14mr3448178ple.49.1644617745568; 
 Fri, 11 Feb 2022 14:15:45 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:45 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 12/25] virtio-snd: Add VIRTIO_SND_R_JACK_INFO handler
Date: Sat, 12 Feb 2022 03:43:06 +0530
Message-Id: <20220211221319.193404-13-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x633.google.com
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
 hw/audio/virtio-snd.c | 81 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 2 deletions(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index a87922f91b..c2af26f3cb 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -92,6 +92,80 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
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
@@ -102,6 +176,7 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
  */
 static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
+    VirtIOSound *s = VIRTIO_SOUND(vdev);
     virtio_snd_hdr ctrl;
 
     VirtQueueElement *elem = NULL;
@@ -131,7 +206,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             /* error */
             virtio_snd_err("virtio snd ctrl could not read header\n");
         } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
-            virtio_snd_log("VIRTIO_SND_R_JACK_INFO");
+            sz = virtio_snd_handle_jack_info(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_JACK_REMAP) {
             virtio_snd_log("VIRTIO_SND_R_JACK_REMAP");
         } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
@@ -156,8 +232,9 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
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
2.31.1


