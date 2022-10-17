Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0E601817
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:55:40 +0200 (CEST)
Received: from localhost ([::1]:47434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okWD5-0007YC-7h
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgL-0004GD-BQ; Mon, 17 Oct 2022 15:21:49 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:33287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgI-00032A-5U; Mon, 17 Oct 2022 15:21:48 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 e53-20020a9d01b8000000b006619152f3cdso6373116ote.0; 
 Mon, 17 Oct 2022 12:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZtHb+DrXmw53WkhY99KmP9y3M7ktAz9VmCjc5WorsA=;
 b=PDQ3rErcGcBgg8fCA8GXn3aDe/Jqd8T5Bf1b35kqztgZAOiCnfgKwPPLeJdiW+46Lo
 pU677FN49vdN8y2DEqnraJuGeJ1o0VcAGKNzg1vD/sp0oeOYsFvj4xBJD2kel1xsdDEP
 A4fxzQyKuP9yotd1B5lbQmpVEyCraNfT31MDp62twFYg1gedSfRQsM4brzYIBshZUZD4
 KzW3FBNIPZBWevzXnFpYGn498znbmsqwGyLS1riVN9D9eM95k94MLyz1PW6+mm+9P/X2
 2JP7C8H/M9WUnfFXJReAk+NMmiPfNKc3UtcfHPyaYvQV/eIJxXB2RLdUZX7bGwXnMdn5
 TinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dZtHb+DrXmw53WkhY99KmP9y3M7ktAz9VmCjc5WorsA=;
 b=i2FkOrR+t05G0DN7uns2gr813IXsQjcCzwzPXVgFFYG8l+VuAXmeK/MK3YkCojkzOs
 4NWQRqCoYAcul2Kt48Zj/wWTHIwNUXA45saQ9dMG8ca3jnfDOZZrrHv0MAsBb2PxhRdQ
 bTKHtp5cWFq1Gg8sXewEIXaU1mmd8Vdq20aSz257mFod22QVQZ9PdF3Y837YGpgCY0tC
 eVGPw6KBj7PRtp/opB4Yg4///ezh33N50uf3cQX2LvCaBCrkhIRgBBEUfrcYB5kktXN0
 5Jw4NGeUYcNgnzA8nde9OgQ+u1p0mXO4hIFqzlXqQ/qvgLuepk9bN3D/YYqv7+YxC9os
 idHA==
X-Gm-Message-State: ACrzQf3mNhJ4ZdSavVTp6krLwz7YU12UNBlg7cKX28TCUd55xP+WUVnM
 efNuaQbWjWIWpffdzlNZm4zYrV/0buU=
X-Google-Smtp-Source: AMsMyM6EdEtHk4CP8+6iIf0Yma0e6YUQ9IgDNj7ATob/peXSWS79ekbh065fVLEl1UNC0IdRrP6Zbg==
X-Received: by 2002:a05:6830:22c9:b0:661:a946:3055 with SMTP id
 q9-20020a05683022c900b00661a9463055mr5997983otc.8.1666034504572; 
 Mon, 17 Oct 2022 12:21:44 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 32/38] hw/ppc: set machine->fdt in sam460ex_load_device_tree()
Date: Mon, 17 Oct 2022 16:20:03 -0300
Message-Id: <20221017192009.92404-33-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for the sam460ex
machine.

Setting machine->fdt requires a MachineState pointer to be used inside
sam460ex_load_device_tree(). Let's change the function to receive this
pointer from the caller. 'ramsize' and 'kernel_cmdline' can be retrieved
directly from the 'machine' pointer.

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-10-danielhb413@gmail.com>
---
 hw/ppc/sam460ex.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index f03cdc9ecc..4a22ce3761 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -123,13 +123,12 @@ static int sam460ex_load_uboot(void)
     return 0;
 }
 
-static int sam460ex_load_device_tree(hwaddr addr,
-                                     uint32_t ramsize,
+static int sam460ex_load_device_tree(MachineState *machine,
+                                     hwaddr addr,
                                      hwaddr initrd_base,
-                                     hwaddr initrd_size,
-                                     const char *kernel_cmdline)
+                                     hwaddr initrd_size)
 {
-    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
+    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(machine->ram_size) };
     char *filename;
     int fdt_size;
     void *fdt;
@@ -163,7 +162,8 @@ static int sam460ex_load_device_tree(hwaddr addr,
     qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                           (initrd_base + initrd_size));
 
-    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
+    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
+                            machine->kernel_cmdline);
 
     /* Copy data from the host device tree into the guest. Since the guest can
      * directly access the timebase without host involvement, we must expose
@@ -200,7 +200,9 @@ static int sam460ex_load_device_tree(hwaddr addr,
                               EBC_FREQ);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
 
     return fdt_size;
 }
@@ -500,9 +502,8 @@ static void sam460ex_init(MachineState *machine)
     if (machine->kernel_filename) {
         int dt_size;
 
-        dt_size = sam460ex_load_device_tree(FDT_ADDR, machine->ram_size,
-                                    RAMDISK_ADDR, initrd_size,
-                                    machine->kernel_cmdline);
+        dt_size = sam460ex_load_device_tree(machine, FDT_ADDR,
+                                            RAMDISK_ADDR, initrd_size);
 
         boot_info->dt_base = FDT_ADDR;
         boot_info->dt_size = dt_size;
-- 
2.37.3


