Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1558CF85
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:14:57 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLA5Q-0006l4-RM
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z9-0008I4-In
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:08:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z8-0006LR-0o
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:08:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id v5so5396552wmj.0
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
 b=JddNGHWDeeejm2RIJHx/iBhnK4ZsV/U8akRmYUJecC0+M88okiM7FdxKpDerVLuNZc
 1JG+i4WUzOgZrGF+yyP6S57mck6D9oX/fbsVbYaWJHNAkElO6FRIp4kQpmBbZb30XIfs
 hTwJeoc3LWLOAw35qTX/r5jXgXmDphAHNcPwDQXL+DF31qcn4eQOsrAVr7PVgB+bX0fV
 tR/ZuFBfr4iYtniDLQZA5ci6fscCF4+d1TOPdDrq57vlQ84qFeWpe/mJrPvFpsZf9guO
 zksAIlJB4tZu1PolizuifoqLskduaHL7MWM6UFMUw4tvoIXxcJMCGvwmdwJlPPhN7fNn
 8nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
 b=srnxozP0kVVgJqnSIpJMz97riliwyQ33qVt/UfU6nou3jq2JBbn+515VQUnIgTDRJz
 qip5Sm7KsKw5Nap1QGpB2Ie3eeS2MVNi8wXAaMNcxF4c1orZkXrrJuNL6Q0y0+5T8OrA
 SdviORgaBXtZUUHoHXyzHY10t9ZLDzQQ+vxofgMRo4qPrm14KxoEqy5Y2B0IGobUNxFk
 71v1H0/bhgoTph8SayViiW4kAnFz/kj+egGEuKrq4NwNP4HxU45Y+uty1GfOkU1VMpZb
 koYnGsIjmrofg8bkafRffnShHyX/hXlCsVK7MjrRsBUb77wR6wgjDEiDA24USL2yLOID
 cnqw==
X-Gm-Message-State: ACgBeo2pRSE3L0hBqpWJpV9X2xHvvxVxptI0mvH3ZqPFodLSJalvV9gd
 pbJijX90S0xwM1n9xb1WtOk4Iw==
X-Google-Smtp-Source: AA6agR46x1AlO/jiQSG57WcvYDDMG3jH+AztYwAsHFqxHQo4Ry3vl3BYbmunOzGYbCe7dbvp/9A6JQ==
X-Received: by 2002:a05:600c:21d4:b0:3a3:150a:7ed2 with SMTP id
 x20-20020a05600c21d400b003a3150a7ed2mr13800655wmj.166.1659992904355; 
 Mon, 08 Aug 2022 14:08:24 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:08:23 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 4/4] hw/core: fix platform bus node name
Date: Mon,  8 Aug 2022 22:06:44 +0100
Message-Id: <20220808210643.2192602-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808210643.2192602-1-mail@conchuod.ie>
References: <20220808210643.2192602-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x32f.google.com
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

From: Conor Dooley <conor.dooley@microchip.com>

"platform" is not a valid name for a bus node in dt-schema, so warnings
can be see in dt-validate on a dump of the riscv virt dtb:

/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
"platform-bus" is a valid name, so use that instead.

CC: Rob Herring <robh@kernel.org>
Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/core/sysbus-fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 19d22cbe73..edb0c49b19 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
 
     assert(fdt);
 
-    node = g_strdup_printf("/platform@%"PRIx64, addr);
+    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
 
     /* Create a /platform node that we can put all devices into */
     qemu_fdt_add_subnode(fdt, node);
-- 
2.37.1


