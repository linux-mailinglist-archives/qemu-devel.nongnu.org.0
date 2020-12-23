Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9082E2228
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:37:03 +0100 (CET)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBoc-000345-BN
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBg3-0002sF-2F
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfz-0004YZ-Vw
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNM7q9qXxBFvhO5oPO21Qt72C9si51yQjeJMJ2Pt1EM=;
 b=AFan8BLggd2aVjk+at56VFjfvy81ffj6h9QbS9ZA7sqQSiO3SmWqiw26gTjj8QFBm4Vyvr
 tcAkynSk5gvRqeBz8gYSNwLiIfI1wu/sCCCbKgUUKqvNnHIJgHZVuYYbZlOsjf08SQqLqR
 YDnh6lEFO7FwIyMREmGD5g+bQQQENyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-ame75Gg3M1eq-EMmNOkgmg-1; Wed, 23 Dec 2020 16:28:02 -0500
X-MC-Unique: ame75Gg3M1eq-EMmNOkgmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A341005513;
 Wed, 23 Dec 2020 21:28:01 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36D6C10013C1;
 Wed, 23 Dec 2020 21:28:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/15] qdev: Rename qdev_get_prop_ptr() to
 object_field_prop_ptr()
Date: Wed, 23 Dec 2020 16:27:33 -0500
Message-Id: <20201223212735.512062-14-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
References: <20201223212735.512062-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The function will be moved to common QOM code, as it is not
specific to TYPE_DEVICE anymore.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Paul Durrant <paul@xen.org>
Message-Id: <20201211220529.2290218-31-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties-system.c | 50 +++++++++++++-------------
 hw/core/qdev-properties.c        | 60 ++++++++++++++++----------------
 include/hw/qdev-properties.h     |  2 +-
 backends/tpm/tpm_util.c          |  6 ++--
 hw/block/xen-block.c             |  4 +--
 hw/s390x/css.c                   |  4 +--
 hw/s390x/s390-pci-bus.c          |  4 +--
 hw/vfio/pci-quirks.c             |  4 +--
 8 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index f31aea3de1..2760c21f11 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -62,7 +62,7 @@ static void get_drive(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
     Property *prop = opaque;
-    void **ptr = qdev_get_prop_ptr(obj, prop);
+    void **ptr = object_field_prop_ptr(obj, prop);
     const char *value;
     char *p;
 
@@ -88,7 +88,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    void **ptr = qdev_get_prop_ptr(obj, prop);
+    void **ptr = object_field_prop_ptr(obj, prop);
     char *str;
     BlockBackend *blk;
     bool blk_created = false;
@@ -181,7 +181,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    BlockBackend **ptr = qdev_get_prop_ptr(obj, prop);
+    BlockBackend **ptr = object_field_prop_ptr(obj, prop);
 
     if (*ptr) {
         AioContext *ctx = blk_get_aio_context(*ptr);
@@ -214,7 +214,7 @@ const PropertyInfo qdev_prop_drive_iothread = {
 static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    CharBackend *be = qdev_get_prop_ptr(obj, opaque);
+    CharBackend *be = object_field_prop_ptr(obj, opaque);
     char *p;
 
     p = g_strdup(be->chr && be->chr->label ? be->chr->label : "");
@@ -226,7 +226,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
     Property *prop = opaque;
-    CharBackend *be = qdev_get_prop_ptr(obj, prop);
+    CharBackend *be = object_field_prop_ptr(obj, prop);
     Chardev *s;
     char *str;
 
@@ -262,7 +262,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 static void release_chr(Object *obj, const char *name, void *opaque)
 {
     Property *prop = opaque;
-    CharBackend *be = qdev_get_prop_ptr(obj, prop);
+    CharBackend *be = object_field_prop_ptr(obj, prop);
 
     qemu_chr_fe_deinit(be, false);
 }
@@ -286,7 +286,7 @@ static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
     Property *prop = opaque;
-    MACAddr *mac = qdev_get_prop_ptr(obj, prop);
+    MACAddr *mac = object_field_prop_ptr(obj, prop);
     char buffer[2 * 6 + 5 + 1];
     char *p = buffer;
 
@@ -301,7 +301,7 @@ static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
     Property *prop = opaque;
-    MACAddr *mac = qdev_get_prop_ptr(obj, prop);
+    MACAddr *mac = object_field_prop_ptr(obj, prop);
     int i, pos;
     char *str;
     const char *p;
@@ -363,7 +363,7 @@ static void get_netdev(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
+    NICPeers *peers_ptr = object_field_prop_ptr(obj, prop);
     char *p = g_strdup(peers_ptr->ncs[0] ? peers_ptr->ncs[0]->name : "");
 
     visit_type_str(v, name, &p, errp);
@@ -374,7 +374,7 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
+    NICPeers *peers_ptr = object_field_prop_ptr(obj, prop);
     NetClientState **ncs = peers_ptr->ncs;
     NetClientState *peers[MAX_QUEUE_NUM];
     int queues, err = 0, i = 0;
@@ -436,7 +436,7 @@ static void get_audiodev(Object *obj, Visitor *v, const char* name,
                          void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
+    QEMUSoundCard *card = object_field_prop_ptr(obj, prop);
     char *p = g_strdup(audio_get_id(card));
 
     visit_type_str(v, name, &p, errp);
@@ -447,7 +447,7 @@ static void set_audiodev(Object *obj, Visitor *v, const char* name,
                          void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
+    QEMUSoundCard *card = object_field_prop_ptr(obj, prop);
     AudioState *state;
     int err = 0;
     char *str;
@@ -549,7 +549,7 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
     uint64_t value;
     Error *local_err = NULL;
 
@@ -637,7 +637,7 @@ static void get_reserved_region(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
+    ReservedRegion *rr = object_field_prop_ptr(obj, prop);
     char buffer[64];
     char *p = buffer;
     int rc;
@@ -653,7 +653,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
+    ReservedRegion *rr = object_field_prop_ptr(obj, prop);
     Error *local_err = NULL;
     const char *endptr;
     char *str;
@@ -715,7 +715,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    int32_t value, *ptr = qdev_get_prop_ptr(obj, prop);
+    int32_t value, *ptr = object_field_prop_ptr(obj, prop);
     unsigned int slot, fn, n;
     char *str;
 
@@ -753,7 +753,7 @@ invalid:
 static int print_pci_devfn(Object *obj, Property *prop, char *dest,
                            size_t len)
 {
-    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    int32_t *ptr = object_field_prop_ptr(obj, prop);
 
     if (*ptr == -1) {
         return snprintf(dest, len, "<unset>");
@@ -777,7 +777,7 @@ static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
+    PCIHostDeviceAddress *addr = object_field_prop_ptr(obj, prop);
     char buffer[] = "ffff:ff:ff.f";
     char *p = buffer;
     int rc = 0;
@@ -803,7 +803,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
+    PCIHostDeviceAddress *addr = object_field_prop_ptr(obj, prop);
     char *str, *p;
     char *e;
     unsigned long val;
@@ -893,7 +893,7 @@ static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
+    PCIExpLinkSpeed *p = object_field_prop_ptr(obj, prop);
     int speed;
 
     switch (*p) {
@@ -921,7 +921,7 @@ static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
+    PCIExpLinkSpeed *p = object_field_prop_ptr(obj, prop);
     int speed;
 
     if (!visit_type_enum(v, name, &speed, prop->info->enum_table,
@@ -963,7 +963,7 @@ static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
+    PCIExpLinkWidth *p = object_field_prop_ptr(obj, prop);
     int width;
 
     switch (*p) {
@@ -1000,7 +1000,7 @@ static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
+    PCIExpLinkWidth *p = object_field_prop_ptr(obj, prop);
     int width;
 
     if (!visit_type_enum(v, name, &width, prop->info->enum_table,
@@ -1051,7 +1051,7 @@ static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
     Property *prop = opaque;
-    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
+    QemuUUID *uuid = object_field_prop_ptr(obj, prop);
     char buffer[UUID_FMT_LEN + 1];
     char *p = buffer;
 
@@ -1066,7 +1066,7 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
     Property *prop = opaque;
-    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
+    QemuUUID *uuid = object_field_prop_ptr(obj, prop);
     char *str;
 
     if (!visit_type_str(v, name, &str, errp)) {
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 2946cdf56d..f3bbf05465 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -50,7 +50,7 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
     }
 }
 
-void *qdev_get_prop_ptr(Object *obj, Property *prop)
+void *object_field_prop_ptr(Object *obj, Property *prop)
 {
     void *ptr = obj;
     ptr += prop->offset;
@@ -100,7 +100,7 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    int *ptr = qdev_get_prop_ptr(obj, prop);
+    int *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
 }
@@ -109,7 +109,7 @@ void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    int *ptr = qdev_get_prop_ptr(obj, prop);
+    int *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
 }
@@ -138,7 +138,7 @@ static uint32_t qdev_get_prop_mask(Property *prop)
 
 static void bit_prop_set(Object *obj, Property *props, bool val)
 {
-    uint32_t *p = qdev_get_prop_ptr(obj, props);
+    uint32_t *p = object_field_prop_ptr(obj, props);
     uint32_t mask = qdev_get_prop_mask(props);
     if (val) {
         *p |= mask;
@@ -151,7 +151,7 @@ static void prop_get_bit(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint32_t *p = qdev_get_prop_ptr(obj, prop);
+    uint32_t *p = object_field_prop_ptr(obj, prop);
     bool value = (*p & qdev_get_prop_mask(prop)) != 0;
 
     visit_type_bool(v, name, &value, errp);
@@ -192,7 +192,7 @@ static uint64_t qdev_get_prop_mask64(Property *prop)
 
 static void bit64_prop_set(Object *obj, Property *props, bool val)
 {
-    uint64_t *p = qdev_get_prop_ptr(obj, props);
+    uint64_t *p = object_field_prop_ptr(obj, props);
     uint64_t mask = qdev_get_prop_mask64(props);
     if (val) {
         *p |= mask;
@@ -205,7 +205,7 @@ static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint64_t *p = qdev_get_prop_ptr(obj, prop);
+    uint64_t *p = object_field_prop_ptr(obj, prop);
     bool value = (*p & qdev_get_prop_mask64(prop)) != 0;
 
     visit_type_bool(v, name, &value, errp);
@@ -237,7 +237,7 @@ static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
     Property *prop = opaque;
-    bool *ptr = qdev_get_prop_ptr(obj, prop);
+    bool *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_bool(v, name, ptr, errp);
 }
@@ -246,7 +246,7 @@ static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
     Property *prop = opaque;
-    bool *ptr = qdev_get_prop_ptr(obj, prop);
+    bool *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_bool(v, name, ptr, errp);
 }
@@ -264,7 +264,7 @@ static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint8_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
@@ -273,7 +273,7 @@ static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint8_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
@@ -303,7 +303,7 @@ static void get_uint16(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint16_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint16(v, name, ptr, errp);
 }
@@ -312,7 +312,7 @@ static void set_uint16(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint16_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint16(v, name, ptr, errp);
 }
@@ -330,7 +330,7 @@ static void get_uint32(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
@@ -339,7 +339,7 @@ static void set_uint32(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
@@ -348,7 +348,7 @@ void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    int32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_int32(v, name, ptr, errp);
 }
@@ -357,7 +357,7 @@ static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
     Property *prop = opaque;
-    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    int32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_int32(v, name, ptr, errp);
 }
@@ -382,7 +382,7 @@ static void get_uint64(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint64(v, name, ptr, errp);
 }
@@ -391,7 +391,7 @@ static void set_uint64(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint64(v, name, ptr, errp);
 }
@@ -400,7 +400,7 @@ static void get_int64(Object *obj, Visitor *v, const char *name,
                       void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    int64_t *ptr = qdev_get_prop_ptr(obj, prop);
+    int64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_int64(v, name, ptr, errp);
 }
@@ -409,7 +409,7 @@ static void set_int64(Object *obj, Visitor *v, const char *name,
                       void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    int64_t *ptr = qdev_get_prop_ptr(obj, prop);
+    int64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_int64(v, name, ptr, errp);
 }
@@ -433,14 +433,14 @@ const PropertyInfo qdev_prop_int64 = {
 static void release_string(Object *obj, const char *name, void *opaque)
 {
     Property *prop = opaque;
-    g_free(*(char **)qdev_get_prop_ptr(obj, prop));
+    g_free(*(char **)object_field_prop_ptr(obj, prop));
 }
 
 static void get_string(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    char **ptr = qdev_get_prop_ptr(obj, prop);
+    char **ptr = object_field_prop_ptr(obj, prop);
 
     if (!*ptr) {
         char *str = (char *)"";
@@ -454,7 +454,7 @@ static void set_string(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    char **ptr = qdev_get_prop_ptr(obj, prop);
+    char **ptr = object_field_prop_ptr(obj, prop);
     char *str;
 
     if (!visit_type_str(v, name, &str, errp)) {
@@ -488,7 +488,7 @@ void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
     uint64_t value = *ptr;
 
     visit_type_size(v, name, &value, errp);
@@ -498,7 +498,7 @@ static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
                        Error **errp)
 {
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
     uint64_t value;
 
     if (!visit_type_size(v, name, &value, errp)) {
@@ -561,7 +561,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
      */
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *alenptr = qdev_get_prop_ptr(obj, prop);
+    uint32_t *alenptr = object_field_prop_ptr(obj, prop);
     void **arrayptr = (void *)dev + prop->arrayoffset;
     void *eltptr;
     const char *arrayname;
@@ -603,7 +603,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
          * being inside the device struct.
          */
         arrayprop->prop.offset = eltptr - (void *)dev;
-        assert(qdev_get_prop_ptr(obj, &arrayprop->prop) == eltptr);
+        assert(object_field_prop_ptr(obj, &arrayprop->prop) == eltptr);
         object_property_add(obj, propname,
                             arrayprop->prop.info->name,
                             field_prop_getter(arrayprop->prop.info),
@@ -798,7 +798,7 @@ static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_size(v, name, ptr, errp);
 }
@@ -807,7 +807,7 @@ static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_size(v, name, ptr, errp);
 }
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 68e544708b..0ef97d60ce 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -193,7 +193,7 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 
-void *qdev_get_prop_ptr(Object *obj, Property *prop);
+void *object_field_prop_ptr(Object *obj, Property *prop);
 
 void qdev_prop_register_global(GlobalProperty *prop);
 const GlobalProperty *qdev_find_global_prop(Object *obj,
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index 39b45fa46d..a6e6d3e72f 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -35,7 +35,7 @@
 static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    TPMBackend **be = qdev_get_prop_ptr(obj, opaque);
+    TPMBackend **be = object_field_prop_ptr(obj, opaque);
     char *p;
 
     p = g_strdup(*be ? (*be)->id : "");
@@ -47,7 +47,7 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
     Property *prop = opaque;
-    TPMBackend *s, **be = qdev_get_prop_ptr(obj, prop);
+    TPMBackend *s, **be = object_field_prop_ptr(obj, prop);
     char *str;
 
     if (!visit_type_str(v, name, &str, errp)) {
@@ -67,7 +67,7 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
 static void release_tpm(Object *obj, const char *name, void *opaque)
 {
     Property *prop = opaque;
-    TPMBackend **be = qdev_get_prop_ptr(obj, prop);
+    TPMBackend **be = object_field_prop_ptr(obj, prop);
 
     if (*be) {
         tpm_backend_reset(*be);
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index bd1aef63a7..718d886e5c 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -336,7 +336,7 @@ static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
+    XenBlockVdev *vdev = object_field_prop_ptr(obj, prop);
     char *str;
 
     switch (vdev->type) {
@@ -396,7 +396,7 @@ static void xen_block_set_vdev(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
+    XenBlockVdev *vdev = object_field_prop_ptr(obj, prop);
     char *str, *p;
     const char *end;
 
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 496e2c5801..fe47751df4 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2344,7 +2344,7 @@ static void get_css_devid(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
+    CssDevId *dev_id = object_field_prop_ptr(obj, prop);
     char buffer[] = "xx.x.xxxx";
     char *p = buffer;
     int r;
@@ -2373,7 +2373,7 @@ static void set_css_devid(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
+    CssDevId *dev_id = object_field_prop_ptr(obj, prop);
     char *str;
     int num, n1, n2;
     unsigned int cssid, ssid, devid;
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 30511f620e..dd138dae94 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1330,7 +1330,7 @@ static void s390_pci_get_fid(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
@@ -1340,7 +1340,7 @@ static void s390_pci_set_fid(Object *obj, Visitor *v, const char *name,
 {
     S390PCIBusDevice *zpci = S390_PCI_DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
 
     if (!visit_type_uint32(v, name, ptr, errp)) {
         return;
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 802979635c..fc8d63c850 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1489,7 +1489,7 @@ static void get_nv_gpudirect_clique_id(Object *obj, Visitor *v,
                                        Error **errp)
 {
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
+    uint8_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
@@ -1499,7 +1499,7 @@ static void set_nv_gpudirect_clique_id(Object *obj, Visitor *v,
                                        Error **errp)
 {
     Property *prop = opaque;
-    uint8_t value, *ptr = qdev_get_prop_ptr(obj, prop);
+    uint8_t value, *ptr = object_field_prop_ptr(obj, prop);
 
     if (!visit_type_uint8(v, name, &value, errp)) {
         return;
-- 
2.28.0


