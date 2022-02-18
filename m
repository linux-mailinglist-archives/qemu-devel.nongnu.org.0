Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C7A4BC158
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 21:46:08 +0100 (CET)
Received: from localhost ([::1]:44188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLA8k-00074z-JK
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 15:46:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLA5q-00058t-Iw; Fri, 18 Feb 2022 15:43:06 -0500
Received: from [2a00:1450:4864:20::434] (port=41772
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLA5o-000063-Qi; Fri, 18 Feb 2022 15:43:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id k1so16438484wrd.8;
 Fri, 18 Feb 2022 12:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDIlYI/W0faEv1G28vO/TmPpURrrx1fyNxxtqZhHZ0s=;
 b=YcDWoavDqqpw4MrvzMj8shl/nCPDeSglPmbeW9IcLmEpqUNKSfK0qnuHgxmFi9jkWW
 nFNfl45yqo0qUiMVZRI9/ajM/DN+d8fZWnsPrXHyrZUiNjZtiJ+M96TwG24Ha2NPOesR
 Xx3i8wuwrLeab1MxeMz9qkXcP5WCS1YhRuXf2mxUEfkxxqkoLVpkvOxz7pCshEd8CtSa
 7mAipYmbJndIhxnJMfWd8nsoJIs9m9U5oDSfppBdwHSKEwUnEKueCdYtIBJS5jHvFJU7
 u0AptFGBXRmAsSv7piNBK/2VKn0oWn1nneN+pgUuUiRJ/i1ro+Gi40VwrjTnNt7s08q6
 dcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDIlYI/W0faEv1G28vO/TmPpURrrx1fyNxxtqZhHZ0s=;
 b=s6h9PS4YU2TtjvOtIVapXgmcnKCw5F/GnIpoxTzTX5ekumoAEzsDXQb7svKjcm9TDb
 yCilAR2dZEhCMjmMRe/uV2goTbH7lEChBYrxbb2UVDGGSln15dNHWo8ZJKN4COrbCI6K
 PvYdvNP5ajB9F3hkvvE5UlIUBPvQaX0x3jg/XoA+dkeyuAcGrJsQGtxTq5S5hz8t5UIv
 4qYwOEAxRCKWX06MCGq6fhLzFqRcgKKElyAmgDVA+l+7O4AE3ZlBnB6V4lH11RUCFsCA
 WkkuSRrctsogboGhwvUV9EHyeQNI2iPKXgTGDFwTy6Uw6HM5UpIDvV6uOq/HIFsoTfvf
 NZcA==
X-Gm-Message-State: AOAM530tbJ28TDZ3Z+/im8FPzsi0zEpGybs5YL4O4zAyhmyHU8GB6sOl
 88RffM2w+PrIua3SxSt5z2Lu6NlTcKw=
X-Google-Smtp-Source: ABdhPJxAV6cnIPJT/KDg3MZKT8/ZzcI+ZgN/1mdWoj7POwngrz4MwHxJyMw3CKqBaoH9ta2rJQu5xA==
X-Received: by 2002:a05:6000:1081:b0:1e3:16d0:1c47 with SMTP id
 y1-20020a056000108100b001e316d01c47mr7408654wrw.19.1645216982679; 
 Fri, 18 Feb 2022 12:43:02 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm377432wmq.44.2022.02.18.12.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 12:43:02 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/ide: split bmdma read and write functions from
 piix.c
Date: Fri, 18 Feb 2022 22:41:54 +0200
Message-Id: <20220218204155.236611-2-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218204155.236611-1-liavalb@gmail.com>
References: <20220218204155.236611-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com, Liav Albani <liavalb@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a preparation before implementing another PCI IDE controller
that relies on these functions, so these can be shared between both
implementations.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/ide/bmdma.c         | 84 ++++++++++++++++++++++++++++++++++++++++++
 hw/ide/meson.build     |  2 +-
 hw/ide/piix.c          | 51 ++-----------------------
 include/hw/ide/bmdma.h | 34 +++++++++++++++++
 4 files changed, 122 insertions(+), 49 deletions(-)
 create mode 100644 hw/ide/bmdma.c
 create mode 100644 include/hw/ide/bmdma.h

diff --git a/hw/ide/bmdma.c b/hw/ide/bmdma.c
new file mode 100644
index 0000000000..d12ed730dd
--- /dev/null
+++ b/hw/ide/bmdma.c
@@ -0,0 +1,84 @@
+/*
+ * QEMU IDE Emulation: Intel PCI Bus master IDE support for PIIX3/4 and ICH6/7.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/dma.h"
+
+#include "hw/ide/bmdma.h"
+#include "hw/ide/pci.h"
+#include "trace.h"
+
+uint64_t intel_ide_bmdma_read(void *opaque, hwaddr addr, unsigned size)
+{
+    BMDMAState *bm = opaque;
+    uint32_t val;
+
+    if (size != 1) {
+        return ((uint64_t)1 << (size * 8)) - 1;
+    }
+
+    switch (addr & 3) {
+    case 0:
+        val = bm->cmd;
+        break;
+    case 2:
+        val = bm->status;
+        break;
+    default:
+        val = 0xff;
+        break;
+    }
+
+    trace_bmdma_read(addr, val);
+    return val;
+}
+
+void intel_ide_bmdma_write(void *opaque, hwaddr addr,
+                        uint64_t val, unsigned size)
+{
+    BMDMAState *bm = opaque;
+
+    if (size != 1) {
+        return;
+    }
+
+    trace_bmdma_write(addr, val);
+
+    switch (addr & 3) {
+    case 0:
+        bmdma_cmd_writeb(bm, val);
+        break;
+    case 2:
+        uint8_t cur_val = bm->status;
+        bm->status = (val & 0x60) | (cur_val & 1) | (cur_val & ~val & 0x06);
+        break;
+    }
+}
diff --git a/hw/ide/meson.build b/hw/ide/meson.build
index ddcb3b28d2..38f9ae7178 100644
--- a/hw/ide/meson.build
+++ b/hw/ide/meson.build
@@ -7,7 +7,7 @@ softmmu_ss.add(when: 'CONFIG_IDE_ISA', if_true: files('isa.c', 'ioport.c'))
 softmmu_ss.add(when: 'CONFIG_IDE_MACIO', if_true: files('macio.c'))
 softmmu_ss.add(when: 'CONFIG_IDE_MMIO', if_true: files('mmio.c'))
 softmmu_ss.add(when: 'CONFIG_IDE_PCI', if_true: files('pci.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c', 'bmdma.c'))
 softmmu_ss.add(when: 'CONFIG_IDE_QDEV', if_true: files('qdev.c'))
 softmmu_ss.add(when: 'CONFIG_IDE_SII3112', if_true: files('sii3112.c'))
 softmmu_ss.add(when: 'CONFIG_IDE_VIA', if_true: files('via.c'))
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index ce89fd0aa3..8f94809eee 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -33,57 +33,12 @@
 #include "sysemu/dma.h"
 
 #include "hw/ide/pci.h"
+#include "hw/ide/bmdma.h"
 #include "trace.h"
 
-static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
-{
-    BMDMAState *bm = opaque;
-    uint32_t val;
-
-    if (size != 1) {
-        return ((uint64_t)1 << (size * 8)) - 1;
-    }
-
-    switch(addr & 3) {
-    case 0:
-        val = bm->cmd;
-        break;
-    case 2:
-        val = bm->status;
-        break;
-    default:
-        val = 0xff;
-        break;
-    }
-
-    trace_bmdma_read(addr, val);
-    return val;
-}
-
-static void bmdma_write(void *opaque, hwaddr addr,
-                        uint64_t val, unsigned size)
-{
-    BMDMAState *bm = opaque;
-
-    if (size != 1) {
-        return;
-    }
-
-    trace_bmdma_write(addr, val);
-
-    switch(addr & 3) {
-    case 0:
-        bmdma_cmd_writeb(bm, val);
-        break;
-    case 2:
-        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
-        break;
-    }
-}
-
 static const MemoryRegionOps piix_bmdma_ops = {
-    .read = bmdma_read,
-    .write = bmdma_write,
+    .read = intel_ide_bmdma_read,
+    .write = intel_ide_bmdma_write,
 };
 
 static void bmdma_setup_bar(PCIIDEState *d)
diff --git a/include/hw/ide/bmdma.h b/include/hw/ide/bmdma.h
new file mode 100644
index 0000000000..ce76d395f5
--- /dev/null
+++ b/include/hw/ide/bmdma.h
@@ -0,0 +1,34 @@
+/*
+ * QEMU IDE Emulation: Intel PCI Bus master IDE support for PIIX3/4 and ICH6/7.
+ *
+ * Copyright (c) 2022 Liav Albani
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_IDE_BMDMA_H
+#define HW_IDE_BMDMA_H
+
+#include "hw/ide/internal.h"
+
+uint64_t intel_ide_bmdma_read(void *opaque, hwaddr addr, unsigned size);
+void intel_ide_bmdma_write(void *opaque, hwaddr addr, uint64_t val,
+                           unsigned size);
+
+#endif
-- 
2.35.1


