Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1F3C35EB
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:51:58 +0200 (CEST)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2H8v-0000JH-D2
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7G-0005z0-D1
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7E-00013p-Tm
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:14 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so6852701wms.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=izSRG2tyrDqESEW+p/9utSApKbWpeVw0/SDAskwXqso=;
 b=icTi5a2zU1Tx+OdROmytvK6VKdOtH11JksmFVqDjFZfLuLOAYVtpBAb7ysG6AaCfwh
 SXfRhtwOrnA7axiFc6DgJv0ddfbwBWtKLkQsNHM7VbAcSfob8dHwAvJVQK7yxnhqOaNl
 kGmD45WnZc33ZUfcARxMwOU4IssD9UsnP842CZeYDXKmZVn+sCXsMgvB5uW2gToLNDrO
 w2ihfKrdlixCkay8JcYJAjaFvEyyiU49kzTdvoGLBHijdXVfrEZ7cML5IqOCgyepBFUS
 fIYbNacE281XSNVX6/6h/r2ZFafyIZHw0GjglfKudCBI541KJi4bPrwPb9EiuhSEvehq
 GILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=izSRG2tyrDqESEW+p/9utSApKbWpeVw0/SDAskwXqso=;
 b=L7s1iJrJMyRJ92nVGk31ug1EztjKCUyD87RvRXVZKjvXnOBv7DQtriircVB56XG8a5
 xToXENBALLa+E19tdcf3MsXfFbRn8UKjfV+bj07EwqDorP+78NN/bzbYDu/A8bxcACfE
 iVWpb+IyxBKrVQxpSG630vocb0NLnO7Sak6T36JfqUQJljFeAxwd+gwnh12ENhbk9iN0
 P7Pwpzs/hMyWJ50brf28qWe8OA61qi/Xaj8uuk8BoFVRq87/mnJJwedz+T4DYj4AY8vT
 17516CLv69DeXhlVH3rVdS3Pee6Y2cvp3ppUiMwFylJxia8iW9TXLigHI5CFvi1GTskh
 AR1A==
X-Gm-Message-State: AOAM530HPhA3dmquDcQgv7R619lvyOcbEm0+WBwFgUJtmV0+Je+mrEdP
 hv7U17lXRFazkgY2VcaN01kJIvu3QrnXXg==
X-Google-Smtp-Source: ABdhPJyGSpdM52mgcEE3TktasARn6yRUmSU5l2hrFHL8xeRswUAOTcng4fRxyhdwmBUmaX2YpjI+Qg==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr7399840wmh.85.1625939410837; 
 Sat, 10 Jul 2021 10:50:10 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x1sm16027744wmc.0.2021.07.10.10.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:50:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] dp8393x: Only shift the device registers mapping by 1
 bit
Date: Sat, 10 Jul 2021 19:49:49 +0200
Message-Id: <20210710174954.2577195-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SONIC device only allows 16/32-bit accesses. From the machine
view (from the bus), it is only shifted by 1 bit. Another bit is
shifted, but it is an implementation detail of the QEMU model.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/q800.c   | 2 +-
 hw/mips/jazz.c   | 2 +-
 hw/net/dp8393x.c | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 6817c8b5d1a..d78edfe40e8 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -316,7 +316,7 @@ static void q800_init(MachineState *machine)
 
     dev = qdev_new("dp8393x");
     qdev_set_nic_properties(dev, &nd_table[0]);
-    qdev_prop_set_uint8(dev, "it_shift", 2);
+    qdev_prop_set_uint8(dev, "it_shift", 1);
     qdev_prop_set_bit(dev, "big_endian", true);
     object_property_set_link(OBJECT(dev), "dma_mr",
                              OBJECT(get_system_memory()), &error_abort);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index d6183e18821..7f8680a189d 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -295,7 +295,7 @@ static void mips_jazz_init(MachineState *machine,
 
             dev = qdev_new("dp8393x");
             qdev_set_nic_properties(dev, nd);
-            qdev_prop_set_uint8(dev, "it_shift", 2);
+            qdev_prop_set_uint8(dev, "it_shift", 1);
             qdev_prop_set_bit(dev, "big_endian", big_endian > 0);
             object_property_set_link(OBJECT(dev), "dma_mr",
                                      OBJECT(rc4030_dma_mr), &error_abort);
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index d1e147a82a6..64f3b0fc3ea 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -971,6 +971,8 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
 {
     dp8393xState *s = DP8393X(dev);
 
+    s->it_shift += 1; /* Registers are 16-bit wide */
+
     address_space_init(&s->as, s->dma_mr, "dp8393x");
     memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
                           "dp8393x-regs", SONIC_REG_COUNT << s->it_shift);
-- 
2.31.1


