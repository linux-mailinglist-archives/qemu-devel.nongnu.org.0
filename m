Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AF651FD7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:41:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7atn-0004Bs-9q; Tue, 20 Dec 2022 06:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ate-0004AK-O2
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:34:59 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atd-00080P-0L
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:34:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id h10so11447084wrx.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZM6SdCAnwA4ZL3m+yseAtDWjOQrZEuleB9DCwJGkl6E=;
 b=q+JPw3/qVAtJ4a8VCmJyw6vK0lZN26ylrZV3PCUg394s7q5/YEevH8v8KQQXk0/ABp
 esKUG1LrQFUNNStE+d4WQSjvCWpSd/v+h6HP3ViXMIfD8ZNdoMfbMYrJBSWRr9pxm5L+
 QJ3dpo9h6W5rrxgShXcZr0TVnsCF5povYl4YBpTFAabRETAMxXcJBXjMqeAFYccerDI1
 5vfmibgfdK2kYcmK+RI5WJqMGNAdZZ45oPw8I0EY9wsMn2LVA7fmXoYFdaLSZYCno8Tm
 Wh7Wr0JEL9VhAd7Id26LOdxUNPH+kLU2yTLql/vhrAWEs/HQqd2BiSJdRRo2zQ0LnJ5s
 jH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZM6SdCAnwA4ZL3m+yseAtDWjOQrZEuleB9DCwJGkl6E=;
 b=qIvOfz8+KP84/wJ3GAAL5JhA6MZHnDVDcWh6iMBeITrV9ihmS3W2oHUiqPXgVJSP55
 Buw//kcxg+5pbTY/cS1AQfD4RCZAbQM4AYBpR3FwwWFCqRb0+3bqoYRQ/eZwd/myb6co
 sHXfCewH6se1mUKFWsBDmHYJbjvhnJGovtSEfJnQwXCX2inNzUaXqc8i1L81J0xmh8xa
 AWE4OQoWIGyLHMFY0KzWPKr6BGaIUw/TD91NNx87/V1efZ8Gqv+e03ZoxI+FVF4YLKDm
 iUT5kK6c7G5oJ7VFD57zSerqzLz++zUjEz6EGKlGdKMay5HT0S7UnS4FS+mxHv4oAKAj
 OgUQ==
X-Gm-Message-State: ANoB5pkrTP+kim+1St+iph/2QovnCbqIHk6HZ+g3xAh4Fhb1T+K1Fm7E
 rx3GX6H/ydJHTFbmVrtOWFkQV9CVL+zR6gwLP/w=
X-Google-Smtp-Source: AA0mqf6+1Tp+AxsnwFXfHpBs/8FXi7aS9Za51Nfj9Zr36vvQctUKNFQZYST9xRVKER+Fo/Q/X/OH+A==
X-Received: by 2002:adf:a743:0:b0:242:1c1a:37ec with SMTP id
 e3-20020adfa743000000b002421c1a37ecmr27524659wrd.17.1671536095380; 
 Tue, 20 Dec 2022 03:34:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ck5-20020a5d5e85000000b00257795ffcc8sm12596264wrb.73.2022.12.20.03.34.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:34:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/7] hw/mips/gt64xxx_pci: Manage endian bits with the
 RegisterFields API
Date: Tue, 20 Dec 2022 12:34:32 +0100
Message-Id: <20221220113436.14299-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220113436.14299-1-philmd@linaro.org>
References: <20221220113436.14299-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209151533.69516-4-philmd@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 1b9ac7f792..f6fa309ef7 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
+#include "hw/registerfields.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/misc/empty_slot.h"
@@ -41,6 +42,9 @@
 #define GT_CPU                  (0x000 >> 2)
 #define GT_MULTI                (0x120 >> 2)
 
+REG32(GT_CPU,                   0x000)
+FIELD(GT_CPU,                   Endianness,     12, 1)
+
 /* CPU Address Decode */
 #define GT_SCS10LD              (0x008 >> 2)
 #define GT_SCS10HD              (0x010 >> 2)
@@ -210,6 +214,17 @@
 #define GT_PCI0_CFGADDR         (0xcf8 >> 2)
 #define GT_PCI0_CFGDATA         (0xcfc >> 2)
 
+REG32(GT_PCI0_CMD,              0xc00)
+FIELD(GT_PCI0_CMD,              MByteSwap,      0,  1)
+FIELD(GT_PCI0_CMD,              SByteSwap,      16, 1)
+#define  R_GT_PCI0_CMD_ByteSwap_MASK \
+        (R_GT_PCI0_CMD_MByteSwap_MASK | R_GT_PCI0_CMD_SByteSwap_MASK)
+REG32(GT_PCI1_CMD,              0xc80)
+FIELD(GT_PCI1_CMD,              MByteSwap,      0,  1)
+FIELD(GT_PCI1_CMD,              SByteSwap,      16, 1)
+#define  R_GT_PCI1_CMD_ByteSwap_MASK \
+        (R_GT_PCI1_CMD_MByteSwap_MASK | R_GT_PCI1_CMD_SByteSwap_MASK)
+
 /* Interrupts */
 #define GT_INTRCAUSE            (0xc18 >> 2)
 #define GT_INTRMASK             (0xc1c >> 2)
@@ -983,15 +998,16 @@ static const MemoryRegionOps isd_mem_ops = {
 static void gt64120_reset(DeviceState *dev)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
+#if TARGET_BIG_ENDIAN
+    bool cpu_little_endian = false;
+#else
+    bool cpu_little_endian = true;
+#endif
 
     /* FIXME: Malta specific hw assumptions ahead */
 
     /* CPU Configuration */
-#if TARGET_BIG_ENDIAN
-    s->regs[GT_CPU]           = 0x00000000;
-#else
-    s->regs[GT_CPU]           = 0x00001000;
-#endif
+    s->regs[GT_CPU] = cpu_little_endian ? R_GT_CPU_Endianness_MASK : 0;
     s->regs[GT_MULTI]         = 0x00000003;
 
     /* CPU Address decode */
@@ -1098,11 +1114,7 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_TC_CONTROL]    = 0x00000000;
 
     /* PCI Internal */
-#if TARGET_BIG_ENDIAN
-    s->regs[GT_PCI0_CMD]      = 0x00000000;
-#else
-    s->regs[GT_PCI0_CMD]      = 0x00010001;
-#endif
+    s->regs[GT_PCI0_CMD] = cpu_little_endian ? R_GT_PCI0_CMD_ByteSwap_MASK : 0;
     s->regs[GT_PCI0_TOR]      = 0x0000070f;
     s->regs[GT_PCI0_BS_SCS10] = 0x00fff000;
     s->regs[GT_PCI0_BS_SCS32] = 0x00fff000;
@@ -1119,11 +1131,7 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_PCI0_SSCS10_BAR] = 0x00000000;
     s->regs[GT_PCI0_SSCS32_BAR] = 0x01000000;
     s->regs[GT_PCI0_SCS3BT_BAR] = 0x1f000000;
-#if TARGET_BIG_ENDIAN
-    s->regs[GT_PCI1_CMD]      = 0x00000000;
-#else
-    s->regs[GT_PCI1_CMD]      = 0x00010001;
-#endif
+    s->regs[GT_PCI1_CMD] = cpu_little_endian ? R_GT_PCI1_CMD_ByteSwap_MASK : 0;
     s->regs[GT_PCI1_TOR]      = 0x0000070f;
     s->regs[GT_PCI1_BS_SCS10] = 0x00fff000;
     s->regs[GT_PCI1_BS_SCS32] = 0x00fff000;
-- 
2.38.1


