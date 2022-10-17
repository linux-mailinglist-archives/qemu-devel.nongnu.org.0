Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A87601804
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:48:20 +0200 (CEST)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW5z-0004sR-5p
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgO-0004Ul-2X; Mon, 17 Oct 2022 15:21:52 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:38811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgL-00032W-Ow; Mon, 17 Oct 2022 15:21:51 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1322d768ba7so14399253fac.5; 
 Mon, 17 Oct 2022 12:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uE46D1eM38wkpxmdWgJhMdWVqADBGwfhcqV9MKpgkZQ=;
 b=DdqpNKlDkhFQh+FdAT1YjuPCsYhwY216bxzg8Lr/acf0lRFWzGfUTo/wCi2ryu/atg
 hlggaOuJlrmJ1lqxNuDYjZ0QL8yuY66dUfWkshp4s1OS2Vn369CFhI+Voh2UFZpwFA1O
 ar49q84h7QPy/QhctGvT21+FnpiVq8EJnmkBk1VAlJUvKPhpVRGdH+d/P7ppRddKdk1w
 U2w3gz28Bqu2V2Wa+tBhQCXF9SQnIbZxNPaEkIiErvHs4rrXzDhEBxYC6ZKyaK6GMVTI
 lDtKJlryW7PzqUWVxdrS1Q/hmj/tDCxcCn5Qdc4msp1VVWs+fzP8RJ2D7Ryu1wbQj1iW
 rv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uE46D1eM38wkpxmdWgJhMdWVqADBGwfhcqV9MKpgkZQ=;
 b=Jb3OZfWZUzL4+fE8ZcvdOkARoehUwbBpDOqY4d52HrQjab1HKOihUDL8M68FE/1Z6V
 4+dL5Yq9UGEfCrL7StIaX0LwZClyUXToCtYE9DZD+lQVfsC976/UaPE6rWUvCH7778R0
 nmB77FocvhEkH9N2bK+0Ngjsqw+qL4FUZxb8kjIjGk1mwjGtQh0nWmQot6y6/M3GonX1
 eGNzp3FX8IyY7KKqTPCsavjOFrZzV1OPjoTe47mIzTmcOFjAuiHL33BPlXA6dloqbEWK
 +tmty6l3mgHeV1vmH30Yvo/WTWh5Y81C9LfD3wtg6Ux6bro27jxBhw/ozpk62NxGrbAz
 wgyA==
X-Gm-Message-State: ACrzQf0aEw7xsYHqik0livMtU95gnROsjC2Wd1mlIEcno/f66KG560g9
 h8V5m2MrTzJXt3z1cB7HtfQtk3P1ADA=
X-Google-Smtp-Source: AMsMyM5VU63Uwn/1jlG+xn2+g2YuoCbrwn2yPB/1yDwmtTg7jiDM4Sa/R3gJmSk9KIjJPghFJv6MWQ==
X-Received: by 2002:a05:6870:785:b0:131:e39c:9140 with SMTP id
 en5-20020a056870078500b00131e39c9140mr6522682oab.261.1666034507240; 
 Mon, 17 Oct 2022 12:21:47 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 33/38] hw/ppc: set machine->fdt in xilinx_load_device_tree()
Date: Mon, 17 Oct 2022 16:20:04 -0300
Message-Id: <20221017192009.92404-34-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for the
virtex_ml507 machine.

Setting machine->fdt requires a MachineState pointer to be used inside
xilinx_load_device_tree(). Let's change the function to receive this
pointer from the caller. kernel_cmdline' can be retrieved directly from
the 'machine' pointer. 'ramsize' wasn't being used so can be removed.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-11-danielhb413@gmail.com>
---
 hw/ppc/virtex_ml507.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 493ea0c19f..13cace229b 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -45,6 +45,8 @@
 #include "hw/qdev-properties.h"
 #include "ppc405.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC    (0x45504150)
 #define FLASH_SIZE     (16 * MiB)
 
@@ -144,11 +146,10 @@ static void main_cpu_reset(void *opaque)
 }
 
 #define BINARY_DEVICE_TREE_FILE "virtex-ml507.dtb"
-static int xilinx_load_device_tree(hwaddr addr,
-                                      uint32_t ramsize,
-                                      hwaddr initrd_base,
-                                      hwaddr initrd_size,
-                                      const char *kernel_cmdline)
+static int xilinx_load_device_tree(MachineState *machine,
+                                   hwaddr addr,
+                                   hwaddr initrd_base,
+                                   hwaddr initrd_size)
 {
     char *path;
     int fdt_size;
@@ -190,18 +191,21 @@ static int xilinx_load_device_tree(hwaddr addr,
         error_report("couldn't set /chosen/linux,initrd-end");
     }
 
-    r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
+    r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
+                                machine->kernel_cmdline);
     if (r < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     cpu_physical_memory_write(addr, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
 static void virtex_init(MachineState *machine)
 {
     const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
     hwaddr initrd_base = 0;
     int initrd_size = 0;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -294,9 +298,8 @@ static void virtex_init(MachineState *machine)
         boot_info.fdt = high + (8192 * 2);
         boot_info.fdt &= ~8191;
 
-        xilinx_load_device_tree(boot_info.fdt, machine->ram_size,
-                                initrd_base, initrd_size,
-                                kernel_cmdline);
+        xilinx_load_device_tree(machine, boot_info.fdt,
+                                initrd_base, initrd_size);
     }
     env->load_info = &boot_info;
 }
-- 
2.37.3


