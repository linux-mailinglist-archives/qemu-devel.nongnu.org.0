Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE706017E7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:41:45 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVzc-0006zP-MR
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgH-00040D-G3; Mon, 17 Oct 2022 15:21:47 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:35663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgF-00031r-DZ; Mon, 17 Oct 2022 15:21:44 -0400
Received: by mail-oi1-x230.google.com with SMTP id u15so13242633oie.2;
 Mon, 17 Oct 2022 12:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgZPCKzCDA12jzgdt/RqL30yjEb1znkmp6aukBcJ0Xo=;
 b=b/YXtbA40XAbQ1GvyG+zmpwkfvGYnQTlA/FehGcpXhSdTw5JUz4hOCskTqcVssJ4+v
 fS6wYLMUxphwqkB9L4BZ4xEdH0KBJcnCKvUUxtOUpuJLNDUIhewVNoqIExK01PAK89lZ
 QNlOBz1GBkhtOZZjAS5w/VdEjujvImaCMZAjnNmFL8ZEsL1RwDmKrsJc5q60WxRzRssX
 bO9iawmCTxBAqCg6S3j5W15ZUw4qBG1hIuVvuKBBhDM+NzsDvS+Hb1JoeNBkUUAY3t+T
 PCwLSx9kd0oe3l4NS//D2AGcCJZaDvYDczHgO3wK2mGIBgY+w0tak5xMvZcKHHbdUFNF
 NvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sgZPCKzCDA12jzgdt/RqL30yjEb1znkmp6aukBcJ0Xo=;
 b=M62CytDvX5410qFNQ3kxnwu2dlm9Fr4yj7kRHz8a/B5BnPoq/ZvLCtSuIeyvwJy8bn
 XqxWDI2KiEU2LOLHybQyX45gNU24gqNdF7WBE3Zsj1O1O2Op8Gru3FeafNT2kf8VQL/f
 1mc0mXRyPTQRCeZ3kj75Hh3fLYwsF3B3XnW5u/4FNtkiSSEH+dQFSJXZFNO1KjyTSN+X
 Oe1zpom+zRoLP2uXAIvkVlylVRW314n5uSSbTW+4GLz/n/VRsVPZXpY2Zkz0NzIOowH2
 WRnFv2Oxw/7x76LDErybSCYEPaoTBCebFUY97uQpgkmAm2Cl5mTgqvguhwaUHikywfRb
 INyg==
X-Gm-Message-State: ACrzQf3fRbuSd34p+FdrZ8q2cyo3S+H6pwnB57w0i9Ujj2FXPaJtuYHm
 pqvZM4whKa9bf5lzCYGqBpLTVkW3cYs=
X-Google-Smtp-Source: AMsMyM5eyxX/M/LkRn8nFtFrZmyuldCWTnC0jzzkfEg829wgp1N3WsjUdlk3X7UC+8VkJ0wX3ljDow==
X-Received: by 2002:a05:6808:221b:b0:354:cca5:9215 with SMTP id
 bd27-20020a056808221b00b00354cca59215mr5950758oib.53.1666034501780; 
 Mon, 17 Oct 2022 12:21:41 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 31/38] hw/ppc: set machine->fdt in bamboo_load_device_tree()
Date: Mon, 17 Oct 2022 16:20:02 -0300
Message-Id: <20221017192009.92404-32-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-9-danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 56f47e7509..81d71adf34 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -34,6 +34,8 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
+#include <libfdt.h>
+
 #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
 
 /* from u-boot */
@@ -50,14 +52,13 @@
 
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
@@ -92,7 +93,7 @@ static int bamboo_load_device_tree(hwaddr addr,
         fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
     }
     ret = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
-                                  kernel_cmdline);
+                                  machine->kernel_cmdline);
     if (ret < 0) {
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     }
@@ -113,7 +114,10 @@ static int bamboo_load_device_tree(hwaddr addr,
                           tb_freq);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return 0;
 }
 
@@ -157,7 +161,6 @@ static void main_cpu_reset(void *opaque)
 static void bamboo_init(MachineState *machine)
 {
     const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
     unsigned int pci_irq_nrs[4] = { 28, 27, 26, 25 };
     MemoryRegion *address_space_mem = get_system_memory();
@@ -280,8 +283,8 @@ static void bamboo_init(MachineState *machine)
 
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
2.37.3


