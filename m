Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CBF5E10F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 11:31:26 +0200 (CEST)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hibbq-0000AD-2o
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 05:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaqE-0006dg-3C
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:42:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq8-0008Op-PZ
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:42:12 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37483)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiaq8-0008Lk-Ex
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:42:08 -0400
Received: by mail-lj1-f194.google.com with SMTP id 131so1493833ljf.4
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 01:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Ll0IfljzezEKYOWEmbGf9wV1tOe7NCSXkPQeobGClJk=;
 b=CoqggWJodrqRhcRWSZdvgg8f7C5KVBMtx98FguxqAAuqH7qyRTovMc9zWDoGvTlPLX
 KPjTNwYhDtk2H13BXZGZhHtehH82rQfrcISfgPOl41k9mt1rXETMTUbdSP+hwFLg55K0
 c3ns6+VUoE0vqObpR9WntDfmomnVuwv35MHiXVLNPYDWlSb2YpRhsdLQ48oKgi9VBUpm
 yh3J7+jUAOsAVm6c1lv4l+52GoYrCtNdvcqVZ9ltrvNC3pjpJkik15U9L/HVI8mnU2qd
 rFLAaLp0qTL63grQ2Z9gOlYQMd0dtq6CLZMSIVh9c3zIbcpBfCMjXLOPf9RgAhpTKgjk
 7GaQ==
X-Gm-Message-State: APjAAAWyfgaBrNtLMKx77TX3zVHOuLpa/plO1uKnb13SXMPXY9rK+ge8
 KCX/77ETVpfD3QfuivOFvqdDA9DGr3gL2Q==
X-Google-Smtp-Source: APXvYqxvE3RURQeDVAH3+lZ+MkxdP4n80wXOGvdatidyeYsNkwqb/YD/aif4p1tmYjqhSIybm4kYDA==
X-Received: by 2002:a2e:994:: with SMTP id 142mr20031421ljj.130.1562143326755; 
 Wed, 03 Jul 2019 01:42:06 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id e13sm339064ljg.102.2019.07.03.01.42.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:42:06 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:48 -0700
Message-Id: <20190703084048.6980-33-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.194
Subject: [Qemu-devel] [PULL 32/32] hw/riscv: Extend the kernel loading
 support
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Extend the RISC-V kernel loader to support Image and uImage files.
A Linux kernel can now be booted with:

    qemu-system-riscv64 -machine virt -bios fw_jump.bin -kernel Image

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 883df49a0c65..ff023f42d01d 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -56,12 +56,22 @@ target_ulong riscv_load_kernel(const char *kernel_filename)
     uint64_t kernel_entry, kernel_high;
 
     if (load_elf(kernel_filename, NULL, NULL, NULL,
-                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) < 0) {
-        error_report("could not load kernel '%s'", kernel_filename);
-        exit(1);
+                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) > 0) {
+        return kernel_entry;
     }
 
-    return kernel_entry;
+    if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
+                       NULL, NULL, NULL) > 0) {
+        return kernel_entry;
+    }
+
+    if (load_image_targphys_as(kernel_filename, KERNEL_BOOT_ADDRESS,
+                               ram_size, NULL) > 0) {
+        return KERNEL_BOOT_ADDRESS;
+    }
+
+    error_report("could not load kernel '%s'", kernel_filename);
+    exit(1);
 }
 
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-- 
2.21.0


