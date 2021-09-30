Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BFE41DB65
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:44:36 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwMV-0003pG-1q
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw68-0002I7-SV
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw60-0000hN-LO
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wxz64m2+T/O7QzgBM54Tvb0joZfmw//KhZO3t82Rmfs=;
 b=Ks19vIxDL8AE8C4bSvBbxN92+T78JUn6CYMXmSltwamhRlLKSX/uUzc5FG4AKqStSCWcav
 ksjNHay/3nwGFBI0A55MT/s4nMvtz6/D5FyJlbeOHm5yTx8dfo6KluPSIQyePiNvcHyF6+
 M6320kySeMUlH56eCQNfvFPnH+yYo7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-vbGewN_LMhu0PaXMWXOqTQ-1; Thu, 30 Sep 2021 09:27:30 -0400
X-MC-Unique: vbGewN_LMhu0PaXMWXOqTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA8BF9F934;
 Thu, 30 Sep 2021 13:27:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C33E5D9C6;
 Thu, 30 Sep 2021 13:27:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/19] qapi: introduce x-query-cmma QMP command
Date: Thu, 30 Sep 2021 14:23:44 +0100
Message-Id: <20210930132349.3601823-15-berrange@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is a counterpart to the HMP "info cmma" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

This command is unable to use the pre-existing HumanReadableText,
because if 'common.json' is included into 'machine-target.json'
the static marshalling method for HumanReadableText will be reported
as unused by the compiler on all architectures except s390x.

Possible options were

 1 Support 'if' conditionals on 'include' statements in QAPI
 2 Add further commands to 'machine-target.json' that use
   HumanReadableText, such that it has at least one usage
   on all architecture targets.
 3 Duplicate HumanReadableText as TargetHumanReadableText
   adding conditions

This patch takes option (3) in the belief that we will eventually
get to a point where option (2) happens, and TargetHumanReadableText
can be removed again.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/s390x/s390-stattrib.c | 56 +++++++++++++++++++++++++++-------------
 qapi/machine-target.json | 14 ++++++++++
 2 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 9eda1c3b2a..d8f5867a5f 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -17,6 +17,8 @@
 #include "qemu/error-report.h"
 #include "exec/ram_addr.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "qapi/type-helpers.h"
 #include "qapi/qmp/qdict.h"
 
 /* 512KiB cover 2GB of guest memory */
@@ -67,41 +69,59 @@ void hmp_migrationmode(Monitor *mon, const QDict *qdict)
     }
 }
 
-void hmp_info_cmma(Monitor *mon, const QDict *qdict)
+HumanReadableText *qmp_x_query_cmma(int64_t addr,
+                                    bool has_count,
+                                    int64_t count,
+                                    Error **errp)
 {
+    g_autoptr(GString) buf = g_string_new("");
     S390StAttribState *sas = s390_get_stattrib_device();
     S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
-    uint64_t addr = qdict_get_int(qdict, "addr");
-    uint64_t buflen = qdict_get_try_int(qdict, "count", 8);
-    uint8_t *vals;
+    g_autofree uint8_t *vals = NULL;
     int cx, len;
 
-    vals = g_try_malloc(buflen);
+    vals = g_try_malloc(count);
     if (!vals) {
-        monitor_printf(mon, "Error: %s\n", strerror(errno));
-        return;
+        error_setg_errno(errp, errno, "cannot allocate CMMA attribute values");
+        return NULL;
     }
 
-    len = sac->peek_stattr(sas, addr / TARGET_PAGE_SIZE, buflen, vals);
+    len = sac->peek_stattr(sas, addr / TARGET_PAGE_SIZE, count, vals);
     if (len < 0) {
-        monitor_printf(mon, "Error: %s", strerror(-len));
-        goto out;
+        error_setg_errno(errp, -len, "cannot peek at CMMA attribute values");
+        return NULL;
     }
 
-    monitor_printf(mon, "  CMMA attributes, "
-                   "pages %" PRIu64 "+%d (0x%" PRIx64 "):\n",
-                   addr / TARGET_PAGE_SIZE, len, addr & ~TARGET_PAGE_MASK);
+    g_string_append_printf(buf, "  CMMA attributes, "
+                           "pages %" PRIu64 "+%d (0x%" PRIx64 "):\n",
+                           addr / TARGET_PAGE_SIZE, len,
+                           addr & ~TARGET_PAGE_MASK);
     for (cx = 0; cx < len; cx++) {
         if (cx % 8 == 7) {
-            monitor_printf(mon, "%02x\n", vals[cx]);
+            g_string_append_printf(buf, "%02x\n", vals[cx]);
         } else {
-            monitor_printf(mon, "%02x", vals[cx]);
+            g_string_append_printf(buf, "%02x", vals[cx]);
         }
     }
-    monitor_printf(mon, "\n");
+    g_string_append_printf(buf, "\n");
+
+    return human_readable_text_from_str(buf);
+}
+
+void hmp_info_cmma(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
+    uint64_t addr = qdict_get_int(qdict, "addr");
+    uint64_t count = qdict_get_try_int(qdict, "count", 8);
+
+    info = qmp_x_query_cmma(addr, true, count, &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
 
-out:
-    g_free(vals);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 /* Migration support: */
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 7d4e73462f..19e44987af 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -345,6 +345,20 @@
                    'TARGET_MIPS' ] } }
 
 
+##
+# @x-query-cmma:
+#
+# Query the values of the CMMA storage attributes for a range of pages
+#
+# Returns: CMMA storage attribute values
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-cmma',
+  'data': { 'addr': 'int', '*count': 'int' },
+  'returns': 'HumanReadableText',
+  'if': 'TARGET_S390X' }
+
 ##
 # @x-query-skeys:
 #
-- 
2.31.1


