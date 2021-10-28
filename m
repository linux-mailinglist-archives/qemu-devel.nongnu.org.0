Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52843E5F1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:18:55 +0200 (CEST)
Received: from localhost ([::1]:47734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg87C-0006KI-AZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7nC-0005Rb-Lf
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7n9-0004bC-F7
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N43BQa5kEusOcZ9HwCJUfIDEUvQTRfgPXUNElXGfWqI=;
 b=SFF2ObxRkdWEpBq+P8kXl4PWKq6e7qfm6wCJfmacJHjdjSanrzYpME1cCfXuyqjs0XgQ6Q
 9DNyio1fuKkMk/fzIyjRF8CjW59GRiV1Bv8WQAET0LUnG3JlleLZZi34X6sxzIXPUBR1Bf
 IM9H2T7p9dQGJd/t+2Rhu/nWpXkuQ4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-OsSbU-QeNVO84hXcZscxxA-1; Thu, 28 Oct 2021 11:58:07 -0400
X-MC-Unique: OsSbU-QeNVO84hXcZscxxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6BE9126F;
 Thu, 28 Oct 2021 15:58:05 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4524F6C8F7;
 Thu, 28 Oct 2021 15:57:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/22] qapi: introduce x-query-usb QMP command
Date: Thu, 28 Oct 2021 16:54:48 +0100
Message-Id: <20211028155457.967291-14-berrange@redhat.com>
In-Reply-To: <20211028155457.967291-1-berrange@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info usb" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx       |  2 +-
 hw/usb/bus.c               | 24 +++++++++++++++---------
 qapi/machine.json          | 12 ++++++++++++
 stubs/usb-dev-stub.c       |  8 ++++++++
 tests/qtest/qmp-cmd-test.c |  2 ++
 5 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index f66b1ca986..ef1bfe4f5a 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -338,7 +338,7 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show guest USB devices",
-        .cmd        = hmp_info_usb,
+        .cmd_info_hrt = qmp_x_query_usb,
     },
 
 SRST
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 5d441a7065..92d6ed5626 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -2,6 +2,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
+#include "qapi/type-helpers.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/sysemu.h"
@@ -631,15 +633,16 @@ static char *usb_get_fw_dev_path(DeviceState *qdev)
     return fw_path;
 }
 
-void hmp_info_usb(Monitor *mon, const QDict *qdict)
+HumanReadableText *qmp_x_query_usb(Error **errp)
 {
+    g_autoptr(GString) buf = g_string_new("");
     USBBus *bus;
     USBDevice *dev;
     USBPort *port;
 
     if (QTAILQ_EMPTY(&busses)) {
-        monitor_printf(mon, "USB support not enabled\n");
-        return;
+        error_setg(errp, "USB support not enabled");
+        return NULL;
     }
 
     QTAILQ_FOREACH(bus, &busses, next) {
@@ -647,14 +650,17 @@ void hmp_info_usb(Monitor *mon, const QDict *qdict)
             dev = port->dev;
             if (!dev)
                 continue;
-            monitor_printf(mon, "  Device %d.%d, Port %s, Speed %s Mb/s, "
-                           "Product %s%s%s\n",
-                           bus->busnr, dev->addr, port->path,
-                           usb_speed(dev->speed), dev->product_desc,
-                           dev->qdev.id ? ", ID: " : "",
-                           dev->qdev.id ?: "");
+            g_string_append_printf(buf,
+                                   "  Device %d.%d, Port %s, Speed %s Mb/s, "
+                                   "Product %s%s%s\n",
+                                   bus->busnr, dev->addr, port->path,
+                                   usb_speed(dev->speed), dev->product_desc,
+                                   dev->qdev.id ? ", ID: " : "",
+                                   dev->qdev.id ?: "");
         }
     }
+
+    return human_readable_text_from_str(buf);
 }
 
 /* handle legacy -usbdevice cmd line option */
diff --git a/qapi/machine.json b/qapi/machine.json
index 3732f80a82..15b6c98597 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1447,3 +1447,15 @@
 ##
 { 'command': 'x-query-roms',
   'returns': 'HumanReadableText' }
+
+##
+# @x-query-usb:
+#
+# Query information on the USB devices
+#
+# Returns: USB device information
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-usb',
+  'returns': 'HumanReadableText' }
diff --git a/stubs/usb-dev-stub.c b/stubs/usb-dev-stub.c
index b1adeeb454..aa557692b7 100644
--- a/stubs/usb-dev-stub.c
+++ b/stubs/usb-dev-stub.c
@@ -8,6 +8,8 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "sysemu/sysemu.h"
 #include "monitor/monitor.h"
 #include "hw/usb.h"
@@ -19,6 +21,12 @@ USBDevice *usbdevice_create(const char *driver)
     return NULL;
 }
 
+HumanReadableText *qmp_x_query_usb(Error **errp)
+{
+    error_setg(errp, "Support for USB devices not built-in");
+    return NULL;
+}
+
 void hmp_info_usb(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "Support for USB devices not built-in\n");
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 372c887eea..0d52ea6c4b 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -49,6 +49,8 @@ static int query_error_class(const char *cmd)
 #ifndef CONFIG_PROFILER
         { "x-query-profile", ERROR_CLASS_GENERIC_ERROR },
 #endif
+        /* Only valid with a USB bus added */
+        { "x-query-usb", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.31.1


