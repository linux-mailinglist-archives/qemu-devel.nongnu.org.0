Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611CE538802
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:03:49 +0200 (CEST)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlcC-00039Q-8M
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGR-00025b-24; Mon, 30 May 2022 15:41:19 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGP-0000Nw-BZ; Mon, 30 May 2022 15:41:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so183180pjb.3; 
 Mon, 30 May 2022 12:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3kaUIlgB+HCi67jzp3tJaQRHe02uDC7eaPM7cAd48kU=;
 b=TSfqkfNgrl71Ke5XRpV6DfPNJQ4ZUcdHSBuUXKfvK9FFiBDc/DcIgGJbtuekc4AVD0
 st3bqL36JjQ4ivX9goFafevN/9Rqnw0wMVftrNnST1uGjRt1+yAzDszO8ZqnYJaGMUCU
 uSoXGHUNdNiWqWbrvLluB0VPPaac4zm8VPZiOdMoT/T22XOkODNQoVvkIAnI4iLaoYuQ
 U/FkTmUYc/iiOe+nxEiH+2Rdm78gGwVQIDFWpAzHJYNGPFwG71c3ZPmfjWkPMFxrYW8I
 N7Qld23FlVgbzpisUxpZBNnGXVUTF/HpnLzUNHXi8vKaLJcw8VcYnGtTsVl7+Hkh2NQ0
 idKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kaUIlgB+HCi67jzp3tJaQRHe02uDC7eaPM7cAd48kU=;
 b=HKWdKex0fpXjHsXMmx0LYrzh6r95qDibOiU7YKKZE9ZJjoQVG/HuPuLvwWyDxjbDX8
 2PJlQs9g7ZLwZyG957cWp57YnR/c6XM8F0vfxc2HcQvw5qiU3W9CZSrOtzdjksUVUJma
 j/I39OGAOaxf5bl3128ALSWia+io1qpZDJK1RSfmYktxC8IARYrpGry7zOIXHwURCZzO
 N1UzGsXBon10vmuj/U13TPR/N+oYBz6EMSgFp5NQyvf0bqCvl4o5vBTp2rjyXePmXi2z
 R1Zik4MMTUiWM6NOi3kl/jiUMsEtLPhDtcCHPWi0B+mPcHJSHKxyTohBtO9FXzOZfP2h
 PX1Q==
X-Gm-Message-State: AOAM5304Z3aUSr0Irw36kAnOoNlrfixtlvO//qEjezo+2T9oDny+ZI4q
 /yYEbVGhm9iANBUoK8AGb1rihtKM2IM=
X-Google-Smtp-Source: ABdhPJwmuh72H4zElqNgKxSSvgZc6V8P+EikBg496rH+bOFqYrCytmIUBXmjeRPKu4R9K5GLOorZVQ==
X-Received: by 2002:a17:902:b402:b0:162:29a3:9331 with SMTP id
 x2-20020a170902b40200b0016229a39331mr39055744plr.59.1653939675394; 
 Mon, 30 May 2022 12:41:15 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a17090a674e00b001e3290cc2c1sm69537pjm.34.2022.05.30.12.41.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:41:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Subject: [PATCH v2 20/25] hw/sd: Add CMD21 tuning sequence
Date: Mon, 30 May 2022 21:38:11 +0200
Message-Id: <20220530193816.45841-21-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

MMC cards support different tuning sequence for entering HS200 mode.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
[ clg: - ported on QEMU 7.0 ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d38ee5094d..672af1e839 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2012,6 +2012,30 @@ static const uint8_t sd_tuning_block_pattern[SD_TUNING_BLOCK_SIZE] = {
     0xbb, 0xff, 0xf7, 0xff,         0xf7, 0x7f, 0x7b, 0xde,
 };
 
+#define EXCSD_BUS_WIDTH_OFFSET 183
+#define BUS_WIDTH_8_MASK    0x4
+#define BUS_WIDTH_4_MASK    0x2
+#define MMC_TUNING_BLOCK_SIZE   128
+
+static const uint8_t mmc_tuning_block_pattern[128] = {
+       0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00,
+       0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc, 0xcc,
+       0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff, 0xff,
+       0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee, 0xff,
+       0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd, 0xdd,
+       0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff, 0xbb,
+       0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff, 0xff,
+       0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee, 0xff,
+       0xff, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00,
+       0x00, 0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc,
+       0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff,
+       0xff, 0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee,
+       0xff, 0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd,
+       0xdd, 0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff,
+       0xbb, 0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff,
+       0xff, 0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee,
+};
+
 uint8_t sd_read_byte(SDState *sd)
 {
     /* TODO: Append CRCs */
@@ -2098,6 +2122,21 @@ uint8_t sd_read_byte(SDState *sd)
         ret = sd_tuning_block_pattern[sd->data_offset++];
         break;
 
+    case 21:    /* CMD21: SEND_TUNING_BLOCK (MMC) */
+        if (sd->data_offset >= MMC_TUNING_BLOCK_SIZE - 1) {
+            sd->state = sd_transfer_state;
+        }
+        if (sd->ext_csd[EXCSD_BUS_WIDTH_OFFSET] & BUS_WIDTH_8_MASK) {
+            ret = mmc_tuning_block_pattern[sd->data_offset++];
+        } else {
+            /* Return LSB Nibbles of two byte from the 8bit tuning block
+             * for 4bit mode
+             */
+            ret = mmc_tuning_block_pattern[sd->data_offset++] & 0x0F;
+            ret |= (mmc_tuning_block_pattern[sd->data_offset++] & 0x0F) << 4;
+        }
+        break;
+
     case 22:	/* ACMD22: SEND_NUM_WR_BLOCKS */
         ret = sd->data[sd->data_offset ++];
 
-- 
2.36.1


