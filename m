Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96D6625D2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:47:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqix-00034o-Sw; Mon, 09 Jan 2023 06:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqis-00032h-K2
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiq-00085r-Vw
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:50 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6464827wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d549zrbSVj2+hdi6d6L6mPBf616eqZGm0GWt6kYTTIs=;
 b=QGsKjWi/U6qI6cQcswl5uKfo4M3xmsY6vSuTJenV2Lvaoxr4JDdW8MNWdHXgn4vcJ5
 QS/DTveG8wha0+2NM8v/JNF6L0ozrLKkOcgV9FrqdT2lB82HfuwOTdlPyfQMBJHjSv7h
 EGj8rC+5WmJMhZDWtmxAgPKOYfXzIQ3xCVozuVLfh0t5Wyd18BT29BQ/xOGR/bdWgX+T
 8YH33u72FcAj0HV5O5ohPCybK9irLqMRb39IUl8nGUJAXfMBd0tPh6VPEOXD6MzXkrfn
 06LHtOOd9qp+IBI3hzWdYQ1940l/ZAgdhK7LntXOZi+tBj2DTEC77jzWAO234CABDLgM
 4ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d549zrbSVj2+hdi6d6L6mPBf616eqZGm0GWt6kYTTIs=;
 b=hwX07fWwCjd8gXU5oESljD5pT4ly5h+xG82s8m2VWixPbqj53Pgzq34GKGGBPJgf0j
 cb681TfEX55pTAykyewQ1tEfWpwauP6tpGypHMdewf5noWsWoxoplFRnFg/MKN4gi925
 zFIAMStl1O8BbrhOvplXZPwtkCH41PHyUeBe3ThaquStbW4ImM0osXgLVZfYL8K5I1Ny
 5Qulk/DLJ9ZqahpMcn6MMy9r2VBBecJ+dX2zb/ynLdhGloT7Pu5Jbtc72Kn89F3fxa43
 mPeigaiyV/UuIsIjRj6DcUF1zPLh0YTc58xBH1SMfbIEJso+iOQL++obhmTMfO78+pFV
 Wc6A==
X-Gm-Message-State: AFqh2krsJGSetmjdLOytrNzDoLeW9iXiBSsuaN/9dJq6S0UMTzuF3lGp
 qyOxzUqkUX1Uq3Ui1fS9Xpnv52tPi0UJQT5P
X-Google-Smtp-Source: AMrXdXt+egGy0UU0MI+eRr8B7MeAODF9TJL76o84FOjTnxrYz2j4p4/L9OjtPRDo41+fevQY2pPMDg==
X-Received: by 2002:a05:600c:3491:b0:3d1:f16d:5848 with SMTP id
 a17-20020a05600c349100b003d1f16d5848mr46707787wmq.26.1673265227376; 
 Mon, 09 Jan 2023 03:53:47 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a05600c491c00b003d9bd56e9c1sm10568885wmp.11.2023.01.09.03.53.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 06/13] hw/arm/gumstix: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:09 +0100
Message-Id: <20230109115316.2235-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

IEC binary prefixes ease code review: the unit is explicit.

Add definitions for RAM / Flash / Flash blocksize.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200223231044.8003-3-philmd@redhat.com>
---
 hw/arm/gumstix.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 89c15bee75..579d363577 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -35,6 +35,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "hw/arm/pxa.h"
 #include "net/net.h"
@@ -45,17 +46,20 @@
 #include "sysemu/qtest.h"
 #include "cpu.h"
 
-static const int sector_len = 128 * 1024;
+#define CONNEX_FLASH_SIZE   (16 * MiB)
+#define CONNEX_RAM_SIZE     (64 * MiB)
+
+#define VERDEX_FLASH_SIZE   (32 * MiB)
+#define VERDEX_RAM_SIZE     (256 * MiB)
+
+#define FLASH_SECTOR_SIZE   (128 * KiB)
 
 static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
 
-    uint32_t connex_rom = 0x01000000;
-    uint32_t connex_ram = 0x04000000;
-
-    cpu = pxa255_init(connex_ram);
+    cpu = pxa255_init(CONNEX_RAM_SIZE);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
@@ -65,9 +69,9 @@ static void connex_init(MachineState *machine)
     }
 
     /* Numonyx RC28F128J3F75 */
-    if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
+    if (!pflash_cfi01_register(0x00000000, "connext.rom", CONNEX_FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, 0)) {
+                               FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
@@ -82,10 +86,7 @@ static void verdex_init(MachineState *machine)
     PXA2xxState *cpu;
     DriveInfo *dinfo;
 
-    uint32_t verdex_rom = 0x02000000;
-    uint32_t verdex_ram = 0x10000000;
-
-    cpu = pxa270_init(verdex_ram, machine->cpu_type);
+    cpu = pxa270_init(VERDEX_RAM_SIZE, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
@@ -95,9 +96,9 @@ static void verdex_init(MachineState *machine)
     }
 
     /* Micron RC28F256P30TFA */
-    if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
+    if (!pflash_cfi01_register(0x00000000, "verdex.rom", VERDEX_FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, 0)) {
+                               FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
-- 
2.38.1


