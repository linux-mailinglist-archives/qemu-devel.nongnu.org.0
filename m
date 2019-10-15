Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DFAD7B85
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 18:30:15 +0200 (CEST)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKPi9-0001Ae-Kf
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 12:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKPfW-00087m-Ik
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKPfU-00048o-Vz
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:27:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iKPfU-00048W-NH
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:27:28 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BEB018E1CF1;
 Tue, 15 Oct 2019 16:27:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB9AE19C58;
 Tue, 15 Oct 2019 16:27:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/32] hw/i386: Remove obsolete
 LoadStateHandler::load_state_old handlers
Date: Tue, 15 Oct 2019 18:26:34 +0200
Message-Id: <20191015162705.28087-2-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 15 Oct 2019 16:27:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These devices implemented their load_state_old() handler 10 years
ago, previous to QEMU v0.12.
Since commit cc425b5ddf removed the pc-0.10 and pc-0.11 machines,
we can drop this code.

Note: the mips_r4k machine started to use the i8254 device just
after QEMU v0.5.0, but the MIPS machine types are not versioned,
so there is no migration compatibility issue removing this handler.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/acpi/piix4.c         | 40 ---------------------------------
 hw/intc/apic_common.c   | 49 -----------------------------------------
 hw/pci-host/piix.c      | 25 ---------------------
 hw/timer/i8254_common.c | 40 ---------------------------------
 4 files changed, 154 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 5742c3df87..1d29d438c7 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -42,7 +42,6 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/xen/xen.h"
-#include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "hw/core/cpu.h"
 #include "trace.h"
@@ -205,43 +204,6 @@ static const VMStateDescription vmstate_pci_status =3D=
 {
     }
 };
=20
-static int acpi_load_old(QEMUFile *f, void *opaque, int version_id)
-{
-    PIIX4PMState *s =3D opaque;
-    int ret, i;
-    uint16_t temp;
-
-    ret =3D pci_device_load(PCI_DEVICE(s), f);
-    if (ret < 0) {
-        return ret;
-    }
-    qemu_get_be16s(f, &s->ar.pm1.evt.sts);
-    qemu_get_be16s(f, &s->ar.pm1.evt.en);
-    qemu_get_be16s(f, &s->ar.pm1.cnt.cnt);
-
-    ret =3D vmstate_load_state(f, &vmstate_apm, &s->apm, 1);
-    if (ret) {
-        return ret;
-    }
-
-    timer_get(f, s->ar.tmr.timer);
-    qemu_get_sbe64s(f, &s->ar.tmr.overflow_time);
-
-    qemu_get_be16s(f, (uint16_t *)s->ar.gpe.sts);
-    for (i =3D 0; i < 3; i++) {
-        qemu_get_be16s(f, &temp);
-    }
-
-    qemu_get_be16s(f, (uint16_t *)s->ar.gpe.en);
-    for (i =3D 0; i < 3; i++) {
-        qemu_get_be16s(f, &temp);
-    }
-
-    ret =3D vmstate_load_state(f, &vmstate_pci_status,
-        &s->acpi_pci_hotplug.acpi_pcihp_pci_status[ACPI_PCIHP_BSEL_DEFAU=
LT], 1);
-    return ret;
-}
-
 static bool vmstate_test_use_acpi_pci_hotplug(void *opaque, int version_=
id)
 {
     PIIX4PMState *s =3D opaque;
@@ -313,8 +275,6 @@ static const VMStateDescription vmstate_acpi =3D {
     .name =3D "piix4_pm",
     .version_id =3D 3,
     .minimum_version_id =3D 3,
-    .minimum_version_id_old =3D 1,
-    .load_state_old =3D acpi_load_old,
     .post_load =3D vmstate_acpi_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, PIIX4PMState),
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index aafd8e0e33..375cb6abe9 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -31,7 +31,6 @@
 #include "sysemu/kvm.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
-#include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
=20
 static int apic_irq_delivered;
@@ -262,52 +261,6 @@ static void apic_reset_common(DeviceState *dev)
     apic_init_reset(dev);
 }
=20
-/* This function is only used for old state version 1 and 2 */
-static int apic_load_old(QEMUFile *f, void *opaque, int version_id)
-{
-    APICCommonState *s =3D opaque;
-    APICCommonClass *info =3D APIC_COMMON_GET_CLASS(s);
-    int i;
-
-    if (version_id > 2) {
-        return -EINVAL;
-    }
-
-    /* XXX: what if the base changes? (registered memory regions) */
-    qemu_get_be32s(f, &s->apicbase);
-    qemu_get_8s(f, &s->id);
-    qemu_get_8s(f, &s->arb_id);
-    qemu_get_8s(f, &s->tpr);
-    qemu_get_be32s(f, &s->spurious_vec);
-    qemu_get_8s(f, &s->log_dest);
-    qemu_get_8s(f, &s->dest_mode);
-    for (i =3D 0; i < 8; i++) {
-        qemu_get_be32s(f, &s->isr[i]);
-        qemu_get_be32s(f, &s->tmr[i]);
-        qemu_get_be32s(f, &s->irr[i]);
-    }
-    for (i =3D 0; i < APIC_LVT_NB; i++) {
-        qemu_get_be32s(f, &s->lvt[i]);
-    }
-    qemu_get_be32s(f, &s->esr);
-    qemu_get_be32s(f, &s->icr[0]);
-    qemu_get_be32s(f, &s->icr[1]);
-    qemu_get_be32s(f, &s->divide_conf);
-    s->count_shift =3D qemu_get_be32(f);
-    qemu_get_be32s(f, &s->initial_count);
-    s->initial_count_load_time =3D qemu_get_be64(f);
-    s->next_time =3D qemu_get_be64(f);
-
-    if (version_id >=3D 2) {
-        s->timer_expiry =3D qemu_get_be64(f);
-    }
-
-    if (info->post_load) {
-        info->post_load(s);
-    }
-    return 0;
-}
-
 static const VMStateDescription vmstate_apic_common;
=20
 static void apic_common_realize(DeviceState *dev, Error **errp)
@@ -408,8 +361,6 @@ static const VMStateDescription vmstate_apic_common =3D=
 {
     .name =3D "apic",
     .version_id =3D 3,
     .minimum_version_id =3D 3,
-    .minimum_version_id_old =3D 1,
-    .load_state_old =3D apic_load_old,
     .pre_load =3D apic_pre_load,
     .pre_save =3D apic_dispatch_pre_save,
     .post_load =3D apic_dispatch_post_load,
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 135c645535..2f4cbcbfe9 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -33,7 +33,6 @@
 #include "qapi/error.h"
 #include "qemu/range.h"
 #include "hw/xen/xen.h"
-#include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "hw/pci-host/pam.h"
 #include "sysemu/reset.h"
@@ -174,28 +173,6 @@ static void i440fx_write_config(PCIDevice *dev,
     }
 }
=20
-static int i440fx_load_old(QEMUFile* f, void *opaque, int version_id)
-{
-    PCII440FXState *d =3D opaque;
-    PCIDevice *pd =3D PCI_DEVICE(d);
-    int ret, i;
-    uint8_t smm_enabled;
-
-    ret =3D pci_device_load(pd, f);
-    if (ret < 0)
-        return ret;
-    i440fx_update_memory_mappings(d);
-    qemu_get_8s(f, &smm_enabled);
-
-    if (version_id =3D=3D 2) {
-        for (i =3D 0; i < PIIX_NUM_PIRQS; i++) {
-            qemu_get_be32(f); /* dummy load for compatibility */
-        }
-    }
-
-    return 0;
-}
-
 static int i440fx_post_load(void *opaque, int version_id)
 {
     PCII440FXState *d =3D opaque;
@@ -208,8 +185,6 @@ static const VMStateDescription vmstate_i440fx =3D {
     .name =3D "I440FX",
     .version_id =3D 3,
     .minimum_version_id =3D 3,
-    .minimum_version_id_old =3D 1,
-    .load_state_old =3D i440fx_load_old,
     .post_load =3D i440fx_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, PCII440FXState),
diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
index 57bf10cc94..050875b497 100644
--- a/hw/timer/i8254_common.c
+++ b/hw/timer/i8254_common.c
@@ -29,7 +29,6 @@
 #include "qemu/timer.h"
 #include "hw/timer/i8254.h"
 #include "hw/timer/i8254_internal.h"
-#include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
=20
 /* val must be 0 or 1 */
@@ -202,43 +201,6 @@ static const VMStateDescription vmstate_pit_channel =
=3D {
     }
 };
=20
-static int pit_load_old(QEMUFile *f, void *opaque, int version_id)
-{
-    PITCommonState *pit =3D opaque;
-    PITCommonClass *c =3D PIT_COMMON_GET_CLASS(pit);
-    PITChannelState *s;
-    int i;
-
-    if (version_id !=3D 1) {
-        return -EINVAL;
-    }
-
-    for (i =3D 0; i < 3; i++) {
-        s =3D &pit->channels[i];
-        s->count =3D qemu_get_be32(f);
-        qemu_get_be16s(f, &s->latched_count);
-        qemu_get_8s(f, &s->count_latched);
-        qemu_get_8s(f, &s->status_latched);
-        qemu_get_8s(f, &s->status);
-        qemu_get_8s(f, &s->read_state);
-        qemu_get_8s(f, &s->write_state);
-        qemu_get_8s(f, &s->write_latch);
-        qemu_get_8s(f, &s->rw_mode);
-        qemu_get_8s(f, &s->mode);
-        qemu_get_8s(f, &s->bcd);
-        qemu_get_8s(f, &s->gate);
-        s->count_load_time =3D qemu_get_be64(f);
-        s->irq_disabled =3D 0;
-        if (i =3D=3D 0) {
-            s->next_transition_time =3D qemu_get_be64(f);
-        }
-    }
-    if (c->post_load) {
-        c->post_load(pit);
-    }
-    return 0;
-}
-
 static int pit_dispatch_pre_save(void *opaque)
 {
     PITCommonState *s =3D opaque;
@@ -266,8 +228,6 @@ static const VMStateDescription vmstate_pit_common =3D=
 {
     .name =3D "i8254",
     .version_id =3D 3,
     .minimum_version_id =3D 2,
-    .minimum_version_id_old =3D 1,
-    .load_state_old =3D pit_load_old,
     .pre_save =3D pit_dispatch_pre_save,
     .post_load =3D pit_dispatch_post_load,
     .fields =3D (VMStateField[]) {
--=20
2.21.0


