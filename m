Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A036EABD
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:44:37 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc620-0003bU-P9
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RL-0008Rx-8o
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:43 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RJ-0000qj-I4
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:42 -0400
Received: by mail-pf1-x431.google.com with SMTP id i190so6349257pfc.12
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAL8bmnx7RYPiqljziT7Xp0N6yaxytRwZyH9QL2dPU0=;
 b=elB/CGe9GZG96Bx0D02MYvnIJ48rxxN57QM/lLiEWHb6A1DCyASzl5Y0pWiCtQ9M/9
 fYiYK7SS2zFbMBnC/g5dBBbcfgZYkN9tBqRrbfN6acm3szrPIOHb4gFozRrob6pZpKyu
 253z2DV1oPFQOEGGBLmClkBVnQ6rlk1cSqY4/PV5afemTerBMPJ2ahORH7XHkZU9wCX6
 /tFYuFDq7NXNRbWqyhu3xvkh/A4jPFpA1WT0KUF5uAmKp1bZxNrRo9Yc2mzYbDS1rFkF
 TYgBKxbMgpQ1YkewQviLe4EaGGdunVk6dvjhzvMIK0jz/ek2TsyBgi9XNMjuu9gS6eJ/
 Yd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAL8bmnx7RYPiqljziT7Xp0N6yaxytRwZyH9QL2dPU0=;
 b=Yo+/Y0CCqcmr3NhwPPWt/eeoC1zLLJ+LaXOy0FP+DANVf3MPisqLJp8IKDyadVDf9F
 +WkeI27L/PSrJqo7R7+hZUW7lBfnfdujcZx7gDzthPcTdxcXoWBsEGoR+LIL3Snrgphy
 feKdsTmkHHfF4J0tCq9JPG9Pc8jf34uAWwbQMQQx5U00usPe1Wxzihh6AfWxYoS1Fmo1
 pFfQGb/zTMrOjboYPSDCddwVzlZR8mb15hHyj2V7rBw8HntyOa3KhmLPYLkcfy+eT6bD
 RnfS/olAjhngCphE6K5wGBLKtbfQwBwTUP6xcaL7rE7LCbwKyc5HdE447AdywcZm+H/A
 NiuA==
X-Gm-Message-State: AOAM533w/ArTWTbdmJD0qJCCPzNGOEoQetJWpvqa7Ag+KT1/67uXb+du
 E/tFavZFUtT/g+dhGuR00Cd75DkFPzRVrif1wtQ=
X-Google-Smtp-Source: ABdhPJznm5faU8Bo6uWHUDQrGmilcPdHYkgwUYOBhCwGFjZW8JF8NWdwmExdzdFbT5/2s1OYSYZrxA==
X-Received: by 2002:a63:500a:: with SMTP id e10mr31886358pgb.242.1619697998653; 
 Thu, 29 Apr 2021 05:06:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:38 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 27/27] virtio-snd: Add rx vq and stub handler
Date: Thu, 29 Apr 2021 17:34:45 +0530
Message-Id: <20210429120445.694420-28-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x431.google.com
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
 hw/audio/virtio-snd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 2d7b7ce39a..6a1d3e824c 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -997,6 +997,18 @@ static void virtio_snd_handle_event(VirtIODevice *vdev, VirtQueue *vq)
     virtio_snd_log("event queue callback called\n");
 }
 
+/*
+ * The rx virtqueue handler.
+ * Not implemented yet.
+ *
+ * @vdev: VirtIOSound card
+ * @vq: rx vq
+ */
+static void virtio_snd_handle_rx(VirtIODevice *vdev, VirtQueue *vq)
+{
+    virtio_snd_log("rx queue callback called\n");
+}
+
 /*
  * Initializes the VirtIOSound card device. Validates the configuration
  * passed by the command line. Initializes the virtqueues. Allocates resources
@@ -1043,6 +1055,7 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     s->ctrl_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_ctrl);
     s->event_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_event);
     s->tx_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_tx);
+    s->rx_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_rx);
 
     s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
     s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
@@ -1110,6 +1123,7 @@ static void virtio_snd_device_unrealize(DeviceState *dev)
     virtio_delete_queue(s->ctrl_vq);
     virtio_delete_queue(s->tx_vq);
     virtio_delete_queue(s->event_vq);
+    virtio_delete_queue(s->rx_vq);
 }
 
 static void virtio_snd_reset(VirtIODevice *vdev)
-- 
2.25.1


