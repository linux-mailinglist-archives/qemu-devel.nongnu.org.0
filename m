Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99C5AC129
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:37:57 +0200 (CEST)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUYxo-0004Et-MZ
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuc-0006Wm-Pm; Sat, 03 Sep 2022 15:34:38 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:42958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYub-0005MA-6V; Sat, 03 Sep 2022 15:34:38 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so3691516oti.9; 
 Sat, 03 Sep 2022 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YOFZ9NdiFBAa9F2Aq+WCsRHWWt7d567/X2aplHJ6aKE=;
 b=Kna+RIN6/TSYfqv0Gx1ltRKmcNvF+byiFVONNyLyLkdCUPfSaxVFd6PqXeTPY2Ylv9
 8Ih7bC7cbXj7Z+Hcn5PhMbkIH8JDuoVl5gtgA9ooZEtHu9wOTD4hIw+3WgATlguWXWbT
 fugLNHObj9v7/EY15Dpem7u5d7SdxUxEb5KLJeIYHgKGtc5X2xgAuySzUCrIzMDA0NHw
 Z9qJVAxAn1/0CN5W5PquLU21jZnPXOUyAe2rQyIxs+z7rubjdaY0Y+s0vYvwPbz7O4/Y
 xOeqvdf278vaRzytwPC6Ic5xceCJ9ORqtCP/Xb1tr2NtECxaQ5Uujiagest9s8pAnLgM
 z9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YOFZ9NdiFBAa9F2Aq+WCsRHWWt7d567/X2aplHJ6aKE=;
 b=o1VPJkA5WcR6Q90I0t8VdmY6k0Kgo8kcznNW3XgtHdJ5ZDm7Us9kYC7kf0cAj5fWbx
 +ahoIW+omWrdIsxxdidkPKowd4NBoizbJ1qKIz4qVjzDzk61nlxnXhU/OB4IgcE2w7h9
 4ASNBqkmx4kYTQxoPCBk0EQJCaVT8v/Vbq+T/0TIv6HcjF1W0AZzxnJR0BZ2zZ1yvCB5
 /JBFy03qD/+HDPeB7aUakyuVG2oQzPidjnWlSTmvieXo1LvSFoqimQEdMFziccYu64cx
 ekFgY330N5luA+AXKD+utqreT1FETG2NBdrza6uuVO9bI306VZZHrPr8AbpCG2WteYd7
 282g==
X-Gm-Message-State: ACgBeo2hKypUx+5hIgdN8qQ79eJRglz1V6C2Bwi6xOd3k2MjTrAOY2NZ
 b4BQLK1sUZvpIUq4RZ36/DifhHVPspyQXA==
X-Google-Smtp-Source: AA6agR6OkvU1+DQY5EgezvmuQrNmZilCT6PO5CWQBCa/CWd3vvumdVJSAGYDD/D8YA5QTTbGYFlk3Q==
X-Received: by 2002:a05:6830:1496:b0:639:648a:55f4 with SMTP id
 s22-20020a056830149600b00639648a55f4mr16424672otq.370.1662233675684; 
 Sat, 03 Sep 2022 12:34:35 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v5 03/14] hw/nios2: set machine->fdt in nios2_load_dtb()
Date: Sat,  3 Sep 2022 16:34:09 -0300
Message-Id: <20220903193420.115986-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for all nios2
machines that uses nios2_load_dtb().

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/nios2/boot.c      | 8 +++++++-
 hw/nios2/meson.build | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 21cbffff47..b30a7b1efb 100644
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
@@ -113,7 +116,10 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     }
 
     cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
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


