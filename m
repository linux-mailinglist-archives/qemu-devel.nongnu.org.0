Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C162116FC29
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 11:27:38 +0100 (CET)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6tuj-0006PS-Pc
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 05:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttV-0004PL-Vn
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttS-0003WF-39
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39285
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j6ttR-0003Td-T9
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582712777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWdP1NY+Cn0bWcyTn34IfuarV3mde9P1Lt77lcBKdCg=;
 b=Fv8bKq1up6vBAUn8vCjseKuJEE7RxeVz4W45Da1MHucAKDs5KBi1xw7zD3ZpWyR+LKbCcA
 i2XhEDkzoAaHXlrzOq7OqEz2jHMOXlYzrOAAh49QfYt/3G09Yi0/G6l5FaEGGGl5BdITMO
 qgcWrPiZLFZ2V6WWopzfuGHN3H9KK+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-0Xpaac3kN2yGJ4YA-eak9Q-1; Wed, 26 Feb 2020 05:26:15 -0500
X-MC-Unique: 0Xpaac3kN2yGJ4YA-eak9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38E5D1882CCC;
 Wed, 26 Feb 2020 10:26:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBA9C60BE1;
 Wed, 26 Feb 2020 10:26:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 03/10] tpm: Separate tpm_tis common functions from isa code
Date: Wed, 26 Feb 2020 11:25:42 +0100
Message-Id: <20200226102549.12158-4-eric.auger@redhat.com>
In-Reply-To: <20200226102549.12158-1-eric.auger@redhat.com>
References: <20200226102549.12158-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the device agnostic code into tpm_tis_common.c and
put the ISA device specific code into tpm_tis_isa.c

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v2 -> v3:
- Added Stefan's R-b
---
 hw/tpm/Makefile.objs                   |   2 +-
 hw/tpm/tpm_tis.h                       |  91 +++++++++++
 hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c} | 209 ++-----------------------
 hw/tpm/tpm_tis_isa.c                   | 170 ++++++++++++++++++++
 4 files changed, 271 insertions(+), 201 deletions(-)
 create mode 100644 hw/tpm/tpm_tis.h
 rename hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c} (83%)
 create mode 100644 hw/tpm/tpm_tis_isa.c

diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
index 85eb99ae05..fcc4c2f27c 100644
--- a/hw/tpm/Makefile.objs
+++ b/hw/tpm/Makefile.objs
@@ -1,6 +1,6 @@
 common-obj-$(CONFIG_TPM) +=3D tpm_util.o
 obj-$(call lor,$(CONFIG_TPM_TIS),$(CONFIG_TPM_CRB)) +=3D tpm_ppi.o
-common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis.o
+common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis_isa.o tpm_tis_common.o
 common-obj-$(CONFIG_TPM_CRB) +=3D tpm_crb.o
 common-obj-$(CONFIG_TPM_PASSTHROUGH) +=3D tpm_passthrough.o
 common-obj-$(CONFIG_TPM_EMULATOR) +=3D tpm_emulator.o
diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
new file mode 100644
index 0000000000..5554989395
--- /dev/null
+++ b/hw/tpm/tpm_tis.h
@@ -0,0 +1,91 @@
+/*
+ * tpm_tis.h - QEMU's TPM TIS common header
+ *
+ * Copyright (C) 2006,2010-2013 IBM Corporation
+ *
+ * Authors:
+ *  Stefan Berger <stefanb@us.ibm.com>
+ *  David Safford <safford@us.ibm.com>
+ *
+ * Xen 4 support: Andrease Niederl <andreas.niederl@iaik.tugraz.at>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ *
+ * Implementation of the TIS interface according to specs found at
+ * http://www.trustedcomputinggroup.org. This implementation currently
+ * supports version 1.3, 21 March 2013
+ * In the developers menu choose the PC Client section then find the TIS
+ * specification.
+ *
+ * TPM TIS for TPM 2 implementation following TCG PC Client Platform
+ * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
+ */
+#ifndef TPM_TPM_TIS_H
+#define TPM_TPM_TIS_H
+
+#include "qemu/osdep.h"
+#include "sysemu/tpm_backend.h"
+#include "tpm_ppi.h"
+
+#define TPM_TIS_NUM_LOCALITIES      5     /* per spec */
+#define TPM_TIS_LOCALITY_SHIFT      12
+#define TPM_TIS_NO_LOCALITY         0xff
+
+#define TPM_TIS_IS_VALID_LOCTY(x)   ((x) < TPM_TIS_NUM_LOCALITIES)
+
+#define TPM_TIS_BUFFER_MAX          4096
+
+typedef enum {
+    TPM_TIS_STATE_IDLE =3D 0,
+    TPM_TIS_STATE_READY,
+    TPM_TIS_STATE_COMPLETION,
+    TPM_TIS_STATE_EXECUTION,
+    TPM_TIS_STATE_RECEPTION,
+} TPMTISState;
+
+/* locality data  -- all fields are persisted */
+typedef struct TPMLocality {
+    TPMTISState state;
+    uint8_t access;
+    uint32_t sts;
+    uint32_t iface_id;
+    uint32_t inte;
+    uint32_t ints;
+} TPMLocality;
+
+typedef struct TPMState {
+    MemoryRegion mmio;
+
+    unsigned char buffer[TPM_TIS_BUFFER_MAX];
+    uint16_t rw_offset;
+
+    uint8_t active_locty;
+    uint8_t aborting_locty;
+    uint8_t next_locty;
+
+    TPMLocality loc[TPM_TIS_NUM_LOCALITIES];
+
+    qemu_irq irq;
+    uint32_t irq_num;
+
+    TPMBackendCmd cmd;
+
+    TPMBackend *be_driver;
+    TPMVersion be_tpm_version;
+
+    size_t be_buffer_size;
+
+    bool ppi_enabled;
+    TPMPPI ppi;
+} TPMState;
+
+extern const VMStateDescription vmstate_locty;
+extern const MemoryRegionOps tpm_tis_memory_ops;
+
+int tpm_tis_pre_save(TPMState *s);
+void tpm_tis_reset(TPMState *s);
+enum TPMVersion tpm_tis_get_tpm_version(TPMState *s);
+void tpm_tis_request_completed(TPMState *s, int ret);
+
+#endif /* TPM_TPM_TIS_H */
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis_common.c
similarity index 83%
rename from hw/tpm/tpm_tis.c
rename to hw/tpm/tpm_tis_common.c
index fc6d7ca579..9ce64d4836 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis_common.c
@@ -1,5 +1,6 @@
 /*
- * tpm_tis.c - QEMU's TPM TIS interface emulator
+ * tpm_tis_common.c - QEMU's TPM TIS interface emulator
+ * device agnostic functions
  *
  * Copyright (C) 2006,2010-2013 IBM Corporation
  *
@@ -21,7 +22,6 @@
  * TPM TIS for TPM 2 implementation following TCG PC Client Platform
  * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
  */
-
 #include "qemu/osdep.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
@@ -38,67 +38,7 @@
 #include "tpm_ppi.h"
 #include "trace.h"
=20
-#define TPM_TIS_NUM_LOCALITIES      5     /* per spec */
-#define TPM_TIS_LOCALITY_SHIFT      12
-#define TPM_TIS_NO_LOCALITY         0xff
-
-#define TPM_TIS_IS_VALID_LOCTY(x)   ((x) < TPM_TIS_NUM_LOCALITIES)
-
-#define TPM_TIS_BUFFER_MAX          4096
-
-typedef enum {
-    TPM_TIS_STATE_IDLE =3D 0,
-    TPM_TIS_STATE_READY,
-    TPM_TIS_STATE_COMPLETION,
-    TPM_TIS_STATE_EXECUTION,
-    TPM_TIS_STATE_RECEPTION,
-} TPMTISState;
-
-/* locality data  -- all fields are persisted */
-typedef struct TPMLocality {
-    TPMTISState state;
-    uint8_t access;
-    uint32_t sts;
-    uint32_t iface_id;
-    uint32_t inte;
-    uint32_t ints;
-} TPMLocality;
-
-typedef struct TPMState {
-    MemoryRegion mmio;
-
-    unsigned char buffer[TPM_TIS_BUFFER_MAX];
-    uint16_t rw_offset;
-
-    uint8_t active_locty;
-    uint8_t aborting_locty;
-    uint8_t next_locty;
-
-    TPMLocality loc[TPM_TIS_NUM_LOCALITIES];
-
-    qemu_irq irq;
-    uint32_t irq_num;
-
-    TPMBackendCmd cmd;
-
-    TPMBackend *be_driver;
-    TPMVersion be_tpm_version;
-
-    size_t be_buffer_size;
-
-    bool ppi_enabled;
-    TPMPPI ppi;
-} TPMState;
-
-typedef struct TPMStateISA {
-    /*< private >*/
-    ISADevice parent_obj;
-
-    /*< public >*/
-    TPMState state; /* not a QOM object */
-} TPMStateISA;
-
-#define TPM_TIS_ISA(obj) OBJECT_CHECK(TPMStateISA, (obj), TYPE_TPM_TIS_ISA=
)
+#include "tpm_tis.h"
=20
 #define DEBUG_TIS 0
=20
@@ -288,7 +228,7 @@ static void tpm_tis_prep_abort(TPMState *s, uint8_t loc=
ty, uint8_t newlocty)
 /*
  * Callback from the TPM to indicate that the response was received.
  */
-static void tpm_tis_request_completed(TPMState *s, int ret)
+void tpm_tis_request_completed(TPMState *s, int ret)
 {
     uint8_t locty =3D s->cmd.locty;
     uint8_t l;
@@ -827,7 +767,7 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr add=
r,
     }
 }
=20
-static const MemoryRegionOps tpm_tis_memory_ops =3D {
+const MemoryRegionOps tpm_tis_memory_ops =3D {
     .read =3D tpm_tis_mmio_read,
     .write =3D tpm_tis_mmio_write,
     .endianness =3D DEVICE_LITTLE_ENDIAN,
@@ -840,7 +780,7 @@ static const MemoryRegionOps tpm_tis_memory_ops =3D {
 /*
  * Get the TPMVersion of the backend device being used
  */
-static enum TPMVersion tpm_tis_get_tpm_version(TPMState *s)
+enum TPMVersion tpm_tis_get_tpm_version(TPMState *s)
 {
     if (tpm_backend_had_startup_error(s->be_driver)) {
         return TPM_VERSION_UNSPEC;
@@ -853,7 +793,7 @@ static enum TPMVersion tpm_tis_get_tpm_version(TPMState=
 *s)
  * This function is called when the machine starts, resets or due to
  * S3 resume.
  */
-static void tpm_tis_reset(TPMState *s)
+void tpm_tis_reset(TPMState *s)
 {
     int c;
=20
@@ -898,7 +838,7 @@ static void tpm_tis_reset(TPMState *s)
=20
 /* persistent state handling */
=20
-static int tpm_tis_pre_save(TPMState *s)
+int tpm_tis_pre_save(TPMState *s)
 {
     uint8_t locty =3D s->active_locty;
=20
@@ -916,7 +856,7 @@ static int tpm_tis_pre_save(TPMState *s)
     return 0;
 }
=20
-static const VMStateDescription vmstate_locty =3D {
+const VMStateDescription vmstate_locty =3D {
     .name =3D "tpm-tis/locty",
     .version_id =3D 0,
     .fields      =3D (VMStateField[]) {
@@ -930,134 +870,3 @@ static const VMStateDescription vmstate_locty =3D {
     }
 };
=20
-/* ISA */
-
-static int tpm_tis_pre_save_isa(void *opaque)
-{
-    TPMStateISA *isadev =3D opaque;
-
-    return tpm_tis_pre_save(&isadev->state);
-}
-
-static const VMStateDescription vmstate_tpm_tis_isa =3D {
-    .name =3D "tpm-tis",
-    .version_id =3D 0,
-    .pre_save  =3D tpm_tis_pre_save_isa,
-    .fields =3D (VMStateField[]) {
-        VMSTATE_BUFFER(state.buffer, TPMStateISA),
-        VMSTATE_UINT16(state.rw_offset, TPMStateISA),
-        VMSTATE_UINT8(state.active_locty, TPMStateISA),
-        VMSTATE_UINT8(state.aborting_locty, TPMStateISA),
-        VMSTATE_UINT8(state.next_locty, TPMStateISA),
-
-        VMSTATE_STRUCT_ARRAY(state.loc, TPMStateISA, TPM_TIS_NUM_LOCALITIE=
S, 0,
-                             vmstate_locty, TPMLocality),
-
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void tpm_tis_isa_request_completed(TPMIf *ti, int ret)
-{
-    TPMStateISA *isadev =3D TPM_TIS_ISA(ti);
-    TPMState *s =3D &isadev->state;
-
-    tpm_tis_request_completed(s, ret);
-}
-
-static enum TPMVersion tpm_tis_isa_get_tpm_version(TPMIf *ti)
-{
-    TPMStateISA *isadev =3D TPM_TIS_ISA(ti);
-    TPMState *s =3D &isadev->state;
-
-    return tpm_tis_get_tpm_version(s);
-}
-
-static void tpm_tis_isa_reset(DeviceState *dev)
-{
-    TPMStateISA *isadev =3D TPM_TIS_ISA(dev);
-    TPMState *s =3D &isadev->state;
-
-    return tpm_tis_reset(s);
-}
-
-static Property tpm_tis_isa_properties[] =3D {
-    DEFINE_PROP_UINT32("irq", TPMStateISA, state.irq_num, TPM_TIS_IRQ),
-    DEFINE_PROP_TPMBE("tpmdev", TPMStateISA, state.be_driver),
-    DEFINE_PROP_BOOL("ppi", TPMStateISA, state.ppi_enabled, true),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void tpm_tis_isa_initfn(Object *obj)
-{
-    TPMStateISA *isadev =3D TPM_TIS_ISA(obj);
-    TPMState *s =3D &isadev->state;
-
-    memory_region_init_io(&s->mmio, obj, &tpm_tis_memory_ops,
-                          s, "tpm-tis-mmio",
-                          TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT=
);
-}
-
-static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
-{
-    TPMStateISA *isadev =3D TPM_TIS_ISA(dev);
-    TPMState *s =3D &isadev->state;
-
-    if (!tpm_find()) {
-        error_setg(errp, "at most one TPM device is permitted");
-        return;
-    }
-
-    if (!s->be_driver) {
-        error_setg(errp, "'tpmdev' property is required");
-        return;
-    }
-    if (s->irq_num > 15) {
-        error_setg(errp, "IRQ %d is outside valid range of 0 to 15",
-                   s->irq_num);
-        return;
-    }
-
-    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
-
-    memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
-                                TPM_TIS_ADDR_BASE, &s->mmio);
-
-    if (s->ppi_enabled) {
-        tpm_ppi_init(&s->ppi, isa_address_space(ISA_DEVICE(dev)),
-                     TPM_PPI_ADDR_BASE, OBJECT(dev));
-    }
-}
-
-static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(klass);
-    TPMIfClass *tc =3D TPM_IF_CLASS(klass);
-
-    device_class_set_props(dc, tpm_tis_isa_properties);
-    dc->vmsd  =3D &vmstate_tpm_tis_isa;
-    tc->model =3D TPM_MODEL_TPM_TIS;
-    dc->realize =3D tpm_tis_isa_realizefn;
-    dc->reset =3D tpm_tis_isa_reset;
-    tc->request_completed =3D tpm_tis_isa_request_completed;
-    tc->get_version =3D tpm_tis_isa_get_tpm_version;
-}
-
-static const TypeInfo tpm_tis_isa_info =3D {
-    .name =3D TYPE_TPM_TIS_ISA,
-    .parent =3D TYPE_ISA_DEVICE,
-    .instance_size =3D sizeof(TPMStateISA),
-    .instance_init =3D tpm_tis_isa_initfn,
-    .class_init  =3D tpm_tis_isa_class_init,
-    .interfaces =3D (InterfaceInfo[]) {
-        { TYPE_TPM_IF },
-        { }
-    }
-};
-
-static void tpm_tis_isa_register(void)
-{
-    type_register_static(&tpm_tis_isa_info);
-}
-
-type_init(tpm_tis_isa_register)
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
new file mode 100644
index 0000000000..30ba37079d
--- /dev/null
+++ b/hw/tpm/tpm_tis_isa.c
@@ -0,0 +1,170 @@
+/*
+ * tpm_tis_isa.c - QEMU's TPM TIS ISA Device
+ *
+ * Copyright (C) 2006,2010-2013 IBM Corporation
+ *
+ * Authors:
+ *  Stefan Berger <stefanb@us.ibm.com>
+ *  David Safford <safford@us.ibm.com>
+ *
+ * Xen 4 support: Andrease Niederl <andreas.niederl@iaik.tugraz.at>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ *
+ * Implementation of the TIS interface according to specs found at
+ * http://www.trustedcomputinggroup.org. This implementation currently
+ * supports version 1.3, 21 March 2013
+ * In the developers menu choose the PC Client section then find the TIS
+ * specification.
+ *
+ * TPM TIS for TPM 2 implementation following TCG PC Client Platform
+ * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
+ */
+
+#include "qemu/osdep.h"
+#include "hw/isa/isa.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "tpm_util.h"
+#include "tpm_tis.h"
+
+typedef struct TPMStateISA {
+    /*< private >*/
+    ISADevice parent_obj;
+
+    /*< public >*/
+    TPMState state; /* not a QOM object */
+} TPMStateISA;
+
+#define TPM_TIS_ISA(obj) OBJECT_CHECK(TPMStateISA, (obj), TYPE_TPM_TIS_ISA=
)
+
+static int tpm_tis_pre_save_isa(void *opaque)
+{
+    TPMStateISA *isadev =3D opaque;
+
+    return tpm_tis_pre_save(&isadev->state);
+}
+
+static const VMStateDescription vmstate_tpm_tis_isa =3D {
+    .name =3D "tpm-tis",
+    .version_id =3D 0,
+    .pre_save  =3D tpm_tis_pre_save_isa,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_BUFFER(state.buffer, TPMStateISA),
+        VMSTATE_UINT16(state.rw_offset, TPMStateISA),
+        VMSTATE_UINT8(state.active_locty, TPMStateISA),
+        VMSTATE_UINT8(state.aborting_locty, TPMStateISA),
+        VMSTATE_UINT8(state.next_locty, TPMStateISA),
+
+        VMSTATE_STRUCT_ARRAY(state.loc, TPMStateISA, TPM_TIS_NUM_LOCALITIE=
S, 0,
+                             vmstate_locty, TPMLocality),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void tpm_tis_isa_request_completed(TPMIf *ti, int ret)
+{
+    TPMStateISA *isadev =3D TPM_TIS_ISA(ti);
+    TPMState *s =3D &isadev->state;
+
+    tpm_tis_request_completed(s, ret);
+}
+
+static enum TPMVersion tpm_tis_isa_get_tpm_version(TPMIf *ti)
+{
+    TPMStateISA *isadev =3D TPM_TIS_ISA(ti);
+    TPMState *s =3D &isadev->state;
+
+    return tpm_tis_get_tpm_version(s);
+}
+
+static void tpm_tis_isa_reset(DeviceState *dev)
+{
+    TPMStateISA *isadev =3D TPM_TIS_ISA(dev);
+    TPMState *s =3D &isadev->state;
+
+    return tpm_tis_reset(s);
+}
+
+static Property tpm_tis_isa_properties[] =3D {
+    DEFINE_PROP_UINT32("irq", TPMStateISA, state.irq_num, TPM_TIS_IRQ),
+    DEFINE_PROP_TPMBE("tpmdev", TPMStateISA, state.be_driver),
+    DEFINE_PROP_BOOL("ppi", TPMStateISA, state.ppi_enabled, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void tpm_tis_isa_initfn(Object *obj)
+{
+    TPMStateISA *isadev =3D TPM_TIS_ISA(obj);
+    TPMState *s =3D &isadev->state;
+
+    memory_region_init_io(&s->mmio, obj, &tpm_tis_memory_ops,
+                          s, "tpm-tis-mmio",
+                          TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT=
);
+}
+
+static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
+{
+    TPMStateISA *isadev =3D TPM_TIS_ISA(dev);
+    TPMState *s =3D &isadev->state;
+
+    if (!tpm_find()) {
+        error_setg(errp, "at most one TPM device is permitted");
+        return;
+    }
+
+    if (!s->be_driver) {
+        error_setg(errp, "'tpmdev' property is required");
+        return;
+    }
+    if (s->irq_num > 15) {
+        error_setg(errp, "IRQ %d is outside valid range of 0 to 15",
+                   s->irq_num);
+        return;
+    }
+
+    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
+
+    memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
+                                TPM_TIS_ADDR_BASE, &s->mmio);
+
+    if (s->ppi_enabled) {
+        tpm_ppi_init(&s->ppi, isa_address_space(ISA_DEVICE(dev)),
+                     TPM_PPI_ADDR_BASE, OBJECT(dev));
+    }
+}
+
+static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    TPMIfClass *tc =3D TPM_IF_CLASS(klass);
+
+    device_class_set_props(dc, tpm_tis_isa_properties);
+    dc->vmsd  =3D &vmstate_tpm_tis_isa;
+    tc->model =3D TPM_MODEL_TPM_TIS;
+    dc->realize =3D tpm_tis_isa_realizefn;
+    dc->reset =3D tpm_tis_isa_reset;
+    tc->request_completed =3D tpm_tis_isa_request_completed;
+    tc->get_version =3D tpm_tis_isa_get_tpm_version;
+}
+
+static const TypeInfo tpm_tis_isa_info =3D {
+    .name =3D TYPE_TPM_TIS_ISA,
+    .parent =3D TYPE_ISA_DEVICE,
+    .instance_size =3D sizeof(TPMStateISA),
+    .instance_init =3D tpm_tis_isa_initfn,
+    .class_init  =3D tpm_tis_isa_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_TPM_IF },
+        { }
+    }
+};
+
+static void tpm_tis_isa_register(void)
+{
+    type_register_static(&tpm_tis_isa_info);
+}
+
+type_init(tpm_tis_isa_register)
--=20
2.20.1


