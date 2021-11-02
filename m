Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5685744352E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:12:17 +0100 (CET)
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyGe-00070c-FF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy5x-0006am-1q
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy5n-0007L6-E1
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635876062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vlNbn8NuUe6ICrSzSdqr/KIv7ZRxl4wWvI93qR0m+sQ=;
 b=JBNLgHVaYuCsJfbkXQ1GJmz6o3Ud+k2IHAdzDzq232qEDWZiPqGZ7nJBYjrqX45yqlYcFP
 gcLvp1hUUUw4bq3QtjeXixCIxQE1FFvjDqVajvd4wGTzGHGnY8CwbS7pO4dq/T6QbZsHd1
 vpqa2uEHJHE6MHAOjaUFO9n6DYIzdX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-9PEdIpgmPOe-mp8oxeocKg-1; Tue, 02 Nov 2021 14:00:58 -0400
X-MC-Unique: 9PEdIpgmPOe-mp8oxeocKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F3518414A2;
 Tue,  2 Nov 2021 18:00:57 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75F8619C59;
 Tue,  2 Nov 2021 18:00:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] qapi: introduce x-query-usb QMP command
Date: Tue,  2 Nov 2021 17:56:55 +0000
Message-Id: <20211102175700.1175996-14-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


