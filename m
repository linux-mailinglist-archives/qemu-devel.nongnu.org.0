Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736C321878
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:23:25 +0100 (CET)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBBM-0005eA-4g
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEB3z-0005xh-ED; Mon, 22 Feb 2021 08:15:47 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEB3x-00018F-KV; Mon, 22 Feb 2021 08:15:47 -0500
Received: by mail-pf1-x42c.google.com with SMTP id j12so6551796pfj.12;
 Mon, 22 Feb 2021 05:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9KqCJQXFtWkC0eQevcf4n4m7wle4LjbIfUJE3rQ7DfE=;
 b=njbNcqqkNvLz1+K41BSyl5vwLnNZARb//O13w44NmOSqcSPBVSZpS+pvpcAHqyJmy6
 BtTelLex8kXDQ9yMM0B5G47+bp6C1Vq34fL9bgTKRSrMEeVgBrFe5rytTOtDhfpWzwET
 oDF6bWjvX8AFVg/92VZvYKsorRAtfUaUdv6djLj9c6uIYaDLjXxwJWoL7ALFNlza/u2j
 pV7OW/4nhFvxZJ2yfoySun7tmeKFSGAi2kADlSTNS6ioaTv2v6qiyyfltd7OV7pzvLIz
 2cCm1SQc/GkE+AQqlnjwlgMfYCAn0VTy1Vo4dHIvjmQMO5p4O0kJAhZ6HwtxhcqDRcJN
 QtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9KqCJQXFtWkC0eQevcf4n4m7wle4LjbIfUJE3rQ7DfE=;
 b=P4QCxtA7s8HBwe8xIV5Mbzcnf/BlyCyMjsIi5xreqWYklxlVceSqs+txdTCpOxoaJ4
 uxlPoPUIZvQz51UTwqqApMCxHV4CBxDT1I0a9nDXUw5A2q4QU6vDnspBfKxokQQ+rSov
 bOPX159fN2ogYGNz6waT/OVhNeCZp8bG0OixHhjws7lA46zJcP1x5+m54K9DDV+fKr0+
 8X03yReDRKsrqasK85HPgQyKgXBNq6a2eiuCuWT7OsgCsHXBg44Bq3a49NOcrtE1tN4R
 3dJZkMV3s72J60wYJEmF33ZqOxMcA3XY4SRWdTRLFUlFZkAuvB/C9GNt/vtwV3lLMVer
 JIBg==
X-Gm-Message-State: AOAM5327Zee4dXW1g+iYhs/bl2MzKqStEUWmhNCflloZKiRKrst2vKZ4
 u+X2aPcfTgcr0LajX9em78Q=
X-Google-Smtp-Source: ABdhPJx4G6Yvm+P3ogv7HzesQACsaiB3FrpSBaStkRfrFp5ppB1ejjMvB3F81kxyQG8kvHmGYZts9g==
X-Received: by 2002:aa7:9505:0:b029:1ed:98ad:81fb with SMTP id
 b5-20020aa795050000b02901ed98ad81fbmr6147140pfp.52.1613999739134; 
 Mon, 22 Feb 2021 05:15:39 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id p8sm17473190pgi.21.2021.02.22.05.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:15:38 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RESEND PATCH v4 5/5] hw/ssi: xilinx_spips: Remove DMA related dead
 codes from zynqmp_spips
Date: Mon, 22 Feb 2021 21:15:02 +0800
Message-Id: <20210222131502.3098-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222131502.3098-1-bmeng.cn@gmail.com>
References: <20210222131502.3098-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
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


