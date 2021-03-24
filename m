Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726E34801D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:13:49 +0100 (CET)
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP80q-0004sV-Jl
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7is-0004U3-Sq; Wed, 24 Mar 2021 13:55:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7iq-0008Vf-TS; Wed, 24 Mar 2021 13:55:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so1709678wml.2; 
 Wed, 24 Mar 2021 10:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjAULdJLLfqXphaxErcjk/Xv0LxkTKy/1JUt+S9ziaQ=;
 b=ew3fbTBaRorvz41omS5ieF8HOPSTiR3aj4zWWVBvZZVSQ2N4E1LzOvt2LjIxwsWviP
 zqvrC+hHCkgK5PLshpA5lqukTRrB75+YohxkCZEZ9QfycM5LPGzPVfDLm6jmqu1DrKtP
 NnAtDUhZlQg1AXZfW1vlhiKtp/URQAUWoV1Co8mmylhqPzX0fFmJvjakkkHBu7fFb9f4
 mww2SIaKKLQZD6cMZeTReiXXGk1jb0mDeZ60LPVCXOyGslnCJwOdwPFifDiXpjXADfn9
 VwYIfPLB4X5KIwVyzrLt/ELSx/o0tpN/b0GdItYH8m+TLnyvAJVU/vrMjRIiFZZNYEBE
 IhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RjAULdJLLfqXphaxErcjk/Xv0LxkTKy/1JUt+S9ziaQ=;
 b=rPK5WyKugKA7XKsB1zr52BmnX1zJscmAnOPd/9amWIyMZY81gFRdSmrXggW7KZNw48
 w83Vy630QC4sWMhvwiMPMQp/NoFjQJKMB6igbQFJdfgMeE77e8sKOkzlqZUMwPxHv+Yc
 qmaIXS8mrTSyTZ8E9gxvbQg9m0So+dwatGGnhrvwtyRozTGrSP9p5nK/CAFyqk3j25yc
 0Fi+cBYGC7lRISJrJh43/nxZTTlcfn4G3BtvwTmpSn/pFX7e+RjBlSgQ5t8dc35tFJUi
 DnsVZpGGr6clQr3eH/lMWEN5CHOre0AjBytGzmm/mnjrBiU+IgrMDWVK7gVpURCsjz8c
 35ag==
X-Gm-Message-State: AOAM53264nQJ/h1/en4VY0Oft/pjkumW77L57xLaB0lBO4CErsD1jIxe
 hMXQ8Bhm1xIMYftvw6UL09BRP1ZpMUczpw==
X-Google-Smtp-Source: ABdhPJx+f4o1MIxR0D6AdZk65y/2If9Z8Ti6540mucBLkek3QhW0ekQlX9rAORF21Ws2E9u43yRpAQ==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr4176259wme.114.1616608511053; 
 Wed, 24 Mar 2021 10:55:11 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b17sm4127034wrt.17.2021.03.24.10.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:55:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/ide/via: Replace magic 2 value by ARRAY_SIZE /
 MAX_IDE_DEVS
Date: Wed, 24 Mar 2021 18:54:36 +0100
Message-Id: <20210324175438.680310-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324175438.680310-1-f4bug@amsat.org>
References: <20210324175438.680310-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/via.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index be09912b334..6c667a92130 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -90,7 +90,7 @@ static void bmdma_setup_bar(PCIIDEState *d)
     int i;
 
     memory_region_init(&d->bmdma_bar, OBJECT(d), "via-bmdma-container", 16);
-    for(i = 0;i < 2; i++) {
+    for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
         BMDMAState *bm = &d->bmdma[i];
 
         memory_region_init_io(&bm->extra_io, OBJECT(d), &via_bmdma_ops, bm,
@@ -122,7 +122,7 @@ static void via_ide_reset(DeviceState *dev)
     uint8_t *pci_conf = pd->config;
     int i;
 
-    for (i = 0; i < 2; i++) {
+    for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
         ide_bus_reset(&d->bus[i]);
     }
 
@@ -188,9 +188,9 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     bmdma_setup_bar(d);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
 
-    qdev_init_gpio_in(ds, via_ide_set_irq, 2);
-    for (i = 0; i < 2; i++) {
-        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
+    qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
+    for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
+        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, MAX_IDE_DEVS);
         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
@@ -204,7 +204,7 @@ static void via_ide_exitfn(PCIDevice *dev)
     PCIIDEState *d = PCI_IDE(dev);
     unsigned i;
 
-    for (i = 0; i < 2; ++i) {
+    for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
         memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
         memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
     }
-- 
2.26.2


