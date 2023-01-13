Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8E669BBD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:17:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnE-0001AL-BF; Fri, 13 Jan 2023 09:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmk-00012I-8q
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003dg-8t
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:57 -0500
Received: by mail-wm1-x329.google.com with SMTP id g10so15354652wmo.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rDLpEGhfKq8E9A3i8kqw2MyfOYvNsDJPdKlzQIMXq8g=;
 b=Ky1clYYG9atFMCfcK2czOPvVNRML5E/i4QPoWlmYiRW0xtSz3zdZNGOfgSvJmROFPQ
 fRZRxmgbwqMHWmMXeWM+m+JrxuMtnUWG7PT87blgjZFUYWfDhxQfwfGCCNf0r7zaXWty
 nZOBwOmPG504EieXPjkj01FO74J2MBKntwkv9IkA8CU8Kw2ihmkJteiPOcxdna4YRqxj
 9N/swmo62HDPvLUixNrWORuMpgSNtJqpjyMfJR6jQQxYolWHNS4uDEpnzI4x+cN6Ez6X
 XUO3oj/PVUsEGtfskCQK8z828zaVKzWG9IMydcooWwZ6EWgcZc9BMAMfsvHh/XS3biqh
 7HeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDLpEGhfKq8E9A3i8kqw2MyfOYvNsDJPdKlzQIMXq8g=;
 b=0Q65V2GtpuOKnTOKCMawq1IZyXe+kud1DVkAiFUzZ+7QzS0fF2eb7yj/ltU0K8Ejr0
 ZUpwlDggVgJsqrb6icZULdW/57qIv2WeyQUp4DlX4+ZUR0c+2nHuJ+hgxBUyCGwbxLQM
 bZ6pqjKwlCOM3Pa7YB05Jg+hcBdMipg2gUYRIVbRL+JGkH1BQbsTYSiq8VJs414+nnpO
 l4E+9yoPVxkMKkhZfG+IqX2YJd5sk0iHT2a1hVsfLJvuokVEz5bZYMYMrVyq7lcq1Lni
 /hAzub3NwdaNXS5FLZgjaglHJ+OpLA8V0w1M8+lPJg79w5NZkyix4WSlX24tsAS2ynWw
 1s2A==
X-Gm-Message-State: AFqh2kpurEz99ZlWMx3BYfEfVH/DwXWRNnO1yTk0TbRM4PyCBZhjYGl9
 Rn94zG2h8e992/J8bgNRUedkCR08EsaRL/NV
X-Google-Smtp-Source: AMrXdXs1SSoHM+rCHzhYX17aldjEA69aKHZYFbmqA7rHD0aXwIK7mwKHx1fMrif72SyuNdHy78TxRQ==
X-Received: by 2002:a05:600c:3495:b0:3c6:e62e:2e74 with SMTP id
 a21-20020a05600c349500b003c6e62e2e74mr59266484wmq.15.1673619101855; 
 Fri, 13 Jan 2023 06:11:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/38] hw/arm/gumstix: Use the IEC binary prefix definitions
Date: Fri, 13 Jan 2023 14:11:04 +0000
Message-Id: <20230113141126.535646-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-7-philmd@linaro.org
Message-Id: <20200223231044.8003-3-philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/gumstix.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 89c15bee759..579d3635774 100644
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
2.34.1


