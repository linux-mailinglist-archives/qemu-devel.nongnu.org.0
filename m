Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F05434D17
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:08:16 +0200 (CEST)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCGO-0008Fs-1Q
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mdCDQ-0005S7-7z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:05:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mdCDO-0007ef-PR
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:05:11 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w14so25370797edv.11
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3SQejK3WrW99drRT37J6slxXvRt4OUdqxEbD8zahlg=;
 b=QXLYyutTDW7TWfbJk9uAJCD3sZYczR4bniSii2KcVB8/+iCIIr8zycvNSvbKOZyC2h
 aYR/SjuyPhm66rWE+z01tQL8L+r19b2UBPpgQE6yWAVNjrCpfdvxeNbtlU3f5HfhGNuH
 6TKmtxkhb+HM2cQBTCzAfyHq+7zocERndsYx7RQodAkJkOX+RX3THT1T61tf59pmItSR
 8+RR9zgC9KyI4l03Ge/zMqMExahUhPVKD4fhrSv0EWLeFOOhWt+9Ssfh+4m1ohnju7lg
 r4Co2s/aJbbEdv6zi0/6DpRNEwVE9kx2zO/j47HdASNILFqO40cYvLmOPk1s94jCZRu3
 UacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X3SQejK3WrW99drRT37J6slxXvRt4OUdqxEbD8zahlg=;
 b=p5fL1liglRil8DH3QpfzUsPfQFXmT+jJeoNP+2fXhfUkHmxUzsBbJDY1jfg+Ymv7aX
 m7Fs61D5pOi1pml1USYJ9eeyxRbycUBJZgZpoRTvud0/x0kAcWPrZC2WXjh8aSe5nCBi
 cFefh6EpuqShITYwCh57sBEWkKI6K5hswGguWkdW7dFU5EkoVA/7Wj1EocSeiXB7Pszt
 n1RjVp26tdbuUTSFX6brHUA1kHx62t2JpkNhDI5i0Q+4FSK4SYCNoErO2oejbPgljM9b
 SE35eIn3L2BGy5cAU02LQrSG+0ev+2uvIWVjW8Dg7IizF3vVcveDF/iDNbB7GNEyypf0
 SO3Q==
X-Gm-Message-State: AOAM530x3v4AZep4yjkxSlAGgDIuLwILo/y7h8W6ubPbjdWACEn9xpfB
 VgivUF15ZKn3SSeJWBIXs+cJCP8iQ9c=
X-Google-Smtp-Source: ABdhPJwmoetITe4aHhc92ZCycOH4tM9YhasWyO1kF4Kvn/XNRxBS+f/gauuAOWlv6oU7lG9cw8EWfA==
X-Received: by 2002:a17:907:75c1:: with SMTP id
 jl1mr47404527ejc.288.1634738574043; 
 Wed, 20 Oct 2021 07:02:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a4sm1287095edk.71.2021.10.20.07.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:02:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/i386: use DMA-enabled multiboot ROM for new-enough
 QEMU machine types
Date: Wed, 20 Oct 2021 16:02:44 +0200
Message-Id: <20211020140244.485249-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211020140244.485249-1-pbonzini@redhat.com>
References: <20211020140244.485249-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: adam@l4re.org, marcus.haehnel@kernkonzept.com
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


