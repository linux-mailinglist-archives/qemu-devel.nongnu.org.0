Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6149582A6C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:11:47 +0200 (CEST)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjdR-0001fQ-SN
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPC-00025n-Bc
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPA-0001sf-MK
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v13so17284387wru.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3nGxeo53LwaMo+sziN/l2Vq3ARUUV/BFGaJ8lB68So=;
 b=MPXPZjDPRWub//Lbn5Vl/VWbjqy0626GIuRBfMBkJiE5lCqJA48YGwDM8c9BY8u4cl
 FRIx5Z7Ns30kG8v5HYbAHgzJRSKwFEXCe+EUmrfhWqODXOXysLIo3dGWelPIk3Hv15HF
 aMeCQJChIFkuMBtAfa8qntLcctZ8o/izXobOHshci31ZknqsM5WBkwpzw4nwhNA3hIrm
 llMMU4GPNJrsI49xqthkB13FyX0wwbhivUc1JgzKI5+jFhQNLdYNs8uwMvCVG/l1UQua
 7uIdOK8fU3l926gYAGmEjaOa5IgUvI/LcxTQ3VIreN3p2Sn85izstGxZ50hNB+yvKHgM
 XZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3nGxeo53LwaMo+sziN/l2Vq3ARUUV/BFGaJ8lB68So=;
 b=OmVN6U70SZe80vCB87iJVUs0HPKeUlu+OcYX/+ZDUJL68B70RJUNvNZL604ZC4NsTL
 X8yPvkvcMpS8WB//41qrj3v+ZArcx0+NZg++4eiiE1HweDKkjbdsFD3nfSDY3CVM+++F
 oif31hCTF/A30Em6Dx5YzDX9Ot+boevy8DnD9e5PIn3Bw4zxZUwT1abb4puOxpk75Wn1
 EzS2gfy48F8UXR6xLV8UK83EC5LUXsmgBA34gqTTrndlMdqL17cbD+mqkUfiD7+YbpSc
 nE0h+6jFTt6rrJHzHvB/M2+FBZwX3s4/n47TEiDPFMj0sh5Oq+WoQSTH+Zm48uj5QnKv
 3Pvg==
X-Gm-Message-State: AJIora9eoSjulwC9ZO4OUEAqL5Xw8dTadu6gZeUAZRwEnYW9G+7JBceJ
 xfwmx/SJrIxi0goX2UhxSqHuDg==
X-Google-Smtp-Source: AGRyM1vWjvf1oZvLhhLTBTzQUslYUO0lHfb36Xk+7zqOgakOhn8pNOPQfqCkPKC9Bz4V0PugHeCRfw==
X-Received: by 2002:a05:600c:4f4f:b0:3a3:3cb5:c02d with SMTP id
 m15-20020a05600c4f4f00b003a33cb5c02dmr3642025wmq.198.1658937419222; 
 Wed, 27 Jul 2022 08:56:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r8-20020adfdc88000000b0021e13efa17esm17254702wrj.70.2022.07.27.08.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:56:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3A391FFBB;
 Wed, 27 Jul 2022 16:56:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 3/5] hw/virtio: gracefully handle unset vhost_dev vdev
Date: Wed, 27 Jul 2022 16:56:51 +0100
Message-Id: <20220727155653.3974426-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727155653.3974426-1-alex.bennee@linaro.org>
References: <20220727155653.3974426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


