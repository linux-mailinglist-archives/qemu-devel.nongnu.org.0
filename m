Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3174E5EBFCC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:33:52 +0200 (CEST)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7uR-0003r3-1N
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a8-0000sh-2i
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a4-0002Ue-Rm
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:51 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x18so14203628wrm.7
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/+qe3hdCuMJ02ODpgrestqrO1u1hGDsXWeqMcbLXyck=;
 b=AiW/GIg/GjwEaAnZ2TVBmgpWRD6IsAUThqA4QnpWfreS2ukL5SPvVq9XQhOTpWa5AB
 xbg/PUPoO+Kgzmh94pJnh6/A37RFS/cf8cTvSDXvDtdMbeQfW7+It8GGHy+/CeQ+Bfwd
 Hp7oCE5nNNc1dstkW71I9LqikPzpQyhGmdqOQs0+PeHp6LOqMWdOWXehQftvPx9cGH5H
 C2ytjHnoN+m6S8q5GNJYCjUkjeRdCGKJiN1EYwTd+m8klEGvUvpp6NCPM96cuJjKI43S
 gS+mL6KPo4Zkl0hzJE4vMbOPMu27PUDRm1THBvUszhlUFY0KT9Ph1rrOyz2x06HNTyRX
 dQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/+qe3hdCuMJ02ODpgrestqrO1u1hGDsXWeqMcbLXyck=;
 b=KFSEjElw/XoFlJlLQ9gcEJQp/HvRa3VpizAaVEbULizg/UF/Jjcuxf/GbWS4/j7IO/
 R3jahnQeScZxtsfwBonid4tg54YhY6kFqZ/3RQ2EO/qQERm4rOWyPVZAk5GtjFIqueFx
 WZE7utXLbCWt+EJgArZ7mY+Jr8mhFvmJ1GcxnRiO5KW6Ey2plb5h9idQY0ga0HxgLAZf
 IMi23sTcEx9j5EWgpz5KlaMdYDa9oAEXEUAV6Ne8Er4dngPIqRQaNwhXs5b3tG/HLKHi
 Z1O7+XVgZqJOadFu+HUeDbdciAh6YAqooslru1I49U48dhL22JcdOAm4yLsGNXuHB5w9
 EmnA==
X-Gm-Message-State: ACrzQf0WKpdm+wUibeBJ0FIbeKZIrP37tTIZADw4p8FKWcm72K+Wez8a
 Tlsri6pgluH2xPQ3ejZQ9fxaYw==
X-Google-Smtp-Source: AMsMyM51xupnMgYHaj9zr0Rlfe1YHAhN6aNBlheapNHiHulzXJ6pOsFdiOrNsCmtDeG5iL0xbNHcaQ==
X-Received: by 2002:a5d:64c4:0:b0:228:e143:ddb8 with SMTP id
 f4-20020a5d64c4000000b00228e143ddb8mr15707074wri.148.1664273567527; 
 Tue, 27 Sep 2022 03:12:47 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:47 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 2/8] hw/arm/virt: Fix devicetree warning about the GIC node
Date: Tue, 27 Sep 2022 11:03:43 +0100
Message-Id: <20220927100347.176606-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
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

The GICv3 bindings requires a #msi-cells property for the ITS node. Fix
the corresponding dt-validate warning:

  interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 83ab1a37fb..ed6f1ac41e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -487,6 +487,7 @@ static void fdt_add_its_gic_node(VirtMachineState *vms)
     qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                             "arm,gic-v3-its");
     qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#msi-cells", 1);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_ITS].base,
                                  2, vms->memmap[VIRT_GIC_ITS].size);
-- 
2.37.3


