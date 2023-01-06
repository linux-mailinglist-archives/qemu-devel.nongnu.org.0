Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E170C65FFAD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 12:43:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDl7B-000435-Fu; Fri, 06 Jan 2023 06:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDl79-00042Q-DN; Fri, 06 Jan 2023 06:42:23 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDl77-0002xk-Oq; Fri, 06 Jan 2023 06:42:23 -0500
Received: by mail-ej1-x634.google.com with SMTP id kw15so2869500ejc.10;
 Fri, 06 Jan 2023 03:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KIffzC7hiNP3Je610NOCDNP1TSBc4b429CxB6/N0rhg=;
 b=JtnmROGbLlQMFq39C96ggSgOiPve2YfeY8tOdwbsQzTK2xCLriwxOuUZYQOXgP7ThD
 Grcb1NhrSaNsDoZ3ksCZ86ngaX1aKv3GDMIvokrcE+y0jUXxhzdQmhy9lDYWDGoEh2ne
 9C7e0lb/F6tZakthSjLTLxY7S2wiltLV0kYxtU99hZlZ/LAbIdPEjfN8ztWfjILKBH/f
 BDrqoXu3t2J3Gy78hn1SD8Ksgbv0d7PCa7YPFuCLbb/fcVtSmcciETypBXNX9ydtibSO
 iqod8zqx4KDR3/RBMqlfWNZg4nBZHT11IWPbKlp+yRhcf4Hs1SCWg82HVnRraU29d8+6
 54Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KIffzC7hiNP3Je610NOCDNP1TSBc4b429CxB6/N0rhg=;
 b=FxqzJPeEwbYYMALxYtoXITUT/4Xw/PEdc8sI05RzUTKeWwdJlUjBBmdCRfxwzSTQBT
 P6VsAG/CCr7E70iB5VMFqMCX0PSz2SZ18hr+yflVCWal/5v52r480zizGR57Egc/XyZi
 9y7PH65O1mktn4IDPYjpqW6h4RlSaNPmXQrm/TfLdKwlvFCm6WNGVPjFEGJxP1cAZWs4
 O8MAWfOl/p3YVGYNpfeVjJhpiyg47bCEnnWurTE/EfyJ5PF0As642e0lXxnKhzDszv1h
 Lh3wL2P/3PvORZlM5GXxwWLF5vJv9yDMrXVzJ/60sGKk28BXry/yjuIt4J6gmxA537J3
 6HuQ==
X-Gm-Message-State: AFqh2ko7b+NE5bpeVDSjTdKrkJC4XUPvuAbqbcJaIAVaM5CfiUtenmgA
 oZ2TToBEAR+axbzUF8+zZqK2NATp+zZlAw==
X-Google-Smtp-Source: AMrXdXs5qQ4UNUQyUwComPQ36KZKKzrdTDF820rMGDPpo7Ql+EVkm/2Emi40hSOfuZyYmco/lh1pvA==
X-Received: by 2002:a17:907:a481:b0:7c0:c1cc:c68 with SMTP id
 vp1-20020a170907a48100b007c0c1cc0c68mr46607663ejc.6.1673005339647; 
 Fri, 06 Jan 2023 03:42:19 -0800 (PST)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 ky24-20020a170907779800b007c09a304eb5sm313565ejc.201.2023.01.06.03.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 03:42:19 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] hw/pci-host/mv64361: Reuse pci_swizzle_map_irq_fn
Date: Fri,  6 Jan 2023 12:39:27 +0100
Message-Id: <20230106113927.8603-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

mv64361_pcihost_map_irq() is a reimplementation of
pci_swizzle_map_irq_fn(). Resolve this redundancy.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
Testing done:
* `qemu-system-ppc -machine pegasos2 \
                   -rtc base=localtime \
                   -device ati-vga,guest_hwcursor=true,romfile="" \
                   -cdrom morphos-3.17.iso \
                   -kernel morphos-3.17/boot.img`
---
 hw/pci-host/mv64361.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index cc9c4d6d3b..70db142ec3 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -72,11 +72,6 @@ struct MV64361PCIState {
     uint64_t remap[5];
 };
 
-static int mv64361_pcihost_map_irq(PCIDevice *pci_dev, int n)
-{
-    return (n + PCI_SLOT(pci_dev->devfn)) % PCI_NUM_PINS;
-}
-
 static void mv64361_pcihost_set_irq(void *opaque, int n, int level)
 {
     MV64361PCIState *s = opaque;
@@ -97,7 +92,7 @@ static void mv64361_pcihost_realize(DeviceState *dev, Error **errp)
     g_free(name);
     name = g_strdup_printf("pci.%d", s->index);
     h->bus = pci_register_root_bus(dev, name, mv64361_pcihost_set_irq,
-                                   mv64361_pcihost_map_irq, dev,
+                                   pci_swizzle_map_irq_fn, dev,
                                    &s->mem, &s->io, 0, 4, TYPE_PCI_BUS);
     g_free(name);
     pci_create_simple(h->bus, 0, TYPE_MV64361_PCI_BRIDGE);
-- 
2.39.0


