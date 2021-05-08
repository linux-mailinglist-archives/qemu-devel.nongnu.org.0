Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB6376FE1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 07:55:05 +0200 (CEST)
Received: from localhost ([::1]:42118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfFvc-0003CY-TO
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 01:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lfFuX-0001z5-FI
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:53:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:46725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lfFuV-0004pl-BO
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:53:57 -0400
IronPort-SDR: BU3ya/ZRUgqkvUBW7vJO86WbIbANJ52D00N3fut+FN3HYOAY0ymO3KXupH2K3EmpNUtBYQhHwr
 yLE2XIUDGXGQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="186322595"
X-IronPort-AV: E=Sophos;i="5.82,282,1613462400"; d="scan'208";a="186322595"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 22:53:45 -0700
IronPort-SDR: 8NO9XZmzt7DoTvwAI91n+PIL3SVinrm98jxPBSID6TBlL/L6aTrBpq1kiscdRQE9IZOwKocmMf
 A5Fqu6w0dXQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,282,1613462400"; d="scan'208";a="466375848"
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.108])
 by fmsmga002.fm.intel.com with ESMTP; 07 May 2021 22:53:43 -0700
From: Like Xu <like.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v3 1/2] qdev-properties: Add a new macro to validate bitmask
 for setter
Date: Sat,  8 May 2021 13:52:58 +0800
Message-Id: <20210508055259.128025-1-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=like.xu@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9=3F?= <berrange@redhat.com>,
 Like Xu <like.xu@linux.intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, weijiang.yang@intel.com,
 wei.w.wang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new generic DEFINE_PROP_BITMASK_UINT64 could be used to ensure
that a user-provided property value complies with its bitmask rule
and the default value is recommended to be set in instance_init().

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hw/core/qdev-properties.c    | 19 +++++++++++++++++++
 include/hw/qdev-properties.h | 12 ++++++++++++
 include/qapi/qmp/qerror.h    |  3 +++
 3 files changed, 34 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 50f40949f5..3784d3b30d 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -428,6 +428,25 @@ const PropertyInfo qdev_prop_int64 = {
     .set_default_value = qdev_propinfo_set_default_value_int,
 };
 
+static void set_bitmask_uint64(Object *obj, Visitor *v, const char *name,
+                      void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint64(v, name, ptr, errp);
+
+    if (*ptr & ~prop->bitmask) {
+        error_setg(errp, QERR_INVALID_BITMASK_VALUE, name, prop->bitmask);
+    }
+}
+
+const PropertyInfo qdev_prop_bitmask_uint64 = {
+    .name  = "int64",
+    .get   = get_uint64,
+    .set   = set_bitmask_uint64,
+};
+
 /* --- string --- */
 
 static void release_string(Object *obj, const char *name, void *opaque)
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0ef97d60ce..42f0112e14 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -17,6 +17,7 @@ struct Property {
     const PropertyInfo *info;
     ptrdiff_t    offset;
     uint8_t      bitnr;
+    uint64_t     bitmask;
     bool         set_default;
     union {
         int64_t i;
@@ -53,6 +54,7 @@ extern const PropertyInfo qdev_prop_uint16;
 extern const PropertyInfo qdev_prop_uint32;
 extern const PropertyInfo qdev_prop_int32;
 extern const PropertyInfo qdev_prop_uint64;
+extern const PropertyInfo qdev_prop_bitmask_uint64;
 extern const PropertyInfo qdev_prop_int64;
 extern const PropertyInfo qdev_prop_size;
 extern const PropertyInfo qdev_prop_string;
@@ -102,6 +104,16 @@ extern const PropertyInfo qdev_prop_link;
                 .set_default = true,                         \
                 .defval.u    = (bool)_defval)
 
+/**
+ * The DEFINE_PROP_BITMASK_UINT64 could be used to ensure that
+ * a user-provided value complies with certain bitmask rule and
+ * the default value is recommended to be set in instance_init().
+ */
+#define DEFINE_PROP_BITMASK_UINT64(_name, _state, _field, _bitmask)   \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_bitmask_uint64, uint64_t, \
+                .bitmask    = (_bitmask),                     \
+                .set_default = false)
+
 #define PROP_ARRAY_LEN_PREFIX "len-"
 
 /**
diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 596fce0c54..aab7902760 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -68,4 +68,7 @@
 #define QERR_UNSUPPORTED \
     "this feature or command is not currently supported"
 
+#define QERR_INVALID_BITMASK_VALUE \
+    "the requested value for '%s' violates its bitmask '0x%lx'"
+
 #endif /* QERROR_H */
-- 
2.30.2


