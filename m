Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA983587A22
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:54:49 +0200 (CEST)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIobx-0003nG-0G
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXb-0001HH-4v
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXZ-0002Mu-4Y
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id z17so12467092wrq.4
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=s3nGxeo53LwaMo+sziN/l2Vq3ARUUV/BFGaJ8lB68So=;
 b=nuKTgJ7zPvF6MD5Kz5loiYT79OGf2I6ozVWfeOFJhNSaHRJJOorc0myzYISRYYtABj
 OP4t9J7BUb01J2DFYLED6jahPDrUIT+FGL5orKyLwLD0mBwHKRk4qE5QmDZxK5KVVZIT
 2zYeZD6ko5phv2cp9QfB7KgGKXSMlYTlzcijz4aIB2LEnyPHXoZe1ttBeqgefsrxpy19
 ekl7BUTgXgr1/49G4/Pte36E7Cs8FfOEVW0nCIzUo8IkbILDyQ6zlxfhu2L3qULwxCsX
 nQWtS35g9Lp9JSzUykVJKnH+kM0EjtG2Y2peAWu4yA05Xnp8aHgrYyftAmaWf2vk0J8u
 yvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=s3nGxeo53LwaMo+sziN/l2Vq3ARUUV/BFGaJ8lB68So=;
 b=fOfd+JXbG9UXZQR/lLvEdzE1pQXbfLYPNP1Oe2T2U34T6X1v+/8L+cNRMDh/ZGREPL
 MrbjNgTTP4X6l3S49HVxDwGqaonbR5e8hdcFYuc8NYK8WPZ9eH5H1ZR717Ky5RwLraDV
 hJOLp3x+3cE8b3jIqdSoiZePcLfJkLtDPuOwMBZMxHg0MoavNZiMSdYBemSxQrkLc7mu
 mNaHhU52BezQOSCC6Hwur0kZVlQJ1d22TMklYguY1ETrc9UKpculiZVwYlgx4CgEFlQW
 GpPAWdONSie/d79tU7IIFX1lxSzo6ARlCZWn9wNrSdWBW2S2pEqEerJLlcCXYdpSMqSX
 6mKw==
X-Gm-Message-State: ACgBeo2YGX3w6aWYwXrz6C7nZSCv53aja+PZlDZQdXBYm+R3YeuvHgyf
 509mcFNoVfVk/qk7alP6aiYU9w==
X-Google-Smtp-Source: AA6agR4mVEw+AwyK2sAUkfmIMOJygRb6U5oBa2PG77rwVpvjZ08wn21i3mA+9MsaqFs+uYftLo3YMQ==
X-Received: by 2002:a05:6000:1849:b0:21d:9ad7:f27f with SMTP id
 c9-20020a056000184900b0021d9ad7f27fmr12155808wri.445.1659433814394; 
 Tue, 02 Aug 2022 02:50:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a5d6044000000b002205df9ce16sm8307240wrt.97.2022.08.02.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D66831FFBA;
 Tue,  2 Aug 2022 10:50:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 02/22] hw/virtio: gracefully handle unset vhost_dev vdev
Date: Tue,  2 Aug 2022 10:49:50 +0100
Message-Id: <20220802095010.3330793-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


