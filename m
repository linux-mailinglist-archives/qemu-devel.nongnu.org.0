Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17816A43F7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5B-0002Ia-LR; Mon, 27 Feb 2023 09:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4E-0000gd-VW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:33 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4C-0007Yy-SI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:26 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bw19so6296146wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/KzSvjX9f4BCGIMkUG2tIfmdibE7Hacb/lDW3ntcm+Y=;
 b=wYdBEPwFeJ9dtloednwvpgqd2a3dmH9iCt2y2zuh/1aqxEKhEstoy318C8gaXaH6JO
 uQnSouejSOIllwnHROaREn1E38v61OQhqzXbgUtS+1l1r4cYxiD1wb+LlpHBdPK5X3Ck
 3hB4ric1YZ0PT/PjRIk2PyjxRpUBRP+/jV1tJs+Piag/6hWMx2qjql6lCYFbF3sRgdaR
 XOcSeckxm4Ah6hm0QLaJC1OmZmH6qq3NkY1cEuEr0DEfMcleBCNPjcxAVt1BVtXWq+yZ
 C3bmm2n+2a2gOWN6yKCEmfziZfojKKkYdi5YAZdswYvF2qZGc9GsejfHXfIQGM+WNjpT
 sEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/KzSvjX9f4BCGIMkUG2tIfmdibE7Hacb/lDW3ntcm+Y=;
 b=Q0paCAMjDxM+NtdnuvKCRsk5y42plomSeThsgw89cDSa7zKrR7+Naq9EghBPXh0aPz
 8cSSTJDgORrTODJREs+3dNOgoku+zCuyuVcOVH2ccSxHE3hNb+2XX3e9jTuh2Xf+Huhi
 9J+twpfIDP7NOIZ1ZCqbfDyDw4RVEXUSKpVaxMqs31vb26FesXNiz4miVjMxUnNxFQR+
 6xfuvDwEmC+a9RmiNTCwHjZxv4byuYp2qnL07vyqgNUjWJdXptID/LB4WrrlIbXjEArL
 upJPUOKIsUIWoa3HQ1stELRroBsLz6teDV5wUfB1IaKruSARS22DTS9DTBmnyymIAJbP
 FZeQ==
X-Gm-Message-State: AO0yUKW3cqokAG9g6itn0QhQP4MB8WvebvFg0nV88FJI0SOBonXw2fEA
 JnU0qLUOYWB6oz3+chW/uyVf+C7rmI7YyAoX
X-Google-Smtp-Source: AK7set80suw588oUiYmCIOsVeU+o4gBOPnvqAB+HhipYkzcFcAKCt+Kb9srii+VG3r3J5taO+aj/yQ==
X-Received: by 2002:adf:f34f:0:b0:2c7:fcc:2501 with SMTP id
 e15-20020adff34f000000b002c70fcc2501mr12136896wrp.28.1677506483327; 
 Mon, 27 Feb 2023 06:01:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/25] hw/gpio/max7310: Simplify max7310_realize()
Date: Mon, 27 Feb 2023 14:00:50 +0000
Message-Id: <20230227140102.3712344-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Since &I2C_SLAVE(dev)->qdev == dev, no need to go back and
forth with QOM type casting. Directly use 'dev'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230220115114.25237-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/max7310.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index db6b5e3d764..031482d9398 100644
--- a/hw/gpio/max7310.c
+++ b/hw/gpio/max7310.c
@@ -183,11 +183,10 @@ static void max7310_gpio_set(void *opaque, int line, int level)
  * but also accepts sequences that are not SMBus so return an I2C device.  */
 static void max7310_realize(DeviceState *dev, Error **errp)
 {
-    I2CSlave *i2c = I2C_SLAVE(dev);
     MAX7310State *s = MAX7310(dev);
 
-    qdev_init_gpio_in(&i2c->qdev, max7310_gpio_set, 8);
-    qdev_init_gpio_out(&i2c->qdev, s->handler, 8);
+    qdev_init_gpio_in(dev, max7310_gpio_set, ARRAY_SIZE(s->handler));
+    qdev_init_gpio_out(dev, s->handler, ARRAY_SIZE(s->handler));
 }
 
 static void max7310_class_init(ObjectClass *klass, void *data)
-- 
2.34.1


