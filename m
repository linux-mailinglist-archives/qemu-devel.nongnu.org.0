Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A295B596161
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:45:27 +0200 (CEST)
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0d2-0000VV-7f
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Su-00052G-Gt; Tue, 16 Aug 2022 13:34:56 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Ss-0002OQ-W9; Tue, 16 Aug 2022 13:34:56 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id b81so5533331vkf.1;
 Tue, 16 Aug 2022 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=p2jAW4es8iU3F2bEOcgcbET+++QHlirQwEQQaRm1MtY=;
 b=JUQc1cLK8XOXBf6sy4bNGff7sb3qA2Se+FXZwm5FE9GloRBtY40vNLyHLoWM3RWwVm
 28r4MG6KlTMZ3cDOlYcWs2S9zbl+U6g+JyS5N7uYEzLncTegdeQkambgdMk89FMHYZDk
 Caz2NW6Z/U72smJY6+kkpkOiWsVWerBnnt0geuxbzoq3LEQUJosqyJdgjqnDBPwq7bUx
 2zwSB9au7rNyI5YqMZif7pE+WsDKH6Niqw2be6ZHTaYgU8gOIAzzjlK2Cdx0t/lRJUPm
 lhrxyduukLf73zog7XrIQ9SQHtN2teOBsJerT97Z9GgfvHbONAT7DJ/mqsf2vcLDZC9D
 j4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=p2jAW4es8iU3F2bEOcgcbET+++QHlirQwEQQaRm1MtY=;
 b=jaK5jxOsifYpoF4xM30EQlx6DGD7kW5wsu2gy/0/JtbkMg86tO39eC5siq24OkbDqP
 prPtw4C8cgbW5TFLyBLCsVyf9LKKiQ6WmnDFmfHgNN0klWG69TfiaUxBTLQRi0/23xYR
 unJv/ePQ2/OdKjhpKsofilGBUJXxXMKmXjewho9kELIXMpElaky/PeeIW714hhu1YA+H
 ZNTkSc956FiHSyQUXeRpAHEsH3cqAcK7o4YRzR4gXXVwi6AJL4YkM16aVV4Mm23K+p5a
 qatrbb9sTQ13r3fEpkWzn2ma4kJ8RPwyIg3bAJ87VLd9nznU4W4a0ySjDWZwHZ1OOKDY
 SLqw==
X-Gm-Message-State: ACgBeo0LcYO+XTQEyeHa0RFgNbilCnG8DIJPaQG53hO2lEfPpMhFlN0l
 zlGOOzraWbHiw6muLAIP+hJ09BedayJEbA==
X-Google-Smtp-Source: AA6agR5Z+WIUQ5ng5VDwD7PSXf0AsUgk0NxvVnzfvR/74QwlsHfqx9hfF6t61L8buEedsxqZebwAZQ==
X-Received: by 2002:a05:6122:179c:b0:37a:5584:25e1 with SMTP id
 o28-20020a056122179c00b0037a558425e1mr9161649vkf.39.1660671292534; 
 Tue, 16 Aug 2022 10:34:52 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH for-7.2 v3 07/20] hw/ppc: set machine->fdt in
 xilinx_load_device_tree()
Date: Tue, 16 Aug 2022 14:34:15 -0300
Message-Id: <20220816173428.157304-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2b.google.com
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
the virtex_ml507 machine.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/virtex_ml507.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 53b126ff48..9f4c5d85a4 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -45,6 +45,8 @@
 #include "hw/qdev-properties.h"
 #include "ppc405.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC    (0x45504150)
 #define FLASH_SIZE     (16 * MiB)
 
@@ -153,6 +155,7 @@ static int xilinx_load_device_tree(hwaddr addr,
                                       hwaddr initrd_size,
                                       const char *kernel_cmdline)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     char *path;
     int fdt_size;
     void *fdt = NULL;
@@ -197,7 +200,13 @@ static int xilinx_load_device_tree(hwaddr addr,
     if (r < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     cpu_physical_memory_write(addr, fdt, fdt_size);
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
 
-- 
2.37.2


