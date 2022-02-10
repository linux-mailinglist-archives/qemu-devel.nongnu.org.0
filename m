Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAA4B0BD6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:08:07 +0100 (CET)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7J0-0001xE-6u
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:08:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1nI7FS-0007jv-Mc
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:04:27 -0500
Received: from [2607:f8b0:4864:20::434] (port=38464
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1nI7FJ-0002kw-BU
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:04:25 -0500
Received: by mail-pf1-x434.google.com with SMTP id x15so7146505pfr.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTJns6fdcOtlD/K+Iqk8JaH26SG5pW+Pxg5Zfqp1+ks=;
 b=ojvMIVcMMD33FcQPHx0f6Gc6D982P08nCDeFXwiz91LqEIzgum5h1mXp2VJqaI+rtt
 RBQOFun8mjxqHQvFA3h33MZ83Rso27kyVeTMLnChU9p5RRpgHZljGPDYT8yQKa55zKKV
 vYUEMJsx5GBd28eS/tInqwycMHWRtKLoRWq4DEyBJTHtfewRGVC6BTYhDPOoYaCsARID
 WXihL0nhONJ++rK9zKtVUQUbflFyEwxi6VYKRd+cfy1zI8BB9mS05b/z0EfKA+qWeVJr
 89AxJ/4EagveMhSb0JbrpriaRK7aE0SxJYY+uxuYHhkZ+cI9tVOC4SRpmo7HBqrtjuIH
 HJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTJns6fdcOtlD/K+Iqk8JaH26SG5pW+Pxg5Zfqp1+ks=;
 b=Oe9wIp6LCsbziiHahY6Fpirtte/ddCgWVTCY9Fffmd83mT8NJftpbSRQ3LOM4PBASz
 I/JAJersG0QJv9lNiNbYB1gbW0jWrBaPuk/KnNOG3UooKcceUaWNkyHzzMtnvZe6/MU4
 pleIUuHiKBLCIuXmsy2mhE9cDM3Py4Itl8lPldk3H0knFylVKKwiXFMGB9KE1cw6+r0A
 RmfhKIi9SBxKGlcl9QynM6puJIXzxNVHPu2wnSz788K+9tbo4nK3VY0AdoXghhbR8J1U
 HOFXeXNH5iwZ/NJDIhbHAmPGw21y2BdtcYsZgTcDDPkUEEV6JyknpbD6It7ynlOMWvkU
 9zPg==
X-Gm-Message-State: AOAM531Jujr8E5ETP8YV7KNX7DfhTY02oSzZE8o95vPHBUjnGvreC90N
 pJdiLlTB22nu6g8T2J2ipDK3NwxmiW5YJA==
X-Google-Smtp-Source: ABdhPJx9NRIHPpwCxpgGm7zI3bEFyROTAadZHi30ri458tI+kn3A+0rVqGClJtDqWwGnxhtniQlUuw==
X-Received: by 2002:a63:d318:: with SMTP id b24mr5751516pgg.255.1644491050197; 
 Thu, 10 Feb 2022 03:04:10 -0800 (PST)
Received: from localhost ([136.185.132.167])
 by smtp.gmail.com with ESMTPSA id f3sm23516175pfe.43.2022.02.10.03.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 03:04:09 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH V2] hw/vhost-user-i2c: Add support for
 VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
Date: Thu, 10 Feb 2022 16:34:02 +0530
Message-Id: <fc47ab63b1cd414319c9201e8d6c7705b5ec3bd9.1644490993.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2:
- Add missing VHOST_INVALID_FEATURE_BIT.
- Add reviewed-by tag.

 hw/virtio/vhost-user-i2c.c         | 11 +++++++++--
 include/hw/virtio/vhost-user-i2c.h |  3 +++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index d172632bb0cd..42c7f6d9e5bb 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -19,6 +19,11 @@
 #define VIRTIO_ID_I2C_ADAPTER                34
 #endif
 
+static const int feature_bits[] = {
+    VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
+    VHOST_INVALID_FEATURE_BIT
+};
+
 static void vu_i2c_start(VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
@@ -113,8 +118,10 @@ static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
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


