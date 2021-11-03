Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DDE444475
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:14:24 +0100 (CET)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHxz-0002zt-Dp
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHox-0003F7-6p
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:47057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHou-0000Wl-Au
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:57 -0400
Received: by mail-wr1-x436.google.com with SMTP id u1so4003954wru.13
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3SQejK3WrW99drRT37J6slxXvRt4OUdqxEbD8zahlg=;
 b=aDJDFt9v1+RcZiKtqsoEBmYIieOev04Tp0utKurWGzEuxy4AJTA7ktgcKQvMRM3Yiu
 9lhusLXQ+fdpnbPiz/xNmBdazhVN1PxHaMLGvWHdJpsxMO+rZVJp1YfJyuC/GsjrQxim
 CGZueNjHc+DKWSOxBp7Ww5H+ga51x3qO4wVEHsM5NbhjShix+7WhkkuCNDgSj7Jxt7ph
 EALMVjSm4x/zSijApvgNNPuZZHF2eOE/DDGPn+JFDnhpqsvEpw98E1IdWxbbh/n8AnY0
 cLkAU2pMVcWZJkwHYRqABuCMSqEYXoOCa9azhld9ISQKff3EaRYXppyto9PdKGU0Hqa5
 RI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X3SQejK3WrW99drRT37J6slxXvRt4OUdqxEbD8zahlg=;
 b=cHcodyFSI+FLw2txzMHYBPR+SIuq/U7LNYk5U6P3Kktu9Lk49fQZPg+ydEy41jfhvz
 +drxhYLDjoigRAF/tkytQ/4WFYd2HqdimcSliVcf33A/tG51k3BacvacEXCt9Az4atxP
 1Vne9+Bes4pPLCjT1fp0lWwciEhjD5waqG5c9mkyKR/dQzLzTmzwghTQcGOcgR6B/f6c
 8Dy+canLa2aZeaxNODvWgLtCmx6zVneWkStpvpZh5ETDATM3bJmo7oFjiM6BO9s2PGKL
 aEMLDTTZ60stIcRKwKAt5zv5igRccrQoW5jXz54bcfrZnWoWgYQzE+FTg7vcfqXMqqfc
 lF6A==
X-Gm-Message-State: AOAM531Uy2F5QFHc5jHDTqUxcPrpj+WV3pSLzuWvSywUahVpJUjl3nFT
 eErvkL3UuLXy3NXTKelrPEzPITCs3Io=
X-Google-Smtp-Source: ABdhPJwd7dvaNuu6a5rIZebUX+VaBjqRVE9wPspIUXtIeP/h4jdcEr1rjZuUPgxCuFoJ+FjrwlBKtg==
X-Received: by 2002:adf:ef52:: with SMTP id c18mr36563197wrp.162.1635951894854; 
 Wed, 03 Nov 2021 08:04:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/27] target/i386: use DMA-enabled multiboot ROM for
 new-enough QEMU machine types
Date: Wed,  3 Nov 2021 16:04:24 +0100
Message-Id: <20211103150442.387121-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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

As long as fw_cfg supports DMA, the new ROM can be used also on older
machine types because it has the same size as the existing one.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/multiboot.c | 10 ++++++++--
 hw/i386/multiboot.h |  4 +++-
 hw/i386/pc.c        |  3 ++-
 hw/i386/x86.c       |  2 +-
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 9e7d69d470..0a10089f14 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -143,7 +143,8 @@ static void mb_add_mod(MultibootState *s,
     s->mb_mods_count++;
 }
 
-int load_multiboot(FWCfgState *fw_cfg,
+int load_multiboot(X86MachineState *x86ms,
+                   FWCfgState *fw_cfg,
                    FILE *f,
                    const char *kernel_filename,
                    const char *initrd_filename,
@@ -151,6 +152,7 @@ int load_multiboot(FWCfgState *fw_cfg,
                    int kernel_file_size,
                    uint8_t *header)
 {
+    bool multiboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     int i, is_multiboot = 0;
     uint32_t flags = 0;
     uint32_t mh_entry_addr;
@@ -401,7 +403,11 @@ int load_multiboot(FWCfgState *fw_cfg,
     fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, mb_bootinfo_data,
                      sizeof(bootinfo));
 
-    option_rom[nb_option_roms].name = "multiboot.bin";
+    if (multiboot_dma_enabled) {
+        option_rom[nb_option_roms].name = "multiboot_dma.bin";
+    } else {
+        option_rom[nb_option_roms].name = "multiboot.bin";
+    }
     option_rom[nb_option_roms].bootindex = 0;
     nb_option_roms++;
 
diff --git a/hw/i386/multiboot.h b/hw/i386/multiboot.h
index 60de309cd1..2b9182a8ea 100644
--- a/hw/i386/multiboot.h
+++ b/hw/i386/multiboot.h
@@ -2,8 +2,10 @@
 #define QEMU_MULTIBOOT_H
 
 #include "hw/nvram/fw_cfg.h"
+#include "hw/i386/x86.h"
 
-int load_multiboot(FWCfgState *fw_cfg,
+int load_multiboot(X86MachineState *x86ms,
+                   FWCfgState *fw_cfg,
                    FILE *f,
                    const char *kernel_filename,
                    const char *initrd_filename,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d203db7845..fcfb7f7139 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -780,7 +780,8 @@ void xen_load_linux(PCMachineState *pcms)
         assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
                !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
                !strcmp(option_rom[i].name, "pvh.bin") ||
-               !strcmp(option_rom[i].name, "multiboot.bin"));
+               !strcmp(option_rom[i].name, "multiboot.bin") ||
+               !strcmp(option_rom[i].name, "multiboot_dma.bin"));
         rom_add_option(option_rom[i].name, option_rom[i].bootindex);
     }
     x86ms->fw_cfg = fw_cfg;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index a34498fe16..b84840a1bb 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -814,7 +814,7 @@ void x86_load_linux(X86MachineState *x86ms,
          * PVH), so we try multiboot first since we check the multiboot magic
          * header before to load it.
          */
-        if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
+        if (load_multiboot(x86ms, fw_cfg, f, kernel_filename, initrd_filename,
                            kernel_cmdline, kernel_size, header)) {
             return;
         }
-- 
2.31.1



