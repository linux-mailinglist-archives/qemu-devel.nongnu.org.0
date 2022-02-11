Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2250F4B3054
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:22:20 +0100 (CET)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeJ1-00055y-7h
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:22:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBw-00053G-GX
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:00 -0500
Received: from [2607:f8b0:4864:20::42a] (port=37547
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBu-0002mD-0W
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:00 -0500
Received: by mail-pf1-x42a.google.com with SMTP id y5so18599119pfe.4
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WWOGkVLVwAb/2x/bKAHDTmTkcbyoqFPfG2HRBJD6ZGo=;
 b=kXZD8lnVKfq3oV+I1flNqIKd/yal8d9b3u0TB57xnVeNUbCnZNllly1LX+fIWtdnlr
 m5GMTajnul+k9E7SEb5IScJiDe4LFiZNUjgIonBnSzX7jTDFn1ZmnOkm704l0lh+d9fa
 qCm9/LFNLHtquTyjpUsBBZn2bfhzbMPUAFRVn6kGBe3SnLgifwPger+wIPo2trrQoTuH
 4ebUfeBYO0tovci5vzXqiImQxIXGCPyzesgYUJMxz1qfVkqyz2uQJuTTe1cyTwrvqa7y
 BBmtacQcaiXaGrHWFCAOD9L3N5vtcVo3sq8etdWKRYf9nLpANsCYhSISdyRgcMq3SXK5
 fNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWOGkVLVwAb/2x/bKAHDTmTkcbyoqFPfG2HRBJD6ZGo=;
 b=ORX8hGrhnbCM0nNPQlhid7VYB6e6McaIlPMQ4QXSDPIcBo/w6dTCiMKn7wMhEXLu1Y
 yRzgeYKk4hFKzRozKDlMCrHrWfm8XQZvSsVZaoVyGubklGasOqo86Pfqc02iniEcwHI4
 GbwGk6oK/Q23enE6I1toOML1qcP1L9+Me5xB0ZgVmPtc2wtiS/OHc/E+XeKz803jdhXP
 hyNR87nyxhwEjpWSZBNCqFQvnm0q4IkxJF0jLZ+6A4hI7mc9AfzaOpggQDn4md9D7SKv
 EFo5uDGfAi1vlXG6p9yYSuszusorI5ESXtiNvfPA1EntAST+2QrPs70UKXKVVEw1/D+h
 tAxA==
X-Gm-Message-State: AOAM532/88kLEMcKOhIxjMdXgpO+uVOipbx+Ax2Y4bE4zLrEz4qXTbfZ
 o2vnZ69HRkbrOX1JpNCgxQ4=
X-Google-Smtp-Source: ABdhPJxANWaastschMSEZMi869/9iSf4JytMjIGbxVFYVpusMvLl/FtB05CInw496jhxFZ86TDKThw==
X-Received: by 2002:a63:7103:: with SMTP id m3mr2977709pgc.501.1644617696719; 
 Fri, 11 Feb 2022 14:14:56 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:14:56 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 05/25] virtio-snd: Add device implementation structures
Date: Sat, 12 Feb 2022 03:42:59 +0530
Message-Id: <20220211221319.193404-6-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42a.google.com
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

Added jacks, pcm streams and the VirtIOSound structure for actual
device implementation.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 66 ++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
index 3c16609a25..4d800a9626 100644
--- a/include/hw/virtio/virtio-snd.h
+++ b/include/hw/virtio/virtio-snd.h
@@ -13,6 +13,9 @@
 
 #define VIRTIO_ID_SOUND 25
 
+#define TYPE_VIRTIO_SOUND "virtio-sound-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSound, VIRTIO_SOUND)
+
 /* CONFIGURATION SPACE */
 
 typedef struct virtio_snd_config {
@@ -314,4 +317,67 @@ typedef struct virtio_snd_chmap_info {
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
+    uint32_t r_pos, w_pos;
+    bool flushing;
+    uint8_t chmap[VIRTIO_SND_CHMAP_MAX_SIZE];
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
2.31.1


