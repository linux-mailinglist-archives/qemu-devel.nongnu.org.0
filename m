Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3534C63AE0E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhCI-0005jm-2g; Mon, 28 Nov 2022 11:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBz-0005ej-65
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:17 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBw-0004oc-34
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:14 -0500
Received: by mail-wr1-x429.google.com with SMTP id n3so17810866wrp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMVfFZ7FRLyaWuIyfzWfcdKs3MKvXj0482M/1lNqVQQ=;
 b=LJOxt02OgjyJIR9iTfZ8wP10HsZrsOxULuzBNdKFHwY08lOm1zdIr3Hxu1EjJU1+FX
 dB/a8ToszYsMSZks4DbDED3fPSq6tZXEBZL2rKjpndPQj6lk1aWPHdrS3sqro+ojWmsw
 qTKNLxG14GEex9N1zo6uphYlX9Lv85CJficn5pMCfXq5hztoGlO34hAMZRWddlLHAW4Y
 E11AkcuXwy6YVJbBXBVudRq8+GO5AY/iM3+Ddlbu3QCy6tey7u7q/eQsk8LYa8rfSUln
 qu5Pn27cEZf2rCk28rNy9vujiJM4wQYOvppfRHXqRWkdZDeg+TXOSM0TvgIST31tZFe3
 5d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMVfFZ7FRLyaWuIyfzWfcdKs3MKvXj0482M/1lNqVQQ=;
 b=qMGQdJ+jPdP+kqO+2TZ4mpR4C++4t1TM7kpgLjWOdmt/Yeki4g/eoWI+pwlucZyk8D
 oo/9dMXN3nc4Hy8A56k0AEsTDJ1OyHpnRJlBz8C9kCinBbZrWY84yHaFr/Ku1jmDo0/M
 6vKyzb1LblEUXHVqMB865ucWCZevOV0kbjJNthIOYE2BnmEtByvJ+crTSuw2i0CjtKMO
 hbVyfcBAiwubCThabf1om+nna56v6G6qmGMzsWxjD/cwN3NSojktGdy+38hdWH9Zj9cQ
 05Ft0H6rOGfd040pLOFiQM+Jxzb1hfsUisqycf671btW1dxBzOKpN4wUXODx6gVt7xrF
 Fsug==
X-Gm-Message-State: ANoB5pmOOxLGq2n6GYiIaNQcb1Ngvr5e5vhxNeaLKUoKajab3O4hczVT
 EFYs9NYQ/QEcFy3yl9TWRoOeyw==
X-Google-Smtp-Source: AA0mqf7rlRJVhV4YwqEtlAerSEKv1lYny/K+Q4iExIlMY6fZxfGomvqsTBwTqhZlRh7lCWt37JPUWw==
X-Received: by 2002:adf:e5d0:0:b0:242:17c9:a1e with SMTP id
 a16-20020adfe5d0000000b0024217c90a1emr3583140wrn.514.1669653669005; 
 Mon, 28 Nov 2022 08:41:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003cfd4a50d5asm20134820wmo.34.2022.11.28.08.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:41:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79F7B1FFBE;
 Mon, 28 Nov 2022 16:41:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 6/7] hw/virtio: add started_vu status field to
 vhost-user-gpio
Date: Mon, 28 Nov 2022 16:41:04 +0000
Message-Id: <20221128164105.1191058-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128164105.1191058-1-alex.bennee@linaro.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
index b38e4d4cf0..75e28bcd3b 100644
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


