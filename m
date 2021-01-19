Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E160C2FB66F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:44:10 +0100 (CET)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rIn-0005DX-Tu
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFM-0002pL-2w; Tue, 19 Jan 2021 08:40:36 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFF-0003U4-Tt; Tue, 19 Jan 2021 08:40:35 -0500
Received: by mail-io1-xd2b.google.com with SMTP id e22so15849710iog.6;
 Tue, 19 Jan 2021 05:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gJngOH1B/sa/seE8Ljjvfh+JI+wjQtzMvApotHkWzA=;
 b=gh0yZC5b31mmFR6ZbDoxeaQWRnsnVHl/5YhCEw0XxFurBwazGUC7Ad/1DxWdGfC+K4
 +uJVIXLFnYKEZfvieqIUuxVPmcT00wuic1axAy3K+tkn8+OWIiZVddzl2YeWBPdeAp1o
 dJn06QYV1SDk4Ji2pMNIDaJ0B0vQoBaBDVWHzV5uiuxFYsNywLd9s/X869gsNpYIaWBe
 XpSdQJR1ZEk/Lt95zNp2J/otmxT3ZqCBaMVYfm0kQ19Zmy48IEWI0sFRJ7TVHrY7hqMX
 O/Cz3WvqF1pEVHd7uE8f/p045AvlBbni5auxMlpygUhaVMek7r82n3bxRdhhp/8POoOs
 mkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gJngOH1B/sa/seE8Ljjvfh+JI+wjQtzMvApotHkWzA=;
 b=n6hq4of13iAdaDprwmrqblLpr134gg7iwkRP06dontpHxDzgIKhh5NvvwX9Kkj65R0
 sg2M/NyTrxmE6rjF/45mepYBww6eYKbwsNV+qF9QxJJuqHbQEWQQJo64rG+40PWDNFas
 fvq2Q5pefvxcU37zXYCQUc2u0ZA0+dvdiEEABF3MEZmPKTf0smfI62QOm1zu8djQoDsU
 vFrJ2ffgjZV38RqqxORJXGPd1CRJImS7bDPEovYsMooFzK2Fr+g633Q1N/imgSz+cNOe
 bTPUEcHAwQZIue4YD8VpW9x7jrGPEm3N9T6rolwvKFz+yJjLXcV7wsKfXS1BdPV5EMdQ
 FttA==
X-Gm-Message-State: AOAM532QuE4HkXIf0/4jfpY2VaAh/882s7ZiXlt2zmIbuzANwHPhJGcn
 FBFyO9028+9cO2NK3Pc0Zuc=
X-Google-Smtp-Source: ABdhPJwCobkDcMIiOGUvGdNg0s9mDHusTq5KQDx2BF2M2l8P9u1Qq2alcQjinWT6E6NLDEgOm5YHmg==
X-Received: by 2002:a05:6e02:1a6d:: with SMTP id
 w13mr3567279ilv.181.1611063625865; 
 Tue, 19 Jan 2021 05:40:25 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:25 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
Date: Tue, 19 Jan 2021 21:39:00 +0800
Message-Id: <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When the block is disabled, all registers are reset with the
exception of the ECSPI_CONREG. It is initialized to zero
when the instance is created.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-4-f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v7)

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] rework imx_spi_reset() to keep CONREG register value

 hw/ssi/imx_spi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 8fb3c9b..c952a3d 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 static void imx_spi_reset(DeviceState *dev)
 {
     IMXSPIState *s = IMX_SPI(dev);
+    int i;
 
     DPRINTF("\n");
 
-    memset(s->regs, 0, sizeof(s->regs));
-
-    s->regs[ECSPI_STATREG] = 0x00000003;
+    for (i = 0; i < ARRAY_SIZE(s->regs); i++) {
+        switch (i) {
+        case ECSPI_CONREG:
+            /* CONREG is not updated on reset */
+            break;
+        case ECSPI_STATREG:
+            s->regs[i] = 0x00000003;
+            break;
+        default:
+            s->regs[i] = 0;
+            break;
+        }
+    }
 
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
-- 
2.7.4


