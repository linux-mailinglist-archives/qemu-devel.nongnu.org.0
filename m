Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607263D46D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 12:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0LCo-0004KZ-Is; Wed, 30 Nov 2022 06:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCm-0004K7-SX
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:44 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCk-0004ei-RU
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:44 -0500
Received: by mail-wr1-x430.google.com with SMTP id w15so13375064wrl.9
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 03:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhoXPC3rByieHAyt5C9yWMVAGH0bkDKM/ebHnq7keeE=;
 b=IWcjhKxv9A59EbNQq/1lm6atlOCbaaWaF2QoRQVJFtLd3ftVp+BJxqaK5MnAXOef/0
 hWG2Mwf6hnmZs6YbF2YqaANdVUgLcyOqIJvQbFziQjpkMtSRmk9hXddAIagYP4oZfuq+
 ByRxl/+YlI9ngeVgniUpat34Wy9w3ckXnI1Jhjvrs7iJrYMJBTSLuGu7C21KDtebN8I/
 rN63NIs+ZyiRH4Tkceyr0HqavV6A52L+Nx/byooswUtkhQvyHE5LSHbRP48SFev+tFjk
 f8YB948NNx+Jjo1VwKGbU+2kssj+safbrK/u5NdJ0QL6lwFemrw2CLtAmLsOqGdRwoji
 /Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhoXPC3rByieHAyt5C9yWMVAGH0bkDKM/ebHnq7keeE=;
 b=HQnnXAnUyEukamgpql4eKAjHt0vDnafMdovTg6cWGXPeZ0CF1dB8YqWCotlUS8mwM1
 gG/GY9n+7sCpxt3HGr67MqMqGGuCCS7/M7RBS/bqCNG+Z3cvTCcyVzHRCeYCGhN6aNKU
 AU/DcCFlzU3+d2MF3Oo5K4xv2YOA6oremgkKSsGA10SPv0EVPOXZTxGmqldxASshlQjs
 HYcq1eshqxRYuAVtbK5UvnlsnsggZaYuZgxmyxuTneKv0f342Ob9oRdAu4UflzZqy0+I
 rAJ1Vn36mftJTeUBV8MnrdzyD7e/cH/iNTrsJ6iDLsgT9rrYoDCnl23rP4PkM260aN+f
 QxMg==
X-Gm-Message-State: ANoB5pkgMUKeF2rtSs0Fylv0kNO6OVabjsmUFOAGNiqCdHDr+sxvFpEm
 Yr5K7b7Sb07P4dq2TwvdH+yqKQ==
X-Google-Smtp-Source: AA0mqf545xcZxICElnR3Bxs/Mht68CkXEVptmdTguScgMmiD9bYZmvz61pniXQJ09Iu/Ipvf0kwQng==
X-Received: by 2002:adf:d84c:0:b0:236:6f1a:955 with SMTP id
 k12-20020adfd84c000000b002366f1a0955mr36453948wrl.111.1669807481250; 
 Wed, 30 Nov 2022 03:24:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003a2f2bb72d5sm6551477wmo.45.2022.11.30.03.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:24:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C391C1FFBB;
 Wed, 30 Nov 2022 11:24:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 3/5] hw/virtio: add started_vu status field to
 vhost-user-gpio
Date: Wed, 30 Nov 2022 11:24:37 +0000
Message-Id: <20221130112439.2527228-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112439.2527228-1-alex.bennee@linaro.org>
References: <20221130112439.2527228-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As per the fix to vhost-user-blk in f5b22d06fb (vhost: recheck dev
state in the vhost_migration_log routine) we really should track the
connection and starting separately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-gpio.h | 10 ++++++++++
 hw/virtio/vhost-user-gpio.c         | 11 ++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
index 4fe9aeecc0..a9305c5e6c 100644
--- a/include/hw/virtio/vhost-user-gpio.h
+++ b/include/hw/virtio/vhost-user-gpio.h
@@ -28,7 +28,17 @@ struct VHostUserGPIO {
     VhostUserState vhost_user;
     VirtQueue *command_vq;
     VirtQueue *interrupt_vq;
+    /**
+     * There are at least two steps of initialization of the
+     * vhost-user device. The first is a "connect" step and
+     * second is a "start" step. Make a separation between
+     * those initialization phases by using two fields.
+     *
+     * @connected: see vu_gpio_connect()/vu_gpio_disconnect()
+     * @started_vu: see vu_gpio_start()/vu_gpio_stop()
+     */
     bool connected;
+    bool started_vu;
     /*< public >*/
 };
 
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 0b40ebd15a..be9be08b4c 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -86,6 +86,7 @@ static int vu_gpio_start(VirtIODevice *vdev)
         error_report("Error starting vhost-user-gpio: %d", ret);
         goto err_guest_notifiers;
     }
+    gpio->started_vu = true;
 
     /*
      * guest_notifier_mask/pending not used yet, so just unmask
@@ -126,16 +127,12 @@ static void vu_gpio_stop(VirtIODevice *vdev)
     struct vhost_dev *vhost_dev = &gpio->vhost_dev;
     int ret;
 
-    if (!k->set_guest_notifiers) {
+    if (!gpio->started_vu) {
         return;
     }
+    gpio->started_vu = false;
 
-    /*
-     * We can call vu_gpio_stop multiple times, for example from
-     * vm_state_notify and the final object finalisation. Check we
-     * aren't already stopped before doing so.
-     */
-    if (!vhost_dev_is_started(vhost_dev)) {
+    if (!k->set_guest_notifiers) {
         return;
     }
 
-- 
2.34.1


