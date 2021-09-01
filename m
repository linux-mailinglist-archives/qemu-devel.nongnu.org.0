Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9AA3FD1C6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 05:32:00 +0200 (CEST)
Received: from localhost ([::1]:39982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGyl-0002cx-2O
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 23:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGur-0003BD-S1; Tue, 31 Aug 2021 23:27:57 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGua-0007Ln-VW; Tue, 31 Aug 2021 23:27:57 -0400
Received: by mail-pf1-x42c.google.com with SMTP id m26so968461pff.3;
 Tue, 31 Aug 2021 20:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DnvfBbmV9W5QaBw9cjpxj3O1smfoTH7OnL+gTgkQoPM=;
 b=ExY3FnHZhAO1HlfjWHvbyrQlEXCi4N4NiX169sAGQ5e9TY0hXuMvLxgMvnQ8Bc2mEf
 kHvXY96klRE6cyUj9B+jkGzPLWoSaPw2PmYz5OZFh7lah9W5r24JKfX4pcFbkGrdYwGE
 aIKCUvnyKGR/QA2Bknb7oH+U9cVRlXOQOMZRe2igIcAHF1lLeC1OITnOzpg9a8yGwKY8
 txAamI7YuyNnUIuoX33m4zJMyO1ihhw2suq6LN3jKMCi4jnU+qX9rGkIepDG2pCJg7q1
 gDX9j1zqHYkvtX9kUNy6mwXa5+VWgUeMafi+3+sQ5GJ8Nb403878fLyTN06KcJFv1u0y
 2Qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnvfBbmV9W5QaBw9cjpxj3O1smfoTH7OnL+gTgkQoPM=;
 b=XdUEfgCu0ijg2HLcVGc8GM3ePUvh71gnCg9q7HBux+ZCqqATzTjx0sqfwrMOZXBipT
 +rFhuvPQfOzGqjnYsHttx/aRfY21H1aQU31fiXipN5NszJ60UA+lTEcyeiLra9MpqNpv
 wEeFVd5WCL5IyY63CdI/f5ofuMaK7Rfz50bL2Qe7yBsg+dIh+sYlEEyBpnXZP7zSZLd2
 vS2Om/glVFEBLJmU6oybSkeGhLQYvuCM5MpfQAEphxHr7CW/b2yAZJe1ZiAwdoxEGSnK
 7ZV68h1/ekTaVn0py1Luia9CbEOx6l+7UELNKi2aqfcbCYWmKSlL/neJOkpkGYefOOnM
 9zww==
X-Gm-Message-State: AOAM53210W2/KkFSWa0pFpEDTSDX0YiscHP7owxX9JwmiCHG2D/85OIx
 wxRvzeJicSsU31plQjdQD24=
X-Google-Smtp-Source: ABdhPJwxEwau+/yCmebBkT+0dgQOhLphqpVDZGSGrYhNidz7WthZJNIYmPKJ8Vcn77NJMZ8Doaql4g==
X-Received: by 2002:a63:3c5d:: with SMTP id i29mr29623631pgn.147.1630466858033; 
 Tue, 31 Aug 2021 20:27:38 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id g2sm7174467pfo.154.2021.08.31.20.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 20:27:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 2/5] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
Date: Wed,  1 Sep 2021 11:27:21 +0800
Message-Id: <20210901032724.23256-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901032724.23256-1-bmeng.cn@gmail.com>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


