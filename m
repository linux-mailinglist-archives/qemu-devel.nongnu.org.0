Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F49A36EA3B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:20:14 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5eK-0000Gl-EZ
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R5-0008Ap-8h
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:27 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R1-0000eH-35
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id p17so8720328plf.12
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mupslfdG5GIITGwV1cGT35DsefuZ/zxb9zDHGC1N6VY=;
 b=n1yZosj4AVJ2W+Q7Tam2Qk7eICJN8vqxiy6zWqt2V/T58wsYjQcccSH0nPsW0++XkW
 sO4nNSgP8JNgCNABwqG7Srj45cUtq93G/G/yRHZkvpkJ9PWEkRqhAHrhpxxbLD5dIPfP
 vKGabHoI+xKW5Uft5G81eaSOWL7SVJiBGTO6apROyqQ1l768PAFDq1KGZVF8o5FlKmGl
 Zcfynpu4vuEtjF63BW6OikARdb8YNcl2ILP7P6U0+GPmCjk8mea+UxEBYow9XNi/QS2O
 tkAeJuHOSQDcHp2EL0Cogpl0A8Mdb1awm1cFun3YhALTTOdsc8U+6HEoAe9IKjQBGsHe
 U+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mupslfdG5GIITGwV1cGT35DsefuZ/zxb9zDHGC1N6VY=;
 b=XGt6+LVcNBse3w/bsDH6r8zk6A0gGNQqoLJwdy9DY7SEyRoC+rUkKMDiJ8iuZ3An7n
 YHqVBKkZgOyIVOcO0/bnqgm/upY7OmRBa8rsanaO1G7zbFmRmRNKQSs9zVpSg8Hflmrx
 XLYXiaW4RrrfnlTax6RgKsS6ODsAu6V9JRWer4dzrUYaVtHcF5tWUghd/E3Re6sS/mMx
 m9gD/j06HUCn0dv7xzARStLIggvB5x9ht5OXVwpCCzDV7lMeDCZpaBguJDhxWPjU4q9a
 XOWAFzNjph+79oVAfDBx8CzK+2Spf69QpRgSvL71jI0pKFZW1Abs/myCgt+wQgEKeib3
 N/3Q==
X-Gm-Message-State: AOAM530yotphy/g+C5aFB/fIiN2zWm9gmAkTz6iD8+HfoPOlLKfuaiIW
 B0YYtk7lA4BgjF2Z4uQ38xM=
X-Google-Smtp-Source: ABdhPJzoMyhijqmJa2jguB8dAcNoEvBpHkIC0q5SlgU1UfNPv7nM3zdQRw36XiokwvRb6r7uBxOnvA==
X-Received: by 2002:a17:902:d2cc:b029:ed:2984:d73c with SMTP id
 n12-20020a170902d2ccb02900ed2984d73cmr22222228plc.54.1619697981776; 
 Thu, 29 Apr 2021 05:06:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:21 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 20/27] virtio-snd: Add VIRITO_SND_R_PCM_START handler
Date: Thu, 29 Apr 2021 17:34:38 +0530
Message-Id: <20210429120445.694420-21-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x631.google.com
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
 hw/audio/virtio-snd.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index e5042caf9c..65104baba8 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -732,6 +732,34 @@ static uint32_t virtio_snd_handle_pcm_prepare(VirtIOSound *s,
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
+static uint32_t virtio_snd_handle_pcm_start(VirtIOSound *s,
+                                            VirtQueueElement *elem)
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
+    AUD_set_active_out(st->voice.out, true);
+
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -786,7 +814,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_pcm_prepare(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_START) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_START");
+            sz = virtio_snd_handle_pcm_start(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_STOP) {
             virtio_snd_log("VIRTIO_SND_R_PCM_STOP");
         } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
-- 
2.25.1


