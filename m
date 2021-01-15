Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040EA2F7FBB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:38:18 +0100 (CET)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RB2-0005uV-VI
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4J-0005px-3H; Fri, 15 Jan 2021 10:31:20 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4H-00015w-7f; Fri, 15 Jan 2021 10:31:18 -0500
Received: by mail-ed1-x530.google.com with SMTP id r5so9918587eda.12;
 Fri, 15 Jan 2021 07:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xaRka/hjNrCEM8MOc6Ojwmtdv4ln3LXGXICzD6KNu+w=;
 b=akQZ1cNzBHC6RT1phVrotIUQdcMJNnHFhcCoTMLOJ4hzoaMy/wkdmCoK7sBc+PeCdg
 VvsyZQShYUAiQKsgF4NG7ZJamEQ4fqI1CTk+nAO2hItPncA1KHmf8sWNSjUhNoSNceap
 yj5PgoyOW2QIbIVtWXIm3ReViebPtPri9ZV/VVecXicoxfJIagqCDFx9ya+/cFdTqtqB
 cQhEZj0NZjX/v64uwTaPfwqD98dldbtQI1Tp6o3wu3g7QiSKl0QOSVKCT89bMyPKj498
 nFHKahVcrHz5OwQIP2TaVJoViD9N1jvTiSAnCpvEEcA6G1i1N3GoYdIZfaFPI5Iznj8z
 9e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xaRka/hjNrCEM8MOc6Ojwmtdv4ln3LXGXICzD6KNu+w=;
 b=qm0/n1sX+WFOA9FJX11Sl3n8NDQ6qTmS1ueveGAuqDdxq8K3UA3C5lDF4zjQUn0xxd
 1nTgO8fDcYi+dyGJM8rHDBdVhQ8j43cKFVpWaWbvHlArqrvvWyp21vnyDW5xpcpH6cnk
 vW/PxM0zDJ3Y/+hp9uaMdo/CzuJQAVaaseP+RgvYZCCpUXd7lDRpXtQYxTE8bzv21q58
 8b6Nf+9bQauCrg7JlJxJJUoDGCj30dd8ueRr0zkjrBUlz4SGx4CPRtj6r1t2+YR8kkN+
 j72GoWGxbvwoFmeyEOxZ8gBf74lxZV+mksrszlhoKPq803Gfphmx9DGQy1FoB6NVAKmM
 zTeg==
X-Gm-Message-State: AOAM530obG/M0unyio4AegnOQbENYCF2WDdqZM1/CJP2iY1u0Zy1xPbV
 1esKbmBSTISMB9/FW0NC2/CDQn6htVY=
X-Google-Smtp-Source: ABdhPJxLOhS1el156e/Sn/ZRkIPL9pLiKbbdEmQ1sxu0hWilZ5vH3VlKDgLkZOEh9mrt1nm329OoGQ==
X-Received: by 2002:a05:6402:2207:: with SMTP id
 cq7mr6445345edb.272.1610724673877; 
 Fri, 15 Jan 2021 07:31:13 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u9sm1113506ejc.57.2021.01.15.07.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:31:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 4/9] hw/ssi: imx_spi: Rework imx_spi_read() to handle block
 disabled
Date: Fri, 15 Jan 2021 16:30:44 +0100
Message-Id: <20210115153049.3353008-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
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
 Juan Quintela <quintela@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the block is disabled, it stay it is 'internal reset logic'
(internal clocks are gated off). Reading any register returns
its reset value. Only update this value if the device is enabled.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 60 +++++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 78b19c2eb91..ba7d3438d87 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -269,42 +269,40 @@ static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     }
 
-    switch (index) {
-    case ECSPI_RXDATA:
-        if (!imx_spi_is_enabled(s)) {
-            value = 0;
-        } else if (fifo32_is_empty(&s->rx_fifo)) {
-            /* value is undefined */
-            value = 0xdeadbeef;
-        } else {
-            /* read from the RX FIFO */
-            value = fifo32_pop(&s->rx_fifo);
+    value = s->regs[index];
+
+    if (imx_spi_is_enabled(s)) {
+        switch (index) {
+        case ECSPI_RXDATA:
+            if (fifo32_is_empty(&s->rx_fifo)) {
+                /* value is undefined */
+                value = 0xdeadbeef;
+            } else {
+                /* read from the RX FIFO */
+                value = fifo32_pop(&s->rx_fifo);
+            }
+            break;
+        case ECSPI_TXDATA:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "[%s]%s: Trying to read from TX FIFO\n",
+                          TYPE_IMX_SPI, __func__);
+
+            /* Reading from TXDATA gives 0 */
+            break;
+        case ECSPI_MSGDATA:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "[%s]%s: Trying to read from MSG FIFO\n",
+                          TYPE_IMX_SPI, __func__);
+            /* Reading from MSGDATA gives 0 */
+            break;
+        default:
+            break;
         }
 
-        break;
-    case ECSPI_TXDATA:
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Trying to read from TX FIFO\n",
-                      TYPE_IMX_SPI, __func__);
-
-        /* Reading from TXDATA gives 0 */
-
-        break;
-    case ECSPI_MSGDATA:
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Trying to read from MSG FIFO\n",
-                      TYPE_IMX_SPI, __func__);
-
-        /* Reading from MSGDATA gives 0 */
-
-        break;
-    default:
-        value = s->regs[index];
-        break;
+        imx_spi_update_irq(s);
     }
-
     DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx_spi_reg_name(index), value);
 
-    imx_spi_update_irq(s);
-
     return (uint64_t)value;
 }
 
-- 
2.26.2


