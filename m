Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E302E222A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:38:51 +0100 (CET)
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBqM-0005vI-JN
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfs-0002Sx-45
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfp-0004U3-6f
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JoMLJ7K/d+XvCe0tPdLdPkRKBxL6q9i12Js8/AB4gIM=;
 b=ShjhsLgt8kjl+rvDs7grGdAG9pbDUNgM8CXvDVEN61OSh3V0NCv2qoe3Ang+ZgcUJ2TmOW
 DiCbwnc7KGhYFNiVKFLHyZl0xpqDhhV+LnDWo1SCe5tvC/wxuj5pxx1cEkW7DAW0gN5f0w
 4k6xVjtlYXhnFpCLj9Nwmkar2+iJHFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-Dmoa9px_MLelwXenYib2ZA-1; Wed, 23 Dec 2020 16:27:54 -0500
X-MC-Unique: Dmoa9px_MLelwXenYib2ZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF035801817;
 Wed, 23 Dec 2020 21:27:52 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 389F46E407;
 Wed, 23 Dec 2020 21:27:52 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/15] qdev: Move dev->realized check to qdev_property_set()
Date: Wed, 23 Dec 2020 16:27:29 -0500
Message-Id: <20201223212735.512062-10-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
References: <20201223212735.512062-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Every single qdev property setter function manually checks
dev->realized.  We can just check dev->realized inside
qdev_property_set() instead.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Paul Durrant <paul@xen.org>
Message-Id: <20201211220529.2290218-24-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties-system.c |  70 ----------------------
 hw/core/qdev-properties.c        | 100 ++++++-------------------------
 backends/tpm/tpm_util.c          |   6 --
 hw/block/xen-block.c             |   6 --
 hw/s390x/css.c                   |   6 --
 hw/s390x/s390-pci-bus.c          |   6 --
 hw/vfio/pci-quirks.c             |   6 --
 target/sparc/cpu.c               |   6 --
 8 files changed, 18 insertions(+), 188 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 42529c3b65..f31aea3de1 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -94,11 +94,6 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
     bool blk_created = false;
     int ret;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -230,17 +225,11 @@ static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     CharBackend *be = qdev_get_prop_ptr(obj, prop);
     Chardev *s;
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -311,18 +300,12 @@ static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     MACAddr *mac = qdev_get_prop_ptr(obj, prop);
     int i, pos;
     char *str;
     const char *p;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -390,7 +373,6 @@ static void get_netdev(Object *obj, Visitor *v, const char *name,
 static void set_netdev(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
     NetClientState **ncs = peers_ptr->ncs;
@@ -398,11 +380,6 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
     int queues, err = 0, i = 0;
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -469,18 +446,12 @@ static void get_audiodev(Object *obj, Visitor *v, const char* name,
 static void set_audiodev(Object *obj, Visitor *v, const char* name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
     AudioState *state;
     int err = 0;
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -582,11 +553,6 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
     uint64_t value;
     Error *local_err = NULL;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_size(v, name, &value, errp)) {
         return;
     }
@@ -686,7 +652,6 @@ static void get_reserved_region(Object *obj, Visitor *v, const char *name,
 static void set_reserved_region(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
     Error *local_err = NULL;
@@ -694,11 +659,6 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
     char *str;
     int ret;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_str(v, name, &str, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -754,17 +714,11 @@ const PropertyInfo qdev_prop_reserved_region = {
 static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     int32_t value, *ptr = qdev_get_prop_ptr(obj, prop);
     unsigned int slot, fn, n;
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, NULL)) {
         if (!visit_type_int32(v, name, &value, errp)) {
             return;
@@ -848,7 +802,6 @@ static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
 static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
     char *str, *p;
@@ -857,11 +810,6 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     unsigned long dom = 0, bus = 0;
     unsigned int slot = 0, func = 0;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -972,16 +920,10 @@ static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
 static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
     int speed;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_enum(v, name, &speed, prop->info->enum_table,
                          errp)) {
         return;
@@ -1057,16 +999,10 @@ static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
 static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
     int width;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_enum(v, name, &width, prop->info->enum_table,
                          errp)) {
         return;
@@ -1129,16 +1065,10 @@ static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index b924f13d58..92f48ecbf2 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -24,6 +24,19 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
     }
 }
 
+/* returns: true if property is allowed to be set, false otherwise */
+static bool qdev_prop_allow_set(Object *obj, const char *name,
+                                Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    if (dev->realized) {
+        qdev_prop_set_after_realize(dev, name, errp);
+        return false;
+    }
+    return true;
+}
+
 void qdev_prop_allow_set_link_before_realize(const Object *obj,
                                              const char *name,
                                              Object *val, Error **errp)
@@ -65,6 +78,11 @@ static void field_prop_set(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
     Property *prop = opaque;
+
+    if (!qdev_prop_allow_set(obj, name, errp)) {
+        return;
+    }
+
     return prop->info->set(obj, v, name, opaque, errp);
 }
 
@@ -90,15 +108,9 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
 void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     int *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
 }
 
@@ -148,15 +160,9 @@ static void prop_get_bit(Object *obj, Visitor *v, const char *name,
 static void prop_set_bit(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     bool value;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_bool(v, name, &value, errp)) {
         return;
     }
@@ -208,15 +214,9 @@ static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
 static void prop_set_bit64(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     bool value;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_bool(v, name, &value, errp)) {
         return;
     }
@@ -245,15 +245,9 @@ static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     bool *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_bool(v, name, ptr, errp);
 }
 
@@ -278,15 +272,9 @@ static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_uint8(v, name, ptr, errp);
 }
 
@@ -323,15 +311,9 @@ static void get_uint16(Object *obj, Visitor *v, const char *name,
 static void set_uint16(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_uint16(v, name, ptr, errp);
 }
 
@@ -356,15 +338,9 @@ static void get_uint32(Object *obj, Visitor *v, const char *name,
 static void set_uint32(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_uint32(v, name, ptr, errp);
 }
 
@@ -380,15 +356,9 @@ void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
 static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     int32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_int32(v, name, ptr, errp);
 }
 
@@ -420,15 +390,9 @@ static void get_uint64(Object *obj, Visitor *v, const char *name,
 static void set_uint64(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_uint64(v, name, ptr, errp);
 }
 
@@ -444,15 +408,9 @@ static void get_int64(Object *obj, Visitor *v, const char *name,
 static void set_int64(Object *obj, Visitor *v, const char *name,
                       void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     int64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_int64(v, name, ptr, errp);
 }
 
@@ -495,16 +453,10 @@ static void get_string(Object *obj, Visitor *v, const char *name,
 static void set_string(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     char **ptr = qdev_get_prop_ptr(obj, prop);
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -545,16 +497,10 @@ void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
 static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
                        Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
     uint64_t value;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_size(v, name, &value, errp)) {
         return;
     }
@@ -621,10 +567,6 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
     const char *arrayname;
     int i;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
     if (*alenptr) {
         error_setg(errp, "array size property %s may not be set more than once",
                    name);
@@ -864,15 +806,9 @@ static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_size(v, name, ptr, errp);
 }
 
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index a5d997e7dc..39b45fa46d 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -46,16 +46,10 @@ static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     TPMBackend *s, **be = qdev_get_prop_ptr(obj, prop);
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 905e4acd97..bd1aef63a7 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -395,17 +395,11 @@ static int vbd_name_to_disk(const char *name, const char **endp,
 static void xen_block_set_vdev(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
     char *str, *p;
     const char *end;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 7a44320d12..496e2c5801 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2372,18 +2372,12 @@ static void get_css_devid(Object *obj, Visitor *v, const char *name,
 static void set_css_devid(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
     char *str;
     int num, n1, n2;
     unsigned int cssid, ssid, devid;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 8b6be1197b..30511f620e 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1338,16 +1338,10 @@ static void s390_pci_get_fid(Object *obj, Visitor *v, const char *name,
 static void s390_pci_set_fid(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     S390PCIBusDevice *zpci = S390_PCI_DEVICE(obj);
     Property *prop = opaque;
     uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_uint32(v, name, ptr, errp)) {
         return;
     }
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 53569925a2..802979635c 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1498,15 +1498,9 @@ static void set_nv_gpudirect_clique_id(Object *obj, Visitor *v,
                                        const char *name, void *opaque,
                                        Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint8_t value, *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_uint8(v, name, &value, errp)) {
         return;
     }
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index a1dc0f1be4..d8a8bb1dda 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -798,17 +798,11 @@ static void sparc_get_nwindows(Object *obj, Visitor *v, const char *name,
 static void sparc_set_nwindows(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     const int64_t min = MIN_NWINDOWS;
     const int64_t max = MAX_NWINDOWS;
     SPARCCPU *cpu = SPARC_CPU(obj);
     int64_t value;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_int(v, name, &value, errp)) {
         return;
     }
-- 
2.28.0


