Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69759422F55
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:44:30 +0200 (CEST)
Received: from localhost ([::1]:51226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoUP-0000Eg-Ey
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnY9-0007n4-Bs
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:17 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnY7-0003u6-LX
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:17 -0400
Received: by mail-ed1-x529.google.com with SMTP id z1so1175702edb.8
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9OmOYSIjg+vLx6xnsv1dbs85bhSDfzlPZkemprRQdZ0=;
 b=NHT04y5vL4hcFRK2c21am6kiOuMAUVnYbHjDjxpwH0XBKLhwhRo4vZA6doc7stA2dJ
 l1eBlUxv76CD4VQLjnqOPKAtfVc5Y36RjZW/M0UKe9Yw2eIPzBjAiashYuat45Wj99qi
 p/k0gr8L5I/8Wz8g8ZSNZfMwI/2WMWXVzScpiCE2wuTCV117FWJZNJBiJEF+eNvFhSbP
 XLT8aNfq8GwFykbvd/VZxMGD14oJ+aI/J+w1oyFpsJGrp9X3t63Eh/R9GRmc8Him5Hjg
 bsAjYJCostRGdAO98REmfyxTfWSGL6Movjm0dWc1vvUQQLqCT/pXxxopRroJSaMa0dDF
 Rz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9OmOYSIjg+vLx6xnsv1dbs85bhSDfzlPZkemprRQdZ0=;
 b=ApauSnOVGZ+3y9AWzXjLtpK0oMTU+4ZHDQzfhOjpbn6+J1cD0MvbSx2VH2dmM8VBMn
 g8d1IaOq4v0s1HYcUQao8MhneSXZ1NIdl6OBSjG06JgUkGwN//D4c5PzYYnPEw9DGr09
 bWGEiLxATwZfW5cf0QAL60v1cny793UGXv0IAEZ9elT6FhPYYTd4YBEPc6Bm8AwZFsxX
 wTs+IhdPMYOadt3b1NLfrHRIfhTGVFU3f4reMT4Wv6Ko+87u2KXVUe6Ak69kWBbSR6o7
 CRkFsnl+8cNBOrroOGKjeJL11ewGW9+PtXMclBLPguUmQu5pfEpYUZFBH6uQYuGrk7UL
 izRA==
X-Gm-Message-State: AOAM530w8dq+uQwsvvmDcIls0x0yiZSmPHtC8suFS+o3pzth69WGqnFY
 zmLIJLCtryEoICQKTYoGcd5XyASixcI=
X-Google-Smtp-Source: ABdhPJxlm2CLp3xDkAs8b26KIyYvaqeuKOpsPaGpCl775zHy3n5r+OAkqXKqXiM7btHfQ8C0EuhMrw==
X-Received: by 2002:a50:9347:: with SMTP id n7mr26611059eda.249.1633452254267; 
 Tue, 05 Oct 2021 09:44:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] x86/sev: generate SEV kernel loader hashes in
 x86_load_linux
Date: Tue,  5 Oct 2021 18:43:59 +0200
Message-Id: <20211005164408.288128-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

If SEV is enabled and a kernel is passed via -kernel, pass the hashes of
kernel/initrd/cmdline in an encrypted guest page to OVMF for SEV
measured boot.

Co-developed-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210930054915.13252-3-dovmurik@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 41ef9a84a9..0c7c054e3a 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -47,6 +47,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "target/i386/sev_i386.h"
 
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/irq.h"
@@ -780,6 +781,7 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
+    SevKernelLoaderContext sev_load_ctx = {};
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -926,6 +928,8 @@ void x86_load_linux(X86MachineState *x86ms,
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
+    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
+    sev_load_ctx.cmdline_size = strlen(kernel_cmdline) + 1;
 
     if (protocol >= 0x202) {
         stl_p(header + 0x228, cmdline_addr);
@@ -1007,6 +1011,8 @@ void x86_load_linux(X86MachineState *x86ms,
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data, initrd_size);
+        sev_load_ctx.initrd_data = initrd_data;
+        sev_load_ctx.initrd_size = initrd_size;
 
         stl_p(header + 0x218, initrd_addr);
         stl_p(header + 0x21c, initrd_size);
@@ -1065,15 +1071,32 @@ void x86_load_linux(X86MachineState *x86ms,
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    memcpy(setup, header, MIN(sizeof(header), setup_size));
+    /*
+     * If we're starting an encrypted VM, it will be OVMF based, which uses the
+     * efi stub for booting and doesn't require any values to be placed in the
+     * kernel header.  We therefore don't update the header so the hash of the
+     * kernel on the other side of the fw_cfg interface matches the hash of the
+     * file the user passed in.
+     */
+    if (!sev_enabled()) {
+        memcpy(setup, header, MIN(sizeof(header), setup_size));
+    }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
+    sev_load_ctx.kernel_data = (char *)kernel;
+    sev_load_ctx.kernel_size = kernel_size;
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
+    sev_load_ctx.setup_data = (char *)setup;
+    sev_load_ctx.setup_size = setup_size;
+
+    if (sev_enabled()) {
+        sev_add_kernel_loader_hashes(&sev_load_ctx, &error_fatal);
+    }
 
     option_rom[nb_option_roms].bootindex = 0;
     option_rom[nb_option_roms].name = "linuxboot.bin";
-- 
2.31.1



