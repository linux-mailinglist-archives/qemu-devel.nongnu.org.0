Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EF5316376
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:15:56 +0100 (CET)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mXL-0005Qb-VC
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSS-0000KR-6z; Wed, 10 Feb 2021 05:10:53 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSP-00036S-3v; Wed, 10 Feb 2021 05:10:51 -0500
Received: by mail-ed1-x529.google.com with SMTP id z22so2202024edb.9;
 Wed, 10 Feb 2021 02:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HgooUYReWht3R5owWvQqwU/EQ/eHh1JGCNZbl+Tx3t8=;
 b=oPjMKQHyICiOcbWHy4+v7LXW4LE3Wl/BxWeCHnPmXAcK8/pWX9tDiGhDR3N26pWySI
 xcU+Ca93DISmD5XGYpq9lmG+vOzA4vOVLvQrVhfpljFTngz3N2Z1gfarAU/Z81vT5QPR
 4ByTkW7w6OV/f4JTzZTxDmludxGfv3sSOWzQ0JM8ql8E39vd4HEXF8DLOLGhvn9xRzMH
 WijSuRGMkcBxUMi45RExlenm4TRP5iVocZ6nMaExTBOMx9Gm1leFNN13ZI+mMobMGs2l
 bJdcW3JN5pKsE/z30jUxqNMd1EpqBboQL2s+MokUtL4jprjdfBJERgCwWWmTGD1l0a0u
 4Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HgooUYReWht3R5owWvQqwU/EQ/eHh1JGCNZbl+Tx3t8=;
 b=Z3nP/wr/2zuEmQOmdiy1btEUsFqM/ghfRkQjjz9tV+I66Ph6uEPtPByJgWEtJyGh74
 gdfn4Eq1A4UUnbaiow59IJL0pLlpJSBs9j0LAoxMOwbPWAla9Z8S6Ve4c8RrBUljiQ4X
 lOnorC5M3Ved7BsmHz5j/UABxbrxhD96oYkVtiJoHxCdxnpA1CQ4laLisPVJEbngjjLc
 sfI35z+ZMtYfXQfvuxaoPG3nNcEe9mUjgfLW9QuNbIGihrzxOGzlxbfP1ZyKLckm1ihU
 cHC4cX4rKIaTBNhyUP7S0OZDj26UXvJ7uhI8oiEy8kYlKwdi9h193GNf/yqgiFxCrgiN
 3VSQ==
X-Gm-Message-State: AOAM531cukk+/RlmpnvMpsA5Ts2VHkVNmPUrtjHvelGUU2sR98K2O/Dh
 ++0pV/LjJatPyKoC4B9Bujw=
X-Google-Smtp-Source: ABdhPJxakovPOVQkCMhkF6IDcJIMNU6Hk66UJNi1vMHg46Lyn8j9uCSrV014yFu/bx3Xhg9huJASrg==
X-Received: by 2002:aa7:c351:: with SMTP id j17mr2398898edr.261.1612951847297; 
 Wed, 10 Feb 2021 02:10:47 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y11sm785418ejd.72.2021.02.10.02.10.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 02:10:46 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 5/5] hw/ssi: xilinx_spips: Remove DMA related code from
 zynqmp_qspips
Date: Wed, 10 Feb 2021 18:10:13 +0800
Message-Id: <1612951813-50542-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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

Now that the XLNX CSU DMA model is implemented, the existing codes
in the ZynqMP QSPIS are useless and should be removed.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips

 hw/ssi/xilinx_spips.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8a0cc22..1e9dba2 100644
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
2.7.4


