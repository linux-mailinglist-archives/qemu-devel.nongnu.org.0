Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB2323C7A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:57:56 +0100 (CET)
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtjn-0002ss-W7
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtdA-0004la-Q3; Wed, 24 Feb 2021 07:51:04 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtd6-0003rs-IS; Wed, 24 Feb 2021 07:51:04 -0500
Received: by mail-pj1-x1029.google.com with SMTP id t5so3307328pjd.0;
 Wed, 24 Feb 2021 04:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AvmXxELlSPq/Cqpu0ZFOXyo28njZpHc7YVv+Gg5cBAE=;
 b=gkYj8qM2fAjqbeJiHuSV3vyfrKXuH07b5vB95t17S68GOSK3aEHRdREEqB89OmNIkB
 1r2kZ1wIsvcLeLwhxOGHiCZLH5ng5UYJ1j5Q5ev+U8YBFWlfIPLDHG05vSUe6wvgQ4NY
 YXwBcibyFIaivtKqYaAqw0aqkBxXiNnKcJdZJn4naXI1H4RwuUwnhlQR42eAkmt+cE07
 iYmEdg+2E74jtPcHAOQ8vtBDbaTbQc1aWVLnzeHM/mslu+S9JYmAj8KdO8BmhOC3OoAi
 KVGuHIGKlp1/dBpZAImSy2uZWsIH2vWcptl69pkQ6nX+86pBEn5tpkxxc4GK1LDFc11U
 Ircg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AvmXxELlSPq/Cqpu0ZFOXyo28njZpHc7YVv+Gg5cBAE=;
 b=Z6fTkL1t14d71hbQVJDN/FyfuPPFLKbFGKpnxocWyDf0u2gh326slSrQK4PMsMsx4w
 zrNDQ4F6AzvKcrX0fiN/h6ruP7hIvqDj2ZOH/jUlboWwcZXNJ/fPifusYYbZ3UZ8892p
 IBsoCxQJHB7KE45yPUeQqgTukphaO+7gnZFRQLHCPrlKCmZWeWHLOQuhrRqEOtrjCKX4
 elUpllKuYP5x6eo6LVxd9JVFakjr7VIf5zEtruMsGOh+K3Ah2UybyiiM01wzvEnPSYja
 pv927elcwrnno17Vq3Ew5FRN7fLME1UCRTnKtyhpp4LQzTPXWyt8x7OnNNZ8yh7HGc1D
 6FyQ==
X-Gm-Message-State: AOAM532GdgvAIvBpRpTS74iHGsQ9kFEHmlzbfMtdr38sNNO8zAsSm98u
 P7YBaYjHsmBvTSBDETv9+/Q=
X-Google-Smtp-Source: ABdhPJxqXnEPBGQGXT4x9iY12no/bcHYMWnApGs7ZChWSo+KlEWCj9D7wY6W0IUPR1yeosQiHxRnhA==
X-Received: by 2002:a17:90b:1650:: with SMTP id
 il16mr4163950pjb.97.1614171058940; 
 Wed, 24 Feb 2021 04:50:58 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e12sm2795661pjj.23.2021.02.24.04.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 04:50:58 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 5/5] hw/ssi: xilinx_spips: Remove DMA related dead codes
 from zynqmp_spips
Date: Wed, 24 Feb 2021 20:50:24 +0800
Message-Id: <20210224125024.4160-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210224125024.4160-1-bmeng.cn@gmail.com>
References: <20210224125024.4160-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
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


