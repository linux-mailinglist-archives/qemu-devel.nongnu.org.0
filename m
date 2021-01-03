Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C582E8E2E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:56:33 +0100 (CET)
Received: from localhost ([::1]:49644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAQS-0007iY-OC
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKs-0002WD-Vy
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKr-0005jE-Fj
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a6so15938010wmc.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJEfvgkW151yoqlrnwbVD77R8FV2DDiUd+HFwtJzojs=;
 b=WdcEoG0oxwcSelex4dvFqaBNFEa3nZFK2uNicwzSmSG4hh3qge+IZnjIkyA3Pu3uZv
 GNPyvVgGwABkb/jrMZuH3x0t85yAHy09SQTK+Lb839AiPQ8G+cLtk2A50PchKDsqZydD
 oCdiOgrLd4rHrkh3Xsgn2xx0JZjnVRFJKzpXcM1tJO9PiAgyxto7Zgx7AEDhYbTWRbgY
 pJUQLI/d8UDDoVyvSqmU4ss0+tCrh9VDC2A6imGIYAB+6HpOPHwAYmL9vmtUtHqhoJ8C
 h0sSry+Aw8z8NArZDogVuMLi6InLcwzH861p9jbv3w64lGaCcTnwFpDGZhBDoCkojYdt
 2WBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mJEfvgkW151yoqlrnwbVD77R8FV2DDiUd+HFwtJzojs=;
 b=RzvL2SKTT7VqhXqpLk6YC2e9CMwlZJWSLydFBCS2iwunGxdGtXdU7tKa0KVdDs8PyF
 L85fbxdQ8JwAdGgaI4PRwo+qh3NpL3uU24XNyAlqtyzqb/Ix6sHMl/yc1du+lSqgWV6L
 lTJstmzrV9x4quzavKB0ORIVlpSL2lnYHok6uNBWXv3rcvv5nVHUFgB7CYQDO4fszCmR
 fzetVQoMktpliQOJzFmdkjIRU43OCmIby8zCXisOSdH8ZUV+YUI0FstxbQjWOf9udh3Y
 4EjDx4yCe/E4SsG5ZhFSwrraf8tkltj4X6ZDzcNjYNlLBU4RbGOl+B7aXW4z1w5Jm2ds
 R0dg==
X-Gm-Message-State: AOAM530K+m1jro/FprCBWdVETx/5o+GRpVqAP21QxdDIvKuVzRDOIY9x
 +xw9ibj4RsMQoXS+P5VgHwWUiALwJV8=
X-Google-Smtp-Source: ABdhPJwpovTfdV8FixNNVUx3evK5bqs3G/HloZtnyt3odGRgwzeiv5NrcKpRHI94a1vbk6YGsvHVzg==
X-Received: by 2002:a1c:3987:: with SMTP id g129mr23731953wma.86.1609707044035; 
 Sun, 03 Jan 2021 12:50:44 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id r16sm90250921wrx.36.2021.01.03.12.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:50:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/35] hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'
Date: Sun,  3 Jan 2021 21:49:50 +0100
Message-Id: <20210103205021.2837760-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a generic PCI_DEVFN() macro in "hw/pci/pci.h"
to pack the PCI slot/function identifiers, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20201012124506.3406909-6-philmd@redhat.com>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Message-Id: <20201231224911.1467352-4-f4bug@amsat.org>
---
 hw/arm/virt.c          | 3 ++-
 hw/pci-host/bonito.c   | 2 +-
 hw/pci-host/uninorth.c | 6 ++----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 96985917d3b..bf3a7171118 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1147,7 +1147,8 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                      full_irq_map, sizeof(full_irq_map));
 
     qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupt-map-mask",
-                           0x1800, 0, 0, /* devfn (PCI_SLOT(3)) */
+                           cpu_to_be16(PCI_DEVFN(3, 0)), /* Slot 3 */
+                           0, 0,
                            0x7           /* PCI irq */);
 }
 
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index ee8b193e15b..40dda237d8e 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -631,7 +631,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
     phb->bus = pci_register_root_bus(dev, "pci",
                                      pci_bonito_set_irq, pci_bonito_map_irq,
                                      dev, &bs->pci_mem, get_system_io(),
-                                     0x28, 32, TYPE_PCI_BUS);
+                                     PCI_DEVFN(5, 0), 32, TYPE_PCI_BUS);
 
     for (size_t i = 0; i < 3; i++) {
         char *name = g_strdup_printf("pci.lomem%zu", i);
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index f0a4d8c7178..d25b62d6a5b 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -68,10 +68,8 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint32_t addr)
         /* ... and then convert them to x86 format */
         /* config pointer */
         retval = (reg & (0xff - 7)) | (addr & 7);
-        /* slot */
-        retval |= slot << 11;
-        /* fn */
-        retval |= func << 8;
+        /* slot, fn */
+        retval |= PCI_DEVFN(slot, func) << 8;
     }
 
     trace_unin_get_config_reg(reg, addr, retval);
-- 
2.26.2


