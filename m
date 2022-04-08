Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424C4F934C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 12:47:35 +0200 (CEST)
Received: from localhost ([::1]:58638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncm9N-0002yH-VE
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 06:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1ncm7c-00029y-4A
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 06:45:44 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1ncm7a-00061C-0K
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 06:45:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n6-20020a17090a670600b001caa71a9c4aso9306645pjj.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 03:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2g92e/CrEl3cuS4TMmE5UXSIh2RGfsmxonEwA/xFqTY=;
 b=QyNMUpA/fuFs+dF40PrXvcM7KJIM+tBr9Pw+gcYsP134iQNq8Uho0sfJZSdMw4KAE8
 R3Nf4rlbbXhQCjDu9zj4JJ7VXxwcqgkfFlBWGMinSxmeuF2GWtEqifioDqKxTnz06MKX
 y9kJ6UVkOh9wB2s7fa96Ws5TOwK6If7YsTTixd71rZPz2gkXQujPnOQ/bOriIhqE41gl
 wSXSliGCBUDehxqCiwZLNEmo49W4O0VPXyjPDQ6t2UhYmzZgaOb8ke7cvRrjJzW6ogbr
 NGGhJBG8Q5+GX3qi3k6p2SV2rQ7N7uDNnWMQf7X4ACSBykTsMVJYE9OwaWiSb1B1ObFH
 13tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2g92e/CrEl3cuS4TMmE5UXSIh2RGfsmxonEwA/xFqTY=;
 b=jCKA2TeLQ3RJ0Q01fRKEoi9e9P79SUjeC9oWyWeQuD5swDaPL8hmISI+Js8hOBUves
 f+sYnX8kuBMhHBkjxSMz0RwyIMeoSK45pl9AGTFhPPClEjEGi66MV6KmOeUHe4dxiip+
 B5eCiRQ7oVrfwFvrefFH1qpHh4Lo2c9c3UnM2tilROMnvHcQmGCAh/dYgTBMQGq/XAG3
 jWAzdfXSRsAZB1qSzCanwOvyfIVLU5TTBME+mzTqJMBwYgg3juFInHziOncI3NZMj7RN
 I4u/TenxfV9tnM0w50Sz/aF+DT0lllJ1VrDIQKxC5NtbYE43m86tsxDqvcWxk0SVs1Qd
 FVEA==
X-Gm-Message-State: AOAM533EZF1PWQNtG2+DbxkbS1VATdrF5SLPL/XiISM4fEucEGAo5/Zr
 n7o/F39H/2+kbgCvsoVHl9OUK2nhW/TDP1Ge
X-Google-Smtp-Source: ABdhPJwIlR2SKFxXrQ7u+0iU1h5VLEAIbyjdiVXMsQtLSxSXbqYll3E3hR9dQKfOOpiYi6rq9BquYg==
X-Received: by 2002:a17:902:f0ca:b0:156:caa9:4221 with SMTP id
 v10-20020a170902f0ca00b00156caa94221mr18148501pla.107.1649414737448; 
 Fri, 08 Apr 2022 03:45:37 -0700 (PDT)
Received: from localhost.localdomain ([203.153.37.178])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a17090ad25100b001cabfe854b3sm11387109pjw.37.2022.04.08.03.45.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Apr 2022 03:45:36 -0700 (PDT)
From: Gautam Agrawal <gautamnagrawal@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Warn user if the vga flag is passed but no vga device is
 created
Date: Fri,  8 Apr 2022 16:15:19 +0530
Message-Id: <20220408104519.32931-1-gautamnagrawal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=gautamnagrawal@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, gautamnagrawal@gmail.com, stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is in regards to this issue:https://gitlab.com/qemu-project/qemu/-/issues/581#.
A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
has been used to track the creation of vga interface. If the vga flag is passed in the command
line "default_vga"(declared in softmmu/vl.c) variable is set to 0. To warn user, the condition
checks if vga_interface_created is false and default_vga is equal to 0.

The warning "No vga device is created" is logged if vga flag is passed
but no vga device is created. This patch has been tested for
x86_64, i386, sparc, sparc64 and arm boards.

Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
---
 hw/isa/isa-bus.c        | 1 +
 hw/pci/pci.c            | 1 +
 hw/sparc/sun4m.c        | 2 ++
 hw/sparc64/sun4u.c      | 1 +
 include/sysemu/sysemu.h | 1 +
 softmmu/globals.c       | 1 +
 softmmu/vl.c            | 3 +++
 7 files changed, 10 insertions(+)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 0ad1c5fd65..cd5ad3687d 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -166,6 +166,7 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp)
 
 ISADevice *isa_vga_init(ISABus *bus)
 {
+    vga_interface_created = true;
     switch (vga_interface_type) {
     case VGA_CIRRUS:
         return isa_create_simple(bus, "isa-cirrus-vga");
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index dae9119bfe..fab9c80f8d 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2038,6 +2038,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
 
 PCIDevice *pci_vga_init(PCIBus *bus)
 {
+    vga_interface_created = true;
     switch (vga_interface_type) {
     case VGA_CIRRUS:
         return pci_create_simple(bus, -1, "cirrus-vga");
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 7f3a7c0027..f45e29acc8 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -921,6 +921,7 @@ static void sun4m_hw_init(MachineState *machine)
             /* sbus irq 5 */
             cg3_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
                      graphic_width, graphic_height, graphic_depth);
+            vga_interface_created = true;
         } else {
             /* If no display specified, default to TCX */
             if (graphic_depth != 8 && graphic_depth != 24) {
@@ -936,6 +937,7 @@ static void sun4m_hw_init(MachineState *machine)
 
             tcx_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
                      graphic_width, graphic_height, graphic_depth);
+            vga_interface_created = true;
         }
     }
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index cda7df36e3..75334dba71 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -633,6 +633,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     switch (vga_interface_type) {
     case VGA_STD:
         pci_create_simple(pci_busA, PCI_DEVFN(2, 0), "VGA");
+        vga_interface_created = true;
         break;
     case VGA_NONE:
         break;
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index b9421e03ff..a558b895e4 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -32,6 +32,7 @@ typedef enum {
 } VGAInterfaceType;
 
 extern int vga_interface_type;
+extern bool vga_interface_created;
 
 extern int graphic_width;
 extern int graphic_height;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 3ebd718e35..1a5f8d42ad 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -40,6 +40,7 @@ int nb_nics;
 NICInfo nd_table[MAX_NICS];
 int autostart = 1;
 int vga_interface_type = VGA_NONE;
+bool vga_interface_created = false;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack;
 int singlestep;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6f646531a0..cb79fa1f42 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2734,6 +2734,9 @@ static void qemu_machine_creation_done(void)
     if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
         exit(1);
     }
+    if (!vga_interface_created && !default_vga) {
+        warn_report("No vga device is created");
+    }
 }
 
 void qmp_x_exit_preconfig(Error **errp)
-- 
2.34.1


