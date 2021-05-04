Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD693727AC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:58:39 +0200 (CEST)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqt2-0004vi-Ae
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldqoU-0008CP-F7
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldqoQ-0005dG-8w
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620118429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7I6nvE9PgDTqJtNi5ocnpmYow/E+zwmJsA5Y+dscM/s=;
 b=I4w0YI81WK26TVkA7yYtCz9LFDN7oF7omBFCF5oZv3edWRy5rRuANWnlAzwvvnGvtnxu4I
 rCLprMUTMFKKkrd0iGztBdpIuRLMDTwJgqPwtVI9uq9s3h8cofBBXCk2TWetV1+df7LcGr
 YD1Yfi4dpezdFaCjdlvftfc1QxxP3BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-j2t1fLu0MLGELS8UfUYixw-1; Tue, 04 May 2021 04:53:47 -0400
X-MC-Unique: j2t1fLu0MLGELS8UfUYixw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 470F0192377F;
 Tue,  4 May 2021 08:53:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 025CC59446;
 Tue,  4 May 2021 08:53:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A4B311800386; Tue,  4 May 2021 10:53:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] hw/usb: Do not build USB subsystem if not required
Date: Tue,  4 May 2021 10:53:12 +0200
Message-Id: <20210504085317.207369-3-kraxel@redhat.com>
In-Reply-To: <20210504085317.207369-1-kraxel@redhat.com>
References: <20210504085317.207369-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

If the Kconfig 'USB' value is not selected, it is pointless to
build the USB core components. Add a stub for the HMP commands
and usbdevice_create() which is called by usb_device_add in
softmmu/vl.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210424224110.3442424-3-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 stubs/usb-dev-stub.c | 25 +++++++++++++++++++++++++
 MAINTAINERS          |  1 +
 hw/usb/meson.build   |  9 +++------
 stubs/meson.build    |  1 +
 4 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 stubs/usb-dev-stub.c

diff --git a/stubs/usb-dev-stub.c b/stubs/usb-dev-stub.c
new file mode 100644
index 000000000000..b1adeeb4548d
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
index 4c05ff8bbabd..6f7e5db3b102 100644
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
index fb7a74e73ae8..f357270d0b6b 100644
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
index be6f6d609e58..3faef16892be 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -50,6 +50,7 @@ if have_block
 endif
 if have_system
   stub_ss.add(files('semihost.c'))
+  stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
 else
   stub_ss.add(files('qdev.c'))
-- 
2.31.1


