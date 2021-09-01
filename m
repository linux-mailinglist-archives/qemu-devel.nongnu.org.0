Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E73FDDFA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:48:47 +0200 (CEST)
Received: from localhost ([::1]:60926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRXi-0005nY-Ts
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMED-0003YF-Hf
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:17 -0400
Received: from relay.sw.ru ([185.231.240.75]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OR-40
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=nEvjr/rjtMP/YizFqTyiySxe0kGgrUmoFO0GrcTZhZA=; b=ZWbWspGa6Yjp
 PD5QMfsTrndZmdj/MqfC5JAxWVUy8/9BhaFO4Lo1kdzhJl0xH3/lcpalcg0ELJpJUktZnly3Mz6E7
 vr2IIK2mcnbzLUDsY0JmLa08s6tDBgYjLWb1dHkIQIJKbGZP6I36wIZXLwKa0/FY/ipJacUrKtFSP
 1AOCo=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME0-000RwD-Hv; Wed, 01 Sep 2021 12:08:04 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 1/8] qdev-properties: Add read-only 64 bit property
Date: Wed,  1 Sep 2021 12:07:57 +0300
Message-Id: <20210901090804.7139-2-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some situations, we need a property that tracks the bit but
can't change it (for instance, guest features of virtio device).

Signed-off-by: Maxim Davydov <maxim.davydov@virtuozzo.com>
---
 hw/core/qdev-properties.c    | 32 ++++++++++++++++++++++++++++++++
 include/hw/qdev-properties.h |  5 +++++
 2 files changed, 37 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 50f4094..d7b0436 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -231,6 +231,38 @@ const PropertyInfo qdev_prop_bit64 = {
     .set_default_value = set_default_value_bool,
 };
 
+/* Read-only Bit64 */
+
+static void prop_set_read_only_bit64(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    return;
+}
+
+static uint64_t qdev_get_prop_read_only_mask64(Property *prop)
+{
+    assert(prop->info == &qdev_prop_read_only_bit64);
+    return 0x1ull << prop->bitnr;
+}
+
+static void prop_get_read_only_bit64(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *p = object_field_prop_ptr(obj, prop);
+    bool value = (*p & qdev_get_prop_read_only_mask64(prop)) != 0;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+const PropertyInfo qdev_prop_read_only_bit64 = {
+    .name  = "bool",
+    .description = "on/off",
+    .get   = prop_get_read_only_bit64,
+    .set   = prop_set_read_only_bit64,
+    .set_default_value = set_default_value_bool,
+};
+
 /* --- bool --- */
 
 static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0ef97d6..4c4bac7 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -46,6 +46,7 @@ struct PropertyInfo {
 
 extern const PropertyInfo qdev_prop_bit;
 extern const PropertyInfo qdev_prop_bit64;
+extern const PropertyInfo qdev_prop_read_only_bit64;
 extern const PropertyInfo qdev_prop_bool;
 extern const PropertyInfo qdev_prop_enum;
 extern const PropertyInfo qdev_prop_uint8;
@@ -102,6 +103,10 @@ extern const PropertyInfo qdev_prop_link;
                 .set_default = true,                         \
                 .defval.u    = (bool)_defval)
 
+#define DEFINE_PROP_READ_ONLY_BIT64(_name, _state, _field, _bit)            \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_read_only_bit64, uint64_t, \
+                .bitnr = (_bit))
+
 #define PROP_ARRAY_LEN_PREFIX "len-"
 
 /**
-- 
1.8.3.1


