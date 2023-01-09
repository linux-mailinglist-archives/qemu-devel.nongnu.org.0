Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750D6624D1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:56:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqj3-00037a-SN; Mon, 09 Jan 2023 06:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqj1-000372-V9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:59 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqj0-00088K-FR
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id w1so7885021wrt.8
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7S4AtrItDHw6gjUi/DcC6OrJFm3Uy3mqWC4OtemhbH0=;
 b=pePx4DCvFpr8t3cPEDuEXDalYvRffpzgmGQGamHsL1EOAkOREfaNq+rqiSnjahYXQC
 J0gDBwsga221inhUAmFBKWkx+eS7def5xLicwtg4YNpaVKAEJ5tHVCdwwD2DM0IDKYCz
 DjDkUeUyO93xME5SE/OIqbMGE66wkbpxLU5zGygju04/PsTEv3pTlASizbOqwB5/hSsb
 34+BaYmezJZip6AupL3JhpHzm98AQ5dgBWFfEJ7p3N7k7S9IV28aegNyBS2tRvgr4C7R
 4DPlqFR7RhDLHn6iWYONVI8VwiiKWUUMhG5o4oZsn7iMSPM2v81rWuqWHIoJhAaga3KL
 58Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7S4AtrItDHw6gjUi/DcC6OrJFm3Uy3mqWC4OtemhbH0=;
 b=ngEBw8LHJbSfEFr3Sp3c9rVdquTZdBo4gyVjdnvFnkol2wsWPHjmPUnrCaa7rF89D8
 zK3G1CVjVKoP8cHMiIni7BgSnKH5cGXtnObp2oVrPixrvv/WIUJPbLMvzIveTVkEnbVx
 uBDSIRCZ3QK2V6U2e+ARj/IlJoK5Q3kLe3PJra2J8alocaKdne/9TY2en6d2GQgaFdZX
 Y7/7lSPk324GtnZaj8Lgv+nhQ37vTXvFoGieyJTwtvXdnpWfwg2uWg2NRlEGP8b29+zF
 XbPQV8+XZmQsdsGR621/yylvoQ+ImZZsRsbJDkTqAUkW4mzTtdrDr/pRVsascJuJDrjD
 ZODA==
X-Gm-Message-State: AFqh2kosRhg4HRf8qTCeRbZKfYVrOCVhKay0NkwH2Eyz1biLMqxsoNdP
 r2CNPO8mRdn3xLrxFjEnOhtq9fFyUuvwetqG
X-Google-Smtp-Source: AMrXdXvpEQjBg6+ubLjEP5orROiTBSsaEIq5dfKn15A9KPmD9UcCuw1yh3zVidTJcfJBHZR9zoNhkw==
X-Received: by 2002:adf:eb09:0:b0:2aa:1121:1b79 with SMTP id
 s9-20020adfeb09000000b002aa11211b79mr11348107wrn.25.1673265236995; 
 Mon, 09 Jan 2023 03:53:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adfdc45000000b002428c4fb16asm8528588wrj.10.2023.01.09.03.53.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/13] hw/arm/musicpal: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:11 +0100
Message-Id: <20230109115316.2235-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

IEC binary prefixes ease code review: the unit is explicit.

Add the FLASH_SECTOR_SIZE definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b65c020115..73e2b7e4ce 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -1196,6 +1197,8 @@ static const TypeInfo musicpal_key_info = {
     .class_init    = musicpal_key_class_init,
 };
 
+#define FLASH_SECTOR_SIZE   (64 * KiB)
+
 static struct arm_boot_info musicpal_binfo = {
     .loader_start = 0x0,
     .board_id = 0x20e,
@@ -1264,8 +1267,8 @@ static void musicpal_init(MachineState *machine)
         BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
 
         flash_size = blk_getlength(blk);
-        if (flash_size != 8*1024*1024 && flash_size != 16*1024*1024 &&
-            flash_size != 32*1024*1024) {
+        if (flash_size != 8 * MiB && flash_size != 16 * MiB &&
+            flash_size != 32 * MiB) {
             error_report("Invalid flash image size");
             exit(1);
         }
@@ -1277,7 +1280,7 @@ static void musicpal_init(MachineState *machine)
          */
         pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
                               "musicpal.flash", flash_size,
-                              blk, 0x10000,
+                              blk, FLASH_SECTOR_SIZE,
                               MP_FLASH_SIZE_MAX / flash_size,
                               2, 0x00BF, 0x236D, 0x0000, 0x0000,
                               0x5555, 0x2AAA, 0);
-- 
2.38.1


