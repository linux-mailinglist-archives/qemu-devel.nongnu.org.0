Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5A58A92C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:03:35 +0200 (CEST)
Received: from localhost ([::1]:41454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuB4-0001XJ-Hf
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoT-0007Xe-3F
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:14 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:45847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoR-0001eJ-I2
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:12 -0400
Received: by mail-ua1-x929.google.com with SMTP id f15so823648uao.12
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3T43QlQibN7vdNRHwhh2Sn7d+vV3xA8nJznfbZuZtAo=;
 b=Si6eyF7mClXxSF8DlpMjf/Akk6qIZyKSTI13kwWZoZs+eOz00XBe7MkCUMq/BfaoTE
 V3W87XhqOk62bSU484KthpUJvs4Paxj+8OyISzCGuiFyMXfx6jsVd2N+zxc8pssLi7NT
 d72rDwWmAH/kYpqEo+7HFq2N4PGn4iDYue1sCiXIsXRLdnUTclqSfQiDYshMjewrNVkY
 lUrjTWjAu51cdnpr/mx4Ir13r5cKGWkZ83QZxeQI0XkyAJQDoAFkbozHiGDzzDESPn86
 +qOmXregxLcHd1RIRGqMdh0B8lzMlHFc9yB451Vt0NzHWo+sGiuThZ9S3tzgRbqrOOhc
 404A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3T43QlQibN7vdNRHwhh2Sn7d+vV3xA8nJznfbZuZtAo=;
 b=JYvxriDL80yTmaG4KejZYueHszKZ+J80Thk/zzFhmfzkTfbSffqf+YV+lVJGQu53ta
 SjGwgGQ6vpoj8aisq2zMBqxhnwpYZMogSBw9yfOBRz1IK/Q0cBNA+dijfONCg0DgfakT
 o2dqBCO5Qi20qFut0F9f98t6OGKWK7BbVuCKYpei/kztiJSsIFSzgNkqdALA32SPjt2A
 ap6+v2m0kpbLjgwHxdRv6/IEST7KYwIC/yaoEvYvpWTIMv3eCcmi/ENGc2PqX+Lq4kYD
 QLfCKXjd6LIrg+Tq735ZRsori63LhiFCxG0y3PgOZWCtZ40SKP+hUXLWrdjAn1j4C7Fh
 Y6bg==
X-Gm-Message-State: ACgBeo3tGxh3CDJ0Tx7twuunf3uwKn79674K4hRU9DDA9QDbD9TI3jtT
 Ekwb/9ZsrZYIa66VGe0+R7l2clNvVas=
X-Google-Smtp-Source: AA6agR4XiiWYo/MVxI096pD2elrWqRIVAYIs64AEeIR0eU1aFVxLGetn/eLiWd8U+Mwj4WObYW8fXA==
X-Received: by 2002:ab0:764c:0:b0:386:3e8c:4c7b with SMTP id
 s12-20020ab0764c000000b003863e8c4c7bmr2735357uaq.17.1659692408433; 
 Fri, 05 Aug 2022 02:40:08 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH for-7.2 v2 07/20] hw/ppc: set machine->fdt in
 xilinx_load_device_tree()
Date: Fri,  5 Aug 2022 06:39:35 -0300
Message-Id: <20220805093948.82561-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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
 hw/ppc/virtex_ml507.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 53b126ff48..ed1d37486d 100644
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
@@ -197,7 +200,15 @@ static int xilinx_load_device_tree(hwaddr addr,
     if (r < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     cpu_physical_memory_write(addr, fdt, fdt_size);
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
     return fdt_size;
 }
 
-- 
2.36.1


