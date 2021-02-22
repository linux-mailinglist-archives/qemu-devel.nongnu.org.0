Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832FE321802
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:08:32 +0100 (CET)
Received: from localhost ([::1]:46900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEAwx-0007t7-JF
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEAuR-0005Ra-Aw; Mon, 22 Feb 2021 08:05:55 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEAuP-00058W-2W; Mon, 22 Feb 2021 08:05:54 -0500
Received: by mail-pf1-x436.google.com with SMTP id w18so6544785pfu.9;
 Mon, 22 Feb 2021 05:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9KqCJQXFtWkC0eQevcf4n4m7wle4LjbIfUJE3rQ7DfE=;
 b=pkxAJWrNHCv8HxKgpa8Fzk/f3G+450TPWQZsBSFtZl56iZEDnqAguSkGBRqfX1vCaL
 euj8Fy0O+WkzpRQmacK8xJI9PT/Wzg9xKYI8qwZgf0n5LFhs8nV/VLyHi3NslQh/MQ/Z
 uakpz83fUyFtnUzle4F8fJC1fc9IH8FHGJXkN5WBlwPVQGTim8eIuUuN9EcC9//BB5gg
 DNvGPF8oee+lSmz9l0RSA4sZrmDiRN4zgwc+OzTreXmuVV5OzsD0qkvthJEX2MfqHasw
 XcFkEiWCjCTa3hwwXI0Vj5BaULqJE8QAcZt/6MEwzc2xysEICii459QADE3R2wdxWjhw
 U54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9KqCJQXFtWkC0eQevcf4n4m7wle4LjbIfUJE3rQ7DfE=;
 b=sigoCj4lMXikDKqARpZL8yLKZ1gd+IUGYVDEC5JrJ3/hp3vvHxI0hsSLNzmdxE1X4X
 zKe0tFHl4u9fS0hh/A1qhENgcKjqs7ZerSJtzaMwn5S9HIgJQkTBk8aFo+S6WQ5tusee
 UnuezcQVelZDQPrhTg4uxvUusB0JROnItB0gBF/ils8VeophaACyDZNJBiymUGgwgOpu
 iA3mnUiP99n0VNRSd5nstKfubHhTPcqMLMHOZKbhkoLKl3QF3rSblSJ5AeZwdZ+e4j4T
 k0MBPJSfZABCwv6Lq3PWoCRsHkGUo4qURWaiVsUU+JlYItzmAwIPSXTNA5nM2oAqjeOr
 3Trg==
X-Gm-Message-State: AOAM533TViysEd9crbiy4PaSs/3Em5p9y8TjVtihAzXab2QBPaKMCBWq
 v2K7V25U+LYe0QDGeN0qpw4=
X-Google-Smtp-Source: ABdhPJyHb5APY2BOYrsEL+xjvgjGfaB7EPSf138o9JE679FqSzjgAXny4kOXIjug1tdpvHEElInHWQ==
X-Received: by 2002:a63:f202:: with SMTP id v2mr19564444pgh.24.1613999150528; 
 Mon, 22 Feb 2021 05:05:50 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id q126sm19170171pfb.111.2021.02.22.05.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:05:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 5/5] hw/ssi: xilinx_spips: Remove DMA related dead codes
 from zynqmp_spips
Date: Mon, 22 Feb 2021 21:05:14 +0800
Message-Id: <20210222130514.2167-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222130514.2167-1-bmeng.cn@gmail.com>
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Now that the Xilinx CSU DMA model is implemented, the existing
DMA related dead codes in the ZynqMP QSPI are useless and should
be removed. The maximum register number is also updated to only
include the QSPI registers.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v4:
- Modify XLNX_ZYNQMP_SPIPS_R_MAX

Changes in v3:
- new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips

 include/hw/ssi/xilinx_spips.h |  2 +-
 hw/ssi/xilinx_spips.c         | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
index 3eae73480e..06bfd18312 100644
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
index 8a0cc22d42..1e9dba2039 100644
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
2.25.1


