Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD7C487B7B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:33:35 +0100 (CET)
Received: from localhost ([::1]:35440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t7O-0005MN-MH
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:33:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5swC-0005MC-Nd
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:22:00 -0500
Received: from [2a00:1450:4864:20::335] (port=43594
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw9-0007ub-PA
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:22:00 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so1671589wme.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z4EUXGhIseTY6ZgauG9XLglUz/cBDaX/t9IzarQCkyE=;
 b=mQK5PxvgzauSEyZF2joa7cQ5TqQeE2Jh1MX4YE4lST/5YwFmfYLtn8dEjMYKQ972K6
 PbffKal0HQb5rl5mRItjH02ipiEpyw63SY/JiQ8ykcjsIgm1ynfZDJxqhACV1tKM1+t6
 V4F7aw1uGkjVVlKtf3UjGammPj3sF99bOh4nzbr2c3oXZuljwlrqqXrlD/bovCjca6wi
 a9QvEZLTtWW482GqWds6cQk/yRzQIZadtMt/u98Asx1nJMuloaJvLVtdONID4LwKkxQD
 0Hl7miMCU8dd2+7N20yU2fXf8KPgYbrQ3lslnmBL0KTcUMsHogIcG4L5/W9xlx7YEL4A
 JfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4EUXGhIseTY6ZgauG9XLglUz/cBDaX/t9IzarQCkyE=;
 b=q9/GsdXuAhi3vwCY5SEmCh9BXMJqOJK54tRhCKLEvBLq+gI8ky80Javk525WIRJg0k
 TjGq9tr1ejP9vS5s2TWOGJUgqqf6jbkKKjWRQB4tS6k4V65XZcteiNkCymTQvlaBXiZY
 kli1Ta8eqB3EuJqbUrphODEPie40wotlEUPaWapTYhQsPUz6KrOAqJJmwhYPJKiQy9UR
 l3UUAOqyMxwd3MJz8IOMCnLce02Z9BZjd7QQQ1PWXoinzfG5inFGcQnniX/sidYKUGRD
 fekwwABI1Dbd0+WNGVTyQ3GhZIfLz+Pu4PTecrQ12nKiuM8zWRIGCDcKWNSV6VeBffzI
 EJRw==
X-Gm-Message-State: AOAM532Ioa7z9q8BoPAWyuSfh0dvfsNrIHneAYvutGdPZEYi5k0I/wBJ
 nQIJxDuu2NWykn1NhcFP+OH5rXepc3ap4A==
X-Google-Smtp-Source: ABdhPJwD6aOFCOHLbWghUOEn7lGebHmn3x0MNcfXhawgf8anvCiU/ZNqSBB1AVsUlwlOylwhk/+43A==
X-Received: by 2002:a05:600c:2245:: with SMTP id
 a5mr8222540wmm.47.1641576113622; 
 Fri, 07 Jan 2022 09:21:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/19] hw/arm: Add kudo i2c eeproms.
Date: Fri,  7 Jan 2022 17:21:39 +0000
Message-Id: <20220107172142.2651911-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Chris Rauer <crauer@google.com>

Signed-off-by: Chris Rauer <crauer@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220102215844.2888833-2-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 0866d2f4f05..37de9fef434 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -328,6 +328,13 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
      */
 }
 
+static void kudo_bmc_i2c_init(NPCM7xxState *soc)
+{
+    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+    /* TODO: Add remaining i2c devices. */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -391,6 +398,7 @@ static void kudo_bmc_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
                           drive_get(IF_MTD, 3, 0));
 
+    kudo_bmc_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.25.1


