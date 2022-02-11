Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E171B4B3040
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:18:09 +0100 (CET)
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeEy-0007YA-WC
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBl-00050C-Hf
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:50 -0500
Received: from [2607:f8b0:4864:20::102e] (port=52141
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBj-0002lW-Ky
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:49 -0500
Received: by mail-pj1-x102e.google.com with SMTP id y9so9281743pjf.1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIll8pMOvyMS9++errpNJkPxw2IkRSBXP0IKFjAtLmw=;
 b=iIvES2BkTv6he1Oeqk7OKa8Vz3YNTbnVUi86KwDVOignEMg0Vtrc0ahHddHFVN+PVc
 A4oEwuBlNo8RT2juSz4PujDJF86gNjdsVcN2qg7kSSyLALUPSRAbEf3aAAhMc9dpaYoF
 AOJAKiCmj3bV3TYUBo3v0Q59w7ncc1L/fUZVFaIB7xWH811OZ9oGO3xs0Hz8g2qjR6Rt
 str7JJncMSfAPK24cO//0LXIK7QLucQyj95CqdeoF+unM0SMx/g54WOcjZW1EoHovHLp
 0023ez1txQx0V37mcLkC1w9defNZtT7oUB+pvIf8AxouM5wxIptIMx8eeJ7ZrLHdUCf0
 2pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIll8pMOvyMS9++errpNJkPxw2IkRSBXP0IKFjAtLmw=;
 b=7rC089ziGj3IpjgdFH/Lpm460ivANMmv2GI1BwOW2MRrpwx1qku3r9RXD1THFwl6dH
 mOi085dxkkxwqSO/LqLujxgWTolAuXy/hYRCbAx/K2vT673PqYQ4kfdNh/Raoj2SkJuL
 6VnGpYJfwjTjWCDiwyI1hg6nf8NLv1gN1vLrROKjt8juIC8Iun62zqOAWBUS5Tq0HITB
 uElQ+I6dLyfqqQLxK8Q6gjMmp1aX/lt50uA2NhiDX7423sAm+JQQ6EqbyQ0mli3+AKxz
 egCFXfsaAc3J/WNbHoLqlp4hFY9WDxWd6w+BPXuZjojATfPmTxHHQ6ykmrflOp3n38GQ
 dxVw==
X-Gm-Message-State: AOAM530cQw/8nlutcqFZu+TBWhpA78xpIANWEAB2N5IYJOBvjp5JStRn
 +0WlCFHo71gI7d8U5HO3/Aw=
X-Google-Smtp-Source: ABdhPJzOj8uGKs3W1e3bX+CTyUxtauXTzT2fpvpNN56rDgKSJrhSCuOb6Y4jot+c5DqcFx9j3gcMPw==
X-Received: by 2002:a17:902:cf0c:: with SMTP id
 i12mr3548156plg.64.1644617686514; 
 Fri, 11 Feb 2022 14:14:46 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:14:46 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 04/25] virtio-snd: Add chmap control structures
Date: Sat, 12 Feb 2022 03:42:58 +0530
Message-Id: <20220211221319.193404-5-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102e.google.com
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

Added structures for handling channel map control
requests to the header file.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 57 ++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
index a7828c4ab8..3c16609a25 100644
--- a/include/hw/virtio/virtio-snd.h
+++ b/include/hw/virtio/virtio-snd.h
@@ -257,4 +257,61 @@ typedef struct virtio_snd_pcm_status {
     uint32_t latency_bytes;
 } virtio_snd_pcm_status;
 
+/* CHANNEL MAP CONTROL MESSAGES */
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
2.31.1


