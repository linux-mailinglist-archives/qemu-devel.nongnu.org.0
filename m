Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64408407D64
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:53:57 +0200 (CEST)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPOzc-00063e-G2
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqr-0004dN-Bu
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:44:53 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqp-0005Cg-Q0
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:44:53 -0400
Received: by mail-pg1-x52a.google.com with SMTP id n18so6661339pgm.12
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q9QAdZnLaXH8d3kpPoy5vtHu2NGaDJkkuqhtwk9nTdM=;
 b=HYxqtJJJlhafHzBroVg9ZA0AlCXv3geYUbQUxfVYGcMnDF5FfYMiPPmYm5zBpRMNdk
 W9nNR5d2ZwyDA7beZNqBM1iEXFVZIQmDFnPYJayO/0BXULtLNw3tqUeTIxvK0uaqfsMH
 J6oOjISOa/BePToE7fOehWxnnaztEInmBIfguJFO+xgCHi3kTxOLcsYyCZaCA5BZdNFR
 yKf9k7sKU1xnJ5z8Jm2k7skg616WcYmveMGVi9vPYww9SB5dBx0UbUpKTF/q/AOXGl9U
 DkroVjY7RhQyzu/1KKwcLExU/oG6jdJJ0rJ7BwRR6MZcSbljrPCUWlTAIh5/Eo+1DRYW
 joag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q9QAdZnLaXH8d3kpPoy5vtHu2NGaDJkkuqhtwk9nTdM=;
 b=xiugn4YEimL7rZPhBDJNvk+Mdn50ugDcV52GhxnMcbidC+unAigZFx1lrGzL25U0Yx
 bp/eo62tWpgUL1OfgdW4MGBHIc3qgGnj37h/297uWr4sW3raeFPJ3AvCczudyzhFsI2R
 2GM5eZ4ckNUu2vuKCvnLsMJIhiKKb3GjHBAKy83VWHx8EYhtgRbvUqZUOjsIAvB/NLL9
 6mUcIjg/qSfp1OoW8A9vb1yHrGbtS47VTnZkVww+ldftXni+Kbt//bHQsYF8si2hIpZw
 012faWWgKYA9gW4RGKUdwKpupRzux54JA2AYo+VJwnzT3KWMUnpZRcT2R3mQKnZt+MRX
 LW8w==
X-Gm-Message-State: AOAM53097I2Tb8c6+6rRtPW9SoCSAglYDsuoLy7bMHKUfwzDfKZh4m/P
 jh2iiwP2BB7YbdmkmIaYGfgOgN4lPcBVYw==
X-Google-Smtp-Source: ABdhPJy3gcCQ7Y/psoXQvGPBPNUAODWqYzXN8SnAdfD3r/tekakpMGZuzx+KfZ9jjGs/rGu+rwl8Nw==
X-Received: by 2002:a63:b94d:: with SMTP id v13mr6537298pgo.361.1631450690295; 
 Sun, 12 Sep 2021 05:44:50 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k3sm3807043pjs.11.2021.09.12.05.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:44:49 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 3/4] hw/dma: sifive_pdma: allow non-multiple transaction
 size transactions
Date: Sun, 12 Sep 2021 20:44:19 +0800
Message-Id: <20210912124425.166071-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912124425.166071-2-frank.chang@sifive.com>
References: <20210912124425.166071-2-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Green Wan <green.wan@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Green Wan <green.wan@sifive.com>

Real PDMA is able to deal with non-multiple transaction size transactions.

The following result is PDMA tested in U-Boot on Unmatched board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
=> mw.l 0x3000000 0x1                      <= Claim channel 0
=> mw.l 0x3000004 0x11000000               <= wsize = rsize = 1 (2^1 = 2 bytes)
=> mw.q 0x3000008 0x3                      <= NextBytes = 3
=> mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
=> mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
=> mw.l 0x84000000 0x87654321              <= Fill test data to dst
=> mw.l 0x84001000 0x12345678              <= Fill test data to src
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 11000000 00000003 00000000    ................
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 40000001 11000000 00000003 00000000    ...@............
03000010: 84000000 00000000 84001000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87345678                               xV4.
84001000: 12345678                               xV4.

Signed-off-by: Green Wan <green.wan@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index a8ce3e6699a..d7d2c53e97e 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -74,7 +74,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
     uint64_t dst = s->chan[ch].next_dst;
     uint64_t src = s->chan[ch].next_src;
     uint32_t config = s->chan[ch].next_config;
-    int wsize, rsize, size;
+    int wsize, rsize, size, remainder;
     uint8_t buf[64];
     int n;

@@ -106,11 +106,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
         size = 6;
     }
     size = 1 << size;
-
-    /* the bytes to transfer should be multiple of transaction size */
-    if (bytes % size) {
-        goto error;
-    }
+    remainder = bytes % size;

     /* indicate a DMA transfer is started */
     s->chan[ch].state = DMA_CHAN_STATE_STARTED;
@@ -131,6 +127,14 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
         s->chan[ch].exec_bytes -= size;
     }

+    if (remainder) {
+        cpu_physical_memory_read(s->chan[ch].exec_src, buf, remainder);
+        cpu_physical_memory_write(s->chan[ch].exec_dst, buf, remainder);
+        s->chan[ch].exec_src += remainder;
+        s->chan[ch].exec_dst += remainder;
+        s->chan[ch].exec_bytes -= remainder;
+    }
+
     /* indicate a DMA transfer is done */
     s->chan[ch].state = DMA_CHAN_STATE_DONE;
     s->chan[ch].control &= ~CONTROL_RUN;
--
2.25.1


