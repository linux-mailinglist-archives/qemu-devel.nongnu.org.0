Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5686621C9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:39:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQM-0003te-GS; Mon, 09 Jan 2023 04:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQF-0003rl-Qv
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:28 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQE-0005Q7-9h
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m7so7475901wrn.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJUniGzlTDF6ixFuHu4g7ABnLTHD1CJ9TnkuUuv7wWI=;
 b=hkCIZQCHQp1FroAn2gI2/1l5DOwcafYO+5t04QxOmU75E+xSw5ARtl6o9vEBhsefqo
 zPgBgZUq+3w3trwO53EphRoMYBNUHxYhii07midJZnViYQ7WcLZjVLetrjZX5hpDaltV
 Rk92NJeBs8JOycuZ67lzi4+izJU5TFYUOGFvxlbh937oMlhzhVOlM6GwmsEBeWSkxA77
 JaapLuxyYe4K/OKh+z7pwxCmQvOIB6pNOQwR63NJ+XPwyiHA9fBna7tU/uzaBefdS4Cn
 58qRxkhGdnxoEcaIoUYUocRApm6QzIUp1/p9ozLpIbFjel94Lj9XnqLoiQzH+KAvRy7W
 562Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJUniGzlTDF6ixFuHu4g7ABnLTHD1CJ9TnkuUuv7wWI=;
 b=h7bk1GRgmuwgz2CJMOPhWXzHy/OJj3+fekpmPIPtX1ywzgT95E0QnUxseiyYIj/f3x
 2QYpW1Y3BakCE1MJJB1fucEsAc7iLsh6yD+EpBTBWl2wVg5HpvC42FmiR5oMgFaqmb/3
 +H59m1SdxqqbHqM29TAXDt43y4EWccwc5TtNh/ndhakCsE7KBcr1HAZIHsFM1mKFj+EY
 Kswx9giYY/eHTCRALaz6vb95tByWKrvgYZEuPey0iSLgGnRcjzpXnblnekSYk94w0hxV
 mHKQAddyeWn7RYLJM6I5BNlGKgEuoGGX8gUBOmynuTi7SkuS1cy1yKnkP3pk482XXRgj
 iSKw==
X-Gm-Message-State: AFqh2koXRlC3tcFngWvGARu0XiPJzDMjXRkL+cTdIHcPzt6TxlJmVyCy
 Cm6LI9YW0E/4kBSo7LRJTBuW2VLsyxUXyVxS
X-Google-Smtp-Source: AMrXdXt/KN1/kv0D2QhrCZXkzeXOaLRtM9oyyWMl8JDYB9u87PkJ6ib+WUQW8aNuifSHsU+kmuGkLw==
X-Received: by 2002:a5d:68cc:0:b0:2bb:9106:d0a with SMTP id
 p12-20020a5d68cc000000b002bb91060d0amr4101166wrw.14.1673256384583; 
 Mon, 09 Jan 2023 01:26:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6b84000000b00282194eaf7bsm7799550wrx.71.2023.01.09.01.26.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/9] hw/arm/musicpal: Remove unused dummy MemoryRegion
Date: Mon,  9 Jan 2023 10:26:09 +0100
Message-Id: <20230109092617.80224-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 813232682f..23359a6ac3 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1071,7 +1071,6 @@ struct musicpal_key_state {
     SysBusDevice parent_obj;
     /*< public >*/
 
-    MemoryRegion iomem;
     uint32_t kbd_extended;
     uint32_t pressed_keys;
     qemu_irq out[8];
@@ -1160,9 +1159,6 @@ static void musicpal_key_init(Object *obj)
     DeviceState *dev = DEVICE(sbd);
     musicpal_key_state *s = MUSICPAL_KEY(dev);
 
-    memory_region_init(&s->iomem, obj, "dummy", 0);
-    sysbus_init_mmio(sbd, &s->iomem);
-
     s->kbd_extended = 0;
     s->pressed_keys = 0;
 
-- 
2.38.1


