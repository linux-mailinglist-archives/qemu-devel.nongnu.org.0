Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BDC581A52
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:30:09 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQFp-0006DN-DW
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ86-0003GD-NV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ85-0002Ll-4t
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k12so3724140wrm.13
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YW2c5Ruij34p53cQgqpluStohGrUyVawQTLXfkuUxOo=;
 b=mxvYJxqybnU5jakdvC8TcDlzX/usyNx5Wm0CRIsmFrTfR8pVOkJN0gLh32kz+stE69
 +x0ewWu94fub2IgPadAZjXc/Loy432wGw76WssW8PLLNmrUKeJ2/VSh+c1Mz2K6lw7Vg
 az7/YAw5aZqAmxYsVGgmsnB8rY1uzcXn+mFwzgl4r5O+k72DZHVHQ2k6M50ZmWPBKGyR
 8ZbE9WrahN8FEWI1S//DXA+C7x5EtkpMokn37ldhYJA77yNDMGV3r2BVr+lcYMntgziV
 6Ga00M5/lEcegD/sFHDV2ODJjX/llNH5h+aZV5zKzWFC67JwFzCHxkKtEMKJCpD1LGox
 US+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YW2c5Ruij34p53cQgqpluStohGrUyVawQTLXfkuUxOo=;
 b=QOoV27PcLwtzsP4Llj6UD0a6mFqE6+s4vA0heqcBZLzogSV/jBgMKohTj5h2eSfil3
 FC/QP51hPX1FUvYY83Mk3j/KxWHOFHKYwU++wHHUI4co+SfsaHd2pqqCvWXSqnyivHTA
 xWh7bAZHv8J+rYfCpzz8Zlhboed768z0SKmnfVH6hroDhjpEvo3HvB/OB/R1veOuqqe4
 L/XSR4gyDZp8rsQEAeIza5qr2JG/A5w7RAFLn+6sv25M+GvmbmdnZAF596FAAGkCeg1u
 oXukCYmbDhXl3UnismCeHTByiSaYKLFuEgytORcdGerpHuIuFdqR9WS4A0dWjPTNNghg
 2HuQ==
X-Gm-Message-State: AJIora/dos5MSRiTfuTqLxdwynFGHze9CHRy5rZ3S/8B2jVDfk5Lo57q
 xaj8ufd2RYKKKxin3hKSe80PaQ==
X-Google-Smtp-Source: AGRyM1vkBQxXP6RR1a9KCB5pb7odPrrmyGguK285vAa7LR5xplBNAXaeE/3Y1rMD1+mnVBJraNB1fQ==
X-Received: by 2002:a5d:5a12:0:b0:21e:8327:7e03 with SMTP id
 bq18-20020a5d5a12000000b0021e83277e03mr8714054wrb.567.1658863323822; 
 Tue, 26 Jul 2022 12:22:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a5d4e4a000000b0021e8cdd0c48sm5817324wrt.15.2022.07.26.12.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E72681FFBF;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 07/21] hw/virtio: gracefully handle unset vhost_dev vdev
Date: Tue, 26 Jul 2022 20:21:36 +0100
Message-Id: <20220726192150.2435175-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've noticed asserts firing because we query the status of vdev after
a vhost connection is closed down. Rather than faulting on the NULL
indirect just quietly reply false.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/virtio/vhost.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 0827d631c0..f758f177bb 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -306,7 +306,7 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
     dev->log_size = size;
 }
 
-static int vhost_dev_has_iommu(struct vhost_dev *dev)
+static bool vhost_dev_has_iommu(struct vhost_dev *dev)
 {
     VirtIODevice *vdev = dev->vdev;
 
@@ -316,8 +316,12 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
      * does not have IOMMU, there's no need to enable this feature
      * which may cause unnecessary IOTLB miss/update transactions.
      */
-    return virtio_bus_device_iommu_enabled(vdev) &&
-           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    if (vdev) {
+        return virtio_bus_device_iommu_enabled(vdev) &&
+            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    } else {
+        return false;
+    }
 }
 
 static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
-- 
2.30.2


