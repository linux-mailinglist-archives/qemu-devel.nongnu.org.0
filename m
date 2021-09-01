Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6E3FD9E0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:57:04 +0200 (CEST)
Received: from localhost ([::1]:37898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPnb-0007q3-Rv
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcX-0003AV-Ly; Wed, 01 Sep 2021 08:45:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcW-0003Yz-9G; Wed, 01 Sep 2021 08:45:37 -0400
Received: by mail-pg1-x52e.google.com with SMTP id k24so2640252pgh.8;
 Wed, 01 Sep 2021 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DnvfBbmV9W5QaBw9cjpxj3O1smfoTH7OnL+gTgkQoPM=;
 b=PrXqoLkmgqlYKDP1yselvjxX21JW2Feqa0TQbp0UW15DoRC6UHK/Hk101BYO/Yit6j
 7gPdgMWGglTINLL41sSA5Q7v0opuqWAsQ/9hDY/Ho6YLtU+jDGwq79x4tS2BpDdyIxVw
 ccqYvCfmf0zNbT7c60bAhOj+7OPsvRmc/sGx/+luw9so5IFTkq7ZoQEVDzyH2X9BQW9g
 I39EEAO7qPUgqAZ1ejHokptJ/04jhZfFh2t6LEZLPcjcS4mwqxXwXQz3IgGXF0tcJM9v
 Higyl8IylrOI4rucNOBuiF+D9P5DgyjXGAjrYioqOxkkmnWNbDZpc/RXJDfHX4QNW3k+
 CF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnvfBbmV9W5QaBw9cjpxj3O1smfoTH7OnL+gTgkQoPM=;
 b=LdF2XqYJEbAVfGouGFSD5j1/bZE857XEx36vsw6DWNBCo3FWFMFE+/9TfpDwexZ+HL
 HnFX2qHWe62Xhd4TvkNyW4Fb5zUqdlciApqEci6RATqMiNP2FGHvh4tw3nRP0Pj03oJ6
 q3HxAHSUXOaaCZsEiJBN4RvgSkZXaRAXUWrdEOOAIb6afRJbU+yjbNAlxHSRuQ9HrXDe
 eWmfWkt/HAgccRWQuGVYO5KwE+XZ6msGdSQ0rVlAZSDiFIseCY10lqr7y0v8jWjb6fCU
 NZX2NLHVInvYEHN7iGE/wwFnFSR+jxW7F7neISaExWOxgsOP0VixGEuU+gT3FHW5eKle
 +Sxw==
X-Gm-Message-State: AOAM530kChZyJiR1bNHnQLhwuuElnRDQv4dt+3cC5ChB4gnF7sSJMKDk
 EXZ4gQcLi/aLVx2ZayLpod8=
X-Google-Smtp-Source: ABdhPJwi9mhCAN2pytFo3zDVDlBzAlWwSjeJ5GbszmrM99eZj6apgvQwlbfEePMa8wotoNNZJA27ZQ==
X-Received: by 2002:aa7:9086:0:b029:39b:6377:17c1 with SMTP id
 i6-20020aa790860000b029039b637717c1mr33987450pfa.11.1630500334785; 
 Wed, 01 Sep 2021 05:45:34 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d22sm20917134pfq.158.2021.09.01.05.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:45:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 2/6] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
Date: Wed,  1 Sep 2021 20:45:17 +0800
Message-Id: <20210901124521.30599-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901124521.30599-1-bmeng.cn@gmail.com>
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At present when input clock is disabled, any character transmitted
to tx fifo can still show on the serial line, which is wrong.

Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/char/cadence_uart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index b4b5e8a3ee..154be34992 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
 static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
                                int size)
 {
+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return;
+    }
+
     if ((s->r[R_CR] & UART_CR_TX_DIS) || !(s->r[R_CR] & UART_CR_TX_EN)) {
         return;
     }
-- 
2.25.1


