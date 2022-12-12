Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3964AB28
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:09:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rsE-0007H0-0F; Mon, 12 Dec 2022 18:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rsC-0007Gq-8f
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:06:12 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rs7-0004MY-GU
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:06:12 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d20so15395845edn.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSdPcw+nsnmIj7awt/if5au2/e/vXbD55scde0yagoY=;
 b=fe5q4pa7ezjxMXeYgSxukZhVZCXm/FXJgGEXuc5luuP/l46kAxDiYX4y0MvMqGjwiC
 ZtP/8L+U6edCARRkqNScxyNwdLVXOh1bD2GycNk6X9jWw7MD0ydrh3Mr114xwpQScnKL
 FZXLboUG2p0goh42HkqAtTjiPzcxId6mVIAuqIp9V0xw6G8iOoIrdM7Kb1Hf3X3AdT0q
 Ly7HY2lGc46Ib9Cm9/2ug4IKrnRq6BHxlaGkx5LvPNp1gXIBt2SlPx80NksyuM12dUGb
 ebpQlVCdaJFEajMMGoavGrbidfBgUG4Tpy+t5OPruA7SQzuljSCEq51UfyMmFJRoTfBd
 +SGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSdPcw+nsnmIj7awt/if5au2/e/vXbD55scde0yagoY=;
 b=t2k3JtROgRTXU8F8++ZCobGJzDoLP4lyD6q2uV07T9kW8BqoKoyI3EPuNSJFuPNh0K
 oDxFhd+z+IhHFuga/PQytha6dhovV66wWDLcHstoPyKN0jUQ6gVruvWXnl11quf7b+Qu
 98KVs+dNZcRVQnuJUHksP7YLh76EHaJDUov3knU01+dvGvLGynuvGKgtXIuHrcWYjG3V
 KCovRdlg7QlcV4flsTNr/CHIPD9JQbIjK7i+Un7hbn0WFfDM0BwXQXb0rhRede17e4Z1
 PwkhjNF81Uy/8O9oIAKP8/CnmsTM0Y5kL2JSBkhFugzhrrEQgkGuPD0GnPXiVwobhT+z
 TvNQ==
X-Gm-Message-State: ANoB5pkZMTUEAeFeh6DVn8BFBDpbH3Z3JUD8cLIme6b0uJ/jo3LBpqVR
 oGbKKEjmngNItOEp9wbHN86PEfXQMlIWI3/zq4o=
X-Google-Smtp-Source: AA0mqf7wpErraljxyw111T5vmHMCOm1dYC6gpM/3lbUxy8VEacfx1DmcA51g80NZbB5w5VSWTZkRAA==
X-Received: by 2002:a05:6402:5298:b0:462:32d2:9696 with SMTP id
 en24-20020a056402529800b0046232d29696mr13925507edb.2.1670886366061; 
 Mon, 12 Dec 2022 15:06:06 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c23-20020aa7c757000000b0046db7a913f1sm4279625eds.81.2022.12.12.15.06.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:06:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 08/10] hw/virtio: Un-inline
 virtio_access_is_big_endian()
Date: Tue, 13 Dec 2022 00:05:15 +0100
Message-Id: <20221212230517.28872-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

In order to avoid target-specific code in VirtIO headers,
move this particular function -- which is only called once
in virtio_init() -- in its own unit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio-config.c         | 20 ++++++++++++++++++++
 include/hw/virtio/virtio-access.h | 19 +------------------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/hw/virtio/virtio-config.c b/hw/virtio/virtio-config.c
index ad78e0b9bc..aca6ef5e1b 100644
--- a/hw/virtio/virtio-config.c
+++ b/hw/virtio/virtio-config.c
@@ -11,8 +11,28 @@
 
 #include "qemu/osdep.h"
 #include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-access.h"
 #include "cpu.h"
 
+#if defined(TARGET_PPC64) || defined(TARGET_ARM)
+#define LEGACY_VIRTIO_IS_BIENDIAN 1
+#endif
+
+bool virtio_access_is_big_endian(VirtIODevice *vdev)
+{
+#if defined(LEGACY_VIRTIO_IS_BIENDIAN)
+    return virtio_is_big_endian(vdev);
+#elif TARGET_BIG_ENDIAN
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
+        /* Devices conforming to VIRTIO 1.0 or later are always LE. */
+        return false;
+    }
+    return true;
+#else
+    return false;
+#endif
+}
+
 uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
 {
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 985f39fe16..7229088b7c 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -20,24 +20,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-bus.h"
 
-#if defined(TARGET_PPC64) || defined(TARGET_ARM)
-#define LEGACY_VIRTIO_IS_BIENDIAN 1
-#endif
-
-static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
-{
-#if defined(LEGACY_VIRTIO_IS_BIENDIAN)
-    return virtio_is_big_endian(vdev);
-#elif TARGET_BIG_ENDIAN
-    if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
-        /* Devices conforming to VIRTIO 1.0 or later are always LE. */
-        return false;
-    }
-    return true;
-#else
-    return false;
-#endif
-}
+bool virtio_access_is_big_endian(VirtIODevice *vdev);
 
 static inline uint16_t virtio_lduw_phys(VirtIODevice *vdev, hwaddr pa)
 {
-- 
2.38.1


