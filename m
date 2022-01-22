Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23B496D6C
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:47:25 +0100 (CET)
Received: from localhost ([::1]:44008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLQ4-0005t5-6X
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:47:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4o-0005k1-Vd
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:29 -0500
Received: from [2a00:1450:4864:20::429] (port=36815
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4V-0007hA-9q
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:09 -0500
Received: by mail-wr1-x429.google.com with SMTP id u15so5890306wrt.3
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2LzeMToaOEGCiel3HQIJUA2eQNzHpTQ/lZbs+RZvo48=;
 b=F9FABkkn2BchsatkG3FrRyqG73hQL/0/SsZYGCR/MLdt2U09yRUHlvqJVKcWeYhlJ/
 IADCV6+PnJB4pvuoVrqecVb6SMCt8Sh6cGk0znGnMSNtuLWY7Mvt2kc1QrTk4EkCVD7O
 umUxqCKyeKBLzsmITftezRFYu3UTh7W2nPkxcAY2M8k5A2Wb6eLjwDvOkFUtm4tmyWjm
 oJEV7EGVMB+zXHNDM9v4EjDnRHZ6oMxkOGLkfRqkqWs8aVnu51O9oG5xWTP8u5bT3MPI
 p0tJEJmkOXI4VlblxrW0g+hJJlQgLJgWEiMTRgCNtueSJqryrLDrDPxM1xMf9mCIRr88
 3aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2LzeMToaOEGCiel3HQIJUA2eQNzHpTQ/lZbs+RZvo48=;
 b=1tuTtI/GIC9vWZ8lbPW+5fgBsneNXOeGQwr0pZjKARr/DDmoUxEvmkqGvT5e+Dz684
 aJUdduMdOQFpbOvYi2n13v1+YrrZSeJ40OBfYYePHyMHw7wm4UCNkmKk5ktO3Rd9uHEM
 Laaqeaons3ciudwwd+30by5N1EXwy5wStpLu78pf0clUQSBoBir95ELQpuzbkM2lEZGQ
 msp2F2OCeGNWQR0tW5D8ahsInCvjknbvLFV19YZxjjKuh/9oTE4i+8CdPhyB/CshO60G
 P07d2+SbnAO+WITxZhxiyBoQBvFY8+i18xbTA74bxuEW0hs7MdjPkhYi1HAapLjxtBNJ
 OX8A==
X-Gm-Message-State: AOAM530RQYhFQeEH3049kQCxk5b2asTPyfjCv4n0YEP9zbZku5H3Z40f
 pFe2vucjv/oOQnmMDlSSmFelNKEQZkW6Ng==
X-Google-Smtp-Source: ABdhPJyXVYQ+xT/Hd75htYRxGm4MnCRqXoxHsR4ahmKHPdSA/KO0Hmv+0C8i7vFXmhaAjCYZrLAfWQ==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr8184908wrm.311.1642875892581; 
 Sat, 22 Jan 2022 10:24:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/14] hw/intc/arm_gicv3: Set GICR_CTLR.CES if LPIs are
 supported
Date: Sat, 22 Jan 2022 18:24:39 +0000
Message-Id: <20220122182444.724087-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICR_CTLR.CES bit is a read-only bit which is set to 1 to indicate
that the GICR_CTLR.EnableLPIs bit can be written to 0 to disable
LPIs (as opposed to allowing LPIs to be enabled but not subsequently
disabled). Our implementation permits this, so advertise it
by setting CES to 1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h   | 1 +
 hw/intc/arm_gicv3_common.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 5394266aaf4..a316f6c58a5 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -110,6 +110,7 @@
 #define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
 
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
+#define GICR_CTLR_CES                (1U << 1)
 #define GICR_CTLR_RWP                (1U << 3)
 #define GICR_CTLR_DPG0               (1U << 24)
 #define GICR_CTLR_DPG1NS             (1U << 25)
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 579aa0cb9ed..4ca5ae9bc56 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -429,6 +429,10 @@ static void arm_gicv3_common_reset(DeviceState *dev)
 
         cs->level = 0;
         cs->gicr_ctlr = 0;
+        if (s->lpi_enable) {
+            /* Our implementation supports clearing GICR_CTLR.EnableLPIs */
+            cs->gicr_ctlr |= GICR_CTLR_CES;
+        }
         cs->gicr_statusr[GICV3_S] = 0;
         cs->gicr_statusr[GICV3_NS] = 0;
         cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
-- 
2.25.1


