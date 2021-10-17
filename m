Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C2430CC9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 00:56:04 +0200 (CEST)
Received: from localhost ([::1]:56988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcF4V-0005gu-4O
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 18:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1g-00036T-2R
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1d-0008Px-IZ
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:06 -0400
Received: by mail-wm1-x331.google.com with SMTP id g39so3020439wmp.3
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1/oedjGS4mKEBWW5SpNNRDaCNET4hY7MjnW9POQmQ4=;
 b=etqbIeE7D0XYwDVkM/4oy9M26KSiRdgJi0AjXJZuzKbYF2FBxw4faUujTSTgofRgL3
 0En9IGhcCev0SwlCAM+nk03cR0bg+MYAh3aEGEEHtJCq9xUsG0m+Xtg2rbqHToimqvhg
 7PYmWQdab/EMGVgF2nfw/eGLHGhj/ZWhyktHopLEslpN3P28NkJQ1Xyyh0v2YmOywG3/
 pSEVHRhJ0yDZzHhsPabNDZybJmmIOt+U90sL0mDb92R8/UCgKvMDm7+ZnMzGneRyLHp6
 NgChiDjGi28DuMk0Cw93Pkq0IHp53o9xo9h3L2pm4O+bqiAtJgqBU12oVUfXvKzhdx+P
 Wwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R1/oedjGS4mKEBWW5SpNNRDaCNET4hY7MjnW9POQmQ4=;
 b=QkXs5G9sbILUF+vQV90JHpGw1xi0RB8IJNUOgPv58mXN2WEJ+FXhClzB8tZQsGAOd+
 UPsDr8maI+J8JuEw8xxKS52M+NwV5lf5a/7kt7RTeF0EW2SJCI+JY2f8AIkrgsinNjAH
 1u/3ymAPTnGl2sEHXfO6Jq9ScO3uChx/ohY14zGMwEeKZfle+S2pmVz+pd220/RWwqmB
 5wRiCVgHB4cZiuQYU2WOt3Wer3gSNKRckkymnmBpqmkbIK+2Xwx1cZX+Ik8AMsiCnZgi
 9Zm8vU4RpGb2WpguBOQxMQVh+GgSQ7d8hE0Xm3bPHUbG5NfsjS44hV/QFkwWczCY1YkG
 98pA==
X-Gm-Message-State: AOAM530rWEaB14Jwh7upVZYb7CNlkvo7kZ6GOSiKsWYNMDwrz6wkZX7T
 v8H0D7iDucFSGJxKJ7M4szmKIVim44s=
X-Google-Smtp-Source: ABdhPJzWWl4GubzGSU6ev2KhMMUMy6EBOdXfHTnv7hNw+M5Y+RFXcvDwiNiKY5QC2UxFoXTwaDEQKA==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr40798704wmc.86.1634511183363; 
 Sun, 17 Oct 2021 15:53:03 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c7sm13529363wmq.13.2021.10.17.15.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/17] hw/mips/boston: Allow loading elf kernel and dtb
Date: Mon, 18 Oct 2021 00:52:31 +0200
Message-Id: <20211017225245.2618892-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

ELF kernel allows us debugging much easier with DWARF symbols.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Fix coding style]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211002184539.169-3-jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 37b8278623e..7374bb5da4d 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 
+#include "elf.h"
 #include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/ide/pci.h"
@@ -551,10 +552,37 @@ static void boston_mach_init(MachineState *machine)
             exit(1);
         }
     } else if (machine->kernel_filename) {
-        fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-        if (fit_err) {
-            error_report("unable to load FIT image");
-            exit(1);
+        uint64_t kernel_entry, kernel_high, kernel_size;
+
+        kernel_size = load_elf(machine->kernel_filename, NULL,
+                           cpu_mips_kseg0_to_phys, NULL,
+                           &kernel_entry, NULL, &kernel_high,
+                           NULL, 0, EM_MIPS, 1, 0);
+
+        if (kernel_size) {
+            hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
+            hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
+
+            s->kernel_entry = kernel_entry;
+            if (machine->dtb) {
+                int dt_size;
+                g_autofree const void *dtb_file_data, *dtb_load_data;
+
+                dtb_file_data = load_device_tree(machine->dtb, &dt_size);
+                dtb_load_data = boston_fdt_filter(s, dtb_file_data,
+                                                  NULL, &dtb_vaddr);
+
+                /* Calculate real fdt size after filter */
+                dt_size = fdt_totalsize(dtb_load_data);
+                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
+            }
+        } else {
+            /* Try to load file as FIT */
+            fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
+            if (fit_err) {
+                error_report("unable to load kernel image");
+                exit(1);
+            }
         }
 
         gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
-- 
2.31.1


