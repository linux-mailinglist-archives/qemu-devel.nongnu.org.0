Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B4495422
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:25:48 +0100 (CET)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAc83-0003b5-PE
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:25:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgb-0004HC-JA
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:05 -0500
Received: from [2a00:1450:4864:20::336] (port=36533
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgW-0003I5-Uf
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso20157018wma.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s8nOtgyyoiY8Q7eqAUdGUvFJcWeoHZrM5YjYJWOrqFM=;
 b=sUHeqhO2bjt54dR9eJ7T0jPnB6prjoigS523csrG1XM5ZfLnTf1aXpwqDkOJQ1QLG3
 AVaRS9WBuEWeh8jEoL21GigsaZGKsA8wBHPVx2TgFdglO1aQPKXmOMm2WdEq9sCpiRMs
 qIQySUmW5oQERqQZYx8bdYk3dcwx66vf/1sQM1ajMJwSSqdr+Y1Yym+w6TbhqUvB/vz2
 V4167EKkz7BBR8hdIF8Lp0Hz4gIoZD6F5oznp3+wwvuJoTERViPdhOE+tCbr+SqoKulO
 t5zl217BEQ5foMOdn1WBZogaVFufMmHx3Cw40RJtisT8MWnHLjiGmlDDJ2KoHrD3u0Sm
 tcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s8nOtgyyoiY8Q7eqAUdGUvFJcWeoHZrM5YjYJWOrqFM=;
 b=TcFeKJmJDAxWLd6R7xdCB4Z9Q+lHeaM9+/Nd0cjHOeeyOgzC7UzRX3VGjxpR69UPr4
 ErimLK6PCobf0EepmPtvLbZRsuKAb5npKmK5KlmLQSvVP7pbV34Irxizhvjwu1J49US6
 WkROLVrZO27Z1JwQCN2tKotcvJjylfnVeQkvGhrvmNVOOUYJG99U7DeHQmS9r6EWH6o8
 G39S+Mn2WKdtQvA9v5zA9J7Cflkfzw0vpZhr+vfpuA90Dn+eRB3cgzzqpD3ypZHz/4uo
 qRslWBr7E3zKvie4gffU0lZjeT1d0LQ//YNU6QxrnaSSZG3Es+hzRjntm3OCdYUM7mG7
 PnAQ==
X-Gm-Message-State: AOAM531fL+bK3evhQLoBx4lmfuxHqeOXBKG2BVJu+6PpTnGVeox13gXN
 xnU8tUCoPb80gYne1KdVqU542J8xH3MMAQ==
X-Google-Smtp-Source: ABdhPJx3cms3qDuexM8LcrrcoIVtv8JzsIbCiV//ZBFpU69frV7OOziolSQMHHuY0C1hVfZ/3TxRfQ==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr4025420wrq.552.1642682219582; 
 Thu, 20 Jan 2022 04:36:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/38] hw/arm: kudo add lm75s behind bus 1 switch at 75
Date: Thu, 20 Jan 2022 12:36:14 +0000
Message-Id: <20220120123630.267975-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Message-id: 20220111172338.1525587-1-venture@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 7d0f3148be0..d701e5cc55a 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -332,7 +332,15 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
     I2CSlave *i2c_mux;
 
-    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1),
+                                      TYPE_PCA9548, 0x75);
+
+    /* tmp105 is compatible with the lm75 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 7), "tmp105", 0x5c);
+
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
 
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
-- 
2.25.1


