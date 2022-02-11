Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B14B3071
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:29:07 +0100 (CET)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIePa-000863-5Y
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:29:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCR-00061y-EW
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:31 -0500
Received: from [2607:f8b0:4864:20::429] (port=39788
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCP-00038N-8a
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:30 -0500
Received: by mail-pf1-x429.google.com with SMTP id r19so18604084pfh.6
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TPMZja0FGIqQNg1We5peUhb5AlaSgkyeswbqRNpyQA=;
 b=L6iTdiWT7Tl8vRqxAuJz/qwh1cKXZirecIoG9qXcIXifusxAIs7BmmyD3cTxvrLR9i
 LOSQXcuX76Dz/1HKjcR6Lwr3duHXoEAzaV4eElutjje3u3IQ4Ivz6ZWZ+bvnoxeMHOH/
 QSToWX1Lr8gP5vCjMCVLeHD7deLC7YgfBjw+H9lySYBrQZ2JXu3V1cmJ9eUsq1jLLQ6G
 43kTLVl2TH10PDIh0BccWN3k0FtFM50gVzF2PEho4hnzgBtDvkDvVHqnrdiZfpyDyidf
 uJTbV+VDsA6tzppgOXONnKi8UxYxQpdImyQIB7dYLpvhsV+15kweNhI99wTWTpxDQAJa
 KaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TPMZja0FGIqQNg1We5peUhb5AlaSgkyeswbqRNpyQA=;
 b=pO+0akjsVr/duPUX9Y5wbhhrEVtfWhN1j2G7y0LSBBrGXdd9iU2T8xNsRq+qPBACL9
 CxJfyW8LhG4kvMW6shXL8tPU/v8QRYH1TB8ylUWdvil6cKrXbdQRuCSbM4qpVpj0aahC
 Jre2GwV4DPjfOJKVVU07YmELfC3uJN+RBG/Binzv8R6AtAYHD+iFhBoEo/TtmbMnW7aL
 kuVF3SQjtqgvnwtG3rtMjrxBPMBwvweO5Y596y31gUAfAurTkbC8BXse7z8+SViO+mcN
 e9MsyJnmJKRXB5+1MYC5igDhsStePaKC/MJ04M5GRpKzJ/Ar0l+omN5lBbOyUKhKb0mQ
 4UPw==
X-Gm-Message-State: AOAM530zY0Tz32QMBG9AuwwvQHooFOka2fk9ivBv3e+tD0sdY0tMReE4
 VSV0Vu369Dgr/2IaCk2PZ0fM2f2SRsM=
X-Google-Smtp-Source: ABdhPJwzMgQvc/uVs1ccTroI55QDpfF1fa7vsN/VhuygkPVMzq/U5OT8MPC+NTHAHtJgOhSZ6jd7cA==
X-Received: by 2002:a05:6a00:1588:: with SMTP id
 u8mr3638614pfk.4.1644617726869; 
 Fri, 11 Feb 2022 14:15:26 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:26 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 09/25] virtio-snd: Add code for the realize function
Date: Sat, 12 Feb 2022 03:43:03 +0530
Message-Id: <20220211221319.193404-10-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x429.google.com
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

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index afa38adee7..b51f6c7523 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -89,8 +89,43 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
     return vdev->host_features;
 }
 
+/*
+ * Initializes the VirtIOSound card device. Validates the configuration
+ * passed by the command line. Initializes the virtqueues. Allocates resources
+ * for and initializes streams, jacks and chmaps.
+ *
+ * @dev: VirtIOSound card device
+ * @errp: Set if there is an error
+ */
 static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
 {
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOSound *s = VIRTIO_SOUND(dev);
+
+    virtio_init(vdev, "virtio-snd", VIRTIO_ID_SOUND, sizeof(virtio_snd_config));
+
+    /* set number of jacks and streams */
+    if (s->snd_conf.jacks > 8) {
+        error_setg(errp, "Invalid number of jacks: %d", s->snd_conf.jacks);
+        return;
+    }
+    if (s->snd_conf.streams < 1 || s->snd_conf.streams > 10) {
+        error_setg(errp, "Invalid number of streams: %d", s->snd_conf.streams);
+        return;
+    }
+
+    if (s->snd_conf.chmaps > VIRTIO_SND_CHMAP_MAX_SIZE) {
+        error_setg(errp, "Invalid number of channel maps: %d",
+                   s->snd_conf.chmaps);
+        return;
+    }
+
+    /* set up QEMUSoundCard and audiodev */
+    AUD_register_card ("virtio_snd_card", &s->card);
+
+    s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
+    s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
+    s->jacks = g_new0(virtio_snd_jack *, s->snd_conf.jacks);
 }
 
 static void virtio_snd_device_unrealize(DeviceState *dev)
-- 
2.31.1


