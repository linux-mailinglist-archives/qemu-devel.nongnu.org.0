Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC1F30C905
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:09:15 +0100 (CET)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7070-00028r-T6
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zty-0005SZ-Eq
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:46 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztk-0002GO-Ub
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:46 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z6so21371052wrq.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=27Rh1jJu3IIjx0wRzmqZIBv/kPP940w8NfRpD/N/7g8=;
 b=PgGUeMS2ZoNbpF5CSKdE/Bk6miR+qDCaGIfNYI3UZq5PSdQciu6NQniR2+xkItRgra
 2pJwnupch/8PldOiwTL9zDldUjU+qcWFkBvI3wLksXYH7ebSfESpFcMWCErFXaX6PECv
 7Wvi/hjdKaeNJtjzu6y/OVvDuIUcJ69LpGXGBtegpTjM2iJyBV1qi9tHpZNzPwI2+/md
 dhksumrqq1atU/nu6Stb4KWkuHcfYLoETdFO1RT/9stiGqANOU2NOieEHPhiAI+r1jsL
 RinXAhso7E/gHyaX1n5moezT9L3OD/x8Da0zVbbj273uoUQwtKw8JlFAcuFJdChowdx0
 TNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=27Rh1jJu3IIjx0wRzmqZIBv/kPP940w8NfRpD/N/7g8=;
 b=XC5W4dpVdtIHsnTcw3yPvrmU1ec3T3QyNZcjZu1IqGvCLLlNfJjx4Rkfwhjscy+0Gi
 REQcrDhpd1cvjy8EJglA0rAZF0307sDn8kOTMbq4FRg5x3Bbhy3VrtBDJZxUa1HJgJ26
 4a67uqkcc4pgTkPNpDFOvK88OcgCGfCche6v2f6Vgp+2cVnzXbYKYaZnS9UUBtxhrYES
 a/wqZ+c4ZQBiZznAL4Vv2R7D0z9U2AdENBH+SNRUksK8N4lWKBVdavgUMK75Pt9ljlI8
 Dqv3VCuqfNQFKzcdctrkWM6WW6+8tVrSUQ0Uxt0bzHfHUd88ssRAB+e+HvBZCOtolybb
 Pxmw==
X-Gm-Message-State: AOAM531GzPt5ZhDAZV6LWi3hq9hUb5b73IsdGx7XtnrXo49AT8fynZbV
 L9kpr1rxGxUpmGZSxApf/PCGGzQDyX7JNg==
X-Google-Smtp-Source: ABdhPJy4raWghb0Lfl/9VnRhkx0HLTY6H4MLT2GJmZnzn0Y6ww36amFcNfrEmnqkevpm8CIBuXgXlw==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr25173344wrs.194.1612288527775; 
 Tue, 02 Feb 2021 09:55:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/21] hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG
 register value
Date: Tue,  2 Feb 2021 17:55:04 +0000
Message-Id: <20210202175517.28729-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When the block is disabled, all registers are reset with the
exception of the ECSPI_CONREG. It is initialized to zero
when the instance is created.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210129132323.30946-5-bmeng.cn@gmail.com
[bmeng: add a 'common_reset' function that does most of reset operation]
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 8fb3c9b6d1b..e85be6ae607 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -228,15 +228,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
             fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
 }
 
-static void imx_spi_reset(DeviceState *dev)
+static void imx_spi_common_reset(IMXSPIState *s)
 {
-    IMXSPIState *s = IMX_SPI(dev);
+    int i;
 
-    DPRINTF("\n");
-
-    memset(s->regs, 0, sizeof(s->regs));
-
-    s->regs[ECSPI_STATREG] = 0x00000003;
+    for (i = 0; i < ARRAY_SIZE(s->regs); i++) {
+        switch (i) {
+        case ECSPI_CONREG:
+            /* CONREG is not updated on soft reset */
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
@@ -246,11 +254,19 @@ static void imx_spi_reset(DeviceState *dev)
 
 static void imx_spi_soft_reset(IMXSPIState *s)
 {
-    imx_spi_reset(DEVICE(s));
+    imx_spi_common_reset(s);
 
     imx_spi_update_irq(s);
 }
 
+static void imx_spi_reset(DeviceState *dev)
+{
+    IMXSPIState *s = IMX_SPI(dev);
+
+    imx_spi_common_reset(s);
+    s->regs[ECSPI_CONREG] = 0;
+}
+
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t value = 0;
-- 
2.20.1


