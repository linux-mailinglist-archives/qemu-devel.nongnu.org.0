Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A7041DB5C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:43:56 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwLr-0002HJ-N4
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw5n-0001yS-Sy
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw5g-0000OR-BL
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DlxDFv0x2w/dh7mTrCPCdt9u4VKtaz309ItE8GNYj34=;
 b=EfQXvG1yqCOhGSU7vr294dRwgy7ICDYiCehAyfElVR1NNnTSNWOgkYh32Jvrv5mjfuuZ0R
 OAp2pD6jHI0ekfNzgQ74rKP2sftBXx1rWBqPTngciOomVpnQIxBvu69iXrbxcvMBsFijYJ
 c6HhuRKYlZIFRxpiDzAjN1kNMG/kmDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-cCMnV15OPnmMgScz0hwvlw-1; Thu, 30 Sep 2021 09:27:09 -0400
X-MC-Unique: cCMnV15OPnmMgScz0hwvlw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA2591966322;
 Thu, 30 Sep 2021 13:27:07 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90C9E5D9C6;
 Thu, 30 Sep 2021 13:26:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/19] qapi: introduce x-query-ramblock QMP command
Date: Thu, 30 Sep 2021 14:23:42 +0100
Message-Id: <20210930132349.3601823-13-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

This is a counterpart to the HMP "info ramblock" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/exec/ramlist.h |  2 +-
 monitor/hmp-cmds.c     | 12 ++++++++++--
 monitor/qmp-cmds.c     |  8 ++++++++
 qapi/machine.json      | 12 ++++++++++++
 softmmu/physmem.c      | 19 +++++++++++--------
 5 files changed, 42 insertions(+), 11 deletions(-)

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
index ebc093b3d9..2d09a01599 100644
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
@@ -2188,7 +2187,16 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
 
 void hmp_info_ramblock(Monitor *mon, const QDict *qdict)
 {
-    ram_block_dump(mon);
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
+
+    info = qmp_x_query_ramblock(&err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict)
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
index fbe4100443..340ab57f60 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1371,6 +1371,18 @@
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
index 23e77cb771..bc4a8354d3 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1298,23 +1298,26 @@ void qemu_mutex_unlock_ramlist(void)
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


