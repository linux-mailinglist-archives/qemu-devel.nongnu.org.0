Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274C5EB0C8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 21:04:17 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octOp-0002eY-AH
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 15:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4k-0008DD-8z
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:30 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4i-000282-9x
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:25 -0400
Received: by mail-oi1-x232.google.com with SMTP id t62so9091599oie.10
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=w8c//muqcTEKcBCgpj24TLMklLW+HqPlgSGVutxb0Hk=;
 b=MvbVeqjratIsIgxocqq2IW3jUtw5bnHi6Q2W6l31wmFMqA38PPDbSLwIIzR3f9XogA
 wpJkcLcsLl71OGaF4/4lNmKWtMrGW0SDkuYONBmQUbFD0l/2t5R0oV3IZdcJWw8dPG0b
 9ytk3nd1DJlwfmtm7Itb4aRKc90IchU+asvr9xtYkJLTbCYvd5miKKL8sAmTm1Dv2x/8
 vdagwyAYAHPxSZG+ElUihJjSjx88SW4dYtsn66GuhdYaR2jeUh+hsoCXMQzWjK6mJsdM
 tYsgtSSbRtaJUG8Di0C66rqaBsfHXkksbT6cySjyA9PDeIk/lg8Ks0AcALfX1+e6iIWH
 A98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=w8c//muqcTEKcBCgpj24TLMklLW+HqPlgSGVutxb0Hk=;
 b=QOanAiOEtwQrw+zAiPXSDtzRF4X36YAR/1VZiEu8IRPrhmDHvLtj+5hpD50n96ipSL
 +FKpMdAZeTfAv3LW8eqJM8yGiKdFjkDjmeupp2m33viNXxRyBh84CAySuAEcz3ZH0H8k
 qz1Fdv87YIDGwZ9nUAwSH+H523nlvxKuE3xuMaVnYz5i0yqGdpu8bzmKpP4DnAg8Wp3/
 ew14upaXwz7zmSAwYy0w4QeEAQ2KazfsWPq5XH9lMQ78xFuYOJV+iMeG65RT8usT0Dgf
 mmyz0slaO78WpZZte2TVJYnyPZ/7l1pDueq18F29eIzpkzPih+5T64d9oBAPswQFaGdH
 DGUA==
X-Gm-Message-State: ACrzQf3+rtdJQi7a8TOtuILtfKARUHwuf9y2cBQ2MO6LXhEJ/tXljIf8
 extcMgWz2IkGwjCsrbLLc8G/c5GT/ho=
X-Google-Smtp-Source: AMsMyM55ADsJYevpmzn49jKt1GA47XSWmevtV4zXspmN8Ra2C4GBxgS59Dq4UQfCMaA6c/4kmlYWyA==
X-Received: by 2002:a05:6808:17a6:b0:350:92a3:1547 with SMTP id
 bg38-20020a05680817a600b0035092a31547mr10915637oib.177.1664213962305; 
 Mon, 26 Sep 2022 10:39:22 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 10/16] hw/ppc: set machine->fdt in xilinx_load_device_tree()
Date: Mon, 26 Sep 2022 14:38:49 -0300
Message-Id: <20220926173855.1159396-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
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


