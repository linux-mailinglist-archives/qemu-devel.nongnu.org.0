Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E383B4266
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:21:09 +0200 (CEST)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwjtU-0001MB-2y
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrR-0007en-9G
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:19:01 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:36483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrN-0004W2-O4
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:19:01 -0400
Received: by mail-lj1-x233.google.com with SMTP id a16so12024105ljq.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=72EAHzjgI7n9esbIxOKx7xfZpD41wmTxY05X8fNraEE=;
 b=BS0i51QGphBB7lAKKvSacnw0beS4Yp1wepo2Ec0vsYwt013aBIs93AOUQY76eP2tlI
 Z3rysiwTV8Nz0630W5GcwrlaXf0xRwYNumdMgYr+/O5lTVJjCFRVnGY11gfa0x5x9QoL
 UUyM4kUGcjMLHcYeCyhyNYScoFvqSWy9Amn+zaDDGMUgSN9D5x7VUm4pCqE8Bv/9iS/G
 DbbH7YycLmxdYyc2RsS1pTOarJtrtz4HAzImGS7bYwL9NCROzGgIdyvyHxQQe9IVoujr
 j6lL01abans+LpGkfqyrk4Pd5pqiUvnYZeg/TY8aRE6JtWW2vQyPZQSQ86778Qt8goPp
 +w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=72EAHzjgI7n9esbIxOKx7xfZpD41wmTxY05X8fNraEE=;
 b=hvf9xo/3TtzAoj2E1Zi9JB739p1YTf04w+Wp6sD5a7MY+JfeLd0LK2ncrwHPFJwi7d
 XczRFZJPaggM8BMVSkRZdO7/sEtY+LQMoGH82F1JppfTkoREdQv2TG96phm6Lk+bSQX2
 mWwtmSbepHJxab/X3eleN7DJKvSU1SQOiE9AvVNOXPo4n/nvPo8YPMNq7gXK+TMlXqS8
 bLcJec92kxl1LjFUQ9XONie9bdYuF01pS7b3R4npy9eSitPQMHA49MuI2gs3sBwh3ktN
 kDbTcTVMHCKGTA8KZKqAOZ4d16plvC5xwn+a/05xzMeacG4Isk1K6sYUlLhQzUKK6QVC
 OVEw==
X-Gm-Message-State: AOAM530FZ0Zm+BDSDrSKzH2wMbf36uGdq1GSYbakBtWWssNwzXJ3apM+
 z2SpG7Apg/u3laFUyD8w+4ULN0oF17iuYA==
X-Google-Smtp-Source: ABdhPJxrGgtWCsuGBq4rNRi/IXKohT2eDx/kRclC9lO4JQf999r6oNRaDX1uLsAJmr5O2m4W8srxcA==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr7614924lja.439.1624619935974; 
 Fri, 25 Jun 2021 04:18:55 -0700 (PDT)
Received: from localhost.localdomain ([91.193.178.173])
 by smtp.gmail.com with ESMTPSA id p19sm536354lfd.70.2021.06.25.04.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 04:18:55 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] arm/virt: fix irq mapping for gpio_pwr
Date: Fri, 25 Jun 2021 14:18:41 +0300
Message-Id: <20210625111842.3790-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625111842.3790-1-maxim.uvarov@linaro.org>
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix irq mapping for virt machine reboot and shutdown
interrupts triggered from ATF code.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4b96f06014..d83f4ebdd3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -846,8 +846,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                            "gpios", phandle, 3, 0);
 }
 
-#define SECURE_GPIO_POWEROFF 0
-#define SECURE_GPIO_RESET    1
+#define SECURE_GPIO_POWEROFF 1
+#define SECURE_GPIO_RESET    2
 
 static void create_secure_gpio_pwr(char *fdt, DeviceState *pl061_dev,
                                    uint32_t phandle)
-- 
2.17.1


