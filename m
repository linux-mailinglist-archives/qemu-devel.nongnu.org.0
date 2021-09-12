Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E949E407D7A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 15:10:50 +0200 (CEST)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPPFy-0000gA-0A
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 09:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBT-0002wY-Tr
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:06:14 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBR-0005NB-Da
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:06:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id y17so6277177pfl.13
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 06:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FTkGFyg/YtaZMgVSbfKunIm+4d8G4FPBLUSS439AHQY=;
 b=MRSd9EOmcrNGVpV26K6zTpvz/57Ssg+tvJt/nQrhD0jm++ksg5PLTGGfIn2Mo4hUK0
 yywuRuYJoDeWYSbPeMI+d0pNMuW6Q9PMGsyCcA6uLxqRaqv72gGloWEF3mwBGVc57yMJ
 QlgKfVlD8ryenRoQPIc5pa78XS3GpvsJCcWfHtu3o8+z+ah+p5WF16E3IVrxaWU0yZta
 rH+OOAyBJPJ8xwbfiG/qBUoAngNrMuynPjpknqS5eyJuKorbFfYe5eioCBl7xt2mjm/B
 xgZTHJouBU3DJoCOllgIc64YfjfwkIS9BIcRdMA8ibRplZJ6zGaoOzmkowZKgO7WGvq4
 d78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTkGFyg/YtaZMgVSbfKunIm+4d8G4FPBLUSS439AHQY=;
 b=HO36kPBYX6hW0nVNx+fEMTkNjx1Q8M5bOu+Kj2NzhO6MnkLxkk6TszHvUNVXc+FKbo
 CpqgVrB4qVhNCDAUWPiMvBpgpTeV6Cz2JPaH+HkLVM8UvQI8KhHYRxLlFOsIk8gqm5UK
 MLB14KCo4HmgubQ+hNZbp7mhwFU23M/k+UJBad4fE/RDXWkDQ8dfmg2Zyrl+CulNKJ5c
 mldIP6cxCdD+Bsa1aR3YyX+ATICorC8dJasba3dAqKDGbA1+Bk3Vg1SnQKqOwtXj8Hju
 RlLjdf7MI+3RhrO68uRQg7tPGQRbcNBY9Y1PMGmtAFGKY+rZSGPejH4mgtsPfKssa80k
 Dm/w==
X-Gm-Message-State: AOAM5311tifX6y6DrC9KsFhY4wvUaaZVrG7FkDUE6Or2/A7WIYWaz14b
 FY2KXb9Tql6oj6BIVPKClostTAwVObJXi5Ev
X-Google-Smtp-Source: ABdhPJyhh4lSw+pdpuWXNIWoy6GXmHOdNYzV0CXm4P0rxf3HGFi4D2OubYJMTJoZPbwzpX4W3Q/eiQ==
X-Received: by 2002:a62:e117:0:b0:416:3900:6220 with SMTP id
 q23-20020a62e117000000b0041639006220mr6457920pfh.24.1631451967879; 
 Sun, 12 Sep 2021 06:06:07 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id qe17sm3849565pjb.39.2021.09.12.06.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 06:06:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH RESEND v2 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
Date: Sun, 12 Sep 2021 21:05:45 +0800
Message-Id: <20210912130553.179501-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912130553.179501-1-frank.chang@sifive.com>
References: <20210912130553.179501-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Setting Control.claim clears all of the chanel's Next registers.
This is effective only when Control.claim is set from 0 to 1.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 9b2ac2017d9..d92e27dfdc4 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -54,6 +54,13 @@
 #define DMA_EXEC_DST        0x110
 #define DMA_EXEC_SRC        0x118
 
+/*
+ * FU540/FU740 docs are incorrect with NextConfig.wsize/rsize reset values.
+ * The reset values tested on Unleashed/Unmatched boards are 6 instead of 0.
+ */
+#define CONFIG_WRSZ_DEFAULT 6
+#define CONFIG_RDSZ_DEFAULT 6
+
 enum dma_chan_state {
     DMA_CHAN_STATE_IDLE,
     DMA_CHAN_STATE_STARTED,
@@ -221,6 +228,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
 {
     SiFivePDMAState *s = opaque;
     int ch = SIFIVE_PDMA_CHAN_NO(offset);
+    bool claimed;
 
     if (ch >= SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
@@ -231,6 +239,17 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
     offset &= 0xfff;
     switch (offset) {
     case DMA_CONTROL:
+        claimed = !!s->chan[ch].control & CONTROL_CLAIM;
+
+        if (!claimed && (value & CONTROL_CLAIM)) {
+            /* reset Next* registers */
+            s->chan[ch].next_config = (CONFIG_RDSZ_DEFAULT << CONFIG_RDSZ_SHIFT) |
+                                      (CONFIG_WRSZ_DEFAULT << CONFIG_WRSZ_SHIFT);
+            s->chan[ch].next_bytes = 0;
+            s->chan[ch].next_dst = 0;
+            s->chan[ch].next_src = 0;
+        }
+
         s->chan[ch].control = value;
 
         if (value & CONTROL_RUN) {
-- 
2.25.1


