Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF693F435B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 04:12:41 +0200 (CEST)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHzS5-0001Hi-11
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 22:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzO1-0004L1-SQ; Sun, 22 Aug 2021 22:08:29 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzO0-0005sI-EG; Sun, 22 Aug 2021 22:08:29 -0400
Received: by mail-pg1-x52d.google.com with SMTP id c17so15238514pgc.0;
 Sun, 22 Aug 2021 19:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oKc66ttHB9slCrTYhnV9lkrcgvTcl8unFAGn2ufnt3E=;
 b=nBUL9HtH1vd2z4jqXFxXyri7pfmzk28CGhANrUhhLhkCW1QepWH4DxEo0dZ2i8MCQK
 dlpEjWWN2q8u57/GIe8tho3hJDKWBnvgr+sBp4RejhmUPWJSda4A35ciIBFb+LBQmgjM
 L4R5l4p5GdYunn4CzU+wHS5ZzaU1mu2QYSXpxKODrmJVL+tejsR/SIPXa7NctZpZ3LEh
 ln0QFQP5+3zN9ZKWX3xdjO8bsk6s8jbzrkk+ZnWxzm0kOvvRLLk1GM6rttkegOm6xS5y
 0pAD4aXfg3Nh2QFfFKIe63bgwoTj0q774m90HKwf1qM3EFpN9VJv8kZbYi8Bm0BAdYJx
 FRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oKc66ttHB9slCrTYhnV9lkrcgvTcl8unFAGn2ufnt3E=;
 b=MlpkZFmUYZ1QULWYwSsa3CKBJRn+e7P4TY0X/uCNIz1iFa1TMufcnWUJ480ak4YerR
 4gacF+IDVrqGjcZqXEs7ph7gTwchImu0Pne8Wbi0+jxI4riJU9raZk8H1v/zQbd2npKG
 nf56YqfFPnEzgUPIwxbcXPNFq/RdrzWI0GH02mupF0zZMCEJiZTxpxRWGGh14mbvyh2g
 p6o+5BA2JyNkzvSty+8bHb8n1galutz1R1QEgQ8pSyA+2UEEkbrCkp0fJjjlxdhFOD56
 zpIzcKuxLz8HdupvkPZBUVxbFlceKoFgH4XkFCvV550THuEF42lDnKClh+/f/ZfeE1mi
 A9yw==
X-Gm-Message-State: AOAM531Q7OsB6Siea9fC7TN90b65AzdQdLyZz3UdH6Ej78ryw/uXjB7b
 AzpNc+Ea+lH8wq9PSdWYnZQ=
X-Google-Smtp-Source: ABdhPJyqqh+4DMm616K4AE228vYL/LZf22aG8+uvqy7l20EkKGNKFc356+I/F91iDhZPW7xwxyKijg==
X-Received: by 2002:a62:78d0:0:b029:3dd:8fc1:2797 with SMTP id
 t199-20020a6278d00000b02903dd8fc12797mr31318902pfc.65.1629684506681; 
 Sun, 22 Aug 2021 19:08:26 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e26sm13804358pfj.46.2021.08.22.19.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 19:08:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input clock
 is disabled
Date: Mon, 23 Aug 2021 10:08:12 +0800
Message-Id: <20210823020813.25192-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823020813.25192-1-bmeng.cn@gmail.com>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
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
---

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


