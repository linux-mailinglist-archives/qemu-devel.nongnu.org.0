Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46450443563
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:16:22 +0100 (CET)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyKb-0003wE-6S
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy7O-0000de-Dk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:02:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy7H-0000EZ-B7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635876152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKPWNXrAhvUjV+mbHr0ytXo9b3aUfkPQs2gZ4MJGUEo=;
 b=GUa2oAmvl0Zt3lETqx4orlJFh7MxzaSzDCyVM4iw4LqhBoEwHt67t7Fgpo65DgXHTY9Cfu
 j9W7pZIXwJY7FyUW7KuNuLdt7kICKDPeg/kZiKm1x8CBsGPhMyzWssGk6Be/YrIXE1yWip
 JJfHdSSiKstOONtOiq9Ok+8tltRaJrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-axnq57e7M-GOeQWaSA8XdA-1; Tue, 02 Nov 2021 14:02:28 -0400
X-MC-Unique: axnq57e7M-GOeQWaSA8XdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BFC3802B61;
 Tue,  2 Nov 2021 18:02:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 079F219C59;
 Tue,  2 Nov 2021 18:01:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] qapi: introduce x-query-ramblock QMP command
Date: Tue,  2 Nov 2021 17:56:57 +0000
Message-Id: <20211102175700.1175996-16-berrange@redhat.com>
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

This is a counterpart to the HMP "info ramblock" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx   |  2 +-
 include/exec/ramlist.h |  2 +-
 monitor/hmp-cmds.c     |  6 ------
 monitor/qmp-cmds.c     |  8 ++++++++
 qapi/machine.json      | 12 ++++++++++++
 softmmu/physmem.c      | 19 +++++++++++--------
 6 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index d9af216473..c2d7275bf5 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -772,7 +772,7 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "Display system ramblock information",
-        .cmd        = hmp_info_ramblock,
+        .cmd_info_hrt = qmp_x_query_ramblock,
     },
 
 SRST
diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
index ece6497ee2..2ad2a81acc 100644
--- a/include/exec/ramlist.h
+++ b/include/exec/ramlist.h
@@ -80,6 +80,6 @@ void ram_block_notify_add(void *host, size_t size, size_t max_size);
 void ram_block_notify_remove(void *host, size_t size, size_t max_size);
 void ram_block_notify_resize(void *host, size_t old_size, size_t new_size);
 
-void ram_block_dump(Monitor *mon);
+GString *ram_block_format(void);
 
 #endif /* RAMLIST_H */
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9d221622d7..90f9a64573 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -52,7 +52,6 @@
 #include "ui/console.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
-#include "exec/ramlist.h"
 #include "hw/intc/intc.h"
 #include "migration/snapshot.h"
 #include "migration/misc.h"
@@ -2176,11 +2175,6 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
     qapi_free_RockerOfDpaGroupList(list);
 }
 
-void hmp_info_ramblock(Monitor *mon, const QDict *qdict)
-{
-    ram_block_dump(mon);
-}
-
 void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 0a9ba7595c..a9766fa38d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -38,6 +38,7 @@
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/type-helpers.h"
 #include "qapi/qmp/qerror.h"
+#include "exec/ramlist.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/rdma/rdma.h"
@@ -414,3 +415,10 @@ HumanReadableText *qmp_x_query_rdma(Error **errp)
 
     return human_readable_text_from_str(buf);
 }
+
+HumanReadableText *qmp_x_query_ramblock(Error **errp)
+{
+    g_autoptr(GString) buf = ram_block_format();
+
+    return human_readable_text_from_str(buf);
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index 1b2748c77a..be81170c2b 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1436,6 +1436,18 @@
 { 'command': 'x-query-profile',
   'returns': 'HumanReadableText' }
 
+##
+# @x-query-ramblock:
+#
+# Query system ramblock information
+#
+# Returns: system ramblock information
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-ramblock',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-rdma:
 #
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index b9a8c1d1f4..314f8b439c 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1296,23 +1296,26 @@ void qemu_mutex_unlock_ramlist(void)
     qemu_mutex_unlock(&ram_list.mutex);
 }
 
-void ram_block_dump(Monitor *mon)
+GString *ram_block_format(void)
 {
     RAMBlock *block;
     char *psize;
+    GString *buf = g_string_new("");
 
     RCU_READ_LOCK_GUARD();
-    monitor_printf(mon, "%24s %8s  %18s %18s %18s\n",
-                   "Block Name", "PSize", "Offset", "Used", "Total");
+    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s\n",
+                           "Block Name", "PSize", "Offset", "Used", "Total");
     RAMBLOCK_FOREACH(block) {
         psize = size_to_str(block->page_size);
-        monitor_printf(mon, "%24s %8s  0x%016" PRIx64 " 0x%016" PRIx64
-                       " 0x%016" PRIx64 "\n", block->idstr, psize,
-                       (uint64_t)block->offset,
-                       (uint64_t)block->used_length,
-                       (uint64_t)block->max_length);
+        g_string_append_printf(buf, "%24s %8s  0x%016" PRIx64 " 0x%016" PRIx64
+                               " 0x%016" PRIx64 "\n", block->idstr, psize,
+                               (uint64_t)block->offset,
+                               (uint64_t)block->used_length,
+                               (uint64_t)block->max_length);
         g_free(psize);
     }
+
+    return buf;
 }
 
 #ifdef __linux__
-- 
2.31.1


