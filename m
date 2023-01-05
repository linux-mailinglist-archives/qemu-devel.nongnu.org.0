Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F0065EC94
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDQ18-0000Qq-Ms; Thu, 05 Jan 2023 08:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDQ15-0000OU-LR
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:10:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDQ13-00051F-Tl
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:10:43 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1257974wmp.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FPAjA+sUAGrsEnD5AJZFTwSrlVK1lp78YuCScYsY65A=;
 b=o5OjJKL6a0TuY0aOK67KC4p914vLCH+HwJc+JcHn5hhV6L0RY3IT9TJBdyYnu0/GFE
 pXwLpbtKutVwdNrnxIJRkEYq5zorADx/Fw8U8rooeumKmGjku/pyoNNGMox/TOfB7Bc9
 v6oTU8QgCv7lVaXLjNAwbKTzhM1hdRfRk8y8Zx8ESx8RzrpKf/TBDImPEtfhbHQRzWCF
 DpuWEywFP3IK0IYgzFN0/kFU/EcEPQ6fJsIVEKgHVEA+fGhYm87LU1APm1C+Crnpgm8G
 cO/gnnkhPY32Aal2MQp8kCr9N+KAEQcZCyWn3Wa6e1JB3QFEZw/EMcDhii1l5HJbQL7Q
 UeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FPAjA+sUAGrsEnD5AJZFTwSrlVK1lp78YuCScYsY65A=;
 b=4YW2xZmKU6F4bqyXEJOmfzPHUf/ucRdsy1C1fmOrfa5yKxQtEFf7RLpAPk4EcUVWvf
 9EJH8R+2S5Vno4NmEv6wfKHh9SxXyXckvdVQFuh29JUhxJ6TWBfhP7K3Nt8cfjqipBP4
 D4ORargFXS/GR93tBtMpmzcKXk1CHi84j26yGrII7Ea8IEtFcLn/R6UqMOJ32XlNSUfP
 wfgV31N3EcI2rjyn4g9ZWj4gVh3Li+9UOKZwDkN2lAWVz55X2VJvKFsrmM0x6MZ55H05
 K7KhQE6RG3h13PqhmlX567oP0Gc6NltOW6iCH+QnVvH44TC93EDa/pWelKwO109uWCc+
 ln9A==
X-Gm-Message-State: AFqh2koo0BVbNbf/WRfCgUqoKNMMGwN+/80yYsK+PRqDzG0+zYiSS/Kn
 eK/B4Xjh0hE8ZNU+VAL06hq68lrf4q91fw+V
X-Google-Smtp-Source: AMrXdXttdobBCIsMExrcM34NJBlPZqOpEbWiAL6PAZGGC1gDpAPgRNZMzesTfrszvLn4fHyOQ9+AFQ==
X-Received: by 2002:a05:600c:1d98:b0:3d3:48f4:7a69 with SMTP id
 p24-20020a05600c1d9800b003d348f47a69mr44451374wms.17.1672924240161; 
 Thu, 05 Jan 2023 05:10:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003d978f8f255sm3558855wmq.27.2023.01.05.05.10.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:10:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH] hw/dma/rc4030: Move RC4030 declarations to its own 'rc4030.h'
 header
Date: Thu,  5 Jan 2023 14:10:38 +0100
Message-Id: <20230105131038.49549-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
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

RC4030 declarations are not MIPS specific, no need to
have them in all MIPS boards.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20230105130710.49264-1-philmd@linaro.org>
          "hw/pci-host/bonito: Housekeeping"
---
 hw/dma/rc4030.c         |  2 +-
 hw/mips/jazz.c          |  1 +
 include/hw/dma/rc4030.h | 21 +++++++++++++++++++++
 include/hw/mips/mips.h  |  9 ---------
 4 files changed, 23 insertions(+), 10 deletions(-)
 create mode 100644 include/hw/dma/rc4030.h

diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index aa1d323a36..6dbf6652ab 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "hw/irq.h"
-#include "hw/mips/mips.h"
+#include "hw/dma/rc4030.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6aefe9a61b..03882b5275 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -29,6 +29,7 @@
 #include "hw/mips/cpudevs.h"
 #include "hw/intc/i8259.h"
 #include "hw/dma/i8257.h"
+#include "hw/dma/rc4030.h"
 #include "hw/char/serial.h"
 #include "hw/char/parallel.h"
 #include "hw/isa/isa.h"
diff --git a/include/hw/dma/rc4030.h b/include/hw/dma/rc4030.h
new file mode 100644
index 0000000000..e58f94576e
--- /dev/null
+++ b/include/hw/dma/rc4030.h
@@ -0,0 +1,21 @@
+/*
+ * QEMU JAZZ RC4030 chipset
+ *
+ * Copyright (c) 2007-2013 Hervé Poussineau
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#ifndef HW_DMA_RC4030_H
+#define HW_DMA_RC4030_H
+
+#include "exec/memory.h"
+
+/* rc4030.c */
+typedef struct rc4030DMAState *rc4030_dma;
+void rc4030_dma_read(void *dma, uint8_t *buf, int len);
+void rc4030_dma_write(void *dma, uint8_t *buf, int len);
+
+DeviceState *rc4030_init(rc4030_dma **dmas, IOMMUMemoryRegion **dma_mr);
+
+#endif
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index 4d2db99952..34dd583500 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -7,13 +7,4 @@
 /* Kernels can be configured with 64KB pages */
 #define INITRD_PAGE_SIZE (64 * KiB)
 
-#include "exec/memory.h"
-
-/* rc4030.c */
-typedef struct rc4030DMAState *rc4030_dma;
-void rc4030_dma_read(void *dma, uint8_t *buf, int len);
-void rc4030_dma_write(void *dma, uint8_t *buf, int len);
-
-DeviceState *rc4030_init(rc4030_dma **dmas, IOMMUMemoryRegion **dma_mr);
-
 #endif
-- 
2.38.1


