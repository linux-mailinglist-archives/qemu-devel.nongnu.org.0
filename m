Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D0584109
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:24:41 +0200 (CEST)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4RM-0006fe-CN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yz-0003lh-9H
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yw-0000Of-AU
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so3399129wmq.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cs2obCibuFrGV6ezAp7TXix+CRt2n51MrtUoaGrvvI=;
 b=MrnT4XOU2T9Hl+vLx07czaWcVUXSw2LsafTLH/hmjIa1Ea9ftq2AA2jeTte5zxGdz8
 ExMYhS6Ws/1l8HsbBsXgmAqXuawDQxNmJqVA9IQFP8SFbIt23lP+WqXqeoLIyGAq7HWv
 GFecnfQQY+qZgT2NKbjaxO3OFxCAF8vDbSm93slLwYn3lYHWUqaWTGKNMi7hlakqANSz
 Tjm5Xugeu4NbKbbzFhm6OHSxApun4idvy4ow6aJoo4rWSvKxI7RkJB7sdf6vVFUuOT4p
 wL9BIr0t+T3D5W4eQd/jLJeprK/c3MbMdXj+vKXjrcvxDwaVZ+HrWYuU+eOS6GOe/Rsr
 e5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5cs2obCibuFrGV6ezAp7TXix+CRt2n51MrtUoaGrvvI=;
 b=44GOUUGcY0xdrcsDjAAMe/i6Hfnlf/y3ykJF6wBzzr2QkvFmxW6ni4XBbgaBFfWV9L
 Jm1yURH0l10dwzB72VPt30rEwA6GdJbozAvrcQmMqKL0lfBg6UMj/mvy8aj3cOKHzbLc
 rCnUX+8nhLz+d+MdJPG8++YooBZhteHp1yyts97dNHqw07uizH8edvsFgzyqd9Wji3h3
 fi94xkWXYWzyD71GDMdlRnx8zEGWXisBxteYclRlV3sp7Vaw37N1Sb4HNTg9quRMZxbC
 mRRAynpVoTe5ZpWF8lTPuY1GtHEpfpxMfz0tSfNRbTDr4xZExffBb45pYXdBV54epAeM
 /p8A==
X-Gm-Message-State: AJIora8jlO4TamIqknk9yKWqm9HT1fr2UyknQ1601iHPnyztERfMzq+/
 WN0pW/J72leavXi3PyIddigW4w==
X-Google-Smtp-Source: AGRyM1tzbg688udxUa8TGpS1SbldNgpcIFJ+YMHqqUGHkwCYmhdmciD6Vlexk8ij4DkU5d3gPjOoMA==
X-Received: by 2002:a05:600c:190b:b0:3a3:45c5:9f43 with SMTP id
 j11-20020a05600c190b00b003a345c59f43mr6661857wmq.130.1659016511371; 
 Thu, 28 Jul 2022 06:55:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adfdf08000000b0021e084d9133sm1296133wrl.27.2022.07.28.06.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:55:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E789B1FFBC;
 Thu, 28 Jul 2022 14:55:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH  v2 4/4] hw/virtio: fix vhost_user_read tracepoint
Date: Thu, 28 Jul 2022 14:55:03 +0100
Message-Id: <20220728135503.1060062-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220728135503.1060062-1-alex.bennee@linaro.org>
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

As reads happen in the callback we were never seeing them. We only
really care about the header so move the tracepoint to when the header
is complete.

Fixes: 6ca6d8ee9d (hw/virtio: add vhost_user_[read|write] trace points)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220726192150.2435175-10-alex.bennee@linaro.org>
---
 hw/virtio/vhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 1936a44e82..c0b50deaf2 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -295,6 +295,8 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
         return -EPROTO;
     }
 
+    trace_vhost_user_read(msg->hdr.request, msg->hdr.flags);
+
     return 0;
 }
 
@@ -544,8 +546,6 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         }
     }
 
-    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
-
     return 0;
 }
 
-- 
2.30.2


