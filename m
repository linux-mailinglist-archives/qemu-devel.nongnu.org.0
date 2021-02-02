Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A160A30C97D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:20:07 +0100 (CET)
Received: from localhost ([::1]:39722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70HW-0007Mh-Mk
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu2-0005dp-SX
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:50 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztw-0002Ga-Bk
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:50 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v15so21461742wrx.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AVvdEWVj2Xg9ArX8nfMN+uOJ7a4G57lHSczBDznXp9I=;
 b=kmZux+o65R7W3jp/WuoC/i8kCIhEGMQ+MZYcEq+e99KZew7w0JyBqfYTXg7eQQRZai
 0UDKgkElckWTqxz8dAwcuQia9yeQhIGmPr+ICRl6O7PDCWTpD/aiLpiys8L+iwUdb8+A
 Y1kIVois7XuBQT6tYdZpja8tVd9LI+Q3dzyN5OP/DS5Gj+IrhmxdbO6mV06totfmwnxz
 l2yvIXKXMuJ/KaXa5w406Krpvk14qaZPraTb6C2VgPx3tgSRR1+HF+eRJ/vY9y/oafVl
 pbF576s5nDiKzNM7VAV3yzcSjfokkiGKX1beQVf/4GlGj9DmhXjtM9iLfILK2YI0VcHE
 vxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AVvdEWVj2Xg9ArX8nfMN+uOJ7a4G57lHSczBDznXp9I=;
 b=tm81VzRMu8lZHUQwGW7aq+GbCbSXyADhJMbflJ0wU2zK46dd7FB/RzhetgSqqKUiwe
 IqL+sylXjWCIg3riSYk3exOKmxjiLuKlZCa8TBJkpA99X0IkZ1Ko4nuhz+dR5Xz3YmBD
 jjpHKVWA1iQ5qZJ7YIOfyN1YKk+Mgr/oDlhNTb56mBAHY3U+Qxv+0XBy2HW6qA9iqdiV
 UiZgEIrmomPwnovodRp1PFuAbT6jsGML99ITHXPb7fIe7Y8NqGL6WhLgtPXIP3TNBT28
 neRmwhdE1ncTWMs+cG0zA6T83FYl5r3UT0wcaLAT02sINwBIEXyaeud7YvHX58jmAwW+
 Fk8Q==
X-Gm-Message-State: AOAM531lweiVR4neKOfG3j6Eypd27fwcRhUEIEpUVU2bPE4igflOVzPj
 F9TtV2M248JFuYAGiu7W3TAhP5jBXhvM+A==
X-Google-Smtp-Source: ABdhPJwZUZ1UDVSAMpa37bq052l4HvOvkUKTUx13DR7eeFAi2CgF6frgUuHX6AqVMcXeDW9l3J7etQ==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr24956118wrq.49.1612288529457; 
 Tue, 02 Feb 2021 09:55:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] hw/ssi: imx_spi: Rework imx_spi_write() to handle block
 disabled
Date: Tue,  2 Feb 2021 17:55:06 +0000
Message-Id: <20210202175517.28729-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

When the block is disabled, only the ECSPI_CONREG register can
be modified. Setting the EN bit enabled the device, clearing it
"disables the block and resets the internal logic with the
exception of the ECSPI_CONREG" register.

Ignore all other registers write except ECSPI_CONREG when the
block is disabled.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210129132323.30946-7-bmeng.cn@gmail.com
Message-Id: <20210115153049.3353008-6-f4bug@amsat.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 21e2c9dea3e..4cfbb73e35e 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -332,6 +332,14 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_spi_reg_name(index),
             (uint32_t)value);
 
+    if (!imx_spi_is_enabled(s)) {
+        /* Block is disabled */
+        if (index != ECSPI_CONREG) {
+            /* Ignore access */
+            return;
+        }
+    }
+
     change_mask = s->regs[index] ^ value;
 
     switch (index) {
@@ -340,10 +348,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
                       TYPE_IMX_SPI, __func__);
         break;
     case ECSPI_TXDATA:
-        if (!imx_spi_is_enabled(s)) {
-            /* Ignore writes if device is disabled */
-            break;
-        } else if (fifo32_is_full(&s->tx_fifo)) {
+        if (fifo32_is_full(&s->tx_fifo)) {
             /* Ignore writes if queue is full */
             break;
         }
-- 
2.20.1


