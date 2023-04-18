Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148DB6E695A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:23:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5T-0006lU-8p; Tue, 18 Apr 2023 12:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5R-0006ka-Hp
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:45 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5P-0001A0-Mx
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a8-20020a05600c348800b003f17ddb04e3so78227wmq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834902; x=1684426902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ac6OXeQsb/93HLbnF+qlx0Y/JMMvx4eaZHVLLhBGMnw=;
 b=fEqXtv0uMEXZkBdY+0HDek1T3/aGFwcZVkqACLkTTbnaQ0rm7ttZ8wyaGHOv1rzHMo
 xgJtRu/Nq14Z/uXXT7ndh5mClejqNkwMOvVA8VuRlIuumaCOO68/tZErEDYEPH/4fT92
 IG0c/65CaD0dOOL8Okka7ejeTsZrYsolAkAyFwLHwID6M4EtfCxnyPBTmGQuTDj/eYgp
 WCDf3PSm6Tb24LFMwphWBna3znh5ZMqHWQoEuDYiPLwylKQ+y8Qz16KXUOS4r4NZWgdC
 +B719FRzD8DdzcTNbGs9Rw2UyOjiK+DaRiuowc4fcJkYLa9x49EYw7AVXs38zN6L+YnX
 3IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834902; x=1684426902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ac6OXeQsb/93HLbnF+qlx0Y/JMMvx4eaZHVLLhBGMnw=;
 b=R2KvdWuEn+3kG4TmT0QKSYujCxN9/mDXOvno9QWygrsFyQYQ07VWDT4qdwZvuHnyBo
 nSiiYzt6EBPSWrHzXF+NScx9twKJTWcH8kF7MPQUR3RltZ032O8FWABWJQQJzXyewf9Y
 6OHeu6o0ZtES0/uTE0hejVjj5RH3o+Gs/ykzyiGxDPcrkpiqMGi6auaxzTtgTtlV8Of1
 jef/qmITw+eZLsSUIrpAN9dAfRdrvTab8GKw7BNjGgwt6fQJ5343c5mGoNzo9UqawcFx
 a71y1WuGvfWLzhJKLCj/rVKdSPwDMGY/l6gV2aLbmX3dOQ2HovLv8ovcHudwYrvf0Zeq
 depw==
X-Gm-Message-State: AAQBX9enIcTSsaB3n+WKc1LjH6Mn+0gF0Lily/jrXkrANCTr9ssa12uK
 Hu7WwQt3KkVownPelCO9lS9E+w==
X-Google-Smtp-Source: AKy350aWm7ea2OEEHSzz99/n9o6fCfz+9/NN/Khetgre6ye6Y0jdWayirqWugg563d24NeFNMQK3YA==
X-Received: by 2002:a05:600c:ac4:b0:3f1:6ead:34fe with SMTP id
 c4-20020a05600c0ac400b003f16ead34femr8681728wmr.26.1681834902395; 
 Tue, 18 Apr 2023 09:21:42 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c205600b003f16f362ae7sm9532247wmg.21.2023.04.18.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C6F91FFBB;
 Tue, 18 Apr 2023 17:21:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, virtio-fs@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 03/13] hw/virtio: fix typo in VIRTIO_CONFIG_IRQ_IDX comments
Date: Tue, 18 Apr 2023 17:21:30 +0100
Message-Id: <20230418162140.373219-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

Fixes: 544f0278af (virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/display/vhost-user-gpu.c    | 4 ++--
 hw/net/virtio-net.c            | 4 ++--
 hw/virtio/vhost-user-fs.c      | 4 ++--
 hw/virtio/vhost-user-gpio.c    | 2 +-
 hw/virtio/vhost-vsock-common.c | 4 ++--
 hw/virtio/virtio-crypto.c      | 4 ++--
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 71dfd956b8..7c61a7c3ac 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -489,7 +489,7 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
@@ -506,7 +506,7 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 53e1c32643..c53616a080 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3359,7 +3359,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     }
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return false
      */
 
@@ -3391,7 +3391,7 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     }
     /*
      *Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 83fc20e49e..49d699ffc2 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -161,7 +161,7 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
@@ -177,7 +177,7 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index d6927b610a..3b013f2d0f 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -194,7 +194,7 @@ static void vu_gpio_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index d2b5519d5a..623bdf91cc 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -129,7 +129,7 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
@@ -146,7 +146,7 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 802e1b9659..6b3e607329 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -1208,7 +1208,7 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
@@ -1227,7 +1227,7 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
 
     /*
      * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
-     * as the Marco of configure interrupt's IDX, If this driver does not
+     * as the macro of configure interrupt's IDX, If this driver does not
      * support, the function will return
      */
 
-- 
2.39.2


