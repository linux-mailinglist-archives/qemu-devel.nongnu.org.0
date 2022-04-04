Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA84F1929
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 18:07:31 +0200 (CEST)
Received: from localhost ([::1]:34026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbPEo-0005T0-Bc
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 12:07:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvI-00051x-6E
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:21 -0400
Received: from [2a00:1450:4864:20::430] (port=35741
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvF-0000WX-FD
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id w21so15182279wra.2
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iNTiGveDONdrHQD+VX0mvi3HRu/RqOepB5gwWTWxkaQ=;
 b=BoK0bbSrVYlqwUlNVooDuesrca50dFq+TTRPDjHm43YAk8Q473N/RQEFfivoo1Z47L
 5v0IyxVgVlRcQsKRQb9/TsL9qmzGAWyo9Z1mGoWfyVVmle3rHWOqeiJLmgQ4c1rrTwDB
 yVdiOoYFSQ1BaSG0jpJ391JSFPM8lVMkCui6W01zs6reMTfFYYQol94khzbHx5cJzl4h
 A2Xb1D/xXPU6YAUroG8sH9eneSXdAabUBq8R+uZJ7NmMtCdg0MjTjCqB+LQJq/E9A0WQ
 bL+rL4PVe3HriJr8izSOcJi4pGdP7XcC0UZcinQHh+jAOKBVJmmuc/VkJWTySMM4QeeP
 Txxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iNTiGveDONdrHQD+VX0mvi3HRu/RqOepB5gwWTWxkaQ=;
 b=wEVa15IL0pIjIp5EkQ0lbeNwkSgzOTorUpERRDlszBHKlDO0PZTfv5PUjDch8jFdif
 zx7qtkVtxY6hAkwKVxs5Nxdk7VYOfnMKKAgsZAmnKYfCn9Ec4b/CVNZQl1RbVoesdgJy
 QnUQafg3/3Jv6t6eMd8G+IyBLOmAzzIq0h++W7PxN26ThiLzWJoiP+y37hkMaqn9nQkA
 +U0f8/iMhoQ7SH/QcOy9W4v1LeZqXM2tHIg8lFxiSXZsxzEeJaZMf70YstBtZZDZj3kj
 Ri9T4IgvXt6Ptii7WX6xmgOiVP6ShQu/WMASuhahzKgCT4Kfk/YFo2e5BgvdUT0XJ3q1
 RF5A==
X-Gm-Message-State: AOAM531h7vSfXnLkoKigVBgmtQb70OIPNmC/ZV60fVdHUkDPR3mNcNUG
 iHqV5qxabBQDwm3M9xOrVrVZ9w==
X-Google-Smtp-Source: ABdhPJyFpF60GkmhBVTUB2KytHUetjeyC9hbIWBfxsqRJLnvzVBQs6ztByK4CyURqfv4V4kz00d3IQ==
X-Received: by 2002:a5d:526b:0:b0:206:d11:7b6d with SMTP id
 l11-20020a5d526b000000b002060d117b6dmr267715wrc.135.1649087234334; 
 Mon, 04 Apr 2022 08:47:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 14/18] hw/arm/exynos4210: Connect MCT_G0 and MCT_G1 to
 both combiners
Date: Mon,  4 Apr 2022 16:46:54 +0100
Message-Id: <20220404154658.565020-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently for the interrupts MCT_G0 and MCT_G1 which are
the only ones in the input range of the external combiner
and which are also wired to the external GIC, we connect
them only to the internal combiner and the external GIC.
This seems likely to be a bug, as all other interrupts
which are in the input range of both combiners are
connected to both combiners. (The fact that the code in
exynos4210_combiner_get_gpioin() is also trying to wire
up these inputs on both combiners also suggests this.)

Wire these interrupts up to both combiners, like the rest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/exynos4210.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index a4527f819ef..962d6d0ac2a 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -281,16 +281,15 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
 
         assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
         splitter = DEVICE(&s->splitter[splitcount]);
-        qdev_prop_set_uint16(splitter, "num-lines", 2);
+        qdev_prop_set_uint16(splitter, "num-lines", irq_id ? 3 : 2);
         qdev_realize(splitter, NULL, &error_abort);
         splitcount++;
         s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
         qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
+        qdev_connect_gpio_out(splitter, 1, is->ext_combiner_irq[n]);
         if (irq_id) {
-            qdev_connect_gpio_out(splitter, 1,
+            qdev_connect_gpio_out(splitter, 2,
                                   qdev_get_gpio_in(extgicdev, irq_id - 32));
-        } else {
-            qdev_connect_gpio_out(splitter, 1, is->ext_combiner_irq[n]);
         }
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
-- 
2.25.1


