Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F7F509EBD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:37:53 +0200 (CEST)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV8C-0006j8-VN
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq5-0003AG-36
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq3-0003Vx-Bv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p18so6214367wru.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1PyZdnk6RoN3xmhb1oq389S8umKBSyZVP3ZN0NOpuv4=;
 b=ezgU+k2K7uylQi+TnfdXloAlNPAhxPyPYVOnPWz1r98/ZviPpKcyyN1Smw2ArwhNzs
 dfg8mAphw5kwrUhN7YCKVDwC0cMaNM6SpoP0+YNmcEIhhuK8UarLQCzbTDmop5iq2qX5
 4nmXnuE4smBtCUmkxljADcB2Eseyahuaq9ZxUxCpZWEjTfATGfuD5t/vY5pWUQ7hvgz7
 GCAo/V0fYJafvDU8n1qvaunaOqgc35C41EXhCVhve4EZxUTXNvpc6tR3v3tFI2aY/ZNr
 8PjkHlhpks/e+E2ZgMRHofdNMUTJ0+9ZfOb+8GVkJdhIBqo6E4L2msMz+T3IM5ZRC1vJ
 uZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PyZdnk6RoN3xmhb1oq389S8umKBSyZVP3ZN0NOpuv4=;
 b=hxR5gqksoaZrsY8Rshzz1wFftY864Ao04a7Clv8VgzwhwR/BTZT/RbMIjiTbRcj44V
 9F7pJuFlDKw0CiU3wOUX+EfTWnJYof2zEbkaIY/SV9PIECg8tqwevOefavftmGp7jJvh
 vdlLGONNU7Eh4p2KGEeA8xOS3wNFjT9oazF2J1X2/9faAYGv0aQu3p/T9StSyM9Zh5PL
 vNXhCbNHOWOMlJgizIaycM4fvFC4JUfr+wc5piKQxvVicSTYWPg6rU3RLQDGFRvVSinO
 zmBB0WV0tWMW6b67X3AnwbX2oL+GKQo0JEIMzX1tEP3eARcOGkcMyVQ/23DjTh/67aRk
 nK/Q==
X-Gm-Message-State: AOAM530JTrnLi3drLodmS3aLq7+j0UxVEt3wSDL/BuYQWKU+XkXeLUoz
 C5LvVqRRzrAjgHao+vjVx7fyr2+3wlwYoA==
X-Google-Smtp-Source: ABdhPJzTrchYsNBiR1O5YT4odZ9vSj6EM1GunEBIhJKTDL2sxCQYJPLXOj4DVd/4753BJO2+iTquHg==
X-Received: by 2002:adf:ebd2:0:b0:20a:9c10:ab29 with SMTP id
 v18-20020adfebd2000000b0020a9c10ab29mr13124200wrn.212.1650539946108; 
 Thu, 21 Apr 2022 04:19:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/31] hw/arm/exynos4210: Fill in irq_table[] for
 internal-combiner-only IRQ lines
Date: Thu, 21 Apr 2022 12:18:35 +0100
Message-Id: <20220421111846.2011565-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In exynos4210_init_board_irqs(), the loop that handles IRQ lines that
are in a range that applies to the internal combiner only creates a
splitter for those interrupts which go to both the internal combiner
and to the external GIC, but it does nothing at all for the
interrupts which don't go to the external GIC, leaving the
irq_table[] array element empty for those.  (This will result in
those interrupts simply being lost, not in a QEMU crash.)

I don't have a reliable datasheet for this SoC, but since we do wire
up one interrupt line in this category (the HDMI I2C device on
interrupt 16,1), this seems like it must be a bug in the existing
QEMU code.  Fill in the irq_table[] entries where we're not splitting
the IRQ to both the internal combiner and the external GIC with the
IRQ line of the internal combiner.  (That is, these IRQ lines go to
just one device, not multiple.)

This bug didn't have any visible guest effects because the only
implemented device that was affected was the HDMI I2C controller,
and we never connect any I2C devices to that bus.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-14-peter.maydell@linaro.org
---
 hw/arm/exynos4210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 919821833b5..a4527f819ef 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -310,6 +310,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
             qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
             qdev_connect_gpio_out(splitter, 1,
                                   qdev_get_gpio_in(extgicdev, irq_id - 32));
+        } else {
+            s->irq_table[n] = is->int_combiner_irq[n];
         }
     }
     /*
-- 
2.25.1


