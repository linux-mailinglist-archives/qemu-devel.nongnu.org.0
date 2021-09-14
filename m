Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69D640B2F0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:21:49 +0200 (CEST)
Received: from localhost ([::1]:56662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAFo-0001HM-NQ
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9TV-00085Q-QC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9TT-0002Pq-T7
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AFd+YTtbWmCaBK/9f7YsAzzznYqPy7xWqsdE9totms=;
 b=EhJ/wlFGsvQ1dG5akqUy+oVdHKWR4F0vomTQnm+IeM5jJ0i4j2O31T1byUeHYc2K7uuOiT
 4FW9AnDqjzXRsU4D7yCChTeF+k9aIfiJf90OgXMKV5b+fAAkeTDNrpkci+4T/Efq4w4jIS
 6BiECoodPcu0+dpwSqTM6F4A5zvZS6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-kMmXL9LeNXGtQ4n1sCumjQ-1; Tue, 14 Sep 2021 10:31:48 -0400
X-MC-Unique: kMmXL9LeNXGtQ4n1sCumjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB7961922023;
 Tue, 14 Sep 2021 14:31:44 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 529D55D9CA;
 Tue, 14 Sep 2021 14:31:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/53] qapi: introduce x-query-ramblock QMP command
Date: Tue, 14 Sep 2021 15:20:24 +0100
Message-Id: <20210914142042.1655100-36-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
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
 monitor/qmp-cmds.c     | 11 +++++++++++
 qapi/machine.json      | 12 ++++++++++++
 softmmu/physmem.c      | 19 +++++++++++--------
 5 files changed, 45 insertions(+), 11 deletions(-)

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
index d24a1683de..77533b2d8a 100644
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
index 9c2c1e4603..b86fff823e 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -37,6 +37,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qerror.h"
+#include "exec/ramlist.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/rdma/rdma.h"
@@ -419,3 +420,13 @@ HumanReadableText *qmp_x_query_rdma(Error **errp)
     ret->human_readable_text = g_steal_pointer(&buf->str);
     return ret;
 }
+
+HumanReadableText *qmp_x_query_ramblock(Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = ram_block_format();
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index 0fe962d916..3ae7beb7cf 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1337,6 +1337,18 @@
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


