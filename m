Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF22843E5D5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:11:42 +0200 (CEST)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg80D-0003ve-RS
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7nr-0005sl-9l
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7np-0004f4-Aa
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HL+FqD6MtsWxeYz5ulsC01jsa/eSKh/tcGsiMQzmNZs=;
 b=OEw2eymNJqWlG538NEZ3iBY6g1mctCOKMRnyI2aCiA9o58tGGS8jCJ/m087lvj+1WTkhjv
 F/5QuuDl5j8KiKJvgDcTWnzTAxA6PQHkotB5qDWF0TDLttuLRg9d7RILD5DG0H5isGa7f2
 ZKT+RYRpeuWqVBE7fL5hBRSBqIKjpak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-XArph1tCO4e4EuMGQOq1jQ-1; Thu, 28 Oct 2021 11:58:40 -0400
X-MC-Unique: XArph1tCO4e4EuMGQOq1jQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F1E19253C3;
 Thu, 28 Oct 2021 15:58:39 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FC7C6F920;
 Thu, 28 Oct 2021 15:58:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/22] qapi: introduce x-query-ramblock QMP command
Date: Thu, 28 Oct 2021 16:54:50 +0100
Message-Id: <20211028155457.967291-16-berrange@redhat.com>
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

This is a counterpart to the HMP "info ramblock" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

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
index 555c907f67..c458dcce69 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1299,23 +1299,26 @@ void qemu_mutex_unlock_ramlist(void)
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


