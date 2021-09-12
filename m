Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BC1407D5F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:49:56 +0200 (CEST)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPOvj-0007xZ-51
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqk-0004Qq-9d
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:44:46 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqi-000595-GR
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:44:45 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so4584628pji.2
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FTkGFyg/YtaZMgVSbfKunIm+4d8G4FPBLUSS439AHQY=;
 b=J0he79nuxNx87NOdRyrjb420BSoYYJuJZCglz9z9g4hVaF4SMAe5yS1lBEJGeWVjCE
 RBT1NPOsb/VPiSB+W9xif/fRN44y3poorVrCoH9XSo5Gyfld0AxRXP9zE30UxCrYqof2
 67L2J2nS7ZjAFWa765n74u2sOlSUqUQc3QOhi+JwI6oEf8vY/MGnEL9lARA64mJL7hU0
 UILubMYinml/O0DCFBPk/tjtJJ69AIZGoNk7yQGZpSSLNYdrwJRCUHkVACzLvQAesGiS
 wMYblikJEhH7cZ8Mick/CGNXqtDub5k+IsV2nRf0b84GH+MDKms1EumZw7uLveHbv6YC
 oOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FTkGFyg/YtaZMgVSbfKunIm+4d8G4FPBLUSS439AHQY=;
 b=YacRXhuPanqnIvloS/fsn2F03+Xl8wBIavNvVhZgV1+1K6XwKwLnIX859s9TkUW731
 +Rc+Zzo/1msNAEzB5kC37h+BWq7iibDp7gYrkzs8suT7Q/E8QtmHCfVVnxKeUA6M3M6p
 uks0Qj1d+pwZepMQ6c8PcO2Sj0+eaVnOUgiQPSOapBfPvXVHP7+2RochzfKHzOIvjkUc
 DrN88hQ2snx+UoIPnq89Ve4niU1hq9XGF1NGH6TkzLSOrRYAQtMPPXRKXkjUvnoOCLuD
 ofE5RBCq3LCCiTwlZ4/wGhOvU/j3GUlfY3HW0gejkVRvYvoUtMMxJPSMVq3u8EXFH5Th
 YfmQ==
X-Gm-Message-State: AOAM530p242lE5d2osZLWaMbQTb03LKq0oAktmJ4YIpehF/fQQonzHQU
 6MozCiCbD2bslzaSVSZ60CCC7TxMO1g9hg==
X-Google-Smtp-Source: ABdhPJwL3tVXDS1xC5g5r175SalhlAYtMj+J5MOiZ4I5dWQr0DeOIAjBZ/ok8REIwiK1JLExUCvHgA==
X-Received: by 2002:a17:902:b7c5:b0:13b:9372:a192 with SMTP id
 v5-20020a170902b7c500b0013b9372a192mr669981plz.79.1631450681531; 
 Sun, 12 Sep 2021 05:44:41 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k3sm3807043pjs.11.2021.09.12.05.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:44:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
Date: Sun, 12 Sep 2021 20:44:17 +0800
Message-Id: <20210912124425.166071-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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


