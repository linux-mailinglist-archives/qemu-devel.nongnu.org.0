Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76375587A38
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:59:54 +0200 (CEST)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIogr-00047n-Im
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXf-0001Hf-7G
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXd-0002OZ-LK
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id c22so6970240wmr.2
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6BvLwU4GMUiq3XaMcxliYSNhOBL1ZkQfbeog0e1G+vA=;
 b=g5KXnNSg154aRqx6ZdjXfeEFD0K83wLKBGUyr3IGxbH/ozIiQ6JrbyVh/XdLtSAfUa
 4aEFQrQN5MXkzeS4BImtCVFnAYxJkVOfnKRjgSFf2lVusaG7iYrIx9TGZHx3tzNOSTXg
 QW/J/cIuuqsaZtDNGZzi9p+nfhkgMS7UnsLR4dzG6tp5/KuNYuKkddFxyNBmYugppwwC
 tBoQ/rEcwGLPPoxLXJU6K0toXa/v4du5IvrP4o79gQY7GMajCESTZmY2b4XiFFXk9aa/
 fK9RJBpbcbxHfNHC/Zy46yPSAQojlqxce6ks0HPYK+q8+PBSaNo7nbH3IDEYR+dE1Omx
 h0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6BvLwU4GMUiq3XaMcxliYSNhOBL1ZkQfbeog0e1G+vA=;
 b=EjRhzC8cjhgryJ/vvOCK+vZAGzCGXqMPk5A5DaPeZELqQ/x3z/0Qg2yjWMaZlYMs+u
 +UT63CBtF2CrACvHkCKpoynPLdR0niEsuzjQlSMGricROxOZQOnTAnozq7uF14sie5ED
 /++LTzbSkELIUFQUeqnUOsuuHvAEeSOXvpWCrmiM+V5I+6EFoxUL67UyWzcz0ey2EyeV
 R8GQBPpmf/6vyIYlxe6wd3otCswQFF4JZ/QsostojzFv1pMok7l7zHD00tKrYW5QsHYK
 JQn/2QNlSD/yFQmezz17y2X9DdYvt0U63RTocl0sNwn+hxkFtIou+UtLfrC3TUtPA7/L
 TopA==
X-Gm-Message-State: AJIora9ljkOxr/qN+EHydpcEosKm0N8WE36hmJQ7UQmmzL6jeoRmbzHt
 N6+GW4cRJ9jFTS/ghOH76pBtaw==
X-Google-Smtp-Source: AGRyM1sDPVh1O8jgPqxwE/fgI5aWqqY3JlEq27m6pMls6Do727/igYrCfnQIIgikTyP8G174X6FKbw==
X-Received: by 2002:a1c:27c4:0:b0:3a3:365d:10a2 with SMTP id
 n187-20020a1c27c4000000b003a3365d10a2mr13815782wmn.61.1659433820190; 
 Tue, 02 Aug 2022 02:50:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c19ca00b003a31fd05e0fsm4190710wmq.2.2022.08.02.02.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1ADC01FFBD;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 05/22] include/hw/virtio: more comment for
 VIRTIO_F_BAD_FEATURE
Date: Tue,  2 Aug 2022 10:49:53 +0100
Message-Id: <20220802095010.3330793-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When debugging a new vhost user you may be surprised to see
VHOST_USER_F_PROTOCOL getting squashed in the maze of
backend_features, acked_features and guest_features. Expand the
description here to help the next poor soul trying to work through
this.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - s/vhost/vhost-user/
---
 include/hw/virtio/virtio.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..9bb2485415 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -24,7 +24,12 @@
 #include "qom/object.h"
 #include "hw/virtio/vhost.h"
 
-/* A guest should never accept this.  It implies negotiation is broken. */
+/*
+ * A guest should never accept this. It implies negotiation is broken
+ * between the driver frontend and the device. This bit is re-used for
+ * vhost-user to advertise VHOST_USER_F_PROTOCOL_FEATURES between QEMU
+ * and a vhost-user backend.
+ */
 #define VIRTIO_F_BAD_FEATURE		30
 
 #define VIRTIO_LEGACY_FEATURES ((0x1ULL << VIRTIO_F_BAD_FEATURE) | \
-- 
2.30.2


