Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2B265EC8B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPyN-0004al-5X; Thu, 05 Jan 2023 08:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPyH-0004W6-9g
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:52 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPyF-0004Iz-Kz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso1247761wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0ga69QuYArs9KgZhS/Kjl26kT//Gcu0nAdvUqhVhmk=;
 b=pWUB9w4TEh75/5lUOi1oX2RKZjwQytJ9dWVGmPkWQkZBC186jVuY0mwAF2AHJIyNZ6
 bbXZj04rdj7ImuRt0eZPDjF4WVtySz+SCkN7Ht9uK+IF075cWnZ6+aflQv9gSYnRqJ+z
 UIAw6TeQWTtwjQO8Z3mWqU6t8Cbryg3Dg94TU7XFoch0JN66nrTFV841iEnckmv6W5kT
 TwXgHEt/0YYoH1zldj/cW8Wd33BYDxt8Au76kmO3b2ypoS9eVBUTbo23SQH8eq/zFqp2
 BwImrl8GN1obETsZhSCDyawtu1oE+VIKST8hxUY7iUzT9a9xa5NrE7KRyzyuPAFYjY2q
 jsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0ga69QuYArs9KgZhS/Kjl26kT//Gcu0nAdvUqhVhmk=;
 b=hRFtXzfQv3fWFqfW6Gbc+B/zQL/DhnLZ25++HgIx6YWcN6yWmibpB00eeAjdBTNp3T
 B8yULC+8SE28UW/RYh8CBsVUaVmPGyHDpyxfzczfBa5WuwGaTbBO/6/jFTtjABvuSddr
 oqGLrIayGGJgnvPZ/KHQKxphBOyqaM+DpRt+aT0d0hDgWsqD9rSfDiIdsVMhSPDVRCCS
 EzkpPPdPGKcT+HS8PRZ757CySqRAu99bdrsSETjnn3VV3l/uzKfMh31YM2ICjAAHIG6Z
 hZ5V4FCVDAqJ1dApUeemL6yC8aP1g4AoYyyKkwCuseNYGC7RMedG0kNXmS5sg3QtkEgy
 CjyQ==
X-Gm-Message-State: AFqh2kp2eITtMc9nh2goFsII2JMY005wb8iSlpm89ppUpeNL6HmokEHt
 RBcXQAluqKQUxEVZZVOGJy53387BRURz24A0
X-Google-Smtp-Source: AMrXdXu0kPO8AkVnCy5HxCaLcxBgkO9we8KgXjAS+wUvmBG7SX1JPwRVWRVhiq1lX7RdyDtMgsDlUg==
X-Received: by 2002:a7b:cb50:0:b0:3d1:f882:43eb with SMTP id
 v16-20020a7bcb50000000b003d1f88243ebmr35889014wmj.10.1672924065942; 
 Thu, 05 Jan 2023 05:07:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm2622654wmq.33.2023.01.05.05.07.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 7/8] hw/pci-host/bonito: Declare TYPE_BONITO_PCI_HOST_BRIDGE
 in header
Date: Thu,  5 Jan 2023 14:07:09 +0100
Message-Id: <20230105130710.49264-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230105130710.49264-1-philmd@linaro.org>
References: <20230105130710.49264-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
---
 MAINTAINERS                  |  1 +
 hw/pci-host/bonito.c         |  4 +---
 include/hw/pci-host/bonito.h | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/pci-host/bonito.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a40d4d865..8274c45f43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1260,6 +1260,7 @@ F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
 F: hw/usb/vt82c686-uhci-pci.c
 F: include/hw/isa/vt82c686.h
+F: include/hw/pci-host/bonito.h
 F: tests/avocado/machine_mips_fuloong2e.py
 
 Loongson-3 virtual platforms
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 5f777f95bd..df61b051b0 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -45,6 +45,7 @@
 #include "hw/pci/pci.h"
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


