Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BED320B2D
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:58:51 +0100 (CET)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqCA-0002xh-CI
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprT-00007u-6B
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:27 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprR-0003QA-F0
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r3so4700213wro.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sppNkwQg+FV7UXwg+g57hVZ/iROZ8L4Jx9aHSLoiTws=;
 b=tefhZ9orcVUDuuTR5h+my7o9l/W224L8jwe81vR/x6ce8oVkvg7+OOG5MKTTSO60H1
 ZA6UDCjp0JhHaTqSx5Kkw+osCpjfGAw2YFytlBa+0jiR98jeLuaiuPz76aihXuuDgPVP
 FONKe6oO/14nJBYc6L4VnGgYNF+LhF+1OzfoaolOnkpBpTWGymh8hbZMPoMopxBGKgeP
 K2DNA8oUhR1LCuCjaHv3b/ZnOFFnUvnQ1gEXyqozq4eSqXmS6BZvfj5ADNXPAHXkMZQY
 XsIP5WTwDvxqq0FA5eROiOCEXqho/ZMusQw7yQ5bU1D3tbk6iZcLvllvCAyYHSfh3OTg
 FyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sppNkwQg+FV7UXwg+g57hVZ/iROZ8L4Jx9aHSLoiTws=;
 b=ri1jNYWwLQbEJOpRiAVXxnrEuNLbNlYomakfNLEaqGse4vTxb7RvsvmuSPuirBnkYn
 QEEAI2KoT5X5+W05fz8/2D3VRRmy/XmvEpDhjmjZ6pIJjRc94iRSvYRoBUnjV7rpNP+Y
 WEAPC3CH8QV0riiGN+hbbZhS9edP42B/9ddL4yotLuaeATtt5Id+U5SInW/NaZKbcMLX
 2Bj75gF2v0vHgTJ4NIVJSN+kpXynFYioMuv44D5Ic32HtH9Yut9qZGlGlJxeeAS8W1NP
 gTQiBfRNg25vxlTK/iymn7K1stB94kaWA4tS+bCmLSP7E4a7c8/hQomFSoQmvjTxhOSL
 Yufw==
X-Gm-Message-State: AOAM533H8kmRgWJpwAqbSJPob93QEYo5OTILkePgYjJERg6+HOqC/UaP
 /bE/WFSY/WIpIGMHVm4tDw4MR9rrm/I=
X-Google-Smtp-Source: ABdhPJzxPkTj1UPYzzQsR0gYb599rMR8yrM/NJ+afICjEKxWwEv4y3qR67EeyoEEk9xsEL61lZDDug==
X-Received: by 2002:adf:9dcc:: with SMTP id q12mr17282035wre.213.1613918243820; 
 Sun, 21 Feb 2021 06:37:23 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d65sm12155782wmc.34.2021.02.21.06.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/43] vt82c686: Fix up power management io base and config
Date: Sun, 21 Feb 2021 15:34:23 +0100
Message-Id: <20210221143432.2468220-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Similar to the SMBus io registers there is a power management io range
that is set via similar base address reg and enable bit. Some handling
of this was already there but with several problems: using the wrong
registers and bits, wrong size range, not acually updating mapping and
handling reset correctly, nor emulating any of the actual io
registers. Some of these errors are fixed up here.

After this patch we use the correct base address register, enable bit
and region size and allow guests to map/unmap this region, but we
still don't emulate any of the registers in this range.

PMD notes regarding the Configuration Space Power Management Registers:

  - 0x40 General Configuration 0

  - 0x41 General Configuration 1

    . Bit 7: I/O Enable for ACPI I/O Base

  - 0x48 Power Mgmt I/O Base

    . Bit 0: Always set
    . Bits 7-15: Power Management I/O Register Base Address
      (this explains the change 0xffc0 -> 0xff80)

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <cff9b2442d3e2e1cfbdcbc2dfbb559031b4b1cc1.1610223397.git.balaton@eik.bme.hu>
[PMD: Split original patch, this is part 4/4, added notes]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 48ead5af551..cb2f7142607 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -39,14 +39,11 @@ struct VT686PMState {
 
 static void pm_io_space_update(VT686PMState *s)
 {
-    uint32_t pm_io_base;
-
-    pm_io_base = pci_get_long(s->dev.config + 0x40);
-    pm_io_base &= 0xffc0;
+    uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;
 
     memory_region_transaction_begin();
-    memory_region_set_enabled(&s->io, s->dev.config[0x80] & 1);
-    memory_region_set_address(&s->io, pm_io_base);
+    memory_region_set_address(&s->io, pmbase);
+    memory_region_set_enabled(&s->io, s->dev.config[0x41] & BIT(7));
     memory_region_transaction_commit();
 }
 
@@ -92,6 +89,13 @@ static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
 
     trace_via_pm_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
+    if (ranges_overlap(addr, len, 0x48, 4)) {
+        uint32_t v = pci_get_long(s->dev.config + 0x48);
+        pci_set_long(s->dev.config + 0x48, (v & 0xff80UL) | 1);
+    }
+    if (range_covers_byte(addr, len, 0x41)) {
+        pm_io_space_update(s);
+    }
     if (ranges_overlap(addr, len, 0x90, 4)) {
         uint32_t v = pci_get_long(s->dev.config + 0x90);
         pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
@@ -156,17 +160,15 @@ static void vt82c686b_pm_reset(DeviceState *d)
     /* SMBus IO base */
     pci_set_long(s->dev.config + 0x90, 1);
 
+    pm_io_space_update(s);
     smb_io_space_update(s);
 }
 
 static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 {
     VT686PMState *s = VT82C686B_PM(dev);
-    uint8_t *pci_conf;
 
-    pci_conf = s->dev.config;
-    pci_set_word(pci_conf + PCI_COMMAND, 0);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_FAST_BACK |
+    pci_set_word(dev->config + PCI_STATUS, PCI_STATUS_FAST_BACK |
                  PCI_STATUS_DEVSEL_MEDIUM);
 
     pm_smbus_init(DEVICE(s), &s->smb, false);
-- 
2.26.2


