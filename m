Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3924B3053
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:22:15 +0100 (CET)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeIw-0004my-CK
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:22:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBg-0004yF-Rj
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:46 -0500
Received: from [2607:f8b0:4864:20::1032] (port=36387
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBe-0002lH-SS
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:44 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso11641118pjd.1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tRy4Gi6U5+4vNluo6PbIiRmhQ3wpCAKa/CffwkfKOso=;
 b=E6DtpAAYiYqZS7SHmOrJ6HK9TzGFSH1rT7WC1HU3eMFs1KDsGwb1Qje8eHJN99Jc5g
 4/c2LhwoNrdjXCpYfBJxuKDuhkFQgc/5A9H1/Ez6QQPBibpmwHdeilAormNu6aXvwxXm
 V0s8/u4GfuAVXfJRsUkEVt0esv+F9n1voIdL8aTX221PrrlHxWfWWLpZHUx0xJ49gM9v
 BXYyoXizr563MRnnCAvmAleh0vVZM+kwkQZU9smnClyo47NCNiOM63xQPDyr/ra3ZA3q
 mMWAYpeu69JaT7nrXaKKJ5A+xxOubWvvS6P9DQ7X6qX8xnFMV7twz6dEBMdfQkaqMQnK
 tITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tRy4Gi6U5+4vNluo6PbIiRmhQ3wpCAKa/CffwkfKOso=;
 b=IqolGwAXvjmdEBGk1llET4+C8sE/dIgbVsVm7hvgIdOemS/l0IHtyxQ/j6bc6vXHgw
 9IMvKvj3eUG86yIzTiQLcana6CBsFwRFvsfRqCoX6nagZ56mX+/oPCUWbcw9j2Gu7Qhw
 B5YCLgMbO12j33Yo07JBTUm2ZEu4vXAp+L5GZs2lNK9jwj3XJYWjaMa/TItP54xh/fSI
 uXrG9p8CBG5bxhXnVaDJ48DpegHrtSkdkJK6KlU9QainQx09yh3OpSo01f7VJF4A4Y0d
 +WlYrw1B2hG8AdBCcshGv9tCVpCHleeGuHyLxnki50IjBQoyWSKYp3Ut83IlT9hjLptu
 X7GQ==
X-Gm-Message-State: AOAM533TMzFw9tB6rUe48aZ181fpX5g2PYW8Z8FYgjKqoYMdkE6bjGPV
 UcQgnhxmdadKK8d+lmM5z2lx3LAAIaA=
X-Google-Smtp-Source: ABdhPJx5ERo1FcrH6jk5JZro32XoONXdfz5ipoHowsM8cHluRMGLDinil07WLMXkH6ARg0nO/e5ASw==
X-Received: by 2002:a17:902:8f92:: with SMTP id
 z18mr3502790plo.42.1644617681704; 
 Fri, 11 Feb 2022 14:14:41 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:14:41 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 03/25] virtio-snd: Add PCM control structures
Date: Sat, 12 Feb 2022 03:42:57 +0530
Message-Id: <20220211221319.193404-4-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1032.google.com
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

Added structures for handle PCM control requests
to the heaer file.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 123 +++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
index f58b06a949..a7828c4ab8 100644
--- a/include/hw/virtio/virtio-snd.h
+++ b/include/hw/virtio/virtio-snd.h
@@ -134,4 +134,127 @@ typedef struct virtio_snd_jack_remap {
     uint32_t sequence;
 } virtio_snd_jack_remap;
 
+/* PCM CONTROL MESSAGES */
+
+typedef struct virtio_snd_pcm_hdr {
+    /* .code = VIRTIO_SND_R_PCM_* */
+    virtio_snd_hdr hdr;
+    /* 0 to (virtio_snd_config.streams - 1) */
+    uint32_t stream_id;
+} virtio_snd_pcm_hdr;
+
+
+/* Supported PCM stream features */
+enum {
+    VIRTIO_SND_PCM_F_SHMEM_HOST = 0,
+    VIRTIO_SND_PCM_F_SHMEM_GUEST,
+    VIRTIO_SND_PCM_F_MSG_POLLING,
+    VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS,
+    VIRTIO_SNDPCM_F_EVT_XRUNS
+};
+
+/* Supported sample formats */
+enum {
+    /* analog formats (width / physical width) */
+    VIRTIO_SND_PCM_FMT_IMA_ADPCM = 0,   /*  4 /  4 bits */
+    VIRTIO_SND_PCM_FMT_MU_LAW,          /*  8 /  8 bits */
+    VIRTIO_SND_PCM_FMT_A_LAW,           /*  8 /  8 bits */
+    VIRTIO_SND_PCM_FMT_S8,              /*  8 /  8 bits */
+    VIRTIO_SND_PCM_FMT_U8,              /*  8 /  8 bits */
+    VIRTIO_SND_PCM_FMT_S16,             /* 16 / 16 bits */
+    VIRTIO_SND_PCM_FMT_U16,             /* 16 / 16 bits */
+    VIRTIO_SND_PCM_FMT_S18_3,           /* 18 / 24 bits */
+    VIRTIO_SND_PCM_FMT_U18_3,           /* 18 / 24 bits */
+    VIRTIO_SND_PCM_FMT_S20_3,           /* 20 / 24 bits */
+    VIRTIO_SND_PCM_FMT_U20_3,           /* 20 / 24 bits */
+    VIRTIO_SND_PCM_FMT_S24_3,           /* 24 / 24 bits */
+    VIRTIO_SND_PCM_FMT_U24_3,           /* 24 / 24 bits */
+    VIRTIO_SND_PCM_FMT_S20,             /* 20 / 32 bits */
+    VIRTIO_SND_PCM_FMT_U20,             /* 20 / 32 bits */
+    VIRTIO_SND_PCM_FMT_S24,             /* 24 / 32 bits */
+    VIRTIO_SND_PCM_FMT_U24,             /* 24 / 32 bits */
+    VIRTIO_SND_PCM_FMT_S32,             /* 32 / 32 bits */
+    VIRTIO_SND_PCM_FMT_U32,             /* 32 / 32 bits */
+    VIRTIO_SND_PCM_FMT_FLOAT,           /* 32 / 32 bits */
+    VIRTIO_SND_PCM_FMT_FLOAT64,         /* 64 / 64 bits */
+    /* digital formats (width / physical width) */
+    VIRTIO_SND_PCM_FMT_DSD_U8,          /*  8 /  8 bits */
+    VIRTIO_SND_PCM_FMT_DSD_U16,         /* 16 / 16 bits */
+    VIRTIO_SND_PCM_FMT_DSD_U32,         /* 32 / 32 bits */
+    VIRTIO_SND_PCM_FMT_IEC958_SUBFRAME  /* 32 / 32 bits */
+};
+
+/* Supported PCM frame rates */
+enum {
+    VIRTIO_SND_PCM_RATE_5512 = 0,
+    VIRTIO_SND_PCM_RATE_8000,
+    VIRTIO_SND_PCM_RATE_11025,
+    VIRTIO_SND_PCM_RATE_16000,
+    VIRTIO_SND_PCM_RATE_22050,
+    VIRTIO_SND_PCM_RATE_32000,
+    VIRTIO_SND_PCM_RATE_44100,
+    VIRTIO_SND_PCM_RATE_48000,
+    VIRTIO_SND_PCM_RATE_64000,
+    VIRTIO_SND_PCM_RATE_88200,
+    VIRTIO_SND_PCM_RATE_96000,
+    VIRTIO_SND_PCM_RATE_176399,
+    VIRTIO_SND_PCM_RATE_192000,
+    VIRTIO_SND_PCM_RATE_384000
+};
+
+/* PCM stream info structure */
+typedef struct virtio_snd_pcm_info {
+    /* common header */
+    virtio_snd_info hdr;
+    /* supported features bitmap (1 << VIRTIO_SND_PCM_F_*) */
+    uint32_t features;
+    /* supported sample formats bitmap (1 << VIRTIO_SND_PCM_FMT_*) */
+    uint64_t formats;
+    /* supported sample rates bitmap (1 << VIRTIO_SND_PCM_RATE_*) */
+    uint64_t rates;
+    /* direction of the stream (VIRTIO_SND_D_*) */
+    uint8_t direction;
+    /* min # of supported channels */
+    uint8_t channels_min;
+    /* max # of supported channels */
+    uint8_t channels_max;
+
+    uint8_t padding[5];
+} virtio_snd_pcm_info;
+
+/* set PCM stream params */
+typedef struct virtio_snd_pcm_set_params {
+    virtio_snd_pcm_hdr hdr;
+    /* size of hardware buffer in bytes */
+    uint32_t buffer_bytes;
+    /* size of hardware period in bytes */
+    uint32_t period_bytes;
+    /* selected feature bitmap */
+    uint32_t features;
+    /* number of channels */
+    uint8_t channel;
+    /* VIRTIO_SND_PCM_FMT_* */
+    uint8_t format;
+    /* VIRTIO_SND_PCM_RATE_* */
+    uint8_t rate;
+
+    uint8_t padding;
+} virtio_snd_pcm_set_params;
+
+/* PCM I/O MESSAGES */
+
+/* I/O request header */
+typedef struct virtio_snd_pcm_xfer {
+    /* 0 to (virtio_snd_config.stream - 1 */
+    uint32_t stream_id;
+} virtio_snd_pcm_xfer;
+
+/* I/O request status */
+typedef struct virtio_snd_pcm_status {
+    /* VIRTIO_SND_S_* */
+    uint32_t status;
+    /* current device latency */
+    uint32_t latency_bytes;
+} virtio_snd_pcm_status;
+
 #endif
-- 
2.31.1


