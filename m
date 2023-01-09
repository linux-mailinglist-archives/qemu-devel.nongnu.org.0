Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D015B6620A2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 09:53:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEnis-0005hS-GC; Mon, 09 Jan 2023 03:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnip-0005gH-JO
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:41:35 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnio-0001iG-13
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:41:35 -0500
Received: by mail-wm1-x332.google.com with SMTP id l26so5694976wme.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 00:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkFjYPFzUw/uhM0dOjJ0XXnVDH6Pxtvb+WDPgdl3CFI=;
 b=nRIdU1I4i/bx4omiQof6SvnSGznHC44HR/u63P8ElDOfpec0llDkAI4gb6La1cdk+C
 CvsLIQYQvuBnSMMaxZet3az4SDSMy8IaKHg13IwNLhQNEvtyIGYoYYgcJatOgxiMIBRK
 HPlJAkaue0yWQDYRy3lW3Bb5mfnEflZM/ILfiS+GdAhtl1eltQ1dEpovlsm6tm3Pb9/r
 XvhcQee0t5Tn2fZEiYWghX1u5sP3mvAmDbkHhzDTVedYrT5aFFRGglCuUmsrdcF2vjwU
 HovPSR84gjU3iEVsf7fa4NCttov0vtnfc8P0oL86sfE0wTRlAOzBw3CKiPhoFqVT82Db
 ssig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YkFjYPFzUw/uhM0dOjJ0XXnVDH6Pxtvb+WDPgdl3CFI=;
 b=2JUTYkvIC36C2G9yfdFJr04tQ5CdjqJIdcL6B2OYjz4+Ms91z+jsgA/TZ+WGpVlmaq
 Ax57AI3PDYDOzGvfJ2eCokam/IkPdpgMmCQYzDl0TEmYt++h4SjhxRK55XcgP1X7D0l/
 15lPvuYtbt0WzM0FWl25U2vjCUKAuoEjZgfpIJ3nuFVDPqZ3BNmaPTvHTdS72NTcjR8P
 4EdaYkNd9nJjjK9e0iUA5fMHdN2K0mgre2Vikj+I/w+ThQQUEk03gU80b4irUMv1Zf96
 2kiy/ddLJdB9LDVtKWNT/kSc83GyitJuoCbouDn0YYU0YAuyUqgSQQPeIEE4ZQpFRm18
 Qztg==
X-Gm-Message-State: AFqh2kr0J4zCMWdK4IpjCURVXbbn06zBqRSjc/Vp0rCIrZq7zMfTei9S
 B2dvUMetr+MZN1qylLZUzcxrsJmkB35trUyR
X-Google-Smtp-Source: AMrXdXufQG2X1eCE8JnAfjKtamsyf3n9SMfccZW6Hai5SYaLAAZvUy5ow82sgBta3QrSKUkSvOGLQQ==
X-Received: by 2002:a05:600c:1e24:b0:3d0:8643:caf1 with SMTP id
 ay36-20020a05600c1e2400b003d08643caf1mr46383087wmb.16.1673253693165; 
 Mon, 09 Jan 2023 00:41:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c444a00b003d998412db6sm16163677wmn.28.2023.01.09.00.41.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Date: Mon,  9 Jan 2023 09:41:18 +0100
Message-Id: <20230109084121.72138-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109084121.72138-1-philmd@linaro.org>
References: <20230109084121.72138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index ac84bf0262..e41cb63daa 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -165,9 +165,10 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
+    /*< private >*/
     SysBusDevice parent_obj;
+    /*< public >*/
 
-    MemoryRegion dummy_iomem;
     bitbang_i2c_interface bitbang;
     int last_level;
     qemu_irq out;
@@ -188,12 +189,8 @@ static void gpio_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
     GPIOI2CState *s = GPIO_I2C(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
-    memory_region_init(&s->dummy_iomem, obj, "gpio_i2c", 0);
-    sysbus_init_mmio(sbd, &s->dummy_iomem);
-
     bus = i2c_init_bus(dev, "i2c");
     bitbang_i2c_init(&s->bitbang, bus);
 
-- 
2.38.1


