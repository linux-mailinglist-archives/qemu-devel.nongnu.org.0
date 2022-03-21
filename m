Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633F04E2CEC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:54:27 +0100 (CET)
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKMU-0007rC-Ec
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:54:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzw-0005Ib-02
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:09 -0400
Received: from [2a00:1450:4864:20::52f] (port=44695
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzt-0004yM-0L
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:06 -0400
Received: by mail-ed1-x52f.google.com with SMTP id w25so18265418edi.11
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n0zLGC3wQ0SlTqmieuOywtLZzOR6lylxsobKLPet6uk=;
 b=l4I7CGcrywJzy6HbbxuIH9T5X3LJvrUWJ1FYaN7PGv6Xn+1tPQPXrtyJawZZBHDkOy
 B3jOYdjrABJvfvff621apZC7P2LL2rbB+24UQgn8sS8i2adIJVlC3iF2ABjS6z+toTOT
 inJzSZ7f9gnze4YJelI9nYRiO9mQ3GrXee17uurChZPzk1biwihqavUlndxZyXRvIdT0
 R1mh53eO6JXsVREBytmxr0P/dE5WGVLh/VMIogwsVe+tBTn4TXafmHDk41tH4txX92yR
 4GlF5DrcbbTz2+hqMC16Gg2t5pPrLZQES/VDybI3JizEe2CWsZBNOsRVB1gNtBP6sPzB
 k4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n0zLGC3wQ0SlTqmieuOywtLZzOR6lylxsobKLPet6uk=;
 b=Y9ktcraNkJPImubLe3BaUgUw76w0gCgHPUdlh8/MmHwSbxLoYy2QcS8P2qlB9pVGlP
 UlLU2it6rQl0fsZ57lyJF7kPW1z3y1cb9CT4UTc3gOL/FVifm7SsGbwzq4nZCCg4306T
 1zqlrZVj78+hFNZhiZX/tv1l8NYyR292rB1tH8w32vhKx7zk9+ZHV8Fdlmg/QV37SQEG
 jn4+9uy8I3hz7x3wrGE93Kz5jD9LqNavqV3S+9nyLLqboVAdDcr9EK+l1/YEeD6diKqf
 dJGasrHXyxzS1sXPizbH3POBm/cli6a/YIvOaNd5ZqNAxDzjFDYExmIai1IGpdoLUHeg
 XlLQ==
X-Gm-Message-State: AOAM5330YC8nY/FvUj96FHPjER3Qbj1SV6JyV7cSHTw0qEo6UtMSDmdN
 8+yXZomAKavITZZITp+Y+bPqzg==
X-Google-Smtp-Source: ABdhPJwFUAP2UluQCiRQ/9/pZwccnDu4Ea5jdtnuzBq+FmHeoq+j6qyAsGzlqbxK0vvOI1ouGuh2/Q==
X-Received: by 2002:a50:a41a:0:b0:419:d2b:8391 with SMTP id
 u26-20020a50a41a000000b004190d2b8391mr16921525edb.390.1647876663400; 
 Mon, 21 Mar 2022 08:31:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 dt6-20020a170907728600b006dff778258csm2084298ejc.32.2022.03.21.08.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE2051FFC4;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/13] hw/virtio/vhost-user: don't suppress F_CONFIG when
 supported
Date: Mon, 21 Mar 2022 15:30:36 +0000
Message-Id: <20220321153037.3622127-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fam Zheng <fam@euphon.net>, slp@redhat.com, mathieu.poirier@linaro.org,
 mst@redhat.com, viresh.kumar@linaro.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously we would silently suppress VHOST_USER_PROTOCOL_F_CONFIG
during the protocol negotiation if the QEMU stub hadn't implemented
the vhost_dev_config_notifier. However this isn't the only way we can
handle config messages, the existing vdc->get/set_config can do this
as well.

Lightly re-factor the code to check for both potential methods and
instead of silently squashing the feature error out. It is unlikely
that a vhost-user backend expecting to handle CONFIG messages will
behave correctly if they never get sent.

Fixes: 1c3e5a2617 ("vhost-user: back SET/GET_CONFIG requests with a protocol feature")
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
  - we can't check for get_config/set_config as the stack squashed vdev
  - use vhost-user-state to transmit this
---
 include/hw/virtio/vhost-user.h |  1 +
 hw/scsi/vhost-user-scsi.c      |  1 +
 hw/virtio/vhost-user.c         | 46 ++++++++++++++++++++++++----------
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index e44a41bb70..6e0e8a71a3 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -22,6 +22,7 @@ typedef struct VhostUserState {
     CharBackend *chr;
     VhostUserHostNotifier notifier[VIRTIO_QUEUE_MAX];
     int memory_slots;
+    bool supports_config;
 } VhostUserState;
 
 bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 1b2f7eed98..9be21d07ee 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -121,6 +121,7 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
     vsc->dev.backend_features = 0;
     vqs = vsc->dev.vqs;
 
+    s->vhost_user.supports_config = true;
     ret = vhost_dev_init(&vsc->dev, &s->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index b27b8c56e2..6ce082861b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1949,14 +1949,15 @@ static int vhost_user_postcopy_notifier(NotifierWithReturn *notifier,
 static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
                                    Error **errp)
 {
-    uint64_t features, protocol_features, ram_slots;
+    uint64_t features, ram_slots;
     struct vhost_user *u;
+    VhostUserState *vus = (VhostUserState *) opaque;
     int err;
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER);
 
     u = g_new0(struct vhost_user, 1);
-    u->user = opaque;
+    u->user = vus;
     u->dev = dev;
     dev->opaque = u;
 
@@ -1967,6 +1968,10 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
     }
 
     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
+        bool supports_f_config = vus->supports_config ||
+            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
+        uint64_t protocol_features;
+
         dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
 
         err = vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
@@ -1976,19 +1981,34 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
             return -EPROTO;
         }
 
-        dev->protocol_features =
-            protocol_features & VHOST_USER_PROTOCOL_FEATURE_MASK;
-
-        if (!dev->config_ops || !dev->config_ops->vhost_dev_config_notifier) {
-            /* Don't acknowledge CONFIG feature if device doesn't support it */
-            dev->protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
-        } else if (!(protocol_features &
-                    (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
-            error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFIG "
-                       "but backend does not support it.");
-            return -EINVAL;
+        /*
+         * We will use all the protocol features we support - although
+         * we suppress F_CONFIG if we know QEMUs internal code can not support
+         * it.
+         */
+        protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
+
+        if (supports_f_config) {
+            if (!virtio_has_feature(protocol_features,
+                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
+                error_setg(errp, "vhost-user device %s expecting "
+                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
+                           "not support it.", dev->vdev->name);
+                return -EPROTO;
+            }
+        } else {
+            if (virtio_has_feature(protocol_features,
+                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
+                warn_reportf_err(*errp, "vhost-user backend supports "
+                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
+                                 "device %s but QEMU does not.",
+                                 dev->vdev->name);
+                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
+            }
         }
 
+        /* final set of protocol features */
+        dev->protocol_features = protocol_features;
         err = vhost_user_set_protocol_features(dev, dev->protocol_features);
         if (err < 0) {
             error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
-- 
2.30.2


