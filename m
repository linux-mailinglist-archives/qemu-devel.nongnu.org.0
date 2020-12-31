Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621F2E829B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 00:00:53 +0100 (CET)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6w8-0007A3-8n
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 18:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6m2-0002SW-2d
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:28 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6m0-0006lb-Nk
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:25 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 91so21025687wrj.7
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qScEGFj7AcZq0QlXolKGt5D9IhypmF9z1VDvyAbEW+g=;
 b=V3SX3xbHRjtZmp+wuexeWM6t8GEg7BN1cgLLee4UfkJAUzxWZsdQ89owwPe/Sw3Yve
 aBFouVKcgma4qv2zOl8KrRa3Yo3X+eLRXTyfgXRTjflFhQIVx0EPPTH46XyhC8AiZBb+
 lMKTzaG32MFgqBG3gSEHn6YVv5Ome7drdUTl158iu9Yf60SuXoS4awD2h8dxtB07nplG
 BOPIt/JTKW+aY4ZiqS6kwD3NCUj9xuR47PVAFTc/n3GqTpDgu50cASJbh+mqKZOt23ly
 NGbhGaMUku4nHjHGh5iiqksPUnuk4tUjGNdrUsfHt3NNZDp4PxMTLTInjUnr1Q6bg2QF
 Ajrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qScEGFj7AcZq0QlXolKGt5D9IhypmF9z1VDvyAbEW+g=;
 b=VZOmIiqBmqcQOFUH1QAlCKdV8tDp/16a9zlKekNFsNRxprWzF65QQxub4MLI4X30Q1
 Gr8EHHQPEXFPDBbu940td5YRURK/mjrQtx0QJwjSP/l5rw532m/kA0Ixsqkp5EpRxang
 hyiNifgJN1HljFjrd8AQm4PJTjBhylHE2J70MXTiL1ImocP9l9F7SVIZktTAJVEL2D5G
 WTT3BGbZBexTAljVUL5FWJIuexHfCzyUldnZIc78d13C6saL5pU4YV6P6qburE53RhOT
 54h6xzh5RecuSzVX5M1+5kV1jfl1Ey6dwVVpZU3/L5rWjEhO3EnLUbpDk+4r2gpg8UkK
 cg6w==
X-Gm-Message-State: AOAM533Ulz1Y01/048p2N7Q55Owcq/T+MwWUkqIOMuCyS0VR0XmtQR7B
 JioaQxxYq4vsY21mUF8mtYvPyRd05OI=
X-Google-Smtp-Source: ABdhPJxDM5KTXzzp4L6BHkGKP3OCWU1ZMHQlBm4/8rDR04Yq5Fn9BNOXpW0EHzYnfdX82zk74r4PXA==
X-Received: by 2002:a5d:5401:: with SMTP id g1mr65489938wrv.93.1609455022445; 
 Thu, 31 Dec 2020 14:50:22 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id j9sm71603552wrm.14.2020.12.31.14.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 14/18] hw/pci-host/bonito: Simplify using
 pci_host_conf_le_ops MemoryRegionOps
Date: Thu, 31 Dec 2020 23:49:07 +0100
Message-Id: <20201231224911.1467352-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 35 +----------------------------------
 1 file changed, 1 insertion(+), 34 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 4dcaa2fa8bb..c09d54cca82 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -362,39 +362,6 @@ static const MemoryRegionOps bonito_northbridge_ops = {
     },
 };
 
-static void bonito_pciconf_writel(void *opaque, hwaddr addr,
-                                  uint64_t val, unsigned size)
-{
-    BonitoPciState *s = opaque;
-    PCIDevice *d = PCI_DEVICE(s);
-
-    DPRINTF("bonito_pciconf_writel "TARGET_FMT_plx" val %lx\n", addr, val);
-    d->config_write(d, addr, val, 4);
-}
-
-static uint64_t bonito_pciconf_readl(void *opaque, hwaddr addr,
-                                     unsigned size)
-{
-
-    BonitoPciState *s = opaque;
-    PCIDevice *d = PCI_DEVICE(s);
-
-    DPRINTF("bonito_pciconf_readl "TARGET_FMT_plx"\n", addr);
-    return d->config_read(d, addr, 4);
-}
-
-/* north bridge PCI configure space. 0x1fe0 0000 - 0x1fe0 00ff */
-
-static const MemoryRegionOps bonito_pciconf_ops = {
-    .read = bonito_pciconf_readl,
-    .write = bonito_pciconf_writel,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-};
-
 static uint64_t bonito_ldma_readl(void *opaque, hwaddr addr,
                                   unsigned size)
 {
@@ -694,7 +661,7 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
     sysbus_mmio_map(sysbus, 0, BONITO_INTERNAL_REG_BASE);
 
     /* set the north bridge pci configure  mapping */
-    memory_region_init_io(&phb->conf_mem, OBJECT(s), &bonito_pciconf_ops, s,
+    memory_region_init_io(&phb->conf_mem, OBJECT(s), &pci_host_conf_le_ops, s,
                           "north-bridge-pci-config", BONITO_PCICONFIG_SIZE);
     sysbus_init_mmio(sysbus, &phb->conf_mem);
     sysbus_mmio_map(sysbus, 1, BONITO_PCICONFIG_BASE);
-- 
2.26.2


