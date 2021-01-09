Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06A2EFF80
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:38:00 +0100 (CET)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDVH-0002sL-29
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTc-0000x4-2u; Sat, 09 Jan 2021 07:36:17 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTa-0001bt-Jr; Sat, 09 Jan 2021 07:36:15 -0500
Received: by mail-pl1-x62d.google.com with SMTP id be12so7117197plb.4;
 Sat, 09 Jan 2021 04:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWiCj98t+f0mr4YmBNn3+N3Pi7U13845ZRj24tN9IZs=;
 b=FoO6lgt4wn5W9f09pIYcvEpjmr/xMyXpZ828JJDcVZdhgvxtFaRy4QT+X21Ia17oFi
 dTc/i/O9L0J+bYbv6Jbn2dq2y4bEWYC1bfdr/3X6kMrk3LPND69jmKq+cz3mwNmHxz7o
 69WJOvvy64iZiwOWnxzDfkF+7WPQlt720q4E6NeCwBotn8+VtrIOvtkV9/XLforCTR60
 iV8BXkXYW+N6qfPFBj/QIgOC2Sqy7lwR/OQi8ZfaXggB91rmZBJdZk2QQevlJiXuJszc
 eYCcTHPvJOjkNvCdTxGl5NXKEY2iddlzgQFO92UFpYdjWMMP2l3JgArTWUxGSXyfyD2g
 TFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWiCj98t+f0mr4YmBNn3+N3Pi7U13845ZRj24tN9IZs=;
 b=obm3q1MifXLL+jRtilWlFrozIljLmNteCSK4rc0XsreOrQmYrdbV5EnQ2V5ExFiEdG
 DOKiRhuWYYtRkT8FjtY7FnoApWY8f63yfw3C2kGVI6ixHqc3iXVDaJoEPRUAPmniWtwJ
 tluMrzGv5w6NbId3Soz6BO6CQo0aBxc3AmpofkZSrmt2fXZIEGFJ+SXtYPQYs4MOuzgK
 kGBkcDQrOhiT1X6ppxkuXX1nXAi44S2Iev7uVYbjmBzQkC25wpO4GqyAtxF9SYzkwBAB
 5wqUY3gMVGF3YQnAmk+5ePjQwPQvS5kpAPWHV0C0ATgOaqxyn7QFUuSp9/bqVNza0fAT
 WyRA==
X-Gm-Message-State: AOAM532OXDa22UFUw32wAFhAcwLxBIhwzMbRleYKnbeaFr6a++LLFvmB
 sLDe2xuIKwWHapgGqI7ZQ7o=
X-Google-Smtp-Source: ABdhPJzqTSVUBd0zt7PVoHbv12i3bV/Gk3oALSnWBwNZPUnwniQ1GFpYzssFajo8IyQp9IDOqc3VBw==
X-Received: by 2002:a17:902:850c:b029:da:e4a6:3641 with SMTP id
 bj12-20020a170902850cb02900dae4a63641mr11379088plb.57.1610195772812; 
 Sat, 09 Jan 2021 04:36:12 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:12 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] hw/ssi: imx_spi: Disable chip selects when controller
 is disabled
Date: Sat,  9 Jan 2021 20:35:41 +0800
Message-Id: <20210109123545.12001-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
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

---

Changes in v3:
- Move the chip selects disable out of imx_spi_reset()

Changes in v2:
- Fix the "Fixes" tag in the commit message

 hw/ssi/imx_spi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a21..8d429e703f 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -353,6 +353,11 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         if (!imx_spi_is_enabled(s)) {
             /* device is disabled, so this is a reset */
             imx_spi_reset(DEVICE(s));
+
+            for (int i = 0; i < ECSPI_NUM_CS; i++) {
+                qemu_set_irq(s->cs_lines[i], 1);
+            }
+
             return;
         }
 
-- 
2.25.1


