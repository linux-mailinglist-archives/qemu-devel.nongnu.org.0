Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA650B612
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:21:12 +0200 (CEST)
Received: from localhost ([::1]:42716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrLW-0002fd-JP
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA0-0004tD-BC
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9y-0002qO-LL
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so7618497wma.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Sllr6EGIV1uqtp8xOnIt6F7gaB5mrGXL+fViUdJftLg=;
 b=BTIArm9xV7nueRM0VgmSqa4zA+lVIdper/Md3paLpjSU0rzXqvTWdbBDaPURIQ96YW
 gwfbbdeZ3VgtYY20JyZjATZV5T4nPzhY4/UbXEdpVDRV7S5zxWejSkxUUDQBIsfr+FPu
 7ZiSqqjfHEjL7NouiktoYOOU+PIwfvFRbRkPdnBr6980sUPciyWaXgh4747ZTWhIs1WL
 6vyPQB+24WjlPnhszEoSn08AnuWAi0RvacWA3iPLYNR7WQeA/rTNDFMEnZRPKZAYJnP6
 1j13O/hI9kzrntITTLLJSzOrGfUa9jdAsIFIrdfJX8Tbb2dHc+u9sVzP3QhtsdeS1sEF
 I2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sllr6EGIV1uqtp8xOnIt6F7gaB5mrGXL+fViUdJftLg=;
 b=f3ASIpr/W33N66LZ9AK0Bjl3g+Ejg93m8TPBKlavEprXuUNNYg2VkQBGqw6HRrlnah
 yXdGJllAtcZMFAy69b/e4iprAmG+2GGI0fyrK0Kl8bWq6kQrtLUiiSEhQDh0IW6Cgj8P
 uZfbzBwUU7sk20B4LC/2+mstO6lemoXcImRptIqTrbutWm61057lqS0UCInJlX9Z47V8
 keNRjbZfE1H/ctEK5RcxyhMAHDOAHdJct7gK4QK4Ok+bMB4fGMDhTdDC1qZYlV6yVHfF
 qfUUd5tQIjhM6v+I+cvrjS0jCiTK5WtAQcUqlz6Y2N/p+fwkND3uZc1LAiqyfubgTUgk
 0Ttw==
X-Gm-Message-State: AOAM533nKTevcI4UO6OKruu1SzKb/jCXweZHRJmAzd3cZ9AX4WG6XW8W
 8JLjsxNHO+U2QnhNvBemlpO7kTxBdFAnlQ==
X-Google-Smtp-Source: ABdhPJyWGBTXA96+xCRmyLhhvdm0Fz8S36VHdE0oVTEx+Lt/+nvL5mQdjtMgRb0dyT6A22hTB4V6Zw==
X-Received: by 2002:a05:600c:1e85:b0:391:ca59:76be with SMTP id
 be5-20020a05600c1e8500b00391ca5976bemr12412497wmb.184.1650621904981; 
 Fri, 22 Apr 2022 03:05:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/61] hw/intc/arm_gicv3_redist: Use set_pending_table_bit() in
 mov handling
Date: Fri, 22 Apr 2022 11:04:04 +0100
Message-Id: <20220422100432.2288247-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

We can use our new set_pending_table_bit() utility function
in gicv3_redist_mov_lpi() to clear the bit in the source
pending table, rather than doing the "load, clear bit, store"
ourselves.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-34-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 0fbb04f9986..2c4a87318bc 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -909,11 +909,9 @@ void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq)
      * we choose to NOP. If LPIs are disabled on source there's nothing
      * to be transferred anyway.
      */
-    AddressSpace *as = &src->gic->dma_as;
     uint64_t idbits;
     uint32_t pendt_size;
     uint64_t src_baddr;
-    uint8_t src_pend;
 
     if (!(src->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) ||
         !(dest->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
@@ -932,15 +930,10 @@ void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq)
 
     src_baddr = src->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
 
-    address_space_read(as, src_baddr + (irq / 8),
-                       MEMTXATTRS_UNSPECIFIED, &src_pend, sizeof(src_pend));
-    if (!extract32(src_pend, irq % 8, 1)) {
+    if (!set_pending_table_bit(src, src_baddr, irq, 0)) {
         /* Not pending on source, nothing to do */
         return;
     }
-    src_pend &= ~(1 << (irq % 8));
-    address_space_write(as, src_baddr + (irq / 8),
-                        MEMTXATTRS_UNSPECIFIED, &src_pend, sizeof(src_pend));
     if (irq == src->hpplpi.irq) {
         /*
          * We just made this LPI not-pending so only need to update
-- 
2.25.1


