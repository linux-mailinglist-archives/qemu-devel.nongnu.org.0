Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEFC3B37EC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:34:30 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwW3R-0008Bp-3H
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVxH-0008Ey-HC
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:28:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVxF-00038Y-OG
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:28:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g7so3442702wri.7
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 13:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TZGEajgGVZ42Nar/yd9hchvDz4iLTqHoO3KY7Bxn5V0=;
 b=mQfZUFWNAhumbRG8EyCLY3KhHyYSapT5oVOOz9+atiwaQF7Su+kwmXeE9syCaujXX+
 iQBphFx5IrbQgz/8BQnOWHGgavCN8sBdhePeM9lKgpyhBBmWXPzZEAjuK4fKHrrGexP3
 dV7FamvQfkToFongW6MjBM9LrE2mPU/iCzM1OtJHwjrp1KVLhuRPKwWn9c4dsEcFcU2n
 qlVjbjs9b68JBnfVTaKVBnmdhythwKksjytVfFyR4AKFMtd3oTMGhFBVJscCZ0yB/ERa
 5a5EdVRDWdAvXFwGIoHaBsYBMQ9EFjoTuhwpaG/r6BB95V4No865nOetbxHMXH1e61mv
 yr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TZGEajgGVZ42Nar/yd9hchvDz4iLTqHoO3KY7Bxn5V0=;
 b=mmWlpmhyJ/3NEhxrPkjEk0EmvcgzDrQb/4mB3DkBq5KTPAPGo5/iw5yUDgsKm2e74v
 9jeaednkKxvaXMIZfZG/udTdACK/ACFXhRXk8HeeA1IMXMMubYnWMFtvqJ3FtgClrr59
 6Jl5L2Qa14G8FVnOez9tWO1qi5VNBCpvn/o1rMbwxg2bZB/kS/3b15RnPyaAY7Khg6tP
 PnlYlNCFV9o8jabhKa/v1fPXjoTIxEZwFgCSiXERN3rl1lNzMH2J97Ft8+1pPz+Xu11p
 GaZ70N41GsEF3aO2CbOpS8BlVHus6I89K1XnnJauocil4a1n0vbFrlZM9jfuEsDfW8jM
 Ivjw==
X-Gm-Message-State: AOAM532Wijb/1tn4dQz7I/uQmpeHEVYrv5EILnP/dKKC+lb2ezApV811
 0VdKeATd0y/bzNEDVEKsBbvLCFKhdmcICQ==
X-Google-Smtp-Source: ABdhPJzKped6HQjvWZq0YXrdx61coN9mYLL6hgfPG18Pm4O9+cvqiPGwMfc3s9ZaPvVhaGkStXUgsQ==
X-Received: by 2002:a5d:5905:: with SMTP id v5mr6880006wrd.361.1624566484151; 
 Thu, 24 Jun 2021 13:28:04 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p16sm4212274wrs.52.2021.06.24.13.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:28:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/pci-host/bonito: Allow PCI config accesses smaller
 than 32-bit
Date: Thu, 24 Jun 2021 22:27:45 +0200
Message-Id: <20210624202747.1433023-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624202747.1433023-1-f4bug@amsat.org>
References: <20210624202747.1433023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running the official PMON firmware for the Fuloong 2E, we see
8-bit and 16-bit accesses to PCI config space:

  $ qemu-system-mips64el -M fuloong2e -bios pmon_2e.bin \
    -trace -trace bonito\* -trace pci_cfg\*

  pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x4d2, size: 2
  pci_cfg_write vt82c686b-pm 05:4 @0xd2 <- 0x1
  pci_cfg_write vt82c686b-pm 05:4 @0x4 <- 0x1
  pci_cfg_write vt82c686b-isa 05:0 @0x4 <- 0x7
  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x81, size: 1
  pci_cfg_read vt82c686b-isa 05:0 @0x81 -> 0x0
  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x81, size: 1
  pci_cfg_write vt82c686b-isa 05:0 @0x81 <- 0x80
  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x83, size: 1
  pci_cfg_write vt82c686b-isa 05:0 @0x83 <- 0x89
  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x85, size: 1
  pci_cfg_write vt82c686b-isa 05:0 @0x85 <- 0x3
  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x5a, size: 1
  pci_cfg_write vt82c686b-isa 05:0 @0x5a <- 0x7
  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x85, size: 1
  pci_cfg_write vt82c686b-isa 05:0 @0x85 <- 0x1

Also this is what the Linux kernel does since it supports the Bonito
north bridge:
https://elixir.bootlin.com/linux/v2.6.15/source/arch/mips/pci/ops-bonito64.c#L85

So it seems safe to assume the datasheet is incomplete or outdated
regarding the address constraints.

This problem was exposed by commit 911629e6d3773a8adeab48b
("vt82c686: Fix SMBus IO base and configuration registers").

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 751fdcec689..3c10608c9a2 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -187,7 +187,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define BONITO_PCICONF_FUN_MASK        0x700    /* [10:8] */
 #define BONITO_PCICONF_FUN_OFFSET      8
 #define BONITO_PCICONF_REG_MASK_DS     (~3)         /* Per datasheet */
-#define BONITO_PCICONF_REG_MASK        0xFC
+#define BONITO_PCICONF_REG_MASK_HW     0xff         /* As seen on hardware */
 #define BONITO_PCICONF_REG_OFFSET      0
 
 
@@ -466,7 +466,7 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, hwaddr addr)
              BONITO_PCICONF_IDSEL_OFFSET;
     devno = ctz32(idsel);
     funno = (cfgaddr & BONITO_PCICONF_FUN_MASK) >> BONITO_PCICONF_FUN_OFFSET;
-    regno = (cfgaddr & BONITO_PCICONF_REG_MASK) >> BONITO_PCICONF_REG_OFFSET;
+    regno = (cfgaddr & BONITO_PCICONF_REG_MASK_HW) >> BONITO_PCICONF_REG_OFFSET;
 
     if (idsel == 0) {
         error_report("error in bonito pci config address 0x" TARGET_FMT_plx
-- 
2.31.1


