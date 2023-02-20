Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B869C78C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:18:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Hq-0000SZ-62; Mon, 20 Feb 2023 04:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2H3-0007K0-QL
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:54 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2H1-0003s6-UQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id c5so1027793wrr.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKzBr2qnyWx4EHsQiRdE7a+Dj3wNarZUSazoPOYlSfI=;
 b=fd/O7waEqStVVMsRHrOf5+NtZVlvPNKiHVweW33qIRYx30+9GnXhs90IGgj9YsE5yF
 k0hYsmUsLENpZhfeBJTAGLy2K1u/PJ6dEjBz6TWvfRjg/7L7xey3VVMfdME6UhEo3RHY
 HCheWGrEdA8gdTw2BADuJ95qPjrRUbxRKY+ced1XHRDUPE+2iTrAP5jrebl/JEKX6Qdg
 g28X2/sFCpJ/8OGhc5+6qQcGWW7m504f2+kZf6Z6lbpK0vL2Tz1Z6WzbOat7rbr+z4Zl
 stYrF0ByRDAtt5Uo4e7uxembIVpvhYkiYHIgfZKKrFog8nqGnErbBm1PHRSqouh7dM/0
 q4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKzBr2qnyWx4EHsQiRdE7a+Dj3wNarZUSazoPOYlSfI=;
 b=tiSp0au9fpPvC4TFhgAsgQ8Cm/mtlEir6XSxr9TqhyGjl2aUus3V/4gkSu+TBdo377
 nlKxjS2EM96RMM9coUtKVpe8B65L1FJG/WVNW9m2wb/UL9NXWpkk8aCnBTO3z/XPf4Si
 pZt4GQw2huHhtB1Wf/3k7FQs7MKQTgQNPGcDDJAngkQ+Hh9upKlh+bq8Ow3nlBnmB9LN
 j1HLqdXVasHA7JgawzxPAJON74hYdHyez9esY2ouGQkwcOVWvDzpwJFuZJAxBgRsOzc3
 ETjnQ0nA6DFbojVOjCHTVbw0uvv8IfXPDKBPhmFj/A5O2HkN769Thl4+bArPTJvttkZ1
 uwgA==
X-Gm-Message-State: AO0yUKURvVWgg1mVGggLuPnSAvDwC95t9dgwM9Ud65d2xFUTtJW4Q7I3
 ZvouZuh6nKZnWCyczCdkQ3Cde5E0HKXhgr+2
X-Google-Smtp-Source: AK7set9X0Fa2Jcj5jVD1aTrX1rzCaeAQO3qULnLJfDbxcUXcvBqlOBKFG+FeLYrzQpTmb9ihkbBGCw==
X-Received: by 2002:a5d:5607:0:b0:2c3:dc42:525d with SMTP id
 l7-20020a5d5607000000b002c3dc42525dmr1841452wrv.36.1676884551066; 
 Mon, 20 Feb 2023 01:15:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t14-20020adfe10e000000b002c56af32e8csm3265644wrz.35.2023.02.20.01.15.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 22/24] hw/ide/piix: Pass Error* to pci_piix_init_ports()
 for better error msg
Date: Mon, 20 Feb 2023 10:13:56 +0100
Message-Id: <20230220091358.17038-23-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-20-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/piix.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 5b1455e232..b74f1c77c4 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -122,7 +122,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static int pci_piix_init_ports(PCIIDEState *d)
+static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
 {
     static const struct {
         int iobase;
@@ -139,7 +139,9 @@ static int pci_piix_init_ports(PCIIDEState *d)
         ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
                                       port_info[i].iobase2);
         if (ret) {
-            return ret;
+            error_setg_errno(errp, -ret, "Failed to realize %s port %u",
+                             object_get_typename(OBJECT(d)), i);
+            return false;
         }
         ide_bus_init_output_irq(&d->bus[i],
                                 isa_get_irq(NULL, port_info[i].isairq));
@@ -149,14 +151,13 @@ static int pci_piix_init_ports(PCIIDEState *d)
         ide_bus_register_restart_cb(&d->bus[i]);
     }
 
-    return 0;
+    return true;
 }
 
 static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 {
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
-    int rc;
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
@@ -165,10 +166,8 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    rc = pci_piix_init_ports(d);
-    if (rc) {
-        error_setg_errno(errp, -rc, "Failed to realize %s",
-                         object_get_typename(OBJECT(dev)));
+    if (!pci_piix_init_ports(d, errp)) {
+        return;
     }
 }
 
-- 
2.38.1


