Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5A2F394D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:00:36 +0100 (CET)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOuA-00089W-OM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWi-0001kJ-3C; Tue, 12 Jan 2021 13:36:20 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWg-0007TJ-EO; Tue, 12 Jan 2021 13:36:19 -0500
Received: by mail-ed1-x52a.google.com with SMTP id cm17so3471897edb.4;
 Tue, 12 Jan 2021 10:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s5mgKFMjtxL8UOIPFrajTKd7ASiN1mJ6g35FLNPKpAg=;
 b=APEjyaBzm/Du1d/Ys5l2VuIvlSxTisLqbzBMDlXcYC/JYhgqGXvmketuAr9kV2yaK+
 LUCSHVoMmdD8itt2tRm0Ws9w6PUvVszR6gFABsvuhAZ0NV3YJeK0VOKkwRA/YAQpInAn
 L8EgFn10Q7FP1TJzVIfU+j7OWy7k1IJF97B9sQOCSoCPDBDGQ7UuTHuky7avtHvEnI4J
 ZfvV/2Xk21tvefzXWJ3fI3Q5LJInvAs/h4z3x8Ii3XIQyuFcWA+05V0PI8HSzbROcTFu
 z7lo7G+7KNY6aiEM18l3OnvtU8gcX+Jth4Q8olBJvjMfWPsMavzd+t1nm6V2+sl8bq48
 JW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s5mgKFMjtxL8UOIPFrajTKd7ASiN1mJ6g35FLNPKpAg=;
 b=TDYbyQZCUVYLtv3LEBv4git8Stw9pQf8KwD11tuz6fPtX/XwGsuzyR4CZD+NdLvYzI
 O9reD7s4KJEus9gTh5MshlvbTm4AjPAdw9ukWAWqLSjpwIQcx2ZbXG1/wL09oXurPsWr
 pR8KeI4BhVZGbPjo19KNOvFVl/CHA1qW3UWGFym4VYHlOy6ThzSUYB8tglQUIUTLr9YU
 OipU5HaB2V6kYSoMpCOXtVt1P0+Rc3sjUTAXPu6LrJnVjRPMj79wphVJ2O1hQDm7t6AT
 E/FSXIpXJatSGFN/Fs4nWGzt6xhAtZGikN99c1LuGMFC3FsC4aUt9npX2jmhKLU0FzLS
 tmIg==
X-Gm-Message-State: AOAM530ix4UnBaRnVyA/ES4IT11Y04yrKmD1oobCTQGYrpJWx/tE5r4y
 MZ0PSXLbak5ph0MohT8HNRI=
X-Google-Smtp-Source: ABdhPJwkjhG+m1UD4DrA6ECTXBpnxlTrl3X3ceYmb4EKbWvuQJLDMsFTmrgQEqnuto2LXLKicYFZ5w==
X-Received: by 2002:a50:d80c:: with SMTP id o12mr364538edj.338.1610476576862; 
 Tue, 12 Jan 2021 10:36:16 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id j9sm1801373eds.66.2021.01.12.10.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 06/11] hw/ssi: imx_spi: Rework imx_spi_read() to handle
 block disabled
Date: Tue, 12 Jan 2021 19:35:24 +0100
Message-Id: <20210112183529.2011863-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Alistair Francis <alistair@alistair23.me>,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 60 +++++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 96aecc8fa28..7ac9da0f1d2 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -270,42 +270,40 @@ static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
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
     trace_imx_spi_read(index, imx_spi_reg_name(index), value);
 
-    imx_spi_update_irq(s);
-
     return (uint64_t)value;
 }
 
-- 
2.26.2


