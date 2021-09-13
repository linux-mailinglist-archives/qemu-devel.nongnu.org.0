Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E84098CC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:19:47 +0200 (CEST)
Received: from localhost ([::1]:39200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPogM-0001fq-2v
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYi-0000gW-Bk
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:52 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYf-00081S-9m
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id d6so15533926wrc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J7sx/pfcVZeyLsLv5/mylb1QdFq8uLf4QtPs01EY7aA=;
 b=YaYXQFrABiy6zeVWo1y+evDuasE+crRswwRUg8e0PnfQYxzImmbCC+YzG4x9WFnTwG
 rmuYXhulYa5Syo/bMK7anLsJF2Vjf01AU4p4P3gjXg5Jd4RgoSxjQDNAzGcLR1Oo5VvX
 zFMIVB521TuqIItRUUPjsShFCEhG4M/KA3S8efqVIK1YObCZfHDu+yu/7i+4+x/DHb8/
 2kNHRVRsN02ardVTbe86XhktbVu04Zt5hi+MqFj349U/7OoWa/8Gu+gGwnfSCPiO5p31
 CT7uqEZsgE2d5eRcWYYJ1prbtI9iJ7u1mWGgykyASMD4cwx9xpCgcWU2RxFyfnrTdseM
 9W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7sx/pfcVZeyLsLv5/mylb1QdFq8uLf4QtPs01EY7aA=;
 b=FCtQ/q5rB3LnH47uft83baDAU8l4/Ta6Twus9mCfiRNX/7LSKEYmYA6cie6LDzSjsq
 9EF69rQI5uEPfEjRskn5zRG7frNC+Vt29gNFcFdR5sryFzSPvw9VRAQ8b0KrPz88+u7p
 PhkQpr7mj8mO5ZVjHoIxT02aFhu/VRqFxpQLFV86K/BC5L+vLvxPpoE4EknOGPnV2Kih
 0Es2HKtFzbXFzqkKctwPIN14VQglupdq2pTxj3ro6yzV0jjVmkNRsRK+QGS7erdNbtZx
 yz2AmtGaEQaBrxc/zgPf2aHNWTEbLTmJj3SWkEH//o/H13I6RSGoE0dmlwWWnP8i4uuT
 TrrQ==
X-Gm-Message-State: AOAM53248W0Nu/S0AImLe6uT1jOoWhOfEPujOZqT8CZOItVcQrCMdTO7
 3rnWAlEIX/aWDdq4ns2Mxuef/QdqUhjSlA==
X-Google-Smtp-Source: ABdhPJxN14G0ilRsqKpGLdOOrO/w3esfwUwOylU5wJgvwbb3zPcsemhybXf759RB7IpS9qa9Ispqkg==
X-Received: by 2002:adf:ed82:: with SMTP id c2mr5798063wro.203.1631549507970; 
 Mon, 13 Sep 2021 09:11:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/23] hw/char: cadence_uart: Disable transmit when input clock
 is disabled
Date: Mon, 13 Sep 2021 17:11:23 +0100
Message-Id: <20210913161144.12347-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Bin Meng <bmeng.cn@gmail.com>

At present when input clock is disabled, any character transmitted
to tx fifo can still show on the serial line, which is wrong.

Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20210901124521.30599-3-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/cadence_uart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index b4b5e8a3ee0..154be34992b 100644
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
2.20.1


