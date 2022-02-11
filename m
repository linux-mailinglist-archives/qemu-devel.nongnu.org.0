Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DD44B30F9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:47:24 +0100 (CET)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIehH-0002em-Gt
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:47:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeEW-0008UI-28
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:40 -0500
Received: from [2607:f8b0:4864:20::1030] (port=32896
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeE7-0003TM-56
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:17:20 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 k60-20020a17090a4cc200b001b932781f3eso5093195pjh.0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GWwevIeaa6FLURrOAePtfrrqg4GSHtZ3K5pDtudS2D4=;
 b=cHnzwtfzNnoIypMSlqZE7s+hkM/ifMOoJjTnoobS672sfSByjfYzDy4Mzbc/jtRyGd
 7vywYG3rbTMGJOa7lS1y+jLdHUbYrk52rkbppuDGJDsEXrBgmoAvpe7cF8rSejy7EWzf
 Xh/ARjVu/TqYmtXCYeD19q3TnVWOLdvs9dgPM/fSazKibHGmYg65hBP4s1zxCPuSriuL
 ns3/xU0fHL84ssYN8OJ7Xy3WD48kMxBRFnQRx+EngeiyRhG9XJ5OnXAD9nCrhKq+WHgH
 SqOpjNSX0j4K0ocV9bDWRM5hK9ePx8TKm0jwHM+4UkC/DPtjnPA4fbj8jjjMMpE4UwO9
 DAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GWwevIeaa6FLURrOAePtfrrqg4GSHtZ3K5pDtudS2D4=;
 b=totEDBnVWntVjkzbl61MV4YedtwyDxte55V0wHYJznsTWhtQgTlqAloCaJbO330kpO
 jBkT8vW5APXfmCiLKhJbqSNdBFcg7rKDV4rlwb1GWqi+sGsVijZaXIjr9ljlVZOWUU6q
 iLPBkL3sl+hvC7kb/YxPORCcoG7PDEj0gg+ITex4jAW8eKf8SIUXwkjsHEi1JnN1aN0D
 i6nOatul13PzJiOGvNHH7GxOba9A7t852f6Ll917bGpIthlT0vmmkuE4l24jpTv4BqKj
 lpwecxc18Ux56OoqIrYFmMzA2dOrMB3/FlRYhEite38HrIBXmyDs5Hhl9ezkdxt+4gF8
 Hepg==
X-Gm-Message-State: AOAM533eBS9eeBA0OvYwNU1b9gtCr+k4qhuBEaAz0O2LMJNDBmw0nLuc
 vM8lbxd/gSdVpS0NBOeOqzE=
X-Google-Smtp-Source: ABdhPJwC5Dxv1HBCReVmL+TyqmRlT85CQTmNt+uO0yn0jbw6sI3eqQxgWM+apCJcXj9k7a1DW9FAWA==
X-Received: by 2002:a17:90a:188:: with SMTP id 8mr2541495pjc.179.1644617833961; 
 Fri, 11 Feb 2022 14:17:13 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:17:13 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 24/25] virtio-snd: Add event vq and a handler stub
Date: Sat, 12 Feb 2022 03:43:18 +0530
Message-Id: <20220211221319.193404-25-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 80a34e1207..81a478d039 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -1080,6 +1080,18 @@ static void virtio_snd_handle_xfer(VirtIODevice *vdev, VirtQueue *vq)
     }
 }
 
+/*
+ * The event virtqueue handler.
+ * Not implemented yet.
+ *
+ * @vdev: VirtIOSound card
+ * @vq: event vq
+ */
+static void virtio_snd_handle_event(VirtIODevice *vdev, VirtQueue *vq)
+{
+    virtio_snd_log("event queue callback called\n");
+}
+
 /*
  * Initializes the VirtIOSound card device. Validates the configuration
  * passed by the command line. Initializes the virtqueues. Allocates resources
@@ -1124,6 +1136,7 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     default_params.rate = VIRTIO_SND_PCM_RATE_44100;
 
     s->ctrl_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_ctrl);
+    s->event_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_event);
     s->tx_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_xfer);
     s->rx_vq = virtio_add_queue(vdev, 64, virtio_snd_handle_xfer);
 
@@ -1192,6 +1205,7 @@ static void virtio_snd_device_unrealize(DeviceState *dev)
     s->jacks = NULL;
 
     virtio_delete_queue(s->ctrl_vq);
+    virtio_delete_queue(s->event_vq);
     virtio_delete_queue(s->tx_vq);
     virtio_delete_queue(s->rx_vq);
 }
-- 
2.31.1


