Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE40587A4D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:07:34 +0200 (CEST)
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIooH-00023D-Fm
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXb-0001HG-5j
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:22 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXZ-0002Mv-4I
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id v5so6974712wmj.0
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WTel/fQ7Gj1d2ni3sryAwF0T/iksivK0kIXjy8395Xc=;
 b=DHW+C+RYNg6EOZJGS3DZi+htxLKjA8EWA92xqqdFN35ZUbyFIWjn5yNO5fHTTx/4Zc
 8wGXW6wFRKOHu6jLqCE3i+mOVlH4rTsrlHO6BG5yyeuPstI7QgBLtQU9UPC56a91pF64
 sefORvWjLZhxJFpqasRPTXH57mgOUr/vbpDTxifDHUVbsvyso2zvLrwYaBGBLm0utLQi
 Wjnqa91CMkfKQNOyFeMvDMSPRtfVtp7yzHAVRwCZAGnt8GAlMvu3NVEeFia/QuDKFmT1
 TmfY5juQJDb6gE5Z50BhK7XauXcg2gWd9ikG0DdCH1wW3KbPQUbFs9eg0QH/8vfoSWvf
 76rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WTel/fQ7Gj1d2ni3sryAwF0T/iksivK0kIXjy8395Xc=;
 b=Sxi86RbGcpI2KkNSyQqieoE0wrZXmXmPIJF5/wm0NrkvqFezVyz+cj6JtLAiwDQ39G
 kjx0zLKBOoiR4t5W5fb9XxvRAqaVBC8UQ/XzF4117BaVss76uXTHh5sCFykaKvY4wcNj
 VtFFsidaXGbq0vv9krFAwYG25/VyRj38SGs8b5W1aweHdZc4IZhMKym1vJ+9hHUOtmcf
 eH+BXl0GKEheZ25FatCFm+ZJCdxbG83biJBpJIA6WVCfnqjSRLxGg2ZefurL78PbZ8ez
 eVvmfWpchttCrRgS167Cm0gaU7sSOp1Payjza+dl/mdgDSXPbmxKjPNPByJghm6Xf401
 e1eg==
X-Gm-Message-State: AJIora8HX2IYL017DLg0p7q6N/TKOWyIy2SKZQ+Hvs30Hn1GXvu02XGc
 2hWLXuSbwffztQiWNqZUaMjAPA==
X-Google-Smtp-Source: AGRyM1t2Z+L1bhmWY8rWZSMYIOnOYeoWJwXki/sHlXutW7qrgpP4C+5qS1+AJNsGWPuleGmiCmPHTQ==
X-Received: by 2002:a05:600c:1ca8:b0:3a3:19c9:5448 with SMTP id
 k40-20020a05600c1ca800b003a319c95448mr13759641wms.40.1659433815022; 
 Tue, 02 Aug 2022 02:50:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b003a31d200a7dsm19650559wmq.9.2022.08.02.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA8501FFB8;
 Tue,  2 Aug 2022 10:50:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 01/22] hw/virtio: incorporate backend features in features
Date: Tue,  2 Aug 2022 10:49:49 +0100
Message-Id: <20220802095010.3330793-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


