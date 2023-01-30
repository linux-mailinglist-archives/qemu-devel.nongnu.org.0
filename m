Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4488680E02
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTZb-0002D8-Vo; Mon, 30 Jan 2023 07:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMTZX-0002Cv-Gp
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:47:43 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMTZV-00079w-Qu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:47:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m7so10938338wru.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 04:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EkzAhXkjPYMqQD6lasia7w4DvtWO7ASRRB4oJPhD+wI=;
 b=GTLVCXP5QcBqk+2Jknm6JM8ck6uTGe+sC4mirEoAxd1xynfJh6WhKl4lfJU0HZjUVg
 oi7KjxgaQoLZs9JVf5iJEt07xTYUrOwkTqGzv0elaQYCmPwRqlO2GgxwFQoOidnmNQaX
 qyDW0VF4vYGXim99ZcEhf8P2yli2tcrSSZVHA7n/7bIp5PhG9y7sdNFvag7rN+6GGt/0
 HNDKe65mq1mMIOMe+fCJlXSmAPK4EUqWXY4U6q/mBYcn6MaY8+RYITYHRvNrz1ZAD+wz
 +KfUbZEVXS2a3RH0CuFmdS4rDk8uinrLgAlnaNLWYe+ylXnSxN1iOcT+g87eSCP9gxUu
 kYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EkzAhXkjPYMqQD6lasia7w4DvtWO7ASRRB4oJPhD+wI=;
 b=jkYoJCwIYqWoDDs2lVnlUvI4Kn1DlJDRHiy7tujRHhMb8cOlzAlsPoSc3muuFG4uvK
 DCgIDeP47pn59kCxgdxkjZw+GAjsNf8F1hye9dr0ZEo3sjCdvscyCZBOFFwS1n5Z60cQ
 4pFmsS4TbJT2oFzCfd5tPqJb8OP9jjwdlStFrsckaoJmZWjH2Mf8qW1hk3ItWLEjPIpL
 q8onIkrq+YrS4UT/s/xDdNSsDuqfPOex2oIvTox1Tzhglb2CL5IEm5JxGr7Sl/QKuUDc
 D/iJ0pYGGKCHpafpuiZsu+uH9tmKLS4yCsv/KmB85wgEa/lQmYbWJmSqURuZkZsOw9KI
 ROCA==
X-Gm-Message-State: AO0yUKULwkvLfmEBebsjMlIn9O8TD82qMKpU0FRwYe54aXM7ablBeKE0
 ucFG8RQb/O/bkOrdMOC+IZv3QQ==
X-Google-Smtp-Source: AK7set+Sp2KrsoPOqKPuSOY/PFbWoIgY3XhKyfX++W2ICiEWsJIliBeSyReqDRqWNh9b5K3BbrAhtw==
X-Received: by 2002:a5d:6401:0:b0:2bf:ccf3:ee50 with SMTP id
 z1-20020a5d6401000000b002bfccf3ee50mr11332247wru.58.1675082859881; 
 Mon, 30 Jan 2023 04:47:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d598f000000b002bdff778d87sm12945937wri.34.2023.01.30.04.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 04:47:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB9861FFB7;
 Mon, 30 Jan 2023 12:47:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2] backends/vhost-user: remove the ioeventfd check
Date: Mon, 30 Jan 2023 12:47:28 +0000
Message-Id: <20230130124728.175610-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

While ioeventfds are needed for good performance with KVM guests it
should not be a gating requirement. We can run vhost-user backends using
simulated ioeventfds or inband signalling.

With this change I can run:

  $QEMU $OPTS \
    -display gtk,gl=on \
    -device vhost-user-gpu-pci,chardev=vhgpu \
    -chardev socket,id=vhgpu,path=vhgpu.sock

with:

  ./contrib/vhost-user-gpu/vhost-user-gpu \
    -s vhgpu.sock \
    -v

and at least see things start-up - although the display gets rotated by
180 degrees. Once lightdm takes over we never make it to the login
prompt and just get a blank screen.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20221202132231.1048669-1-alex.bennee@linaro.org>

---
v2
  - reword commit message to make it clear we simulate ioeventfd
  - drop check altogether as we can fallback for KVM as well
---
 backends/vhost-user.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 7bfcaef976..7aae57f56c 100644
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
@@ -35,11 +29,6 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
 
     assert(!b->vdev && vdev);
 
-    if (!ioeventfd_enabled()) {
-        error_setg(errp, "vhost initialization failed: requires kvm");
-        return -1;
-    }
-
     if (!vhost_user_init(&b->vhost_user, &b->chr, errp)) {
         return -1;
     }
-- 
2.34.1


