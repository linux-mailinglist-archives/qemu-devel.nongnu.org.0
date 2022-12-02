Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861B56407A5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 14:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p160C-0004Vc-IB; Fri, 02 Dec 2022 08:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p160A-0004VS-Eg
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:22:50 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p1608-00033w-SD
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:22:50 -0500
Received: by mail-wr1-x435.google.com with SMTP id d1so7742001wrs.12
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 05:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5mEXrbLKa/Oco5EuGxFy9+y0gN+AKp0q6NZiAQwDSNU=;
 b=wzgsIJZbc0kYtZa1fYTMK8x5jzjC1Q5y+tBBgOrrHoCNEpCfJ5omtAXQijrw4sIED5
 toCbmSzelcqO+Yw5ilF7q6fX5yscaEsMYtvYL1KuD6VGI+QKMIuAxVBE87dPKltBkgk+
 jepeeJ4B5FHMcQscBtQ4FaY1nB3fCzUQF+bd3i/PGdbHHU9ohrHUHLls/AW6Bslg9CCi
 1WD1GLqj3z9AKF09cbo9gwXaaT5nUgsKhMVS2ubycLmFBNghewJNLA1auRD8skbM0erd
 /kCN/pRaFMo7JV7+M6rlsaOCc9rt54K2xdg+LVJdMhWLfHMRGsmzCoaiRDWEuA/q+Ep3
 K8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5mEXrbLKa/Oco5EuGxFy9+y0gN+AKp0q6NZiAQwDSNU=;
 b=4AG3WOiGSGAurpwmudWrmwEhFljc2yGHF6CqHae50+F+h60yfbcxA7GRuEfc+f/4sw
 AR6WUBvEP6HmcTaf3LOBgex8Vxbao+8XA6/4If3giZtNtW8qdsehdXKSGBzOh+VkvobC
 unAMQlLaSlpAktouOWkQUtdu03W4qeL2Xz1Pv82MIeDDHo+JDx2s2CgT9eMjgoH95aG/
 7sE0yAAvCLkPMOEqcr/ZAupwHZ5l1fYzUYYoFXucCHqrmNE3bDhNN9wofaCAYJkqQYVw
 ucfidBg+M8jTSAV2ZendQpkb33t9MPIXjXbruIefxfLszZCGwtP18/PZD5ErBQxJO+Er
 tfSA==
X-Gm-Message-State: ANoB5pkmnFN3rYE0R2mICMDXERGApSt47JXy+dSJSxHonf+ewpaegskG
 xqNXLSYWxntvUa6k8VbAJhLaiA==
X-Google-Smtp-Source: AA0mqf47saa6UqcKgYmFKJGaXmibLMjUhACPbM3Qb3On6Fkl5AhqXVqnmhVMwwdNe3K7TmdrGc24WQ==
X-Received: by 2002:adf:a292:0:b0:242:2fb2:39c6 with SMTP id
 s18-20020adfa292000000b002422fb239c6mr7129936wra.229.1669987366430; 
 Fri, 02 Dec 2022 05:22:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c2cb000b003c6bbe910fdsm15069820wmc.9.2022.12.02.05.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 05:22:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB4D61FFB7;
 Fri,  2 Dec 2022 13:22:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH for 8.0] backends/vhost-user: relax the ioeventfd check
Date: Fri,  2 Dec 2022 13:22:31 +0000
Message-Id: <20221202132231.1048669-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

While you certainly need ioeventfds to work for KVM guests it
shouldn't be limited to that. We can run vhost-user backends for TCG
guests and either use ioeventfds or in band signalling.

Maybe we should apply the same fix as b0aa77d36d (vhost-user: fix
ioeventfd_enabled)?

With this change I can run:

  $QEMU $OPTS \
    -display gtk,gl=on \
    -device vhost-user-gpu-pci,chardev=vhgpu \
    -chardev socket,id=vhgpu,path=vhgpu.sock

with:

  ./contrib/vhost-user-gpu/vhost-user-gpu \
    -s vhgpu.sock \
    -v

and at least see things start-up (although the display gets rotated by
180 degrees).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 backends/vhost-user.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 5dedb2d987..87d43fb03a 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -21,12 +21,6 @@
 #include "io/channel-command.h"
 #include "hw/virtio/virtio-bus.h"
 
-static bool
-ioeventfd_enabled(void)
-{
-    return kvm_enabled() && kvm_eventfds_enabled();
-}
-
 int
 vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
                             unsigned nvqs, Error **errp)
@@ -35,8 +29,8 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
 
     assert(!b->vdev && vdev);
 
-    if (!ioeventfd_enabled()) {
-        error_setg(errp, "vhost initialization failed: requires kvm");
+    if (kvm_enabled() && !kvm_eventfds_enabled()) {
+        error_setg(errp, "vhost initialization failed: kvm required ioeventfds");
         return -1;
     }
 
-- 
2.34.1


