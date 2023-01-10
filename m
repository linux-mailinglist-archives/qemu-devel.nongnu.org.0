Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B73663C70
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA10-0006dt-BG; Tue, 10 Jan 2023 03:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0x-0006cg-Sk
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:47 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0v-0006IH-Gr
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:47 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso5778686wmb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
 b=Th+bt4yJ1lcPNJmp7mm2guWyOANYuNWceYvjvU+oRqcRB4ydQ1ifTIcBQBiktd0C6C
 cwcedNwb75CB+7lHWfu2nLFJB9IyBS1sjdh2pE+ItF4XdghndWH08OM1bxukCVW7iiNG
 ttBllF+GcbM5Bi6QyVtkNWCXv/DVs/I0Uo6B1y7KHEVIUAHlSQyp1m+1Vh685t0wQDOT
 7lwxoO2stSbFWbes7TREhQ80c7+gKNziZz4ktlaUvZ4OkudyZD/ulLiMUVY383iA7qJ4
 a61J93MviWrke6JreQEb4GBpj67WYxVqMtrI4MSe5LhwqEM0aoecQdU71i4ttj8OWuM4
 3Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
 b=4tHJ3XWi4EyMqWR3npsLfFvab8TKizNfGB6+myyZkf69nVyzfLsf4ztqqs7573uDzI
 kxyL+qXVnD1ZV5oWob6msqyaH5g0UH03Diw5KYbZ5XeGF5excI04ZHMsDJ+2M5BXlmkU
 EE7tI9OuRAcEtAJEULdaYLMmS619VrjfmsDEBwLkZPTkIAChHeZ3A9gfDEq0MhgIY2mB
 1FAZi5U0Cm+tH4/GrTeU7byqQTzz1GSCKMoG2fKFddXwTeSyAqkKZd3unVmiCWnqcSY0
 Nz0VZxy9+XuJCHXlVVyf2ysTmnm05OLH6H9UeO3HEhw/2VZWsIp+Xf4e/pHy9Gi9P0p9
 1FpQ==
X-Gm-Message-State: AFqh2kq+omMOqduQsRe/XWL0cgNt4F3zJEshS5nBf+nD9Zph45XIv5sX
 9lCn3tvknTpu4wJtOhRP/dN1Z7cMScbIcZnw
X-Google-Smtp-Source: AMrXdXs9v/Pm0P05MA7IdtYdorpIWPPuxFRgLkIaRNr7x5/ccT9YIEVyC85u3FVEVF1P4vAts4sN5w==
X-Received: by 2002:a05:600c:1c11:b0:3d0:a531:5413 with SMTP id
 j17-20020a05600c1c1100b003d0a5315413mr47868871wms.34.1673339384053; 
 Tue, 10 Jan 2023 00:29:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a1c7515000000b003d995a704fdsm13949842wmc.33.2023.01.10.00.29.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Date: Tue, 10 Jan 2023 09:29:29 +0100
Message-Id: <20230110082932.24386-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082932.24386-1-philmd@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


