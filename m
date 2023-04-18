Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F26E6987
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:29:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooCt-0008D8-VZ; Tue, 18 Apr 2023 12:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pooCq-0008Cz-Je
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:29:24 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pooCo-0002jo-MF
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:29:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso143776wmb.5
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681835360; x=1684427360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QuJZaLubT8BhFuE9ylcD4Gy9hPKTq8TPugnpWu/KBiw=;
 b=t3HCEI064XFBRsR+tvVoJjytqVHXY8E+Nut66xpWqyIdLmbKR9S8pt8L1SFUjT+mPJ
 3a5FjtnWl0y7ilDrcPUhfSa/4jIctYVL/GGYLdkAi/zWxb57VkBphyc8IzLt3QGYFInz
 NdRy9drlJF+0E7pNxveRiUsUr0NBlbBGF9D/E2n73mepPZvF86mN9Q+OrmOicQPVND72
 4lWs+C87PwoNPKz3TShgfK1zRu7LiuZaRzAZRUIfBQ+prohi0R1gRLTT3T0JKEbKdUqp
 HKDBK1NlL8ZtRu6kdKrcqdBJz7wKFcHmAoxrHS/z+VGRwUbJxliSNzUj03ApLuh5Fu59
 hY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681835360; x=1684427360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QuJZaLubT8BhFuE9ylcD4Gy9hPKTq8TPugnpWu/KBiw=;
 b=LMehk8iT+fkxg6aplnWrn2jsf8vXcpuGJaqDNUuxMlMqMKBctMQXnf7wDQvEHOMC1b
 7IBpRFnYdiU5NPet3GHYlf0Z0A4xCMT3io7hCb3oU8Uz4DIauCIO1KDd9fLaS/acvmL/
 8jf4lwSfZ9TiUpXhTiT+soJF4YTu+wc5/JSXRBC5Dp16cO++FUrrAgRQXtAq1rz5LHL+
 H+UdeEi1fLO6AUAt/KDdb54OeAI0Z3Qfgzi+ZMt92tfYPDxskfax69G/4NZcMVoJeP/0
 A+5cOjst0Anr67jRp2J1FqeWczTcDdusaQZa83+3cC7TO0tnDfWf0RdV7binYgjU8cuw
 Bjkw==
X-Gm-Message-State: AAQBX9fsfrZ6h2odnfu7aWImATrY/SzA5T2HHI6HjraXvGUYWXMrO3r/
 2O8S0wnrtqJp+OCNHlg6++3AlQ==
X-Google-Smtp-Source: AKy350YNQudDN1NTLOM25n8TgBgWHR9vzbn3Rjecdg9LkJw6UYFwVelNmSewsm3wkCCCeAaX2jg1yg==
X-Received: by 2002:a7b:c01a:0:b0:3ed:b56c:9496 with SMTP id
 c26-20020a7bc01a000000b003edb56c9496mr13031205wmb.31.1681835360679; 
 Tue, 18 Apr 2023 09:29:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c4ecf00b003edc4788fa0sm19486588wmq.2.2023.04.18.09.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:29:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A65D31FFC3;
 Tue, 18 Apr 2023 17:21:41 +0100 (BST)
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
Subject: [PATCH v2 13/13] docs/system: add a basic enumeration of vhost-user
 devices
Date: Tue, 18 Apr 2023 17:21:40 +0100
Message-Id: <20230418162140.373219-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Make it clear the vhost-user-device is intended for expert use only.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - make clear vhost-user-device for expert use
---
 docs/system/devices/vhost-user-rng.rst |  2 ++
 docs/system/devices/vhost-user.rst     | 41 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/docs/system/devices/vhost-user-rng.rst b/docs/system/devices/vhost-user-rng.rst
index a145d4105c..ead1405326 100644
--- a/docs/system/devices/vhost-user-rng.rst
+++ b/docs/system/devices/vhost-user-rng.rst
@@ -1,3 +1,5 @@
+.. _vhost_user_rng:
+
 QEMU vhost-user-rng - RNG emulation
 ===================================
 
diff --git a/docs/system/devices/vhost-user.rst b/docs/system/devices/vhost-user.rst
index 86128114fa..7038cece3e 100644
--- a/docs/system/devices/vhost-user.rst
+++ b/docs/system/devices/vhost-user.rst
@@ -15,6 +15,47 @@ to the guest. The code is mostly boilerplate although each device has
 a ``chardev`` option which specifies the ID of the ``--chardev``
 device that connects via a socket to the vhost-user *daemon*.
 
+Each device will have an virtio-mmio and virtio-pci variant. See your
+platform details for what sort of virtio bus to use.
+
+.. list-table:: vhost-user devices
+  :widths: 20 20 60
+  :header-rows: 1
+
+  * - Device
+    - Type
+    - Notes
+  * - vhost-user-device
+    - Generic Development Device
+    - You must manually specify ``virtio-id`` and the correct ``num_vqs``. Intended for expert use.
+  * - vhost-user-blk
+    - Block storage
+    -
+  * - vhost-user-fs
+    - File based storage driver
+    - See https://gitlab.com/virtio-fs/virtiofsd
+  * - vhost-user-scsi
+    - SCSI based storage
+    - See contrib/vhost-user/scsi
+  * - vhost-user-gpio
+    - Proxy gpio pins to host
+    - See https://github.com/rust-vmm/vhost-device
+  * - vhost-user-i2c
+    - Proxy i2c devices to host
+    - See https://github.com/rust-vmm/vhost-device
+  * - vhost-user-input
+    - Generic input driver
+    - See contrib/vhost-user-input
+  * - vhost-user-rng
+    - Entropy driver
+    - :ref:`vhost_user_rng`
+  * - vhost-user-gpu
+    - GPU driver
+    -
+  * - vhost-user-vsock
+    - Socket based communication
+    - See https://github.com/rust-vmm/vhost-device
+
 vhost-user daemon
 =================
 
-- 
2.39.2


