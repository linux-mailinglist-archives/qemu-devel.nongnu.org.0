Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A80358A8F5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:44:05 +0200 (CEST)
Received: from localhost ([::1]:39630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtsB-00051H-Vv
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoR-0007XW-Nj
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:14 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:46623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoL-0001dv-4r
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:06 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id x125so1887643vsb.13
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uLt9f+oI98zp3DoKsiJNFo6UPLW/Y2fHFdx+FVb33A0=;
 b=No5L0X3P6ysVQpYkQI5G49yMiFPb+7WYddd49LLCYoeUZCNPJtRqyQ3mi5boMX5nwe
 EgyNJkOjAYqZ+aADHKA5GUMBtFkOLfVP1ym/kDoXqH6ny+U8gdHcSLKGjzLDf20F8UZm
 Kbh1jF8IExAWip2RCZpjC9RxwvV4XgSuIsu4JEYY7qDrrG2UiGXV1GG92ieMZ8nvWd1j
 W5MCuB0FSmc+XzgFM0BugQDkfXP+YU4mEhTav7yNInyPjPf2h+J7sU2BfWo0t3tOw8/P
 LO8N9CEvvleMKZG18O4VP2SxxjY+ZIQL8T12ZjgTaR5e4DYkbbwtCsNYdYF+4FgvrmJp
 V3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uLt9f+oI98zp3DoKsiJNFo6UPLW/Y2fHFdx+FVb33A0=;
 b=pv12rgBR9hJ05pFoRyaRbjjdiUb0cIOGCGuq+ofcqmFM2lvTNjOWHrNKv8t9JRq19U
 SEZftga+/3I3vFYOfZhwPrNDIonbcco51I0yJ/A8Y/y9b8MCy4DT6ul28PNAKnqnz8yL
 RleuMLvEJ6vIWvPHUYwlNx1IyTL8iI2+9VwYcE+muZIVII9xvhdtxKRMd2YBVdNXaDWU
 DtfHRTB6PKWE1ng4d3XS3IEcnJpwKz3JVDzGOAJHCFuiAF7pk1xe4kFCXf6TDkryP/9N
 75dMgsHqKxlJ8xJZo6lbVDT+mGtZflBVPNqEXI0VBi5nGxNuN2BfN8se+8seCd/rk4MD
 oFcA==
X-Gm-Message-State: ACgBeo0okvBRxdr7XUklomoMDGuS3MILmVrbIQ2F8/ZjYtvKdbqhzmaJ
 rsAjTUGhHGuSvX68Ixf/dub4hM7XcHg=
X-Google-Smtp-Source: AA6agR53Ij7Suig4+yLYzAVhigSQNb5nGJm5XjO56AGqPmcPz96uG45miaStfbPw46d6iBTYuoRaUw==
X-Received: by 2002:a67:b009:0:b0:357:af40:6b7e with SMTP id
 z9-20020a67b009000000b00357af406b7emr2539273vse.67.1659692404116; 
 Fri, 05 Aug 2022 02:40:04 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH for-7.2 v2 05/20] hw/ppc: set machine->fdt in
 bamboo_load_device_tree()
Date: Fri,  5 Aug 2022 06:39:33 -0300
Message-Id: <20220805093948.82561-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2b.google.com
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
 hw/ppc/ppc440_bamboo.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 873f930c77..2ddbb1744d 100644
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
@@ -116,7 +119,15 @@ static int bamboo_load_device_tree(hwaddr addr,
                           tb_freq);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands. Use fdt_pack() to
+     * shrink the blob size we're going to store.
+     */
+    fdt_pack(fdt);
+    machine->fdt = fdt;
+
     return 0;
 }
 
-- 
2.36.1


