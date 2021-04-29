Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D636EA0F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:09:29 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5U0-00010j-4E
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QQ-0007j3-Qp
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QO-0000Na-UW
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id p17so6598594pjz.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5FN9nObvndtv5C0B9m9+OAOTZ/gkBQLmV++IRQOVVsM=;
 b=Ce9N6E+srgeWBT4FXw858v17uyfXkHWwgiCQa9d3yREc6ShaxD1VHs1dNC9fdiHekG
 kSzBojuuIXouQF/yhZG/0mpzpTduVwtVwp6h8o53TepA7HU2emrkCb3/QyVAoMabOHYr
 OVZ9qFlEg2Alc/1c6i5C5ftiMkZvEndGB2KlKE4VvNTyiz/FPMCsXJwR5AQjSgUX6Gbd
 5v7dW32oA1kugu5RpfiG6vBsxnyeE7t55reKcQdy/UK2wldzNDp3wqeG4PCzQo1VfCvj
 jKppT26YUOOPjcKeihG49gzKpvDlxwWS0Hj74JLNdzKnpKvd1wWiP7YqVTGMCmt9gV3l
 jpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FN9nObvndtv5C0B9m9+OAOTZ/gkBQLmV++IRQOVVsM=;
 b=om6lehWWUKa/R7eMsMKvcc5LKjLLFOzhCqkRZDhAcJnAeg855i72O57mtGK1VCKQ7T
 ZZNhwFuPXUZ8Yagu2+zPKA51o0h5xe2enXYdZKPxtv38Uav0EfSyk/fo8f6P1yRFeBkK
 OYY0r3AtGdmaxFz7ZZZ9EJ4SEomuWbRfc7G983UCOAe4eUWL0tA89JQ/+9Ik7Au7XR1E
 oaMVAzF/96/p5XyD/rLbhZimqYwqRTAiZtninQvdJaGVAMv708D6Q/klmp+G/yvX7qTb
 j2/QWYpbFeM/QrjQ+dqgN0J7gjhPqrbfMJVfUlAPQDvTx7xUpUC8L2a9lxLYzdnCnA/3
 zPTg==
X-Gm-Message-State: AOAM532YDt533vKnCSyUp2IfQ0Gokhx8VZRI7s/At250Fy7/SWj5bqje
 +8n1tGyeexcGBiMYrgNjmvE=
X-Google-Smtp-Source: ABdhPJx/cYhq5X34QePoyoyqpJG1jqYuxrmbbKsJYPePspGY4Z7IW7LD2pQ3OXn7FGp9/h5mnzhr8g==
X-Received: by 2002:a17:90a:8e82:: with SMTP id
 f2mr9082194pjo.146.1619697943698; 
 Thu, 29 Apr 2021 05:05:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:42 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 05/27] virtio-snd: Add device implementation structures
Date: Thu, 29 Apr 2021 17:34:23 +0530
Message-Id: <20210429120445.694420-6-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1036.google.com
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

Added jacks, pcm streams and the VirtIOSound structure for actual
device implementation.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
index ad068e5893..6ab131db50 100644
--- a/include/hw/virtio/virtio-snd.h
+++ b/include/hw/virtio/virtio-snd.h
@@ -13,6 +13,9 @@
 
 #define VIRTIO_ID_SOUND 25
 
+#define TYPE_VIRTIO_SOUND "virtio-sound-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSound, VIRTIO_SOUND)
+
 /* CONFIGURATION SPACE */
 
 typedef struct virtio_snd_config {
@@ -326,4 +329,65 @@ typedef struct virtio_snd_chmap_info {
     uint8_t positions[VIRTIO_SND_CHMAP_MAX_SIZE];
 } virtio_snd_chmap_info;
 
+/* VIRTIO SOUND DEVICE */
+
+/* Jacks */
+typedef struct virtio_snd_jack {
+    uint32_t features; /* 1 << VIRTIO_SND_JACK_F_XXX */
+    uint32_t hda_fn_nid;
+    uint32_t hda_reg_defconf;
+    uint32_t hda_reg_caps;
+    uint8_t connected;
+} virtio_snd_jack;
+
+/* Streams */
+typedef struct virtio_snd_pcm_stream {
+    uint32_t hda_fn_nid;
+    uint32_t buffer_bytes;
+    uint32_t period_bytes;
+    uint32_t features; /* 1 << VIRTIO_SND_PCM_F_XXX */
+    uint32_t flags; /* 1 << VIRTIO_SND_PCM_FL_XXX */
+    uint32_t direction;
+    uint8_t channels_min;
+    uint8_t channels_max;
+    uint64_t formats; /* 1 << VIRTIO_SND_PCM_FMT_XXX */
+    uint64_t rates; /* 1 << VIRTIO_SND_PCM_RATE_XXX */
+    int tail, r_pos, w_pos;
+    VirtQueueElement **elems;
+    VirtIOSound *s;
+    union {
+        SWVoiceIn *in;
+        SWVoiceOut *out;
+    } voice;
+} virtio_snd_pcm_stream;
+
+/* Stream params */
+typedef struct virtio_snd_pcm_params {
+    uint32_t features;
+    uint32_t buffer_bytes;          /* size of hardware buffer in bytes */
+    uint32_t period_bytes;          /* size of hardware period in bytes */
+    uint8_t channel;
+    uint8_t format;
+    uint8_t rate;
+} virtio_snd_pcm_params;
+
+/* Sound device */
+struct VirtIOSound {
+    /* Parent VirtIODevice object */
+    VirtIODevice parent_obj;
+    virtio_snd_config snd_conf;
+
+    VirtQueue *ctrl_vq;
+    VirtQueue *event_vq;
+    VirtQueue *tx_vq;
+    VirtQueue *rx_vq;
+
+    QEMUSoundCard card;
+    size_t config_size;
+
+    virtio_snd_pcm_params **pcm_params;
+    virtio_snd_pcm_stream **streams;
+    virtio_snd_jack **jacks;
+};
+
 #endif
-- 
2.25.1


