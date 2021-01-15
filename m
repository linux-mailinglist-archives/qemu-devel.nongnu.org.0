Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE212F7FCA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:40:20 +0100 (CET)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RD1-0000hG-1A
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4Y-0005zN-7T; Fri, 15 Jan 2021 10:31:35 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4W-0001Ht-SS; Fri, 15 Jan 2021 10:31:34 -0500
Received: by mail-ed1-x52f.google.com with SMTP id p22so9932719edu.11;
 Fri, 15 Jan 2021 07:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1U/j+ZtYgfFfpgAROYFKnmLYCujF8T7WZdISgEWGF4o=;
 b=rMwBWqIzVt3I/l8dUwpO+TYimrJXQgUTXfMjnd3gOs6/4DDOByCFnAZ66nlO/ks2XT
 hsoRqneIpiELEUs+c+ady7xLwY76RlGSgPs5lBILFIZexFsXVNI1+5ZX54h/gLeF3nFt
 RKXhib8ZPWY++jCONbb5MOcohFKp841DWXiVLW83Wjytj53fyb7w0M6U9BAIETjmKn7L
 bjP9C/SzylWb6YSxvAzJS3/qOQInecjBe5Zr6wnyuhN7t7sbwEYlvSU7i2Ov3YIygvri
 4aYyW3Mzw3k4AUcnuTzIjiSCz0Vm6o3uPca36BQ0jcFi4/vr/dw2yb+O9ACpsVuCLMUV
 09yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1U/j+ZtYgfFfpgAROYFKnmLYCujF8T7WZdISgEWGF4o=;
 b=aaXcjKd1cZ3ZPsyuWLelz+1LN2ycJNX8chLBy4aPNqaMJN0GeM5lqf0L6kHUMnqCiI
 GgwWZbR1Wu/fr2LG35WSWfW7F9CIlOmXRNMHbRtXDiD6FiwWJbMGTnwLnIZm/gF0gB2N
 I3End4xXZFzfv2IP3pasdntELUlT8kCI0ho+FmyCCDcKfrKo9cDCCPDaY/8wEJAoMSeL
 IldAJ15sEHivBT4fFXz3KDSMVUIgY26ew/PMqKIt0nQWM8GT9pRarAh4fNZLYvHVbWkQ
 OTyMd+VVlRmWDDkUAjwFQ42xoqrQdCtRInt7a1VL/pe3947EleB4Fm1gNRyjrQrpfJUz
 7jsA==
X-Gm-Message-State: AOAM531PsA4Ub9mHnfVvjyMdIGeLk6KIWv1+aWNNLHhg11wtB9HgqvyF
 3Pc+4TeY8idvKWT1hkAdEkGFQU+eS6A=
X-Google-Smtp-Source: ABdhPJwvPNw1PpawidvPh70/KgK2odiJeatFn6FpbsJE2PuwoTR8CR61rfI2jkZfst/+1ZJzcPQxZw==
X-Received: by 2002:a50:cf02:: with SMTP id c2mr646495edk.333.1610724690193;
 Fri, 15 Jan 2021 07:31:30 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id t15sm4147361eds.38.2021.01.15.07.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:31:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 7/9] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
Date: Fri, 15 Jan 2021 16:30:47 +0100
Message-Id: <20210115153049.3353008-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most common use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it, and round it up to be multiple of 8.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210112145526.31095-5-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index c132f99ba5b..b79304d93d9 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -128,7 +128,20 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length (%d) not multiple of 8!\n",
+                      TYPE_IMX_SPI, __func__, burst);
+        burst = ROUND_UP(burst, 8);
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length rounded up to %d; this may not work.\n",
+                      TYPE_IMX_SPI, __func__, burst);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
-- 
2.26.2


