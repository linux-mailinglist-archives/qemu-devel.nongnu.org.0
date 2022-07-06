Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D956935B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:32:23 +0200 (CEST)
Received: from localhost ([::1]:35534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Bh7-00018Y-Oi
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLb-0000Oh-Du; Wed, 06 Jul 2022 16:10:11 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLZ-0003H6-Sl; Wed, 06 Jul 2022 16:10:07 -0400
Received: by mail-ua1-x933.google.com with SMTP id r18so4021975uan.4;
 Wed, 06 Jul 2022 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lWXjSezOa9tow7Nd0fD8V4X9VZ/+Jkh0kxii0qUopag=;
 b=YDYZV9xfkAhso+9Ey/fGBSB1Qz7OHwrhhph8reZmONkccV9/qc5FcsLvSAA887tsLq
 LSLsh7VhQqSpRMCiUBjv6oXn0N0uR8z+pa2AzUznfbguOBiZZOtNkq3bfhKXAeTBP2zB
 souSJt84UpQecM20H5eCc3M4DuEVI+2AxigcHmeO4mVNIpS+EUF7tnkqWxJvSn8gJ6SB
 rfUSb1Mh057vmvPn/K4/STtc4wGUTiQglfwHlSJEeszaVXVkskh5NuDzbUlFq2/NBhGs
 6YGP5hCBLZEysbDHwXyMR0eAnVBAihhvoFZQcRx6FXTkm45NwDDgz7UFCILmjJ57GrMu
 qIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lWXjSezOa9tow7Nd0fD8V4X9VZ/+Jkh0kxii0qUopag=;
 b=5V/NPiBDhuYdadMgzov40ZRuTOmlY/rYeLvdTtMosWTHkGDI/OWNuEL+mc3OJorn/5
 XrP8UpsqfU/uIYLBFuc3lhr9oxspqOZ/miyfqpzMOFZr1fSQBCewFM19dvr0ASxxD1oE
 Uj73QaLzLAiYTNDCocrc9D1JBG80CHPXw3iVoxDromOu5clLnHLsNLIcm1ytd9jo3hqB
 1WBm+pjEaxwOUTDg2rjfAn2HC7hyLn9pLQbSZxyLEOCPr19qoQvUEHE1jUIHwkpQi4Yw
 Huwbu5RjukO7SZPLbd+FAorygTp61JKKkGKTcG9tRmgqso87f+hRd9CAe5lEYL1nCU0f
 JrMQ==
X-Gm-Message-State: AJIora9vqzTISYbCdu+WGSwRPvPPRQAqPzMH+eOCjJl0x1IOf/qFBe+q
 uFCUURknOk+GpsDC4YYDzPgtSP6td5I=
X-Google-Smtp-Source: AGRyM1s2L7GzRrOwNFI7gcj4SAe6+Wy70TBw/VKU7I8CePsORf19GHDu0CQjOrcVmF1owE2pKcQmxw==
X-Received: by 2002:ab0:7587:0:b0:382:bbb2:afad with SMTP id
 q7-20020ab07587000000b00382bbb2afadmr6443019uap.79.1657138204707; 
 Wed, 06 Jul 2022 13:10:04 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 07/34] ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb3 root
 bus
Date: Wed,  6 Jul 2022 17:09:19 -0300
Message-Id: <20220706200946.471114-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

It's unneeded. No other PCIE_BUS implements this interface.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Fixes: 9ae1329ee2fe ("ppc/pnv: Add models for POWER8 PHB3 PCIe Host bridge")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220621173436.165912-8-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index afe5698167..d58d3c1701 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1130,10 +1130,6 @@ static const TypeInfo pnv_phb3_root_bus_info = {
     .name = TYPE_PNV_PHB3_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
     .class_init = pnv_phb3_root_bus_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { }
-    },
 };
 
 static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
-- 
2.36.1


