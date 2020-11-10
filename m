Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201922AD543
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:32:02 +0100 (CET)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRsX-0000ao-1A
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgQ-0001uy-8F
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgN-0006np-Fy
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:29 -0500
Received: by mail-wm1-x32d.google.com with SMTP id 10so2627896wml.2
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ou4ZFWD12P9GhCTxff4Tq2wg1qluvGIH4f1ZLPSHzfg=;
 b=p3kY5cufvNM8ZAOU7z6rUE8JBSqIflRPQsCt4MSubf88gvrqIUbhnykvlDDSUXH3x5
 7bv/RpZMs6zPO8z9ni3fX09pZzCRlfhvdA3SOxHHnVeIgxW3qC7O9f5c4F2vFweKF7Zz
 JEOVo7Zix9xh51+gDJahmcjF5n/Ix7l9zmNYQGvViPv6P/wi6Z/HGfzz+o+oaZtrP486
 gXXYpMFUhdos/pPWZhEu33G3YDIMVdmGXiTDFQSrET1zzqKr9H5yBKot7pVA7LTKKBgY
 8iciTbD1ZTOeAKxaMvL+kA/3ThwTu2REwBA09vkeUSfp1lw0Th7XSCtZ75zdZJWFURjG
 KSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ou4ZFWD12P9GhCTxff4Tq2wg1qluvGIH4f1ZLPSHzfg=;
 b=LMISDTdLyoKmdusq8FXC7Pt9GBiITbG7U2mIIRCceS7uNIlBJ33gi5svmHugdbqNZk
 rKbHS00IhU/UxAxdFg4z1dfLTgBa1rYivCfuX/9tzJYiM+YDxm+EfmIhHtX9aBSJRlbT
 sMJDMtC3xIN/AOF75BhWjKt3y8QP4IAodAYdYxaKDW27jbeAIMcqEDV7s1mW9pdDlt2B
 4FVksk5eV98RhWNukUtWBfCKm3/2PQaqFS8KjlGXC5WsyVfv053xs8uNoivkbopgHyYn
 ZHpnchq5I3fsOUC2GGdnjcWJT4xTGaReIVS29lmuFNOvOPrhUoDMDFR9hcm5pFiY+LGF
 Q6ew==
X-Gm-Message-State: AOAM532eu1Ub7mI0UWNZsRJ3hD4GgnSeNAjJllnQaHegrXd2uTpgkZIX
 2GZD9Zns5znN+OFNdRgKEsbac8dK/s+pZA==
X-Google-Smtp-Source: ABdhPJwdJixlmcI1NuHeyUeV0AN+X4UnF/uZS3vi7ckNDkG8iHrWl23LtQjQWpbcqllCM68HlPpZEw==
X-Received: by 2002:a1c:e087:: with SMTP id x129mr4121004wmg.2.1605007162918; 
 Tue, 10 Nov 2020 03:19:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/16] ssi: Fix bad printf format specifiers
Date: Tue, 10 Nov 2020 11:19:03 +0000
Message-Id: <20201110111917.29539-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

From: AlexChen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 5FA280F5.8060902@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c    | 2 +-
 hw/ssi/xilinx_spi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 7f703d8328d..d8885ae454e 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -53,7 +53,7 @@ static const char *imx_spi_reg_name(uint32_t reg)
     case ECSPI_MSGDATA:
         return  "ECSPI_MSGDATA";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index fec8817d946..49ff2755935 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -142,7 +142,7 @@ static void xlx_spi_update_irq(XilinxSPI *s)
        irq chain unless things really changed.  */
     if (pending != s->irqline) {
         s->irqline = pending;
-        DB_PRINT("irq_change of state %d ISR:%x IER:%X\n",
+        DB_PRINT("irq_change of state %u ISR:%x IER:%X\n",
                     pending, s->regs[R_IPISR], s->regs[R_IPIER]);
         qemu_set_irq(s->irq, pending);
     }
-- 
2.20.1


