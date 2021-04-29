Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA236EA1F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:14:08 +0200 (CEST)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5YV-00045l-ND
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QN-0007fJ-UX
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:43 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QM-0000JQ-8E
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:43 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h20so34630248plr.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jpredQuPQQf0ushdz/KqU8uXVP1y5KeDEUfoi6lYsE=;
 b=dTp0a0rShO+H5gD/WGzHLqxlai8hiy4fB3rMtLYQlcJV5K+UDeJN3iEwc409FmEzZ/
 74pgCM9uHt3R4PIgzcRMIb+oNPqth6g2DJdsU+PkwU8yHRLeuGixA/NvXqUlFofqR/ZN
 QzIrR6cpCNVp9KlbWkwDEkA//3F4pypN8YNHuTeb5XirD2h5TPT44CqEsUyPNNJA2Sbd
 l3eUsesvqqjK4h1d5ITCh4s8y51op/PcFHqOo0tPYJ4QwDFClUufB6p4FmXD9nkPhtfO
 jARsYuF0scjt2n4Rt7mBeu2m/Fn1JBqeMVnAN2MKa9pOiIUttUW9owb5g8ztgAxpexOM
 IvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jpredQuPQQf0ushdz/KqU8uXVP1y5KeDEUfoi6lYsE=;
 b=XsBTZgsu/7ohoPGrk9YJKSa9mE2gIbGmv8SMr04U25vWkjIcy2ftM6Kta+z/0IawSQ
 gQGYZd353WmAh48hFrDPJKk4hU/oJ3BQgtFK+eleElIDy4yIcCRcsm7eTnbR92LUQpAt
 blM+EoRLdIVPPXOseSYh0FkjNavcT8nsEuCYxEKiuxx/5Vp6Sjx5n/jjwXhjs8P7V0HX
 3jkSkQyhlh8MM8WaE6Msil3SpJw9RQ3AdkSnkw5udA9bxG8A0ButC/tSHbbscPMo+M6P
 QfkDLyxPfeLx5BuT677VnEr56Ib8isu9RbJZiKGcsg2NQbzqGJhk+2xBPveCyvaQsYht
 wKOQ==
X-Gm-Message-State: AOAM5311eHEgo2mgNriUZ4kC7s9GM/A/SRyIZEYECvKkASO6ne43SJrm
 BG0y8/jMMMY+6GQJvjAVVhM=
X-Google-Smtp-Source: ABdhPJwyzAX+7hBWSqlLElnnidBtm25uaCppa0yZNkClmQ1Nk0tzGBGubx6jaZXqIfJlqXEK7S21tQ==
X-Received: by 2002:a17:90b:208:: with SMTP id
 fy8mr25544900pjb.171.1619697940956; 
 Thu, 29 Apr 2021 05:05:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:40 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 04/27] virtio-snd: Add chmap control structures
Date: Thu, 29 Apr 2021 17:34:22 +0530
Message-Id: <20210429120445.694420-5-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x62e.google.com
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

Added structures for handling channel map control
requests to the header file.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
index e9a4fe3c5d..ad068e5893 100644
--- a/include/hw/virtio/virtio-snd.h
+++ b/include/hw/virtio/virtio-snd.h
@@ -262,4 +262,68 @@ typedef struct virtio_snd_pcm_status {
     uint32_t latency_bytes;
 } virtio_snd_pcm_status;
 
+/* CHANNEL MAP CONTROL MESSAGES */
+
+typedef struct virtio_snd_chmap_hdr {
+    /* .code = VIRTIO_SND_R_CHMAP_* */
+    virtio_snd_hdr hdr;
+    /* 0 to (virtio_snd_config.chmaps - 1) */
+    uint32_t chmap_id;
+} virtio_snd_chmap_hdr;
+
+/* standard channel position definition */
+enum {
+    VIRTIO_SND_CHMAP_NONE = 0,  /* undefined */
+    VIRTIO_SND_CHMAP_NA,        /* silent */
+    VIRTIO_SND_CHMAP_MONO,      /* mono stream */
+    VIRTIO_SND_CHMAP_FL,        /* front left */
+    VIRTIO_SND_CHMAP_FR,        /* front right */
+    VIRTIO_SND_CHMAP_RL,        /* rear left */
+    VIRTIO_SND_CHMAP_RR,        /* rear right */
+    VIRTIO_SND_CHMAP_FC,        /* front center */
+    VIRTIO_SND_CHMAP_LFE,       /* low frequency (LFE) */
+    VIRTIO_SND_CHMAP_SL,        /* side left */
+    VIRTIO_SND_CHMAP_SR,        /* side right */
+    VIRTIO_SND_CHMAP_RC,        /* rear center */
+    VIRTIO_SND_CHMAP_FLC,       /* front left center */
+    VIRTIO_SND_CHMAP_FRC,       /* front right center */
+    VIRTIO_SND_CHMAP_RLC,       /* rear left center */
+    VIRTIO_SND_CHMAP_RRC,       /* rear right center */
+    VIRTIO_SND_CHMAP_FLW,       /* front left wide */
+    VIRTIO_SND_CHMAP_FRW,       /* front right wide */
+    VIRTIO_SND_CHMAP_FLH,       /* front left high */
+    VIRTIO_SND_CHMAP_FCH,       /* front center high */
+    VIRTIO_SND_CHMAP_FRH,       /* front right high */
+    VIRTIO_SND_CHMAP_TC,        /* top center */
+    VIRTIO_SND_CHMAP_TFL,       /* top front left */
+    VIRTIO_SND_CHMAP_TFR,       /* top front right */
+    VIRTIO_SND_CHMAP_TFC,       /* top front center */
+    VIRTIO_SND_CHMAP_TRL,       /* top rear left */
+    VIRTIO_SND_CHMAP_TRR,       /* top rear right */
+    VIRTIO_SND_CHMAP_TRC,       /* top rear center */
+    VIRTIO_SND_CHMAP_TFLC,      /* top front left center */
+    VIRTIO_SND_CHMAP_TFRC,      /* top front right center */
+    VIRTIO_SND_CHMAP_TSL,       /* top side left */
+    VIRTIO_SND_CHMAP_TSR,       /* top side right */
+    VIRTIO_SND_CHMAP_LLFE,      /* left LFE */
+    VIRTIO_SND_CHMAP_RLFE,      /* right LFE */
+    VIRTIO_SND_CHMAP_BC,        /* bottom center */
+    VIRTIO_SND_CHMAP_BLC,       /* bottom left center */
+    VIRTIO_SND_CHMAP_BRC        /* bottom right center */
+};
+
+/* maximum possible number of channels */
+#define VIRTIO_SND_CHMAP_MAX_SIZE   18
+
+typedef struct virtio_snd_chmap_info {
+    /* common header */
+    virtio_snd_info hdr;
+    /* direction */
+    uint8_t direction;
+    /* # of valid channel position values */
+    uint8_t channels;
+    /* channel position values (VIRTIO_SND_CHMAP_*) */
+    uint8_t positions[VIRTIO_SND_CHMAP_MAX_SIZE];
+} virtio_snd_chmap_info;
+
 #endif
-- 
2.25.1


