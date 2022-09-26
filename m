Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469615EAFE3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:29:10 +0200 (CEST)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsqr-0000iK-D3
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4f-0008D1-Kx
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:30 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:35829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4d-00027V-Vq
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:21 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-130af056397so10189211fac.2
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PQwNaAWzRAki7GfolZmwjwDqddgZMgGlGNagZSKFwBQ=;
 b=E5L65JdL+i1LM1HvvXd46zY30Oot+WAfHOa4qgOXZbHalqovhhuBeyeAB7OnEH1Co9
 YruJ0g+X2HvJ3nEW7du7rihc/dUmTfxfehbxXG35zZiZnF036wkzyurnCA4FldgqRqJI
 dfraewAjyS2oMWMtcesOOjlc8cDamSqoWuxAtAvrtve1PFkqiVQYVsRHdG5heidT/VJ4
 Cd1L5peu9o5ANQkDXY6z92NWgVaZ3xFmlpnX3mrDwBBwm5WLWAjP7BiS95IS8bNUG0gj
 RR1sFMmqaww24H53BINW/PEdbdnQsZ44UBsmtlXw3n6ZRSbem9tZZdtgwUhiND0xBRT4
 J/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PQwNaAWzRAki7GfolZmwjwDqddgZMgGlGNagZSKFwBQ=;
 b=TDOYRa1sEPp9MFIENaNhp8nsmbZlLoOBHAKf9KXZ7lMlWKNSLxhDUbt8E/pKl7svNl
 7WUmNTQYWbLI/U7HqhpoKdEGNvbWoPeuZIRyZvZDKQDCUPkHgq+igFEIQCYOLI6JhFi3
 sjElmxhKRT+4AD8dSORV3ekd6F+UtwGUVoybBnfGyTSAjrJ5uS73vdV2T1Uo/EBp4mQe
 QgxtzCY7ANGGn3VMCe8n1KN1FS2TihwgVNfqNAhuZ2N6sqrveygocniPlkGD6m0AlTQ2
 WVYh3UzjlzdrBPWG1s+W8pkpNtFqqKqDhrtsxl/hcpJfNlxaXhyndVDVGLrnUzoHBMFL
 UooA==
X-Gm-Message-State: ACrzQf1Mof7gZe4wBqtqL1HZS3ldH76LI8cgDyWk0tAvPhnEuA9JDk1A
 Opo0erev8RlIzJerOAxuUG/3d4JCmI4=
X-Google-Smtp-Source: AMsMyM7NhsRBSpQDTw1cJdsr3WizN9zcQlsEw0UOhqncaeTRqQ1lCj5kpLx1smJtaSBMPN0HEbqXAw==
X-Received: by 2002:a05:6870:3392:b0:128:828:5ec4 with SMTP id
 w18-20020a056870339200b0012808285ec4mr19145243oae.99.1664213958317; 
 Mon, 26 Sep 2022 10:39:18 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v8 08/16] hw/ppc: set machine->fdt in bamboo_load_device_tree()
Date: Mon, 26 Sep 2022 14:38:47 -0300
Message-Id: <20220926173855.1159396-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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
2.37.3


