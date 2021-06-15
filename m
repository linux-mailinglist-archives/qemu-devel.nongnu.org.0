Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399573A8521
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:51:43 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBLq-0006Rz-8R
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFC-0006JJ-MT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEh-0000yV-Vb
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r9so18878688wrz.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CEA7FSbLGi5A6kATzg2rxoWerCKV1VDUeDfHJ0mPSiY=;
 b=aISUVBwpi2rod3map28H3xJjU9CVW0IN0FturDGPMEVJLhU2UaIqog1xrJdnMyzntz
 eGLkVGEeYXvWeug0hqvaDCYNg9Glw3F9MXcj/pzf7FKj6bKK3b6Pu9oyTkdzHEArcRfB
 SCeUk87ANSrg3RJfJMy5bQ6nEIoIostpBsC3i6Cb/vqsr5GTx2txHsvq4TuF5LCVoNzJ
 JgN5GyNwQVPzV6PkaBqIgs9EWJVlrG5G0OtUa8yrPiekpkk24KluULG+itGuCyrtXaal
 WyfZ7n2sf3w+5+bUWfGzf30ImhbMgrn5q/Bm1R3tqzzjEQXpC08HtIwYuvuESIKqyvx/
 4Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEA7FSbLGi5A6kATzg2rxoWerCKV1VDUeDfHJ0mPSiY=;
 b=VCYaNbkuIXmzAAWwCD/qDW/AG8pzElV5G3PXQy1v2QbpjQZaK86+D/+e2AZCXWb0oj
 /7cBl4feZlnOrNa2lwWlP3etnEQG79/5Bbw7YymwILyaxLq5lbHLKIsSXBVi1Dx1KpQx
 XTyXcAzUgIGte4qIJ43K2yEzkhZ1jWunRf39/kQ/Nwu4BgKaaK2H7BRgUnjrtqRG9akZ
 Uq5eQjEEpWyqnk9W6wvquFqSRyd880/qzrD5TwqoPtldZMOLS2r5twoPsvefVJaJAosN
 MufTzLVZccpx8saZHkFywH52ZqM+AZrqWNC3FRTojtEiXEIWpWckRGX8AbjfaW2233gO
 aNUg==
X-Gm-Message-State: AOAM530o/Wcnte4iyEHk4rEav7bW1JxE5KV0FNCnUZmVMISd6VJU3SZI
 LPCx9DHEWFcbdoxN2nc7QvHwQbF5yCGM7Q==
X-Google-Smtp-Source: ABdhPJz2N5dJg6JLz68hhAkdcBY2QtkYitUBnmmY8u1aYDH+bkiCMXMwJuCaVyaRYcWtFze+sq6Q5g==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr26271115wrl.225.1623771857902; 
 Tue, 15 Jun 2021 08:44:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/28] hw/arm: gsj add pca9548
Date: Tue, 15 Jun 2021 16:43:51 +0100
Message-Id: <20210615154405.21399-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Patrick Venture <venture@google.com>

Tested: Quanta-gsj firmware booted.

i2c /dev entries driver
I2C init bus 1 freq 100000
I2C init bus 2 freq 100000
I2C init bus 3 freq 100000
I2C init bus 4 freq 100000
I2C init bus 8 freq 100000
I2C init bus 9 freq 100000
at24 9-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
I2C init bus 10 freq 100000
at24 10-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
I2C init bus 12 freq 100000
I2C init bus 15 freq 100000
i2c i2c-15: Added multiplexed i2c bus 16
i2c i2c-15: Added multiplexed i2c bus 17
i2c i2c-15: Added multiplexed i2c bus 18
i2c i2c-15: Added multiplexed i2c bus 19
i2c i2c-15: Added multiplexed i2c bus 20
i2c i2c-15: Added multiplexed i2c bus 21
i2c i2c-15: Added multiplexed i2c bus 22
i2c i2c-15: Added multiplexed i2c bus 23
pca954x 15-0075: registered 8 multiplexed busses for I2C switch pca9548

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-id: 20210608202522.2677850-3-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 6 ++----
 hw/arm/Kconfig          | 1 +
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index eed0da71b8a..e5a32439954 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,6 +18,7 @@
 
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
 #include "hw/qdev-core.h"
@@ -232,10 +233,7 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
      * - ucd90160@6b
      */
 
-    /*
-     * i2c-15:
-     * - pca9548@75
-     */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 15), "pca9548", 0x75);
 }
 
 static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6a..8e7c9d22a45 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -378,6 +378,7 @@ config NPCM7XX
     select SERIAL
     select SSI
     select UNIMP
+    select PCA954X
 
 config FSL_IMX25
     bool
-- 
2.20.1


