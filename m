Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A3AFD77C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 09:00:17 +0100 (CET)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVWWe-0002oT-5z
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 03:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iVWQl-0005n6-Gj
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 02:54:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iVWQk-0002e4-4L
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 02:54:11 -0500
Received: from mga07.intel.com ([134.134.136.100]:48001)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iVWQj-0002Zs-OH
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 02:54:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 23:54:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,307,1569308400"; d="scan'208";a="235987228"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2019 23:54:06 -0800
From: Tao Xu <tao3.xu@intel.com>
To: mst@redhat.com, imammedo@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com
Subject: [PATCH v16 05/14] qapi: Add builtin type time
Date: Fri, 15 Nov 2019 15:53:43 +0800
Message-Id: <20191115075352.17734-6-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115075352.17734-1-tao3.xu@intel.com>
References: <20191115075352.17734-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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
Cc: jingqi.liu@intel.com, tao3.xu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add optional builtin type time, fallback is uint64. This type use
qemu_strtotime_ns() for pre-converting time suffix to numbers.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v16.

Changes in v14:
    - Drop time unit picosecond (Eric)
---
 include/qapi/visitor-impl.h  |  4 ++++
 include/qapi/visitor.h       |  8 ++++++++
 qapi/opts-visitor.c          | 22 ++++++++++++++++++++++
 qapi/qapi-visit-core.c       | 12 ++++++++++++
 qapi/qobject-input-visitor.c | 18 ++++++++++++++++++
 qapi/trace-events            |  1 +
 scripts/qapi/schema.py       |  1 +
 7 files changed, 66 insertions(+)

diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 8ccb3b6c20..e0979563c7 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -88,6 +88,10 @@ struct Visitor
     void (*type_size)(Visitor *v, const char *name, uint64_t *obj,
                       Error **errp);
 
+    /* Optional; fallback is type_uint64() */
+    void (*type_time)(Visitor *v, const char *name, uint64_t *obj,
+                      Error **errp);
+
     /* Must be set */
     void (*type_bool)(Visitor *v, const char *name, bool *obj, Error **errp);
 
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index c5b23851a1..22242e706f 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -554,6 +554,14 @@ void visit_type_int64(Visitor *v, const char *name, int64_t *obj,
 void visit_type_size(Visitor *v, const char *name, uint64_t *obj,
                      Error **errp);
 
+/*
+ * Visit a uint64_t value.
+ * Like visit_type_uint64(), except that some visitors may choose to
+ * recognize numbers with timeunit suffix, such as "ns", "us" "ms" and "s".
+ */
+void visit_type_time(Visitor *v, const char *name, uint64_t *obj,
+                     Error **errp);
+
 /*
  * Visit a boolean value.
  *
diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 5fe0276c1c..59b575f0fc 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -526,6 +526,27 @@ opts_type_size(Visitor *v, const char *name, uint64_t *obj, Error **errp)
     processed(ov, name);
 }
 
+static void
+opts_type_time(Visitor *v, const char *name, uint64_t *obj, Error **errp)
+{
+    OptsVisitor *ov = to_ov(v);
+    const QemuOpt *opt;
+    int err;
+
+    opt = lookup_scalar(ov, name, errp);
+    if (!opt) {
+        return;
+    }
+
+    err = qemu_strtotime_ns(opt->str ? opt->str : "", NULL, obj);
+    if (err < 0) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, opt->name,
+                   "a time value");
+        return;
+    }
+
+    processed(ov, name);
+}
 
 static void
 opts_optional(Visitor *v, const char *name, bool *present)
@@ -573,6 +594,7 @@ opts_visitor_new(const QemuOpts *opts)
     ov->visitor.type_int64  = &opts_type_int64;
     ov->visitor.type_uint64 = &opts_type_uint64;
     ov->visitor.type_size   = &opts_type_size;
+    ov->visitor.type_time   = &opts_type_time;
     ov->visitor.type_bool   = &opts_type_bool;
     ov->visitor.type_str    = &opts_type_str;
 
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 5365561b07..ac8896455c 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -277,6 +277,18 @@ void visit_type_size(Visitor *v, const char *name, uint64_t *obj,
     }
 }
 
+void visit_type_time(Visitor *v, const char *name, uint64_t *obj,
+                     Error **errp)
+{
+    assert(obj);
+    trace_visit_type_time(v, name, obj);
+    if (v->type_time) {
+        v->type_time(v, name, obj, errp);
+    } else {
+        v->type_uint64(v, name, obj, errp);
+    }
+}
+
 void visit_type_bool(Visitor *v, const char *name, bool *obj, Error **errp)
 {
     assert(obj);
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 32236cbcb1..e476fe0d16 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -627,6 +627,23 @@ static void qobject_input_type_size_keyval(Visitor *v, const char *name,
     }
 }
 
+static void qobject_input_type_time_keyval(Visitor *v, const char *name,
+                                           uint64_t *obj, Error **errp)
+{
+    QObjectInputVisitor *qiv = to_qiv(v);
+    const char *str = qobject_input_get_keyval(qiv, name, errp);
+
+    if (!str) {
+        return;
+    }
+
+    if (qemu_strtotime_ns(str, NULL, obj) < 0) {
+        /* TODO report -ERANGE more nicely */
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   full_name(qiv, name), "time");
+    }
+}
+
 static void qobject_input_optional(Visitor *v, const char *name, bool *present)
 {
     QObjectInputVisitor *qiv = to_qiv(v);
@@ -708,6 +725,7 @@ Visitor *qobject_input_visitor_new_keyval(QObject *obj)
     v->visitor.type_any = qobject_input_type_any;
     v->visitor.type_null = qobject_input_type_null;
     v->visitor.type_size = qobject_input_type_size_keyval;
+    v->visitor.type_time = qobject_input_type_time_keyval;
     v->keyval = true;
 
     return &v->visitor;
diff --git a/qapi/trace-events b/qapi/trace-events
index 5eb4afa110..c4605a7ccc 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -29,6 +29,7 @@ visit_type_int16(void *v, const char *name, int16_t *obj) "v=%p name=%s obj=%p"
 visit_type_int32(void *v, const char *name, int32_t *obj) "v=%p name=%s obj=%p"
 visit_type_int64(void *v, const char *name, int64_t *obj) "v=%p name=%s obj=%p"
 visit_type_size(void *v, const char *name, uint64_t *obj) "v=%p name=%s obj=%p"
+visit_type_time(void *v, const char *name, uint64_t *obj) "v=%p name=%s obj=%p"
 visit_type_bool(void *v, const char *name, bool *obj) "v=%p name=%s obj=%p"
 visit_type_str(void *v, const char *name, char **obj) "v=%p name=%s obj=%p"
 visit_type_number(void *v, const char *name, void *obj) "v=%p name=%s obj=%p"
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index cf0045f34e..210be64909 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -855,6 +855,7 @@ class QAPISchema(object):
                   ('uint32', 'int',     'uint32_t'),
                   ('uint64', 'int',     'uint64_t'),
                   ('size',   'int',     'uint64_t'),
+                  ('time',   'int',     'uint64_t'),
                   ('bool',   'boolean', 'bool'),
                   ('any',    'value',   'QObject' + pointer_suffix),
                   ('null',   'null',    'QNull' + pointer_suffix)]:
-- 
2.20.1


