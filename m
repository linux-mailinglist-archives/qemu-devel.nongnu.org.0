Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680F6E280A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:07:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvC-0006mz-Da; Fri, 14 Apr 2023 12:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLui-0006Rj-LH
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLue-0007yP-8E
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:39 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bi22-20020a05600c3d9600b003f0ad935166so2710937wmb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488275; x=1684080275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ac6OXeQsb/93HLbnF+qlx0Y/JMMvx4eaZHVLLhBGMnw=;
 b=RdaJOdn8FisdymopEgb4lrpOBYUrGosSgLoD8zlv0WiTwZFjeV8KjQmJ76VQFwJA7j
 MDcVYXVpkZXue1Tq0rsvBLC9raEUoAlAUhbpjKkLMCBQn7mnklvRuzxxFW2S37S4ddgx
 XqpsDd9xoSlltwSsw2qc03KPJzkl9hlM4EbqVPHY8BcE9C3X1kBgdZdlhJq3ImU/POl0
 oBc24Tcrlx9iZc65cFw9J/AQ6IgK16TtyIEsKQp5kP9WOx/PWw84d8n3vHyIoqF7h1uV
 YVLsdc2AmQo1rgTB8dt+gsNrkFj49EhwJJQsHLq4JgrIZzcfWBmtoJl/cmCvrxlg6MpJ
 UcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488275; x=1684080275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ac6OXeQsb/93HLbnF+qlx0Y/JMMvx4eaZHVLLhBGMnw=;
 b=VxucAbtAgDJR79N02sXIAIb6md16QYSBvdeIBnx0YcHegZBIR6f9Q6FRUwaudra+zz
 G3+46xO9WAsUu0JgCl+3T1TglDz9IkmjTJAZyOB5CSL/nOJ9RfDjGBcPsCeXlmB0oaSu
 q53cObcXbstXdKlGheF/vKfCTAXnF7MXqjNrjjgN4fLtNh7IbIdkxqiBtnjyr9bcHxO4
 nUJnA5bq+unjdK06WlfG3dUWNQlpBTfSdLgFcIteckOw5qsj9X9rxcOQaghZxl3Efe0S
 DasE9T0rNRb7qUDWrVeEGwMWIjLx+ywveJoblX67ZzPrfQEMQje9Zadj054oRqK+HHz7
 EJ0g==
X-Gm-Message-State: AAQBX9fvASyxJTSrv3VU/x6/4fu1DmZ+2dN8HA0zANvMic7oCWk0xah7
 jO0uutefv5kAdmFRCA3lqjLYvaaHIaXw/wYUD2k=
X-Google-Smtp-Source: AKy350ZeDb18NdiZbLM234lqlDdrWUPlyZQiwRl/oZabytTlOgrzxxs4G0GTFzVbGdNyu4cFCFLcww==
X-Received: by 2002:a05:600c:b49:b0:3ed:5d41:f998 with SMTP id
 k9-20020a05600c0b4900b003ed5d41f998mr4799643wmr.15.1681488274819; 
 Fri, 14 Apr 2023 09:04:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c224100b003f072b22dbbsm4557999wmm.16.2023.04.14.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F07C51FFB8;
 Fri, 14 Apr 2023 17:04:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 01/12] hw/virtio: fix typo in VIRTIO_CONFIG_IRQ_IDX comments
Date: Fri, 14 Apr 2023 17:04:22 +0100
Message-Id: <20230414160433.2096866-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


