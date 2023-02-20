Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7B69C79A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:23:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Fk-0005kr-SL; Mon, 20 Feb 2023 04:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fi-0005jR-3P
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:30 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Ff-0003kI-GP
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:29 -0500
Received: by mail-wr1-x434.google.com with SMTP id c12so335618wrw.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E77XlEnytCyG4QoXBmNn9MQ2dbYmUXZ7dARQ+ik57vE=;
 b=XCDUjcHuEbgCSljkHsgBVm/zGTIHWv+GsfReiRoxG6rvFyhyPO083Lj0aEEvaLeBcA
 Xn9jtHnoqxEaN4H5qsKzqpS+oVWMfuxmL7b+jnhciZn7OQrPCFpQ5u1UfGsG26GGgCKS
 TQo2NrXbnSeS26JG5oTxfury4UNvl7tIU56ulgq3IUJ3uTbmSYOC85htlTYtub8ZdDuN
 2TzVRNyIuyX5NKGILlPxJZoi85Mck7ETDYSIe4+VElDscQxV0G8tt/6nXIKBPiL9S9/x
 svJbnmJDU2CoSOkCwyCnvTNzzA6rW/W4TaGpSw0+i/YNlyppuevuAWMObVk517f1bzxd
 RV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E77XlEnytCyG4QoXBmNn9MQ2dbYmUXZ7dARQ+ik57vE=;
 b=s2sxemjZM4xP/xDQ3/uH0RZYbF5oN1qPX+6UffbyO6rkZrviUIsH9fi541VyHK0eJG
 K+DPqVPCwipDw0lU6LePVUJ+hhbI4el/TD3aWF9e8zyh4qnT340lFo/kgalOYSOqa4ey
 A1GV1aqOLYRtbQFfOsXkWtMqmd36iuxxq1jmdX7joqP47nAyiBL9kyrIYlhGM+uQhfnj
 mTbOA3GqMwBuSTAQ75d+f9nwhi697fvX6DH29RSAgXvXiHHEqV3dTNPlC3bkEdjSTcUz
 WTKlXu19q18JxyIjuSBObBUwW6HpVQOx6RbVnO1bcsiwISQD7hBtWsMm2m7LVd6zSeav
 McDg==
X-Gm-Message-State: AO0yUKWveSY2HzfhJXBRYczR3vmLSa98YfyyNbmMRjsgYfJPDXqRy9HO
 ae22QkJkVphriN5t1TNDlm12iJKe9fvCzOVa
X-Google-Smtp-Source: AK7set+Rr191RGPP8LzegFiawE0/F6gJSgqZ+k1S5eBA/dddEZL/wVFA7wjJ96v26OJ2HQUMnZhzHw==
X-Received: by 2002:a5d:66cf:0:b0:2c6:e824:7a5e with SMTP id
 k15-20020a5d66cf000000b002c6e8247a5emr2183303wrw.34.1676884466560; 
 Mon, 20 Feb 2023 01:14:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a5d42d2000000b002c6e84cadcbsm3269545wrr.72.2023.02.20.01.14.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 05/24] hw/ide/isa: Extract TYPE_ISA_IDE declarations to
 'hw/ide/isa.h'
Date: Mon, 20 Feb 2023 10:13:39 +0100
Message-Id: <20230220091358.17038-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"hw/ide.h" is a mixed bag of lost IDE declarations.

Extract isa_ide_init() and the TYPE_ISA_IDE QOM declarations
to a new "hw/ide/isa.h" header.

Message-Id: <20230215112712.23110-5-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c    |  1 +
 hw/ide/isa.c         |  4 +---
 include/hw/ide.h     |  5 -----
 include/hw/ide/isa.h | 20 ++++++++++++++++++++
 4 files changed, 22 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/ide/isa.h

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..7085b4bc58 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -39,6 +39,7 @@
 #include "hw/pci/pci_ids.h"
 #include "hw/usb.h"
 #include "net/net.h"
+#include "hw/ide/isa.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/irq.h"
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index b434cbd0e9..5c3e83a0fc 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -31,15 +31,13 @@
 #include "qemu/module.h"
 #include "sysemu/dma.h"
 
+#include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "qom/object.h"
 
 /***********************************************************/
 /* ISA IDE definitions */
 
-#define TYPE_ISA_IDE "isa-ide"
-OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
-
 struct ISAIDEState {
     ISADevice parent_obj;
 
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 09fe169ebb..24a7aa2925 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -1,13 +1,8 @@
 #ifndef HW_IDE_H
 #define HW_IDE_H
 
-#include "hw/isa/isa.h"
 #include "exec/memory.h"
 
-/* ide-isa.c */
-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
-                        DriveInfo *hd0, DriveInfo *hd1);
-
 int ide_get_geometry(BusState *bus, int unit,
                      int16_t *cyls, int8_t *heads, int8_t *secs);
 int ide_get_bios_chs_trans(BusState *bus, int unit);
diff --git a/include/hw/ide/isa.h b/include/hw/ide/isa.h
new file mode 100644
index 0000000000..1cd0ff1fa6
--- /dev/null
+++ b/include/hw/ide/isa.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU IDE Emulation: ISA Bus support.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+#ifndef HW_IDE_ISA_H
+#define HW_IDE_ISA_H
+
+#include "qom/object.h"
+
+#define TYPE_ISA_IDE "isa-ide"
+OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
+
+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
+                        DriveInfo *hd0, DriveInfo *hd1);
+
+#endif
-- 
2.38.1


