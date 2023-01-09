Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6F66252E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:13:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqrD-0005yh-Mj; Mon, 09 Jan 2023 07:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqrA-0005xj-S5
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:25 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqr9-0001uW-AJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso2312923wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmB1uKPq6eeUbQCXeOn2PhOUbWdoWpaNbipdtr7rTeo=;
 b=av8OZnqqWP4e2jgZ/NumwW5XBeP283hJ5cUhHKOkiGmvYVdmsAaItK2AO9F6Qxv0WJ
 EA8Om+FFfGBtS+UMSL6+CLE6h/z+WvT5e2hF8gx9m0q1YlWZYNxWiHGHuS5xaFqanTtV
 lbbnUYKmC1hMQ/0IRk33pk7Y4nHOgNEhHMmdnEc5n5ErZeK4YXvysx0qEKMpkY7xgrwx
 876moaYMDDsbsh1Ig19lcyhMnvwF0T3pryDjT69pq7XpoVLTYv/tqGX7BokZ9Fg9KXJ0
 mTwdhN+vkxa6Kex4X7iWSZva7xabYuwoqUbATNWLOpvGB+68kRRzPq7qFXgXEiXEKnLG
 qPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmB1uKPq6eeUbQCXeOn2PhOUbWdoWpaNbipdtr7rTeo=;
 b=RE5u/IItHUBVtHvIZR65eiYH6Tlue16O5cZoNP+2fw5lffFU83cvM8RvfGF6xAozMY
 qcY5xECLDZMbAlebfKGKHdc8ikadubMbsGnoghmPN4Ks/qLQN7tmYdmOH9dC6APXpg+K
 HYR/zAOTxmYWQZmposNd9pRmPChGTBTMUrt+tD2C8UtYn3ErwQf/18PIK3v/ZWh4IHKG
 mi/MDNyLbmjJJZTQvvD3xlRN18KAyzgrZwwURamN5fak50ifGAFA4X7CEtI1K2XwVbJh
 eeaBLf8xytItQT0Q9gDAIh4s2O7cIDwvhZvH/6oGbgghdVpZfJV0ddyZeESrvr2WjSBC
 JPKQ==
X-Gm-Message-State: AFqh2kpTOO/4rgh+ReYEWGDhkrxaV86GFLPNVAlbMphMmJERDF4FJoua
 OpPw3y+estEaeyCyeY7rmx+TQPmxpZq/XWSV
X-Google-Smtp-Source: AMrXdXvSd1F0uWQi/mut6tOLGbqn6mAL4Bi8HrTn2/Hubypzs20rDRsgdJsmS83x+AEu6bSoWbPw1Q==
X-Received: by 2002:a7b:c3c9:0:b0:3d2:e28:647f with SMTP id
 t9-20020a7bc3c9000000b003d20e28647fmr55589126wmj.15.1673265742355; 
 Mon, 09 Jan 2023 04:02:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003d974076f13sm11928490wmo.3.2023.01.09.04.02.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:02:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 5/5] hw/sh4/r2d: Add the FLASH_SECTOR_SIZE definition
Date: Mon,  9 Jan 2023 13:01:54 +0100
Message-Id: <20230109120154.2868-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120154.2868-1-philmd@linaro.org>
References: <20230109120154.2868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sh4/r2d.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index b3667e9b12..6e0c65124a 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -45,7 +45,8 @@
 #include "hw/block/flash.h"
 
 #define FLASH_BASE 0x00000000
-#define FLASH_SIZE (16 * MiB)
+#define FLASH_SIZE          (16 * MiB)
+#define FLASH_SECTOR_SIZE   (128 * KiB)
 
 #define SDRAM_BASE          (192 * MiB) /* Physical location of SDRAM: Area 3 */
 #define SDRAM_SIZE          (64 * MiB)
@@ -304,8 +305,8 @@ static void r2d_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash_cfi02_register(0x0, "r2d.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 2, 0x0001, 0x227e, 0x2220, 0x2200,
-                          0x555, 0x2aa, 0);
+                          FLASH_SECTOR_SIZE, 1, 2,
+                          0x0001, 0x227e, 0x2220, 0x2200, 0x555, 0x2aa, 0);
 
     /* NIC: rtl8139 on-board, and 2 slots. */
     for (i = 0; i < nb_nics; i++)
-- 
2.38.1


