Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27703FD9D7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:51:11 +0200 (CEST)
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPhv-0003dz-34
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcW-0003A8-8W; Wed, 01 Sep 2021 08:45:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcU-0003Xz-9v; Wed, 01 Sep 2021 08:45:36 -0400
Received: by mail-pf1-x431.google.com with SMTP id y17so1918856pfl.13;
 Wed, 01 Sep 2021 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5t8z8W2/Z4HnNDfJxkUtulZXcpKeSL8+hbjbGr7gaxg=;
 b=WwfViySbJ2IQ1mlgtvxlqChgoPMo2TxSK1Hgfl2YeY2n+EMc66LZ6z1AJIlHFmlIdZ
 mZo1ecfGYvxhtg6tg3+UNE803JXMBQ2Q2ih5nZHl+nluSb3EaWNeDrQGFHonGxmF6lHk
 trdeQ1rtJKtJMnMDZ6HHDrkCnGnQJsdyQN2eSyahTaIEvoc27rDQDRU1fdZIuXNkaBu5
 OYYddKv1NkHzOglW6dbDPb4jBar0v4nQewM0aZ++txvLZ6LAwJJkQSa7Qw7nlyKTEkWu
 TwbTUPTPSk81f9YETvbVdo8iCEt8iZ1E/A07l2B99DIK98js7Qp9CnKameRGGA21ELiM
 gxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5t8z8W2/Z4HnNDfJxkUtulZXcpKeSL8+hbjbGr7gaxg=;
 b=rJl2bhFEtV3tMrqb05nTY571dpCBesJHP3E89D7qINBrsD35Bt1xEpXAgwD0OkooYK
 qVOOSMHzgKJKVi0V/TEQ3zuIvvCxNGKDg79YYrZvcQfM6lCea/jFHc0+SLwDztU16gz3
 E1LEjuiPPzZyP9UPaRAfTijQhT//CMLQLyFYZzAsupXv5wZNHR8N+MzYDR+N3t9HcdmK
 h1oQBB9hP5OLQihjckkXiGRUMYyzXGgg+sdFsOccVrONnjt01OD/DL+NXf7s6oE9JKca
 6BORi4KipQw04Ylnwhmv9xkD58x2F2fi7vGhS4QOhmTs+R8klepJte12pDUX20CMh1N0
 dRrA==
X-Gm-Message-State: AOAM530zSK+Lz/GVTr/ujA5qQTvAY2sSbSxUvczSmSo3pzmasenjG4sI
 wrg8yqQtBaoELAEFjwZnVzM=
X-Google-Smtp-Source: ABdhPJzLtPGb66i6tkQJjBENPgdT/h3/yD6rTGxMUfbD8GZpgN/A4VGPJL0Y7I5u49tMEXIbTHCLlg==
X-Received: by 2002:a62:a513:0:b0:3f1:e19c:a23 with SMTP id
 v19-20020a62a513000000b003f1e19c0a23mr23555442pfm.43.1630500332170; 
 Wed, 01 Sep 2021 05:45:32 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d22sm20917134pfq.158.2021.09.01.05.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:45:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 1/6] hw/misc: zynq_slcr: Correctly compute output clocks in
 the reset exit phase
Date: Wed,  1 Sep 2021 20:45:16 +0800
Message-Id: <20210901124521.30599-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901124521.30599-1-bmeng.cn@gmail.com>
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
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

As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
does not receive anything. Debugging shows that the UART input clock
frequency is zero which prevents the UART from receiving anything as
per the logic in uart_receive().

From zynq_slcr_reset_exit() comment, it intends to compute output
clocks according to ps_clk and registers. zynq_slcr_compute_clocks()
is called to accomplish the task, inside which device_is_in_reset()
is called to actually make the attempt in vain.

Rework reset_hold() and reset_exit() so that in the reset exit phase,
the logic can really compute output clocks in reset_exit().

With this change, upstream U-Boot boots properly again with:

$ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
    -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0

Fixes: 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

(no changes since v1)

 hw/misc/zynq_slcr.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index 5086e6b7ed..8b70285961 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -269,6 +269,21 @@ static uint64_t zynq_slcr_compute_clock(const uint64_t periods[],
     zynq_slcr_compute_clock((plls), (state)->regs[reg], \
                             reg ## _ ## enable_field ## _SHIFT)
 
+static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk)
+{
+    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
+    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
+    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
+
+    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
+
+    /* compute uartX reference clocks */
+    clock_set(s->uart0_ref_clk,
+              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
+    clock_set(s->uart1_ref_clk,
+              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
+}
+
 /**
  * Compute and set the ouputs clocks periods.
  * But do not propagate them further. Connected clocks
@@ -283,17 +298,7 @@ static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
         ps_clk = 0;
     }
 
-    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
-    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
-    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
-
-    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
-
-    /* compute uartX reference clocks */
-    clock_set(s->uart0_ref_clk,
-              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
-    clock_set(s->uart1_ref_clk,
-              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
+    zynq_slcr_compute_clocks_internal(s, ps_clk);
 }
 
 /**
@@ -416,7 +421,7 @@ static void zynq_slcr_reset_hold(Object *obj)
     ZynqSLCRState *s = ZYNQ_SLCR(obj);
 
     /* will disable all output clocks */
-    zynq_slcr_compute_clocks(s);
+    zynq_slcr_compute_clocks_internal(s, 0);
     zynq_slcr_propagate_clocks(s);
 }
 
@@ -425,7 +430,7 @@ static void zynq_slcr_reset_exit(Object *obj)
     ZynqSLCRState *s = ZYNQ_SLCR(obj);
 
     /* will compute output clocks according to ps_clk and registers */
-    zynq_slcr_compute_clocks(s);
+    zynq_slcr_compute_clocks_internal(s, clock_get(s->ps_clk));
     zynq_slcr_propagate_clocks(s);
 }
 
-- 
2.25.1


