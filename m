Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16784509F24
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:57:55 +0200 (CEST)
Received: from localhost ([::1]:49296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVRa-0001CO-6w
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqW-0003NF-4a
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqR-0003Yf-QD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id w4so6176572wrg.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1vQQmnvrDnu1486ihClizISxJdbac6HgCRxcsBLC0jQ=;
 b=ses9ETiUbAm0kzmUJWLRZdA9dCCpjd848fLEzR6NyJ6Z0dJFazIaAr3VggB+0JUzC8
 cawe4ULRfCuzZ2pk1Wm/L7sbKJaaUCDJ/SqtgbcI6B6t3bqfcgIeLogWUdYCqZSzLEsh
 Wmln/ckjtbQB7W72EDHipCY4ew/RxcLKtz2BPHfRTHgGAf8LuEFRSKI+dmsp09tKD/vP
 9x8t/0DB16I/8+vKdJLx6NuvgxZvCynrjxRO8zJpiOiTdHp8IMMbypQeozQ7W7PzXVF1
 s/F+YM0BcnJSCq66DD4YUJ7K2kDyMhLSVBCRBhJDosBop/PlWrI/Qn6QArLj9UuuxLS9
 fvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vQQmnvrDnu1486ihClizISxJdbac6HgCRxcsBLC0jQ=;
 b=KFLL4+2rIj5wCGNlhIXyryj4giH/tzd4L4ndq1k36RN/BbM4ll037figDyLnn6uUw4
 /xwsRVQ07gZxRp9AcfYY2wkdsJ9/UjQ62leILjFM6LUN1F98Uan6fTI5bLDsAhLOMd4y
 AdELdHnjeN2Ix0xTr5BS2ja25TitwqqGU41EcjMgR+z5SQ2b67vbpDZ18h0z8VgsFX33
 fyCSJVQyI6rboeESj7jYrmB1wdPE8zPj7HBSwXiZxO5A4B8Dnz1srUEP3mGIF7OC4pyt
 K0bwKKqU44m0fJ8lTOqPeM+RLIEOlkc5/btpJKaAKDd1lG7W2Ow0rpHKA+mdjldLymUP
 H49g==
X-Gm-Message-State: AOAM533/aHKBvYA/Jd6qM2uM+zMZaRmEIhabsQ7WN6DMGcldEUCYza3q
 1Mom9ERsMyjI7/jRdoKNefZenwZONomFtw==
X-Google-Smtp-Source: ABdhPJzXO1zgZXWfw4zUVISFd4LhZJHLsaoL9P7JE82AuIPSx32M3CBJbf3yuIp4rxbaoGUEkbyP+w==
X-Received: by 2002:a5d:64c7:0:b0:20a:8785:eb43 with SMTP id
 f7-20020a5d64c7000000b0020a8785eb43mr18353638wri.210.1650539957539; 
 Thu, 21 Apr 2022 04:19:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/31] hw/misc: Add PWRON STRAP bit fields in GCR module
Date: Thu, 21 Apr 2022 12:18:45 +0100
Message-Id: <20220421111846.2011565-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Similar to the Aspeed code in include/misc/aspeed_scu.h, we define
the PWRON STRAP fields in their corresponding module for NPCM7XX.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
Message-id: 20220411165842.3912945-2-wuhaotsh@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 13109d9d324..9419e0a7d2a 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -19,6 +19,36 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
+/*
+ * NPCM7XX PWRON STRAP bit fields
+ * 12: SPI0 powered by VSBV3 at 1.8V
+ * 11: System flash attached to BMC
+ * 10: BSP alternative pins.
+ * 9:8: Flash UART command route enabled.
+ * 7: Security enabled.
+ * 6: HI-Z state control.
+ * 5: ECC disabled.
+ * 4: Reserved
+ * 3: JTAG2 enabled.
+ * 2:0: CPU and DRAM clock frequency.
+ */
+#define NPCM7XX_PWRON_STRAP_SPI0F18                 BIT(12)
+#define NPCM7XX_PWRON_STRAP_SFAB                    BIT(11)
+#define NPCM7XX_PWRON_STRAP_BSPA                    BIT(10)
+#define NPCM7XX_PWRON_STRAP_FUP(x)                  ((x) << 8)
+#define     FUP_NORM_UART2      3
+#define     FUP_PROG_UART3      2
+#define     FUP_PROG_UART2      1
+#define     FUP_NORM_UART3      0
+#define NPCM7XX_PWRON_STRAP_SECEN                   BIT(7)
+#define NPCM7XX_PWRON_STRAP_HIZ                     BIT(6)
+#define NPCM7XX_PWRON_STRAP_ECC                     BIT(5)
+#define NPCM7XX_PWRON_STRAP_RESERVE1                BIT(4)
+#define NPCM7XX_PWRON_STRAP_J2EN                    BIT(3)
+#define NPCM7XX_PWRON_STRAP_CKFRQ(x)                (x)
+#define     CKFRQ_SKIPINIT      0x000
+#define     CKFRQ_DEFAULT       0x111
+
 /*
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
-- 
2.25.1


