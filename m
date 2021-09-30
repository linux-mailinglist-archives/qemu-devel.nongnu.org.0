Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50F341DB73
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:49:23 +0200 (CEST)
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwR8-0003ZP-MX
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw5r-000269-TL
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw5l-0000Tg-Sb
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSqiF7fp9QrY9cojuWl1zI4NInyLkg0dRqQGJxnZvso=;
 b=JioKxfLlAvKtCbm9joSJYPnJLkNX/w3Fq5cZv7r5JcIT5wtnVGo0bAdLT0cgMQxExsLrJf
 wNv2Qt4nP0Nw6thCvuZTnP8TeyGAFSiZbAjlKAZxHIMZl1KU7eEhMFxXYLuBVacIH96SPR
 g6Kw9Nz30lJ6KPK2ul2BduBnaoZy68k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-yKX4JBjqPjalqQOy-zDMaA-1; Thu, 30 Sep 2021 09:27:15 -0400
X-MC-Unique: yKX4JBjqPjalqQOy-zDMaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2414D1006AA4;
 Thu, 30 Sep 2021 13:27:14 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 241B75D9C6;
 Thu, 30 Sep 2021 13:27:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/19] qapi: introduce x-query-skeys QMP command
Date: Thu, 30 Sep 2021 14:23:43 +0100
Message-Id: <20210930132349.3601823-14-berrange@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This is a counterpart to the HMP "info skeys" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Including 'common.json' into 'machine-target.json' created a little
problem because the static marshalling method for HumanReadableText
is generated unconditionally. It is only used, however, conditionally
on certain target architectures.

To deal with this we change the QAPI code generator to simply mark
all static marshalling functions with G_GNUC_UNSED to hide the
compiler warning.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/s390x/s390-skeys.c    | 35 +++++++++++++++++++++++++++--------
 qapi/machine-target.json | 17 +++++++++++++++++
 scripts/qapi/commands.py |  1 +
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 5024faf411..62eff8c88b 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -15,6 +15,8 @@
 #include "hw/s390x/storage-keys.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "qapi/type-helpers.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/error-report.h"
 #include "sysemu/memory_mapping.h"
@@ -73,34 +75,51 @@ static void write_keys(FILE *f, uint8_t *keys, uint64_t startgfn,
     }
 }
 
-void hmp_info_skeys(Monitor *mon, const QDict *qdict)
+HumanReadableText *qmp_x_query_skeys(int64_t addr, Error **errp)
 {
+    g_autoptr(GString) buf = g_string_new("");
     S390SKeysState *ss = s390_get_skeys_device();
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
-    uint64_t addr = qdict_get_int(qdict, "addr");
     uint8_t key;
     int r;
 
     /* Quick check to see if guest is using storage keys*/
     if (!skeyclass->skeys_are_enabled(ss)) {
-        monitor_printf(mon, "Error: This guest is not using storage keys\n");
-        return;
+        error_setg(errp, "this guest is not using storage keys");
+        return NULL;
     }
 
     if (!address_space_access_valid(&address_space_memory,
                                     addr & TARGET_PAGE_MASK, TARGET_PAGE_SIZE,
                                     false, MEMTXATTRS_UNSPECIFIED)) {
-        monitor_printf(mon, "Error: The given address is not valid\n");
-        return;
+        error_setg(errp, "the given address is not valid");
+        return NULL;
     }
 
     r = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
     if (r < 0) {
-        monitor_printf(mon, "Error: %s\n", strerror(-r));
+        error_setg_errno(errp, r, "unable to query storage keys");
+        return NULL;
+    }
+
+    g_string_append_printf(buf, "  key: 0x%X\n", key);
+
+    return human_readable_text_from_str(buf);
+}
+
+void hmp_info_skeys(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
+    uint64_t addr = qdict_get_int(qdict, "addr");
+
+    info = qmp_x_query_skeys(addr, &err);
+    if (err) {
+        error_report_err(err);
         return;
     }
 
-    monitor_printf(mon, "  key: 0x%X\n", key);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 void hmp_dump_skeys(Monitor *mon, const QDict *qdict)
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index f5ec4bc172..7d4e73462f 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -4,6 +4,8 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
+{ 'include': 'common.json' }
+
 ##
 # @CpuModelInfo:
 #
@@ -341,3 +343,18 @@
                    'TARGET_I386',
                    'TARGET_S390X',
                    'TARGET_MIPS' ] } }
+
+
+##
+# @x-query-skeys:
+#
+# Query the value of a storage key
+#
+# Returns: storage key value
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-skeys',
+  'data': { 'addr': 'int' },
+  'returns': 'HumanReadableText',
+  'if': 'TARGET_S390X' }
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 3654825968..01d8d1ea2c 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -91,6 +91,7 @@ def gen_call(name: str,
 def gen_marshal_output(ret_type: QAPISchemaType) -> str:
     return mcgen('''
 
+G_GNUC_UNUSED
 static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
                                 QObject **ret_out, Error **errp)
 {
-- 
2.31.1


