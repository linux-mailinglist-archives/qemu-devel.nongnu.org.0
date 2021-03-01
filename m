Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D62C327F6F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:27:05 +0100 (CET)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGiZk-0007uo-6l
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTh-0003eb-Pp; Mon, 01 Mar 2021 08:20:49 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTc-0003MV-H6; Mon, 01 Mar 2021 08:20:49 -0500
Received: by mail-pj1-x1030.google.com with SMTP id c19so11157093pjq.3;
 Mon, 01 Mar 2021 05:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AvmXxELlSPq/Cqpu0ZFOXyo28njZpHc7YVv+Gg5cBAE=;
 b=GHKe7LJJ8N1cymTpU5jEFf3dlBbGIfA6MIuH5+33nlqHSGYxzrBdTIhci5q8aHNJLg
 s7ikSSLu+rZRbrcs9rPGrpWmcfQmBTcF8qL4vEYLef8iTPU16m8K/Tadpl3S87jFXY41
 1yFoBnxP1LkOsiTR7GgBcZUnWUEnv+pYFvA6iii61/W/EAkOH9gMsgubn0CHLqiC1qfv
 m5OgQm3IkqED1EvRQ3T3um9EMq7CwxVeggfStjGF7Y11VMyhuORBTv/sRwMk0g8O6Ati
 rE48ymZ+X/JRv0CbJY1DR1d6353RDSV+x6HacLf7F/6Q1/1Bg8wB2T0Yo3qmsYLRsOug
 d97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AvmXxELlSPq/Cqpu0ZFOXyo28njZpHc7YVv+Gg5cBAE=;
 b=pPgvjjuWAFJxi83XlMnmOjEul3555FDV1Ox0hToI+PMpOtiygcmp461oy/qPN3gsMJ
 MLgjHHbFifVntnsjHWCY/Q+aO/XXSgZD0sHrtRB9pol38liDw0Eeb6YgOexG4HwBBFSy
 qEP+v8faXfPuxdQ3WC6t+/8JxogqUVa+c4F38Hm4RZo19Uz8ZnvGxKm9WOR+cYQEnTuu
 0pO7nqhS9oCzztDGhhSV/C0XB1JKcymqqbwsC00fNUN24+bN9+xlNPRvop87PZb4VBJH
 J6cLIEq3xKEzcVjyolPlHvUvMBOni8sylkMtUjSk3n6HwLO1XieGtO+cj9cyQhsr2BIJ
 rU9g==
X-Gm-Message-State: AOAM533G+lEij5FM+mFNreTTKART1bFRFsbQ5kl0rY+4XDRhrMtktclM
 iCoSQmmDxo0TpeBLLUBSyGg=
X-Google-Smtp-Source: ABdhPJyti+DhveMpPVcyM+hsjTCGuqx1+izMi7FWjPLsPMbwaLc48XgA5sBn+xNxeBCpVzIi+fogrw==
X-Received: by 2002:a17:902:6ac1:b029:e3:dbc0:bc44 with SMTP id
 i1-20020a1709026ac1b02900e3dbc0bc44mr15842405plt.15.1614604840309; 
 Mon, 01 Mar 2021 05:20:40 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id q2sm17748793pfl.158.2021.03.01.05.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 05:20:39 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 5/5] hw/ssi: xilinx_spips: Remove DMA related dead codes
 from zynqmp_spips
Date: Mon,  1 Mar 2021 21:20:11 +0800
Message-Id: <20210301132011.8494-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301132011.8494-1-bmeng.cn@gmail.com>
References: <20210301132011.8494-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org
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

---

(no changes since v4)

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


