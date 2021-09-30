Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3290941DB44
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:39:17 +0200 (CEST)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwHM-0000bi-6v
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw4g-0000oy-Rh
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw4c-00080W-VA
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUHdZCbuCZPSgsdK8AnXwTq8T2mfI4qcgRA6zpTi2SU=;
 b=cNImkq4PycSpZjKKoIlXCyTReMXRbJZWRCrhTjfCRiOvpOtg3YtM8H757K0zmQCNpnWOy9
 1Ld+qWe027w43JQtL9EyDV5UWbbQmN1nZJoUy6xyLKcUb4g/ik3lE2zfmtFFOf12ELn5L/
 4XoOQiE4MQx0tGELA6SLqDaN5Jjpkc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-pa5miHQKP1KKKG1hvATUWw-1; Thu, 30 Sep 2021 09:26:05 -0400
X-MC-Unique: pa5miHQKP1KKKG1hvATUWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6BEC9F92C;
 Thu, 30 Sep 2021 13:26:03 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C21685D9C6;
 Thu, 30 Sep 2021 13:24:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/19] qapi: introduce x-query-roms QMP command
Date: Thu, 30 Sep 2021 14:23:37 +0100
Message-Id: <20210930132349.3601823-8-berrange@redhat.com>
In-Reply-To: <20210930132349.3601823-1-berrange@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info roms" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/loader.c            | 53 +++++++++++++++++++++++++------------
 hw/core/machine-qmp-cmds.c  |  1 +
 include/qapi/type-helpers.h | 14 ++++++++++
 qapi/common.json            | 11 ++++++++
 qapi/machine.json           | 12 +++++++++
 qapi/meson.build            |  3 +++
 qapi/qapi-type-helpers.c    | 23 ++++++++++++++++
 7 files changed, 100 insertions(+), 17 deletions(-)
 create mode 100644 include/qapi/type-helpers.h
 create mode 100644 qapi/qapi-type-helpers.c

diff --git a/hw/core/loader.c b/hw/core/loader.c
index c623318b73..5ebdca3087 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -46,6 +46,8 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
+#include "qapi/type-helpers.h"
 #include "trace.h"
 #include "hw/hw.h"
 #include "disas/disas.h"
@@ -1472,32 +1474,49 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size)
     return cbdata.rom;
 }
 
-void hmp_info_roms(Monitor *mon, const QDict *qdict)
+HumanReadableText *qmp_x_query_roms(Error **errp)
 {
     Rom *rom;
+    g_autoptr(GString) buf = g_string_new("");
 
     QTAILQ_FOREACH(rom, &roms, next) {
         if (rom->mr) {
-            monitor_printf(mon, "%s"
-                           " size=0x%06zx name=\"%s\"\n",
-                           memory_region_name(rom->mr),
-                           rom->romsize,
-                           rom->name);
+            g_string_append_printf(buf, "%s"
+                                   " size=0x%06zx name=\"%s\"\n",
+                                   memory_region_name(rom->mr),
+                                   rom->romsize,
+                                   rom->name);
         } else if (!rom->fw_file) {
-            monitor_printf(mon, "addr=" TARGET_FMT_plx
-                           " size=0x%06zx mem=%s name=\"%s\"\n",
-                           rom->addr, rom->romsize,
-                           rom->isrom ? "rom" : "ram",
-                           rom->name);
+            g_string_append_printf(buf, "addr=" TARGET_FMT_plx
+                                   " size=0x%06zx mem=%s name=\"%s\"\n",
+                                   rom->addr, rom->romsize,
+                                   rom->isrom ? "rom" : "ram",
+                                   rom->name);
         } else {
-            monitor_printf(mon, "fw=%s/%s"
-                           " size=0x%06zx name=\"%s\"\n",
-                           rom->fw_dir,
-                           rom->fw_file,
-                           rom->romsize,
-                           rom->name);
+            g_string_append_printf(buf, "fw=%s/%s"
+                                   " size=0x%06zx name=\"%s\"\n",
+                                   rom->fw_dir,
+                                   rom->fw_file,
+                                   rom->romsize,
+                                   rom->name);
         }
     }
+
+    return human_readable_text_from_str(buf);
+}
+
+
+void hmp_info_roms(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_roms(&err);
+
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 typedef enum HexRecord HexRecord;
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 216fdfaf3a..76f2b84d81 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -15,6 +15,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qobject.h"
 #include "qapi/qobject-input-visitor.h"
+#include "qapi/type-helpers.h"
 #include "qemu/main-loop.h"
 #include "qom/qom-qobject.h"
 #include "sysemu/hostmem.h"
diff --git a/include/qapi/type-helpers.h b/include/qapi/type-helpers.h
new file mode 100644
index 0000000000..be1f181526
--- /dev/null
+++ b/include/qapi/type-helpers.h
@@ -0,0 +1,14 @@
+/*
+ * QAPI common helper functions
+ *
+ * This file provides helper functions related to types defined
+ * in the QAPI schema.
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#include "qapi/qapi-types-common.h"
+
+HumanReadableText *human_readable_text_from_str(GString *str);
diff --git a/qapi/common.json b/qapi/common.json
index 7c976296f0..412cc4f5ae 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -197,3 +197,14 @@
 { 'enum': 'GrabToggleKeys',
   'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
             'ctrl-scrolllock' ] }
+
+##
+# @HumanReadableText:
+#
+# @human-readable-text: Formatted output intended for humans.
+#
+# Since: 6.2
+#
+##
+{ 'struct': 'HumanReadableText',
+  'data': { 'human-readable-text': 'str' } }
diff --git a/qapi/machine.json b/qapi/machine.json
index 32d47f4e35..4c18904521 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1346,3 +1346,15 @@
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
+
+##
+# @x-query-roms:
+#
+# Query information on the registered ROMS
+#
+# Returns: registered ROMs
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-roms',
+  'returns': 'HumanReadableText' }
diff --git a/qapi/meson.build b/qapi/meson.build
index c356a385e3..c0c49c15e4 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -10,6 +10,9 @@ util_ss.add(files(
   'string-input-visitor.c',
   'string-output-visitor.c',
 ))
+if have_system
+  util_ss.add(files('qapi-type-helpers.c'))
+endif
 if have_system or have_tools
   util_ss.add(files(
     'qmp-dispatch.c',
diff --git a/qapi/qapi-type-helpers.c b/qapi/qapi-type-helpers.c
new file mode 100644
index 0000000000..f76b34f647
--- /dev/null
+++ b/qapi/qapi-type-helpers.c
@@ -0,0 +1,23 @@
+/*
+ * QAPI common helper functions
+ *
+ * This file provides helper functions related to types defined
+ * in the QAPI schema.
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/type-helpers.h"
+
+HumanReadableText *human_readable_text_from_str(GString *str)
+{
+    HumanReadableText *ret = g_new0(HumanReadableText, 1);
+
+    ret->human_readable_text = g_steal_pointer(&str->str);
+
+    return ret;
+}
-- 
2.31.1


