Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E86892BF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:52:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNri0-0008QQ-Gj; Fri, 03 Feb 2023 03:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrho-0008JV-NB
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhk-0007Tn-Qq
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91SVWpG0i9vNS5vtzak70xhDGswwW/hVC0UO6rEoXVs=;
 b=ivk0JYFPjrqjS0finMhAmUNOwMA2u0CIJaRh1AoLpFPpZnZjBPUHIPYcEm6+2Kh4GcdG1S
 9OPBymNUyCMLZ/4cFpNplMsNysDqGJHI6bfrx6jbWrWBw/nwAWG3gnK5lGGQkAP2rvpQRE
 p0Qkv8yUikfxlTRct5DVT9wzZZ5cQs8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-Y679Wj9ANqe9FT5Lqi-bxQ-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: Y679Wj9ANqe9FT5Lqi-bxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A697802D2A;
 Fri,  3 Feb 2023 08:45:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A53FB112132D;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F1DFF21E6880; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 28/35] qdev: Move HMP command completion from monitor to
 softmmu/
Date: Fri,  3 Feb 2023 09:45:42 +0100
Message-Id: <20230203084549.2622302-29-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This moves the completion code from MAINTAINERS sections "Human
Monitor (HMP)" and "QMP" to section "QOM".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-26-armbru@redhat.com>
---
 monitor/misc.c         | 82 ------------------------------------------
 softmmu/qdev-monitor.c | 82 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index a2584df0ca..c76d583b4f 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1206,88 +1206,6 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name)
     return ret;
 }
 
-void device_add_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    GSList *list, *elt;
-    size_t len;
-
-    if (nb_args != 2) {
-        return;
-    }
-
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-    list = elt = object_class_get_list(TYPE_DEVICE, false);
-    while (elt) {
-        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, elt->data,
-                                             TYPE_DEVICE);
-
-        if (dc->user_creatable) {
-            readline_add_completion_of(rs, str,
-                                object_class_get_name(OBJECT_CLASS(dc)));
-        }
-        elt = elt->next;
-    }
-    g_slist_free(list);
-}
-
-static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
-{
-    GSList **list = opaque;
-    DeviceState *dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
-
-    if (dev == NULL) {
-        return 0;
-    }
-
-    if (dev->realized && object_property_get_bool(obj, "hotpluggable", NULL)) {
-        *list = g_slist_append(*list, dev);
-    }
-
-    return 0;
-}
-
-static GSList *qdev_build_hotpluggable_device_list(Object *peripheral)
-{
-    GSList *list = NULL;
-
-    object_child_foreach(peripheral, qdev_add_hotpluggable_device, &list);
-
-    return list;
-}
-
-static void peripheral_device_del_completion(ReadLineState *rs,
-                                             const char *str)
-{
-    Object *peripheral = container_get(qdev_get_machine(), "/peripheral");
-    GSList *list, *item;
-
-    list = qdev_build_hotpluggable_device_list(peripheral);
-    if (!list) {
-        return;
-    }
-
-    for (item = list; item; item = g_slist_next(item)) {
-        DeviceState *dev = item->data;
-
-        if (dev->id) {
-            readline_add_completion_of(rs, str, dev->id);
-        }
-    }
-
-    g_slist_free(list);
-}
-
-void device_del_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    if (nb_args != 2) {
-        return;
-    }
-
-    readline_set_completion_index(rs, strlen(str));
-    peripheral_device_del_completion(rs, str);
-}
-
 static int
 compare_mon_cmd(const void *a, const void *b)
 {
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4b0ef65780..b8d2c4dadd 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -973,6 +973,88 @@ void hmp_device_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+void device_add_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    GSList *list, *elt;
+    size_t len;
+
+    if (nb_args != 2) {
+        return;
+    }
+
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+    list = elt = object_class_get_list(TYPE_DEVICE, false);
+    while (elt) {
+        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, elt->data,
+                                             TYPE_DEVICE);
+
+        if (dc->user_creatable) {
+            readline_add_completion_of(rs, str,
+                                object_class_get_name(OBJECT_CLASS(dc)));
+        }
+        elt = elt->next;
+    }
+    g_slist_free(list);
+}
+
+static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
+{
+    GSList **list = opaque;
+    DeviceState *dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
+
+    if (dev == NULL) {
+        return 0;
+    }
+
+    if (dev->realized && object_property_get_bool(obj, "hotpluggable", NULL)) {
+        *list = g_slist_append(*list, dev);
+    }
+
+    return 0;
+}
+
+static GSList *qdev_build_hotpluggable_device_list(Object *peripheral)
+{
+    GSList *list = NULL;
+
+    object_child_foreach(peripheral, qdev_add_hotpluggable_device, &list);
+
+    return list;
+}
+
+static void peripheral_device_del_completion(ReadLineState *rs,
+                                             const char *str)
+{
+    Object *peripheral = container_get(qdev_get_machine(), "/peripheral");
+    GSList *list, *item;
+
+    list = qdev_build_hotpluggable_device_list(peripheral);
+    if (!list) {
+        return;
+    }
+
+    for (item = list; item; item = g_slist_next(item)) {
+        DeviceState *dev = item->data;
+
+        if (dev->id) {
+            readline_add_completion_of(rs, str, dev->id);
+        }
+    }
+
+    g_slist_free(list);
+}
+
+void device_del_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    if (nb_args != 2) {
+        return;
+    }
+
+    readline_set_completion_index(rs, strlen(str));
+    peripheral_device_del_completion(rs, str);
+}
+
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
 {
     DeviceState *dev;
-- 
2.39.0


