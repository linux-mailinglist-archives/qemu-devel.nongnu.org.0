Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2D36EA39
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:19:19 +0200 (CEST)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5dW-0007uf-9U
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QQ-0007ib-7A
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:46 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QJ-0000Fq-O3
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:45 -0400
Received: by mail-pg1-x533.google.com with SMTP id d10so8602650pgf.12
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jBcRmevKhpsCshTshdLKiiPquZrapKxr31avgj1dYA0=;
 b=fQJN1u8PLVhjWjjiYH0dkNOrzcsM0wI0aRWAW6OMAidXpkTrvZF6pQXJrdGAVLl2mJ
 8Aq56QpYYGkE+zAPktIk4USk23/tfRD7A1RDAFOiPC74HThg5CwtWapKqvKNmTjLNc2a
 ocAPbzLO78vHnBgLi2oPwU8P/TYJO2HH59dZxgTcNNi80oRz+BhL3Yciu4CMmM1qxDtz
 OD+Rs0k6IXrcqz/f1qZ31ec/cBtteCjP4Gg/k3edhUcpOa8OxTYsvPxouXARsnzdwsqU
 Y+myV56sLZKX0VZ6OEluOJtxF18SFd1yxZZerghdkT0M7EmNXjRgvJymNHrAD7XghXAc
 uaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jBcRmevKhpsCshTshdLKiiPquZrapKxr31avgj1dYA0=;
 b=L0s0ZcQ2HG0zd06+IC55g3h0BhdKYVVNtImZpZAcfxIkj14pAeaQGGsgxIh2Sj4NT2
 mT/NVyR3Yf3bIYUdG6olBimyyPZYYo0OL7Nf8/2ve8+xM9SRZ52bMh3awO8MluyIFnxK
 aKRKxn5s3cUq8R1sJVCZoSEciPXQflfjN9wy8DYeAfpp+gFYopA059fA+NGaeBEuQtE8
 zybVqWAE7XnhIGKGOnK4C+lfu3Z0jx3jT+gZTXt1F0E1/SQ7grCtjPKZ0Zn4hXziNBHS
 1h7XMSENiexc7B2qPp3KNS83U5tbSAwS5ucAWb5Q9hNtTHz81nuBLZrAo80K52f5rsnN
 mD0g==
X-Gm-Message-State: AOAM530EW/ch1cf1SISGl89Dgei3nWfArpMQhpwBJZEU7WW/4YJ4diuL
 Cro5DYmd1Frs6SjrxyycjKDZyW7hTXHba3iMPfo=
X-Google-Smtp-Source: ABdhPJyM47GMxiX/SLQtVWWwrp7kMi7IaAtq/JqKc/0nSWejS+xXTZSSoo8ccFsjTgFDnzzLv4gcbg==
X-Received: by 2002:a63:7f41:: with SMTP id p1mr19385522pgn.208.1619697938435; 
 Thu, 29 Apr 2021 05:05:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:38 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 03/27] virtio-snd: Add PCM control structures
Date: Thu, 29 Apr 2021 17:34:21 +0530
Message-Id: <20210429120445.694420-4-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x533.google.com
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

Added structures for handle PCM control requests
to the heaer file.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 128 +++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
index f58b06a949..e9a4fe3c5d 100644
--- a/include/hw/virtio/virtio-snd.h
+++ b/include/hw/virtio/virtio-snd.h
@@ -134,4 +134,132 @@ typedef struct virtio_snd_jack_remap {
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
+/* PCM stream flags */
+enum {
+    VIRTIO_SND_PCM_FL_CHMAP = 0
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
2.25.1


