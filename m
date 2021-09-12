Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478C9407D7D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 15:12:13 +0200 (CEST)
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPPHI-0002xV-AO
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 09:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBd-0003J3-If
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:06:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBb-0005TI-Uv
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:06:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id j1so4425020pjv.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ng6bxLr/CEDfg4qWZ+9iIXZdvuZu2KqsMTpKiIZfBw=;
 b=WXuMXxssniiviagfWbxof8pU/TftIMBEUEFjgqd6gTRWwhgkNzVCkuLLPL45gEZiRo
 mi6tGDH86uS86farpunedI8nXq/pt6KMtrG3zBa+aAsypJvZTv0maPDcrrdpyE4PMjDX
 axjTuF4LQ9xaajg4CRjXqmPDyIzt3mHb43xPq+uwfrLfkZta77B3SY04i8LUYCMhmkXL
 hqXZu4yxUZAhGyNHrhtrxREbKx/nKwEgZbc5BlUFXsWPIrXUheQH0ehgi0TPTKPkd4FO
 +5hDs3pOdSAVxzOc7t9ffpgoK/Y7BBXQU9FJZJOjOr7rhJWfXZCP2Ne1/ImgoEg5Adkk
 gdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ng6bxLr/CEDfg4qWZ+9iIXZdvuZu2KqsMTpKiIZfBw=;
 b=H3HeVQc9ixcXXV5h0IKfban8vsJdYqV6cKDT5YYX/uqZW9QCQSkUstqupGhTRCNRYg
 mYs/XN+FWK3kulKBPAQ0k2MvwcnOzr0KQsRtxKSPz7YULa1AZQrRNb2mk5n7jvtb75qN
 lMCdTwuPi04XoJEsTyrklTMFf3kbZW9UiEDRF2NVmk6G9EE66nllaw3AsY2i8i9PtU7m
 jnlsW+J+rol2WjLXhNeqCHTNQvhz6aOeczz/vnISOrKniF3y+DSQ4+7tk64Wg3wer2b6
 TcBxoC2OPtXMc0Vf8A8FTyPscfI7gZ6zBe/+DfhvIIKW1CfdKQTHHwoNoWditYMVsgjo
 eR9w==
X-Gm-Message-State: AOAM532rZ5njLwPqFqPmK2vAAC7vTNhrNWu+vOOKKe0GeW7ujt7OVsem
 5lZW+A8rOT2p9r9762wzxSZP7IzJBM6DCOwx
X-Google-Smtp-Source: ABdhPJxyZEHUyCjB2amPdBkwIdfJWUslJoPsuf0+n3OUSjHtcuQVBIZFd/cp/fbiG6ZVriUHr2hC+g==
X-Received: by 2002:a17:90a:294f:: with SMTP id
 x15mr6804915pjf.36.1631451978398; 
 Sun, 12 Sep 2021 06:06:18 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id qe17sm3849565pjb.39.2021.09.12.06.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 06:06:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH RESEND v2 4/4] hw/dma: sifive_pdma: don't set Control.error if
 0 bytes to transfer
Date: Sun, 12 Sep 2021 21:05:48 +0800
Message-Id: <20210912130553.179501-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912130553.179501-1-frank.chang@sifive.com>
References: <20210912130553.179501-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Max Hsu <max.hsu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Real PDMA doesn't set Control.error if there are 0 bytes to be
transferred. The DMA transfer is still success.

The following result is PDMA tested in U-Boot on Unmatched board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
=> mw.l 0x3000000 0x1                      <= Claim channel 0
=> mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
=> mw.q 0x3000008 0x0                      <= NextBytes = 0
=> mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
=> mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
=> mw.l 0x84000000 0x87654321              <= Fill test data to dst
=> mw.l 0x84001000 0x12345678              <= Fill test data to src
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 55000000 00000000 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 40000001 55000000 00000000 00000000    ...@...U........
03000010: 84000000 00000000 84001000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index d7d2c53e97e..b4fd40573a5 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -80,7 +80,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
 
     /* do nothing if bytes to transfer is zero */
     if (!bytes) {
-        goto error;
+        goto done;
     }
 
     /*
@@ -135,11 +135,6 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
         s->chan[ch].exec_bytes -= remainder;
     }
 
-    /* indicate a DMA transfer is done */
-    s->chan[ch].state = DMA_CHAN_STATE_DONE;
-    s->chan[ch].control &= ~CONTROL_RUN;
-    s->chan[ch].control |= CONTROL_DONE;
-
     /* reload exec_ registers if repeat is required */
     if (s->chan[ch].next_config & CONFIG_REPEAT) {
         s->chan[ch].exec_bytes = bytes;
@@ -147,6 +142,11 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
         s->chan[ch].exec_src = src;
     }
 
+done:
+    /* indicate a DMA transfer is done */
+    s->chan[ch].state = DMA_CHAN_STATE_DONE;
+    s->chan[ch].control &= ~CONTROL_RUN;
+    s->chan[ch].control |= CONTROL_DONE;
     return;
 
 error:
-- 
2.25.1


