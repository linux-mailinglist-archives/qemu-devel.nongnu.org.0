Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA19B5A2935
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:18:22 +0200 (CEST)
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaAA-00084r-2j
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4J-0007zl-96; Fri, 26 Aug 2022 10:12:19 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:42666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4H-0003xq-L2; Fri, 26 Aug 2022 10:12:18 -0400
Received: by mail-oi1-x229.google.com with SMTP id p187so2105301oia.9;
 Fri, 26 Aug 2022 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=p2jAW4es8iU3F2bEOcgcbET+++QHlirQwEQQaRm1MtY=;
 b=AldqHu+ZcvkJjfd/nkQiUs/jJsC+90rC5V8PTKJ03bZzAmmHqM7bvR+W7QimrF9xeV
 mnkiez97Qw9JxRJMzRUCUxl0cfixwJz8vrORTLP5SfTOguI4EBn9Mi+6EiurLy1IwewZ
 M9+KDbKvVvrsm4WHlnjN1qManQiU5Ci99TQ+UaW66zupNRD2eY0+myQ3DigOinzXH02h
 Q3FnQX7EMlRx8Xv9zTbllhAn/zKkvUJ37yIWAheuTrGvPFG6Hip0SNbYPscNNTrPM3Ar
 VZywOTXWsYOuqIxWjEQepjmRgbzzliD8RbSHx0TeIXkfN/IPyIoIBgm/tpyYFpFgq9Fr
 2mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=p2jAW4es8iU3F2bEOcgcbET+++QHlirQwEQQaRm1MtY=;
 b=HE8MOrsINW+mrPMSbEUmtuzeJHenkLtAjiSeiCNRV0jjRs4V167ORiEI/LI7kXX/df
 uDL07uucl79JKFmAuiIMS3VY0hMb1RZJsMME6QYAkNBgbwETsIVRjCBvAfcAa/gfCkN2
 pFlXUoiHcZqU+VSbxvEeHoidAa9VkZGhdXFsFEwTTRnd7ubNWWsmJlFd5rpOAbROiTQI
 Zldal7gIjmtYoHgt5YVw0gn0vSGK5pfj/0OMwDUt71jD+lqJOP5gyy2ij7eeMzuSDCRe
 730/D0+96O8pL2qG0xH0Ns+ZFsk7o/HYaBpbZHLyCODZAKunEWKlnsscLGp3TKo64cRt
 GrTQ==
X-Gm-Message-State: ACgBeo1ptLhI7wJLKYmirTUm5sSEPx3m8olPd+BBTZFbosnvqg8wiTGO
 Qs9Zh1uio5maA4/Y8YCEf8KE4uzdW4U=
X-Google-Smtp-Source: AA6agR5Q8PA0805pAj8f4Vz2O+HcKQXmuBZcqU3RdudnA2NZha6wrj6KLiKF8U6ixIFqz8ouo7UWNQ==
X-Received: by 2002:a05:6808:1687:b0:32c:3e3e:89b1 with SMTP id
 bb7-20020a056808168700b0032c3e3e89b1mr1716221oib.60.1661523135827; 
 Fri, 26 Aug 2022 07:12:15 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH for-7.2 v4 07/21] hw/ppc: set machine->fdt in
 xilinx_load_device_tree()
Date: Fri, 26 Aug 2022 11:11:36 -0300
Message-Id: <20220826141150.7201-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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


