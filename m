Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74C5A2972
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:30:01 +0200 (CEST)
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaLQ-00012H-O5
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4G-0007md-3x; Fri, 26 Aug 2022 10:12:16 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:34565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4D-0003to-0y; Fri, 26 Aug 2022 10:12:15 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 q39-20020a056830442700b0063889adc0ddso1094028otv.1; 
 Fri, 26 Aug 2022 07:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zGRC8t5xyo1fW95WY3WlgHuvRK6Iwk7AWvSowUXHy2c=;
 b=hG6yFJW5aqv/dhiMilH5SH+/kGIiYXazwH/XIgIxksxMStTpG6P2NQjU74TAiqkwZe
 AZRDHYcMRcf1X8yLxzilRoHnyD4DY0NeGN7k8LvTV44q2bGsOOR9kSezf+nv/C+mxqAq
 JPNE7WqGKGAyMhVDZKJvgMPjQR515NHU4gcLdfm2LvxswhB4/08Z6CSsX60jP1EfF96W
 rI2sY9utY0YB1Cd53MXVu4eCt0ARM4rujz3B5cheZMVYQc77omJwfq7Xislp2NKzJpMW
 xjY3Lw8KDJbbt6sFysdix8qO5XduEDVK+dDteosn1b7Glmk0u2YP/036+l/NV0IOk9aE
 XV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zGRC8t5xyo1fW95WY3WlgHuvRK6Iwk7AWvSowUXHy2c=;
 b=MGoOBBQI+2KV+RmskgiqCbXEL65hNwqXMU7BrqBGRgQNCARDi5Q8UubneJOuva2nc2
 EzugoscY/fUvChTTNo8gphlMY5QLEHsFUoYYoyC6Nvl+NoDBv6eb6VZO8gb124MBeyix
 hJgfSnnKqGu2Zd2BsQtv0J8HVdd5Nn2sdfKjO2TvN4SL/2GByuFky+chXkxbKk2vX/gQ
 VYCRRXDJjux6QSpf7PVJF0DkJ24116gQFvDPBX52AzXrhHvoCG2xyzb4RPc+pGqAKexW
 yZkg6A+2ZO303g4FXdEgdYabybndEE0/CGwgaunPUzA3sKVh1+X/ZaGNRr+BuFFg0ai+
 MHtg==
X-Gm-Message-State: ACgBeo2qmziiyw6aiA6Jp8gx3fqQlBFbdWSMP1X8VY5sDyyJABP1WrBS
 hspE/Bhwbiw3bC8Bq5cYvM0CMDqKe4I=
X-Google-Smtp-Source: AA6agR4V9OeONoFHDNH7VoFQK1az0XEqQ8c/xariwSuBt4zxnZFX0cqTbLbulxfQh1GUzReZOnevdA==
X-Received: by 2002:a05:6830:1196:b0:638:c5ca:6265 with SMTP id
 u22-20020a056830119600b00638c5ca6265mr1423259otq.63.1661523130271; 
 Fri, 26 Aug 2022 07:12:10 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 05/21] hw/ppc: set machine->fdt in
 bamboo_load_device_tree()
Date: Fri, 26 Aug 2022 11:11:34 -0300
Message-Id: <20220826141150.7201-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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
the bamboo machine.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 873f930c77..9c89b23c08 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -34,6 +34,8 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
+#include <libfdt.h>
+
 #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
 
 /* from u-boot */
@@ -62,6 +64,7 @@ static int bamboo_load_device_tree(hwaddr addr,
                                      hwaddr initrd_size,
                                      const char *kernel_cmdline)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int ret = -1;
     uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
     char *filename;
@@ -116,7 +119,13 @@ static int bamboo_load_device_tree(hwaddr addr,
                           tb_freq);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
+
     return 0;
 }
 
-- 
2.37.2


