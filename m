Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692DA3F8CB3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:08:05 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIrE-0005LN-Ev
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIme-000552-H0
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImX-0008G1-PC
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso7374475wmb.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pKk+LOcRzNeYyyROZF52+vFq5RB02o3Jr5ppaRV11yQ=;
 b=UdHyq0tGtQVXKED7TLJyReT/UgXtt+Rf7VWVina+l9Jc8SOIUojxdmttrCPSS09Bms
 DFmMQGWxqj1/4hW8wH15CHQ9zDXGYAJXrsxI6kl5V9uKR5jvCzXD8Fk3mL4p+D/SNuXb
 JD4fonGpUzh7x6hl39uqNnWd1CV9yJ8C8jHw3bZHasPJMtnQeUDU3rGzISjZf+AUGgDh
 Hcc+Xacf8IO9wUQIbpHeZJTy7HhaoJ9aavPgZ3lcsboQp3G4E3m7zBPK2mCZc/f8LYef
 IUV5nTkWVwhER7hrppU0DU69bNfWnbqpMdosOf6xtc7GHLx9JRn9YFBOplfP9Srs6VkU
 tKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKk+LOcRzNeYyyROZF52+vFq5RB02o3Jr5ppaRV11yQ=;
 b=ptuEpVEujSTvhEFK32zw/PBlt/foFOQc8X/v+trfpveuQN4iZdOLyP0ibBW7/ocGvN
 7AzZeJ0X/+1cIk6pqvtoe/9FTekiesYssPiSfnrcx72TU0+h4LgN17qBat/4JcR2Skr3
 LFXWEUdg1NuFf7UawNkFp1HIBlx4rgAI3uYJnblKEZikmsPWNSXSamFi4WTKk7andrAC
 72UyQrFT4Z4oOaXEO+oyt+X2Tz81oFJ6AT/ngf7lQWgOTQb1CKF4LcwVZJbhzz/Qv84Q
 ci3bDooE6mwfuD1hTA0tGFC7IaIxSeiIgMYM6Bed3ubDWex398WkQ5dKbk5Uke1Rya2P
 o/EA==
X-Gm-Message-State: AOAM532BgXa2JTOahoSaWG6Svjei+IbF6p7dG584VsG+yhOlMfuU3FnN
 WgVL/tYT/1FpDD2PcB4LkPAUkk7LGhHc1A==
X-Google-Smtp-Source: ABdhPJztne7xvd9t1nDdH4UV1CoNRaXw/Ad/YLPLa2OzER4AJOtYVkNloQO19liSD/IP7w4lw6R59A==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr15446976wmg.162.1629997392384; 
 Thu, 26 Aug 2021 10:03:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/37] hw/dma/xlnx_csu_dma: Run trivial checks early in
 realize()
Date: Thu, 26 Aug 2021 18:02:32 +0100
Message-Id: <20210826170307.27733-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

If some property are not set, we'll return indicating a failure,
so it is pointless to allocate / initialize some fields too early.
Move the trivial checks earlier in realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210819163422.2863447-3-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/xlnx_csu_dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 797b4fed8f5..2d19f415ef3 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -626,6 +626,11 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     XlnxCSUDMA *s = XLNX_CSU_DMA(dev);
     RegisterInfoArray *reg_array;
 
+    if (!s->is_dst && !s->tx_dev) {
+        error_setg(errp, "zynqmp.csu-dma: Stream not connected");
+        return;
+    }
+
     reg_array =
         register_init_block32(dev, xlnx_csu_dma_regs_info[!!s->is_dst],
                               XLNX_CSU_DMA_R_MAX,
@@ -640,11 +645,6 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    if (!s->is_dst && !s->tx_dev) {
-        error_setg(errp, "zynqmp.csu-dma: Stream not connected");
-        return;
-    }
-
     s->src_timer = ptimer_init(xlnx_csu_dma_src_timeout_hit,
                                s, PTIMER_POLICY_DEFAULT);
 
-- 
2.20.1


