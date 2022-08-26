Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B235A292C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:16:12 +0200 (CEST)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRa82-00058M-Nb
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4C-0007cR-Uk; Fri, 26 Aug 2022 10:12:13 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa46-0003ot-FM; Fri, 26 Aug 2022 10:12:08 -0400
Received: by mail-oi1-x235.google.com with SMTP id r10so2138135oie.1;
 Fri, 26 Aug 2022 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4f24mixCYIhi0sIPdZyXjyavjHpNtJ1OrG02fjTafCg=;
 b=deNoEQc1bX4txtDGMF8DgvGNBSMNw7oyM3yd91GeJEmjM7yTL4MQYTK7haU/fEF4dO
 Yqu8n5Z8V6pJF+AqEXLU+u9t7ArkCwUfv9kmzwRU3UfKekXEP8QMCTgYvEi0TC9uXfzQ
 HQ1bbjrNvyCt4xyN6P1SuO8glZSyvtUshLorwFWXF+8gKotIp76CR1N79cb+7961zBJX
 68WRN5utbX+eFs2kbCQQacqko65GXArgcTWNgWtzavHifAlGZbGE0/bcV1DTw4vThCCr
 yzj618w9vUo2lire/OjBcHM/xSm9SLe0H6wDIyH3R3QuWalSxLesvY0IUd74ZJsfi68X
 Ujqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4f24mixCYIhi0sIPdZyXjyavjHpNtJ1OrG02fjTafCg=;
 b=S+1OZe2IkeXMTyQe/peaz/hB3GT8NWo6xO6Y82Tawt7+h1zW5D0HScGtGWFsLX022T
 BOSJNEEeKy5BtXV3NAz1c6tn5Gy2q0pmB8LeJFlYP0DJE0zo5XevS6UQNcinGoIUxUwc
 ZecaAFWgdwX6orides/6TTm9by51aP2AdI9JrkaM0d3BCzZXDmvBlUnIYpsrv4yb+NE9
 dte5lZu611DPgxpc9Mcc1PJFxHXzJTPnstXMv5+pwU4IPHbJfCHm8FncFKx2HRZ8oQEr
 YYie6EbBhLvWn2IlxE4EFsQrkWdyin1mQvKZ31HljXEx0QGn91OSuE158e4/aBCu9M+d
 nvgA==
X-Gm-Message-State: ACgBeo2V/0+JFkPf6diXdOVSuy28Cr2K1LnOyTVan1SCSC4Y986TPvVp
 ivw1p311BarhPF+92Fy+SmaJcoerqNg=
X-Google-Smtp-Source: AA6agR511igfyPU1kJgocYi2Fz+hrKdiAYiXcW5m2D0n0m2IhT+tM3C4zvxfsxycpt0fLsKLMtlC1g==
X-Received: by 2002:aca:5f03:0:b0:343:8774:d67 with SMTP id
 t3-20020aca5f03000000b0034387740d67mr1691942oib.9.1661523124844; 
 Fri, 26 Aug 2022 07:12:04 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH for-7.2 v4 03/21] hw/nios2: set machine->fdt in
 nios2_load_dtb()
Date: Fri, 26 Aug 2022 11:11:32 -0300
Message-Id: <20220826141150.7201-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
all nios2 machines that uses nios2_load_dtb().

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/nios2/boot.c      | 11 ++++++++++-
 hw/nios2/meson.build |  2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 21cbffff47..db3b21fea6 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -43,6 +43,8 @@
 
 #include "boot.h"
 
+#include <libfdt.h>
+
 #define NIOS2_MAGIC    0x534f494e
 
 static struct nios2_boot_info {
@@ -81,6 +83,7 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
 static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
                           const char *kernel_cmdline, const char *dtb_filename)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int fdt_size;
     void *fdt = NULL;
     int r;
@@ -113,7 +116,13 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     }
 
     cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
diff --git a/hw/nios2/meson.build b/hw/nios2/meson.build
index 6c58e8082b..22277bd6c5 100644
--- a/hw/nios2/meson.build
+++ b/hw/nios2/meson.build
@@ -1,5 +1,5 @@
 nios2_ss = ss.source_set()
-nios2_ss.add(files('boot.c'))
+nios2_ss.add(files('boot.c'), fdt)
 nios2_ss.add(when: 'CONFIG_NIOS2_10M50', if_true: files('10m50_devboard.c'))
 nios2_ss.add(when: 'CONFIG_NIOS2_GENERIC_NOMMU', if_true: files('generic_nommu.c'))
 
-- 
2.37.2


