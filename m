Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA002D81BB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:15:51 +0100 (CET)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knqha-0007ya-4U
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqYS-0001zC-V0
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:06:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqYN-0006Nv-EQ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJe/QLookReovEWCweH6zzebkyNL6c/FJv8O55OglUc=;
 b=MoaxH5iX+Bu8BkYmJlhmk7VuB2ZGjFtrYilecMwHMUJ71ftVp8ZuvHKyvq01Bk6mdvXxXa
 fGZ4WrJssB6vPbKhXuaqoWMuirg11Kwa+DXkfVYXJ+jFITuzf3hvlBncopXAddST+rCBUm
 93uzUskPRo3y6eIJfMoE5QFUW3iEpZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-SvvGBz7CO8qmThcdqBMh3g-1; Fri, 11 Dec 2020 17:06:17 -0500
X-MC-Unique: SvvGBz7CO8qmThcdqBMh3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9442119251A1;
 Fri, 11 Dec 2020 22:06:14 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D346B19C78;
 Fri, 11 Dec 2020 22:06:06 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/32] qdev: Make qdev_get_prop_ptr() get Object* arg
Date: Fri, 11 Dec 2020 17:05:06 -0500
Message-Id: <20201211220529.2290218-10-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-1-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the code more generic and not specific to TYPE_DEVICE.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com> #s390 parts
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
- Fix build error with CONFIG_XEN
  I took the liberty of keeping the Reviewed-by line from
  Marc-André as the build fix is a trivial one line change
---
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 include/hw/qdev-properties.h     |  2 +-
 backends/tpm/tpm_util.c          |  8 ++--
 hw/block/xen-block.c             |  5 +-
 hw/core/qdev-properties-system.c | 57 +++++++++-------------
 hw/core/qdev-properties.c        | 82 +++++++++++++-------------------
 hw/s390x/css.c                   |  5 +-
 hw/s390x/s390-pci-bus.c          |  4 +-
 hw/vfio/pci-quirks.c             |  5 +-
 8 files changed, 68 insertions(+), 100 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0ea822e6a7..0b92cfc761 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -302,7 +302,7 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 
-void *qdev_get_prop_ptr(DeviceState *dev, Property *prop);
+void *qdev_get_prop_ptr(Object *obj, Property *prop);
 
 void qdev_prop_register_global(GlobalProperty *prop);
 const GlobalProperty *qdev_find_global_prop(DeviceState *dev,
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index e6aeb63587..3973105658 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -35,8 +35,7 @@
 static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
-    TPMBackend **be = qdev_get_prop_ptr(dev, opaque);
+    TPMBackend **be = qdev_get_prop_ptr(obj, opaque);
     char *p;
 
     p = g_strdup(*be ? (*be)->id : "");
@@ -49,7 +48,7 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    TPMBackend *s, **be = qdev_get_prop_ptr(dev, prop);
+    TPMBackend *s, **be = qdev_get_prop_ptr(obj, prop);
     char *str;
 
     if (dev->realized) {
@@ -73,9 +72,8 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
 
 static void release_tpm(Object *obj, const char *name, void *opaque)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    TPMBackend **be = qdev_get_prop_ptr(dev, prop);
+    TPMBackend **be = qdev_get_prop_ptr(obj, prop);
 
     if (*be) {
         tpm_backend_reset(*be);
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 8a7a3f5452..905e4acd97 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -335,9 +335,8 @@ static char *disk_to_vbd_name(unsigned int disk)
 static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    XenBlockVdev *vdev = qdev_get_prop_ptr(dev, prop);
+    XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
     char *str;
 
     switch (vdev->type) {
@@ -398,7 +397,7 @@ static void xen_block_set_vdev(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    XenBlockVdev *vdev = qdev_get_prop_ptr(dev, prop);
+    XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
     char *str, *p;
     const char *end;
 
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 77b31eb9dc..9ac9b95852 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -59,9 +59,8 @@ static bool check_prop_still_unset(DeviceState *dev, const char *name,
 static void get_drive(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    void **ptr = qdev_get_prop_ptr(dev, prop);
+    void **ptr = qdev_get_prop_ptr(obj, prop);
     const char *value;
     char *p;
 
@@ -87,7 +86,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    void **ptr = qdev_get_prop_ptr(dev, prop);
+    void **ptr = qdev_get_prop_ptr(obj, prop);
     char *str;
     BlockBackend *blk;
     bool blk_created = false;
@@ -185,7 +184,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    BlockBackend **ptr = qdev_get_prop_ptr(dev, prop);
+    BlockBackend **ptr = qdev_get_prop_ptr(obj, prop);
 
     if (*ptr) {
         AioContext *ctx = blk_get_aio_context(*ptr);
@@ -218,8 +217,7 @@ const PropertyInfo qdev_prop_drive_iothread = {
 static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
-    CharBackend *be = qdev_get_prop_ptr(dev, opaque);
+    CharBackend *be = qdev_get_prop_ptr(obj, opaque);
     char *p;
 
     p = g_strdup(be->chr && be->chr->label ? be->chr->label : "");
@@ -232,7 +230,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    CharBackend *be = qdev_get_prop_ptr(dev, prop);
+    CharBackend *be = qdev_get_prop_ptr(obj, prop);
     Chardev *s;
     char *str;
 
@@ -272,9 +270,8 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 
 static void release_chr(Object *obj, const char *name, void *opaque)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    CharBackend *be = qdev_get_prop_ptr(dev, prop);
+    CharBackend *be = qdev_get_prop_ptr(obj, prop);
 
     qemu_chr_fe_deinit(be, false);
 }
@@ -297,9 +294,8 @@ const PropertyInfo qdev_prop_chr = {
 static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    MACAddr *mac = qdev_get_prop_ptr(dev, prop);
+    MACAddr *mac = qdev_get_prop_ptr(obj, prop);
     char buffer[2 * 6 + 5 + 1];
     char *p = buffer;
 
@@ -315,7 +311,7 @@ static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    MACAddr *mac = qdev_get_prop_ptr(dev, prop);
+    MACAddr *mac = qdev_get_prop_ptr(obj, prop);
     int i, pos;
     char *str;
     const char *p;
@@ -381,9 +377,8 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
 static void get_netdev(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    NICPeers *peers_ptr = qdev_get_prop_ptr(dev, prop);
+    NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
     char *p = g_strdup(peers_ptr->ncs[0] ? peers_ptr->ncs[0]->name : "");
 
     visit_type_str(v, name, &p, errp);
@@ -395,7 +390,7 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    NICPeers *peers_ptr = qdev_get_prop_ptr(dev, prop);
+    NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
     NetClientState **ncs = peers_ptr->ncs;
     NetClientState *peers[MAX_QUEUE_NUM];
     int queues, err = 0, i = 0;
@@ -461,9 +456,8 @@ const PropertyInfo qdev_prop_netdev = {
 static void get_audiodev(Object *obj, Visitor *v, const char* name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    QEMUSoundCard *card = qdev_get_prop_ptr(dev, prop);
+    QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
     char *p = g_strdup(audio_get_id(card));
 
     visit_type_str(v, name, &p, errp);
@@ -475,7 +469,7 @@ static void set_audiodev(Object *obj, Visitor *v, const char* name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    QEMUSoundCard *card = qdev_get_prop_ptr(dev, prop);
+    QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
     AudioState *state;
     int err = 0;
     char *str;
@@ -582,7 +576,7 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
     uint64_t value;
     Error *local_err = NULL;
 
@@ -674,9 +668,8 @@ const PropertyInfo qdev_prop_multifd_compression = {
 static void get_reserved_region(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    ReservedRegion *rr = qdev_get_prop_ptr(dev, prop);
+    ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
     char buffer[64];
     char *p = buffer;
     int rc;
@@ -693,7 +686,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    ReservedRegion *rr = qdev_get_prop_ptr(dev, prop);
+    ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
     Error *local_err = NULL;
     const char *endptr;
     char *str;
@@ -761,7 +754,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int32_t value, *ptr = qdev_get_prop_ptr(dev, prop);
+    int32_t value, *ptr = qdev_get_prop_ptr(obj, prop);
     unsigned int slot, fn, n;
     char *str;
 
@@ -804,8 +797,7 @@ invalid:
 static int print_pci_devfn(Object *obj, Property *prop, char *dest,
                            size_t len)
 {
-    DeviceState *dev = DEVICE(obj);
-    int32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (*ptr == -1) {
         return snprintf(dest, len, "<unset>");
@@ -828,9 +820,8 @@ const PropertyInfo qdev_prop_pci_devfn = {
 static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
+    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
     char buffer[] = "ffff:ff:ff.f";
     char *p = buffer;
     int rc = 0;
@@ -857,7 +848,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
+    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
     char *str, *p;
     char *e;
     unsigned long val;
@@ -951,9 +942,8 @@ const PropertyInfo qdev_prop_off_auto_pcibar = {
 static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIExpLinkSpeed *p = qdev_get_prop_ptr(dev, prop);
+    PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
     int speed;
 
     switch (*p) {
@@ -982,7 +972,7 @@ static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIExpLinkSpeed *p = qdev_get_prop_ptr(dev, prop);
+    PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
     int speed;
 
     if (dev->realized) {
@@ -1028,9 +1018,8 @@ const PropertyInfo qdev_prop_pcie_link_speed = {
 static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIExpLinkWidth *p = qdev_get_prop_ptr(dev, prop);
+    PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
     int width;
 
     switch (*p) {
@@ -1068,7 +1057,7 @@ static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIExpLinkWidth *p = qdev_get_prop_ptr(dev, prop);
+    PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
     int width;
 
     if (dev->realized) {
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 3a4638f4de..0a54a922c8 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -38,9 +38,9 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
     }
 }
 
-void *qdev_get_prop_ptr(DeviceState *dev, Property *prop)
+void *qdev_get_prop_ptr(Object *obj, Property *prop)
 {
-    void *ptr = dev;
+    void *ptr = obj;
     ptr += prop->offset;
     return ptr;
 }
@@ -48,9 +48,8 @@ void *qdev_get_prop_ptr(DeviceState *dev, Property *prop)
 void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int *ptr = qdev_get_prop_ptr(dev, prop);
+    int *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
 }
@@ -60,7 +59,7 @@ void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int *ptr = qdev_get_prop_ptr(dev, prop);
+    int *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -94,8 +93,7 @@ static uint32_t qdev_get_prop_mask(Property *prop)
 
 static void bit_prop_set(Object *obj, Property *props, bool val)
 {
-    DeviceState *dev = DEVICE(obj);
-    uint32_t *p = qdev_get_prop_ptr(dev, props);
+    uint32_t *p = qdev_get_prop_ptr(obj, props);
     uint32_t mask = qdev_get_prop_mask(props);
     if (val) {
         *p |= mask;
@@ -107,9 +105,8 @@ static void bit_prop_set(Object *obj, Property *props, bool val)
 static void prop_get_bit(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *p = qdev_get_prop_ptr(dev, prop);
+    uint32_t *p = qdev_get_prop_ptr(obj, prop);
     bool value = (*p & qdev_get_prop_mask(prop)) != 0;
 
     visit_type_bool(v, name, &value, errp);
@@ -156,8 +153,7 @@ static uint64_t qdev_get_prop_mask64(Property *prop)
 
 static void bit64_prop_set(Object *obj, Property *props, bool val)
 {
-    DeviceState *dev = DEVICE(obj);
-    uint64_t *p = qdev_get_prop_ptr(dev, props);
+    uint64_t *p = qdev_get_prop_ptr(obj, props);
     uint64_t mask = qdev_get_prop_mask64(props);
     if (val) {
         *p |= mask;
@@ -169,9 +165,8 @@ static void bit64_prop_set(Object *obj, Property *props, bool val)
 static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *p = qdev_get_prop_ptr(dev, prop);
+    uint64_t *p = qdev_get_prop_ptr(obj, prop);
     bool value = (*p & qdev_get_prop_mask64(prop)) != 0;
 
     visit_type_bool(v, name, &value, errp);
@@ -208,9 +203,8 @@ const PropertyInfo qdev_prop_bit64 = {
 static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    bool *ptr = qdev_get_prop_ptr(dev, prop);
+    bool *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_bool(v, name, ptr, errp);
 }
@@ -220,7 +214,7 @@ static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    bool *ptr = qdev_get_prop_ptr(dev, prop);
+    bool *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -242,9 +236,8 @@ const PropertyInfo qdev_prop_bool = {
 static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
@@ -254,7 +247,7 @@ static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -288,9 +281,8 @@ const PropertyInfo qdev_prop_uint8 = {
 void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint16_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint16(v, name, ptr, errp);
 }
@@ -300,7 +292,7 @@ static void set_uint16(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint16_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -322,9 +314,8 @@ const PropertyInfo qdev_prop_uint16 = {
 static void get_uint32(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
@@ -334,7 +325,7 @@ static void set_uint32(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -347,9 +338,8 @@ static void set_uint32(Object *obj, Visitor *v, const char *name,
 void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_int32(v, name, ptr, errp);
 }
@@ -359,7 +349,7 @@ static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -388,9 +378,8 @@ const PropertyInfo qdev_prop_int32 = {
 static void get_uint64(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint64(v, name, ptr, errp);
 }
@@ -400,7 +389,7 @@ static void set_uint64(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -413,9 +402,8 @@ static void set_uint64(Object *obj, Visitor *v, const char *name,
 static void get_int64(Object *obj, Visitor *v, const char *name,
                       void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_int64(v, name, ptr, errp);
 }
@@ -425,7 +413,7 @@ static void set_int64(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -454,15 +442,14 @@ const PropertyInfo qdev_prop_int64 = {
 static void release_string(Object *obj, const char *name, void *opaque)
 {
     Property *prop = opaque;
-    g_free(*(char **)qdev_get_prop_ptr(DEVICE(obj), prop));
+    g_free(*(char **)qdev_get_prop_ptr(obj, prop));
 }
 
 static void get_string(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    char **ptr = qdev_get_prop_ptr(dev, prop);
+    char **ptr = qdev_get_prop_ptr(obj, prop);
 
     if (!*ptr) {
         char *str = (char *)"";
@@ -477,7 +464,7 @@ static void set_string(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    char **ptr = qdev_get_prop_ptr(dev, prop);
+    char **ptr = qdev_get_prop_ptr(obj, prop);
     char *str;
 
     if (dev->realized) {
@@ -515,9 +502,8 @@ const PropertyInfo qdev_prop_on_off_auto = {
 void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
     uint64_t value = *ptr;
 
     visit_type_size(v, name, &value, errp);
@@ -528,7 +514,7 @@ static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
     uint64_t value;
 
     if (dev->realized) {
@@ -563,9 +549,8 @@ const PropertyInfo qdev_prop_size32 = {
 static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    QemuUUID *uuid = qdev_get_prop_ptr(dev, prop);
+    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
     char buffer[UUID_FMT_LEN + 1];
     char *p = buffer;
 
@@ -581,7 +566,7 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    QemuUUID *uuid = qdev_get_prop_ptr(dev, prop);
+    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
     char *str;
 
     if (dev->realized) {
@@ -653,7 +638,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
      */
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *alenptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *alenptr = qdev_get_prop_ptr(obj, prop);
     void **arrayptr = (void *)dev + prop->arrayoffset;
     void *eltptr;
     const char *arrayname;
@@ -699,7 +684,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
          * being inside the device struct.
          */
         arrayprop->prop.offset = eltptr - (void *)dev;
-        assert(qdev_get_prop_ptr(dev, &arrayprop->prop) == eltptr);
+        assert(qdev_get_prop_ptr(obj, &arrayprop->prop) == eltptr);
         object_property_add(obj, propname,
                             arrayprop->prop.info->name,
                             arrayprop->prop.info->get,
@@ -893,9 +878,8 @@ void qdev_prop_set_globals(DeviceState *dev)
 static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_size(v, name, ptr, errp);
 }
@@ -905,7 +889,7 @@ static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 9961cfe7bf..2b8f33fec2 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2343,9 +2343,8 @@ void css_reset(void)
 static void get_css_devid(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    CssDevId *dev_id = qdev_get_prop_ptr(dev, prop);
+    CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
     char buffer[] = "xx.x.xxxx";
     char *p = buffer;
     int r;
@@ -2375,7 +2374,7 @@ static void set_css_devid(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    CssDevId *dev_id = qdev_get_prop_ptr(dev, prop);
+    CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
     char *str;
     int num, n1, n2;
     unsigned int cssid, ssid, devid;
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 05f7460aec..8b6be1197b 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1330,7 +1330,7 @@ static void s390_pci_get_fid(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(DEVICE(obj), prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
@@ -1341,7 +1341,7 @@ static void s390_pci_set_fid(Object *obj, Visitor *v, const char *name,
     DeviceState *dev = DEVICE(obj);
     S390PCIBusDevice *zpci = S390_PCI_DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 57150913b7..53569925a2 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1488,9 +1488,8 @@ static void get_nv_gpudirect_clique_id(Object *obj, Visitor *v,
                                        const char *name, void *opaque,
                                        Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
@@ -1501,7 +1500,7 @@ static void set_nv_gpudirect_clique_id(Object *obj, Visitor *v,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint8_t value, *ptr = qdev_get_prop_ptr(dev, prop);
+    uint8_t value, *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
-- 
2.28.0


