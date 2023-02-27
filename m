Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C56A44B1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFW-0002zv-7e; Mon, 27 Feb 2023 09:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF1-0000WX-Cz
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:35 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEY-0001Ih-MN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:08 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l1so3324912wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XtxNKvcZ3XKeJ9IU2NxfSQHl2tOAm2Whlka61SEn0a4=;
 b=TZBzrKI/tHC6hf1tjSXJkuk6hIvm2s/hSmdm/Gt7i7so1wk1+VEtCYrObxnZOGeCLW
 5v/t2zNFGzZ9Ltp4UFbH2bR3vo6IKIeJ46701t6hoQPPjw4GuGNCiRZmMZVQEety3Hxm
 DsutjobE/G+cxX4KJebi5yVSsdbsS82LMdbizMkLKSLrwt4/kfIvSEdvy4cGwXxVge5s
 X4nqAuYA95qWfNmZ/X0rO+Ff3hT/oa74QchVbr6efUlhPr2j9RsiFfitP7Y57foR6YvA
 uzTWFWjLxgWRv3UwZWhzNFAnVMGJEr6wNiSYpYBpDkmOF/KVkFKUMy552Zwf1kx0w7yo
 gXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XtxNKvcZ3XKeJ9IU2NxfSQHl2tOAm2Whlka61SEn0a4=;
 b=vgA8+W5ONlKnADZkQwtg00m/UIsaiVu1ar2HE80XFBhjIBC1z4IT+GJutm7UxhJwWN
 dbrcXFZ3ujjbu6KdEL49IqmcND79s0GhkZVKgrxxMSEYkI4+CgItEkEzhGgBiV1e6poU
 3hhZc8qCULZaFdIftralDq9t7Fm9UFQiLi3vqxNF5LrKM6qiP0cZVvganspaTLu73IMN
 2sQQ9G06cjc+b22zvw4icCMXjChMN7w2GknQqSuh3LlMmQohlYaa+pVB/UHHEKYElkxX
 49ER37igGEGwgdSoNgCKr1k08zHBIUJZaGdWaMOJSfCEkLoqCZAVrbVUFB38dr8YppAY
 H8lA==
X-Gm-Message-State: AO0yUKUbSYBNVBURUHjoWSuvjTuBoOKdcy3353Ad9fKCrKy8s6reTpXf
 SadQm9aQe/6QPErLE6XXLoBf20kEeoDvIZri
X-Google-Smtp-Source: AK7set8/lcIgn82bhqjFubUIbyKZi1KKKGMEajsqQUF83DgyDK9/h+qMI0wgrN7Q23dgy+jUljTRGg==
X-Received: by 2002:a05:6000:1:b0:2c7:1e60:3518 with SMTP id
 h1-20020a056000000100b002c71e603518mr8796096wrx.13.1677507124801; 
 Mon, 27 Feb 2023 06:12:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c229500b003e1f2e43a1csm9103814wmf.48.2023.02.27.06.12.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 118/126] hw/ide/piix: Refactor pci_piix_init_ports as
 pci_piix_init_bus per bus
Date: Mon, 27 Feb 2023 15:02:05 +0100
Message-Id: <20230227140213.35084-109-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Message-Id: <20230215112712.23110-21-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/piix.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index f10bdf39ff..41d60921e3 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -121,7 +121,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
+static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
 {
     static const struct {
         int iobase;
@@ -131,24 +131,21 @@ static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
-    int i, ret;
+    int ret;
 
-    for (i = 0; i < 2; i++) {
-        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                              port_info[i].iobase2);
-        if (ret) {
-            error_setg_errno(errp, -ret, "Failed to realize %s port %u",
-                             object_get_typename(OBJECT(d)), i);
-            return false;
-        }
-        ide_bus_init_output_irq(&d->bus[i],
-                                isa_get_irq(NULL, port_info[i].isairq));
-
-        bmdma_init(&d->bus[i], &d->bmdma[i], d);
-        d->bmdma[i].bus = &d->bus[i];
-        ide_bus_register_restart_cb(&d->bus[i]);
+    ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
+    ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
+                          port_info[i].iobase2);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
+                         object_get_typename(OBJECT(d)), i);
+        return false;
     }
+    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+
+    bmdma_init(&d->bus[i], &d->bmdma[i], d);
+    d->bmdma[i].bus = &d->bus[i];
+    ide_bus_register_restart_cb(&d->bus[i]);
 
     return true;
 }
@@ -165,8 +162,10 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    if (!pci_piix_init_ports(d, errp)) {
-        return;
+    for (unsigned i = 0; i < 2; i++) {
+        if (!pci_piix_init_bus(d, i, errp)) {
+            return;
+        }
     }
 }
 
-- 
2.38.1


