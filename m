Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908A159FEE2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:54:57 +0200 (CEST)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQsiW-0000dG-L6
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsfN-0002KT-TV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf7-0002GH-Ry
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h24so21287895wrb.8
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ohy3bUJKZGFkjSeZY9AWoC2jPWdXu0ag6d5K6Qn5vz0=;
 b=JM5uTKHzHWO6C4wlZpHJYwKCnAzZHA3+IZVXBchD6yHxEi/Gq+9DTpUnwXxSwLPg8D
 mVWRfk3TaBDAO2vCfFfQLJR5hW+ybGgxBmDjvnyRsyXeIVqCtNYyOcm35ZKfpur0peJY
 yFg45aMADf2A5u+mMSS9Duli9lrutVvfnTji6dGr8gEL1gQmfbMbiU30ZjLQLPqCi7wp
 rzvMl6DW33Q6cLdR+jvHN6Nkoyv3z24u6Ys+PqNKi18WYEV8zjn9DQNqT36ZfJW5cipo
 +KZ0qmH7VXE2d47pH4q+KuzC0bX+ENQWGWdWh1YARLBrKErO6VHGApudIzodIVCPQaeL
 u9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ohy3bUJKZGFkjSeZY9AWoC2jPWdXu0ag6d5K6Qn5vz0=;
 b=qw1kkXbZJT7QpIzXi5kVxEs1ihH1y3jDyQw1WCzbvTD0rdMqwb3Mq/QNjuXU8HGkDV
 STExstnVs1DrXAm9mjwbbNCIWsMf2kjOdd0s1Ug4JHS5di+6JzuKufVH9T/4cwnBRUk3
 b6Fof0PZ5Mfpn7DFSVUERfcc65xG+lEthUmRYbKqomkQzC1WYdd/hieMf+Mo2PDypOuL
 5qDNtkczYj3q9hBXaMouOZ9ogMN4vIlPXPv5pb5rZTn7M5joM8i2VWHMsn/FrFMZY3B3
 h26slgQCPK9KiCqMP8xkPT7H5VWMAuEXs0BbL5vnYMMJbdphmNieC/S3UD2uaBLJDakL
 cVZQ==
X-Gm-Message-State: ACgBeo3eDpKsk3YzOW/sDFlJa1fS1gHPqhWFIaiHnw+NGmhpUD3l4y/H
 vPriUlax85zE8fr0j6X75xQWxQ==
X-Google-Smtp-Source: AA6agR7x6tEqRwVuAKdG6oQmgtlURAp4nUvI0mdQWob03MqQWrXweKqF6+BFzDguqxwjTqDqrIADjA==
X-Received: by 2002:adf:fc8b:0:b0:225:5a71:be1a with SMTP id
 g11-20020adffc8b000000b002255a71be1amr8173178wrr.651.1661356283710; 
 Wed, 24 Aug 2022 08:51:23 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:23 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 08/10] hw/arm/virt: Fix devicetree warnings about the GPIO node
Date: Wed, 24 Aug 2022 16:51:12 +0100
Message-Id: <20220824155113.286730-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
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

The GPIO devicetree node is missing "interrupt-controller" and
"#interrupt-cells" properties:

  pl061@9030000: 'interrupt-controller' is a required property
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
  pl061@9030000: '#interrupt-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 952af37935..779eb5ea31 100644
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
2.37.1


