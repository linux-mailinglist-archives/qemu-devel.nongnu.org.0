Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2922E8E5E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:19:54 +0100 (CET)
Received: from localhost ([::1]:34238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAn3-0003aZ-Jq
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMQ-0004M1-T1
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMP-0006GA-9g
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id k10so15971075wmi.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+YR78/DI/zhbyQEiorzjQWihYyclw/vAey+LLLhqz3U=;
 b=QMpHhP1au0ADhTZt4oNXMyqjY6kxlTyVgwlV9PvlS1FbJO5g8UYfehIq5Ts7RJCAu1
 JBqYQY4tT+u1N+NYTtWshb1oJAjypEtkFpYCZWW4sWSwrVZXUWeWY0hYsgE6849hWcJd
 U6c5/11SgEoZ7KPVhOV2sq/ygkVtSDhFHZZQJ5x1+jPKLhr/sY8PY7SR89qrSYPtkUf/
 7Gs5bcGPXnxOLT2Xf01BPxVW/q8g7n1piezf5G5NgufsGxMSwH3gvI06dB8JpXCaUOuT
 83zzUCyLUJLWb1xiC2g4LaXlsL0DdXAtTzwXgNTwfP+/tF6qXHMW/keYaES4rh0Gh1SK
 h1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+YR78/DI/zhbyQEiorzjQWihYyclw/vAey+LLLhqz3U=;
 b=ZelHzrwqVtgBcGSyCAazXhINChNN6RPO30YVNcv9GCRd6NjVKMx641qMamxkam49AN
 n5zbOIUWRVjiUwniXINvuksv782XVTDE4DNvLR52w7yJhA2YgwmxI6tauQJPzZHTejoG
 9QrxtjslgzYUfQzwiwCej9XfXlEYHZeSH90yjUxut83t+Z4vkhs1XgYehfKXx1ziq5FQ
 Q8BiQVdLHAWBBjTkF/nC02GVtbqQVpzGyGdX53mqZZGcTe8O3++kKg8QPJ+R4XwdyTBz
 Reh/sf3gXAu0HpKJwCtnI4FKSZRwX0zXkuQ7J0s9u8NNUSWuHZPplxFMWEkYA8U5lqhq
 W3IA==
X-Gm-Message-State: AOAM530XR6PFG1g9dViNFuiSGtXTF8kbuiDy70CIBBNPBsiOppw21YXP
 XkEWJTx8rNenrshR+sWTeK9LNGOs8dU=
X-Google-Smtp-Source: ABdhPJxCz4p4d74u/c2ZDk8nKSx9qWtWmV58MtnlRI0uNvflJntf8j1LFyjvb65lsSNNeCVO8+zdmQ==
X-Received: by 2002:a1c:356:: with SMTP id 83mr24961640wmd.31.1609707139861;
 Sun, 03 Jan 2021 12:52:19 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id a62sm30534517wmf.7.2021.01.03.12.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/35] hw/mips: Implement fw_cfg_arch_key_name()
Date: Sun,  3 Jan 2021 21:50:10 +0100
Message-Id: <20210103205021.2837760-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Huacai Chen <chenhuacai@kernel.org>

Implement fw_cfg_arch_key_name(), which returns the name of a
mips-specific key.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201221110538.3186646-3-chenhuacai@kernel.org>
[PMD: Add FW_CFG_MIPS Kconfig selector]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fw_cfg.h    | 19 +++++++++++++++++++
 hw/mips/fw_cfg.c    | 35 +++++++++++++++++++++++++++++++++++
 hw/mips/Kconfig     |  3 +++
 hw/mips/meson.build |  1 +
 4 files changed, 58 insertions(+)
 create mode 100644 hw/mips/fw_cfg.h
 create mode 100644 hw/mips/fw_cfg.c

diff --git a/hw/mips/fw_cfg.h b/hw/mips/fw_cfg.h
new file mode 100644
index 00000000000..e317d5b9a3e
--- /dev/null
+++ b/hw/mips/fw_cfg.h
@@ -0,0 +1,19 @@
+/*
+ * QEMU fw_cfg helpers (MIPS specific)
+ *
+ * Copyright (c) 2020 Huacai Chen
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#ifndef HW_MIPS_FW_CFG_H
+#define HW_MIPS_FW_CFG_H
+
+#include "hw/boards.h"
+#include "hw/nvram/fw_cfg.h"
+
+/* Data for BIOS to identify machine */
+#define FW_CFG_MACHINE_VERSION  (FW_CFG_ARCH_LOCAL + 0)
+#define FW_CFG_CPU_FREQ         (FW_CFG_ARCH_LOCAL + 1)
+
+#endif
diff --git a/hw/mips/fw_cfg.c b/hw/mips/fw_cfg.c
new file mode 100644
index 00000000000..67c4a74f4be
--- /dev/null
+++ b/hw/mips/fw_cfg.c
@@ -0,0 +1,35 @@
+/*
+ * QEMU fw_cfg helpers (MIPS specific)
+ *
+ * Copyright (c) 2020 Lemote, Inc.
+ *
+ * Author:
+ *   Huacai Chen (chenhc@lemote.com)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mips/fw_cfg.h"
+#include "hw/nvram/fw_cfg.h"
+
+const char *fw_cfg_arch_key_name(uint16_t key)
+{
+    static const struct {
+        uint16_t key;
+        const char *name;
+    } fw_cfg_arch_wellknown_keys[] = {
+        {FW_CFG_MACHINE_VERSION, "machine_version"},
+        {FW_CFG_CPU_FREQ, "cpu_frequency"},
+    };
+
+    for (size_t i = 0; i < ARRAY_SIZE(fw_cfg_arch_wellknown_keys); i++) {
+        if (fw_cfg_arch_wellknown_keys[i].key == key) {
+            return fw_cfg_arch_wellknown_keys[i].name;
+        }
+    }
+    return NULL;
+}
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 8be70122f4c..64ef42dd3fd 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -38,3 +38,6 @@ config MIPS_CPS
 
 config MIPS_BOSTON
     bool
+
+config FW_CFG_MIPS
+    bool
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 77b4d8f365e..ca5e4d0f943 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,5 +1,6 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('mips_int.c'))
+mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
-- 
2.26.2


