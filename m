Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840759FEF3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:59:51 +0200 (CEST)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQsnG-0000Nu-FF
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf8-00029R-AE
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf3-0002Es-Ph
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso1169870wma.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/BcQ7dSBdHiwkCbitP1xng11btp+1w28KnhMykfx8qg=;
 b=D5OzUPpE6+MWQr8XOufZwnuPbRmcnUTudV/M7oni2t1R4Kd60J5fxAyaZZMTJ1mDP5
 55/V9NhLpID4vp/fPtuNd+W83eS1fklEorZ+NMzrCHv8OoMiD295nX6zOcteqtDbp9Fo
 P3MHeJwU6XVrGAhLUTwbPrvQlj3IKnwar9yQDnnqUnQtdatT9fRP4QFRaicTw6qoibMl
 iu/NRKP+UjWPWjczcBPSar64So4BpwihfQg3ZIstiETIDrX1VNJYdBZiS6X5d7I5vryT
 Lf3TGCIhaF6uemCjEl9eOV1s6cL1sq9MqJp4r2Qoq91CVC42+6SphzKkpDYlNypApgV7
 6sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/BcQ7dSBdHiwkCbitP1xng11btp+1w28KnhMykfx8qg=;
 b=SR6tCfSlys3OZQ80IItvfJIQKTpTycxo+Gorz2b2pQ/yTYeFbn3018hLwm+taufANc
 ICGMvU0O7ygM2vRNLy1n28OUfRpttmK4lxfPTEyiNirNxGOPJP0hsXh574GBo9P30NzI
 hIIYRLRVVKF6G7bgjoMxx3CgcQBYAMZvtjKBrizxminKkDsImSvGtfJvFZbnfHJoEXZR
 SZTQi2ooWIzHULYLdAtH45ai4QhlFNHjqxgHiDCYyV3huGsLmU5cH9X3skjkLnsQZJvn
 xQx7cr/p3viL3IdXtkpGFpOrBu2AW+XVC9usZtJTX5dX6tJTihtwK9znn2Tog+UAH5Sl
 xPeg==
X-Gm-Message-State: ACgBeo31/JAlYLUPHiL9Ii2TpGbthjG1mm/PnUct+5rfEPmzIuwLRl69
 FiYi6VgWqdD4EEz6DXr1/91x7w==
X-Google-Smtp-Source: AA6agR49bbIfu3Txq2hEgOKaL7sId7C/fnGQOJSr7W1i9p2oRv0sIJMYaSbcsKWUFYhULrnnt3xzsQ==
X-Received: by 2002:a05:600c:1551:b0:3a6:2f4d:aeca with SMTP id
 f17-20020a05600c155100b003a62f4daecamr5549190wmg.100.1661356280200; 
 Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 03/10] hw/arm/virt: Fix devicetree warnings about the GIC node
Date: Wed, 24 Aug 2022 16:51:07 +0100
Message-Id: <20220824155113.286730-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Fix three dt-validate warnings about the GIC node due to invalid names
and missing property:

  intc@8000000: $nodename:0: 'intc@8000000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
  intc@8000000: 'its@8080000' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'

  interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index abcf2716bc..b6aa311d8c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -481,12 +481,13 @@ static void fdt_add_its_gic_node(VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
 
     vms->msi_phandle = qemu_fdt_alloc_phandle(ms->fdt);
-    nodename = g_strdup_printf("/intc/its@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller/msi-controller@%" PRIx64,
                                vms->memmap[VIRT_GIC_ITS].base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                             "arm,gic-v3-its");
     qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#msi-cells", 1);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_ITS].base,
                                  2, vms->memmap[VIRT_GIC_ITS].size);
@@ -499,7 +500,7 @@ static void fdt_add_v2m_gic_node(VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
     char *nodename;
 
-    nodename = g_strdup_printf("/intc/v2m@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller/v2m@%" PRIx64,
                                vms->memmap[VIRT_GIC_V2M].base);
     vms->msi_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -521,7 +522,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
     vms->gic_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", vms->gic_phandle);
 
-    nodename = g_strdup_printf("/intc@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller@%" PRIx64,
                                vms->memmap[VIRT_GIC_DIST].base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 3);
@@ -1651,7 +1652,7 @@ void virt_machine_done(Notifier *notifier, void *data)
      * while qemu takes charge of the qom stuff.
      */
     if (info->dtb_filename == NULL) {
-        platform_bus_add_all_fdt_nodes(ms->fdt, "/intc",
+        platform_bus_add_all_fdt_nodes(ms->fdt, "/interrupt-controller",
                                        vms->memmap[VIRT_PLATFORM_BUS].base,
                                        vms->memmap[VIRT_PLATFORM_BUS].size,
                                        vms->irqmap[VIRT_PLATFORM_BUS]);
-- 
2.37.1


