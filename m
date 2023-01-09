Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47966255F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqjI-0003EN-VY; Mon, 09 Jan 2023 06:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjG-0003Dc-P2
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjE-0008CT-Qr
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so3968763wma.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbdqJdHQkqZ1zlOSqiHVW5as1b5l8uF3BLsUWk2mkB4=;
 b=wQJgC4G+IEut3I7ha9T9Q6SCdf/ps0N9N0nBl7WPF5ylGYc2yWxv26w7MyGPgC33bX
 ta3/q8NQ5eKoWfOeSanzlghudqEb8+y/0Ik6ZwXwVPN/oSewxVhqfBCktC4Mz+2KsDrl
 uY3qf444K7xmLcdo/OaX0knUSuuLEehr4KoGug6j4PfuBZVe5x7d8Q2OwljJq5g7aCon
 tzuYnzROjvqVoa1U+kG2S1X4xarG2br2Dvk/xGrniINVcE6AuNIEU8X7INtpailCXhdY
 Vi5JICr3tMGj/O6arFa+JD7YHcU1gIxFy3W1kOCLeDJtOkUHk451hZtOLfvrjxkxIIJM
 9j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbdqJdHQkqZ1zlOSqiHVW5as1b5l8uF3BLsUWk2mkB4=;
 b=N10wZLh15qSdlrnNicMTl0UJlIPTJwtIOCkv17+j3OG/8pHHjACbpQeFcaUXtG7EHG
 XMxYC0MW2SKPu6AB8WvTDuKThODZGPXiFjcm+wrdovqXizG+ThYQHI0J3TNkDUGGBP2W
 Ave9R6ElFZCFtSjkducMOlfJ1ibh8P26VLtvWnIeRXsl/3bHHIKwMMZ+Vw0na7x+Sixu
 axSNGeHGR9ZqjV0BxEwzIANg9iRgmgSnBU8EXDl9mJulD8MaO4SoZaSg2gkGwBu5E3pr
 OeHBnJi+7ZYVzh6T0DKxX7qo2FBgD+yX1YkW2Eq4t1oyqRl96CPWiG3JPSf+YOmixa/Y
 elYw==
X-Gm-Message-State: AFqh2koBUcX5zt2H2bzYdAN3+JJqhat3uC0822Psj6wUpT7NDG9ejebV
 lbS2n6fAYDvZFqWHwy5uxXi8kyo5ECMosa4d
X-Google-Smtp-Source: AMrXdXtPlUxANQuVUhMiNlXSB/QiySO8dwO1LWqgXTyoObOt+beYWlNI5GiZSFP0UF++nPfoNw2piQ==
X-Received: by 2002:a05:600c:a51:b0:3cf:6f4d:c259 with SMTP id
 c17-20020a05600c0a5100b003cf6f4dc259mr44893613wmq.39.1673265251307; 
 Mon, 09 Jan 2023 03:54:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm17224440wmq.20.2023.01.09.03.54.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/13] hw/arm/z2: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:14 +0100
Message-Id: <20230109115316.2235-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
 hw/arm/z2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 8eb6f495bc..839be3ca16 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/arm/pxa.h"
 #include "hw/arm/boot.h"
 #include "hw/i2c/i2c.h"
@@ -297,9 +298,10 @@ static const TypeInfo aer915_info = {
     .class_init    = aer915_class_init,
 };
 
+#define FLASH_SECTOR_SIZE   (64 * KiB)
+
 static void z2_init(MachineState *machine)
 {
-    uint32_t sector_len = 0x10000;
     PXA2xxState *mpu;
     DriveInfo *dinfo;
     void *z2_lcd;
@@ -312,7 +314,7 @@ static void z2_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 4, 0, 0, 0, 0, 0)) {
+                               FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
-- 
2.38.1


