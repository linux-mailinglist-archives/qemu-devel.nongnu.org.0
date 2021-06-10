Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86E3A244F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:12:10 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDvF-0002zo-Ku
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDjN-0005hG-4G
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:59:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDjL-0002T0-BU
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alG6R6cGR+fZFHYt0M7xSOj+2M/4LYU7I+kRHfvTcag=;
 b=T7sSTCkspkAVgypE4xvtwABrCM2bPbrUN/36IrmjatlEu0SLw4F0cE8hjwDnVhJ3IBVJXv
 165hOHhT9FZWUbS0paC7aU8AG0hQ1eGCAg5sjo/stYmydAi77Pa/t0RvDLVfM2j/yucA4B
 CRDbBOqo4seAKBYfFNJArEXKX1E3b9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-lTcvCa4oMuiPkuEH-dtx2Q-1; Thu, 10 Jun 2021 01:59:49 -0400
X-MC-Unique: lTcvCa4oMuiPkuEH-dtx2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47463800D62;
 Thu, 10 Jun 2021 05:59:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C6025D9E2;
 Thu, 10 Jun 2021 05:59:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 040F218017D5; Thu, 10 Jun 2021 07:57:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/18] modules: load modinfo.json
Date: Thu, 10 Jun 2021 07:57:50 +0200
Message-Id: <20210610055755.538119-14-kraxel@redhat.com>
In-Reply-To: <20210610055755.538119-1-kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Load and parse the module info database.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c     | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 util/trace-events |  3 +++
 2 files changed, 57 insertions(+)

diff --git a/util/module.c b/util/module.c
index 3a2d6dde9734..b0ea8c57d438 100644
--- a/util/module.c
+++ b/util/module.c
@@ -20,9 +20,16 @@
 #include "qemu/queue.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qemu/error-report.h"
 #ifdef CONFIG_MODULE_UPGRADES
 #include "qemu-version.h"
 #endif
+#include "trace.h"
+
+#include "qapi/error.h"
+#include "qapi/qapi-types-modules.h"
+#include "qapi/qapi-visit-modules.h"
+#include "qapi/qobject-input-visitor.h"
 
 typedef struct ModuleEntry
 {
@@ -111,6 +118,7 @@ void module_call_init(module_init_type type)
 
 #ifdef CONFIG_MODULES
 
+static Modules *modinfo;
 static char *module_dirs[5];
 static int module_ndirs;
 
@@ -137,7 +145,52 @@ static void module_load_path_init(void)
 #endif
 
     assert(module_ndirs <= ARRAY_SIZE(module_dirs));
+}
 
+static void module_load_modinfo(void)
+{
+    char *file, *json;
+    FILE *fp;
+    int i, size;
+    Visitor *v;
+    Error *errp = NULL;
+
+    if (modinfo) {
+        return;
+    }
+
+    for (i = 0; i < module_ndirs; i++) {
+        file = g_strdup_printf("%s/modinfo.json", module_dirs[i]);
+        fp = fopen(file, "r");
+        if (fp != NULL) {
+            break;
+        }
+        g_free(file);
+    }
+    if (NULL == fp) {
+        warn_report("No modinfo.json file found.");
+        return;
+    } else {
+        trace_module_load_modinfo(file);
+    }
+
+    fseek(fp, 0, SEEK_END);
+    size = ftell(fp);
+    fseek(fp, 0, SEEK_SET);
+    json = g_malloc0(size + 1);
+    fread(json, size, 1, fp);
+    json[size] = 0;
+    fclose(fp);
+
+    v = qobject_input_visitor_new_str(json, NULL, &errp);
+    if (errp) {
+        error_reportf_err(errp, "parse error (%s)", file);
+        g_free(file);
+        return;
+    }
+    visit_type_Modules(v, NULL, &modinfo, &errp);
+    visit_free(v);
+    g_free(file);
 }
 
 static int module_load_file(const char *fname, bool mayfail, bool export_symbols)
@@ -269,6 +322,7 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     g_hash_table_add(loaded_modules, module_name);
 
     module_load_path_init();
+    module_load_modinfo();
 
     for (i = 0; i < module_ndirs; i++) {
         fname = g_strdup_printf("%s/%s%s",
diff --git a/util/trace-events b/util/trace-events
index 806cac14a762..8b2afcbd109a 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -100,3 +100,6 @@ uffd_create_fd_api_failed(int err) "errno: %i"
 uffd_create_fd_api_noioctl(uint64_t ioctl_req, uint64_t ioctl_supp) "ioctl_req: 0x%" PRIx64 "ioctl_supp: 0x%" PRIx64
 uffd_register_memory_failed(void *addr, uint64_t length, uint64_t mode, int err) "addr: %p length: %" PRIu64 " mode: 0x%" PRIx64 " errno: %i"
 uffd_unregister_memory_failed(void *addr, uint64_t length, int err) "addr: %p length: %" PRIu64 " errno: %i"
+
+# module.c
+module_load_modinfo(const char *filename) "modinfo %s"
-- 
2.31.1


