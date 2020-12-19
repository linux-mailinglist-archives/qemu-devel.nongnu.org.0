Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6472DEE7C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:19:16 +0100 (CET)
Received: from localhost ([::1]:56136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqaGa-00025n-0j
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZu2-0005Lu-0S
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtn-0007IP-8L
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMa7gcKR2ofIUXs+v5tSllk8qRUjFgGJqhUEEx8IYag=;
 b=Br/lHabb9XPdfhu9Sy1XeAlnl4Vf5Vnyir323jXGx15LFBEF3lw0RSRDtrD76xo/rI46gk
 DN5SZiL9Vl6vnauQ7otIL9D1n6QNj+dnIRWzcUED9lRCHCfyufvz4vS3rwNapLDS4Bt5Hj
 WB2ppynvdVwFBs+7RS2mU30dXa2gJhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-EtX8R8vsP4Gyx6WoVE12WA-1; Sat, 19 Dec 2020 05:55:39 -0500
X-MC-Unique: EtX8R8vsP4Gyx6WoVE12WA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3B76180A094;
 Sat, 19 Dec 2020 10:55:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E315D769;
 Sat, 19 Dec 2020 10:55:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D2C87112564A; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] migration: Replace migration's JSON writer by the
 general one
Date: Sat, 19 Dec 2020 11:55:28 +0100
Message-Id: <20201219105532.1734134-30-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 8118f0950f "migration: Append JSON description of migration
stream" needs a JSON writer.  The existing qobject_to_json() wasn't a
good fit, because it requires building a QObject to convert.  Instead,
migration got its very own JSON writer, in commit 190c882ce2 "QJSON:
Add JSON writer".  It tacitly limits numbers to int64_t, and strings
contents to characters that don't need escaping, unlike
qobject_to_json().

The previous commit factored the JSON writer out of qobject_to_json().
Replace migration's JSON writer by it.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-17-armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/vmstate.h    |   7 +-
 include/qapi/qmp/json-writer.h |   2 -
 include/qemu/typedefs.h        |   4 +-
 migration/qjson.h              |  29 ---------
 hw/display/virtio-gpu.c        |   2 +-
 hw/intc/s390_flic_kvm.c        |   2 +-
 hw/nvram/eeprom93xx.c          |   2 +-
 hw/nvram/fw_cfg.c              |   2 +-
 hw/pci/msix.c                  |   2 +-
 hw/pci/pci.c                   |   4 +-
 hw/pci/shpc.c                  |   2 +-
 hw/rtc/twl92230.c              |   2 +-
 hw/scsi/scsi-bus.c             |   2 +-
 hw/usb/redirect.c              |   7 +-
 hw/virtio/virtio.c             |   4 +-
 migration/qjson.c              | 114 ---------------------------------
 migration/savevm.c             |  53 +++++++--------
 migration/vmstate-types.c      |  38 +++++------
 migration/vmstate.c            |  52 +++++++--------
 target/alpha/machine.c         |   2 +-
 target/arm/machine.c           |   6 +-
 target/avr/machine.c           |   4 +-
 target/hppa/machine.c          |   4 +-
 target/microblaze/machine.c    |   2 +-
 target/mips/machine.c          |   4 +-
 target/openrisc/machine.c      |   2 +-
 target/ppc/machine.c           |  10 +--
 target/sparc/machine.c         |   2 +-
 migration/meson.build          |   1 -
 29 files changed, 114 insertions(+), 253 deletions(-)
 delete mode 100644 migration/qjson.h
 delete mode 100644 migration/qjson.c

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 4d71dc8fba..075ee80096 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -43,7 +43,7 @@ struct VMStateInfo {
     const char *name;
     int (*get)(QEMUFile *f, void *pv, size_t size, const VMStateField *field);
     int (*put)(QEMUFile *f, void *pv, size_t size, const VMStateField *field,
-               QJSON *vmdesc);
+               JSONWriter *vmdesc);
 };
 
 enum VMStateFlags {
@@ -1169,9 +1169,10 @@ extern const VMStateInfo vmstate_info_qlist;
 int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
                        void *opaque, int version_id);
 int vmstate_save_state(QEMUFile *f, const VMStateDescription *vmsd,
-                       void *opaque, QJSON *vmdesc);
+                       void *opaque, JSONWriter *vmdesc);
 int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
-                         void *opaque, QJSON *vmdesc, int version_id);
+                         void *opaque, JSONWriter *vmdesc,
+                         int version_id);
 
 bool vmstate_save_needed(const VMStateDescription *vmsd, void *opaque);
 
diff --git a/include/qapi/qmp/json-writer.h b/include/qapi/qmp/json-writer.h
index 708d129018..b70ba64077 100644
--- a/include/qapi/qmp/json-writer.h
+++ b/include/qapi/qmp/json-writer.h
@@ -14,8 +14,6 @@
 #ifndef JSON_WRITER_H
 #define JSON_WRITER_H
 
-typedef struct JSONWriter JSONWriter;
-
 JSONWriter *json_writer_new(bool pretty);
 const char *json_writer_get(JSONWriter *);
 GString *json_writer_get_and_free(JSONWriter *);
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 6281eae3b5..976b529dfb 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -57,8 +57,8 @@ typedef struct IOMMUMemoryRegion IOMMUMemoryRegion;
 typedef struct ISABus ISABus;
 typedef struct ISADevice ISADevice;
 typedef struct IsaDma IsaDma;
+typedef struct JSONWriter JSONWriter;
 typedef struct MACAddr MACAddr;
-typedef struct ReservedRegion ReservedRegion;
 typedef struct MachineClass MachineClass;
 typedef struct MachineState MachineState;
 typedef struct MemoryListener MemoryListener;
@@ -107,7 +107,6 @@ typedef struct QEMUSGList QEMUSGList;
 typedef struct QemuSpin QemuSpin;
 typedef struct QEMUTimer QEMUTimer;
 typedef struct QEMUTimerListGroup QEMUTimerListGroup;
-typedef struct QJSON QJSON;
 typedef struct QList QList;
 typedef struct QNull QNull;
 typedef struct QNum QNum;
@@ -115,6 +114,7 @@ typedef struct QObject QObject;
 typedef struct QString QString;
 typedef struct RAMBlock RAMBlock;
 typedef struct Range Range;
+typedef struct ReservedRegion ReservedRegion;
 typedef struct SavedIOTLB SavedIOTLB;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
diff --git a/migration/qjson.h b/migration/qjson.h
deleted file mode 100644
index 1786bb5864..0000000000
--- a/migration/qjson.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * QEMU JSON writer
- *
- * Copyright Alexander Graf
- *
- * Authors:
- *  Alexander Graf <agraf@suse.de>
- *
- * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
- * See the COPYING.LIB file in the top-level directory.
- *
- */
-#ifndef QEMU_QJSON_H
-#define QEMU_QJSON_H
-
-QJSON *qjson_new(void);
-void qjson_destroy(QJSON *json);
-void json_prop_str(QJSON *json, const char *name, const char *str);
-void json_prop_int(QJSON *json, const char *name, int64_t val);
-void json_end_array(QJSON *json);
-void json_start_array(QJSON *json, const char *name);
-void json_end_object(QJSON *json);
-void json_start_object(QJSON *json, const char *name);
-const char *qjson_get_str(QJSON *json);
-void qjson_finish(QJSON *json);
-
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(QJSON, qjson_destroy)
-
-#endif /* QEMU_QJSON_H */
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index f3b71fa9c7..0e833a462b 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -970,7 +970,7 @@ static const VMStateDescription vmstate_virtio_gpu_scanouts = {
 };
 
 static int virtio_gpu_save(QEMUFile *f, void *opaque, size_t size,
-                           const VMStateField *field, QJSON *vmdesc)
+                           const VMStateField *field, JSONWriter *vmdesc)
 {
     VirtIOGPU *g = opaque;
     struct virtio_gpu_simple_resource *res;
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index 35d91afa55..b3fb9f8395 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -386,7 +386,7 @@ static void kvm_s390_release_adapter_routes(S390FLICState *fs,
  * reached
  */
 static int kvm_flic_save(QEMUFile *f, void *opaque, size_t size,
-                         const VMStateField *field, QJSON *vmdesc)
+                         const VMStateField *field, JSONWriter *vmdesc)
 {
     KVMS390FLICState *flic = opaque;
     int len = FLIC_SAVE_INITIAL_SIZE;
diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index ca6f591c84..a1b9c78844 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -104,7 +104,7 @@ static int get_uint16_from_uint8(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_unused(QEMUFile *f, void *pv, size_t size,
-                      const VMStateField *field, QJSON *vmdesc)
+                      const VMStateField *field, JSONWriter *vmdesc)
 {
     fprintf(stderr, "uint16_from_uint8 is used only for backwards compatibility.\n");
     fprintf(stderr, "Never should be used to write a new state.\n");
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 44cb274a32..9b8dcca4ea 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -583,7 +583,7 @@ static int get_uint32_as_uint16(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_unused(QEMUFile *f, void *pv, size_t size,
-                      const VMStateField *field, QJSON *vmdesc)
+                      const VMStateField *field, JSONWriter *vmdesc)
 {
     fprintf(stderr, "uint32_as_uint16 is only used for backward compatibility.\n");
     fprintf(stderr, "This functions shouldn't be called.\n");
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 36491ee52b..ae9331cd0b 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -634,7 +634,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
 }
 
 static int put_msix_state(QEMUFile *f, void *pv, size_t size,
-                          const VMStateField *field, QJSON *vmdesc)
+                          const VMStateField *field, JSONWriter *vmdesc)
 {
     msix_save(pv, f);
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index d4349ea577..dd589cd7c7 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -559,7 +559,7 @@ static int get_pci_config_device(QEMUFile *f, void *pv, size_t size,
 
 /* just put buffer */
 static int put_pci_config_device(QEMUFile *f, void *pv, size_t size,
-                                 const VMStateField *field, QJSON *vmdesc)
+                                 const VMStateField *field, JSONWriter *vmdesc)
 {
     const uint8_t **v = pv;
     assert(size == pci_config_size(container_of(pv, PCIDevice, config)));
@@ -597,7 +597,7 @@ static int get_pci_irq_state(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_pci_irq_state(QEMUFile *f, void *pv, size_t size,
-                             const VMStateField *field, QJSON *vmdesc)
+                             const VMStateField *field, JSONWriter *vmdesc)
 {
     int i;
     PCIDevice *s = container_of(pv, PCIDevice, irq_state);
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index b00dce629c..4786a44996 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -699,7 +699,7 @@ void shpc_cap_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int l)
 }
 
 static int shpc_save(QEMUFile *f, void *pv, size_t size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     PCIDevice *d = container_of(pv, PCIDevice, shpc);
     qemu_put_buffer(f, d->shpc->config, SHPC_SIZEOF(d));
diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index f838913b37..d942908223 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -762,7 +762,7 @@ static int get_int32_as_uint16(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_int32_as_uint16(QEMUFile *f, void *pv, size_t size,
-                               const VMStateField *field, QJSON *vmdesc)
+                               const VMStateField *field, JSONWriter *vmdesc)
 {
     int *v = pv;
     qemu_put_be16(f, *v);
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index edb5c3492a..c349fb7f2d 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1638,7 +1638,7 @@ static char *scsibus_get_fw_dev_path(DeviceState *dev)
 /* SCSI request list.  For simplicity, pv points to the whole device */
 
 static int put_scsi_requests(QEMUFile *f, void *pv, size_t size,
-                             const VMStateField *field, QJSON *vmdesc)
+                             const VMStateField *field, JSONWriter *vmdesc)
 {
     SCSIDevice *s = pv;
     SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 3238de6bb8..4ca7d47ef7 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -2227,7 +2227,7 @@ static int usbredir_post_load(void *priv, int version_id)
 
 /* For usbredirparser migration */
 static int usbredir_put_parser(QEMUFile *f, void *priv, size_t unused,
-                               const VMStateField *field, QJSON *vmdesc)
+                               const VMStateField *field, JSONWriter *vmdesc)
 {
     USBRedirDevice *dev = priv;
     uint8_t *data;
@@ -2294,7 +2294,7 @@ static const VMStateInfo usbredir_parser_vmstate_info = {
 
 /* For buffered packets (iso/irq) queue migration */
 static int usbredir_put_bufpq(QEMUFile *f, void *priv, size_t unused,
-                              const VMStateField *field, QJSON *vmdesc)
+                              const VMStateField *field, JSONWriter *vmdesc)
 {
     struct endp_data *endp = priv;
     USBRedirDevice *dev = endp->dev;
@@ -2421,7 +2421,8 @@ static const VMStateDescription usbredir_ep_vmstate = {
 
 /* For PacketIdQueue migration */
 static int usbredir_put_packet_id_q(QEMUFile *f, void *priv, size_t unused,
-                                    const VMStateField *field, QJSON *vmdesc)
+                                    const VMStateField *field,
+                                    JSONWriter *vmdesc)
 {
     struct PacketIdQueue *q = priv;
     USBRedirDevice *dev = q->dev;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eff35fab7c..b308026596 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2745,7 +2745,7 @@ static int get_extra_state(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_extra_state(QEMUFile *f, void *pv, size_t size,
-                           const VMStateField *field, QJSON *vmdesc)
+                           const VMStateField *field, JSONWriter *vmdesc)
 {
     VirtIODevice *vdev = pv;
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
@@ -2919,7 +2919,7 @@ int virtio_save(VirtIODevice *vdev, QEMUFile *f)
 
 /* A wrapper for use as a VMState .put function */
 static int virtio_device_put(QEMUFile *f, void *opaque, size_t size,
-                              const VMStateField *field, QJSON *vmdesc)
+                              const VMStateField *field, JSONWriter *vmdesc)
 {
     return virtio_save(VIRTIO_DEVICE(opaque), f);
 }
diff --git a/migration/qjson.c b/migration/qjson.c
deleted file mode 100644
index e9889bdcb0..0000000000
--- a/migration/qjson.c
+++ /dev/null
@@ -1,114 +0,0 @@
-/*
- * A simple JSON writer
- *
- * Copyright Alexander Graf
- *
- * Authors:
- *  Alexander Graf <agraf@suse.de>
- *
- * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
- * See the COPYING.LIB file in the top-level directory.
- *
- */
-
-/*
- * Type QJSON lets you build JSON text.  Its interface mirrors (a
- * subset of) abstract JSON syntax.
- *
- * It does *not* detect incorrect use.  It happily produces invalid
- * JSON then.  This is what migration wants.
- *
- * QAPI output visitors also produce JSON text.  However, they do
- * assert their preconditions and invariants, and therefore abort on
- * incorrect use.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/qmp/qstring.h"
-#include "qjson.h"
-
-struct QJSON {
-    QString *str;
-    bool omit_comma;
-};
-
-static void json_emit_element(QJSON *json, const char *name)
-{
-    /* Check whether we need to print a , before an element */
-    if (json->omit_comma) {
-        json->omit_comma = false;
-    } else {
-        qstring_append(json->str, ", ");
-    }
-
-    if (name) {
-        qstring_append(json->str, "\"");
-        qstring_append(json->str, name);
-        qstring_append(json->str, "\" : ");
-    }
-}
-
-void json_start_object(QJSON *json, const char *name)
-{
-    json_emit_element(json, name);
-    qstring_append(json->str, "{ ");
-    json->omit_comma = true;
-}
-
-void json_end_object(QJSON *json)
-{
-    qstring_append(json->str, " }");
-    json->omit_comma = false;
-}
-
-void json_start_array(QJSON *json, const char *name)
-{
-    json_emit_element(json, name);
-    qstring_append(json->str, "[ ");
-    json->omit_comma = true;
-}
-
-void json_end_array(QJSON *json)
-{
-    qstring_append(json->str, " ]");
-    json->omit_comma = false;
-}
-
-void json_prop_int(QJSON *json, const char *name, int64_t val)
-{
-    json_emit_element(json, name);
-    qstring_append_int(json->str, val);
-}
-
-void json_prop_str(QJSON *json, const char *name, const char *str)
-{
-    json_emit_element(json, name);
-    qstring_append_chr(json->str, '"');
-    qstring_append(json->str, str);
-    qstring_append_chr(json->str, '"');
-}
-
-const char *qjson_get_str(QJSON *json)
-{
-    return qstring_get_str(json->str);
-}
-
-QJSON *qjson_new(void)
-{
-    QJSON *json = g_new0(QJSON, 1);
-
-    json->str = qstring_from_str("{ ");
-    json->omit_comma = true;
-    return json;
-}
-
-void qjson_finish(QJSON *json)
-{
-    json_end_object(json);
-}
-
-void qjson_destroy(QJSON *json)
-{
-    qobject_unref(json->str);
-    g_free(json);
-}
diff --git a/migration/savevm.c b/migration/savevm.c
index 5f937a2762..138a96de4d 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -42,6 +42,7 @@
 #include "postcopy-ram.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
+#include "qapi/qmp/json-writer.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "sysemu/cpus.h"
@@ -58,7 +59,6 @@
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/xen.h"
-#include "qjson.h"
 #include "migration/colo.h"
 #include "qemu/bitmap.h"
 #include "net/announce.h"
@@ -209,7 +209,7 @@ static int get_timer(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_timer(QEMUFile *f, void *pv, size_t size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     QEMUTimer *v = pv;
     timer_put(f, v);
@@ -406,7 +406,7 @@ static int get_capability(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_capability(QEMUFile *f, void *pv, size_t size,
-                          const VMStateField *field, QJSON *vmdesc)
+                          const VMStateField *field, JSONWriter *vmdesc)
 {
     MigrationCapability *capability = pv;
     const char *capability_str = MigrationCapability_str(*capability);
@@ -884,7 +884,8 @@ static int vmstate_load(QEMUFile *f, SaveStateEntry *se)
     return vmstate_load_state(f, se->vmsd, se->opaque, se->load_version_id);
 }
 
-static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se, QJSON *vmdesc)
+static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
+                                   JSONWriter *vmdesc)
 {
     int64_t old_offset, size;
 
@@ -893,18 +894,19 @@ static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se, QJSON *vmdes
     size = qemu_ftell_fast(f) - old_offset;
 
     if (vmdesc) {
-        json_prop_int(vmdesc, "size", size);
-        json_start_array(vmdesc, "fields");
-        json_start_object(vmdesc, NULL);
-        json_prop_str(vmdesc, "name", "data");
-        json_prop_int(vmdesc, "size", size);
-        json_prop_str(vmdesc, "type", "buffer");
-        json_end_object(vmdesc);
-        json_end_array(vmdesc);
+        json_writer_int64(vmdesc, "size", size);
+        json_writer_start_array(vmdesc, "fields");
+        json_writer_start_object(vmdesc, NULL);
+        json_writer_str(vmdesc, "name", "data");
+        json_writer_int64(vmdesc, "size", size);
+        json_writer_str(vmdesc, "type", "buffer");
+        json_writer_end_object(vmdesc);
+        json_writer_end_array(vmdesc);
     }
 }
 
-static int vmstate_save(QEMUFile *f, SaveStateEntry *se, QJSON *vmdesc)
+static int vmstate_save(QEMUFile *f, SaveStateEntry *se,
+                        JSONWriter *vmdesc)
 {
     trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
     if (!se->vmsd) {
@@ -1357,14 +1359,15 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
                                                     bool in_postcopy,
                                                     bool inactivate_disks)
 {
-    g_autoptr(QJSON) vmdesc = NULL;
+    g_autoptr(JSONWriter) vmdesc = NULL;
     int vmdesc_len;
     SaveStateEntry *se;
     int ret;
 
-    vmdesc = qjson_new();
-    json_prop_int(vmdesc, "page_size", qemu_target_page_size());
-    json_start_array(vmdesc, "devices");
+    vmdesc = json_writer_new(false);
+    json_writer_start_object(vmdesc, NULL);
+    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
+    json_writer_start_array(vmdesc, "devices");
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
 
         if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
@@ -1377,9 +1380,9 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
 
         trace_savevm_section_start(se->idstr, se->section_id);
 
-        json_start_object(vmdesc, NULL);
-        json_prop_str(vmdesc, "name", se->idstr);
-        json_prop_int(vmdesc, "instance_id", se->instance_id);
+        json_writer_start_object(vmdesc, NULL);
+        json_writer_str(vmdesc, "name", se->idstr);
+        json_writer_int64(vmdesc, "instance_id", se->instance_id);
 
         save_section_header(f, se, QEMU_VM_SECTION_FULL);
         ret = vmstate_save(f, se, vmdesc);
@@ -1390,7 +1393,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         trace_savevm_section_end(se->idstr, se->section_id, 0);
         save_section_footer(f, se);
 
-        json_end_object(vmdesc);
+        json_writer_end_object(vmdesc);
     }
 
     if (inactivate_disks) {
@@ -1409,14 +1412,14 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         qemu_put_byte(f, QEMU_VM_EOF);
     }
 
-    json_end_array(vmdesc);
-    qjson_finish(vmdesc);
-    vmdesc_len = strlen(qjson_get_str(vmdesc));
+    json_writer_end_array(vmdesc);
+    json_writer_end_object(vmdesc);
+    vmdesc_len = strlen(json_writer_get(vmdesc));
 
     if (should_send_vmdesc()) {
         qemu_put_byte(f, QEMU_VM_VMDESCRIPTION);
         qemu_put_be32(f, vmdesc_len);
-        qemu_put_buffer(f, (uint8_t *)qjson_get_str(vmdesc), vmdesc_len);
+        qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
     }
 
     return 0;
diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
index e22d41d73d..bf4d440308 100644
--- a/migration/vmstate-types.c
+++ b/migration/vmstate-types.c
@@ -29,7 +29,7 @@ static int get_bool(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_bool(QEMUFile *f, void *pv, size_t size,
-                    const VMStateField *field, QJSON *vmdesc)
+                    const VMStateField *field, JSONWriter *vmdesc)
 {
     bool *v = pv;
     qemu_put_byte(f, *v);
@@ -53,7 +53,7 @@ static int get_int8(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_int8(QEMUFile *f, void *pv, size_t size,
-                    const VMStateField *field, QJSON *vmdesc)
+                    const VMStateField *field, JSONWriter *vmdesc)
 {
     int8_t *v = pv;
     qemu_put_s8s(f, v);
@@ -77,7 +77,7 @@ static int get_int16(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_int16(QEMUFile *f, void *pv, size_t size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     int16_t *v = pv;
     qemu_put_sbe16s(f, v);
@@ -101,7 +101,7 @@ static int get_int32(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_int32(QEMUFile *f, void *pv, size_t size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     int32_t *v = pv;
     qemu_put_sbe32s(f, v);
@@ -178,7 +178,7 @@ static int get_int64(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_int64(QEMUFile *f, void *pv, size_t size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     int64_t *v = pv;
     qemu_put_sbe64s(f, v);
@@ -202,7 +202,7 @@ static int get_uint8(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_uint8(QEMUFile *f, void *pv, size_t size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     uint8_t *v = pv;
     qemu_put_8s(f, v);
@@ -226,7 +226,7 @@ static int get_uint16(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_uint16(QEMUFile *f, void *pv, size_t size,
-                      const VMStateField *field, QJSON *vmdesc)
+                      const VMStateField *field, JSONWriter *vmdesc)
 {
     uint16_t *v = pv;
     qemu_put_be16s(f, v);
@@ -250,7 +250,7 @@ static int get_uint32(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_uint32(QEMUFile *f, void *pv, size_t size,
-                      const VMStateField *field, QJSON *vmdesc)
+                      const VMStateField *field, JSONWriter *vmdesc)
 {
     uint32_t *v = pv;
     qemu_put_be32s(f, v);
@@ -300,7 +300,7 @@ static int get_uint64(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_uint64(QEMUFile *f, void *pv, size_t size,
-                      const VMStateField *field, QJSON *vmdesc)
+                      const VMStateField *field, JSONWriter *vmdesc)
 {
     uint64_t *v = pv;
     qemu_put_be64s(f, v);
@@ -325,7 +325,7 @@ static int get_nullptr(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_nullptr(QEMUFile *f, void *pv, size_t size,
-                        const VMStateField *field, QJSON *vmdesc)
+                        const VMStateField *field, JSONWriter *vmdesc)
 
 {
     if (pv == NULL) {
@@ -432,7 +432,7 @@ static int get_cpudouble(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_cpudouble(QEMUFile *f, void *pv, size_t size,
-                         const VMStateField *field, QJSON *vmdesc)
+                         const VMStateField *field, JSONWriter *vmdesc)
 {
     CPU_DoubleU *v = pv;
     qemu_put_be32s(f, &v->l.upper);
@@ -457,7 +457,7 @@ static int get_buffer(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_buffer(QEMUFile *f, void *pv, size_t size,
-                      const VMStateField *field, QJSON *vmdesc)
+                      const VMStateField *field, JSONWriter *vmdesc)
 {
     uint8_t *v = pv;
     qemu_put_buffer(f, v, size);
@@ -488,7 +488,7 @@ static int get_unused_buffer(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_unused_buffer(QEMUFile *f, void *pv, size_t size,
-                             const VMStateField *field, QJSON *vmdesc)
+                             const VMStateField *field, JSONWriter *vmdesc)
 {
     static const uint8_t buf[1024];
     int block_len;
@@ -530,7 +530,7 @@ static int get_tmp(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_tmp(QEMUFile *f, void *pv, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     const VMStateDescription *vmsd = field->vmsd;
     void *tmp = g_malloc(size);
@@ -573,7 +573,7 @@ static int get_bitmap(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_bitmap(QEMUFile *f, void *pv, size_t size,
-                      const VMStateField *field, QJSON *vmdesc)
+                      const VMStateField *field, JSONWriter *vmdesc)
 {
     unsigned long *bmp = pv;
     int i, idx = 0;
@@ -637,7 +637,7 @@ static int get_qtailq(QEMUFile *f, void *pv, size_t unused_size,
 
 /* put for QTAILQ */
 static int put_qtailq(QEMUFile *f, void *pv, size_t unused_size,
-                      const VMStateField *field, QJSON *vmdesc)
+                      const VMStateField *field, JSONWriter *vmdesc)
 {
     const VMStateDescription *vmsd = field->vmsd;
     /* offset of the QTAILQ entry in a QTAILQ element*/
@@ -670,7 +670,7 @@ struct put_gtree_data {
     QEMUFile *f;
     const VMStateDescription *key_vmsd;
     const VMStateDescription *val_vmsd;
-    QJSON *vmdesc;
+    JSONWriter *vmdesc;
     int ret;
 };
 
@@ -703,7 +703,7 @@ static gboolean put_gtree_elem(gpointer key, gpointer value, gpointer data)
 }
 
 static int put_gtree(QEMUFile *f, void *pv, size_t unused_size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     bool direct_key = (!field->start);
     const VMStateDescription *key_vmsd = direct_key ? NULL : &field->vmsd[1];
@@ -819,7 +819,7 @@ const VMStateInfo vmstate_info_gtree = {
 };
 
 static int put_qlist(QEMUFile *f, void *pv, size_t unused_size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     const VMStateDescription *vmsd = field->vmsd;
     /* offset of the QTAILQ entry in a QTAILQ element*/
diff --git a/migration/vmstate.c b/migration/vmstate.c
index e9d2aef66b..05f87cdddc 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -14,14 +14,14 @@
 #include "migration.h"
 #include "migration/vmstate.h"
 #include "savevm.h"
+#include "qapi/qmp/json-writer.h"
 #include "qemu-file.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "trace.h"
-#include "qjson.h"
 
 static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
-                                   void *opaque, QJSON *vmdesc);
+                                   void *opaque, JSONWriter *vmdesc);
 static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
                                    void *opaque);
 
@@ -249,7 +249,8 @@ static bool vmsd_can_compress(const VMStateField *field)
     return true;
 }
 
-static void vmsd_desc_field_start(const VMStateDescription *vmsd, QJSON *vmdesc,
+static void vmsd_desc_field_start(const VMStateDescription *vmsd,
+                                  JSONWriter *vmdesc,
                                   const VMStateField *field, int i, int max)
 {
     char *name, *old_name;
@@ -270,25 +271,26 @@ static void vmsd_desc_field_start(const VMStateDescription *vmsd, QJSON *vmdesc,
         g_free(old_name);
     }
 
-    json_start_object(vmdesc, NULL);
-    json_prop_str(vmdesc, "name", name);
+    json_writer_start_object(vmdesc, NULL);
+    json_writer_str(vmdesc, "name", name);
     if (is_array) {
         if (can_compress) {
-            json_prop_int(vmdesc, "array_len", max);
+            json_writer_int64(vmdesc, "array_len", max);
         } else {
-            json_prop_int(vmdesc, "index", i);
+            json_writer_int64(vmdesc, "index", i);
         }
     }
-    json_prop_str(vmdesc, "type", vmfield_get_type_name(field));
+    json_writer_str(vmdesc, "type", vmfield_get_type_name(field));
 
     if (field->flags & VMS_STRUCT) {
-        json_start_object(vmdesc, "struct");
+        json_writer_start_object(vmdesc, "struct");
     }
 
     g_free(name);
 }
 
-static void vmsd_desc_field_end(const VMStateDescription *vmsd, QJSON *vmdesc,
+static void vmsd_desc_field_end(const VMStateDescription *vmsd,
+                                JSONWriter *vmdesc,
                                 const VMStateField *field, size_t size, int i)
 {
     if (!vmdesc) {
@@ -297,11 +299,11 @@ static void vmsd_desc_field_end(const VMStateDescription *vmsd, QJSON *vmdesc,
 
     if (field->flags & VMS_STRUCT) {
         /* We printed a struct in between, close its child object */
-        json_end_object(vmdesc);
+        json_writer_end_object(vmdesc);
     }
 
-    json_prop_int(vmdesc, "size", size);
-    json_end_object(vmdesc);
+    json_writer_int64(vmdesc, "size", size);
+    json_writer_end_object(vmdesc);
 }
 
 
@@ -316,13 +318,13 @@ bool vmstate_save_needed(const VMStateDescription *vmsd, void *opaque)
 
 
 int vmstate_save_state(QEMUFile *f, const VMStateDescription *vmsd,
-                       void *opaque, QJSON *vmdesc_id)
+                       void *opaque, JSONWriter *vmdesc_id)
 {
     return vmstate_save_state_v(f, vmsd, opaque, vmdesc_id, vmsd->version_id);
 }
 
 int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
-                         void *opaque, QJSON *vmdesc, int version_id)
+                         void *opaque, JSONWriter *vmdesc, int version_id)
 {
     int ret = 0;
     const VMStateField *field = vmsd->fields;
@@ -339,9 +341,9 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
     }
 
     if (vmdesc) {
-        json_prop_str(vmdesc, "vmsd_name", vmsd->name);
-        json_prop_int(vmdesc, "version", version_id);
-        json_start_array(vmdesc, "fields");
+        json_writer_str(vmdesc, "vmsd_name", vmsd->name);
+        json_writer_int64(vmdesc, "version", version_id);
+        json_writer_start_array(vmdesc, "fields");
     }
 
     while (field->name) {
@@ -353,7 +355,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
             int i, n_elems = vmstate_n_elems(opaque, field);
             int size = vmstate_size(opaque, field);
             int64_t old_offset, written_bytes;
-            QJSON *vmdesc_loop = vmdesc;
+            JSONWriter *vmdesc_loop = vmdesc;
 
             trace_vmstate_save_state_loop(vmsd->name, field->name, n_elems);
             if (field->flags & VMS_POINTER) {
@@ -413,7 +415,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
     }
 
     if (vmdesc) {
-        json_end_array(vmdesc);
+        json_writer_end_array(vmdesc);
     }
 
     ret = vmstate_subsection_save(f, vmsd, opaque, vmdesc);
@@ -491,7 +493,7 @@ static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
 }
 
 static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
-                                   void *opaque, QJSON *vmdesc)
+                                   void *opaque, JSONWriter *vmdesc)
 {
     const VMStateDescription **sub = vmsd->subsections;
     bool vmdesc_has_subsections = false;
@@ -507,11 +509,11 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
             if (vmdesc) {
                 /* Only create subsection array when we have any */
                 if (!vmdesc_has_subsections) {
-                    json_start_array(vmdesc, "subsections");
+                    json_writer_start_array(vmdesc, "subsections");
                     vmdesc_has_subsections = true;
                 }
 
-                json_start_object(vmdesc, NULL);
+                json_writer_start_object(vmdesc, NULL);
             }
 
             qemu_put_byte(f, QEMU_VM_SUBSECTION);
@@ -525,14 +527,14 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
             }
 
             if (vmdesc) {
-                json_end_object(vmdesc);
+                json_writer_end_object(vmdesc);
             }
         }
         sub++;
     }
 
     if (vmdesc_has_subsections) {
-        json_end_array(vmdesc);
+        json_writer_end_array(vmdesc);
     }
 
     return ret;
diff --git a/target/alpha/machine.c b/target/alpha/machine.c
index 9d20169d4f..2b7c8148ff 100644
--- a/target/alpha/machine.c
+++ b/target/alpha/machine.c
@@ -11,7 +11,7 @@ static int get_fpcr(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_fpcr(QEMUFile *f, void *opaque, size_t size,
-                    const VMStateField *field, QJSON *vmdesc)
+                    const VMStateField *field, JSONWriter *vmdesc)
 {
     CPUAlphaState *env = opaque;
     qemu_put_be64(f, cpu_alpha_load_fpcr(env));
diff --git a/target/arm/machine.c b/target/arm/machine.c
index c5a2114f51..581852bc53 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -27,7 +27,7 @@ static int get_fpscr(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_fpscr(QEMUFile *f, void *opaque, size_t size,
-                     const VMStateField *field, QJSON *vmdesc)
+                     const VMStateField *field, JSONWriter *vmdesc)
 {
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
@@ -573,7 +573,7 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_cpsr(QEMUFile *f, void *opaque, size_t size,
-                    const VMStateField *field, QJSON *vmdesc)
+                    const VMStateField *field, JSONWriter *vmdesc)
 {
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
@@ -608,7 +608,7 @@ static int get_power(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_power(QEMUFile *f, void *opaque, size_t size,
-                    const VMStateField *field, QJSON *vmdesc)
+                    const VMStateField *field, JSONWriter *vmdesc)
 {
     ARMCPU *cpu = opaque;
 
diff --git a/target/avr/machine.c b/target/avr/machine.c
index e315442787..de264f57c3 100644
--- a/target/avr/machine.c
+++ b/target/avr/machine.c
@@ -34,7 +34,7 @@ static int get_sreg(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_sreg(QEMUFile *f, void *opaque, size_t size,
-                    const VMStateField *field, QJSON *vmdesc)
+                    const VMStateField *field, JSONWriter *vmdesc)
 {
     CPUAVRState *env = opaque;
     uint8_t sreg = cpu_get_sreg(env);
@@ -61,7 +61,7 @@ static int get_segment(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_segment(QEMUFile *f, void *opaque, size_t size,
-                       const VMStateField *field, QJSON *vmdesc)
+                       const VMStateField *field, JSONWriter *vmdesc)
 {
     uint32_t *ramp = opaque;
     uint8_t temp = *ramp >> 16;
diff --git a/target/hppa/machine.c b/target/hppa/machine.c
index b60b654efb..905991d7f9 100644
--- a/target/hppa/machine.c
+++ b/target/hppa/machine.c
@@ -52,7 +52,7 @@ static int get_psw(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_psw(QEMUFile *f, void *opaque, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     CPUHPPAState *env = opaque;
     qemu_put_betr(f, cpu_hppa_get_psw(env));
@@ -93,7 +93,7 @@ static int get_tlb(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_tlb(QEMUFile *f, void *opaque, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     hppa_tlb_entry *ent = opaque;
     uint32_t val = 0;
diff --git a/target/microblaze/machine.c b/target/microblaze/machine.c
index c2074bbdfe..d24def3992 100644
--- a/target/microblaze/machine.c
+++ b/target/microblaze/machine.c
@@ -46,7 +46,7 @@ static int get_msr(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_msr(QEMUFile *f, void *opaque, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     CPUMBState *env = container_of(opaque, CPUMBState, msr);
 
diff --git a/target/mips/machine.c b/target/mips/machine.c
index 5b23e3e912..77afe654e9 100644
--- a/target/mips/machine.c
+++ b/target/mips/machine.c
@@ -31,7 +31,7 @@ static int get_fpr(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_fpr(QEMUFile *f, void *pv, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     int i;
     fpr_t *v = pv;
@@ -156,7 +156,7 @@ static int get_tlb(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_tlb(QEMUFile *f, void *pv, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     r4k_tlb_t *v = pv;
 
diff --git a/target/openrisc/machine.c b/target/openrisc/machine.c
index b92985d99b..6239725c4f 100644
--- a/target/openrisc/machine.c
+++ b/target/openrisc/machine.c
@@ -55,7 +55,7 @@ static int get_sr(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_sr(QEMUFile *f, void *opaque, size_t size,
-                  const VMStateField *field, QJSON *vmdesc)
+                  const VMStateField *field, JSONWriter *vmdesc)
 {
     CPUOpenRISCState *env = opaque;
     qemu_put_be32(f, cpu_get_sr(env));
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index d9d911b9b1..283db1d28a 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -134,7 +134,7 @@ static int get_avr(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_avr(QEMUFile *f, void *pv, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     ppc_avr_t *v = pv;
 
@@ -166,7 +166,7 @@ static int get_fpr(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_fpr(QEMUFile *f, void *pv, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     ppc_vsr_t *v = pv;
 
@@ -197,7 +197,7 @@ static int get_vsr(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_vsr(QEMUFile *f, void *pv, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     ppc_vsr_t *v = pv;
 
@@ -455,7 +455,7 @@ static int get_vscr(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_vscr(QEMUFile *f, void *opaque, size_t size,
-                    const VMStateField *field, QJSON *vmdesc)
+                    const VMStateField *field, JSONWriter *vmdesc)
 {
     PowerPCCPU *cpu = opaque;
     qemu_put_be32(f, helper_mfvscr(&cpu->env));
@@ -580,7 +580,7 @@ static int get_slbe(QEMUFile *f, void *pv, size_t size,
 }
 
 static int put_slbe(QEMUFile *f, void *pv, size_t size,
-                    const VMStateField *field, QJSON *vmdesc)
+                    const VMStateField *field, JSONWriter *vmdesc)
 {
     ppc_slb_t *v = pv;
 
diff --git a/target/sparc/machine.c b/target/sparc/machine.c
index f38cf229af..917375c3a1 100644
--- a/target/sparc/machine.c
+++ b/target/sparc/machine.c
@@ -68,7 +68,7 @@ static int get_psr(QEMUFile *f, void *opaque, size_t size,
 }
 
 static int put_psr(QEMUFile *f, void *opaque, size_t size,
-                   const VMStateField *field, QJSON *vmdesc)
+                   const VMStateField *field, JSONWriter *vmdesc)
 {
     SPARCCPU *cpu = opaque;
     CPUSPARCState *env = &cpu->env;
diff --git a/migration/meson.build b/migration/meson.build
index 980e37865c..291adc1337 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -6,7 +6,6 @@ migration_files = files(
   'vmstate.c',
   'qemu-file-channel.c',
   'qemu-file.c',
-  'qjson.c',
 )
 softmmu_ss.add(migration_files)
 
-- 
2.26.2


