Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B29379E5A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:22:38 +0200 (CEST)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJun-0006lr-8T
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrY-0007mU-AC; Tue, 11 May 2021 00:19:16 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrW-0000fn-Ts; Tue, 11 May 2021 00:19:16 -0400
Received: by mail-ej1-x633.google.com with SMTP id t4so27789257ejo.0;
 Mon, 10 May 2021 21:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRm53kHLT4/pnioKido8rYXjx6j0CRl97jvo0aFqgdc=;
 b=PVekdm2feesMQBHWZ4jhMBIrHBn03oO2suMIHccOwdmcuz23zBO+drwISsx+DO/H88
 UMZWZMbTSIYYqiMZQ/L+mIXSztF+Imk9nzfX8cZu9dNpRSNzSyZnhoHH4LM7I+lOlxJ/
 45OOpaWNH41yT+XaOnoV4B8XCwKTnlfYdf42wzHif3aFM8hWqZWkM0i1jtNzlzIdebpk
 4fCvcK8uwkKOJNI/2Lyo5ym6dwHq9z3UHOJGg54hT0+82SGRJ4RmuoBZRlwOsiYt12lo
 nKzsBR+OMGdmj+qpXxQ8E3G3ZfU79Mq4y4AaztQXt6y1BzYdLmZiDTuriYXR4DfhUDrh
 LZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iRm53kHLT4/pnioKido8rYXjx6j0CRl97jvo0aFqgdc=;
 b=khTCTR6Fs9pjBLx7nF3QBR8ahwEVU/Ex1KXtMLU+GYtRRHdR8DfTm3Mbw6/+0yrK2p
 Z3FhiwyuxH3GMm6orURabajGfwZFOk7m1Xe2YnR+yD62903rvexpEdfoHImJcyMP2WxG
 WHrdo3XLGQ4vj4acVi4dKEj4K7JF9Q7Gy239w5WaH/yxep9txd49hCSqghn3PlZrCGmx
 HxSaWMhsfsBoPXwJ0tOE3zm3t7bRY/79lp2/84iGrQgDL8Mkz7eHIKk1BSZcnzi2dU+8
 LkcgTWPUmCbqDo3yBpD7WAfw7phAWC9Qgh0HPcdUqsc0Zg2AoOhYVv/VLzlT8OIkNGOA
 TOIA==
X-Gm-Message-State: AOAM531QqIG1a1S3Po390aRD1xaUEBKMuH/NN4MdQ497NgyBOE2dZ6fD
 lGncvmOrTHC5Y+6IvsjkqrypxK1X/bRpUw==
X-Google-Smtp-Source: ABdhPJx03hO8nZubSLFIkytGQiRgZRp9i/WaE6m1Jcm5qQlXogNcewzHHEzzvHusIw6n5S6vRsygRA==
X-Received: by 2002:a17:906:3b84:: with SMTP id
 u4mr29371173ejf.131.1620706753099; 
 Mon, 10 May 2021 21:19:13 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s12sm1300068edr.54.2021.05.10.21.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:19:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] hw/ide/via: Replace magic 2 value by ARRAY_SIZE /
 MAX_IDE_DEVS
Date: Tue, 11 May 2021 06:18:46 +0200
Message-Id: <20210511041848.2743312-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511041848.2743312-1-f4bug@amsat.org>
References: <20210511041848.2743312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
2.26.3


