Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45D1669D1A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGY-0001rE-K2; Fri, 13 Jan 2023 10:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMG1-0001Uw-1a
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:18 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFy-000624-E9
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:16 -0500
Received: by mail-wr1-x430.google.com with SMTP id k8so6956497wrc.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rC+XQm2jLSXbgQ7LC1gN01sFQ4DaZrRbxtfq7Vgq2EA=;
 b=di/CVOHcvTNSWsVMGq217JKVsnVfzSE6NWoyFpJsci7bhOsbQg4A3jkg1ETCU5j42Q
 FvxOH0rI4mDiWsclMtyFBso9LdWWkunGx92NdF7nVBq96Jd8IImJO5fS6YbohH4QKPJf
 wHw+P/O/u3fVvIW/6KZ0DCSZ4Rk9vbf7XxOvwMvP+11ARBTZL4wMJBEf99CsdZo7dxDc
 3ASJ9FrzyyaKX0Sls1RhvKNykRNWq6Ves9hH/UEOZIS33yCuCO1e9UBRwcpb8/pcRBsf
 bqlwiu4b54NgpzgS0HjxtS/ztGIvCwNFEBlUCsEitZ7CHZO3NTByQqK9e2qytVJ3txr/
 NwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rC+XQm2jLSXbgQ7LC1gN01sFQ4DaZrRbxtfq7Vgq2EA=;
 b=EZJjkL5yS6llr1xf4tqFELssrs4cfsR7nPVyKFgf3ziKWuVXHOSxnsXvq+my4YHA+O
 hxIPwnFroEXkBnuo63y9I7iJ/crEH0ogwQup1yWQkO45zOQsycNXN5by1XBmD5V8sCSM
 TySfiWJBl++wz/DV1bBa3egS8C1EEM6yV9Usch3bzGb5PlnYmZkoITfI/KEWx7EaVAPW
 R5IDPAQqVas8/Ob6tWtP36ulJj0KVq4LBd14bXwjzd+Em0uG3PnwmxHFTD7dwUSJdgVx
 59f00OdbOaJji3Tn0AvssgbljB0KmapJim2ngiNQJN8CuSEX/rUneBpjqCSS4zgI0mEN
 lsag==
X-Gm-Message-State: AFqh2kpavZDnhqbjR1DFiAy9d4j+NHdX7vUJ7/X4/EkRmReQVQHp+mLh
 IZ9LTC+yTEQCn3aVwAUHu/0fpBKdmOAeOr8e
X-Google-Smtp-Source: AMrXdXux6zF6MLrWxlaeY8x7+BAouO3WQ2wQ9/XfTYYNIY/AD3jfu9eSJqCmPUaBcatlaXL0v/44lg==
X-Received: by 2002:a5d:4904:0:b0:2a6:caa0:f230 with SMTP id
 x4-20020a5d4904000000b002a6caa0f230mr21955179wrq.66.1673624772696; 
 Fri, 13 Jan 2023 07:46:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a5d4091000000b0028965dc7c6bsm18970645wrp.73.2023.01.13.07.46.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 08/46] hw/mips/gt64xxx_pci: Add a 'cpu-little-endian' qdev
 property
Date: Fri, 13 Jan 2023 16:44:54 +0100
Message-Id: <20230113154532.49979-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This device does not have to be TARGET-dependent.
Add a 'cpu_big_endian' property which sets the byte-swapping
options if required.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221220113436.14299-5-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 85bdf5279c..79c15a5e3a 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
+#include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
 #include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
@@ -256,6 +257,9 @@ struct GT64120State {
     PCI_MAPPING_ENTRY(ISD);
     MemoryRegion pci0_mem;
     AddressSpace pci0_mem_as;
+
+    /* properties */
+    bool cpu_little_endian;
 };
 
 /* Adjust range to avoid touching space which isn't mappable via PCI */
@@ -1035,16 +1039,11 @@ static const MemoryRegionOps isd_mem_ops = {
 static void gt64120_reset(DeviceState *dev)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
-#if TARGET_BIG_ENDIAN
-    bool cpu_little_endian = false;
-#else
-    bool cpu_little_endian = true;
-#endif
 
     /* FIXME: Malta specific hw assumptions ahead */
 
     /* CPU Configuration */
-    s->regs[GT_CPU] = cpu_little_endian ? R_GT_CPU_Endianness_MASK : 0;
+    s->regs[GT_CPU] = s->cpu_little_endian ? R_GT_CPU_Endianness_MASK : 0;
     s->regs[GT_MULTI]         = 0x00000003;
 
     /* CPU Address decode */
@@ -1151,7 +1150,7 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_TC_CONTROL]    = 0x00000000;
 
     /* PCI Internal */
-    s->regs[GT_PCI0_CMD] = cpu_little_endian ? R_GT_PCI0_CMD_ByteSwap_MASK : 0;
+    s->regs[GT_PCI0_CMD] = s->cpu_little_endian ? R_GT_PCI0_CMD_ByteSwap_MASK : 0;
     s->regs[GT_PCI0_TOR]      = 0x0000070f;
     s->regs[GT_PCI0_BS_SCS10] = 0x00fff000;
     s->regs[GT_PCI0_BS_SCS32] = 0x00fff000;
@@ -1168,7 +1167,7 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_PCI0_SSCS10_BAR] = 0x00000000;
     s->regs[GT_PCI0_SSCS32_BAR] = 0x01000000;
     s->regs[GT_PCI0_SCS3BT_BAR] = 0x1f000000;
-    s->regs[GT_PCI1_CMD] = cpu_little_endian ? R_GT_PCI1_CMD_ByteSwap_MASK : 0;
+    s->regs[GT_PCI1_CMD] = s->cpu_little_endian ? R_GT_PCI1_CMD_ByteSwap_MASK : 0;
     s->regs[GT_PCI1_TOR]      = 0x0000070f;
     s->regs[GT_PCI1_BS_SCS10] = 0x00fff000;
     s->regs[GT_PCI1_BS_SCS32] = 0x00fff000;
@@ -1262,11 +1261,18 @@ static const TypeInfo gt64120_pci_info = {
     },
 };
 
+static Property gt64120_properties[] = {
+    DEFINE_PROP_BOOL("cpu-little-endian", GT64120State,
+                     cpu_little_endian, !TARGET_BIG_ENDIAN),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void gt64120_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    device_class_set_props(dc, gt64120_properties);
     dc->realize = gt64120_realize;
     dc->reset = gt64120_reset;
     dc->vmsd = &vmstate_gt64120;
-- 
2.38.1


