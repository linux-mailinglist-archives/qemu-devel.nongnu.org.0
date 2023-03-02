Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8386A8C10
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrc4-000702-85; Thu, 02 Mar 2023 17:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrc1-0006zB-PF
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:21 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrbz-0008Q4-Gi
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id v16so659509wrn.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGLX24+M0yUzTdArc9wULeHBvztrfWJqtGM1+N7rTy8=;
 b=lkXMb2pmp0VBpjxu+KgHJRXikOFCoOPaEn9jhjjf+pZY/se/m6/bjXTLAXumgYB2Fo
 grUMWFWZt1REFn3c2B8vedD5qR+cFpC3oZmvlKXoBg9KWWv2m0pz6UpslDTnTDazyr7Y
 JyTFtD7a8WlfJ60UoixzlC5tDpHh2ImTb2WmagLBmMPfivOzvo0UFpq5YmvbxfhINwWL
 R30WJOrdswAeQg5y4XTlcDNDf/8gaMpZaIxwbreXImQMUtON3OojSLgTcYJhM0upDTvP
 DHIJcR1jhWReIDy2igCtv0dUtX3GgSFNvE5bYrGgroGvBOBqXQ7i261q/tWimusV4lU8
 UamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGLX24+M0yUzTdArc9wULeHBvztrfWJqtGM1+N7rTy8=;
 b=klsLir9UrmGNSIoc9pJmCpDK0fhlvVSLBatn5rad6J9HcFa+aFYsgjL9PcX8Sf5Ucz
 k+0xvO6+dqmSNDpeQMlRgK/D2LhmS0lf8znZp3xwvt3nbAXTgu7bOVGDRi408810Rt2n
 AvKRL4Drj0sp514Rh5WsN8jo1UQ45bypfJhCEPKN5AZ4Nvd/DGXRErlNPLRx82c9NRS6
 auKQHkkQK9Ou/ZZ6BJeR+ZswpcyolA/oqus+Pl7gjPHEXCB/hohgPSXWnb+cWBEbJuOi
 mxvpj/KKtHDg5X7AKV0v9d9me7ZunL9LxLws0o2rF7+dCrzIcdooAFaXAt+HEajcm3Mk
 mbvw==
X-Gm-Message-State: AO0yUKUhQi2pAFlDhNg+E7/3G188hYMz/XwCEXJk3lpCwD9/WnjmGTA5
 uxiX8i0an8YApIswEno0vjFlLz6Hz/OJTcuw
X-Google-Smtp-Source: AK7set/VdsYSqCf/teNcK0HX2PypW1I9sRFjn1vqmKM9NYD97DCMEmg/QdI2OuTPtjMnTou58f3iEA==
X-Received: by 2002:adf:fc8b:0:b0:2bf:d285:b787 with SMTP id
 g11-20020adffc8b000000b002bfd285b787mr8422599wrr.56.1677796877885; 
 Thu, 02 Mar 2023 14:41:17 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 z5-20020a5d4c85000000b002c71703876bsm504884wrs.14.2023.03.02.14.41.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:41:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org
Subject: [PATCH v3 02/18] hw/ide/piix: Allow using PIIX3-IDE as standalone PCI
 function
Date: Thu,  2 Mar 2023 23:40:42 +0100
Message-Id: <20230302224058.43315-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In order to allow Frankenstein uses such plugging a PIIX3
IDE function on a ICH9 chipset (which already exposes AHCI
ports...) as:

  $ qemu-system-x86_64 -M q35 -device piix3-ide

add a kludge to automatically wires the IDE IRQs on an ISA
bus exposed by a PCI-to-ISA bridge (usually function #0).
Restrict this kludge to the PIIX3.

Reported-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO: describe why this configuration is broken (multiple
output IRQs wired to the same input IRQ can lead to various
IRQ level changed in the iothread, thus missed by the vCPUs).
---
 hw/ide/piix.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index a36dac8469..7cb96ef67f 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -170,6 +170,18 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
+    if (!d->isa_irq[0] && !d->isa_irq[1]
+                       && DEVICE_GET_CLASS(d)->user_creatable) {
+        /* kludge specific to TYPE_PIIX3_IDE */
+        Object *isabus = object_resolve_path_type("", TYPE_ISA_BUS, NULL);
+
+        if (!isabus) {
+            error_setg(errp, "Unable to find a single ISA bus");
+            return;
+        }
+        d->isa_irq[0] = isa_bus_get_irq(ISA_BUS(isabus), 14);
+        d->isa_irq[1] = isa_bus_get_irq(ISA_BUS(isabus), 15);
+    }
     for (unsigned i = 0; i < ARRAY_SIZE(d->isa_irq); i++) {
         if (!pci_piix_init_bus(d, i, errp)) {
             return;
@@ -202,6 +214,13 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    /*
+     * This function is part of a Super I/O chip and shouldn't be user
+     * creatable. However QEMU accepts impossible hardware setups such
+     * plugging a PIIX IDE function on a ICH ISA bridge.
+     * Keep this Frankenstein (ab)use working.
+     */
+    dc->user_creatable = true;
 }
 
 static const TypeInfo piix3_ide_info = {
@@ -225,6 +244,8 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    /* Reason: Part of a Super I/O chip */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo piix4_ide_info = {
-- 
2.38.1


