Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4EDDE32
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 13:15:14 +0200 (CEST)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iM9B1-0004LD-E7
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 07:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iM97a-0002dn-8R
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iM97Y-0002xC-Lc
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:63374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iM97Y-0002wA-CK
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 04:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,319,1566889200"; d="scan'208";a="371917551"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga005.jf.intel.com with ESMTP; 20 Oct 2019 04:11:33 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Subject: [PATCH v13 03/12] qapi: Add builtin type time
Date: Sun, 20 Oct 2019 19:11:16 +0800
Message-Id: <20191020111125.27659-4-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191020111125.27659-1-tao3.xu@intel.com>
References: <20191020111125.27659-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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
qemu_strtotime_ps() for pre-converting time suffix to numbers.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v13.
---
 include/qapi/visitor-impl.h  |  4 ++++
 include/qapi/visitor.h       |  9 +++++++++
 qapi/opts-visitor.c          | 22 ++++++++++++++++++++++
 qapi/qapi-visit-core.c       | 12 ++++++++++++
 qapi/qobject-input-visitor.c | 18 ++++++++++++++++++
 qapi/trace-events            |  1 +
 scripts/qapi/common.py       |  1 +
 7 files changed, 67 insertions(+)

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
index c5b23851a1..62565f4cb5 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -554,6 +554,15 @@ void visit_type_int64(Visitor *v, const char *name, int64_t *obj,
 void visit_type_size(Visitor *v, const char *name, uint64_t *obj,
                      Error **errp);
 
+/*
+ * Visit a uint64_t value.
+ * Like visit_type_uint64(), except that some visitors may choose to
+ * recognize numbers with timeunit suffix, such as "ps", "ns", "us"
+ * "ms" and "s".
+ */
+void visit_type_time(Visitor *v, const char *name, uint64_t *obj,
+                     Error **errp);
+
 /*
  * Visit a boolean value.
  *
diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 5fe0276c1c..e289c63b52 100644
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
+    err = qemu_strtotime_ps(opt->str ? opt->str : "", NULL, obj);
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
index 32236cbcb1..9b66941d8a 100644
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
+    if (qemu_strtotime_ps(str, NULL, obj) < 0) {
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
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index d6e00c80ea..20c47bae95 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1822,6 +1822,7 @@ class QAPISchema(object):
                   ('uint32', 'int',     'uint32_t'),
                   ('uint64', 'int',     'uint64_t'),
                   ('size',   'int',     'uint64_t'),
+                  ('time',   'int',     'uint64_t'),
                   ('bool',   'boolean', 'bool'),
                   ('any',    'value',   'QObject' + pointer_suffix),
                   ('null',   'null',    'QNull' + pointer_suffix)]:
-- 
2.20.1


