Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57352C2217
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:52:07 +0100 (CET)
Received: from localhost ([::1]:52274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUzW-00018t-SN
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxW-0007mP-VL; Tue, 24 Nov 2020 04:50:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:32938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxU-0006SV-Sn; Tue, 24 Nov 2020 04:50:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id u12so21685691wrt.0;
 Tue, 24 Nov 2020 01:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/L4jKVy7EB9p4IWKxtjmkSOQPywQXedYQSAO4hGKmg=;
 b=kghlIHEU5CIyK2ZAD78yMs0WATKojSPI6sVEtROO5301efVZlBQlAsPa6u+D8Bx/WJ
 4gtnKkZ832p7DAJhZPHneR9m/SGOOLRdZdXOV5pmq7vyn+JpttJgyYAmjgB7IEKk/+Be
 qNAfP3jc5yCaBq1F+HkZ3IZa9dCZ0hmSzhivOisgRoUODVqzEHireXG/zEENIxVzQ/Wz
 P0wmOwtr3CcnkSc6Z/Rc9jjYh81zn2W9nkqn4VrZSqkZ+F6gdG1Nex5Xydi6gLktUzSf
 CRu0OghxQUCWXs2Wko4ayNZroPFyXarZBOeFGXIEih9qwfYLlgMFtSaqde5myE+MUFdB
 M1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j/L4jKVy7EB9p4IWKxtjmkSOQPywQXedYQSAO4hGKmg=;
 b=gG7RE9KQeznZ1jS4NDrt2eb2gtuuleB0TIjAaHAEW8rDWWBalch3eg8SgYJTbbOfLn
 Z4BQwP30OK59X66a2z9lPOOvvX2SA1UWkq/FAVAQ4HbrOjYnsyWvQTemyrYWtymfYDGL
 ywo1C6xChNecAu0L0nyMce3/SjIlQQFe2LxSHGbEjl2KbQyBQOeZ8E1MHc+byAqztIH0
 DC5yHBWjRWxzTQPE5N3SiQ+K8vftRRePxuMQKHCfTSMlDMABwJ9Q3Dz+HmxktImVOXRj
 lVWRljibes9D7mj9YqZs9EAiJ9apD/P9lK7+w49TNxL7GlvcPt1KoKTf54UnbNJDS0da
 k1cg==
X-Gm-Message-State: AOAM531eq0XRsy8BSigwFQ3cWLBiMBNCaDf5mGRq/urhDt0Dxh+w3A6X
 PCjrKmcxxTzfyXzrg05Q6cwVBg9KC64=
X-Google-Smtp-Source: ABdhPJwhMuvJnBR9YOegzwyRckzY6+FW1x4xGIvuzPZbOIy09LDYqko3h2M/Bqam7vbkbbHSumMzvw==
X-Received: by 2002:adf:f143:: with SMTP id y3mr4233532wro.138.1606211398763; 
 Tue, 24 Nov 2020 01:49:58 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b73sm4924765wmb.0.2020.11.24.01.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 01:49:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2? 3/4] hw/arm/xlnx-versal: Add SD bus QOM alias on the
 SoC
Date: Tue, 24 Nov 2020 10:49:40 +0100
Message-Id: <20201124094941.485767-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124094941.485767-1-f4bug@amsat.org>
References: <20201124094941.485767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to select a particular SD bus from the command
line, add a QOM alias on the SoC (using an unique name).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-versal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 12ba6c4ebae..da3ee24a5b9 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -210,6 +210,7 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
     int i;
 
     for (i = 0; i < ARRAY_SIZE(s->pmc.iou.sd); i++) {
+        g_autofree char *bus_name = NULL;
         DeviceState *dev;
         MemoryRegion *mr;
 
@@ -224,6 +225,10 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
         object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
         sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
 
+        /* Alias controller SD bus to the SoC itself */
+        bus_name = g_strdup_printf("sd-bus%d", i);
+        object_property_add_alias(OBJECT(s), bus_name, OBJECT(dev), "sd-bus");
+
         mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
         memory_region_add_subregion(&s->mr_ps,
                                     MM_PMC_SD0 + i * MM_PMC_SD0_SIZE, mr);
-- 
2.26.2


