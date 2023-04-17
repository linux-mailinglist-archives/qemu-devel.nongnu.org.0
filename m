Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9816E3F55
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 08:03:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poHwY-0007uQ-I7; Mon, 17 Apr 2023 02:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1poHwV-0007tp-TH
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 02:02:23 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1poHwQ-00043W-Ny
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 02:02:23 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z11-20020a17090abd8b00b0024721c47ceaso11098083pjr.3
 for <qemu-devel@nongnu.org>; Sun, 16 Apr 2023 23:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681711332; x=1684303332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=syA8DPA0vYxtc4caZ7sv7vitLcN6zFkYLX0pkX40gIk=;
 b=E0d7av+MZOt/I7sZCAjcObhSnXJ/Uau+mtf7Zgdq6sV0w9cwfDgVh4fifB/+nJ/PLp
 yOv9D/CAysBvWnE/SujxhGp++XyT6T+pJ9piDeIZJ+vbBBaPac3pIQT1YyZvY4wnrraS
 kOTQCF7iG1jTPlxaB69oeAF9NdmvofKkCiiVEsbpBv3K5IDYcbE/bYe1EqirMJX1aHYS
 0WKB2bnaOMK7uzZZOiZlsQT24dTimI0VGeBExITHYY9NnKg/PcJMhVA/zSGZQBx/IxsX
 VJA6+rjTYjMqt3esAEwJlvGpt3GzW8hF5Qu6PAYOvhc+28armrpyWU1ye8wA++wVxE03
 biZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681711332; x=1684303332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=syA8DPA0vYxtc4caZ7sv7vitLcN6zFkYLX0pkX40gIk=;
 b=IMCxQ811+vTM/M9FvszA2L6mttPg+3ylswJ5kYoG4yeesK/bmqEAhrBC2N3y29tkpE
 JOhG/Zwv/CxwMwEtgxNTD6uu/Tp0WNGMZZhR9GNUcxTE0PPecrZRhLr9woZK4f4pmqWV
 vQR6FxavuWbYuANsuAV9P2Lg+upKiLBXUMN8MyjHwqs6do6MNRRcPoYEXNXCPB3ZKpV0
 0cCrLr4ZCD/f3uBXjvc5vpJj6ffAyXC8UaSste+/EPVPyQwgaoNOq2wwvxip37X5EIWI
 fhBytO3oYL3KEMnGBSgWatOObJaENRmRoHeHZa4ALtcSpKsUWHBnDO9gngBARDAWkfAy
 VvIQ==
X-Gm-Message-State: AAQBX9d3lhqgyFwVau1laealXGOTf0Nc+t5YsZjS0LvO9IP+S9QOlIhe
 BiSsZJ2P+PZogK8jxL0eIjPAvxJENaggEbhRojs=
X-Google-Smtp-Source: AKy350ZLbhFnsFxyGVQ2vlyAm3PWfnejfAuVUQwreY+zRMjiFHG2B1ZbXvo1PzVga9xRMHSriB5d3w==
X-Received: by 2002:a05:6a20:3953:b0:ef:fd71:304e with SMTP id
 r19-20020a056a20395300b000effd71304emr1655410pzg.11.1681711332076; 
 Sun, 16 Apr 2023 23:02:12 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 b33-20020a630c21000000b004fbd91d9716sm6056079pgl.15.2023.04.16.23.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 23:02:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org
Subject: [PATCH] virtio: i2c: Check notifier helpers for VIRTIO_CONFIG_IRQ_IDX
Date: Mon, 17 Apr 2023 11:32:04 +0530
Message-Id: <89d47285e882a99a0513411edcc96aa575512f13.1681710993.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the driver doesn't support interrupts, we must return early when
index is set to VIRTIO_CONFIG_IRQ_IDX.

Fixes: 544f0278afca ("virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 hw/virtio/vhost-user-i2c.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 60eaf0d95be0..45100a24953c 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -128,6 +128,16 @@ static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
     vhost_virtqueue_mask(&i2c->vhost_dev, vdev, idx, mask);
 }
 
@@ -135,6 +145,16 @@ static bool vu_i2c_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
+
     return vhost_virtqueue_pending(&i2c->vhost_dev, idx);
 }
 
-- 
2.31.1.272.g89b43f80a514


