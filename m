Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458D43E5CA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:10:12 +0200 (CEST)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7yk-0002JK-FW
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7mb-0004Xh-Vc
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7ma-0004VE-9k
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYdCvuAoRByUR70HdBQfqN8NwbjlvZg0vexUnZ1CsrU=;
 b=cnkQkkq6Vw15cSDIyiUK1Ft385O8tC+gPZnzEay7kWUYL1ZSVs4ebVrokO/5gsXBeViykN
 RYwLFJd4qjjFQGBGMed8oyGgGhgXFkEfPMH2NunL5mtRYVMkjyQPYKnujJgOKQ4EzxqYcv
 R1Fi+yg5+CW+IlaPX+S+yuR4mN4tEL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-q1JpUH71PUifPEJrCb4Z6A-1; Thu, 28 Oct 2021 11:57:32 -0400
X-MC-Unique: q1JpUH71PUifPEJrCb4Z6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0959C1023F5E;
 Thu, 28 Oct 2021 15:57:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06AC86F920;
 Thu, 28 Oct 2021 15:57:22 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/22] qapi: introduce x-query-roms QMP command
Date: Thu, 28 Oct 2021 16:54:45 +0100
Message-Id: <20211028155457.967291-11-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This is a counterpart to the HMP "info roms" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx |  2 +-
 hw/core/loader.c     | 39 ++++++++++++++++++++++-----------------
 monitor/misc.c       |  1 +
 qapi/machine.json    | 12 ++++++++++++
 4 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 24c478aead..b6325d36ed 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -594,7 +594,7 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show roms",
-        .cmd        = hmp_info_roms,
+        .cmd_info_hrt = qmp_x_query_roms,
     },
 
 SRST
diff --git a/hw/core/loader.c b/hw/core/loader.c
index c7f97fdce8..052a0fd719 100644
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
@@ -1474,32 +1476,35 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size)
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
 }
 
 typedef enum HexRecord HexRecord;
diff --git a/monitor/misc.c b/monitor/misc.c
index 3cb5269356..54df4e9e24 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -71,6 +71,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-qom.h"
 #include "qapi/qapi-commands-trace.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
 #include "qapi/qmp-event.h"
diff --git a/qapi/machine.json b/qapi/machine.json
index 5db54df298..26d4ef8195 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1411,3 +1411,15 @@
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
-- 
2.31.1


