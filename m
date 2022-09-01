Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE59E5A9D9A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:59:04 +0200 (CEST)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnWx-0007Kd-AU
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2P-0002Nb-LI
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:30 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2J-0001Sr-VE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:28 -0400
Received: by mail-ej1-x630.google.com with SMTP id qh18so15549520ejb.7
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=06rOiewX8uHl0FzAKwkn91iOHt+jshwZH8a2/tFr+mg=;
 b=WVf2q54J5wfeGyPiJQlbuxTgOEldy0DBggUb65KZedJUPWnLTsmMa2q6uiMfvXbCrL
 k0BFo+2vnkNGA+Ql1Muk7ZJCBYMWoOwdtYvCSSA2j1rVIii4dB9RD5zF5Uj7LeUQ/1DR
 tXlBohxnjY13p6L/AfMwvewhvBwmaA0rHyPTeL4btRbaQteTaKzeIak7jLkAmOUR5CYx
 OUgRNpwy9QAp88VD8LFs4JHEYrTlT/I52hcp0c0jZYuahOp91df/o5Byzm9LOt5I6iHe
 Jrr1ReeG0jIJE7uVBH26w3L9zhLJ57ZsIHaaFjO7S+IVlmUzy4ZiIR/L1Ju5SBan3PGC
 mKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=06rOiewX8uHl0FzAKwkn91iOHt+jshwZH8a2/tFr+mg=;
 b=HHDNlhz6JHZz4nGSkuTkXQVK1LM+ssNFhyhIHq19GfED1uKntevKjxGVAibLB2MqQo
 JksWQuEdcq6U3XJWSBB0mlxGy3RtftuwnwCmwn46BHhXHre1UpEu77RNIzLOHWBhWsCk
 gxXb9GStAWHcjkkT2nmyA8WUKyZYnQVXjYYN02rpLRcDyOF+fscl9ZVuFwsIc06HNga6
 KfLWyn+vG7TIFWk5PiFBjDoucyVi6uJ1u0kYyqXjInkA3EsdUewHK7mamML0IFqJhrHZ
 oeC6vgpGiam8P+qhMiN2willEKPW5dHAXYRBYQYiVDcz9Rmqqywl/lXGD2/e+6BLj0CH
 AmlQ==
X-Gm-Message-State: ACgBeo3IYEd7Uk5QcGLyupkRhiKIE88yCc0h3X42YFNtBMcevn/P828J
 hkqVfcf2BN2Ss07ZBV00zL7hsyDlCP4=
X-Google-Smtp-Source: AA6agR4GfA8AKpVppqNH1sdff5PvmcoiYeJRfcc0ITfBg6u1ZsBcz//A3ZADNWtv0Tzo5VR5uxzClg==
X-Received: by 2002:a17:907:3f0c:b0:73d:60fc:6594 with SMTP id
 hq12-20020a1709073f0c00b0073d60fc6594mr25144029ejc.669.1662049641854; 
 Thu, 01 Sep 2022 09:27:21 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:21 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 31/42] hw/isa/piix4: Rename reset control operations to match
 PIIX3
Date: Thu,  1 Sep 2022 18:26:02 +0200
Message-Id: <20220901162613.6939-32-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both implementations are the same and will be shared upon merging.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 95e4a9f3c1..e682370887 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -151,7 +151,7 @@ static const VMStateDescription vmstate_piix4 = {
     }
 };
 
-static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
+static void rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
     PIIXState *s = opaque;
@@ -164,16 +164,16 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
     s->rcr = val & 2; /* keep System Reset type only */
 }
 
-static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
+static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned int len)
 {
     PIIXState *s = opaque;
 
     return s->rcr;
 }
 
-static const MemoryRegionOps piix4_rcr_ops = {
-    .read = piix4_rcr_read,
-    .write = piix4_rcr_write,
+static const MemoryRegionOps rcr_ops = {
+    .read = rcr_read,
+    .write = rcr_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -193,7 +193,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-- 
2.37.3


