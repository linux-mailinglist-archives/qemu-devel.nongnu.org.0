Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084A31CE6A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:51:44 +0100 (CET)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Ze-0002f4-BC
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC33C-0000GP-2m
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:11 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32T-0002XC-AD
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id v14so13773551wro.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Btazgn6Y5qOJThEGpbN02VT8W+WTRqqeVzuGqS4pkq4=;
 b=BjRZymBBtatqlwFC74+hFiPlNrd+PcGe/VT7oDFnQsaNSmm2uroAaHvWekMfgWzeWP
 qbFtB24rbyle57rdPxnB84OsRWtGOKz5gVvJhmM3obH7lEUKIOG2aAR4bsN4TOcTSIo4
 l4G5gwhBOZW92MX8j6/lLiZgfB7wwAy35Jgn90GP7lsS22fdg17XNQOsfFMsgMRgMyAv
 VWrYlLR6ETBLr7LWc65vBZMBNgzlidNoRA93NIYYLEvqTUhO3ue95v0aBE4bpLimbow/
 UIsj00sVagjvHCTKgG2DgcmnRbGFoyqVFngBs/JuKG2YQU4VvOsN83/XxfuvUG51MfVK
 qslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Btazgn6Y5qOJThEGpbN02VT8W+WTRqqeVzuGqS4pkq4=;
 b=JxWemZPe/y4OPu+jKqVTWZ7aDPxccNgQ7cgt0N8yY5mK7tz4vsoZfhvGqWSH9LAH5N
 38bbQrCeDDk1oeO4GgShiNKtU7ol0yRtClAIolan/+oBEJLAbbHMdMuHraFy5FXW74f8
 akaZpiMSus6Sl2y0s+himqKpGwlR+ZMG4kPtsjT0omphiwbUPJicWdTbnWbHQSgG3/De
 aDJExZFM72PTq8veuGcy7EJNXyOO2Fh2TZ4ymGP4lJUS8LTWn7l7IfC09z298+9IxFD3
 MzXDh6i6rGUl4kqTu6FcXJLMJ8yon85NL+cGdYgYhqsDFCj/oweEDxnh2mZvbHRUPv4+
 jTqw==
X-Gm-Message-State: AOAM532EXBn6uT8dAdS4vLQdydIReOKg2aG7fiCPLilhGknFtTAcGaNN
 Q2Me8S48ovToxBgRhMzrnLfXTYQul9n2rQ==
X-Google-Smtp-Source: ABdhPJztYQJD5E8HWiqeLlIaL2Dbzw5ZlG0v0iVgrKDrtBOm+JMO69uo8Gs72+13BMwwT9ykP2b2Gg==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr24260349wru.384.1613492244145; 
 Tue, 16 Feb 2021 08:17:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/40] hw/arm: Add I2C sensors for NPCM750 eval board
Date: Tue, 16 Feb 2021 16:16:51 +0000
Message-Id: <20210216161658.29881-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Add I2C temperature sensors for NPCM750 eval board.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210210220426.3577804-3-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 3fdd5cab01d..47a215bd015 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -98,6 +98,24 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
     return NPCM7XX(obj);
 }
 
+static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
+{
+    g_assert(num < ARRAY_SIZE(soc->smbus));
+    return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
+}
+
+static void npcm750_evb_i2c_init(NPCM7xxState *soc)
+{
+    /* lm75 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), "tmp105", 0x48);
+    /* lm75 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
+    /* tmp100 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
+    /* tmp100 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -108,6 +126,7 @@ static void npcm750_evb_init(MachineState *machine)
 
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
+    npcm750_evb_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.20.1


