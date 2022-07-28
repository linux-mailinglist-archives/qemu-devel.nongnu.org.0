Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868358410A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:24:41 +0200 (CEST)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4RM-0006fY-Gm
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yx-0003jg-AO
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yt-0000O8-Iz
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id k8so106401wrd.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3nGxeo53LwaMo+sziN/l2Vq3ARUUV/BFGaJ8lB68So=;
 b=MGrs9tXDlvLXSSn7iB84K2BjzlHGW4MRyLBsDK66IfpiJRcqVGx9gqgLojWQu6ZTmA
 bIOmPkjmey2DYXMe3Dm/gKxU6v89usiaFqKialqe6kzKeSRVRBqI2OTHwyDWReBqfOB3
 yW1yeTsJdPqKaMDkkLdmQkZafyU60uUQ21gtRBzYdIWjweyJX49zsSAkPJ+wH2i2KgZB
 OQCUwqBRKS/uMUnczv/iYOmjdvkdIRr+sH5Tq0tlxNpBUri7qJO+t29trYN2bekaBBsm
 FkIA/q18c6fEQ++sBGfq7upoCRz5v60LlU6qOumPtIzyAlUkSp/aVgeO+eUB47m5qVHX
 L4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3nGxeo53LwaMo+sziN/l2Vq3ARUUV/BFGaJ8lB68So=;
 b=kVR7tdVa+z/Dt/rirWA6VN3sR9OhwhWKJqhmvPCxJkwXILFzumFRfwo9lDY3+bqyZt
 OpzqROSP4zrmXkKb8X1L8gEOJHeTHL4Oja3KCkYegym4U3fBkVixSCqF3v21+NAZ21v+
 1ryLHasvbR709ZwZi9HNmlAJM4SlbwV9K/wUPoFYhyAnwB4Yq/ZijRMyxkUy6aKs/Kl1
 Os5napXwz1VDGBV9Wi0BYxxRdftCTS4QFKbYFi+VSUwmcF33daQIRS5m4C0JRX1LbUD9
 NO8ArBNEemeKM+PKGqCVD65DaisUssLDCYLktg1OIEakVBLsGa/RphwOQlcK5+CNCgQB
 QCWA==
X-Gm-Message-State: AJIora/9OrDEymwDGPQ37NElHUnJv+mpXD9y7SIvf/fND7jmq55yJ19v
 +UKu37I6Ih5nNsg9fim9ufG+UrXQ78E15g==
X-Google-Smtp-Source: AGRyM1uPlByFFoPv3UiDPJRl1cyE8QuFEcDNHWIxbWL5pQVWEpAKeWK2sO1W6t+VBaGTgkydyOkFQg==
X-Received: by 2002:a5d:648c:0:b0:21e:9872:5a38 with SMTP id
 o12-20020a5d648c000000b0021e98725a38mr10321607wri.556.1659016508197; 
 Thu, 28 Jul 2022 06:55:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n65-20020a1c2744000000b0039c54bb28f2sm1397186wmn.36.2022.07.28.06.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:55:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C53761FFBA;
 Thu, 28 Jul 2022 14:55:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 2/4] hw/virtio: gracefully handle unset vhost_dev vdev
Date: Thu, 28 Jul 2022 14:55:01 +0100
Message-Id: <20220728135503.1060062-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220728135503.1060062-1-alex.bennee@linaro.org>
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Message-Id: <20220726192150.2435175-8-alex.bennee@linaro.org>
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


