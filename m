Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F5636A383
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 00:44:30 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laR0n-00052k-VH
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 18:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQxr-0002Ji-69
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 18:41:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQxo-0001MY-Re
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 18:41:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e7so43015629wrs.11
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 15:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dD10fcyTHziloH/OmXJ89/8ajkLj2G0VreI42lYIf04=;
 b=Wad4lCJdqrCBc30MXtgaZMkAth8XLvSvgkBbZi3FAkfhwpKegOMu7P6L7q9OaIlNkw
 ekRUtXDZ7Y9cg3wRiGMfbO2iSRGow7PgyI+zQK+wnmRFspvETXOhWdM0Or1x2p/pRNLx
 PochWcwu9HapYubPmbkTNJf5tWxnItSTNG25I3/eRvQ/TC8MF1aQjiEevmsn4yabsMPH
 M7qtRfFJOxkVbu+O8QtDDNXF5tHJY7CnVs14+2sPJ+SVkvAZLaJ3kQShcLSfrfl2J9dq
 wQckPGAYOQg8kxaoq2kBYfNXac19USHQvdCu0xFbdsFDvessU6B9pnMK7H9BWyD/rSTM
 V4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dD10fcyTHziloH/OmXJ89/8ajkLj2G0VreI42lYIf04=;
 b=oXcdc0s3nvI00uOmY8XNuOVUyD7nkS0BF/ElWt68mjtos/KbiZqQbWgrWy7vbwJS7q
 fR8c8znBSihQMQKGoyRXeg2KDcVHRCe15Ja63IuRtrXZtKQrr9HDzbT5lUC5cuccSUZJ
 4mfYQonHU3TkReSlDaKF5oYcU6j1k8KkfUbI8adzygDeCJUSYSPAICI+lnlK3B8cWUtS
 ueHA4g6G/BYksX9/OmnVz1cFJm/dYpgSvBbZEkK+FalgzODwABzPsHFhHSp5A2AUvezn
 6CG3mtsvGnmrxouGac7xdnWUy/hUbiQ8vX9iOCQlo31jCR1dSWtqlaDynqCL+kVXCbDC
 CW8Q==
X-Gm-Message-State: AOAM530T2pWXRokMAokgVOe5iaNjFjSSxv+hmDQ2QMxFZhFXBA/7T0qd
 B1J7iJUv6sq/MzhhBoxuc/hbUiYRfqQ2BA==
X-Google-Smtp-Source: ABdhPJz4CtonYKY4Nbg37JLfZxtHkTueSex7W2i5U4UAzJrL0B7YLpPYOok2RmjbGSMUYdRgWNsgeg==
X-Received: by 2002:a5d:424a:: with SMTP id s10mr13735820wrr.70.1619304083293; 
 Sat, 24 Apr 2021 15:41:23 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o17sm14901274wrg.80.2021.04.24.15.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:41:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/usb: Do not build USB subsystem if not required
Date: Sun, 25 Apr 2021 00:41:10 +0200
Message-Id: <20210424224110.3442424-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424224110.3442424-1-f4bug@amsat.org>
References: <20210424224110.3442424-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the Kconfig 'USB' value is not selected, it is pointless to
build the USB core components. Add a stub for the HMP commands
and usbdevice_create() which is called by usb_device_add in
softmmu/vl.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 stubs/usb-dev-stub.c | 25 +++++++++++++++++++++++++
 MAINTAINERS          |  1 +
 hw/usb/meson.build   |  9 +++------
 stubs/meson.build    |  1 +
 4 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 stubs/usb-dev-stub.c

diff --git a/stubs/usb-dev-stub.c b/stubs/usb-dev-stub.c
new file mode 100644
index 00000000000..b1adeeb4548
--- /dev/null
+++ b/stubs/usb-dev-stub.c
@@ -0,0 +1,25 @@
+/*
+ * QEMU USB device emulation stubs
+ *
+ * Copyright (C) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "sysemu/sysemu.h"
+#include "monitor/monitor.h"
+#include "hw/usb.h"
+
+USBDevice *usbdevice_create(const char *driver)
+{
+    error_report("Support for USB devices not built-in");
+
+    return NULL;
+}
+
+void hmp_info_usb(Monitor *mon, const QDict *qdict)
+{
+    monitor_printf(mon, "Support for USB devices not built-in\n");
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c59..cd63d3efd8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1804,6 +1804,7 @@ USB
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
 F: hw/usb/*
+F: stubs/usb-dev-stub.c
 F: tests/qtest/usb-*-test.c
 F: docs/usb2.txt
 F: docs/usb-storage.txt
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index fb7a74e73ae..f357270d0b6 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -1,17 +1,14 @@
 hw_usb_modules = {}
 
 # usb subsystem core
-softmmu_ss.add(files(
+softmmu_ss.add(when: 'CONFIG_USB', if_true: files(
   'bus.c',
   'combined-packet.c',
   'core.c',
-  'pcap.c',
-  'libhw.c'
-))
-
-softmmu_ss.add(when: 'CONFIG_USB', if_true: files(
   'desc.c',
   'desc-msos.c',
+  'libhw.c',
+  'pcap.c',
 ))
 
 # usb host adapters
diff --git a/stubs/meson.build b/stubs/meson.build
index be6f6d609e5..3faef16892b 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -50,6 +50,7 @@
 endif
 if have_system
   stub_ss.add(files('semihost.c'))
+  stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
 else
   stub_ss.add(files('qdev.c'))
-- 
2.26.3


