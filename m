Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E473C3B9D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 12:42:22 +0200 (CEST)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Wuj-0006C6-7S
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 06:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wp1-0006Hz-VL
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wp0-000471-Iu
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id r11so14833723wro.9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ciVo7kEqxY4swYhIluiodO0kr4geA/OgIFKlydbaSPI=;
 b=k5wd24nPiUZP0klrfhD/ftxHQvKRSpn3QX1YWr+dR614rzAAAF5IFwYC1zSIcQ+Bon
 8fuvF77G2E9ue+g8UKSCFFsyaPxe0JAug1jEM0R4drB5Ninz5LvxXvS0K8lHCr5e5pqP
 UDqj1k+RynemhCER00WSgsQYpCq3AYyLCR9fBmvjryU02frf21O+8lWJPobZZo7lD0ry
 rbKTg7FhOF0jPSy3z1bE5BXv0/YuT8JtHrr29cCnHywORB1TROFq9pc8KvfogWX/Ilia
 yewn9fBzTmH0MSvVKURJVcNEEjZssVJglzqso/fDDpufKEoc1oknLtBjS7cUySzh6Cge
 aihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ciVo7kEqxY4swYhIluiodO0kr4geA/OgIFKlydbaSPI=;
 b=FrPO9skDpFn07DU/Do05pgzl7lJp67sporjJabwZ3MR6bitZpTPVtFZPgn57k8u4V5
 0X9Lutfui0+WaW5yFDNsa95htdO2teeD2c9LvN0o7QjQ82cpdEzxNQ1fLt/EKMlYBV3/
 m+tec9AlWO0nM5dYt13LHSstis4oBSnSHQ6PeDI62JK6vikf77fRZkHxhPHuyOnQbRDd
 E0lenhN6QgFDglOK+/RDh/bgezfmBz64A6XLA7aQZ7e1qOE4hO3I/plK/Yo0WnLZP9Tl
 637tOCvnxKKRnUSQ3paXeuU+6XTD+HMXp+shIpaJc02dKXZFEQ6JJC4Elf9HFq5U+Jgk
 ug8A==
X-Gm-Message-State: AOAM532iVItMOR0haZZr+IF9T3HPYfB/8bZcWSNJtrHxf54c/GabgDCj
 HbjBt1agxsngSNbKHlPbQO2M+RQk+KRcMw==
X-Google-Smtp-Source: ABdhPJxqxhcGWqi1BjMywXXQ7OZbdJQ7hgvhruyFkbdtdPWJH+7lxRQhkwdXNZWSbFQcv4iGWaDh+Q==
X-Received: by 2002:adf:a54b:: with SMTP id j11mr35078063wrb.305.1625999785075; 
 Sun, 11 Jul 2021 03:36:25 -0700 (PDT)
Received: from x1w.. (static-189-95-145-212.ipcom.comunitel.net.
 [212.145.95.189])
 by smtp.gmail.com with ESMTPSA id x8sm3425829wrt.93.2021.07.11.03.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 03:36:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] dp8393x: Replace 0x40 magic value by SONIC_REG16_COUNT
 definition
Date: Sun, 11 Jul 2021 12:36:09 +0200
Message-Id: <20210711103612.2661521-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711103612.2661521-1-f4bug@amsat.org>
References: <20210711103612.2661521-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Finn Thain <fthain@linux-m68k.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210710174954.2577195-3-f4bug@amsat.org>
---
 hw/net/dp8393x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 9118364aa33..d1e147a82a6 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -85,6 +85,7 @@ static const char *reg_names[] = {
 #define SONIC_MPT    0x2e
 #define SONIC_MDT    0x2f
 #define SONIC_DCR2   0x3f
+#define SONIC_REG_COUNT  0x40
 
 #define SONIC_CR_HTX     0x0001
 #define SONIC_CR_TXP     0x0002
@@ -158,7 +159,7 @@ struct dp8393xState {
 
     /* Registers */
     uint8_t cam[16][6];
-    uint16_t regs[0x40];
+    uint16_t regs[SONIC_REG_COUNT];
 
     /* Temporaries */
     uint8_t tx_buffer[0x10000];
@@ -972,7 +973,7 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
 
     address_space_init(&s->as, s->dma_mr, "dp8393x");
     memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
-                          "dp8393x-regs", 0x40 << s->it_shift);
+                          "dp8393x-regs", SONIC_REG_COUNT << s->it_shift);
 
     s->nic = qemu_new_nic(&net_dp83932_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id, s);
@@ -987,7 +988,7 @@ static const VMStateDescription vmstate_dp8393x = {
     .minimum_version_id = 0,
     .fields = (VMStateField []) {
         VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
-        VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
+        VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.31.1


