Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22DA2FB67D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:52:17 +0100 (CET)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rQe-0005RM-Oc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFP-0002yd-4L; Tue, 19 Jan 2021 08:40:39 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:45978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFL-0003UU-4o; Tue, 19 Jan 2021 08:40:38 -0500
Received: by mail-io1-xd2f.google.com with SMTP id p72so14791855iod.12;
 Tue, 19 Jan 2021 05:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G3+vtrL9NOpi9RzrlahaCTFTA/TF6kWi2FPH4n3xjHo=;
 b=YR8Ba06jIEfT2ztj4T58FvZUHEG3IbbiYcejg35UZ55YLapWjTEY3GhB7icO6n+w5R
 Kl66kf4FgfikCa4UkBjusazWcAa0oEgcv2preIwLh2UjxyWQoH7IL6snpRmOt2iU9Wgp
 pTIh5NF6bnqF39epbatGW/wxx8wRpo9Jj61N3AE8Xla+Z5BdZM4gfb4mezbiQnytCGJb
 JAHROZmeP0ru6KOwLIbss20NLsJ2y4SJDQoZe0eDoxHR+vOmBTdSB9D4SG8iJPloq9Rw
 lJpDncwvb9OLxT+D9LpQmySehtPImy46/Ogm6aV0GfhamEJk501CT19oIIo7Oj7j8zUi
 ZeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G3+vtrL9NOpi9RzrlahaCTFTA/TF6kWi2FPH4n3xjHo=;
 b=L5ZudOwPFyXGN4XBoyfUJSC8vxxLdoLO8Q92ZAwwzis1zlYT2WF6ZwhKjJhpezup/k
 wJN/lZ7m0ZIQZnbpp6i1bHr+Jtky4sqqe8025zsLgkrzwUzADcatB+585Hzl0OblNdBx
 Kml4uQSRCRd/4GJiVVyErbz+XFJf8blsoh0FHy5phUyE6YtO4P6rrw3Hd8gVJ2SAmt89
 FhQCkEXH4wFDYn7wdfVHIcgFQTXgY8aD8TKGMz4AnAGmjloRSZSskuTiMypuVNRudWRf
 qWLt+saBfr9NVID2NAPlZ4THQ++kHL6Qnl3D/tRV81KDHiowFEf2P3mPk3iccs73D6TL
 CGJg==
X-Gm-Message-State: AOAM5319XDDJHb6HFWQNGT3PxWmBZGh108E+DLsccOIaotpZdmlP7iwL
 26BG/2JmYuJvg9sJXbtRqww=
X-Google-Smtp-Source: ABdhPJxjWGMfpLngMa8A5d1m87ZoKgOMQfh/WiBa8VmDhXfhOGRFfSugxNcF7+petRlGY9by/lCFSg==
X-Received: by 2002:a02:a183:: with SMTP id n3mr3418109jah.31.1611063632614;
 Tue, 19 Jan 2021 05:40:32 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 06/10] hw/ssi: imx_spi: Rework imx_spi_write() to handle
 block disabled
Date: Tue, 19 Jan 2021 21:39:02 +0800
Message-Id: <1611063546-20278-7-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd2f.google.com
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

When the block is disabled, only the ECSPI_CONREG register can
be modified. Setting the EN bit enabled the device, clearing it
"disables the block and resets the internal logic with the
exception of the ECSPI_CONREG" register.

Ignore all other registers write except ECSPI_CONREG when the
block is disabled.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-6-f4bug@amsat.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v8:
- keep the controller disable logic in the ECSPI_CONREG case
  in imx_spi_write()

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] rework imx_spi_write() to handle block disabled

 hw/ssi/imx_spi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 277b936..23f9f9d 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -327,6 +327,14 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
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
@@ -335,10 +343,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
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
2.7.4


