Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF572582A4A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:08:02 +0200 (CEST)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjZp-0005Cr-DK
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPA-000225-HG
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjP8-0001ru-1H
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v13so17284113wru.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTel/fQ7Gj1d2ni3sryAwF0T/iksivK0kIXjy8395Xc=;
 b=ActJj0k3rthL0kOqAKCRJuVtFE8KcDK7jZCxI6bx5PwY2bAVKjN8UQ3J9igIrwYN7J
 DraBV+iK4OxV8CZJWX8DT6yTBhhRFgcb/+5wQA3btjkHhYmRgv6YlU2s3meh+mqW+HTr
 c8+7ZD6Upss+GPZjqQyyO2iO7Fru9XqrQPB4ruJBjmUfM+g7mWDQkMP0plT7mwCcSx/Y
 HU5RkZ2zTie2B0DD/DoVPB6Li102YJcppiHiQmk2NXg71IF2Ug5PQUORvpfleOJO0z4y
 W60lflpU7qhN1zbl8DQx+T8mMm/RuZ96LEi36KqRDUdM96vK9agQ2d+wD1MKyTiKljlh
 pgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTel/fQ7Gj1d2ni3sryAwF0T/iksivK0kIXjy8395Xc=;
 b=bxGC6gf1tpOlwUng+EDfPrqgWrpIHEMPYxJWgEiKevqXMjrEK24lg+8LTSzilgVL3E
 qjj3LckAujJV5ss5jS4/0d7funABxswEBh/2b1ia6YyS9f6151Qcj+iYfmjwScImARGA
 TCkQpWLjxzOtk8OAeasY9u2I+fV61w3Pg7T7UdfRvTTknZQSI266DJwTkWZxJHGQREDp
 Xn42xSmGWgs0x0KEHeSt9OpzpXFV9rRQlF1qfy/qag5mx6vw8lEkOtz/3NDKnPyLCXN9
 CCMdMi5fFK5RDuf+Rpgdu/Th62Y3EhxdxRqk7vGQsznFEqqqWgYphy57TT53tXf1P1+z
 mRCw==
X-Gm-Message-State: AJIora9saBj6lj5f+A9QQBwEfZdbcC/BUoPh3n21KxcpdoWJIZYV05g9
 DvS//YM3oSw+PgYatzu1a9TRBWhLZoIXZA==
X-Google-Smtp-Source: AGRyM1usv0Z+sVaIUtHKgIZkz4fNn+l1Oj0uuFHRYxL7C6ndE3l22PGSvL+/xPXKO3AP28ye5HOkXA==
X-Received: by 2002:a05:6000:c3:b0:21e:e081:4cc4 with SMTP id
 q3-20020a05600000c300b0021ee0814cc4mr1566620wrx.93.1658937416029; 
 Wed, 27 Jul 2022 08:56:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j11-20020adfe50b000000b0021e4a4fc017sm17415987wrm.34.2022.07.27.08.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:56:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D3D61FFBA;
 Wed, 27 Jul 2022 16:56:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 2/5] hw/virtio: incorporate backend features in features
Date: Wed, 27 Jul 2022 16:56:50 +0100
Message-Id: <20220727155653.3974426-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727155653.3974426-1-alex.bennee@linaro.org>
References: <20220727155653.3974426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

There are some extra bits used over a vhost-user connection which are
hidden from the device itself. We need to set them here to ensure we
enable things like the protocol extensions.

Currently net/vhost-user.c has it's own inscrutable way of persisting
this data but it really should live in the core vhost_user code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220726192150.2435175-7-alex.bennee@linaro.org>
---
 hw/virtio/vhost-user.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 75b8df21a4..1936a44e82 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1460,7 +1460,14 @@ static int vhost_user_set_features(struct vhost_dev *dev,
      */
     bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
 
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
+    /*
+     * We need to include any extra backend only feature bits that
+     * might be needed by our device. Currently this includes the
+     * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
+     * features.
+     */
+    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
+                              features | dev->backend_features,
                               log_enabled);
 }
 
-- 
2.30.2


