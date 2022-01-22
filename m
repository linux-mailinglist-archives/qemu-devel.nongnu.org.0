Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF11E496B0F
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 09:39:18 +0100 (CET)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBBvZ-0002Wu-P1
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 03:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nBBuE-0000Sb-5e
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 03:37:54 -0500
Received: from mga17.intel.com ([192.55.52.151]:64280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nBBuB-0006dO-PB
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 03:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642840671; x=1674376671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aqdv8MZYaBIeZdcgvu5e2Fh6FIGmCmAW19zWgTGh2xk=;
 b=IRBiK9MUcsDOsp5E4lOUfDhWCL8ilKSSzEuVIdCytbChJPfeLiyEEsI5
 rZr4l7C9jwQ8EYut7yi2scI1joDxAtuyXFjDtPdGPyEBRWr/xVA2lf3hd
 H7uUMLKJRe8LEni9EHke5aRKb8JgjlXSxA04R2/HwDGlgNU1N81YZvdxj
 4WMEekz1E+yQAfDCv3NaIN4DyGt3YzSsKe13whwrYYzb5/BoeUnqSEaYv
 M/kmzH9zEJ8s4SdjQ1Hcn1VTAlQON+tR4rSgukcvCpXsLua0b0492yUWt
 ilfyDxNnrLFKrJb4I9i2OAzbtZ1kEyJ4BbB93X03SR00bf8w8j+zzBbvn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="226481877"
X-IronPort-AV: E=Sophos;i="5.88,307,1635231600"; d="scan'208";a="226481877"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2022 00:37:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,307,1635231600"; d="scan'208";a="765937377"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2022 00:37:44 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 likexu@tencent.com, wei.w.wang@intel.com
Subject: [PATCH v5 1/2] qdev-properties: Add a new macro with bitmask check
 for uint64_t property
Date: Sun, 23 Jan 2022 00:12:00 +0800
Message-Id: <20220122161201.73528-2-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220122161201.73528-1-weijiang.yang@intel.com>
References: <20220122161201.73528-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: weijiang.yang@intel.com, Like Xu <like.xu@linux.intel.com>
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
index c34aac6ebc..27566e5ef7 100644
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
index f7925f67d0..e1df08876c 100644
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
@@ -54,6 +55,7 @@ extern const PropertyInfo qdev_prop_uint16;
 extern const PropertyInfo qdev_prop_uint32;
 extern const PropertyInfo qdev_prop_int32;
 extern const PropertyInfo qdev_prop_uint64;
+extern const PropertyInfo qdev_prop_uint64_checkmask;
 extern const PropertyInfo qdev_prop_int64;
 extern const PropertyInfo qdev_prop_size;
 extern const PropertyInfo qdev_prop_string;
@@ -103,6 +105,16 @@ extern const PropertyInfo qdev_prop_link;
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
2.27.0


