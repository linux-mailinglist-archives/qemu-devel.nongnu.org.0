Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C64B2153E6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 10:21:58 +0200 (CEST)
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsMNx-0000Di-Fz
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 04:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCd-00022M-CZ
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34641
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCO-0003CZ-LJ
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594022998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViA3UYCJ7XimOivy2yqRED7EAoPtDOYWvVLb874EOME=;
 b=O4q8A2CZ/ewPnbhrgTxKHR7hXp8qWvKgG8VlzIZzbhYVeZbWMnYy3W8xc93Hdsiezv8I7d
 0jINbJJzi/4njVOHmIGc8mo2Q/E+CdVI+Bo5YGaDkhE6zNYPji/jllK9LLwBJANKiFX8kD
 s4yKWz64XKQ5khUSA5bqtBU1NrSoQNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-qXjRhF6mMRGxxqzUQfa_tw-1; Mon, 06 Jul 2020 04:09:57 -0400
X-MC-Unique: qXjRhF6mMRGxxqzUQfa_tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 078D61883614;
 Mon,  6 Jul 2020 08:09:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 847211001268;
 Mon,  6 Jul 2020 08:09:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 04E1011358D1; Mon,  6 Jul 2020 10:09:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/44] qapi: Use returned bool to check for failure,
 manual part
Date: Mon,  6 Jul 2020 10:09:24 +0200
Message-Id: <20200706080950.403087-19-armbru@redhat.com>
In-Reply-To: <20200706080950.403087-1-armbru@redhat.com>
References: <20200706080950.403087-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:22:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit used Coccinelle to convert from checking the Error
object to checking the return value.  Convert a few more manually.
Also tweak control flow in places to conform to the conventional "if
error bail out" pattern.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 accel/kvm/kvm-all.c       | 50 ++++++++++++++++++---------------------
 block/throttle-groups.c   |  5 ++--
 bootdevice.c              |  4 ++--
 hw/core/qdev-properties.c | 12 +++++-----
 hw/ide/qdev.c             |  4 ++--
 hw/mem/nvdimm.c           |  9 +++----
 hw/net/ne2000-isa.c       |  4 ++--
 hw/usb/dev-storage.c      |  4 ++--
 net/net.c                 |  8 ++-----
 9 files changed, 44 insertions(+), 56 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 397669231d..83f03b2018 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3128,37 +3128,33 @@ static void kvm_set_kernel_irqchip(Object *obj, Visitor *v,
                                    const char *name, void *opaque,
                                    Error **errp)
 {
-    Error *err = NULL;
     KVMState *s = KVM_STATE(obj);
     OnOffSplit mode;
 
-    visit_type_OnOffSplit(v, name, &mode, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!visit_type_OnOffSplit(v, name, &mode, errp)) {
         return;
-    } else {
-        switch (mode) {
-        case ON_OFF_SPLIT_ON:
-            s->kernel_irqchip_allowed = true;
-            s->kernel_irqchip_required = true;
-            s->kernel_irqchip_split = ON_OFF_AUTO_OFF;
-            break;
-        case ON_OFF_SPLIT_OFF:
-            s->kernel_irqchip_allowed = false;
-            s->kernel_irqchip_required = false;
-            s->kernel_irqchip_split = ON_OFF_AUTO_OFF;
-            break;
-        case ON_OFF_SPLIT_SPLIT:
-            s->kernel_irqchip_allowed = true;
-            s->kernel_irqchip_required = true;
-            s->kernel_irqchip_split = ON_OFF_AUTO_ON;
-            break;
-        default:
-            /* The value was checked in visit_type_OnOffSplit() above. If
-             * we get here, then something is wrong in QEMU.
-             */
-            abort();
-        }
+    }
+    switch (mode) {
+    case ON_OFF_SPLIT_ON:
+        s->kernel_irqchip_allowed = true;
+        s->kernel_irqchip_required = true;
+        s->kernel_irqchip_split = ON_OFF_AUTO_OFF;
+        break;
+    case ON_OFF_SPLIT_OFF:
+        s->kernel_irqchip_allowed = false;
+        s->kernel_irqchip_required = false;
+        s->kernel_irqchip_split = ON_OFF_AUTO_OFF;
+        break;
+    case ON_OFF_SPLIT_SPLIT:
+        s->kernel_irqchip_allowed = true;
+        s->kernel_irqchip_required = true;
+        s->kernel_irqchip_split = ON_OFF_AUTO_ON;
+        break;
+    default:
+        /* The value was checked in visit_type_OnOffSplit() above. If
+         * we get here, then something is wrong in QEMU.
+         */
+        abort();
     }
 }
 
diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index bb242fde1a..e411051160 100644
--- a/block/throttle-groups.c
+++ b/block/throttle-groups.c
@@ -895,8 +895,8 @@ static void throttle_group_set_limits(Object *obj, Visitor *v,
     ThrottleLimits *argp;
     Error *local_err = NULL;
 
-    if (!visit_type_ThrottleLimits(v, name, &argp, &local_err)) {
-        goto ret;
+    if (!visit_type_ThrottleLimits(v, name, &argp, errp)) {
+        return;
     }
     qemu_mutex_lock(&tg->lock);
     throttle_get_config(&tg->ts, &cfg);
@@ -908,7 +908,6 @@ static void throttle_group_set_limits(Object *obj, Visitor *v,
 
 unlock:
     qemu_mutex_unlock(&tg->lock);
-ret:
     qapi_free_ThrottleLimits(argp);
     error_propagate(errp, local_err);
     return;
diff --git a/bootdevice.c b/bootdevice.c
index fb09d3c668..769f40c77d 100644
--- a/bootdevice.c
+++ b/bootdevice.c
@@ -297,8 +297,8 @@ static void device_set_bootindex(Object *obj, Visitor *v, const char *name,
     int32_t boot_index;
     Error *local_err = NULL;
 
-    if (!visit_type_int32(v, name, &boot_index, &local_err)) {
-        goto out;
+    if (!visit_type_int32(v, name, &boot_index, errp)) {
+        return;
     }
     /* check whether bootindex is present in fw_boot_order list  */
     check_boot_index(boot_index, &local_err);
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index c1a0f910d8..e4dd9ff6b2 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -672,15 +672,15 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
     if (!visit_type_str(v, name, &str, &local_err)) {
         error_free(local_err);
         local_err = NULL;
-        visit_type_int32(v, name, &value, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-        } else if (value < -1 || value > 255) {
+        if (!visit_type_int32(v, name, &value, errp)) {
+            return;
+        }
+        if (value < -1 || value > 255) {
             error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                        name ? name : "null", "pci_devfn");
-        } else {
-            *ptr = value;
+            return;
         }
+        *ptr = value;
         return;
     }
 
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 358f10a92e..ba8b0d7f02 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -245,8 +245,8 @@ static void ide_dev_set_bootindex(Object *obj, Visitor *v, const char *name,
     int32_t boot_index;
     Error *local_err = NULL;
 
-    if (!visit_type_int32(v, name, &boot_index, &local_err)) {
-        goto out;
+    if (!visit_type_int32(v, name, &boot_index, errp)) {
+        return;
     }
     /* check whether bootindex is present in fw_boot_order list  */
     check_boot_index(boot_index, &local_err);
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index ec92ffd415..1fa976c56c 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -85,21 +85,18 @@ static void nvdimm_set_uuid(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     NVDIMMDevice *nvdimm = NVDIMM(obj);
-    Error *local_err = NULL;
     char *value;
 
-    if (!visit_type_str(v, name, &value, &local_err)) {
-        goto out;
+    if (!visit_type_str(v, name, &value, errp)) {
+        return;
     }
 
     if (qemu_uuid_parse(value, &nvdimm->uuid) != 0) {
         error_setg(errp, "Property '%s.%s' has invalid value",
                    object_get_typename(obj), name);
     }
-    g_free(value);
 
-out:
-    error_propagate(errp, local_err);
+    g_free(value);
 }
 
 
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index 765bcd1f0b..0594abd93a 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -113,8 +113,8 @@ static void isa_ne2000_set_bootindex(Object *obj, Visitor *v,
     int32_t boot_index;
     Error *local_err = NULL;
 
-    if (!visit_type_int32(v, name, &boot_index, &local_err)) {
-        goto out;
+    if (!visit_type_int32(v, name, &boot_index, errp)) {
+        return;
     }
     /* check whether bootindex is present in fw_boot_order list  */
     check_boot_index(boot_index, &local_err);
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 1c3bd2578c..721665191e 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -736,8 +736,8 @@ static void usb_msd_set_bootindex(Object *obj, Visitor *v, const char *name,
     int32_t boot_index;
     Error *local_err = NULL;
 
-    if (!visit_type_int32(v, name, &boot_index, &local_err)) {
-        goto out;
+    if (!visit_type_int32(v, name, &boot_index, errp)) {
+        return;
     }
     /* check whether bootindex is present in fw_boot_order list  */
     check_boot_index(boot_index, &local_err);
diff --git a/net/net.c b/net/net.c
index d1130296e1..e1f45d3b36 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1052,7 +1052,6 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
 {
     gchar **substrings = NULL;
     Netdev *object = NULL;
-    Error *err = NULL;
     int ret = -1;
     Visitor *v = opts_visitor_new(opts);
 
@@ -1100,16 +1099,13 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
         qemu_opts_set_id(opts, g_strdup_printf("__org.qemu.net%i", idx++));
     }
 
-    visit_type_Netdev(v, NULL, &object, &err);
-
-    if (!err) {
-        ret = net_client_init1(object, is_netdev, &err);
+    if (visit_type_Netdev(v, NULL, &object, errp)) {
+        ret = net_client_init1(object, is_netdev, errp);
     }
 
     qapi_free_Netdev(object);
 
 out:
-    error_propagate(errp, err);
     g_strfreev(substrings);
     visit_free(v);
     return ret;
-- 
2.26.2


