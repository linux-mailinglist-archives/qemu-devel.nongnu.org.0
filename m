Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E579B623678
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 23:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ostTh-0006QC-Dq; Wed, 09 Nov 2022 17:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostTb-0006Pr-L5
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:23:19 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostTY-0004uq-VF
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:23:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id w14so27950241wru.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 14:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O5/EeccTGb9Ao5sanch1DCl1dTWdJ5ytqRpj7gA7qhk=;
 b=cG1/SdH7AlDDwBjzYDlt8SN/zPCcKddzsg0VrPip//8KOrCJDWyKjVUX2yk4kme+RC
 pixdb9zTDZa70m15Uz7+u1xSU2yFjX9+YOHUHfd7R2K9SxTnNWrfQLTEg5maflNadQbH
 gnwAuaBse5C6U6W4mQagSdGzJ6GfwLwTuUX/tao6qyvez1IUmkEgHb/CUUc4RwF1b8xX
 b1KIBoGhpdOSx2JRVY+O1PBSvl7fxUqMYanopkp+Pp9lm/eNlxe1CyqRjdfAGlsMkEC6
 C5sxqwo7g9T8te7kGFEOGqsZM0qu64yTvtMke3u8Km6nhtVp9ClgboNEzuD5QFlK8hB/
 LvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O5/EeccTGb9Ao5sanch1DCl1dTWdJ5ytqRpj7gA7qhk=;
 b=icvFjkQB3Et7eYNkSwXgOozfrRmgkg8KnKJKP22Y21D4Fn78ItuQJCf1jsOIFeHFls
 CR+1I39jVq3XuCXN2/hmKo3onG7GZ91Hi98qGToCkQlTrWa6sFE9jny8cc5jdIDBfVgc
 zZSi1fMsPp++vfA10QJOI9t9AC91XIIDBK+8dlYkysYfX6C9PL2EwgKXr++WYsUCyuUu
 ybceoFFykSvwfUyG3rWClx3Qs4TeWen0uo6e2M5o5tcvzKrYu2MPlFSLXZ38I0ZIYPL2
 1u5Vb6MSjfHCYOhOQzQhQc0cNXJ5rsQwK2GS4V30+WAINYN1bYSThC5XS7sJemFWGqKp
 hDWg==
X-Gm-Message-State: ACrzQf3p4b7scqCF8tXhv3027LOLTEKlIdxjRmY6Pam/93PWoTHpM/P9
 BZULbhNaKJYt5D9TCVa4t6NTfpya5Uj2hg==
X-Google-Smtp-Source: AMsMyM5cPNj157jZ7qUA2XxtLJKwy1CtzjsTVS8uYxlwDmaPzHEQaTjEQgjECBUP7RD7ev9pLYVkpg==
X-Received: by 2002:a05:6000:1c1a:b0:236:8321:d875 with SMTP id
 ba26-20020a0560001c1a00b002368321d875mr39886824wrb.45.1668032594690; 
 Wed, 09 Nov 2022 14:23:14 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o13-20020adfeacd000000b002366a624bd4sm14119271wrn.28.2022.11.09.14.23.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Nov 2022 14:23:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Frederic Bezies <fredbezies@gmail.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH-for-7.2] hw/display: Declare build_vga_aml() out of "vga_int.h"
Date: Wed,  9 Nov 2022 23:23:12 +0100
Message-Id: <20221109222312.29347-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Commit cfead31326 declared build_vga_aml() in "vga_int.h".
This header happens to include various other things, such
(indirectly) pixman headers.

The freshly introduced acpi-vga.c includes "vga_int.h" to
get build_vga_aml() declaration, but ends including the
'various other things' triggering this build failure (QEMU
configured as '--enable-modules --disable-spice'):

  In file included from /home/fred/qemu-git/src/qemu/include/ui/console.h:4,
                 from ../hw/display/vga_int.h:30,
                 from ../hw/display/acpi-vga.c:4:
  include/ui/qemu-pixman.h:12:10: fatal error: pixman.h: No such file or directory
     12 | #include <pixman.h>
        |          ^~~~~~~~~~

Resolve by declaring build_vga_aml() in a ACPI/VGA specific
header named "acpi-vga.h". Adjust MAINTAINERS to avoid
checkpatch warnings.

Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Reported-by: Frederic Bezies <fredbezies@gmail.com>
Reported-by: Laurent Vivier <lvivier@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1308
Fixes: cfead31326 ("AcpiDevAmlIf interface to build VGA device descs")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                |  1 +
 hw/display/acpi-vga-stub.c |  2 +-
 hw/display/acpi-vga.c      |  2 +-
 hw/display/acpi-vga.h      | 10 ++++++++++
 hw/display/vga-pci.c       |  1 +
 hw/display/vga_int.h       |  2 --
 6 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 hw/display/acpi-vga.h

diff --git a/MAINTAINERS b/MAINTAINERS
index caba73ec41..af4d3bd8fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1844,6 +1844,7 @@ S: Supported
 F: include/hw/acpi/*
 F: include/hw/firmware/smbios.h
 F: hw/acpi/*
+F: hw/display/acpi*
 F: hw/smbios/*
 F: hw/i386/acpi-build.[hc]
 F: hw/arm/virt-acpi-build.c
diff --git a/hw/display/acpi-vga-stub.c b/hw/display/acpi-vga-stub.c
index a9b0ecf76d..b0f8df0710 100644
--- a/hw/display/acpi-vga-stub.c
+++ b/hw/display/acpi-vga-stub.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/acpi_aml_interface.h"
-#include "vga_int.h"
+#include "acpi-vga.h"
 
 void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
diff --git a/hw/display/acpi-vga.c b/hw/display/acpi-vga.c
index f0e9ef1fcf..19372c6e1c 100644
--- a/hw/display/acpi-vga.c
+++ b/hw/display/acpi-vga.c
@@ -1,7 +1,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/acpi_aml_interface.h"
 #include "hw/pci/pci.h"
-#include "vga_int.h"
+#include "acpi-vga.h"
 
 void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
diff --git a/hw/display/acpi-vga.h b/hw/display/acpi-vga.h
new file mode 100644
index 0000000000..966d0c49d5
--- /dev/null
+++ b/hw/display/acpi-vga.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef HW_DISPLAY_VGA_ACPI
+#define HW_DISPLAY_VGA_ACPI
+
+#include "hw/acpi/acpi_aml_interface.h"
+
+void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope);
+
+#endif
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 9a91de7ed1..d6f52d2e67 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -36,6 +36,7 @@
 #include "hw/display/edid.h"
 #include "qom/object.h"
 #include "hw/acpi/acpi_aml_interface.h"
+#include "acpi-vga.h"
 
 enum vga_pci_flags {
     PCI_VGA_FLAG_ENABLE_MMIO = 1,
diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 330406ad9c..305e700014 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -30,7 +30,6 @@
 #include "ui/console.h"
 
 #include "hw/display/bochs-vbe.h"
-#include "hw/acpi/acpi_aml_interface.h"
 
 #define ST01_V_RETRACE      0x08
 #define ST01_DISP_ENABLE    0x01
@@ -196,5 +195,4 @@ void pci_std_vga_mmio_region_init(VGACommonState *s,
                                   MemoryRegion *subs,
                                   bool qext, bool edid);
 
-void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope);
 #endif
-- 
2.38.1


