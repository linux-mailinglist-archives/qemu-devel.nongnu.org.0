Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE85EBF83
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:15:16 +0200 (CEST)
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7cS-0006T3-1C
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a9-0000tK-DX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a7-0002Vx-OF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id t4so6195490wmj.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CJWWWX0j3DH7dA8Y5VomwvEKcqa9vhwQUJYhBUYvd+Q=;
 b=qK7WkBHmP6cpQ/O20B4lKQ+1uHK48TTvNpaNGwmYAwHy/fphYsI5MqF+PX7ijXMvbN
 2RtCjUCr9z3zCVrNdWEB6uUjOMHtbePqrfwWlRhudYGlfb2o25eiC9U/DVNBd0fOv2J+
 CHTN2n1Bi1wI600nagm4WQPU7kzsLymTxfjhzb0pmh4HtOXmkiFE2Q8o0lVs+LANMvyw
 ZdAPY+MrK1GtnKoK483tb4rnrS4zlzQTmjwzMNjm70HV6atzhcyl2JfxUN86nAvUH8kk
 4GOJN3AU/kI6acxCunk0rYklFhhCsF1+EDBxocZtdX+4Yqt9+IYI1bBf3W36Zhv13inJ
 yOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CJWWWX0j3DH7dA8Y5VomwvEKcqa9vhwQUJYhBUYvd+Q=;
 b=DxYKz2s74cg5vJi6LPheVWTLs8xNrtD64Zsxv8HrbosinjzsqiOcpd7AoGCDBIzIgr
 hUqfr6PNuxDaL8vYxg1RQQIa8x/sk9geKylQ/KBJ+5IBXJZdhL94yv1r3pJ1zht0i9TZ
 I7dK1gQCH3Thb+eqwsQLUgl6Fy7xi2Q/LQHw1PeuAxOc00kAmXTnS2qe4xJfrzhNnMaE
 QetB4CfnOSPaGho6ow/VN9el13NxADjtJS/PliNfhAA7wlk9HeR/26TUFaw1D6WO6SyG
 F1BUVWKYewiMhKLkPb4X9P1ut8piTGQom6Rp7wFQIm1OJv2n9PD5efMCuQEV9pTAMoVw
 0m1A==
X-Gm-Message-State: ACrzQf2/yD0yPIJmNPWdvwXdkH44nrl4NJiarkWWsjddr53pPq/3WDHv
 PRuO2yL8qrDU56NKiIcB1hjaIA==
X-Google-Smtp-Source: AMsMyM7wfT9DZ/UIkVa18JJcD96YFwfcg96P75gS7UFTO3LzAjvrET0aAdTNbuxyjclyH/fVVaaCmg==
X-Received: by 2002:a1c:7c03:0:b0:3b4:7647:ccd8 with SMTP id
 x3-20020a1c7c03000000b003b47647ccd8mr2053064wmc.10.1664273569674; 
 Tue, 27 Sep 2022 03:12:49 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:49 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 5/8] hw/arm/virt: Fix devicetree warnings about the GPIO
 node
Date: Tue, 27 Sep 2022 11:03:46 +0100
Message-Id: <20220927100347.176606-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the pl061 device can be used as interrupt controller, its node
should contain "interrupt-controller" and "#interrupt-cells" properties.
Fix the corresponding dt-validate warnings:

  pl061@9030000: 'interrupt-controller' is a required property
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
  pl061@9030000: '#interrupt-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6805c57530..10ce66c722 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1012,6 +1012,8 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
     qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", phandle);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 2);
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-controller", NULL, 0);
 
     if (gpio != VIRT_GPIO) {
         /* Mark as not usable by the normal world */
-- 
2.37.3


