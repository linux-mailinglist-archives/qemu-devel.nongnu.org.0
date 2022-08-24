Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FC159FEE8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:57:06 +0200 (CEST)
Received: from localhost ([::1]:57398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQskb-0004Gg-JO
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf8-00029S-B4
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf5-0002EO-RQ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso1169969wma.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JPnL1u8Q7Rp6zS6QxX1+K19gfMEh8ge2+QRHygxZ1TY=;
 b=Gungl2OHa1IbzzrlRsdSVhv1zdYnP+aY9VeRN3RcEf6TgFar5IVM310JwB18UhjKOn
 uEza8rTQv1f/eH6t9be+26vFVEogEShWlh1AykvYjwHwQ1yXB+7zm6QF1Nr1w9ptO+QU
 0W3k/91YomvNSZAmCgwH/XEKiLpKad/OClTQAugkKC1Nu6IusG7Atqmr0BDNnXiDaIdf
 eHeVj2lCyM51zU+fUiQWOMsrBiHNJMDptb1eZuAo4AuHdkRjmGcZZ/tngPewrf6eaBE9
 Rb7CRi/OnkF70G4IPOngLtVrD+Gb+sQxNRrrS76Ojdf0nU+Tkh4cAuQs3DQKmd9XJCxO
 MDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JPnL1u8Q7Rp6zS6QxX1+K19gfMEh8ge2+QRHygxZ1TY=;
 b=3nMIiGUcZ6A6H/2qwljLjPWprx2PCmWGsjypSfyXRcrRmdKbYnDzEkP5uWQIilmsTv
 Kvvr+CagOOyHgFQfY2Wil892WAzKtMcb2DD8Ura4z1DiMkjZskdSsXLyVjSfg88vYE4R
 NMMboDW7sLlgq/0fo3ottGIPijHK7y/MV5BGZ+3GmFHOsU1CDE4Nybndpaa48tJ3yYrr
 P4ziFYOJagijB2lm5XGM8RHLokxBEjTozQNe2QXRsCiisfyr0zENpEB4gld/kq2KUzui
 ax85sSP3PH1N5yd0iHvOR8+dM2lBsFqq5e2KBMu2SUl/1OrKurQSuNV1YniHb9RrMcBy
 ExxA==
X-Gm-Message-State: ACgBeo2fxdMXurTZZ0TTUNV77Unuuk+Ssw5pcJqdWpPxQPSyCOoRoKXL
 H9U95szZU0tEtsrYGYlshUlmSw==
X-Google-Smtp-Source: AA6agR4x6MBizweDuHbwaIabeKGoyaLVU/qYUEg3v4qSEz2E/y2Vh2ZuCdKn7KR+6SPaId04ln9/+g==
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id
 bi17-20020a05600c3d9100b003a54132b6a0mr5377180wmb.126.1661356282982; 
 Wed, 24 Aug 2022 08:51:22 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:22 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 07/10] hw/arm/virt: Fix devicetree warnings about node names
Date: Wed, 24 Aug 2022 16:51:11 +0100
Message-Id: <20220824155113.286730-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

dt-validate reports that several nodes have non-compliant names:

  pl061@9030000: $nodename:0: 'pl061@9030000' does not match '^gpio@[0-9a-f]+$'
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
  pl031@9010000: $nodename:0: 'pl031@9010000' does not match '^rtc(@.*|-[0-9a-f])*$'
  From schema: linux/Documentation/devicetree/bindings/rtc/arm,pl031.yaml
  pl011@9000000: $nodename:0: 'pl011@9000000' does not match '^serial(@.*)?$'
  From schema: linux/Documentation/devicetree/bindings/serial/pl011.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3d460f3686..952af37935 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -857,7 +857,7 @@ static void create_uart(const VirtMachineState *vms, int uart,
                                 sysbus_mmio_get_region(s, 0));
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
-    nodename = g_strdup_printf("/pl011@%" PRIx64, base);
+    nodename = g_strdup_printf("/serial@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     /* Note that we can't use setprop_string because of the embedded NUL */
     qemu_fdt_setprop(ms->fdt, nodename, "compatible",
@@ -897,7 +897,7 @@ static void create_rtc(const VirtMachineState *vms)
 
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(vms->gic, irq));
 
-    nodename = g_strdup_printf("/pl031@%" PRIx64, base);
+    nodename = g_strdup_printf("/rtc@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
@@ -999,7 +999,7 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
     uint32_t phandle = qemu_fdt_alloc_phandle(ms->fdt);
-    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
+    nodename = g_strdup_printf("/gpio@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
-- 
2.37.1


