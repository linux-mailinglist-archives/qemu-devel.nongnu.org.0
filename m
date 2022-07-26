Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A5581A72
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:46:51 +0200 (CEST)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQW2-0005kp-1S
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ86-0003GB-8J
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ83-0002Jw-KN
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v13so13679311wru.12
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LTNybQ3j99OfucIFux/yLfgRaMJqRwC34AP3ZvaRhZ0=;
 b=QUWI0g7DdWfKkgII/OjGbhRWXJcgm++PJpQC2QIKRNp5CXImPv9wBXpTWRkv572tz6
 uS2Hsj5+D1c0LPrea1oZSOc4UBbuRIShpJjmSNFjs2iAjIS8w4iqZZdzhmvmZ6qhpQrn
 gdi6rthlOJsWFM2yrtR+QevuCGDssYHHv/JCzOKBtZHFARKpQoku1ngcEQgyyHGzSMf4
 B8UgOnozsvXYToAfaWfd81CelY3kD8gznml5lNP+Xe3Wr5wI/zlZsTu5JQa0sRE9Ex5p
 DIQ9lNw6irSeMTo0EJfbl+73fc2V8Qd+oFFlIcP2IF+O4zzLxBueq/2zT/iVIjzjXrb9
 kD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTNybQ3j99OfucIFux/yLfgRaMJqRwC34AP3ZvaRhZ0=;
 b=QNjtRGrV6W/5htguUW5DeiNVhmZ/pBIogkQV3VYWJxxHbTjgCLeMDABQk0645Rqw4K
 zt/pqQ5tNhpGyUgpTpBWgGpYFbb66MQcKQJxR7Kro1QwHO7NIEj0QbVEEFqUvlxJs80+
 8diT0Oa473ZP7LvFkvzxJvDxUd6eClqD9IP99l1g4MQHYZUOc2SCyYzcOQxNmKL1Q+sF
 Hca8XLp6n0Q+cQKdUyFjTlIta3ly9iS+r4iTdUOvJiklBWZ5VJ+rsXwm1N/ETbHXWZdE
 EpMoxFV+No9HIaPyrq3a7jrVLuWP7kIih51FWM/RfsZmCnzXwX7+AS4ygcLgYOD40TV4
 tJ9A==
X-Gm-Message-State: AJIora/3ljiHQ4CRF0Dv3GODAOpeL92EKDxLGanOogBN8xjktzITehdY
 NcfpN6Tl0vPYry365V+/5nyWIw==
X-Google-Smtp-Source: AGRyM1tKLkE3cmwG7Mnlwh6DEr+JoRYn9FssLmWJaWP9KNNoIICux/GYnfXRavgCMkWo84Bncnmi8w==
X-Received: by 2002:a05:6000:1841:b0:21e:81a3:e6ef with SMTP id
 c1-20020a056000184100b0021e81a3e6efmr8889243wri.369.1658863321806; 
 Tue, 26 Jul 2022 12:22:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k66-20020a1ca145000000b003a2fdde48d1sm18548865wme.25.2022.07.26.12.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D070D1FFBE;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 06/21] hw/virtio: incorporate backend features in features
Date: Tue, 26 Jul 2022 20:21:35 +0100
Message-Id: <20220726192150.2435175-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
---
 hw/virtio/vhost-user.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 55fce18480..a96a586ebf 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1461,7 +1461,14 @@ static int vhost_user_set_features(struct vhost_dev *dev,
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


