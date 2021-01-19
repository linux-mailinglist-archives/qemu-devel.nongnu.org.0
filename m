Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D12FB67A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:49:24 +0100 (CET)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rNr-0002dN-QM
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFN-0002sm-GG; Tue, 19 Jan 2021 08:40:37 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFJ-0003UA-Su; Tue, 19 Jan 2021 08:40:37 -0500
Received: by mail-io1-xd2c.google.com with SMTP id u17so39614773iow.1;
 Tue, 19 Jan 2021 05:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGjLBdXEirecxcEY2UAZYu8cwlhOHSgOGxMxIwxYN+o=;
 b=I+nBbn2pBdNV20+c7iLT5QKyk9DcstTflI66BrJW0TQzTPjFNOgz3T2xj/SxRjgtiS
 ERGtvNBXByMSK9hm4QvnerPTJhHabFLb9c0Y02iMJn2UUbJug1n3XbBkfHg6uvtrIo56
 GyISSr6WuHzuLmHPnN7RhePEhP2gAx5iBfydKslI/5uWFyPC2xSz29TaJghNJk/vDKxH
 MUTKTkKKZAmR0JOMeiGPwAsjHbf7i+VPoXpVWW/dgg3KqpotlCP8u/01g0SyfOB113la
 bihCwfZDrAU2uTgNFDDKQmRUc4rRYwd7pCiJVj/05QC9cHOxddG/NaSXm+7NaPIX7sZ7
 g9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGjLBdXEirecxcEY2UAZYu8cwlhOHSgOGxMxIwxYN+o=;
 b=WOu3dHyGMk4EfVw9Bn9TRYa8PDwc5kkOrORF37u/J1I0y5Tx96QqsKTmZdu56XV8/n
 O2xaK6Prqnsjsq6O4lqjRfDakdVJdAdTtHUb80xmdXJq6MXFpgrM2piIg+JGZo6JyEWB
 4XLdTQs87Y1iD9Xe17OwPxbA8SmHbOu8rTFmDUGfeV8ngV5H4FR5V1J6YcmyMjiikmhm
 UbCADj3uixaOZLLzR6ULDMbNO9m+rKW8CxcCV/FTkmTzY7DQGSo/LGzTE36zSenLwJyr
 TFndJzejo2f+J8utz2waGEivAdqtax9Ki9YoiGPEb7TUNR78KgSDp3iCmvrK/lUdNNsS
 05bA==
X-Gm-Message-State: AOAM530V394VC2S3j63gfGOSrm5lJ26E1sMvW74NznG0g9Xfsmjoxrrg
 FALAYE0iu6Wo1ID4GIiIDUY=
X-Google-Smtp-Source: ABdhPJyd8lOM0UDQNwS3gbS3zs8S3gSmmW/8arGBf7ubWzwiaSqizg2ZmV4s7toBOKA2L0oJaIyCfA==
X-Received: by 2002:a02:b78e:: with SMTP id f14mr3376535jam.97.1611063629205; 
 Tue, 19 Jan 2021 05:40:29 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:28 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 05/10] hw/ssi: imx_spi: Rework imx_spi_read() to handle
 block disabled
Date: Tue, 19 Jan 2021 21:39:01 +0800
Message-Id: <1611063546-20278-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd2c.google.com
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

When the block is disabled, it stay it is 'internal reset logic'
(internal clocks are gated off). Reading any register returns
its reset value. Only update this value if the device is enabled.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-5-f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v7)

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] rework imx_spi_read() to handle block disabled

 hw/ssi/imx_spi.c | 60 +++++++++++++++++++++++++++-----------------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index c952a3d..277b936 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -274,42 +274,40 @@ static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
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
-        }
-
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
 
-        /* Reading from MSGDATA gives 0 */
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
+        }
 
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
2.7.4


