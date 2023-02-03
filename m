Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4768A149
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:11:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0W6-0000iP-9a; Fri, 03 Feb 2023 13:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0W2-0000W8-UX
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:27 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0W1-0008VF-5v
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6605078wma.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/I3al5seYLenPgGBRZSaVfmIjm7PcZ28M3YPTxSCx8=;
 b=d/Ls8fK1E0DRDVhuJ+F4H2CDcQaF9fPPbMrilBLiBay3hEmtC0jjeYtWkvZ2oYjQqH
 zs9+FGspjQcDMz6h3n3TtrC02ByY49ucsvslNbfru0f6lfliWLTi2pHOwbeJdFcfzghR
 IeqsQj2szjrfjgIC+OQyFR41w9Uo2KsEQCrOGI9fPJjv4Tpb64jirxHRXYqG20hAEbpI
 vbmL80dCP4sYb2/ngcf/RJ/rWRd6nzAFKNbYREA1xLQ4V/I8Ic1S2S2HJAuJfD93d6Lt
 qRCE4SMLyOwdUw65f9vxOwHzltWyHXSC6jQt4Zq3goAh+6TUDUn2kvSJ1Lrk8H30ptnC
 8z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/I3al5seYLenPgGBRZSaVfmIjm7PcZ28M3YPTxSCx8=;
 b=rL28yB5g3XoFsqxFhUjuShcLxBnPXXZXvm12sQn+yRrQIptm1tdX0x2JARlsh/55Mm
 JvSwVW3bHiAJ0yCgxscsrXoImztFINxCmkPBUBhEDyhEi1mbtUOlNjUD5MGRnnhJr6fT
 g8VZdeRM1PEx+by5TgAP+tDCYL6z5Ls6xTBjh2V2MqfyN8nGS8gaiSawLK+0Wp3a5Bho
 7qiWBnivMHZO5cmnYH98bN7dVNAVvqedN8RE9to0DT+WFvHKv6aOvCDn3r7Y+K2VOK7w
 +HHAhVMblm5Ts+tNYgjAwlQqALzUiPfbKAyH33k5wk1mc1ntC2V2FsNK+jaTN/X+kixK
 EAoA==
X-Gm-Message-State: AO0yUKXcdU8xqg8mp5DMedigBJdoWoAPydnGzEiIyxm3pfBFrlltHUXd
 CS8jJ2aKCHHRvIxrYFFN+cjyP6XPCkl4Hp1v
X-Google-Smtp-Source: AK7set/x/bOZRRnYTYm7+7GXPJNxcNInwsMiOV/1iv+YY8TTb+lnwWmFoGv7txROl48FZC16SDiCJA==
X-Received: by 2002:a05:600c:5113:b0:3d0:761b:f86 with SMTP id
 o19-20020a05600c511300b003d0761b0f86mr10859031wms.28.1675447824117; 
 Fri, 03 Feb 2023 10:10:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b003daf672a616sm3657304wmq.22.2023.02.03.10.10.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 13/19] hw/m68k: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:08 +0100
Message-Id: <20230203180914.49112-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/m68k/next-cube.c | 2 +-
 hw/m68k/q800.c      | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e0d4a94f9d..460b84c6e6 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -966,7 +966,7 @@ static void next_cube_init(MachineState *machine)
 
     /* Peripheral Controller */
     pcdev = qdev_new(TYPE_NEXT_PC);
-    object_property_set_link(OBJECT(pcdev), "cpu", OBJECT(cpu), &error_abort);
+    qdev_prop_set_link(pcdev, "cpu", OBJECT(cpu));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(pcdev), &error_fatal);
 
     /* 64MB RAM starting at 0x04000000  */
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 9d52ca6613..1f363a666c 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -427,7 +427,7 @@ static void q800_init(MachineState *machine)
 
     /* IRQ Glue */
     glue = qdev_new(TYPE_GLUE);
-    object_property_set_link(OBJECT(glue), "cpu", OBJECT(cpu), &error_abort);
+    qdev_prop_set_link(glue, "cpu", OBJECT(cpu));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(glue), &error_fatal);
 
     /* VIA 1 */
@@ -483,8 +483,7 @@ static void q800_init(MachineState *machine)
     qdev_set_nic_properties(dev, &nd_table[0]);
     qdev_prop_set_uint8(dev, "it_shift", 2);
     qdev_prop_set_bit(dev, "big_endian", true);
-    object_property_set_link(OBJECT(dev), "dma_mr",
-                             OBJECT(get_system_memory()), &error_abort);
+    qdev_prop_set_link(dev, "dma_mr", OBJECT(get_system_memory()));
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 0, SONIC_BASE);
@@ -520,7 +519,7 @@ static void q800_init(MachineState *machine)
 
     /* Logically OR both its IRQs together */
     escc_orgate = DEVICE(object_new(TYPE_OR_IRQ));
-    object_property_set_int(OBJECT(escc_orgate), "num-lines", 2, &error_fatal);
+    qdev_prop_set_uint16(escc_orgate, "num-lines", 2);
     qdev_realize_and_unref(escc_orgate, NULL, &error_fatal);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(escc_orgate, 0));
     sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(escc_orgate, 1));
-- 
2.38.1


