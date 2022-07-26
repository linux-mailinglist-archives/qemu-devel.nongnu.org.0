Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBBF581A47
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:26:04 +0200 (CEST)
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQBw-0000WM-0f
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ7x-0003A8-2j
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:21:58 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ7v-0002HB-19
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:21:56 -0400
Received: by mail-wr1-x431.google.com with SMTP id h8so21433247wrw.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6BvLwU4GMUiq3XaMcxliYSNhOBL1ZkQfbeog0e1G+vA=;
 b=mt1ohbECoxDfdXXNDvr9KKtjfVbd+NVKnnkfCVDDhFvlwNG4HIIzvyNWQQLSD8wQmn
 pbdABLCpv7rjUNNO+WMOl1/jQyM37XEDX17CfpPQLbTIhNK7sBK2+BDLiEl+PT95O8B3
 JVKEsl40oEk+idmRiGxMPGcDsk9zMERlqZ9n/9orfiDYL29ApEbSpWx9Lv81cgXLAFtr
 VbKksMkGBTlGNB5qxzkMouFyk1zWTPZovfBjxDPZ7P1lLQNBQIHg8jXMYiLkkyn2LF6i
 TmtZjpJ2LMe2yo/yhFEsxGvjWs/u7q552qERMgeZc97yQbrWrexNrUGg7+32gt9+nplV
 Xkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6BvLwU4GMUiq3XaMcxliYSNhOBL1ZkQfbeog0e1G+vA=;
 b=ROfCGoZmL5FNmh2tHa7c2D2tnLHJNq+YAW2EMVZqS7DjcK90hVFoEX617nY4i5gtkO
 xgyyTFmhi1TR7/ktB7auTbry2gRl2OdqJT/OFrd3CodHQXA6phIzHYCkP1k3iEGAntOH
 Zf9qe5HUvKo4INZ3Mmu4Slg3rlJ6UZw8lxGKrIPk0WFyxwxlyYQXONZAxIClsG8MzF1i
 lIZ2puAa68o2aZpbwSOwC4LnT+gFXsVV/q9iVi1LJBHsqpyzaw6w2H4mZ9eskD/oU+Mm
 dtJ6HikB5BzQ2XK1pjTRZG0CO7yxOnguopgwL6ZEmzOtGDH1sGyYW/YiKs+Kl3P9MraO
 BuAQ==
X-Gm-Message-State: AJIora+OLQihayU5YKcC0lTrhspvGFbYWVs8yucWI8dqcSo3f2P6KdkB
 ScWwdkpfr3sMf0BVKoTM4s3VXQ==
X-Google-Smtp-Source: AGRyM1uol9Yr9oiP/61aNz24XH7wAilYG5W8/KgjHuI0ikjp+EXv0j+PTnFwy0l2lmuUFUL7d4oAYQ==
X-Received: by 2002:a5d:64e2:0:b0:21d:38e8:2497 with SMTP id
 g2-20020a5d64e2000000b0021d38e82497mr11011148wri.142.1658863313836; 
 Tue, 26 Jul 2022 12:21:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adfe281000000b0021e5adb92desm14236233wri.60.2022.07.26.12.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 728F11FFB8;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 01/21] include/hw/virtio: more comment for
 VIRTIO_F_BAD_FEATURE
Date: Tue, 26 Jul 2022 20:21:30 +0100
Message-Id: <20220726192150.2435175-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


