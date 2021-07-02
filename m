Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025183BA18F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:47:03 +0200 (CEST)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJVW-0006Bb-1j
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLV-0002Ps-0h
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLT-00040n-C0
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id a13so12480737wrf.10
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6SjNTNzzmhwEPVZj6BseAgSSsGle0gDtK79Bw/VO9BM=;
 b=qLcaIT6ez1LLeRUhcFFHNmBAGy3IgyPTHV5AHk/0THkgLGh5tMP8+1ao0gLAX/eXFN
 /J6WvTwnAuUILnQdS2OZXZQFsKKDaFPyuel7NGsJOosphFgD+r5pfhLeb6tPiV4Z3dnB
 j/d8ljvI451K0BNeWMjO9xNilLVcUxmPdYAF7vvxxaWckwfSLZbqXpowiudJUUookw1J
 gIjkuNvstpZrPa1GjlEr0zZMt45Jdr1TgL/G6MpveGNLbMggRE6CMFCm7fEWOTdl1Dst
 7I6d55UZBeAufXY1cnA5VgHgo6kIhoRlN/cDN9HitP7P3BQeR+7u2uO4YrF4g2OEnnN9
 2BxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6SjNTNzzmhwEPVZj6BseAgSSsGle0gDtK79Bw/VO9BM=;
 b=bVrum/mmeVEHu/kwSmpzhQJtdSSoi5UBe4ZzQfKgFBBmIpnk0/rXk+9UPlzQuyz9I/
 tByQP3FS0gys5I5PGLp7iy5V7/JzOu4M+ICi9+O2uMaPo3RWTGjEjjEhJmC9CtuZyq6f
 1oUVfYPyTZOOI64C7I26dtkIIxiByR0YTNPHM+ZI0vZeZMOMmH0fPBqIYCnrJsOkkkpP
 uXwcw7DEmy0hC1Fn45n8XLD+80tT3+hjX5zeulimoYEcESOXrcxZM/fOWyLRn/LU0HHi
 E5pXQ9BWfzxmcOj8EXi6yj1NIDxQeOwngKnxs5I0c14/K9gaJmq6a+kdNchXVcmwH+Zd
 0rcg==
X-Gm-Message-State: AOAM530mVlZQF2hFk1fywIcrq82FW5zu0Ba9D97458rvukx0WzlHX+6d
 NCB5YP1RuGUk5mcNHnNeC6IR/zrXfQGfp/ZT
X-Google-Smtp-Source: ABdhPJw6d8jE9xJfuhvSOPUKaDYl1J0qM8JABqzy0N4k6eRpKKcvrK09h5dtF+tA60i5ORokrv+cDA==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr5927418wru.362.1625232997916; 
 Fri, 02 Jul 2021 06:36:37 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id 12sm13818781wme.28.2021.07.02.06.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:36:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] hw/pci-host/bonito: Allow PCI config accesses smaller
 than 32-bit
Date: Fri,  2 Jul 2021 15:35:45 +0200
Message-Id: <20210702133557.60317-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
Message-Id: <20210624202747.1433023-4-f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 751fdcec689..a57e81e3a97 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -187,7 +187,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define BONITO_PCICONF_FUN_MASK        0x700    /* [10:8] */
 #define BONITO_PCICONF_FUN_OFFSET      8
 #define BONITO_PCICONF_REG_MASK_DS     (~3)         /* Per datasheet */
-#define BONITO_PCICONF_REG_MASK        0xFC
+#define BONITO_PCICONF_REG_MASK_HW     0xff         /* As seen running PMON */
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


