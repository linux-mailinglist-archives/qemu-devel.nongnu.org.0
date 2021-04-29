Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E2E36EA6F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:28:22 +0200 (CEST)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5mH-0006gB-Sy
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RA-0008IK-Sb
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:32 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R6-0000hA-8k
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so10822235pja.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CM0SCj/hhpy4ZFxSQx0oYrpYDxC8rll6O8tJCYsm9/A=;
 b=jBayHEgCmcFFygJYWMTO8enexw+sMAxUFQnmAwsN9qGDM13Qdod7cuFTvv6yK562pI
 pIBA9AT4RMp871eMZUxrKKaI1J4mjoWCcNTBRH91n4Jwt2adOhuSSrigFkGYHPOyPGpN
 YMIl6CVyFiIdiVPFbJlQVLNFAFKj0Lhmrx1rI+i5QA4DWzLVObA5UCLdGa3a8r10Yv46
 li0e5OnqAO7ODHCWLfStbtwgVVWbOhXFI0ayz50Rh9m6oCOd4IOA10v0UlJBVOrfWnkn
 9W2HNGKN00S50LAk6C6f2LV8HOFuzS+pAu4FsDE2FL+ajRDcKBk2/eszxqIbugZFKKXK
 rRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CM0SCj/hhpy4ZFxSQx0oYrpYDxC8rll6O8tJCYsm9/A=;
 b=EQ1H9uNmg6GZ1H7NyKcPj+sBMoFYlwNt+Ul6rjhAiB9Kbb1kZw5vsqOphliQiwxJDj
 zJMw2QLUD2ZmuTyDvzkT9u3tinXkFNAhujvAraEaTKLFx9ymshYhRT7EECiG70NQbzqy
 u0sNUGTIArheKDku6G+Hq0DCq+jfmRuq5vzpwq0Z4ko4kCO386x4Wccuu67b+L/qmWEK
 fkz54jQmYyZi867Nlt6UQAnFdtp2a1qYUbGaenWnccnt8O3UTFkzfvTAr01H5sE4Hyxs
 UHnk6kBd2yKdPgM4k7wQGGP0c5uhiwJxiyNHAqKzgkKujF4dS8YH7lRWuOdp1gC7+H4o
 66ZA==
X-Gm-Message-State: AOAM5300p9bJ0ZzdHpex0A0jppiPGc0ymCFqvcjz3cCaAgr39jId72h6
 bwRcAs/Ja9+byNi9BKFTcSk=
X-Google-Smtp-Source: ABdhPJzpBA2mbmj1J5f5ahx2JNyo+NNsRkZA4CEO6RlNlMkMZ9b1QsW5LZNWblNX19WPOuDf2MY3ZA==
X-Received: by 2002:a17:90a:e384:: with SMTP id
 b4mr9542047pjz.157.1619697986559; 
 Thu, 29 Apr 2021 05:06:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:26 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 22/27] virtio-snd: Add VIRTIO_SND_R_PCM_RELEASE handler
Date: Thu, 29 Apr 2021 17:34:40 +0530
Message-Id: <20210429120445.694420-23-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1033.google.com
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
 hw/audio/virtio-snd.c | 66 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 8be3fb9bf5..56e07a41f8 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -789,6 +789,69 @@ static uint32_t virtio_snd_handle_pcm_stop(VirtIOSound *s,
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
+static uint32_t virtio_snd_pcm_release_impl(VirtIOSound *s, uint32_t stream)
+{
+    virtio_snd_pcm_stream *st = virtio_snd_pcm_get_stream(s, stream);
+    if (st) {
+        virtio_snd_err("already released %d\n", stream);
+        return VIRTIO_SND_S_BAD_MSG;
+    }
+
+    if (st->voice.out) {
+        AUD_close_out(&s->card, st->voice.out);
+    } else if (st->voice.in) {
+        AUD_close_in(&s->card, st->voice.in);
+    }
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
+    g_free(s->streams[stream]);
+    s->streams[stream] = NULL;
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
+    sz = iov_from_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
+    assert(sz == sizeof(virtio_snd_pcm_hdr));
+
+    virtio_snd_pcm_release_impl(s, req.stream_id);
+
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -849,7 +912,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_pcm_stop(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_RELEASE");
+            sz = virtio_snd_handle_pcm_release(s, elem);
+            goto done;
         } else {
             /* error */
             virtio_snd_err("virtio snd header not recognized: %d\n", ctrl.code);
-- 
2.25.1


