Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091A65A9687
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:18:33 +0200 (CEST)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTj9U-0005Z4-4z
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaT-0005h9-Ed; Thu, 01 Sep 2022 07:42:28 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaK-0000Fq-U9; Thu, 01 Sep 2022 07:42:21 -0400
Received: by mail-ej1-x631.google.com with SMTP id lx1so34031957ejb.12;
 Thu, 01 Sep 2022 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rnyYUAu+pe0wZdjjqbLNbpR1Uc3DHa39ZGgcpBfmRM4=;
 b=l+PEsNAVV21HoubDpjgt1UV8McKx6tOrCUVQzaoyvb6vaG91LVcdCBwY6Wg+TIliCK
 4R130Fn8wnleTOZgyKkQpC4iLHD46bvW1piXRMIujn2y7sg1WswSKjZzAv3YDR0u9Tjf
 AAPScqjnIKIExOt9mc5LiZYEcA6XZlTYvcToH4sZJNpHeHeaLKxLKcfFZIK9JCjyp4Le
 8Flko+C5o5LM1xh2V1hKiaWTloNl/HIK5wlKPM84YuNYeOLfWYB+S6g8wd5yhCTqvN3B
 i8CLqChp9RPArFynNh4kxIx4DG93++LqqvaSOVr+P6GJtiAqL/mAug/qwXaTWkNeOEa0
 evuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rnyYUAu+pe0wZdjjqbLNbpR1Uc3DHa39ZGgcpBfmRM4=;
 b=j6Qy5EiiMBj6JucteuEz7Jx0DUBnnxp5Gmu1OwkAGkdCXuIj4axYlQ74EdaEnMn4oN
 BNvT/OJtt/PeK0EAPYrDBLAwz4HLKPOhybRSPehbGc9k9RMQElGRbs/JEBg2/dkxeXJB
 cZXdOgAGAMgcmisbPv65hUnBwJWQCsE0k9VhlekPpaeKeKz1teKMJBAEoqopLjTV1BxT
 +QMEd9d9gf1jsXX3V9mdqAke7sxmo3c2BA01KpWTWxFGSvAbC5DKK5/IEjzdE7XkIaWb
 QxInN0oLCi85/AJIVV4P7o9W3uir9aODWl57hXaVHrBRYN2tQ8rkfCLiQfrrKgYvoOF2
 zJNg==
X-Gm-Message-State: ACgBeo1zkt6k4payq64ZCtfmQvcyOmdy3GMf+IvC8PpVtnP6WkxYePjT
 iMMoL+h9LuH2/7nZeU4jGryvcOGp68M=
X-Google-Smtp-Source: AA6agR5K7mifTCjYvWDAFnSJu4AAEhIkWAtyCRCup0lbG/5cYOcH91Scu1UdX84o6rsvsfP9zQ0QtA==
X-Received: by 2002:a17:906:7315:b0:741:5b1b:920d with SMTP id
 di21-20020a170906731500b007415b1b920dmr15785408ejc.484.1662032530056; 
 Thu, 01 Sep 2022 04:42:10 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:09 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 13/13] hw/isa/vt82c686: Create rtc-time alias in boards
 instead
Date: Thu,  1 Sep 2022 13:41:27 +0200
Message-Id: <20220901114127.53914-14-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

According to good QOM practice, an object should only deal with objects
of its own sub tree. Having devices create an alias on the machine
object doesn't respect this good practice. To resolve this, create the
alias in the machine's code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 2 --
 hw/mips/fuloong2e.c | 4 ++++
 hw/ppc/pegasos2.c   | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 48cd4d0036..3f9bd0c04d 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -632,8 +632,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
-                              "date");
     isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 3c46215616..b478483706 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -295,6 +295,10 @@ static void mips_fuloong2e_init(MachineState *machine)
     pci_dev = pci_create_simple_multifunction(pci_bus,
                                               PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
                                               true, TYPE_VT82C686B_ISA);
+    object_property_add_alias(OBJECT(machine), "rtc-time",
+                              object_resolve_path_component(OBJECT(pci_dev),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
 
     dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 09fdb7557f..49b753c7cc 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
+    object_property_add_alias(OBJECT(machine), "rtc-time",
+                              object_resolve_path_component(OBJECT(via),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-- 
2.37.3


