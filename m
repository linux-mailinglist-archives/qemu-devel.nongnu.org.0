Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFF22FB678
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:47:19 +0100 (CET)
Received: from localhost ([::1]:46364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rLq-0008PA-41
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFO-0002xo-Sk; Tue, 19 Jan 2021 08:40:38 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFN-0003VG-7S; Tue, 19 Jan 2021 08:40:38 -0500
Received: by mail-io1-xd2f.google.com with SMTP id d13so36317291ioy.4;
 Tue, 19 Jan 2021 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RGy8xtddkf/Hto4xoWIa8XeOj/4qpPYA/syTc95gqg=;
 b=K2GDJ+5tCgk1p4oz1whw/ZDacMlkuUBqH8Z6zP6UmQhk0QRpiOb21oFGchagmNZYwv
 9l5YE/Qp9GuBATYWzCnuW9JaUvXo49DE+EDR6exklbxiwSddP67HNTsUExTOxtwkhwSb
 juX25InKpQxPqdSF5jalMcnzBFy08RbfOAib+XIUMIk5rsnMprp/9JylUCkPsQGHtzZS
 QRtRQypdwAE6ktTZ6LRxxEC19KoDj2FR6DLMWzcwDwySP6ZES/Mr3gb84CBeJEaPfXan
 5yJdTG28WM9mTxCDq4TjrfMDjxJWXoQgomDodvk8Kucsh0KpHNGjOYuf2nUBS6lTVe/T
 GP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RGy8xtddkf/Hto4xoWIa8XeOj/4qpPYA/syTc95gqg=;
 b=KCYX/0uSfwGtxn4K/pKfE4Ez28Dp9ekCY7qUXf4KvtYEsZH2pBesdHvUT2ZU9y7F5l
 S6mKGfvu+/eoAS2hdqEsHa0+Q8xfEw005vVbk2PkuQrPu0PcEnMFFLVF9qzvZ6Z9Jjo4
 gjvteGQi0nMTjrekdVdBBvtwK3mgPprOFYbyOOZ8SYBc/NU7GNM0oRSrNh37MAQVek+C
 3WEzoqcB8yvBk24p0X1bf5wuylj0iS68eEQlKWupS7ExKWarEWygCWmAFNQ11ZlzYTEk
 CdeXIadOCIKll8Bo0Harc3L28exME2nu8CWFLbNMpB+P5ad0PGiGHNe698ZAlwDuw9TL
 GPDA==
X-Gm-Message-State: AOAM532NXrOCQC+xfWQaNWKON05OpvS7ZdsldHHCiiGHTGjQjmCTKPma
 GftAlyhV/6Rw8OcPbgM08NA=
X-Google-Smtp-Source: ABdhPJy3Ux6p2NP5QBZNpMdeFFm+tETzDN9JrFtzjUcowAi94is/DiKgqU+fITJ+mZvop/Ce3xlFjQ==
X-Received: by 2002:a05:6638:214a:: with SMTP id
 z10mr3500247jaj.41.1611063635884; 
 Tue, 19 Jan 2021 05:40:35 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 07/10] hw/ssi: imx_spi: Disable chip selects when
 controller is disabled
Date: Tue, 19 Jan 2021 21:39:03 +0800
Message-Id: <1611063546-20278-8-git-send-email-bmeng.cn@gmail.com>
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, but chip select
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

(no changes since v3)

Changes in v3:
- Move the chip selects disable out of imx_spi_reset()

Changes in v2:
- Fix the "Fixes" tag in the commit message

 hw/ssi/imx_spi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 23f9f9d..5838bb0 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -257,9 +257,15 @@ static void imx_spi_reset(DeviceState *dev)
 
 static void imx_spi_soft_reset(IMXSPIState *s)
 {
+    int i;
+
     imx_spi_reset(DEVICE(s));
 
     imx_spi_update_irq(s);
+
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
 }
 
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.7.4


