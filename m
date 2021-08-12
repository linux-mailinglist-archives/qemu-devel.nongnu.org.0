Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4013EA240
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:43:35 +0200 (CEST)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7FO-0007uM-Un
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76L-0005Gb-A3
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76F-0007pT-D2
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 203-20020a1c00d40000b02902e6a4e244e4so4045558wma.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gy7QIjwsa6xMVXE5/WQWgxzP9shOsuOqrCvuoAh1kM0=;
 b=yjEztFIiLyTiFaUGHat3wweOHC+q7B1SVZktRxyNoKabbUmXzq9zgwbvQHWkRlskJR
 PH0GtkH6Js8m1bZRrw+PUP5heepK13l56bubLm8B8GNQSIKdnblBTW3yBugpEiH0qMmK
 aqUWHQX6fBC0xSWJn/4i9hkbNtzErj0qBLTrDoW44DpCiEQVEkN7LLd3QHgvirYs4ufx
 cS8557TZEjDNjxUb1ZUW0maKaeUMrHTzYIHJNDoW4oazsoF2rGbHFUvOgJPQfZO5JMF1
 MA3hkthZJTZGv7a9+z43gWFUmnfTledZGrMOjx0/LPvx7YnBxNh53ZBGVskn0egqKfgY
 ywdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gy7QIjwsa6xMVXE5/WQWgxzP9shOsuOqrCvuoAh1kM0=;
 b=Q9dcF+J2T3k2FMDrr9x4fYizxN43IzggTK3i6F+D3P+q/4SZ7w+C9Y/HjSzeHoHQ5d
 mk3xZ/UWDBQwkZpv9IdB5q8xgdn0e30AAfn1V8U0zEKO3qSsgy6b6/49ShYSzC5SJ0jD
 EdGTwbQYSvziyH7WOuccBl1HlLb/w3XNIXpSAAcYU2LelWJIZPOM+KKCUExV3ahADHQw
 mQtUtaqOAQiyBuqiYaguFX6X/4QfK00jGaAbyQMQMLsMDwnxRbq30FlpXq/uq+GvMaKN
 lrJAfhm9yyHsaJplWxXMGcJj1aRRWHzwmfG9XLbZop+KCpJTxNsjOkjMli7lJkKoRlCl
 pHMw==
X-Gm-Message-State: AOAM530MLoqzUZRyTUc9tosoG/R/LzUTHnIS/2zdRM1IU31l8MuDb+ha
 NRbV7f0aXHz8ELAA5rSHp6O1gw==
X-Google-Smtp-Source: ABdhPJyOmXWFvfimkUSaqvHXtbMt4h2g9MAtAh2S8uua2F7zFr//AXorfDG4+o9BUr+dn1N8+A80eQ==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr14389545wmc.15.1628760845800; 
 Thu, 12 Aug 2021 02:34:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/25] armsse: Wire up systick cpuclk clock
Date: Thu, 12 Aug 2021 10:33:38 +0100
Message-Id: <20210812093356.1946-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wire up the cpuclk for the systick devices to the SSE object's
existing mainclk clock.

We do not wire up the refclk because the SSE subsystems do not
provide a refclk.  (This is documented in the IoTKit and SSE-200
TRMs; the SSE-300 TRM doesn't mention it but we assume it follows the
same approach.) When we update the systick device later to honour "no
refclk connected" this will fix a minor emulation inaccuracy for the
SSE-based boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index a1456cb0f42..70b52c3d4b9 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -995,6 +995,9 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         int j;
         char *gpioname;
 
+        qdev_connect_clock_in(cpudev, "cpuclk", s->mainclk);
+        /* The SSE subsystems do not wire up a systick refclk */
+
         qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + NUM_SSE_IRQS);
         /*
          * In real hardware the initial Secure VTOR is set from the INITSVTOR*
-- 
2.20.1


