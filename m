Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A659C5B272C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:52:31 +0200 (CEST)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNZc-0005K6-RE
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOY-0004ke-JC; Thu, 08 Sep 2022 15:41:02 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:40644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOV-0007C9-Rc; Thu, 08 Sep 2022 15:41:02 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso13022128otp.7; 
 Thu, 08 Sep 2022 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bVHNw7cB4ISER7GtCuYaKaI3lp2SzMEJltQRB/+3XB4=;
 b=n99P++y4H7ipy0AL3RVp4y1iEHHprjxzGbotxzQO36veJpmTCAj3ZvX0huJ5eXAd8w
 NvCrHdhFQ3nakX+6SwIIfkMV4Pnk/7Cw83XOak0t5vVS0Bz7w8b3/gM6ZKqjXX7vDqiL
 8Rc8Qsd5PrOiXTB3kwcsMc2hQ3sqOaOjL3bcKD1RSY2sdWPN4ahmuvaoVFbxffoOvnfD
 7hqh9nX5I6exiLhNEOiRa7nCnTKGODIufVGWsJ75UMeQDsvFMf9QE2GNL3oCDdIAbwuO
 Kmvpdd6xZbXtyagqEwzmUhvNEgFN2/pwPWEFqhWzaVLSAX4QFvJHSydrmSbtfQYtw/7j
 lMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bVHNw7cB4ISER7GtCuYaKaI3lp2SzMEJltQRB/+3XB4=;
 b=27S5GzwELWYetrCh7aX+Efyoa9Dr1mxiKtzA2yXOK2yQQUztyM8/KqLQxL8QN8DPHj
 KJh1rr+LnFF29fSR6WRzF2qF20aYSi+n5rjQopZV/XnBkDiO7VfwC0NcL//EOIz5ONBG
 GFVHlzUnEeGZh02mmAD/ZHPFzsDPdepg1mXwJ5HMtmS4dZlVh1Wa7j7NzyLc3kNYPGnj
 z6hMyGa+XPPFUwmnwLAQd6qDqLcNDqsMi4mT60zaDF//VEIwPsYo3NEtNPS8CgMvL/vE
 oRaqYAE+hxpAXbzdmxhNs4x/rmZDoGAZHbUSsceWuVH3ANH0uwmzgnIuZgOM/PUj7DIj
 ll5g==
X-Gm-Message-State: ACgBeo3tqjwlQPCNNY2mSYEAWMrWgdaUxD4gCqr2WkyWasp/utTxs+32
 NLtau2I6445kAhO5KZVa+0XNPehrjEq4QA==
X-Google-Smtp-Source: AA6agR62M3acqqrfIUQfO52hRrU9NbOH9Tk8L9jNxgxqvJjW9vJB+FGd1Lx4hahQcD1zkJUicMaT9w==
X-Received: by 2002:a05:6830:1bd5:b0:647:28e0:1585 with SMTP id
 v21-20020a0568301bd500b0064728e01585mr3980583ota.195.1662666058214; 
 Thu, 08 Sep 2022 12:40:58 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:40:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v7 05/14] hw/ppc: set machine->fdt in bamboo_load_device_tree()
Date: Thu,  8 Sep 2022 16:40:31 -0300
Message-Id: <20220908194040.518400-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for the bamboo
machine.

Setting machine->fdt requires a MachineState pointer to be used inside
bamboo_load_device_tree(). Let's change the function to receive this
pointer from the caller. 'ramsize' and 'kernel_cmdline' can be retrieved
directly from the 'machine' pointer.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index ea945a1c99..9cc58fccf9 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -34,6 +34,8 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
+#include <libfdt.h>
+
 #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
 
 /* from u-boot */
@@ -56,14 +58,13 @@ static const ram_addr_t ppc440ep_sdram_bank_sizes[] = {
 
 static hwaddr entry;
 
-static int bamboo_load_device_tree(hwaddr addr,
-                                     uint32_t ramsize,
-                                     hwaddr initrd_base,
-                                     hwaddr initrd_size,
-                                     const char *kernel_cmdline)
+static int bamboo_load_device_tree(MachineState *machine,
+                                   hwaddr addr,
+                                   hwaddr initrd_base,
+                                   hwaddr initrd_size)
 {
     int ret = -1;
-    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
+    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(machine->ram_size) };
     char *filename;
     int fdt_size;
     void *fdt;
@@ -98,7 +99,7 @@ static int bamboo_load_device_tree(hwaddr addr,
         fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
     }
     ret = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
-                                  kernel_cmdline);
+                                  machine->kernel_cmdline);
     if (ret < 0) {
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     }
@@ -119,7 +120,10 @@ static int bamboo_load_device_tree(hwaddr addr,
                           tb_freq);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return 0;
 }
 
@@ -163,7 +167,6 @@ static void main_cpu_reset(void *opaque)
 static void bamboo_init(MachineState *machine)
 {
     const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
     unsigned int pci_irq_nrs[4] = { 28, 27, 26, 25 };
     MemoryRegion *address_space_mem = get_system_memory();
@@ -289,8 +292,8 @@ static void bamboo_init(MachineState *machine)
 
     /* If we're loading a kernel directly, we must load the device tree too. */
     if (kernel_filename) {
-        if (bamboo_load_device_tree(FDT_ADDR, machine->ram_size, RAMDISK_ADDR,
-                                    initrd_size, kernel_cmdline) < 0) {
+        if (bamboo_load_device_tree(machine, FDT_ADDR,
+                                    RAMDISK_ADDR, initrd_size) < 0) {
             error_report("couldn't load device tree");
             exit(1);
         }
-- 
2.37.2


