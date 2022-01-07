Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03813487B85
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:37:25 +0100 (CET)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tB5-0003ES-GU
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:37:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5swD-0005O3-GZ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:22:01 -0500
Received: from [2a00:1450:4864:20::42f] (port=36573
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw9-0007vB-P2
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:22:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r10so4677391wrc.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zVmLLkxt4dOpZmfYQzdKuBSvUHMgb75r8FoddgZXA8c=;
 b=uNqeurAStmDBvFC/CcvPCQDpJGAHhiDliXAH3w3goDFgce8CseOFGKlb/m1LXqhslQ
 p90KJnM6R8rB4dIpuPzyPUEFHJDdoE46CDMjqtuQIxRLFQnRL6dlFYjK2qkiTmYODWAY
 rGaS946EMjnNCPnLE8R+zkwJobMoVPqu5J4CSlok5Jc5iSI4JnQFHU78LnfCJNwvKXFe
 uCN1EeE6rkrrjIPd/95fQFlC+8A8oAM/helChZVqYURNmYct29YWB+D7xA79yEby0yA9
 706QceWd96d2/lEaxf1Q4aUpo7nOOO57BoGw9gxdFzs7CyntHek7YXaCujBpr4FQxj1v
 7+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zVmLLkxt4dOpZmfYQzdKuBSvUHMgb75r8FoddgZXA8c=;
 b=s0bPxTRkoEkS83SVXAqNZWrMQXokNsM5+P5lG2wRpeQdm1Df/Dsk7rd21Fuoc91ftJ
 PjdMkv/aXCB5Vmqo0Yde3wRfEg3MnNK7IGb0v47U01RAVJQ55yqK4TqNZwne3RgARNjm
 7hWwj3gXc3+e0uA+897EWF8T2JfTkLV1R3v8JQLtsYDK7qS7U9ZFCvcTF9joKLHqml3d
 dv2+FbFNtWjEBf2Hlxq2Zxyna7Px9LIQA/6pbbQ14pzwpKm+3ER5MyDGiHhJpse63UYo
 YzUdwCAYUSno3XjoC7V3bPO3+NUGa9gc7okMEgA3youAwOnSwkoOrfEcxkTjz4bSkkfx
 ryRw==
X-Gm-Message-State: AOAM533czoPN0Tnzu9MUvGvE6c9TToxR2lhPjxmhkPuNigR/hq0fRwb4
 ur9ifVRpEOTH7DdricFYl2KnPC8tzMlNBQ==
X-Google-Smtp-Source: ABdhPJzeiGMmNhS3mhIWreS0PiJod9hHBArMDrj6iJYGhaUmqCYFVhKrIaC5ws920UO2eAjJY1F3sA==
X-Received: by 2002:a5d:5142:: with SMTP id u2mr186016wrt.395.1641576115187;
 Fri, 07 Jan 2022 09:21:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] hw/arm: kudo add lm75s on bus 13
Date: Fri,  7 Jan 2022 17:21:42 +0000
Message-Id: <20220107172142.2651911-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Patrick Venture <venture@google.com>

Add the four lm75s behind the mux on bus 13.

Tested by booting the firmware:
lm75 42-0048: hwmon0: sensor 'lm75'
lm75 43-0049: supply vs not found, using dummy regulator
lm75 43-0049: hwmon1: sensor 'lm75'
lm75 44-0048: supply vs not found, using dummy regulator
lm75 44-0048: hwmon2: sensor 'lm75'
lm75 45-0049: supply vs not found, using dummy regulator
lm75 45-0049: hwmon3: sensor 'lm75'

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220102215844.2888833-5-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 4cd58972c56..7d0f3148be0 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -330,6 +330,8 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 
 static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
+    I2CSlave *i2c_mux;
+
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
 
@@ -337,7 +339,14 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 
     at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
 
-    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13), TYPE_PCA9548, 0x77);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
+                                      TYPE_PCA9548, 0x77);
+
+    /* tmp105 is compatible with the lm75 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp105", 0x49);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
     at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
 
-- 
2.25.1


