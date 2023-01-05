Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18165F2BF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTN1-0001Re-Cz; Thu, 05 Jan 2023 11:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMC-0000kl-TS
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM8-0007Nx-By
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:42 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1776908wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wEthfbGdCK5i2mFV7wWA7GB9Fv4cHI0iBUrT8VSFqks=;
 b=P5SxrGVPYakve0Z64GTVRAvRKHsNZntW+zp326XIOsACeeyVYhifz8loRDHRJ3psog
 BxN1vUoDDqoRI0AsejtpGIwn/hVXYXJfvfqSXLGf1ExXeozCc2bWvdIfGZz00kLnOF0i
 /O3KStwRb8nslegMDUZ7YorFUNkwxJr4omJVSquTYzGOo3qLYIrrDZcIfmDAmq5xXNXm
 GKcFJ96MxhMT6r2382al4cBxo3U6txwXzbuolxdC4KQZh1UjAQt4DT+5EhWZBjKfCYAF
 LlJdsrSIjcLQczHfxjnWzwM6SlkOEiScJ5QRWWv3bTReSEhfIw4y0+lpHRRNCnK3tfyY
 yaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wEthfbGdCK5i2mFV7wWA7GB9Fv4cHI0iBUrT8VSFqks=;
 b=GKpLHy0zq1sdsJ1DjsKJrTc82OqAWpoIpFVOaEpvjxC7NwlKvK+nYZ/lNWVHRxPj/6
 EWHidG0Cp2a2ocgGPRaziLOvhYmMzvfZ9cSOQ7e4N675QM3BOcAKgviIN/ZtTzJya5zC
 Q0URrp158JrrWWBdaoBEUeHlRT1oZXV6uXaoVo49b7BIDU+7kgWncrngQsw/KhkKFLw3
 JcU+bSaMEc96ICH5IUcn48TqfWifYJ2zMacxXRlTbgaQO2KtcfvJiY2Q2EE3c2IiPuNN
 MenIBaPUA2kqcKNxHWsPP2qJlwATo4kz3B06mTdhLU7kA9eZ8QRRmwmtgpX3H8yq5hQm
 ukdQ==
X-Gm-Message-State: AFqh2kp6MG08KCwu3rdYcXq+qU5m4AuEZ1+i35d+7bgNQ+4nfF4ZLC8D
 A7oUL85NxJksl20+QKHRNktkq1SxWLagVN0v
X-Google-Smtp-Source: AMrXdXuKUeOmYMW3EV1ZXth0DBYtOikmE9SXOy4pVerOwLyw3GXjbnx/AobzO0HOtfe2pt/6X1JHlA==
X-Received: by 2002:a05:600c:1d89:b0:3d3:58cb:f6a6 with SMTP id
 p9-20020a05600c1d8900b003d358cbf6a6mr36664684wms.41.1672937079413; 
 Thu, 05 Jan 2023 08:44:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/34] hw/input/tsc2xxx: Constify set_transform()'s
 MouseTransformInfo arg
Date: Thu,  5 Jan 2023 16:44:07 +0000
Message-Id: <20230105164417.3994639-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The pointed MouseTransformInfo structure is accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221220142520.24094-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/input/tsc2xxx.h | 4 ++--
 hw/input/tsc2005.c         | 2 +-
 hw/input/tsc210x.c         | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/hw/input/tsc2xxx.h b/include/hw/input/tsc2xxx.h
index 5b76ebc1776..00eca17674e 100644
--- a/include/hw/input/tsc2xxx.h
+++ b/include/hw/input/tsc2xxx.h
@@ -30,12 +30,12 @@ uWireSlave *tsc2102_init(qemu_irq pint);
 uWireSlave *tsc2301_init(qemu_irq penirq, qemu_irq kbirq, qemu_irq dav);
 I2SCodec *tsc210x_codec(uWireSlave *chip);
 uint32_t tsc210x_txrx(void *opaque, uint32_t value, int len);
-void tsc210x_set_transform(uWireSlave *chip, MouseTransformInfo *info);
+void tsc210x_set_transform(uWireSlave *chip, const MouseTransformInfo *info);
 void tsc210x_key_event(uWireSlave *chip, int key, int down);
 
 /* tsc2005.c */
 void *tsc2005_init(qemu_irq pintdav);
 uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len);
-void tsc2005_set_transform(void *opaque, MouseTransformInfo *info);
+void tsc2005_set_transform(void *opaque, const MouseTransformInfo *info);
 
 #endif
diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 14698ce1097..555b6771738 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -523,7 +523,7 @@ void *tsc2005_init(qemu_irq pintdav)
  * from the touchscreen.  Assuming 12-bit precision was used during
  * tslib calibration.
  */
-void tsc2005_set_transform(void *opaque, MouseTransformInfo *info)
+void tsc2005_set_transform(void *opaque, const MouseTransformInfo *info)
 {
     TSC2005State *s = (TSC2005State *) opaque;
 
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index df7313db5d7..fdd5ff87d94 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -1176,8 +1176,7 @@ I2SCodec *tsc210x_codec(uWireSlave *chip)
  * from the touchscreen.  Assuming 12-bit precision was used during
  * tslib calibration.
  */
-void tsc210x_set_transform(uWireSlave *chip,
-                MouseTransformInfo *info)
+void tsc210x_set_transform(uWireSlave *chip, const MouseTransformInfo *info)
 {
     TSC210xState *s = (TSC210xState *) chip->opaque;
 #if 0
-- 
2.25.1


