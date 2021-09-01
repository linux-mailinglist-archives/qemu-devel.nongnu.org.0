Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899303FD877
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:11:05 +0200 (CEST)
Received: from localhost ([::1]:41102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLO92-00046U-JS
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcS-0007Al-Kj
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:26 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcN-0005tb-IK
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id m2so1549242wmm.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X6DKKwrxjW32EfCvSWfAmj3EcMaeoYEpjbuklyKkPSQ=;
 b=EFMhro5mF3RMnoJ48ODZ81uaFRHes4WXMYfRUAsAIkhSWZreDmqk83r0ExmFEe9SF2
 snSTRKEz7JfuxCpSg+fhhwrVnqgqHzOVTwUJhq5L+K3KyFWCIV+LvvJMmJOt+oJsZ3bO
 sObLVmgi3Tp0Z/k50AE+DOklJGWWQ/XsuVmwulUBESZXvi9bZSMKhy4UgicWxm0Bp8Jb
 v3W4dpdx/dhhRL0aA+hOV9WVwCD0vWh1eGcp33UyO6Jdz0Cirmyw69mDtQZfUWonj48F
 Km2XR02IPx04TzaBg2HNvCXo/buecvDklLqJIumC24Z/zDZGqNMD/EDQM0LPHQ09UX7u
 xx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6DKKwrxjW32EfCvSWfAmj3EcMaeoYEpjbuklyKkPSQ=;
 b=b5l8RmKz7fXCB6wKfaYtR6fFG+1F4LnOqqTKUJqTrem5tA6RLSUmJo9stqAy6l5LKi
 F9pxm2P2cj91HdvmIUI5uBmKxGp1EWSMQ/Ge6slpHXyr31canbt9WCTwS4/E3YDj2+F8
 AR+YFZVuAcyzyxRmBrBvSRly0mTtxCdic6K3W4PVKkFlmfT/vVqIfartyRr8V0AQlN7S
 QXV9tTUeuC5qw45Jg6wVjHbwDr82FEFw5BJLzKM6NWP/Gy5qN9147F4rZqJfZ57pWMSY
 oNxMmg5dF+mi13/FRChrW1cAOE//4OYpYB4rWlYfIpIou8cAKskXmTQ1uuVHYEUaS8Ja
 NHQw==
X-Gm-Message-State: AOAM5302yYT9X6XXfFkmIbK5pPe7jE8/YBtHM1azlJ8xVZ/xwwekaFP/
 YHdvfsdE0YbTtNeuGm0P7iWD8+czT4VM/w==
X-Google-Smtp-Source: ABdhPJxwUi1Knzdn0GxDwLY8Sjl2s2MGhWix7EV5C6mmV697XXIfBFEl7pgUI9vBN0cKhiosMBrvUQ==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr9043445wmj.128.1630492637994; 
 Wed, 01 Sep 2021 03:37:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/51] armsse: Wire up systick cpuclk clock
Date: Wed,  1 Sep 2021 11:36:35 +0100
Message-Id: <20210901103653.13435-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-8-peter.maydell@linaro.org
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


