Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3232E85E2
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:15:38 +0100 (CET)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTdx-00087f-FN
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTat-0004Dh-Qa; Fri, 01 Jan 2021 18:12:28 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTar-0001ry-23; Fri, 01 Jan 2021 18:12:27 -0500
Received: by mail-wm1-x32f.google.com with SMTP id q75so10479649wme.2;
 Fri, 01 Jan 2021 15:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJ6DGCmp4jd6lh0s03hUoPTgsGD64Qh4DJvWtvXP8BM=;
 b=UQ1eN8h9rv2Y6SjGKKf4/kMRsbVov8NFQh2zHMp6wRZmPkL0RAAUf9OZCbzDuQQpq0
 bPmRYtLUGfY/XgEcuT9ptmAtNy2/nk1NiyC/qAT0/TbHfwlOkg0JrkELmZno7p5S6Yre
 FqyBMmepbHNAtDJ5W65IqKBXY6nkHIsuBzyKLJiHpxi7wLuM+SfgKSSg4NC0f8CyKTy6
 ZdtZpZ+3rjyfWp5da/IS/cLkgVZQ4g/9dGLzdx7xhJR/Vdcwpa9XbLR/CPIYumm2Oj1h
 W9KN0JtkVzUJvCFbBpHopSD7Ltb4kW+YWeSJQRX9yR8tyrNdh70HgaBb1WSMxwCGQoSl
 YLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AJ6DGCmp4jd6lh0s03hUoPTgsGD64Qh4DJvWtvXP8BM=;
 b=H1wiC7otA6GSpqqTYBGI/nRKyY1wjuspnF9T3itb0OSr9GvpsbPcuxFZlNX7qBRJbi
 NNZ5xDVft/2d8m59VjotPUj4afyhpoY4gXG32GQl+z1eAyEF805lO3CjwhWI9Qzrs3n8
 3zgMDGDF4IxN5nB/sj+L8e8DzUi49O4BSW52++j14610TPfxQxRnWZ6sMHRxUymIB84u
 uh4kxByMIld6OC2hHu7FJiABgFODp6lYp221HLBipZnv2/LEY3KG3GEuEZKxZ4sO/7+X
 3xbzQhZAdlaz/hEp8FZ/+bJoHHbZXuPOM0IlmFUONi5LpSbKqTliTh72DHDxvew7FxLP
 khNw==
X-Gm-Message-State: AOAM5337JYMqmacGbSeE2llrJdJt3MKJfKQUfTYwd1vj5HlHq7EYWaU1
 k1Q0q9BR4a8NY+RRMcq0eMFCMNX3/4g=
X-Google-Smtp-Source: ABdhPJyNBZOhy9vg9jVE3duI0is1SPUozihIT6tkLhXAIt4rlzddX6JAodqOwt3v/pPjai7IFhPevg==
X-Received: by 2002:a1c:7d58:: with SMTP id y85mr17169880wmc.50.1609542743189; 
 Fri, 01 Jan 2021 15:12:23 -0800 (PST)
Received: from x1w.redhat.com (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id m5sm68345039wrz.18.2021.01.01.15.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 15:12:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/5] ide: Make room for flags in PCIIDEState and add one
 for legacy mode
Date: Sat,  2 Jan 2021 00:12:11 +0100
Message-Id: <20210101231215.1870611-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210101231215.1870611-1-f4bug@amsat.org>
References: <20210101231215.1870611-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

We'll need a flag for implementing some device specific behaviour in
via-ide but we already have a currently CMD646 specific field that can
be repurposed for this and leave room for further flags if needed in
the future. This patch changes the "secondary" field to "flags" and
change CMD646 and its users accordingly and define a new flag for
forcing legacy mode that will be used by via-ide for now.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Message-Id: <28150c05831caea5926d4c6a881f448c2827703d.1609191252.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/ide/pci.h | 7 ++++++-
 hw/ide/cmd646.c      | 6 +++---
 hw/sparc64/sun4u.c   | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c422..75d1a32f6d2 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -42,6 +42,11 @@ typedef struct BMDMAState {
 #define TYPE_PCI_IDE "pci-ide"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIIDEState, PCI_IDE)
 
+enum {
+    PCI_IDE_SECONDARY, /* used only for cmd646 */
+    PCI_IDE_LEGACY_MODE
+};
+
 struct PCIIDEState {
     /*< private >*/
     PCIDevice parent_obj;
@@ -49,7 +54,7 @@ struct PCIIDEState {
 
     IDEBus bus[2];
     BMDMAState bmdma[2];
-    uint32_t secondary; /* used only for cmd646 */
+    uint32_t flags;
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index c2546314855..cfea7fca06f 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -255,8 +255,8 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
 
     pci_conf[PCI_CLASS_PROG] = 0x8f;
 
-    pci_conf[CNTRL] = CNTRL_EN_CH0; // enable IDE0
-    if (d->secondary) {
+    pci_conf[CNTRL] = CNTRL_EN_CH0; /* enable IDE0 */
+    if (d->flags & BIT(PCI_IDE_SECONDARY)) {
         /* XXX: if not enabled, really disable the seconday IDE controller */
         pci_conf[CNTRL] |= CNTRL_EN_CH1; /* enable IDE1 */
     }
@@ -314,7 +314,7 @@ static void pci_cmd646_ide_exitfn(PCIDevice *dev)
 }
 
 static Property cmd646_ide_properties[] = {
-    DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
+    DEFINE_PROP_BIT("secondary", PCIIDEState, flags, PCI_IDE_SECONDARY, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 0fa13a73302..c46baa9f489 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -674,7 +674,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     }
 
     pci_dev = pci_new(PCI_DEVFN(3, 0), "cmd646-ide");
-    qdev_prop_set_uint32(&pci_dev->qdev, "secondary", 1);
+    qdev_prop_set_bit(&pci_dev->qdev, "secondary", true);
     pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
     pci_ide_create_devs(pci_dev);
 
-- 
2.26.2


