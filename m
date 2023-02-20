Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B830669CA40
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4hd-0001dq-FR; Mon, 20 Feb 2023 06:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hZ-0001cA-Nw
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:25 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hX-00055X-Im
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:25 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c12so866639wrw.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8xMWpWXatWsCS1MK+NnKnpC4b3JmUSx4NHWxDCryRg=;
 b=br9d2h2t5NT/HK2RCMGPGHRjVsTeYZsNSP5DvLhVmnAiRQnxCcx3YMlYjfi8obyMLL
 MUR5yPYHp1Elgn77COhdHaN6/M0gHxIlOV85PDNAgb6vpqT5FA70XDKY860RUQPwYIG6
 F5nq4/tX/twEAF4afZUkO1MW4yMe4oyXF6CAL7fqCweD1vpwlHC3X41FOpX6lI0qklPr
 u+0AorwaZjDRFlJ3n/U85ifZEzh8HEmrMG3Hx1uoQK6VumbfDw0A6tYF3f0BzcXYEpZJ
 REblfhG40Pna0GW7CzZbD7VQTTo3n8gW4rk2xaWBDwnTnLvpjGjWWUKtcs5Or16ECzm8
 EG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8xMWpWXatWsCS1MK+NnKnpC4b3JmUSx4NHWxDCryRg=;
 b=WuFaMibZ+usV+ks5lyrWoVN6K4nnwTwNuIHcd2O+Nc2fcZIvCskooAQimEcVSw6NXu
 gRv3XUDMogIGupCogGbQndg+SXzjv2gQ7is3pU8mRMZqnuE0uNz7tASFLIuZkkMHixZ4
 5iqaSMvpPivHHJhtGZ03nnHYIFFrRmW7J3VNTx+UxD3//z3XdzuXkiqLdqHKBeWU/73y
 XEVDlGPFDWRFeXmEqPnJMa9nXvsqubnkW+P3hMiTlI51IOSU8b0IepWphzRxzHebJM13
 GQ0KK6scWpNM5Y1zb110G5NEdTTHmsqVdhroZF6ovgH18sKliDchaFFgPr6UqI1W3CKJ
 Ru6Q==
X-Gm-Message-State: AO0yUKUG2mx61lWPgW1cnd1Err0lMEdbERNb/4p/ysE8soQpa73rwYgt
 gF2PXDR9QAVBws5Slo9cEgy+/Rt1+57W6hN2
X-Google-Smtp-Source: AK7set+2co3nF48lyyawC1Ko0qnCt3nKKqlecTI7+GTT4LuIbnQiQ+UQgQjkQDoAmUpZFJK8N3Wzlg==
X-Received: by 2002:a5d:4dcd:0:b0:2c3:e868:cf54 with SMTP id
 f13-20020a5d4dcd000000b002c3e868cf54mr745448wru.13.1676893881800; 
 Mon, 20 Feb 2023 03:51:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6802000000b002c55efa9cbesm1550419wru.39.2023.02.20.03.51.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] hw/gpio/max7310: Simplify max7310_realize()
Date: Mon, 20 Feb 2023 12:51:07 +0100
Message-Id: <20230220115114.25237-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

Since &I2C_SLAVE(dev)->qdev == dev, no need to go back and
forth with QOM type casting. Directly use 'dev'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/gpio/max7310.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index db6b5e3d76..031482d939 100644
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
2.38.1


