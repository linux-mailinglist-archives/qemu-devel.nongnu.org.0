Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C02A48B060
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:07:15 +0100 (CET)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ijx-0000mo-Op
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n7IbX-0000Qy-ER
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:58:31 -0500
Received: from [2607:f8b0:4864:20::1036] (port=39593
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n7IbV-0002mp-SQ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:58:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso5691700pjm.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xYgBi7meUDrNQiQckDrzllyCUb0ZOwkj0uY1sKNF5mU=;
 b=wZKHI4Pmj+50AP6AezBv3SGJmh+BgXKGVs6pf683imI/FvWlssZVMzPTrGyfiDpsAW
 ErCvdLWW3lgb4AZArk0CfHhYK3f3M+0MFNWy7mmZ5m3X+xUXM/7yzKCdn7SDl1IlE9Xv
 ZWqkyq3CByelNrqm5QIIiUMh0KmfmhTMd7b2f+1SAOCvF0/vSeKsWpqLuG1ctkAjLuw+
 z4EKIMaNGO6WAvJQJt4EMAqBH4EDxIuQ94syd7j1M/smGyDaKe/s7bSYr/pY82DmBpsD
 JI1I4BmdTKHnHTF6/FdFfvSqm/exHgNpX9DPsYdP5bjcuaMTQ2wQentpU6CPfgT1N/5j
 N1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xYgBi7meUDrNQiQckDrzllyCUb0ZOwkj0uY1sKNF5mU=;
 b=bViiJXymOiOSJS/Q5Gpn1Is5xyCKExhrW2A34Xo5x3uegCYHeAXmBb5iEwuHk9QvQe
 Tbtx8SxNeweeS3XJcs4EEMQJOLwMTWDnXDwLk/zJ6qcGHKgBLZLNXThSIp7CjDFjNQWI
 S5xJn5P5il7goV4fxDgm+SbJT7+NpcBC6B3MQm4GcGOkGAIXuFV/+1FIS/bfhQaKc+/A
 HUp5Wus3TlaOhmiH2NGv5uHg6HahFjffgU1iQBTle8DeTSUqyT294GWJPWj2n+3SDJkp
 HzHYu8znOqRxHd1yyTF8BDrQZa76PlmtXREv9VnQWzKz8PIKHuUjvwedQ6wPVRj8Al3M
 Z6WQ==
X-Gm-Message-State: AOAM5333GzM1hVcOakysnV0m5rsFzYML/8+ujHr6XN7crz4cdugrvZrL
 bLKtsDtvClDjhtL5egG/1oyRtQ0jTl6T1Q==
X-Google-Smtp-Source: ABdhPJzRZO57PGLo1tmNAEI0a6OH7UulEgMONte1qpV61PSamv/aHmugTyxoJFvLL2DjuKKF+LmzZQ==
X-Received: by 2002:a05:6a00:114e:b0:4bc:b9f1:7215 with SMTP id
 b14-20020a056a00114e00b004bcb9f17215mr4764407pfm.13.1641913107801; 
 Tue, 11 Jan 2022 06:58:27 -0800 (PST)
Received: from localhost ([122.171.221.63])
 by smtp.gmail.com with ESMTPSA id m19sm11226568pfk.218.2022.01.11.06.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 06:58:27 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] hw/vhost-user-i2c: Add support for
 VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
Date: Tue, 11 Jan 2022 20:28:24 +0530
Message-Id: <4f8de2059fc963bb67920a1a2f8481f969a35eec.1641912994.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VIRTIO_I2C_F_ZERO_LENGTH_REQUEST is a mandatory feature, that must be
implemented by everyone. Add its support.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 hw/virtio/vhost-user-i2c.c         | 10 ++++++++--
 include/hw/virtio/vhost-user-i2c.h |  3 +++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index d172632bb0cd..6323a7203ae4 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -19,6 +19,10 @@
 #define VIRTIO_ID_I2C_ADAPTER                34
 #endif
 
+static const int feature_bits[] = {
+    VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
+};
+
 static void vu_i2c_start(VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
@@ -113,8 +117,10 @@ static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
 static uint64_t vu_i2c_get_features(VirtIODevice *vdev,
                                     uint64_t requested_features, Error **errp)
 {
-    /* No feature bits used yet */
-    return requested_features;
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    virtio_add_feature(&requested_features, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST);
+    return vhost_get_features(&i2c->vhost_dev, feature_bits, requested_features);
 }
 
 static void vu_i2c_handle_output(VirtIODevice *vdev, VirtQueue *vq)
diff --git a/include/hw/virtio/vhost-user-i2c.h b/include/hw/virtio/vhost-user-i2c.h
index deae47a76d55..d8372f3b43ea 100644
--- a/include/hw/virtio/vhost-user-i2c.h
+++ b/include/hw/virtio/vhost-user-i2c.h
@@ -25,4 +25,7 @@ struct VHostUserI2C {
     bool connected;
 };
 
+/* Virtio Feature bits */
+#define VIRTIO_I2C_F_ZERO_LENGTH_REQUEST		0
+
 #endif /* _QEMU_VHOST_USER_I2C_H */
-- 
2.31.1.272.g89b43f80a514


