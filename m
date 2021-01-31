Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4422309E3A
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 19:48:53 +0100 (CET)
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6HmG-0003un-Fo
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 13:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hii-0001yE-2e; Sun, 31 Jan 2021 13:45:16 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hib-0007Zm-Fb; Sun, 31 Jan 2021 13:45:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id s24so10111919wmj.0;
 Sun, 31 Jan 2021 10:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtbqU34AXRgK7JucvFyMPpEvpdP/cEkbkCwJzoZsw+I=;
 b=VF6E2NXWtD3zEAXLxVC2hK7Xfw+t82rTxtn7y+LFa8QYc9gEzoBxDBPmHaYwec7x8o
 LrYX6BHL7XdNGODXIuOz5zEAc43+hPzBqi1DYvi+ByFyTxuAy01gwxyAp31Nu5ldicRj
 RKw+hdSgZaG5yPmS29wZB12XDVPxkbmtCOabb01srH22WqD0/jLx9SLPKtGrUBnJebBL
 XTjnIJlZTQtQlNDGI9DDWEvhvS7Bf3fdiQaKJ6XMb6OXqk2bwTTFAjcfT5iUqwQ/m3Ce
 qlyiBBx8MKKQX2VIQBNMDHSiy+i0QxGImWgz4fg12CDwDec430LcEU9xVyeJJym2PF9g
 aNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jtbqU34AXRgK7JucvFyMPpEvpdP/cEkbkCwJzoZsw+I=;
 b=p77M+lYcHnuuwyUv6cC+qpxvtGAKCPzqo+F/zSQYfiNcoE5I3xcKwZCjA05Vmj7DYB
 aGusMUiY+Lgh7xQD8kegkC9zntUVVUkelByCyumtzmdLcUzXrFA+ZAaXEB0kRUwMy6sV
 gROVDcGiN9BQ0+34SgKVlqsau1Gm8CkDwBNDbWLGyB3D+Zx2bIXNyUUF17ogVcbWW2WE
 qylGhQrioK7v9hKA3oL1BCd5zupyYuPZIUZJOM3tzJcmESTGXNuHuXIonpZa3mQojhqo
 rrHps1yaqJKdJ08Vy9lDtuM4iTd5pAfm3MiWIxNWHTTwk/oF0nNn253d5ja88FQ2rDmw
 4KaQ==
X-Gm-Message-State: AOAM531FJWTYHRe7E6FlNy1kkiof1PRpHTnO6WVr5WtY+zQYzla9bsf0
 CQ+JlENNkWvR94X1MTU73JK/2bKNj64=
X-Google-Smtp-Source: ABdhPJxU15vx8xnGdlqkUvGg8ERV48eMOGbdkiBcOqh01PjQ4ZH0IIbRq2SQ/8gv7gXCXsbocm8sgA==
X-Received: by 2002:a05:600c:3545:: with SMTP id
 i5mr6404850wmq.134.1612118703233; 
 Sun, 31 Jan 2021 10:45:03 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id p12sm3807281wmq.1.2021.01.31.10.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:45:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] hw/arm/exynos4210: Add missing dependency on OR_IRQ
Date: Sun, 31 Jan 2021 19:44:45 +0100
Message-Id: <20210131184449.382425-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Exynos4210 SoC uses an OR gate on the PL330 IRQ lines.

Fixes: dab15fbe2ab ("hw/arm/exynos4210: Fix DMA initialization")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a320a124855..223016bb4e8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -52,6 +52,7 @@ config EXYNOS4
     select PTIMER
     select SDHCI
     select USB_EHCI_SYSBUS
+    select OR_IRQ
 
 config HIGHBANK
     bool
-- 
2.26.2


