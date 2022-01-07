Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E003487B67
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:29:28 +0100 (CET)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t3P-0005fA-Dg
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5swB-0005G7-8T
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:59 -0500
Received: from [2a00:1450:4864:20::434] (port=44964
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw9-0007v8-NP
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:58 -0500
Received: by mail-wr1-x434.google.com with SMTP id k18so12290810wrg.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DrLtR+BUheQSY3OxzKhmjxErO+2Tcnsj0fXYlPgSiDU=;
 b=yN2kdQXyuG0WIZD4cwUtfPTpvxpQOtVC78CrjkUW3nFoIvB642QTzV8tRVS/1K0HNT
 hYYtMPXOxdaFW71vc4grbHy+TGeOFTNNUEec4b1vW82WlsflU4SS6ygwKS1O4gLFW7ja
 NvNlngij6SGdsXkaJzvqdCteNP84V8apYd1eYQrfZhuLxvq98cSKORQrO0Ejc2aaMO9j
 f02h9BrlbxukfN7L7rYeU89Rr/BGpOOX9TmbgGbn93ZWL6M63LI/iIySjn1fOeiHNtQx
 6frsEwNeXN25spIi2tClJLsbiAjXPb5YqigVHzIGTjq8dG1bQAHai3fHV0KYNeSP2gJV
 wQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DrLtR+BUheQSY3OxzKhmjxErO+2Tcnsj0fXYlPgSiDU=;
 b=vAd//jFMdY+F05a3GMwSmWI6IJbwncBzw6tl3s2DMsJlnwlU1VNogAUc8RUxxOvcnK
 BSKJLxjNMPCKKtHDQVTfRxYmuKoq8NmLBIykaFmEuE57fa+P7nr++Dm/QYTBYPgS+BGr
 LqlKyEZ+S/RNHzIK+v4xE/E0W9aNgJzfHsT0GagyxLKJs/svuU0SCrGRVdljaHr2i77a
 TDc/scXrVwoAhunJZJdftyDvllehTcXCK+KA0DFOvMzSpoTh7KDoSGv8zt2YFVgump9F
 eK9WP72Wj2WwE4l72wEsPb9/9Ut+fJoLzmHh0gPUVBO6ciRPyMhJSiwgQTUAu8qacwgS
 5kDw==
X-Gm-Message-State: AOAM532ddN2N8L8t2URiL1CE1eCWiXtF3EgOuJta/1bfHWIaJKVXmy+n
 8ykyNNhi1+OzgLSKek/ZQK+NHnr0idAGIw==
X-Google-Smtp-Source: ABdhPJwLWJ/OS43rfueG4yXXBfRaxJlB32NMPTZtZgZmLyezytzBu2FyEf288u19QQCNEi9fkiiqyg==
X-Received: by 2002:a5d:64ad:: with SMTP id m13mr56225026wrp.714.1641576114642; 
 Fri, 07 Jan 2022 09:21:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/19] hw/arm: add i2c muxes to kudo-bmc
Date: Fri,  7 Jan 2022 17:21:41 +0000
Message-Id: <20220107172142.2651911-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220102215844.2888833-4-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 257bf638fd5..4cd58972c56 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -330,8 +330,17 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 
 static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
+
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
+
     at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13), TYPE_PCA9548, 0x77);
+
     at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+
     /* TODO: Add remaining i2c devices. */
 }
 
-- 
2.25.1


