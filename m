Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A13CD223
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:44:27 +0200 (CEST)
Received: from localhost ([::1]:35202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Ql8-0007xA-GA
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m5QhX-0001sb-Ay
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:40:47 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m5QhT-0008IB-Pp
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:40:43 -0400
Received: by mail-ej1-x631.google.com with SMTP id hc15so27909182ejc.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ix0gAOc5/fNn0+A2y+yTk7lwiuiTthD3xfd4/RRCYk=;
 b=Q4K1IrLB/s3mDB2J5nzbQZQCYVQuDmcF6cdnQ6+JraZvMT84qZDDBK1Q9BBanYduqL
 OWlkgjOiZvCgMzALe/EQGbHhUJTzDX/x8ac2hRgDkxNZRK4XkR6MnbsyWAzAJs/pmUMR
 UDNckglT5Eaz25EZeVSxBV5lvjc9QeMVX8RsuBFPU8LtQ76VQwcoEBiwCc9jRF1FHfPw
 4qnWUDzCJYNMKxb5VO17nZUM7UgSGzQQo7ADhx0LWhJ6Nsdiy4CZ28LTwYnNZDEQMGgW
 auZSE8J4nR6OSZnH3prL/2ibP6nSEX/gU05k4oBR2QnUypFgJxB593mS7jXVkSmXdueI
 vTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0ix0gAOc5/fNn0+A2y+yTk7lwiuiTthD3xfd4/RRCYk=;
 b=S44dGCrJm5kCaO2K0ZSAtwEMu9Ochfgmf5pYMTiHqziNn4cApdPcrCpQ+fEY5YCui7
 FuyxyGcy6Hv/kK52ct2gNa9mT9Vov1lkjMbqSHMhYgAfpDgTSsXg2VPqEXQbm1W99356
 PdNh137fSySLlnJjkzIymCehv8SXWu1oV4F8BUvh/NV6PkDwDFUOm+Pt6836uzzaEAj6
 S8ekISsBZdEVxaprJtVN9ifO0jtPpUOY2YZ8g+XKCAgxBIYDhin3d2GFEf93mRLeFObP
 4wQEzhscOs26QmtsdIJMwbmGV0Nb/QY91V7P5DxNCymDzsHKxR3jhi9XkDfNUQIHdo74
 CJiA==
X-Gm-Message-State: AOAM533CeF+EnbWqppqvzd8V10HrWDMsPQ4jwgOlH8yYzh/tySIM0X6j
 FmIzWknoB0D0jM4/bXhzWnmGhl71pdnVkA==
X-Google-Smtp-Source: ABdhPJy/HeijZHxp3hCGgZIYQ9NTqijTN7Mj+Z/D/pfoY9yy80rJf0oHnerqG7J9zvlITB1uYSctnA==
X-Received: by 2002:a17:906:4b43:: with SMTP id
 j3mr12650337ejv.524.1626691236282; 
 Mon, 19 Jul 2021 03:40:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j22sm5872015ejt.11.2021.07.19.03.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 03:40:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qapi: introduce forwarding visitor
Date: Mon, 19 Jul 2021 12:40:32 +0200
Message-Id: <20210719104033.185109-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719104033.185109-1-pbonzini@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new adaptor visitor takes a single field of the adaptee, and exposes it
with a different name.

This will be used for QOM alias properties.  Alias targets can of course
have a different name than the alias property itself (e.g. a machine's
pflash0 might be an alias of a property named 'drive').  When the target's
getter or setter invokes the visitor, it will use a different name than
what the caller expects, and the visitor will not be able to find it
(or will consume erroneously).

The solution is for alias getters and setters to wrap the incoming
visitor, and forward the sole field that the target is expecting while
renaming it appropriately.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/forward-visitor.h    |  27 +++
 qapi/meson.build                  |   1 +
 qapi/qapi-forward-visitor.c       | 307 ++++++++++++++++++++++++++++++
 tests/unit/meson.build            |   1 +
 tests/unit/test-forward-visitor.c | 165 ++++++++++++++++
 5 files changed, 501 insertions(+)
 create mode 100644 include/qapi/forward-visitor.h
 create mode 100644 qapi/qapi-forward-visitor.c
 create mode 100644 tests/unit/test-forward-visitor.c

diff --git a/include/qapi/forward-visitor.h b/include/qapi/forward-visitor.h
new file mode 100644
index 0000000000..c7002d53e6
--- /dev/null
+++ b/include/qapi/forward-visitor.h
@@ -0,0 +1,27 @@
+/*
+ * Forwarding visitor
+ *
+ * Copyright Red Hat, Inc. 2021
+ *
+ * Author: Paolo Bonzini <pbonzini@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#ifndef FORWARD_VISITOR_H
+#define FORWARD_VISITOR_H
+
+#include "qapi/visitor.h"
+
+typedef struct ForwardFieldVisitor ForwardFieldVisitor;
+
+/*
+ * The forwarding visitor only expects a single name, @from, to be passed for
+ * toplevel fields.  It is converted to @to and forward to the @target visitor.
+ * Calls within a struct are forwarded without changing the name.
+ */
+Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to);
+
+#endif
diff --git a/qapi/meson.build b/qapi/meson.build
index 376f4ceafe..c356a385e3 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -2,6 +2,7 @@ util_ss.add(files(
   'opts-visitor.c',
   'qapi-clone-visitor.c',
   'qapi-dealloc-visitor.c',
+  'qapi-forward-visitor.c',
   'qapi-util.c',
   'qapi-visit-core.c',
   'qobject-input-visitor.c',
diff --git a/qapi/qapi-forward-visitor.c b/qapi/qapi-forward-visitor.c
new file mode 100644
index 0000000000..bc6412d52e
--- /dev/null
+++ b/qapi/qapi-forward-visitor.c
@@ -0,0 +1,307 @@
+/*
+ * Forward Visitor
+ *
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include <math.h>
+#include "qapi/compat-policy.h"
+#include "qapi/error.h"
+#include "qapi/forward-visitor.h"
+#include "qapi/visitor-impl.h"
+#include "qemu/queue.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qbool.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qlist.h"
+#include "qapi/qmp/qnull.h"
+#include "qapi/qmp/qnum.h"
+#include "qapi/qmp/qstring.h"
+#include "qemu/cutils.h"
+#include "qemu/option.h"
+
+struct ForwardFieldVisitor {
+    Visitor visitor;
+
+    Visitor *target;
+    char *from;
+    char *to;
+
+    int depth;
+};
+
+static ForwardFieldVisitor *to_ffv(Visitor *v)
+{
+    return container_of(v, ForwardFieldVisitor, visitor);
+}
+
+static bool forward_field_translate_name(ForwardFieldVisitor *v, const char **name,
+                                         Error **errp)
+{
+    if (v->depth) {
+        return true;
+    }
+    if (g_str_equal(*name, v->from)) {
+        *name = v->to;
+        return true;
+    }
+    error_setg(errp, QERR_MISSING_PARAMETER, *name);
+    return false;
+}
+
+static bool forward_field_check_struct(Visitor *v, Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+    return visit_check_struct(ffv->target, errp);
+}
+
+static bool forward_field_start_struct(Visitor *v, const char *name, void **obj,
+                                       size_t size, Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    if (!visit_start_struct(ffv->target, name, obj, size, errp)) {
+        return false;
+    }
+    ffv->depth++;
+    return true;
+}
+
+static void forward_field_end_struct(Visitor *v, void **obj)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+    assert(ffv->depth);
+    ffv->depth--;
+    visit_end_struct(ffv->target, obj);
+}
+
+static bool forward_field_start_list(Visitor *v, const char *name,
+                                     GenericList **list, size_t size,
+                                     Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    ffv->depth++;
+    return visit_start_list(ffv->target, name, list, size, errp);
+}
+
+static GenericList *forward_field_next_list(Visitor *v, GenericList *tail,
+                                            size_t size)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    assert(ffv->depth);
+    return visit_next_list(ffv->target, tail, size);
+}
+
+static bool forward_field_check_list(Visitor *v, Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    assert(ffv->depth);
+    return visit_check_list(ffv->target, errp);
+}
+
+static void forward_field_end_list(Visitor *v, void **obj)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    assert(ffv->depth);
+    ffv->depth--;
+    visit_end_list(ffv->target, obj);
+}
+
+static bool forward_field_start_alternate(Visitor *v, const char *name,
+                                          GenericAlternate **obj, size_t size,
+                                          Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    /*
+     * The name of alternates is reused when accessing the content,
+     * so do not increase depth here.
+     */
+    return visit_start_alternate(ffv->target, name, obj, size, errp);
+}
+
+static void forward_field_end_alternate(Visitor *v, void **obj)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    visit_end_alternate(ffv->target, obj);
+}
+
+static bool forward_field_type_int64(Visitor *v, const char *name, int64_t *obj,
+                                     Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_type_int64(ffv->target, name, obj, errp);
+}
+
+static bool forward_field_type_uint64(Visitor *v, const char *name,
+                                      uint64_t *obj, Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_type_uint64(ffv->target, name, obj, errp);
+}
+
+static bool forward_field_type_bool(Visitor *v, const char *name, bool *obj,
+                                    Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_type_bool(ffv->target, name, obj, errp);
+}
+
+static bool forward_field_type_str(Visitor *v, const char *name, char **obj,
+                                   Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_type_str(ffv->target, name, obj, errp);
+}
+
+static bool forward_field_type_number(Visitor *v, const char *name, double *obj,
+                                      Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_type_number(ffv->target, name, obj, errp);
+}
+
+static bool forward_field_type_any(Visitor *v, const char *name, QObject **obj,
+                                   Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_type_any(ffv->target, name, obj, errp);
+}
+
+static bool forward_field_type_null(Visitor *v, const char *name,
+                                    QNull **obj, Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_type_null(ffv->target, name, obj, errp);
+}
+
+static void forward_field_optional(Visitor *v, const char *name, bool *present)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, NULL)) {
+        *present = false;
+        return;
+    }
+    visit_optional(ffv->target, name, present);
+}
+
+static bool forward_field_deprecated_accept(Visitor *v, const char *name,
+                                            Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_deprecated_accept(ffv->target, name, errp);
+}
+
+static bool forward_field_deprecated(Visitor *v, const char *name)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, NULL)) {
+        return false;
+    }
+    return visit_deprecated(ffv->target, name);
+}
+
+static void forward_field_complete(Visitor *v, void *opaque)
+{
+    /*
+     * Do nothing, the complete method will be called at due time
+     * on the target visitor.
+     */
+}
+
+static void forward_field_free(Visitor *v)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    g_free(ffv->from);
+    g_free(ffv->to);
+    g_free(ffv);
+}
+
+Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to)
+{
+    ForwardFieldVisitor *v = g_new0(ForwardFieldVisitor, 1);
+
+    v->visitor.type = target->type;
+    v->visitor.start_struct = forward_field_start_struct;
+    v->visitor.check_struct = forward_field_check_struct;
+    v->visitor.end_struct = forward_field_end_struct;
+    v->visitor.start_list = forward_field_start_list;
+    v->visitor.next_list = forward_field_next_list;
+    v->visitor.check_list = forward_field_check_list;
+    v->visitor.end_list = forward_field_end_list;
+    v->visitor.start_alternate = forward_field_start_alternate;
+    v->visitor.end_alternate = forward_field_end_alternate;
+    v->visitor.optional = forward_field_optional;
+    v->visitor.deprecated_accept = forward_field_deprecated_accept;
+    v->visitor.deprecated = forward_field_deprecated;
+    v->visitor.free = forward_field_free;
+    v->visitor.type_int64 = forward_field_type_int64;
+    v->visitor.type_uint64 = forward_field_type_uint64;
+    v->visitor.type_bool = forward_field_type_bool;
+    v->visitor.type_str = forward_field_type_str;
+    v->visitor.type_number = forward_field_type_number;
+    v->visitor.type_any = forward_field_type_any;
+    v->visitor.type_null = forward_field_type_null;
+    v->visitor.complete = forward_field_complete;
+
+    v->target = target;
+    v->from = g_strdup(from);
+    v->to = g_strdup(to);
+
+    return &v->visitor;
+}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 3e0504dd21..5736d285b2 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -14,6 +14,7 @@ tests = {
   'test-qobject-output-visitor': [testqapi],
   'test-clone-visitor': [testqapi],
   'test-qobject-input-visitor': [testqapi],
+  'test-forward-visitor': [testqapi],
   'test-string-input-visitor': [testqapi],
   'test-string-output-visitor': [testqapi],
   'test-opts-visitor': [testqapi],
diff --git a/tests/unit/test-forward-visitor.c b/tests/unit/test-forward-visitor.c
new file mode 100644
index 0000000000..bab1844f7f
--- /dev/null
+++ b/tests/unit/test-forward-visitor.c
@@ -0,0 +1,165 @@
+/*
+ * QAPI Forwarding Visitor unit-tests.
+ *
+ * Copyright (C) 2021 Red Hat Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu-common.h"
+#include "qapi/forward-visitor.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qobject.h"
+#include "qapi/qmp/qdict.h"
+#include "test-qapi-visit.h"
+#include "qemu/option.h"
+
+typedef bool GenericVisitor (Visitor *, const char *, void **, Error **);
+#define CAST_VISIT_TYPE(fn) ((GenericVisitor *)(fn))
+
+/*
+ * Parse @srcstr and wrap it with a ForwardFieldVisitor converting "src" to
+ * "dst". Check that visiting the result with "src" name fails, and return
+ * the result of visiting "dst".
+ */
+static void *visit_with_forward(const char *srcstr, GenericVisitor *fn)
+{
+    bool help = false;
+    QDict *src = keyval_parse(srcstr, NULL, &help, &error_abort);
+    Visitor *v, *alias_v;
+    Error *err = NULL;
+    void *result = NULL;
+
+    v = qobject_input_visitor_new_keyval(QOBJECT(src));
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+
+    alias_v = visitor_forward_field(v, "dst", "src");
+    fn(alias_v, "src", &result, &err);
+    error_free_or_abort(&err);
+    assert(!result);
+    fn(alias_v, "dst", &result, &err);
+    assert(err == NULL);
+    visit_free(alias_v);
+
+    visit_end_struct(v, NULL);
+    visit_free(v);
+    return result;
+}
+
+static void test_forward_any(void)
+{
+    QObject *src = visit_with_forward("src.integer=42,src.string=Hello,src.enum1=value2",
+                                      CAST_VISIT_TYPE(visit_type_any));
+    Visitor *v = qobject_input_visitor_new_keyval(src);
+    Error *err = NULL;
+    UserDefOne *dst;
+
+    visit_type_UserDefOne(v, NULL, &dst, &err);
+    assert(err == NULL);
+    visit_free(v);
+
+    g_assert_cmpint(dst->integer, ==, 42);
+    g_assert_cmpstr(dst->string, ==, "Hello");
+    g_assert_cmpint(dst->has_enum1, ==, true);
+    g_assert_cmpint(dst->enum1, ==, ENUM_ONE_VALUE2);
+    qapi_free_UserDefOne(dst);
+}
+
+static void test_forward_number(void)
+{
+    /*
+     * visit_type_number does not return a pointer, so visit_with_forward
+     * cannot be used.
+     */
+    bool help = false;
+    QDict *src = keyval_parse("src=1.5", NULL, &help, &error_abort);
+    Visitor *v, *alias_v;
+    Error *err = NULL;
+    double result = 0.0;
+
+    v = qobject_input_visitor_new_keyval(QOBJECT(src));
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+
+    alias_v = visitor_forward_field(v, "dst", "src");
+    visit_type_number(alias_v, "src", &result, &err);
+    error_free_or_abort(&err);
+    visit_type_number(alias_v, "dst", &result, &err);
+    assert(result == 1.5);
+    assert(err == NULL);
+    visit_free(alias_v);
+
+    visit_end_struct(v, NULL);
+    visit_free(v);
+}
+
+static void test_forward_string(void)
+{
+    char *dst = visit_with_forward("src=Hello",
+                                   CAST_VISIT_TYPE(visit_type_str));
+
+    g_assert_cmpstr(dst, ==, "Hello");
+    g_free(dst);
+}
+
+static void test_forward_struct(void)
+{
+    UserDefOne *dst = visit_with_forward("src.integer=42,src.string=Hello",
+                                         CAST_VISIT_TYPE(visit_type_UserDefOne));
+
+    g_assert_cmpint(dst->integer, ==, 42);
+    g_assert_cmpstr(dst->string, ==, "Hello");
+    g_assert_cmpint(dst->has_enum1, ==, false);
+    qapi_free_UserDefOne(dst);
+}
+
+static void test_forward_alternate(void)
+{
+    AltStrObj *s_dst = visit_with_forward("src=hello",
+                                          CAST_VISIT_TYPE(visit_type_AltStrObj));
+    AltStrObj *o_dst = visit_with_forward("src.integer=42,src.boolean=true,src.string=world",
+                                          CAST_VISIT_TYPE(visit_type_AltStrObj));
+
+    g_assert_cmpint(s_dst->type, ==, QTYPE_QSTRING);
+    g_assert_cmpstr(s_dst->u.s, ==, "hello");
+    g_assert_cmpint(o_dst->type, ==, QTYPE_QDICT);
+    g_assert_cmpint(o_dst->u.o.integer, ==, 42);
+    g_assert_cmpint(o_dst->u.o.boolean, ==, true);
+    g_assert_cmpstr(o_dst->u.o.string, ==, "world");
+
+    qapi_free_AltStrObj(s_dst);
+    qapi_free_AltStrObj(o_dst);
+}
+
+static void test_forward_list(void)
+{
+    uint8List *dst = visit_with_forward("src.0=1,src.1=2,src.2=3,src.3=4",
+                                        CAST_VISIT_TYPE(visit_type_uint8List));
+    uint8List *tmp;
+    int i;
+
+    for (tmp = dst, i = 1; i <= 4; i++) {
+        g_assert(tmp);
+        g_assert_cmpint(tmp->value, ==, i);
+        tmp = tmp->next;
+    }
+    g_assert(!tmp);
+    qapi_free_uint8List(dst);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    g_test_add_func("/visitor/forward/struct", test_forward_struct);
+    g_test_add_func("/visitor/forward/alternate", test_forward_alternate);
+    g_test_add_func("/visitor/forward/string", test_forward_string);
+    g_test_add_func("/visitor/forward/number", test_forward_number);
+    g_test_add_func("/visitor/forward/any", test_forward_any);
+    g_test_add_func("/visitor/forward/list", test_forward_list);
+
+    return g_test_run();
+}
-- 
2.31.1



