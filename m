Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1CD582A32
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:03:22 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjVH-0001Ne-DU
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPF-0002I1-S5
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPE-0001tW-Ar
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id q18so14644590wrx.8
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4eDTMZuplKv3vlzOJLUiGIKcACQb4M3CCNXBulI4W+E=;
 b=YvWVUPI3vG9fbc0RtpFuSD3OiJxdNxsB03LeOtR+JfYT+ou1Jni6Oykt736WkS9rRz
 2HWD6oY9q+3sFLwEfpf2Ux2pNXbA5ujf8CyU56F15RzQubJC5XugJ5X4gC8/zmp+h3r+
 Ymj9MjjxMn7G0IfZe3/SJXzROhlQaRQEhHuMqBIQB0dXTYwESVFFBZM9gccAJWDfvJuY
 KzFpe8gVCZFl+KpyAMaMQ2OseO2axhYyKBnXdYaJ2BT5cpYtp+oIK39+Y8ThmuZGG99h
 yGunOxqyemX/v8rviTiJuTNPgnn8+bpihV4UrcRsLJLmxbDoHuZnrsv3pyCBePMD3WJR
 2apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4eDTMZuplKv3vlzOJLUiGIKcACQb4M3CCNXBulI4W+E=;
 b=dB+Hyq2cIWDJMh6/2FghjlHLvnx30XFwaLrzaN4LxLfnt3AHfUjUUdZWOJbzNkPKqg
 tzhsX5gJnv1bX50Y7mWpvpuw4Y1cXleXwke4VOr/R/AHukmlybRFs701FxK6Iztyb1xq
 TWaNtOL7YNir7xk38PUYxBfx89s8aDURe+ctagqInnVE0PK9//+sQ8J/q9Hn8FAyzwFg
 8oGqbY344SdT3i8yZxLcpqHNiMyCZJS7UHJM3z+BFIEGJySz/BTvqs9E44Yh+ZXbutK8
 Xl9HMSJv/L6OCmwal6d4TI/z5G69Oi3jX23tE9imPd8/cYC4al73KG9nGyx/gOEJa4JP
 MMew==
X-Gm-Message-State: AJIora8bdMd+85htVaIeKrnT/p4HFOq+kMqzG90zONPWXFMPpTO201rz
 aWgBhOy/zyA4yxFnHriRuUGfew==
X-Google-Smtp-Source: AGRyM1sVVUbJ3P3x8nfP2DxMMPeYsm3jKKPyxg5VDB1oFfq3GWVTdf5gDSUNliXPNmMIKjJIEO+0gA==
X-Received: by 2002:a05:600c:1d1b:b0:3a3:e2:42d1 with SMTP id
 l27-20020a05600c1d1b00b003a300e242d1mr3511625wms.137.1658937422833; 
 Wed, 27 Jul 2022 08:57:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c23cc00b003a2c67aa6c0sm3075944wmb.23.2022.07.27.08.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:57:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5DC31FFBD;
 Wed, 27 Jul 2022 16:56:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 5/5] hw/virtio: fix vhost_user_read tracepoint
Date: Wed, 27 Jul 2022 16:56:53 +0100
Message-Id: <20220727155653.3974426-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727155653.3974426-1-alex.bennee@linaro.org>
References: <20220727155653.3974426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


