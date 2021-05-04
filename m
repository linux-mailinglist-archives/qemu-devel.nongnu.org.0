Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2689372A47
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 14:43:54 +0200 (CEST)
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lduP3-0004Rq-H5
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 08:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lduN2-0003qs-4t; Tue, 04 May 2021 08:41:48 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lduN0-0007J2-5C; Tue, 04 May 2021 08:41:47 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 c36-20020a05683034a4b02902a5b84b1d12so7671567otu.8; 
 Tue, 04 May 2021 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZI/Y5KhzOyVR4Eea+CJes/TjhYkFO1T4zOnnXlLiM4g=;
 b=apGiFmGtaGKXkOKKgqywuruqww0FAJZefQhELHIp9Ph64PaNlHxVVD7rEgHLX7XR7D
 DdI1fhqLLFv9W50Pe8s1prpJt/ZVFef434bNld9luvtVBxniEJNXjmzxiQhQeOKTCbEv
 qPs/xcsrqzkuMWARzt+vU8FJCS8z8KDuTYoLONnS8SdogQ0fF74uH5IeIPF/Jsdy4+yI
 OX6XnUYpxId4S7GaBpOulmrqquSHMcUZUs4vnukbIipQx7RwWlkgzhYh26KqVaQT8EPt
 h3ilbQx3NeAv3oiYNBsivfw1Bx0URrlCdley5ZgmUsS1vdCkQ7iOe55TRydY7lHs15s7
 JI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZI/Y5KhzOyVR4Eea+CJes/TjhYkFO1T4zOnnXlLiM4g=;
 b=mId01Ybr93fm/bP894uy/xl+V8H+k/1RJseHwFgiZaLMrBp4xwW92YwqnpnzDqzo5t
 U0QrUvuK5N8fuza+V+TFvTaMQY5Uf88dDS5HOjFCFjdhE0618kvjDkxgLlz/h/0Psvs8
 5VYYpWSSzWH4+p4cdmeIm09kE8fPloT0IeD9s6QPg/yiwL8HEXfICGMrQs2EoBYTZNi6
 XM+qgML6X8UQ46w9sPcffPjkUeG8yl0xurpHKm+1kgb1gS/QII3jnl8IIDkWEqU4NPpd
 tF7YHJThmeguP9Lcqzh1bUTz8bbXRLauE+lXH9040/xciW06ptBp4TjR0pqAiZqWx9O3
 Iy3A==
X-Gm-Message-State: AOAM530Cl9qTf48+G1EcLGObegSoSB6qfPrKd3ETjFuZrY5Zd4poXmqs
 RFxqwXC1s85BbSRh1/wmRx8=
X-Google-Smtp-Source: ABdhPJwJSZpyuPiTbvheRPH7QLAFc5Gcb32oP2ReO1JVQV74lhJDrWTou/VEhau5TiMCWhSgjM8emQ==
X-Received: by 2002:a9d:8cb:: with SMTP id 69mr18789803otf.247.1620132104178; 
 Tue, 04 May 2021 05:41:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r124sm639703oig.38.2021.05.04.05.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:41:43 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH] hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9
Date: Tue,  4 May 2021 05:41:40 -0700
Message-Id: <20210504124140.1100346-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit dfc388797cc4 ("hw/arm: xlnx: Set all boards' GEM 'phy-addr'
property value to 23") configured the PHY address for xilinx-zynq-a9
to 23. When trying to boot xilinx-zynq-a9 with zynq-zc702.dtb or
zynq-zc706.dtb, this results in the following error message when
trying to use the Ethernet interface.

macb e000b000.ethernet eth0: Could not attach PHY (-19)

The devicetree files for ZC702 and ZC706 configure PHY address 7. The
documentation for the ZC702 and ZC706 evaluation boards suggest that the
PHY address is 7, not 23. Other boards use PHY address 0, 1, 3, or 7.
I was unable to find a documentation or a devicetree file suggesting
or using PHY address 23. The Ethernet interface starts working with
zynq-zc702.dtb and zynq-zc706.dtb when setting the PHY address to 7,
so let's use it.

Cc: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/xilinx_zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 8db6cfd47f..5ac0294f9e 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -119,7 +119,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
         qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
         qdev_set_nic_properties(dev, nd);
     }
-    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
+    object_property_set_int(OBJECT(dev), "phy-addr", 7, &error_abort);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, base);
-- 
2.25.1


