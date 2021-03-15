Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B37033AED3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:30:12 +0100 (CET)
Received: from localhost ([::1]:39840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjYB-0000NS-DZ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjKX-0000RF-PY
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjKN-0008FI-1X
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=isyNSp/2RhFSGA6oQpYTNiKMxxPA5chCpwunFVG4v/U=;
 b=IDtqgZzU3ymOYAVXFQBvpVjKanGkZAu9NbhPk/yiG45P506Wdw71M8wmugsSFcgzvLEjrc
 KKcdzZWP9HdmrWRQQmud4PQ5vLLc0oMvP+MgsNPXkNT4VX6vqEJISOvX3c38RFP+xg51gk
 324VJTuYhr58kKbf/5VFUJmMbPSy4pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-B2UWKAcFPGuCkrYgyj6epQ-1; Mon, 15 Mar 2021 05:15:48 -0400
X-MC-Unique: B2UWKAcFPGuCkrYgyj6epQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0C0D801817;
 Mon, 15 Mar 2021 09:15:47 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB33C1007625;
 Mon, 15 Mar 2021 09:15:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 19/20] hmp: Use QAPI NetdevInfo in hmp_info_network
Date: Mon, 15 Mar 2021 17:14:32 +0800
Message-Id: <1615799673-31549-20-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexey Kirillov <lekiravi@yandex-team.ru>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kirillov <lekiravi@yandex-team.ru>

Replace usage of legacy field info_str of NetClientState for backend
network devices with QAPI NetdevInfo stored_config that already used
in QMP query-netdev.

This change increases the detail of the "info network" output and takes
a more general approach to composing the output.

NIC and hubports still use legacy info_str field.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/qapi/hmp-output-visitor.h |  30 ++++++
 net/net.c                         |  31 +++++-
 qapi/hmp-output-visitor.c         | 193 ++++++++++++++++++++++++++++++++++++++
 qapi/meson.build                  |   1 +
 4 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 include/qapi/hmp-output-visitor.h
 create mode 100644 qapi/hmp-output-visitor.c

diff --git a/include/qapi/hmp-output-visitor.h b/include/qapi/hmp-output-visitor.h
new file mode 100644
index 0000000..541e400
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
index 277da71..725a4e1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -55,6 +55,7 @@
 #include "sysemu/sysemu.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "qapi/hmp-output-visitor.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1221,14 +1222,42 @@ static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
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
index 0000000..8036605
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
index fcb15a7..d4424ae 100644
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
2.7.4


