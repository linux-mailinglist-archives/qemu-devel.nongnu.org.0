Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89DF16FC28
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 11:27:25 +0100 (CET)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6tuW-0005ux-Pn
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 05:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttQ-0004DJ-Dv
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttO-0003Mq-NK
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34425
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j6ttO-0003Ls-Hp
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582712774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9uMhQHMXH71Sb887zTkI8TLK1u6tYlprGIRZNEHnVkk=;
 b=ZafmLnrrPIrCaoBemMJdqle4iuhzanErkjP1bGZIsXrdiux9GmAM5j8xLgSElC6hLm4YHR
 tnNRkNZvBe2ZgSks+n3trX4yKQYokwieQvEL/WFRNCR3YW1OSbRFowE4HrkkKy/YoWcREq
 U46TWF8npXasOAGUNiLGpQ33TTpZKP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-5xkjpLqaPAKjHQtBiemdPg-1; Wed, 26 Feb 2020 05:26:12 -0500
X-MC-Unique: 5xkjpLqaPAKjHQtBiemdPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60477107ACCC;
 Wed, 26 Feb 2020 10:26:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BBB460BE1;
 Wed, 26 Feb 2020 10:26:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 02/10] tpm: Use TPMState as a common struct
Date: Wed, 26 Feb 2020 11:25:41 +0100
Message-Id: <20200226102549.12158-3-eric.auger@redhat.com>
In-Reply-To: <20200226102549.12158-1-eric.auger@redhat.com>
References: <20200226102549.12158-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

As we plan to introduce a SysBus TPM TIS device, let's
make the TPMState a common struct usable by both the
ISADevice and the SysBusDevice. TPMStateISA embeds the
struct and inherits from the ISADevice.

The prototype of functions bound to be used by both
the ISA and SysBus devices is changed to take TPMState
handle.

A bunch of structs also are renamed to be specialized
for the ISA device. Besides those transformations, no
functional change is expected.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v2 -> v3:
- Added Stefan's R-b
---
 hw/tpm/tpm_tis.c | 146 +++++++++++++++++++++++++++++------------------
 1 file changed, 91 insertions(+), 55 deletions(-)

diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index c609737272..fc6d7ca579 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -65,7 +65,6 @@ typedef struct TPMLocality {
 } TPMLocality;
=20
 typedef struct TPMState {
-    ISADevice busdev;
     MemoryRegion mmio;
=20
     unsigned char buffer[TPM_TIS_BUFFER_MAX];
@@ -91,7 +90,15 @@ typedef struct TPMState {
     TPMPPI ppi;
 } TPMState;
=20
-#define TPM(obj) OBJECT_CHECK(TPMState, (obj), TYPE_TPM_TIS_ISA)
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
=20
 #define DEBUG_TIS 0
=20
@@ -281,9 +288,8 @@ static void tpm_tis_prep_abort(TPMState *s, uint8_t loc=
ty, uint8_t newlocty)
 /*
  * Callback from the TPM to indicate that the response was received.
  */
-static void tpm_tis_request_completed(TPMIf *ti, int ret)
+static void tpm_tis_request_completed(TPMState *s, int ret)
 {
-    TPMState *s =3D TPM(ti);
     uint8_t locty =3D s->cmd.locty;
     uint8_t l;
=20
@@ -338,7 +344,7 @@ static uint32_t tpm_tis_data_read(TPMState *s, uint8_t =
locty)
 }
=20
 #ifdef DEBUG_TIS
-static void tpm_tis_dump_state(void *opaque, hwaddr addr)
+static void tpm_tis_dump_state(TPMState *s, hwaddr addr)
 {
     static const unsigned regs[] =3D {
         TPM_TIS_REG_ACCESS,
@@ -353,7 +359,6 @@ static void tpm_tis_dump_state(void *opaque, hwaddr add=
r)
     int idx;
     uint8_t locty =3D tpm_tis_locality_from_addr(addr);
     hwaddr base =3D addr & ~0xfff;
-    TPMState *s =3D opaque;
=20
     printf("tpm_tis: active locality      : %d\n"
            "tpm_tis: state of locality %d : %d\n"
@@ -363,7 +368,7 @@ static void tpm_tis_dump_state(void *opaque, hwaddr add=
r)
=20
     for (idx =3D 0; regs[idx] !=3D 0xfff; idx++) {
         printf("tpm_tis: 0x%04x : 0x%08x\n", regs[idx],
-               (int)tpm_tis_mmio_read(opaque, base + regs[idx], 4));
+               (int)tpm_tis_mmio_read(s, base + regs[idx], 4));
     }
=20
     printf("tpm_tis: r/w offset    : %d\n"
@@ -488,7 +493,7 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr =
addr,
         break;
 #ifdef DEBUG_TIS
     case TPM_TIS_REG_DEBUG:
-        tpm_tis_dump_state(opaque, addr);
+        tpm_tis_dump_state(s, addr);
         break;
 #endif
     }
@@ -835,10 +840,8 @@ static const MemoryRegionOps tpm_tis_memory_ops =3D {
 /*
  * Get the TPMVersion of the backend device being used
  */
-static enum TPMVersion tpm_tis_get_tpm_version(TPMIf *ti)
+static enum TPMVersion tpm_tis_get_tpm_version(TPMState *s)
 {
-    TPMState *s =3D TPM(ti);
-
     if (tpm_backend_had_startup_error(s->be_driver)) {
         return TPM_VERSION_UNSPEC;
     }
@@ -850,9 +853,8 @@ static enum TPMVersion tpm_tis_get_tpm_version(TPMIf *t=
i)
  * This function is called when the machine starts, resets or due to
  * S3 resume.
  */
-static void tpm_tis_reset(DeviceState *dev)
+static void tpm_tis_reset(TPMState *s)
 {
-    TPMState *s =3D TPM(dev);
     int c;
=20
     s->be_tpm_version =3D tpm_backend_get_tpm_version(s->be_driver);
@@ -896,15 +898,14 @@ static void tpm_tis_reset(DeviceState *dev)
=20
 /* persistent state handling */
=20
-static int tpm_tis_pre_save(void *opaque)
+static int tpm_tis_pre_save(TPMState *s)
 {
-    TPMState *s =3D opaque;
     uint8_t locty =3D s->active_locty;
=20
     trace_tpm_tis_pre_save(locty, s->rw_offset);
=20
     if (DEBUG_TIS) {
-        tpm_tis_dump_state(opaque, 0);
+        tpm_tis_dump_state(s, 0);
     }
=20
     /*
@@ -929,34 +930,78 @@ static const VMStateDescription vmstate_locty =3D {
     }
 };
=20
-static const VMStateDescription vmstate_tpm_tis =3D {
+/* ISA */
+
+static int tpm_tis_pre_save_isa(void *opaque)
+{
+    TPMStateISA *isadev =3D opaque;
+
+    return tpm_tis_pre_save(&isadev->state);
+}
+
+static const VMStateDescription vmstate_tpm_tis_isa =3D {
     .name =3D "tpm-tis",
     .version_id =3D 0,
-    .pre_save  =3D tpm_tis_pre_save,
+    .pre_save  =3D tpm_tis_pre_save_isa,
     .fields =3D (VMStateField[]) {
-        VMSTATE_BUFFER(buffer, TPMState),
-        VMSTATE_UINT16(rw_offset, TPMState),
-        VMSTATE_UINT8(active_locty, TPMState),
-        VMSTATE_UINT8(aborting_locty, TPMState),
-        VMSTATE_UINT8(next_locty, TPMState),
+        VMSTATE_BUFFER(state.buffer, TPMStateISA),
+        VMSTATE_UINT16(state.rw_offset, TPMStateISA),
+        VMSTATE_UINT8(state.active_locty, TPMStateISA),
+        VMSTATE_UINT8(state.aborting_locty, TPMStateISA),
+        VMSTATE_UINT8(state.next_locty, TPMStateISA),
=20
-        VMSTATE_STRUCT_ARRAY(loc, TPMState, TPM_TIS_NUM_LOCALITIES, 0,
+        VMSTATE_STRUCT_ARRAY(state.loc, TPMStateISA, TPM_TIS_NUM_LOCALITIE=
S, 0,
                              vmstate_locty, TPMLocality),
=20
         VMSTATE_END_OF_LIST()
     }
 };
=20
-static Property tpm_tis_properties[] =3D {
-    DEFINE_PROP_UINT32("irq", TPMState, irq_num, TPM_TIS_IRQ),
-    DEFINE_PROP_TPMBE("tpmdev", TPMState, be_driver),
-    DEFINE_PROP_BOOL("ppi", TPMState, ppi_enabled, true),
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
     DEFINE_PROP_END_OF_LIST(),
 };
=20
-static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
+static void tpm_tis_isa_initfn(Object *obj)
 {
-    TPMState *s =3D TPM(dev);
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
=20
     if (!tpm_find()) {
         error_setg(errp, "at most one TPM device is permitted");
@@ -973,55 +1018,46 @@ static void tpm_tis_realizefn(DeviceState *dev, Erro=
r **errp)
         return;
     }
=20
-    isa_init_irq(&s->busdev, &s->irq, s->irq_num);
+    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
=20
     memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
                                 TPM_TIS_ADDR_BASE, &s->mmio);
=20
     if (s->ppi_enabled) {
         tpm_ppi_init(&s->ppi, isa_address_space(ISA_DEVICE(dev)),
-                     TPM_PPI_ADDR_BASE, OBJECT(s));
+                     TPM_PPI_ADDR_BASE, OBJECT(dev));
     }
 }
=20
-static void tpm_tis_initfn(Object *obj)
-{
-    TPMState *s =3D TPM(obj);
-
-    memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
-                          s, "tpm-tis-mmio",
-                          TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT=
);
-}
-
-static void tpm_tis_class_init(ObjectClass *klass, void *data)
+static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     TPMIfClass *tc =3D TPM_IF_CLASS(klass);
=20
-    dc->realize =3D tpm_tis_realizefn;
-    device_class_set_props(dc, tpm_tis_properties);
-    dc->reset =3D tpm_tis_reset;
-    dc->vmsd  =3D &vmstate_tpm_tis;
+    device_class_set_props(dc, tpm_tis_isa_properties);
+    dc->vmsd  =3D &vmstate_tpm_tis_isa;
     tc->model =3D TPM_MODEL_TPM_TIS;
-    tc->get_version =3D tpm_tis_get_tpm_version;
-    tc->request_completed =3D tpm_tis_request_completed;
+    dc->realize =3D tpm_tis_isa_realizefn;
+    dc->reset =3D tpm_tis_isa_reset;
+    tc->request_completed =3D tpm_tis_isa_request_completed;
+    tc->get_version =3D tpm_tis_isa_get_tpm_version;
 }
=20
-static const TypeInfo tpm_tis_info =3D {
+static const TypeInfo tpm_tis_isa_info =3D {
     .name =3D TYPE_TPM_TIS_ISA,
     .parent =3D TYPE_ISA_DEVICE,
-    .instance_size =3D sizeof(TPMState),
-    .instance_init =3D tpm_tis_initfn,
-    .class_init  =3D tpm_tis_class_init,
+    .instance_size =3D sizeof(TPMStateISA),
+    .instance_init =3D tpm_tis_isa_initfn,
+    .class_init  =3D tpm_tis_isa_class_init,
     .interfaces =3D (InterfaceInfo[]) {
         { TYPE_TPM_IF },
         { }
     }
 };
=20
-static void tpm_tis_register(void)
+static void tpm_tis_isa_register(void)
 {
-    type_register_static(&tpm_tis_info);
+    type_register_static(&tpm_tis_isa_info);
 }
=20
-type_init(tpm_tis_register)
+type_init(tpm_tis_isa_register)
--=20
2.20.1


