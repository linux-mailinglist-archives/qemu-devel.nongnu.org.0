Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC2584120
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:29:09 +0200 (CEST)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4Vg-0002R8-8k
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yy-0003lT-6R
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yu-0000Nf-Jm
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id u5so2295335wrm.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTel/fQ7Gj1d2ni3sryAwF0T/iksivK0kIXjy8395Xc=;
 b=kb1xxsEzQrWgYuE2LMINFYLvrfst53N1FSmkhmBZM5MO1Sf3yZ1DaaNLnIAspPktEr
 ZowhjUlj2EEvVaCi/L5sEL0LO3caPfxFse0PQ53R1w4MfZdiI6rlb9Vvpz5w42k1t6DC
 DC+Fzfmvawm3cANMWmAB3W8h4J1TlfmxNfnnwxiVVaB5ec2TGC3OzlBpREUXvyrF4gLQ
 fcWEapJgh2OkKQBrbLD4R2RecCNbiUAJZGlcfv9wquM3VLE7LXXpbUnG+scdL3x9oeGz
 gbZs6YLnRZEg309Zrrkt4NyZ5tILOKmitD1WpNoCxm2p3ZRtWtyx/XiskPMvvWrLFD7C
 TD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTel/fQ7Gj1d2ni3sryAwF0T/iksivK0kIXjy8395Xc=;
 b=BOIDMrGfZ+c/EXX/GnapKpQWV69L+JQZnV26jNFSEWwGLOhYtUaV7s1/NwUJajbGjL
 PTcklEYMN49Y3Fw7tWh160Rt8TJmFTb8ET9JSyKdnTmfWIa4k6ZD8ky0cAkdeURaHQiQ
 x+I6RrVy2shL2EPrlytk/UZFZAYf35KIRF1EfQalzlJaMZaYbssPIGWkFy9MiXyYMjuY
 UY07YIMOTwifQHaOfTTYr4rKrLTKiy3P/MHKGTDawFFnpHTfC/Eop35gGQDKadfmVtuW
 02UW2SsnARkBSRFC0FRT4/cbNqdQXW8sXUOGyNCzPL7/2qGjoogLE2R3u9ZHgg25z/Fp
 yITw==
X-Gm-Message-State: AJIora9XG5A3s8PX09EN8s/zAqXy1R619Q7MpApWGx8ra2L3GRhqROX2
 QSCfCUvg0VfyOC+v9BpNqmi2/z5txNG81Q==
X-Google-Smtp-Source: AGRyM1sgupEzqc0OYq3gkYvgmmiVyjqtMnH8S6U3i8TflFaK4mTTKmwd+eWqZNsclgoSnsgmNoH0CQ==
X-Received: by 2002:a05:6000:78b:b0:21e:a0fd:ce with SMTP id
 bu11-20020a056000078b00b0021ea0fd00cemr8658386wrb.309.1659016506054; 
 Thu, 28 Jul 2022 06:55:06 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d43cb000000b0021ec76a0c36sm1005656wrr.106.2022.07.28.06.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:55:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE7731FFB8;
 Thu, 28 Jul 2022 14:55:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 1/4] hw/virtio: incorporate backend features in features
Date: Thu, 28 Jul 2022 14:55:00 +0100
Message-Id: <20220728135503.1060062-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220728135503.1060062-1-alex.bennee@linaro.org>
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


