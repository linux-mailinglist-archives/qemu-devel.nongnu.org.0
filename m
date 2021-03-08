Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BF5331588
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:09:28 +0100 (CET)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKJr-00045i-S0
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlK-0007Yg-DH
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:46 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkz-0007DC-Sr
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:46 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso4312334wmi.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=74U/u/XTm/I9RFlPjSYA1HB7Yb99PayPgOPDysisocw=;
 b=oldW3FcgouspBTSczRg+dBA6mWQ6CCMYnoDkrUXX+he26tlajJ4iPRySGb5KROTLXr
 P0J4NUigOvOIlefkj1/T08ctbgKuK9DPK/VXZUwbQdmLqFjNWjxBAQdhxNPJKpWSLYV2
 0K4SYZFSWnabtfy8RnWpPrNaXWKg7zH5h5lX6HbCk/+G6qRfp3M2pQQRz0KcIZ16dRqa
 sI7EIWZxeLj5Idjbi/0KZ/jAXZEDMHrHK9k6FR+cjc9TzQIyBUtkDxZo9Qq7FtTX3rLx
 C25otljcZcF04+GboE6f+dMyUHKviDvwu3PKV9kQ2ytSpmofnIPPUAjqsfXoC7AeoMZe
 dVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74U/u/XTm/I9RFlPjSYA1HB7Yb99PayPgOPDysisocw=;
 b=MQqE0A2Butu5Gvd/2UzxpLTpq6y2tJrSNjGOF5vE2WJIP3YzzB6oEu1JRXkO15AX73
 lYzE9SOKC5uck6L+7ba1/0FVrWl68aor7xhrCvlM7txY8vUFnXjT+WAYTtbQVtZL+kEd
 GFKXl/5KFvAmtWvXjNAeo6kOTy8eywj/5d592dDgm2qHP6hmFV57LgUcqtXalu5wZM7m
 wxUqncm9HSQ39/9ZF5ToW1yIdttU36orjyGUiXwGAz26ynWr3e9JzCsR9ncM9Xibh2Qh
 A8Q0WxMJXHD09USMSYsqDO5O94smF+oijglkJjdfjsI6E/4GE5PsRjv7nQS2dyy89cwr
 P2SA==
X-Gm-Message-State: AOAM532kiTIemmKKl2rFUjEi2mZ7u8A5Sf/hMnpb5EAt3qCWzE52kf87
 xdPbf8SxNFm7i30w8OhgQrnB4yKMvUrxOQ==
X-Google-Smtp-Source: ABdhPJxGrvjHRjv6HmXtfAvA21gDFofNFJsA7dYhoxpUihWd5UlHEeso2t8kjiwi+wG226KMmmXp4Q==
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr11772153wmc.3.1615224804539; 
 Mon, 08 Mar 2021 09:33:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 52/54] hw/ssi: xilinx_spips: Remove DMA related dead codes from
 zynqmp_spips
Date: Mon,  8 Mar 2021 17:32:42 +0000
Message-Id: <20210308173244.20710-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Now that the Xilinx CSU DMA model is implemented, the existing
DMA related dead codes in the ZynqMP QSPI are useless and should
be removed. The maximum register number is also updated to only
include the QSPI registers.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20210303135254.3970-6-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/ssi/xilinx_spips.h |  2 +-
 hw/ssi/xilinx_spips.c         | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
index 3eae73480e1..06bfd183124 100644
--- a/include/hw/ssi/xilinx_spips.h
+++ b/include/hw/ssi/xilinx_spips.h
@@ -34,7 +34,7 @@
 typedef struct XilinxSPIPS XilinxSPIPS;
 
 #define XLNX_SPIPS_R_MAX        (0x100 / 4)
-#define XLNX_ZYNQMP_SPIPS_R_MAX (0x830 / 4)
+#define XLNX_ZYNQMP_SPIPS_R_MAX (0x200 / 4)
 
 /* Bite off 4k chunks at a time */
 #define LQSPI_CACHE_SIZE 1024
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8a0cc22d42e..1e9dba20392 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -195,13 +195,6 @@
 #define R_GQSPI_MOD_ID        (0x1fc / 4)
 #define R_GQSPI_MOD_ID_RESET  (0x10a0000)
 
-#define R_QSPIDMA_DST_CTRL         (0x80c / 4)
-#define R_QSPIDMA_DST_CTRL_RESET   (0x803ffa00)
-#define R_QSPIDMA_DST_I_MASK       (0x820 / 4)
-#define R_QSPIDMA_DST_I_MASK_RESET (0xfe)
-#define R_QSPIDMA_DST_CTRL2        (0x824 / 4)
-#define R_QSPIDMA_DST_CTRL2_RESET  (0x081bfff8)
-
 /* size of TXRX FIFOs */
 #define RXFF_A          (128)
 #define TXFF_A          (128)
@@ -417,9 +410,6 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
     s->regs[R_GQSPI_GPIO] = 1;
     s->regs[R_GQSPI_LPBK_DLY_ADJ] = R_GQSPI_LPBK_DLY_ADJ_RESET;
     s->regs[R_GQSPI_MOD_ID] = R_GQSPI_MOD_ID_RESET;
-    s->regs[R_QSPIDMA_DST_CTRL] = R_QSPIDMA_DST_CTRL_RESET;
-    s->regs[R_QSPIDMA_DST_I_MASK] = R_QSPIDMA_DST_I_MASK_RESET;
-    s->regs[R_QSPIDMA_DST_CTRL2] = R_QSPIDMA_DST_CTRL2_RESET;
     s->man_start_com_g = false;
     s->gqspi_irqline = 0;
     xlnx_zynqmp_qspips_update_ixr(s);
-- 
2.20.1


