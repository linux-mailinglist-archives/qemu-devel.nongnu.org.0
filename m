Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575136EA44
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:24:48 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5ip-0003ue-77
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R8-0008Cw-B5
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:30 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R3-0000eq-LL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:30 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so7105365pjb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wWBhY7kSgyVuXhQC9AlGO8VAvuu+x5orJIycq5NPZPU=;
 b=rrMgyEzfYIaHMVcPQuASitqqMCEGlyeulBzifNdV5uAMuWZ4UIBHUy+O68NmFHwH1/
 FzIRK0qXfn1o/Fh779rxCd6TqEXsbrHyiituppCX4+noFWbzXafbgh52Eu+TqiYEeI0d
 IttTcwWxWP4KV8Uo66KHiSWCUUPPvuhrMC5pLIE8zBDhCXBUs7ATGNghdsk2Fxsf9Wvp
 zwc2NxN25yG8Ds70k2i8XUWRoW7zRJA2p7dcE0JII/EtSEsKQ054zP0JPsP0aLooGS1S
 KNO88bhvxM3LLNKS1n8V5s0AawT3UI0uzld6m1UP495torAgMZzbNBc5ddMc1GDX1aLZ
 4hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wWBhY7kSgyVuXhQC9AlGO8VAvuu+x5orJIycq5NPZPU=;
 b=JW4aP6ZQy6l0u7ntNjaC47DsXO5Be66w31Ms146lW72DrC0pq5vVmvUKONDzMktPbm
 hoPTxCFgnunIQFKlLbcl4VgphEY2KXR8q5rnxMQQ+glhhhvwwwh+imPTo4pXCVW1fJjr
 aYvCYGfB0+E8AO4nrtvmuvkHbso9irra0aB3Ha4OxD/p8UOqYBf82asMrDVP85QA9DRa
 N6fPio/kFvTUE2CVioWkAlpPXWdDbacnbaOmnzPNBUcMQR4tlownN60Hen0V6tBaBoUN
 n7gQPUyRdhN+Rwrt0x0LA8/uALC4/2BNwEHgCqAT286HlodfdYXpQLytKgpQuIKOJV49
 YIgg==
X-Gm-Message-State: AOAM531It59g8y5usRgKtfAghq82zlo5rXK6b1BYnV/e29TmlHcarki+
 rkViPQX1dMYcL3mPgV+wIEQ=
X-Google-Smtp-Source: ABdhPJz9+60q+VEXsVXS7ANtXg7mU7m4VqGuMgOcNdLXXAhv6ZYZuZuQDtU5j2Dn8sEPExBL9jFbsw==
X-Received: by 2002:a17:90b:d81:: with SMTP id
 bg1mr10540319pjb.179.1619697984139; 
 Thu, 29 Apr 2021 05:06:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:23 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 21/27] virtio-snd: Add VIRTIO_SND_R_PCM_STOP handler
Date: Thu, 29 Apr 2021 17:34:39 +0530
Message-Id: <20210429120445.694420-22-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1031.google.com
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
 hw/audio/virtio-snd.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 65104baba8..8be3fb9bf5 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -760,6 +760,35 @@ static uint32_t virtio_snd_handle_pcm_start(VirtIOSound *s,
     return sz;
 }
 
+/*
+ * Handles VIRTIO_SND_R_PCM_STOP.
+ * The function writes the response to the virtqueue element.
+ * Returns the used size in bytes.
+ * TODO: Doesn't handle the stream buffers that are yet to be played.
+ *
+ * @s: VirtIOSound card
+ * @elem: The request element from control queue
+ */
+static uint32_t virtio_snd_handle_pcm_stop(VirtIOSound *s,
+                                           VirtQueueElement *elem)
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
+    AUD_set_active_out(st->voice.out, false);
+
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+    assert(sz == sizeof(virtio_snd_hdr));
+    return sz;
+}
+
 /* The control queue handler. Pops an element from the control virtqueue,
  * checks the header and performs the requested action. Finally marks the
  * element as used.
@@ -817,7 +846,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
             sz = virtio_snd_handle_pcm_start(s, elem);
             goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_STOP) {
-            virtio_snd_log("VIRTIO_SND_R_PCM_STOP");
+            sz = virtio_snd_handle_pcm_stop(s, elem);
+            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
             virtio_snd_log("VIRTIO_SND_R_PCM_RELEASE");
         } else {
-- 
2.25.1


