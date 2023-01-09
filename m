Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539466214C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:20:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoI9-0000tp-MC; Mon, 09 Jan 2023 04:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoI7-0000tG-MG
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:03 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoI6-0002eA-9b
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:03 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6092223wmq.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2cB7vWK6nvcfVvDDHq7Sg6wZOh1lh47LPsFPMyP2dk=;
 b=KLm7kZ8G8vE7lZqRcJg9lazSk5ZG4LsYUGNHKLA8tg8KjCpzedTvZq2/KmgK3nFq+j
 9HouMnhOS/r9w5GE6eksHnOnCJbQTQ+HmC75fAVA3SYyCJqxO3Imy3z6pZb/IlI+4mkU
 QL3iRwQn/LVEfCBmMiTOMiERCYiua6jdSzwQvMj311jyD2KZS/e/x8n5pdJxNgcONvyJ
 5BhXwVKQ5Rp4U5ikZXa/jzBiVv1wpiETmTr4a8b52hyy8fbNd8hjP+jNSvJQ7Pzbnrrz
 Aebj3H/v0M5H9ojPKT2s5TrO8xZ51LqfhOyLiag4o3SvgOyqq0evnEXCMdkLolcwj5CD
 qATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2cB7vWK6nvcfVvDDHq7Sg6wZOh1lh47LPsFPMyP2dk=;
 b=WyfvID6J8/swGwOUhMZaiVXr43vh8HNrKlGetYFQYtYASURp2KlA3SvBmwZq5OopLP
 DL2Lo/vk8AaWu0BqqIs+UkynhAUXLgMcSHX1RMtaKxIUARpZTACNWHk+uwSEvFOp5QcM
 lcow4AuCdrzeIIJKOOgcdzr+xonD71ByLodZhz7nO5UPPwK3vq2cnesClqUi7dpblcOP
 v/uUMzG7T8UJkubCOcI6f1UTeb3ldTcEv6XJ/vBqi35USvEi6H+SvohbyRF3gMWZVNO5
 mxmQqzl/X+SljIgtzyxe+IvYFaRg3lLFPOVOb+JGMdHA0k113rIM0BHrV/LY2jI3SX8P
 5IHw==
X-Gm-Message-State: AFqh2kpVqyIBGdnf+YbFyIhcPSgQCNCZKKQxMbThcy1+wL1Z++mluAhc
 LVfj4esj1hCWqL1o/6ce5PiHsWSwk/OsqhPG
X-Google-Smtp-Source: AMrXdXtXU00iiFH8phX+w7HXNFupFdsGoveCXpmtvA0XJ3rPK8rzRJCR3j+uyoT73/SHRPoENXbo2A==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id
 z24-20020a05600c079800b003d357373b0fmr55841636wmo.36.1673255880593; 
 Mon, 09 Jan 2023 01:18:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b003d1de805de5sm11955431wmb.16.2023.01.09.01.17.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:18:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/i2c/versatile_i2c: Drop useless casts from void * to
 pointer
Date: Mon,  9 Jan 2023 10:17:50 +0100
Message-Id: <20230109091754.79499-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109091754.79499-1-philmd@linaro.org>
References: <20230109091754.79499-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/versatile_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 3a04ba3969..52a650f45e 100644
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
2.38.1


