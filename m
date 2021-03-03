Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0732B670
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:07:05 +0100 (CET)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOPI-0005d7-Fw
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lHOI2-0007Ym-LP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:59:35 -0500
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:33082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lHOHx-0004Ip-GM
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:59:34 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id A151B2E1332;
 Wed,  3 Mar 2021 12:59:25 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 GQMvhqpKQa-xPx0b0C5; Wed, 03 Mar 2021 12:59:25 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1614765565; bh=3xaewMFazOtEOhmAX9L2qiolW885HNMJSqIVvauR6mA=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=okXjIIdLuDRC0sj05f2wTTjT8cJk8tnMOgU5p0ti7aIkcP0nOlOqR6TVKP+5RyM9X
 L2v22GPHEObingBB1phSBHzQB1BD7iaplNBHszV/DHZheVwHgNdKSohOCyo+eVEjCU
 TMrOqZ0qZR6LDPZqODM0l76iY5Dl7dGuSJMV/nlo=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:107:880d:3c89:fcd8:ca75])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 w0BjtEeJGw-xPnKGPHs; Wed, 03 Mar 2021 12:59:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v7 4/5] hmp: Use QAPI NetdevInfo in hmp_info_network
Date: Wed,  3 Mar 2021 12:59:09 +0300
Message-Id: <20210303095910.78277-5-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303095910.78277-1-lekiravi@yandex-team.ru>
References: <20210303095910.78277-1-lekiravi@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace usage of legacy field info_str of NetClientState for backend
network devices with QAPI NetdevInfo stored_config that already used
in QMP query-netdev.

This change increases the detail of the "info network" output and takes
a more general approach to composing the output.

NIC and hubports still use legacy info_str field.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
---
 include/qapi/hmp-output-visitor.h |  30 +++++
 net/net.c                         |  31 ++++-
 qapi/hmp-output-visitor.c         | 193 ++++++++++++++++++++++++++++++
 qapi/meson.build                  |   1 +
 4 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 include/qapi/hmp-output-visitor.h
 create mode 100644 qapi/hmp-output-visitor.c

diff --git a/include/qapi/hmp-output-visitor.h b/include/qapi/hmp-output-visitor.h
new file mode 100644
index 0000000000..541e4002e3
--- /dev/null
+++ b/include/qapi/hmp-output-visitor.h
@@ -0,0 +1,30 @@
+/*
+ * HMP string output Visitor
+ *
+ * Copyright Yandex N.V., 2021
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HMP_OUTPUT_VISITOR_H
+#define HMP_OUTPUT_VISITOR_H
+
+#include "qapi/visitor.h"
+
+typedef struct HMPOutputVisitor HMPOutputVisitor;
+
+/**
+ * Create a HMP string output visitor for @obj
+ *
+ * Flattens dicts/structures, only shows arrays borders.
+ *
+ * Errors are not expected to happen.
+ *
+ * The caller is responsible for freeing the visitor with
+ * visit_free().
+ */
+Visitor *hmp_output_visitor_new(char **result);
+
+#endif
diff --git a/net/net.c b/net/net.c
index 88d70d0e4d..e186b44e9a 100644
--- a/net/net.c
+++ b/net/net.c
@@ -54,6 +54,7 @@
 #include "sysemu/sysemu.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "qapi/hmp-output-visitor.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1192,14 +1193,42 @@ static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
     monitor_printf(mon, "\n");
 }
 
+static char *generate_info_str(NetClientState *nc)
+{
+    NetdevInfo *ni = nc->stored_config;
+    char *ret_out = NULL;
+    Visitor *v;
+
+    /* Use legacy field info_str for NIC and hubports */
+    if ((nc->info->type == NET_CLIENT_DRIVER_NIC) ||
+        (nc->info->type == NET_CLIENT_DRIVER_HUBPORT)) {
+        return g_strdup(nc->info_str ? nc->info_str : "");
+    }
+
+    if (!ni) {
+        return g_malloc0(1);
+    }
+
+    v = hmp_output_visitor_new(&ret_out);
+    if (visit_type_NetdevInfo(v, "", &ni, NULL)) {
+        visit_complete(v, &ret_out);
+    }
+    visit_free(v);
+
+    return ret_out;
+}
+
 void print_net_client(Monitor *mon, NetClientState *nc)
 {
     NetFilterState *nf;
+    char *info_str = generate_info_str(nc);
 
     monitor_printf(mon, "%s: index=%d,type=%s,%s\n", nc->name,
                    nc->queue_index,
                    NetClientDriver_str(nc->info->type),
-                   nc->info_str ? nc->info_str : "");
+                   info_str);
+    g_free(info_str);
+
     if (!QTAILQ_EMPTY(&nc->filters)) {
         monitor_printf(mon, "filters:\n");
     }
diff --git a/qapi/hmp-output-visitor.c b/qapi/hmp-output-visitor.c
new file mode 100644
index 0000000000..8036605f97
--- /dev/null
+++ b/qapi/hmp-output-visitor.c
@@ -0,0 +1,193 @@
+/*
+ * HMP string output Visitor
+ *
+ * Copyright Yandex N.V., 2021
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qapi/hmp-output-visitor.h"
+#include "qapi/visitor-impl.h"
+
+struct HMPOutputVisitor {
+    Visitor visitor;
+    char **result;
+    GString *buffer;
+    bool is_continue;
+};
+
+static HMPOutputVisitor *to_hov(Visitor *v)
+{
+    return container_of(v, HMPOutputVisitor, visitor);
+}
+
+static void hmp_output_append_formatted(Visitor *v, const char *fmt, ...)
+{
+    HMPOutputVisitor *ov = to_hov(v);
+    va_list args;
+
+    if (ov->is_continue) {
+        g_string_append(ov->buffer, ",");
+    } else {
+        ov->is_continue = true;
+    }
+
+    va_start(args, fmt);
+    g_string_append_vprintf(ov->buffer, fmt, args);
+    va_end(args);
+}
+
+static void hmp_output_skip_comma(Visitor *v)
+{
+    HMPOutputVisitor *ov = to_hov(v);
+
+    ov->is_continue = false;
+}
+
+static bool hmp_output_start_struct(Visitor *v, const char *name,
+                                    void **obj, size_t unused, Error **errp)
+{
+    return true;
+}
+
+static void hmp_output_end_struct(Visitor *v, void **obj) {}
+
+static bool hmp_output_start_list(Visitor *v, const char *name,
+                                  GenericList **listp, size_t size,
+                                  Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=[", name);
+    /* First element in array without comma before it */
+    hmp_output_skip_comma(v);
+
+    return true;
+}
+
+static GenericList *hmp_output_next_list(Visitor *v, GenericList *tail,
+                                         size_t size)
+{
+    return tail->next;
+}
+
+static void hmp_output_end_list(Visitor *v, void **obj)
+{
+    /* Don't need comma after last array element */
+    hmp_output_skip_comma(v);
+    hmp_output_append_formatted(v, "]");
+}
+
+static bool hmp_output_type_int64(Visitor *v, const char *name,
+                                  int64_t *obj, Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=%" PRId64, name, *obj);
+
+    return true;
+}
+
+static bool hmp_output_type_uint64(Visitor *v, const char *name,
+                                   uint64_t *obj, Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=%" PRIu64, name, *obj);
+
+    return true;
+}
+
+static bool hmp_output_type_bool(Visitor *v, const char *name, bool *obj,
+                                 Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=%s", name, *obj ? "true" : "false");
+
+    return true;
+}
+
+static bool hmp_output_type_str(Visitor *v, const char *name, char **obj,
+                                Error **errp)
+{
+    /* Skip already printed or unused fields */
+    if (!*obj || g_str_equal(name, "id") || g_str_equal(name, "type")) {
+        return true;
+    }
+
+    /* Do not print stub name for StringList elements */
+    if (g_str_equal(name, "str")) {
+        hmp_output_append_formatted(v, "%s", *obj);
+    } else {
+        hmp_output_append_formatted(v, "%s=%s", name, *obj);
+    }
+
+    return true;
+}
+
+static bool hmp_output_type_number(Visitor *v, const char *name,
+                                   double *obj, Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=%.17g", name, *obj);
+
+    return true;
+}
+
+/* TODO: remove this function? */
+static bool hmp_output_type_any(Visitor *v, const char *name,
+                                QObject **obj, Error **errp)
+{
+    return true;
+}
+
+static bool hmp_output_type_null(Visitor *v, const char *name,
+                                 QNull **obj, Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=NULL", name);
+
+    return true;
+}
+
+static void hmp_output_complete(Visitor *v, void *opaque)
+{
+    HMPOutputVisitor *ov = to_hov(v);
+
+    *ov->result = g_string_free(ov->buffer, false);
+    ov->buffer = NULL;
+}
+
+static void hmp_output_free(Visitor *v)
+{
+    HMPOutputVisitor *ov = to_hov(v);
+
+    if (ov->buffer) {
+        g_string_free(ov->buffer, true);
+    }
+    g_free(v);
+}
+
+Visitor *hmp_output_visitor_new(char **result)
+{
+    HMPOutputVisitor *v;
+
+    v = g_malloc0(sizeof(*v));
+
+    v->visitor.type = VISITOR_OUTPUT;
+    v->visitor.start_struct = hmp_output_start_struct;
+    v->visitor.end_struct = hmp_output_end_struct;
+    v->visitor.start_list = hmp_output_start_list;
+    v->visitor.next_list = hmp_output_next_list;
+    v->visitor.end_list = hmp_output_end_list;
+    v->visitor.type_int64 = hmp_output_type_int64;
+    v->visitor.type_uint64 = hmp_output_type_uint64;
+    v->visitor.type_bool = hmp_output_type_bool;
+    v->visitor.type_str = hmp_output_type_str;
+    v->visitor.type_number = hmp_output_type_number;
+    v->visitor.type_any = hmp_output_type_any;
+    v->visitor.type_null = hmp_output_type_null;
+    v->visitor.complete = hmp_output_complete;
+    v->visitor.free = hmp_output_free;
+
+    v->result = result;
+    v->buffer = g_string_new("");
+    v->is_continue = false;
+
+    return &v->visitor;
+}
diff --git a/qapi/meson.build b/qapi/meson.build
index 0652569bc4..94effbc052 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -8,6 +8,7 @@ util_ss.add(files(
   'qobject-output-visitor.c',
   'string-input-visitor.c',
   'string-output-visitor.c',
+  'hmp-output-visitor.c',
 ))
 if have_system or have_tools
   util_ss.add(files(
-- 
2.25.1


