Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D190B6EB9DE
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:09:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEqB-00022O-6h; Sat, 22 Apr 2023 11:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEqA-00020P-66; Sat, 22 Apr 2023 11:07:54 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq8-0005DP-By; Sat, 22 Apr 2023 11:07:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so20344495a12.1; 
 Sat, 22 Apr 2023 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176070; x=1684768070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70amNcFRM4HuTsXsfWZUiYe5Fbg2eChLVl5XJ9dSD2k=;
 b=UCnRlXVTPabatNUq52Mxx7tkcVBdcpzjNjNBZtn6wRt3xJ86f5PzSYch6kiAv3JssJ
 WgStR3galdyJgMV8D713S0wUwVVlAu23KQGiqsAGZxJaUKegnA2xMdYy53k7w8rHDcV6
 rskiDeBWbfEN+N+5KLAq2+wm0/1OU4BJy+RJIxDiOPyqKxG9R/Kpri7ZSkn2XOfTHsMr
 yDfecvp5BjS0zHXVxOL0FNRSst7ACq3VI1/fXX12COMg5VyRTWmENzNfgiVPAlK8Xbss
 WvgZzmKbJCUhATABVhNK/TKmDBDOr6bEad6uKqz16KuPxeuOKV7pXQ+Q9hVMfZYIhpxO
 M2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176070; x=1684768070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70amNcFRM4HuTsXsfWZUiYe5Fbg2eChLVl5XJ9dSD2k=;
 b=JcVRyaKSQaxQ9bRsgeANO+vY8yXtKFlZxjGv5385cYXcfxg/2XN+VXuuOb0PRVKYSF
 628VPtVfux60u5+DK2HlKw1k01AecuZe7xWAqlAuKANmZxIM3pB2+bCQoSs8SRLcnywB
 Wl1cu6LSnN6lAokFGDxK1t4c9z4fBB5cRDiw5MDwMOZ7Lfk1ym9SQKy/c0ZcGDqAQnSh
 jNqqAXEZ+XJAqEPkUa53zAGZ8xc0/myW3BfGcQoWjj2bWjB4ODCRYQphkLook/cQmo4v
 uGsTW00DfZ/ltc9BYib9qyUqR1EQ5qmHGE3QkxTMHOQzeH1c4MPMjyNtiHKlnHA+9gpu
 QvEA==
X-Gm-Message-State: AAQBX9cYJ2boP3ci3GNBjOQMRP5BbkezcVmfish2haUZtHTSa7Y2VeUN
 YN+q4fPORGwtcCPJ3df00JJSAr/i9OY=
X-Google-Smtp-Source: AKy350ai81YwkOFO3vyejoAppdTNu3FUSF8xKm+Id9GG2MavvQDdVLps7OLxpLzlPvJuOYJF5WqdNg==
X-Received: by 2002:a17:906:1d51:b0:953:7d80:c40e with SMTP id
 o17-20020a1709061d5100b009537d80c40emr6207948ejh.0.1682176070007; 
 Sat, 22 Apr 2023 08:07:50 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:49 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 13/13] hw/ide: Extract bmdma_clear_status()
Date: Sat, 22 Apr 2023 17:07:28 +0200
Message-Id: <20230422150728.176512-14-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Extract bmdma_clear_status() mirroring bmdma_cmd_writeb().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/pci.h |  1 +
 hw/ide/cmd646.c      |  2 +-
 hw/ide/pci.c         |  7 +++++++
 hw/ide/piix.c        |  2 +-
 hw/ide/sii3112.c     | 12 +++++-------
 hw/ide/via.c         |  2 +-
 hw/ide/trace-events  |  1 +
 7 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 81e0370202..6a286ad307 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -59,6 +59,7 @@ struct PCIIDEState {
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
 void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops);
 void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
+void bmdma_clear_status(BMDMAState *bm, uint32_t val);
 void pci_ide_create_devs(PCIDevice *dev);
 
 #endif
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index b9d005a357..973c3ff0dc 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -144,7 +144,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
         cmd646_update_irq(pci_dev);
         break;
     case 2:
-        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
+        bmdma_clear_status(bm, val);
         break;
     case 3:
         if (bm == &bm->pci_dev->bmdma[0]) {
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 3539b162b7..4aa06be7c6 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -318,6 +318,13 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val)
     bm->cmd = val & 0x09;
 }
 
+void bmdma_clear_status(BMDMAState *bm, uint32_t val)
+{
+    trace_bmdma_update_status(val);
+
+    bm->status = (val & 0x60) | (bm->status & BM_STATUS_DMAING) | (bm->status & ~val & 0x06);
+}
+
 static uint64_t bmdma_addr_read(void *opaque, hwaddr addr,
                                 unsigned width)
 {
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 406a67fa0f..9eab615e35 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -76,7 +76,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
         bmdma_cmd_writeb(bm, val);
         break;
     case 2:
-        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
+        bmdma_clear_status(bm, val);
         break;
     }
 }
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 373c0dd1ee..1180ff55e7 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -66,7 +66,7 @@ static void sii3112_bmdma_write(void *opaque, hwaddr addr,
                                 uint64_t val, unsigned int size)
 {
     BMDMAState *bm = opaque;
-    SiI3112PCIState *d = SII3112_PCI(bm->pci_dev);
+    SiI3112PCIState *s = SII3112_PCI(bm->pci_dev);
     int i = (bm == &bm->pci_dev->bmdma[0]) ? 0 : 1;
 
     trace_sii3112_bmdma_write(size, addr, val);
@@ -75,10 +75,10 @@ static void sii3112_bmdma_write(void *opaque, hwaddr addr,
         bmdma_cmd_writeb(bm, val);
         break;
     case 0x01:
-        d->regs[i].swdata = val & 0x3f;
+        s->regs[i].swdata = val & 0x3f;
         break;
     case 0x02:
-        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 6);
+        bmdma_clear_status(bm, val);
         break;
     default:
         break;
@@ -160,8 +160,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
         d->regs[0].swdata = val & 0x3f;
         break;
     case 0x12:
-        d->i.bmdma[0].status = (val & 0x60) | (d->i.bmdma[0].status & 1) |
-                               (d->i.bmdma[0].status & ~val & 6);
+        bmdma_clear_status(&d->i.bmdma[0], val);
         break;
     case 0x18:
         bmdma_cmd_writeb(&d->i.bmdma[1], val);
@@ -170,8 +169,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
         d->regs[1].swdata = val & 0x3f;
         break;
     case 0x1a:
-        d->i.bmdma[1].status = (val & 0x60) | (d->i.bmdma[1].status & 1) |
-                               (d->i.bmdma[1].status & ~val & 6);
+        bmdma_clear_status(&d->i.bmdma[1], val);
         break;
     case 0x100:
         d->regs[0].scontrol = val & 0xfff;
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 35dd97e49b..afb97f302a 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -75,7 +75,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
         bmdma_cmd_writeb(bm, val);
         break;
     case 2:
-        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
+        bmdma_clear_status(bm, val);
         break;
     default:;
     }
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index a479525e38..d219c64b61 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -30,6 +30,7 @@ bmdma_write_cmd646(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx64" : 0x%
 # pci.c
 bmdma_reset(void) ""
 bmdma_cmd_writeb(uint32_t val) "val: 0x%08x"
+bmdma_update_status(uint32_t val) "val: 0x%08x"
 bmdma_addr_read(uint64_t data) "data: 0x%016"PRIx64
 bmdma_addr_write(uint64_t data) "data: 0x%016"PRIx64
 
-- 
2.40.0


