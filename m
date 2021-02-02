Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3130C91B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:11:47 +0100 (CET)
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l709S-0004y3-Iq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zty-0005RQ-3T
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:46 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztk-0002GS-Ud
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id w4so2004492wmi.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2V568PL2qXyaAlMgVECYYwMlR3/oUNu8WmElQPIxI9E=;
 b=E7i9GxJn/Ywjvkreu+2pWIG50oQcWCmyOX+myGU6rVymTpFbqSIWg1uaHO/dG7FnWB
 aqlqV8YNN9r2cMrG0iIhuGNATa4TKtNqxSLxNKz36QArW8GlxFPvvGMRUDHF9/AUdgRX
 7nfvDi0dGmi+At5FvSfmrENm3vy9SVgEXZMioJrnt9HcLE24Kg2NqCzde6DMOXKzIow9
 sfWAqs1y31TjMqw5sunf3IfDebVVRNwtlvfKLGjZHbOy31h0RDWjjBeh8GuNzUH/mlVG
 m6Ua8mFD/DCzlBg7HUIfMsq2Q1o25STo+uPRM12GsMJrBw3SU8gK28hqw9L0m6qCS1gy
 LmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2V568PL2qXyaAlMgVECYYwMlR3/oUNu8WmElQPIxI9E=;
 b=Yn6MTbiVWoA+ZN9heYMeZWw2LfDaJVpKXhn81tJMkzX9CH6tddGqOvpyLAF2pZ2O/i
 +IP4Msb1OPzZVZ4X+XB7Bqn0KaB4BUsZZnNsakhmQU7/5zg7EUamgkiMQ7Ln1UlpMYXZ
 HC4oeQFwKYlWDt7szUpQ8ILEFtVnGyXg2JYo0LWvqOz94V4IJZE8bEJu903hX5dIqXCm
 eJwCzl6GVg+F5/WYIlM2/9Y03H8D2SwFo/sqwhZTpDB83ua+2o9IcLnV8AzCow0dh6gy
 lNVuW+wVIXKNcdgTia19ggV30XXNC4Aasjxnv6XistShkTcUM/W7ePHPyrBvSlhhnHsy
 gQGw==
X-Gm-Message-State: AOAM533UdG4ExozG9ejCFSCBJNazdFtYOWWg9merN/cF2zH1iuMszzXU
 AnD1wkrco121i/vi5j1J6tVT65Odz0uTDA==
X-Google-Smtp-Source: ABdhPJwzj1YTDPrzvD/Gf34vLiUFmtmLuCpJ7OB7C9tTzZTGnMb+zFK3+btSUsD9+q9xpnHQjV7eOw==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr4616900wmq.142.1612288528630; 
 Tue, 02 Feb 2021 09:55:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] hw/ssi: imx_spi: Rework imx_spi_read() to handle block
 disabled
Date: Tue,  2 Feb 2021 17:55:05 +0000
Message-Id: <20210202175517.28729-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

When the block is disabled, it stay it is 'internal reset logic'
(internal clocks are gated off). Reading any register returns
its reset value. Only update this value if the device is enabled.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-id: 20210129132323.30946-6-bmeng.cn@gmail.com
Message-Id: <20210115153049.3353008-5-f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 60 +++++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e85be6ae607..21e2c9dea3e 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -279,42 +279,40 @@ static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
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
2.20.1


