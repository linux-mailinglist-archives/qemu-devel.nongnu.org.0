Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE012472B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:46:02 +0100 (CET)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYiG-0005ut-V6
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3b-0006wf-DB
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3Z-0002Gv-TW
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:59 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40713)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3Z-0002Ch-IE
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:57 -0500
Received: by mail-wm1-x341.google.com with SMTP id t14so1601790wmi.5
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=9NSUuNQ9Jf+FzPsRmj7s9FDau0CX5jauhzpAS1A8igc=;
 b=Lltcuq+0ldRHjf0er3qRVaIC81aT3bi5KEE3iNcfJosmGuQK0YNnp/Sw4nfP/rb/Ia
 aBQ3Aio6wEF873h0T74Qe1iUVoPDrPIYO+z7tstBBL1SRWnQjYLD24bUVVKU4+Yw3LXt
 5ex6M2OjOTEq7BacruMTg2l4BhOmP6UePS2AgKKhad4CGpyg7SqmpojdE0oXHtU+5xA9
 I2UdwQSDNwL5dxMu0Lb1/GjiCv35ZfX2wqxqjU6AIJvgk7WDNIPgbu1fk+t+SC6r+KWZ
 7Fs/Dvi9bAmEPv6/MRTmg4gbileFUa07ow7emxftjURhvCzBATPejoYe8nbqJYEIB4+9
 V9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=9NSUuNQ9Jf+FzPsRmj7s9FDau0CX5jauhzpAS1A8igc=;
 b=iN3kGX0I/r5n2hF/rUa0PhKKLY8kjCyRCG0wxlORNFXmIRosv1dAT79Nrd0ZS03dlU
 ExjVlvC8vMWPCoKotc8eDe2/wifNK0ZJfNKI13TaPCXoKMu/SdfJxJD0eVFAU69yF5fi
 Mg4WreAfnGKZNhDKrgggItxklyx1/InNZNbbdxM1pvZvJfc5Jd4NHFW9vbx5i0noFfcP
 1/usB5WDB7SXCri1uWuaEW1dBGd/Laslhh3o9BWlP2SrN/wlwMGEFIYmBjm6UVPTv8Fr
 l0qSVUPeFqPO38tGGPj/+xuRYC9CDmFWU9JcArSnVH9AtlCQbsX0oooJXN4u9U2Lypj2
 +nQg==
X-Gm-Message-State: APjAAAXEZHrWBbxEcE3MyqEfO+6cH28znCYLPDlAaVZAGQ1B3BrM0b1h
 YRJSxsiAvGfXtnMYXs1GnyYTZUK/
X-Google-Smtp-Source: APXvYqybIevhvTsxNbcpHBy1vU1D6eLHZhSvbguAZPjCAxgB1qrCxISjQ6694Ysze0BnOgaRj16u0g==
X-Received: by 2002:a05:600c:246:: with SMTP id
 6mr2645075wmj.122.1576670636351; 
 Wed, 18 Dec 2019 04:03:56 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 52/87] pc: stubify x86 iommu
Date: Wed, 18 Dec 2019 13:02:18 +0100
Message-Id: <1576670573-48048-53-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow building microvm without x86-iommu.c.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/Kconfig          |  6 ++++++
 hw/i386/Makefile.objs    |  3 ++-
 hw/i386/x86-iommu-stub.c | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 hw/i386/x86-iommu-stub.c

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 5a49434..91cf584 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -103,11 +103,17 @@ config MICROVM
     select MC146818RTC
     select VIRTIO_MMIO
 
+config X86_IOMMU
+    bool
+    depends on PC
+
 config VTD
     bool
+    select X86_IOMMU
 
 config AMD_IOMMU
     bool
+    select X86_IOMMU
 
 config VMPORT
     bool
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 01ae202..1236c3b 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -6,7 +6,8 @@ obj-$(CONFIG_I440FX) += pc_piix.o
 obj-$(CONFIG_Q35) += pc_q35.o
 obj-$(CONFIG_MICROVM) += microvm.o
 obj-y += fw_cfg.o
-obj-y += x86-iommu.o
+obj-$(CONFIG_X86_IOMMU) += x86-iommu.o
+obj-$(call lnot,$(CONFIG_X86_IOMMU)) += x86-iommu-stub.o
 obj-$(CONFIG_VTD) += intel_iommu.o
 obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o
 obj-$(CONFIG_XEN) += ../xenpv/ xen/
diff --git a/hw/i386/x86-iommu-stub.c b/hw/i386/x86-iommu-stub.c
new file mode 100644
index 0000000..03576cd
--- /dev/null
+++ b/hw/i386/x86-iommu-stub.c
@@ -0,0 +1,34 @@
+/*
+ * Stubs for X86 IOMMU emulation
+ *
+ * Copyright (C) 2019 Red Hat, Inc.
+ *
+ * Author: Paolo Bonzini <pbonzini@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i386/x86-iommu.h"
+
+void x86_iommu_iec_register_notifier(X86IOMMUState *iommu,
+                                     iec_notify_fn fn, void *data)
+{
+}
+
+X86IOMMUState *x86_iommu_get_default(void)
+{
+    return NULL;
+}
+
-- 
1.8.3.1



