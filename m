Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943AF669D11
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:00:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGW-0001ou-1b; Fri, 13 Jan 2023 10:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFz-0001Su-Po
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:17 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFw-00060K-Id
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:15 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v2so10459135wrw.10
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IT3IpxyYwIlPuQTuUl1M3op7EMUs1BKHimyoxbFdJ3Y=;
 b=Q3XRTFbiIPX0wvuv2MIdTzj40sKnSeIsh6zTfSKYFmtkEfAMsw2KvPvqHcIsnyesgS
 kv/t+V7XpWfAQSFmxtdYodsusjxztwXfM2BzEYjhgxB8SZZWJWhqc+ye8nvFyvRmOlmH
 QMGAHhociaZ+FDYUEytg44gImsdwgg/TlBUGd8C0/KX6oAsjn8dW8mWW02LX8nRUhnIF
 qTCLLKnKVgoSuMjB0ZvTADAQ2b7d/UjMUvYopG0MuKlWTwhHKS0r6cVNmylXyYNivNte
 k+1uHPXSwnrWwfFDxn73F9dIhhz/Yws9LUhN8XqKiQYYoX3TS8AqqDft4fcT38uIoPvo
 Ao1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IT3IpxyYwIlPuQTuUl1M3op7EMUs1BKHimyoxbFdJ3Y=;
 b=jiVmv08bwhhPELqalm+B23CD2eHZKNpMnezyVVo1Rs7zAU/xqwuTSk5U+qByCqHPIy
 jS0u0pzIxvvEL4fGOWbLinb2tzJYkRc+JiB4NaORputY9EDeRWVAiYeAEagQkyvkmsEI
 zX0d23og4LqSinqUExA6Ny3/9HqWWik1ctfltBnZ+mwDTjJNnhAR7jVRWPtHSSOoGwGm
 JksSHQO7+7COmjr81qY7asbFqKjDXFelfO2OzwpWmjGppfSJgWZvTu9rCNCBRxmAYXf9
 MKpDa3WlGQzABa6YoQYdy6i3O1jOjPgxPKIUeksghHdIufVfpwE80UE0fzsTZzUnPWL3
 QDhg==
X-Gm-Message-State: AFqh2kqH6LYkxwNegbyhMC4TMCjQbyIzZMwDxugOgMO9xoftsZxweGdD
 kLwcczJiZrWNzCwhXtWZia11dIug/HZ5DCKu
X-Google-Smtp-Source: AMrXdXu9ZLVLPWEZgxytjtgUdZL0u0paG5Ujzx1j5P8n9wtkqq6m7+4uSRyJKO4Hjqx4eRGdlTHxHA==
X-Received: by 2002:a5d:564e:0:b0:27d:59a5:28bc with SMTP id
 j14-20020a5d564e000000b0027d59a528bcmr43072312wrw.35.1673624768084; 
 Fri, 13 Jan 2023 07:46:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 by12-20020a056000098c00b002bdd8f12effsm3867666wrb.30.2023.01.13.07.46.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/46] hw/mips/gt64xxx_pci: Manage endian bits with the
 RegisterFields API
Date: Fri, 13 Jan 2023 16:44:53 +0100
Message-Id: <20230113154532.49979-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Message-Id: <20221220113436.14299-4-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 7ba052a2e0..85bdf5279c 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
+#include "hw/registerfields.h"
 #include "hw/pci/pci_device.h"
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
@@ -1020,15 +1035,16 @@ static const MemoryRegionOps isd_mem_ops = {
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
@@ -1135,11 +1151,7 @@ static void gt64120_reset(DeviceState *dev)
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
@@ -1156,11 +1168,7 @@ static void gt64120_reset(DeviceState *dev)
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


