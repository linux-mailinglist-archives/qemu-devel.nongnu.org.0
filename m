Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A069669E60
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:41:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMJ0-0003Ua-VT; Fri, 13 Jan 2023 10:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIk-0003HC-Eo
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:06 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIi-0006US-4Z
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q10so2142478wrs.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4/Z0sYNWQlA4hQRv8qfSQLZc2MSoaNRQN3fLqjXEQM8=;
 b=Miclu+NL3wfxcpiG8jVEou8qFPjS3Vt9SE4o/1zbRppqmlOirFvh8T6ixDQHpyVy9O
 g9xOMHHaTSKupaysk5PZEzbZfU1cWr5I+ikdKzQjpdZqbGtuBwgsfva2rmQizsT3JqZu
 E5EqufKnj7du1BD8wnvtae1t3RWx7vw5JPiJFQNwO2nOjKh7CHZAvEOFqgRK7bsRZYZl
 auYU2KmZlbyKxW0hT6QvaSTCCl1Cqml3Vj3nX2pQtPWmp3pX1xoiBn4hkeK7U4jedXkC
 wecXKYj0rkRzJBeCxXmod/tP2Zv2C26PB5LTIdgyaPjr9QZmqN9jUsz36AuCDxt9qGpj
 nMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4/Z0sYNWQlA4hQRv8qfSQLZc2MSoaNRQN3fLqjXEQM8=;
 b=q1C8tEXCCUr9dEDl/qDeB6Yg5EuxYRrHzeEWXr3hKN4w1VSLEGiCJP6oaDq+dksJO7
 fhzsqsyU6hnHw5hX14706lh+skSOi7nKdHOMDCZbzjkrXkXuK3Itv9vwp4446j0zPCFB
 6S6dTocMdctOY7cvS9SPjTgvHfEV44ImJHIllufMDxfUTFn+cDYVN6FsszJsbhxNjLGG
 CR0HWSnzF6JWXUW+Q5zTqm0Yhc12gWisFDD8PWM5cKSig9FhUhOyElwfMUtXKWlfgFXL
 vt67Idtwe8ZdqXcycR8Zn67tRTa4APjNAuWA+t+oHFIMdGGO5fmhfIZxJd6kWcIEeXyU
 TvEg==
X-Gm-Message-State: AFqh2kpmUpByjU6ptvPxZSqgfqGJ93An0aPR78GbnFuWwoU8nKe6/jNB
 LUeZip8OC1N6qNtsSicwN4RGCd4M4UgU13AB
X-Google-Smtp-Source: AMrXdXsX70uAhgW/tNXlXg+UGi7C/3kDJqfagUmi1GyqlvLbbmrjg9rN0FEuYg8i+zeBxrKDqE336A==
X-Received: by 2002:adf:decc:0:b0:2bd:deaf:6a88 with SMTP id
 i12-20020adfdecc000000b002bddeaf6a88mr2288942wrn.17.1673624942300; 
 Fri, 13 Jan 2023 07:49:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adff50b000000b0027f9f073211sm19488461wro.65.2023.01.13.07.49.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:49:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 43/46] hw/pci-host/bonito: Declare TYPE_BONITO_PCI_HOST_BRIDGE
 in header
Date: Fri, 13 Jan 2023 16:45:29 +0100
Message-Id: <20230113154532.49979-44-philmd@linaro.org>
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

Declare the TYPE_BONITO_PCI_HOST_BRIDGE QOM type in a
header to be able to access it from board code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230105130710.49264-8-philmd@linaro.org>
---
 MAINTAINERS                  |  1 +
 hw/pci-host/bonito.c         |  4 +---
 include/hw/pci-host/bonito.h | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/pci-host/bonito.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a670fbc926..f7f5e9e439 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1262,6 +1262,7 @@ F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
 F: hw/usb/vt82c686-uhci-pci.c
 F: include/hw/isa/vt82c686.h
+F: include/hw/pci-host/bonito.h
 F: tests/avocado/machine_mips_fuloong2e.py
 
 Loongson-3 virtual platforms
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 9c26aa2ad9..ac1eebf9de 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -45,6 +45,7 @@
 #include "hw/pci/pci_device.h"
 #include "hw/irq.h"
 #include "hw/mips/mips.h"
+#include "hw/pci-host/bonito.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
 #include "sysemu/runstate.h"
@@ -238,9 +239,6 @@ struct BonitoState {
     MemoryRegion pci_mem;
 };
 
-#define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
-OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
-
 #define TYPE_PCI_BONITO "Bonito"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIBonitoState, PCI_BONITO)
 
diff --git a/include/hw/pci-host/bonito.h b/include/hw/pci-host/bonito.h
new file mode 100644
index 0000000000..b8ecf7870a
--- /dev/null
+++ b/include/hw/pci-host/bonito.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU Bonito64 north bridge support
+ *
+ * Copyright (c) 2008 yajin (yajin@vm-kernel.org)
+ * Copyright (c) 2010 Huacai Chen (zltjiangshi@gmail.com)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_PCI_HOST_BONITO_H
+#define HW_PCI_HOST_BONITO_H
+
+#include "qom/object.h"
+
+#define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
+OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
+
+#endif
-- 
2.38.1


