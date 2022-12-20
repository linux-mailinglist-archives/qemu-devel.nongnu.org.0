Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03268651FD1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ato-0004Ei-GI; Tue, 20 Dec 2022 06:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atl-0004Cc-As
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:35:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ati-00081s-PF
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:35:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso10872973wms.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oug+yyfnrjJxQPmigf/yq+rALBMZ7d2PLfBytRZUvRA=;
 b=UjYSTfQxscRpDeqRHP3c2/GeRj+b30kTaBmRJv1beC9r+O9adwH9PijuxbnBviYEEA
 fnJmfBKDvjU1oSgGLqMFC0/FouzKICf01KR5onNmUJPc0E0cTN6kXUX9dm6X891sD0g5
 xM9Yh/KvJfCgWXZ9u6V7jUlSPtPzn13Wsnv+L1CvI/I4ihN5MsXKNIE5zVAHkUnkPr+i
 lewrqV2M9EJVGzR5Ijlq+FStZC8wD7r1uXIOb9ChtwW0xq2sjNwKLWwaajtil33gcfjl
 UfSPPPYJAflXQcJD+fS0BLNqqfNb/Y70kMhWlu1NUWazroNEWopNBhqAFbtkAyxBtfzQ
 ZmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oug+yyfnrjJxQPmigf/yq+rALBMZ7d2PLfBytRZUvRA=;
 b=cwGPOCnUd+yeBDmH2fIp2E4R/NS3FXuUlHo3gEjuA09L5xLtv8imeZbsSuXHiCmfSr
 yt7Ldmlb9pBlDa4Hs7VFgFb22eblOZgCb3DM1mtNtKzrYO+M7oNGyQ4cAPzMWgvYqpT8
 0+YCLycyoy+Yru9vNn5bvR2Arhlvz52CpFzaZxylsFHqIBD8laby3/b/I63u4Io0jMXE
 jmVCebDLIy3aLfQqberOM2QCTfsCYuzcx9F8dqznu86uR0wUeFdHWGjlfz5vLfIMdPkC
 EBT3MX59dWxGG+PAp9yPPLWdJVfSpEkybJKIVRx67DcEzS/c10xEGTtmvUoluKYbxYxv
 Zrcw==
X-Gm-Message-State: AFqh2koeYR5QA5/lbZuImJmOj4Xly1v32Wq+RYydm0cjC0THVALDnFOD
 7/ysKI6Tp2qguMjlGoDZPgdp4cPk7mwh5IqGtKs=
X-Google-Smtp-Source: AMrXdXvmQzP/B5eJ1BDsMeLMK/Pkvp5KvumT3xpouKUMmfwRYWjvV6C/kwCMwzALtAm63cDA8Uzx3w==
X-Received: by 2002:a05:600c:5010:b0:3d3:55ad:a114 with SMTP id
 n16-20020a05600c501000b003d355ada114mr6833486wmr.38.1671536100963; 
 Tue, 20 Dec 2022 03:35:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b003c6b7f5567csm2781414wms.0.2022.12.20.03.34.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:34:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 4/7] hw/mips/gt64xxx_pci: Add a 'cpu-little-endian' qdev
 property
Date: Tue, 20 Dec 2022 12:34:33 +0100
Message-Id: <20221220113436.14299-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220113436.14299-1-philmd@linaro.org>
References: <20221220113436.14299-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Message-Id: <20221209151533.69516-5-philmd@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index f6fa309ef7..4cafc76a23 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
+#include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
 #include "hw/pci/pci.h"
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
@@ -998,16 +1002,11 @@ static const MemoryRegionOps isd_mem_ops = {
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
@@ -1114,7 +1113,7 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_TC_CONTROL]    = 0x00000000;
 
     /* PCI Internal */
-    s->regs[GT_PCI0_CMD] = cpu_little_endian ? R_GT_PCI0_CMD_ByteSwap_MASK : 0;
+    s->regs[GT_PCI0_CMD] = s->cpu_little_endian ? R_GT_PCI0_CMD_ByteSwap_MASK : 0;
     s->regs[GT_PCI0_TOR]      = 0x0000070f;
     s->regs[GT_PCI0_BS_SCS10] = 0x00fff000;
     s->regs[GT_PCI0_BS_SCS32] = 0x00fff000;
@@ -1131,7 +1130,7 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_PCI0_SSCS10_BAR] = 0x00000000;
     s->regs[GT_PCI0_SSCS32_BAR] = 0x01000000;
     s->regs[GT_PCI0_SCS3BT_BAR] = 0x1f000000;
-    s->regs[GT_PCI1_CMD] = cpu_little_endian ? R_GT_PCI1_CMD_ByteSwap_MASK : 0;
+    s->regs[GT_PCI1_CMD] = s->cpu_little_endian ? R_GT_PCI1_CMD_ByteSwap_MASK : 0;
     s->regs[GT_PCI1_TOR]      = 0x0000070f;
     s->regs[GT_PCI1_BS_SCS10] = 0x00fff000;
     s->regs[GT_PCI1_BS_SCS32] = 0x00fff000;
@@ -1224,11 +1223,18 @@ static const TypeInfo gt64120_pci_info = {
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


