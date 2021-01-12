Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5232F3364
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:58:07 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzL7W-0001M7-G6
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5M-00082n-IT; Tue, 12 Jan 2021 09:55:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5K-0004mj-TA; Tue, 12 Jan 2021 09:55:52 -0500
Received: by mail-pj1-x1029.google.com with SMTP id p12so1718363pju.5;
 Tue, 12 Jan 2021 06:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Mb3Gb3M8mku4NpiAEdzwbwGDJi9TG7kc1WGZbG7wr8=;
 b=AiA0hsFItQRCKYjjo3cYdF38rHmLaN9uBdkzN37njizg3WBWHJe11s5AgXum8IQkow
 GpQHNNpRuWXc3j8Wim0/7nEFNSAbkJl93AM4qWHk5wpLCjBmvPeI9wMcAfzkwSaE/4a0
 IxiY2+pbIDqMPSHYmP4nsJ63jFz//E7Ewrq+q1WxCeh9OuvULevQRXc2KGmShvUObR33
 22sOq8C61RKunQwdr7kmyEcWplqqXxwVJK83H1yGdZiUwk3i7Tez9aTgPRsNmXRfcKvk
 R4GVJffOcd65GlYGz6Kzuz5pr1V5jTEp/CF0P8pdu65kzexoe2GLY33DTBwMmrRxCgjj
 JVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Mb3Gb3M8mku4NpiAEdzwbwGDJi9TG7kc1WGZbG7wr8=;
 b=KU6AGGNzJ1ZEz0T82+iLclAMhVnFEuOfuqKpkNmqkvJf+zWUn9PTe9ONiLRrWIMkjt
 l+ZRRUV5GDwNpjwmL6tLpfl2mMg6iX9wCEgB4UUyFQlH04Jq5uXRZ8xKqD5FIFCBMfBk
 h7ldclEqaFAn5MDuGJdMh+E10USacsaRDC4ks90xb4s15N0GIvgIaPIiprQYv0AmxGIY
 or7ahmB/z0KNPgCTtLX7BSjufXn9F7606rb0awB2LXCkw6awWr3BKB24EsWNopGQ8cOR
 /uZ63/+q05yruDn0D/2QMNzC/VeOru2dG0c3Z3zbYB1U6+IsUgGwMUr6HKfPkYpJmDfN
 mCGw==
X-Gm-Message-State: AOAM532g+dQOAoWIzuJawRVNKKypksE35iT1np4L3p6gJ1Gm1cuB5NWI
 Jom0PXojgOtIQ+/OpmZ0rsA=
X-Google-Smtp-Source: ABdhPJxGw0hbeByYHLOMKZSRiBsuEz7yg10pbML/YRrDZbi5c0WJys+c4Oo0mP2pb0vT8BP73JAwZA==
X-Received: by 2002:a17:902:a711:b029:da:f065:1315 with SMTP id
 w17-20020a170902a711b02900daf0651315mr5552623plq.36.1610463349100; 
 Tue, 12 Jan 2021 06:55:49 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:48 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 3/6] hw/ssi: imx_spi: Disable chip selects when controller
 is disabled
Date: Tue, 12 Jan 2021 22:55:23 +0800
Message-Id: <20210112145526.31095-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145526.31095-1-bmeng.cn@gmail.com>
References: <20210112145526.31095-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, but chip select
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

(no changes since v3)

Changes in v3:
- Move the chip selects disable out of imx_spi_reset()

Changes in v2:
- Fix the "Fixes" tag in the commit message

 hw/ssi/imx_spi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 4d488b159a..880939f595 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -246,9 +246,15 @@ static void imx_spi_reset(DeviceState *dev)
 
 static void imx_spi_soft_reset(IMXSPIState *s)
 {
+    int i;
+
     imx_spi_reset(DEVICE(s));
 
     imx_spi_update_irq(s);
+
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
 }
 
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.25.1


