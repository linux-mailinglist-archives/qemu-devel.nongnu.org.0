Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE9A677CC6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzx-000687-Hi; Mon, 23 Jan 2023 08:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzY-0005wb-Ih
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzV-0002Mo-Np
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so10640047wmb.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wkC9VodrEkubPHoJig8p7hlAtgaFbvzuu8bhIKhFiNs=;
 b=rr22wxB8O///C7OBNFb9xyn2jb25U2yG/0a27ViWD598z7tnwan8mU0Zu/pzT/t8KH
 tMYmrfaygNTjtvX7BwkMQkKNc9r4OKLFh1LA/EI0HxaW49uSy2rhD/3h7+zU7J+f3wkq
 Bka7PjtmKYGtqBIfGYtlpRD994JGs0erR3/15SpYVRY+OwIczjAywJLFELyhyHLZ7BoG
 d2apZLnoZD06mCmLKu/I35uIeHujHTZFEH6PmQJMXOVLxfOVPtTrU5lx1AyZaGvsIqRk
 nOpAwvIQiuj0nC0Q0+fqzWLHmPmxdVVZPdW2wsWCY338f9F9yCDinXY+dUXP59BMjrJJ
 sE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wkC9VodrEkubPHoJig8p7hlAtgaFbvzuu8bhIKhFiNs=;
 b=bBYmGE/MNM3YiFzhUYrghRl3xCAW9eIAPa/InhMHHtrtg0qCjopv8MS2DZ4RxXw/bh
 zySbFM1OKv7qqt9GWVV7t2LzYsDuK6oop8TRCYL0h2MdRc+JMM9OGc1LrnJ7gyLEtWmN
 oSypjI2AV00qeqseQ56aEcng9gby5CF34lKFjOY0+HgrHtz/vWIP8OOaxrQn+eKLBh2k
 jNWbyZ3aM2p7tTXt4gLLbXYDB6/3CBsWG+JuEHUzM/J/vAS79uhBXtvOMcGBN2Tf+KtP
 i4BPw3KFk0Ib8i0W1RpsjLgWqlI5hChz3cWK1QFh8JQEZMQzLs2pSDvYPZDiibDuD4+Y
 ZrbA==
X-Gm-Message-State: AFqh2kr6lMJb9NK6ZOtPbPGIni83Zy56Ww5SpsHbH6HvDaMMpX7TwG+L
 +0DHXhbJHyA3grrdktLaChCmF/S50zuwBoDh
X-Google-Smtp-Source: AMrXdXvTRauHkApUwnpjm8DEAr/wZNXHLQYubjS61Cqy2CjwqQNX3zllU60hCmSHaYevgOpmmS293w==
X-Received: by 2002:a05:600c:54d0:b0:3d9:7847:96e2 with SMTP id
 iw16-20020a05600c54d000b003d9784796e2mr24027260wmb.2.1674480963158; 
 Mon, 23 Jan 2023 05:36:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/26] hw/i2c/versatile_i2c: Drop useless casts from void * to
 pointer
Date: Mon, 23 Jan 2023 13:35:35 +0000
Message-Id: <20230123133553.2171158-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230110082508.24038-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/versatile_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 3a04ba39691..52a650f45ee 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -45,7 +45,7 @@ REG32(CONTROL_CLR, 4)
 static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    VersatileI2CState *s = (VersatileI2CState *)opaque;
+    VersatileI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
@@ -60,7 +60,7 @@ static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
 static void versatile_i2c_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    VersatileI2CState *s = (VersatileI2CState *)opaque;
+    VersatileI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
-- 
2.34.1


