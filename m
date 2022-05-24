Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4BE532DD3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:48:39 +0200 (CEST)
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWly-0004CB-Gg
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWek-00043s-OZ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:10 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWed-0005M5-LB
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:10 -0400
Received: by mail-wm1-x329.google.com with SMTP id y24so3091467wmq.5
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FgzK20NI+E0P86TSvhLUf2mlqYDXY7EcnmvPOs0iPUg=;
 b=em1GXJ6ftMhEHLwhpn8kbH22HgOaqz4WxzXaq2dmxd+QYbkkAlL9KGx3JekCiN0O4n
 pBst2/i5nDilULaxPtrA2LhUTg1ZSWHQL43WHZEE6URO0xtXGLWX8g3/Ii/zDSFimfXj
 mNtXlGUGqoc2a6woXUO2LAcO1/lPLwVr8uzeQ1WWbwbY1djJaYit1yZ6/HB94HAZ7u+J
 Ch16Qe8UtLOshHIo/WrKnUGZsrYqhmGWOOysZmsgQ01I6RK0JtS5xzVlpPt5hI9eeE7I
 X/+SIB0N8e0ahca+P+i2z656zZjlHrFul/ocPXR/wlg8KHGs2NCfEkN7FXTfvamI0CEy
 qhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FgzK20NI+E0P86TSvhLUf2mlqYDXY7EcnmvPOs0iPUg=;
 b=pr+BsvnPq0U/CKZXAiY9zgFU8uj8s3mJ4oq3g4etozV3kgUE+apFCnVvHOcHtOVYt5
 39N+xjYygHCbQMrR6Z+lZMFDddh3D/ZL/BpK5waSZT8zmL2ZxKDf1yzTUvn781XLJT7I
 PIicKnJ+eZFJLp1OhCTfdQpc4zlslxBvpkTXoCUvmsC8cfafcx+In/S1YMQuXfqTjftk
 BdcH8UBTzXrP1+evR7y7/d2NKgBXx2l2Wl3b+GckfFXZPHy5GsGLHI10E+yiGDspzspb
 BdKEvyna47FOLeAGp3u7fUKjiamuCN4uo0PTKEpWsRgK7yIBOtgedjkTwu9b/bju2R8Z
 y9VQ==
X-Gm-Message-State: AOAM5332xroz9tv5EYFN4aCaopU6dz9f1oTsWKn+auhqxknMaUZ4gu+7
 JfXLaiQS3mSWsRQq0+SvFDWiag==
X-Google-Smtp-Source: ABdhPJyKeVoltlz1xu+Nz7Wuf5B+SQazwoeWc17H8nyicbwxIps2h2roBgpvMvQtHLpmBTTybcJBhg==
X-Received: by 2002:a05:600c:1504:b0:397:4d98:8b85 with SMTP id
 b4-20020a05600c150400b003974d988b85mr4375845wmg.39.1653406862290; 
 Tue, 24 May 2022 08:41:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c3ba000b003942a244ecbsm2678034wms.16.2022.05.24.08.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3B811FFBB;
 Tue, 24 May 2022 16:40:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 03/15] include/hw/virtio: document vhost_get_features
Date: Tue, 24 May 2022 16:40:44 +0100
Message-Id: <20220524154056.2896913-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/vhost.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index b291fe4e24..9f9f57c46e 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -246,6 +246,17 @@ bool vhost_virtqueue_pending(struct vhost_dev *hdev, int n);
  */
 void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
                           bool mask);
+
+/**
+ * vhost_get_features() - return a sanitised set of feature bits
+ * @hdev: common vhost_dev structure
+ * @feature_bits: pointer to terminated table of feature bits
+ * @features: original feature set
+ *
+ * This returns a set of features bits that is an intersection of what
+ * is supported by the vhost backend (hdev->features), the supported
+ * feature_bits and the requested feature set.
+ */
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features);
 void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
-- 
2.30.2


