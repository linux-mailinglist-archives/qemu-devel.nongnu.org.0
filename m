Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902985FEE86
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 15:24:16 +0200 (CEST)
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojKff-0001SA-Lf
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 09:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojKcq-0005lv-V4
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:21:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojKco-0005aY-Bi
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:21:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id a3so7624066wrt.0
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JObu4G225Ub077DENBq/1IAd5XTkA2uFVKuDomxj5eo=;
 b=evGZE+irIXupp5OnO3KjXivSn7Np8O4zmxkHoY5I6kPZSNXVbo0oZyxsr3RSlylpK5
 WWJPxZ8VoOXzm0k3iIsxnWPziEoxJiY7ggzBQLNOvrCVMSSajaWmeEP8Hqi7aeGppngb
 Rrz/zM180tQstQjRtFoZwBlQWDH7W9DjQ2k+MaK8LjTrT4cihWLQM8b0ONvwiVVatKPM
 rhPTaez4tkzoQtZSNGw2ixX8e811XOeCJC5MX0D4hCsMnElmvx0K/f+viYayBQE4CsQt
 0mudxqYyQFquS6M64pPm6wyEY4wgIsb7grfqwRjO0m4LKFPxUZksI471ijLJnznNfHEZ
 vNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JObu4G225Ub077DENBq/1IAd5XTkA2uFVKuDomxj5eo=;
 b=4C4M9dMf5qSHSeo8JVXYtKKem0JNIDeMr3SMFmdLNLLP80ZrMA7D9F4OsJNTH0bnsM
 vKf9DviKRL0BIBHjqE76T1+VOhxxPtMt+9jauTNyix9JlqjSdkB0W9IJJyeI2zjPnn75
 WxBnZ5R2o+MdyD1XNOQflS0HPabxz925F5Tza/Yps4dFaTHc9nmIEWKbf8qtX/2ci42Q
 2uKM5CuUqAQt7CwKnPpV8e5txGSv7mjZwHBDMh3kp23dI9f+XGnaslc3/C/YjmxaL80H
 myvYzr47lm38zNJQFNSnJexVUtDph5qQJfYL5WlDE6g4+tw/cixU+D4W9oSx5+jEuClO
 Dx2Q==
X-Gm-Message-State: ACrzQf1n14SS5F1jY6B9iGd5yA2prQUYfpmie/n9JHCksJL0qxEXLtXx
 I8fnFvJJhwXHGKQjgIebpN9Obw==
X-Google-Smtp-Source: AMsMyM7x2ThU6z3bmXnAIGpY4aba0xpdPr227cioSyAKX3xdePE0R41iBZu87Do9HRxdCYRMvlhevQ==
X-Received: by 2002:adf:fc4e:0:b0:22e:2fd4:1b31 with SMTP id
 e14-20020adffc4e000000b0022e2fd41b31mr3424630wrs.29.1665753676499; 
 Fri, 14 Oct 2022 06:21:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a7bc4c8000000b003c0d504a92csm6798666wmk.22.2022.10.14.06.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 06:21:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2E9D1FFB7;
 Fri, 14 Oct 2022 14:21:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [RFC PATCH] virtio: re-order vm_running and use_started checks
Date: Fri, 14 Oct 2022 14:21:08 +0100
Message-Id: <20221014132108.2559156-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

During migration the virtio device state can be restored before we
restart the VM. As no devices can be running while the VM is paused it
makes sense to bail out early in that case.

This returns the order introduced in:

 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)

to what virtio-sock was doing longhand.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 include/hw/virtio/virtio.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f41b4a7e64..ebb58feaac 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -385,14 +385,14 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
 
 static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
 {
-    if (vdev->use_started) {
-        return vdev->started;
-    }
-
     if (!vdev->vm_running) {
         return false;
     }
 
+    if (vdev->use_started) {
+        return vdev->started;
+    }
+
     return status & VIRTIO_CONFIG_S_DRIVER_OK;
 }
 
-- 
2.34.1


