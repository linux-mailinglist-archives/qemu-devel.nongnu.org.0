Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F81E5F0CA0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:43:29 +0200 (CEST)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGIa-0000K8-2A
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAn-0000Cc-TH
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAj-0006Uw-9d
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so4785116wmr.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=BI4FnRPteZ9TB6kG7Wp0H8/Z1m3ozSZQ6DVgXaBdi4w=;
 b=yfkFPbUjGcBfhILqmFn2yup3V/CxOqEnuk1CWnpm9IcGvUmXwXUKiBrFrcCchCU+go
 VxVC2693tIPWsdwsgnKo1mW++gU3yPQ6t0KSAjBcKKxuquA17NnBmiIMpBKBxNEHkaA+
 VJg+tG2tIr7j7n00RHORVvZRu3Mi7wkntnl3WIfLJ+oqKx0A4GxNqRgUHT2loRGBjuWa
 faFlV0ASQRxH4lkYb9jGVrdXNrkMLB+BmFv5puT200RUK1vcqCTVb+vOaOzHiSMkEJxn
 UJey0U80wtXPaxwvtj6wlJnxgUpNgPjwFpKFo1EGxzZAoGgig1tkaI+YryyZQKbwrEvU
 wpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BI4FnRPteZ9TB6kG7Wp0H8/Z1m3ozSZQ6DVgXaBdi4w=;
 b=GqE9xnnLB7ja3nmpgk0yYrwqfCLrT78Uxp8ROeLaVdhtURfFgry1IqDtM4DRdn7Ncu
 +BdgG/Ccj62F/dhzRQlxXZLcglY/BPkTsYAvbEfjgx7E4A8z3xxkcKutZFSiTJT/wN3q
 PypC6Dgqs/n4uu9Lh7YMHnJrnWKrQ3G8xcr/7PGxUjBfseOC1IjVJRJMHbi+DhO6GaYS
 +woeBpQGyoejzIOt/QctUCN/DfH9Q9wKeA81aT/4IggfNoKO35YBCUtXgSpJLQsYnJyr
 DjrGlIzIvLw9+9hBp11bctmh/5oFJ2pMpOr11/h9qGZ+h9/qyqgE4+ofnSCghbWI/hVm
 4cbQ==
X-Gm-Message-State: ACrzQf09yTJ5hkATRfNkGHslS2J5cPBzq4xCymvyg7N4eMGRdXHczWSl
 3GscWSeT9Dd3/WUIh4oFSkD5pXnwDod1EA==
X-Google-Smtp-Source: AMsMyM60I/DLBYQNbJuYv2JgTHhFp0x3H+LMrwaHW92iXM7JGU6eFv+Y4fKJd6V2ur95slNpTKHCsQ==
X-Received: by 2002:a05:600c:3c82:b0:3b5:60a6:c80f with SMTP id
 bg2-20020a05600c3c8200b003b560a6c80fmr5993003wmb.199.1664544919853; 
 Fri, 30 Sep 2022 06:35:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] hw/arm/virt: Fix devicetree warning about the GIC node
Date: Fri, 30 Sep 2022 14:35:08 +0100
Message-Id: <20220930133511.2112734-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The GICv3 bindings requires a #msi-cells property for the ITS node. Fix
the corresponding dt-validate warning:

  interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220927100347.176606-3-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f4ee71cda18..41b88dd1444 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -488,6 +488,7 @@ static void fdt_add_its_gic_node(VirtMachineState *vms)
     qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                             "arm,gic-v3-its");
     qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#msi-cells", 1);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_ITS].base,
                                  2, vms->memmap[VIRT_GIC_ITS].size);
-- 
2.25.1


