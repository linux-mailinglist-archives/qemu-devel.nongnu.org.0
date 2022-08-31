Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E55A828A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:59:53 +0200 (CEST)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ88-00062E-Ad
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvR-00037l-2f; Wed, 31 Aug 2022 11:46:45 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvO-000367-Cl; Wed, 31 Aug 2022 11:46:44 -0400
Received: by mail-ej1-x62e.google.com with SMTP id qh18so8958890ejb.7;
 Wed, 31 Aug 2022 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Q9dSVrHRL2GS9HzdC/aqcNa7UQpy/akV7EXowwCZurw=;
 b=eNkAct7B1FQcMvOHqh8QX4KsgaLwGbTqrf893Y00gPpGwD2pKYqjY7x3Vjffv62WO9
 q7XcoL0+kHCzSJT//iytB3ftd/ry5ueccQbLmZUbdKfShtWkJT7Pd5ueuFMulXGWlqtg
 QiHuRDscH+ODBVxJdGA0B0STJo1/EHH1ofPCFred6lgUU0tIdB0sHtUCKWAB7KwaBsge
 HgUf9jjYodgiQH4y9fK24s6qPIdBXkIivAFF8XmvpITOntSgh31nlk/zsqlqO/+K8tj9
 2z6xEMLnt2wFFKBPeCv7gYb1S+2nUfNVg2Q2Nt7ZTM5R6Zk6aXyW2fkGu4D4YHYn3k/u
 6CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Q9dSVrHRL2GS9HzdC/aqcNa7UQpy/akV7EXowwCZurw=;
 b=UgpCtcqRJXkJjSJpUT78Bex2ed3ZlqxQFG5w297//KdlYAtUDqSc7tVj/hcFEeBWjp
 AIGWLIwf7oPQfIM5oHWc1IjF5maKxUtKKaFSzctLkST/Y9e8KF2ElgEhC+rg8l0kc4Ey
 dAaysw/sXJobBoP8OuJxtAR+gNW1b+9i/1qBIYEYoOgiWXGfkvK4igBUfMeeoFOo9+iT
 8z0oK0gCoRCLXaWTDK5127u6xE0iO4bhmC7Oyo2XGL4qN3NCN6BW5kMwCTn+/RQrPHdM
 /Lc48CdK/njiIovWIQBpjf/HQ8qEMEwGeCW2jcN2Jg4pF6Ru/nVkClA8pIGOOHTUw5bO
 Pf4w==
X-Gm-Message-State: ACgBeo2ato0CKe39GQ+c6kUVGkrdIHxza0+wh6wqjiuTSP0Lt2Lvv9Tu
 cEl/Joj9llLIr0oZKZzrF5afNBxyI4g=
X-Google-Smtp-Source: AA6agR6pNZkAADWVn0PFAGopVxfqPlOpmByaPleDMP3xVud3iuGs4eM3AZZMcaeNNU0BSOs27s6N3Q==
X-Received: by 2002:a17:906:d7a9:b0:731:2189:4f58 with SMTP id
 pk9-20020a170906d7a900b0073121894f58mr21050694ejb.471.1661960798181; 
 Wed, 31 Aug 2022 08:46:38 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:37 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 12/12] hw/isa/vt82c686: Create rtc-time alias in boards
 instead
Date: Wed, 31 Aug 2022 17:46:05 +0200
Message-Id: <20220831154605.12773-13-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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
index 2d8723ab74..0f4cfe1188 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -203,6 +203,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
+    object_property_add_alias(qdev_get_machine(), "rtc-time",
+                              object_resolve_path_component(OBJECT(via),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(via), 0, intc);
 
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 09fdb7557f..f50e1d8b3f 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
+    object_property_add_alias(qdev_get_machine(), "rtc-time",
+                              object_resolve_path_component(OBJECT(via),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-- 
2.37.3


