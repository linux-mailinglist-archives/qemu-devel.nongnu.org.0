Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7883C3ADC57
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 04:28:58 +0200 (CEST)
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lunCj-0000dT-Hc
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 22:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lunBs-0007q1-RX
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 22:28:04 -0400
Received: from mga09.intel.com ([134.134.136.24]:35999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lunBp-0000Gx-EF
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 22:28:04 -0400
IronPort-SDR: 35q+K8NY4snHK8wEGqut5CuwEC6Ua6ycheokEC4bBNMTFnRU2i7Qwkmdo4mOTcCb8v5MTtAZkB
 /I/TovcpVZ8A==
X-IronPort-AV: E=McAfee;i="6200,9189,10020"; a="206645989"
X-IronPort-AV: E=Sophos;i="5.83,286,1616482800"; d="scan'208";a="206645989"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 19:27:55 -0700
IronPort-SDR: 4pAXabuFJpfuZZ76hcFnMU3wu05cM0jl++IWFDfSSd3JfyEgenyoD56ARZ6OAEToHbqMFCFMsG
 nnamTfVzRpTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,286,1616482800"; d="scan'208";a="486095352"
Received: from michael-optiplex-9020.sh.intel.com ([10.239.159.182])
 by orsmga001.jf.intel.com with ESMTP; 19 Jun 2021 19:27:53 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 richard.henderson@linaro.org, armbru@redhat.com, wei.w.wang@intel.com
Subject: [PATCH v4 1/2] qdev-properties: Add a new macro with bitmask check
 for uint64_t property
Date: Sun, 20 Jun 2021 10:42:36 +0800
Message-Id: <1624156957-7223-1-git-send-email-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=weijiang.yang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DEFINE_PROP_UINT64_CHECKMASK maro applies certain mask check agaist
user-supplied property value, reject the value if it violates the bitmask.

Co-developed-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 hw/core/qdev-properties.c    | 19 +++++++++++++++++++
 include/hw/qdev-properties.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 50f40949f5..343a200784 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -428,6 +428,25 @@ const PropertyInfo qdev_prop_int64 = {
     .set_default_value = qdev_propinfo_set_default_value_int,
 };
 
+static void set_uint64_checkmask(Object *obj, Visitor *v, const char *name,
+                      void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint64(v, name, ptr, errp);
+    if (*ptr & ~prop->bitmask) {
+        error_setg(errp, "Property value for '%s' violates bitmask '0x%lx'",
+                   name, prop->bitmask);
+    }
+}
+
+const PropertyInfo qdev_prop_uint64_checkmask = {
+    .name  = "uint64",
+    .get   = get_uint64,
+    .set   = set_uint64_checkmask,
+};
+
 /* --- string --- */
 
 static void release_string(Object *obj, const char *name, void *opaque)
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0ef97d60ce..075882e8c1 100644
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
+extern const PropertyInfo qdev_prop_uint64_checkmask;
 extern const PropertyInfo qdev_prop_int64;
 extern const PropertyInfo qdev_prop_size;
 extern const PropertyInfo qdev_prop_string;
@@ -102,6 +104,16 @@ extern const PropertyInfo qdev_prop_link;
                 .set_default = true,                         \
                 .defval.u    = (bool)_defval)
 
+/**
+ * The DEFINE_PROP_UINT64_CHECKMASK macro checks a user-supplied value
+ * against corresponding bitmask, rejects the value if it violates.
+ * The default value is set in instance_init().
+ */
+#define DEFINE_PROP_UINT64_CHECKMASK(_name, _state, _field, _bitmask)   \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_uint64_checkmask, uint64_t, \
+                .bitmask    = (_bitmask),                     \
+                .set_default = false)
+
 #define PROP_ARRAY_LEN_PREFIX "len-"
 
 /**
-- 
2.21.1


