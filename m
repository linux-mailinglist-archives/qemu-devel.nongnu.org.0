Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234EC666669
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 23:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFju5-0005qH-W5; Wed, 11 Jan 2023 17:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pFju3-0005q3-PZ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 17:49:03 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pFju1-0003jd-FC
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 17:49:03 -0500
Received: by mail-ed1-x532.google.com with SMTP id i15so24539810edf.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 14:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ezx/uEhAk53i7npKWw11UagbIPPnZ45dzxChSBwuBEA=;
 b=dq0CoGRoAIYH9UFjSfW3v+UncO48/7QqycsL5swktvkMB/HNu+llvxgSp3DG8M9ERP
 vtCYbJuwxCNC5QnT+9zKzP7F6rGEI1WVaH45f/qvoMj+KHoADiEqOV5enFKmM68axDSy
 H628vkhgmrfzc0egHUNysrLotXHN554R44z3vWxWrpDntu/FmQW4d0BvYICsAV8PMMfE
 1q3JYLBO9EfibXHtTld/2RbZD5m2JalibcNjZ6HYAXufJ7+HaQHrwFWvTWRnH+FJA4eI
 7HUjlh+eKC1J+U+xjxhEsBR8eN8EHTuD12t/d5/14iRQJSwEhoJqjK67iUFPEPSCW609
 RKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ezx/uEhAk53i7npKWw11UagbIPPnZ45dzxChSBwuBEA=;
 b=klaeeghSyM/6xDCDinM2ceTc3vCjQoRWcxXaaKx/F9ciTY1T+W3z/Qt9+yi62twN9G
 ZleIYUp7WafQ6jPsKnI5C8bAfuSvlXQxol0SBTIl37oxRBZzteHT8ip2QZPjy7WZKYMf
 DpIC3ZMgQOTZ0gdADsgbKyKp8wtufwXd+wl0wSdS2U/rQo6FBMpOFgngyAxIcZS62rpt
 fhZQkgGBq8Bnj1HG9tSNo70BKoZUguABIdFPJurqxyiTqb1HWB5D7QeWOKDvz4LLpq2+
 EyEjEqe5UmAtjKXsmIacNktRjFWHE+bvbJGwGOPChmvRY/lfkaYVZnpGXS1fOZhRPMYy
 Xorg==
X-Gm-Message-State: AFqh2kqLd1WH6+IJ6xBIc9nn7cBCeyr6nK+QBXAsmr23JSe5WvNCENYD
 g8JoC6U/ZIJfttHOCItteUc=
X-Google-Smtp-Source: AMrXdXtnbuN6uLN7318PuKgwcFkAVU38UD7toLtGEseD37hLO/GpO7wht13YLFhaUeVKTSSNHv76MQ==
X-Received: by 2002:aa7:d30d:0:b0:499:1ed2:645c with SMTP id
 p13-20020aa7d30d000000b004991ed2645cmr14758479edq.17.1673477339604; 
 Wed, 11 Jan 2023 14:48:59 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-046-148.77.191.pool.telefonica.de.
 [77.191.46.148]) by smtp.gmail.com with ESMTPSA id
 en6-20020a056402528600b00499b3d09bd2sm4384939edb.91.2023.01.11.14.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 14:48:59 -0800 (PST)
Date: Wed, 11 Jan 2023 22:48:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_1/4=5D_hw/intc=3A_Extract_the_I?=
 =?US-ASCII?Q?RQ_counting_functions_into_a_separate_file?=
In-Reply-To: <20230110095351.611724-2-thuth@redhat.com>
References: <20230110095351.611724-1-thuth@redhat.com>
 <20230110095351.611724-2-thuth@redhat.com>
Message-ID: <278496F1-4166-4D05-B642-290B3E7AA147@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 10=2E Januar 2023 09:53:48 UTC schrieb Thomas Huth <thuth@redhat=2Ecom>=
:
>These IRQ counting functions will soon be required in binaries that
>do not include the APIC code, too, so let's extract them into a
>separate file that can be linked independently of the APIC code=2E
>
>While we're at it, change the apic_* prefix into kvm_* since the
>functions are used from the i8259 PIC (i=2Ee=2E not the APIC), too=2E
>
>Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>---
> include/hw/i386/apic=2Eh          |  2 --
> include/hw/i386/apic_internal=2Eh |  1 -
> include/hw/intc/kvm_irqcount=2Eh  | 10 +++++++
> hw/i386/kvm/i8259=2Ec             |  4 +--
> hw/i386/kvm/ioapic=2Ec            |  4 +--
> hw/intc/apic=2Ec                  |  3 +-
> hw/intc/apic_common=2Ec           | 30 ++------------------
> hw/intc/kvm_irqcount=2Ec          | 49 +++++++++++++++++++++++++++++++++
> hw/rtc/mc146818rtc=2Ec            |  6 ++--
> hw/intc/meson=2Ebuild             |  6 ++++
> hw/intc/trace-events            |  9 +++---
> 11 files changed, 81 insertions(+), 43 deletions(-)
> create mode 100644 include/hw/intc/kvm_irqcount=2Eh
> create mode 100644 hw/intc/kvm_irqcount=2Ec
>
>diff --git a/include/hw/i386/apic=2Eh b/include/hw/i386/apic=2Eh
>index da1d2fe155=2E=2Ebdc15a7a73 100644
>--- a/include/hw/i386/apic=2Eh
>+++ b/include/hw/i386/apic=2Eh
>@@ -9,8 +9,6 @@ int apic_accept_pic_intr(DeviceState *s);
> void apic_deliver_pic_intr(DeviceState *s, int level);
> void apic_deliver_nmi(DeviceState *d);
> int apic_get_interrupt(DeviceState *s);
>-void apic_reset_irq_delivered(void);
>-int apic_get_irq_delivered(void);
> void cpu_set_apic_base(DeviceState *s, uint64_t val);
> uint64_t cpu_get_apic_base(DeviceState *s);
> void cpu_set_apic_tpr(DeviceState *s, uint8_t val);
>diff --git a/include/hw/i386/apic_internal=2Eh b/include/hw/i386/apic_int=
ernal=2Eh
>index 968b6648b3=2E=2E5f2ba24bfc 100644
>--- a/include/hw/i386/apic_internal=2Eh
>+++ b/include/hw/i386/apic_internal=2Eh
>@@ -199,7 +199,6 @@ typedef struct VAPICState {
>=20
> extern bool apic_report_tpr_access;
>=20
>-void apic_report_irq_delivered(int delivered);
> bool apic_next_timer(APICCommonState *s, int64_t current_time);
> void apic_enable_tpr_access_reporting(DeviceState *d, bool enable);
> void apic_enable_vapic(DeviceState *d, hwaddr paddr);
>diff --git a/include/hw/intc/kvm_irqcount=2Eh b/include/hw/intc/kvm_irqco=
unt=2Eh
>new file mode 100644
>index 0000000000=2E=2E0ed5999e49
>--- /dev/null
>+++ b/include/hw/intc/kvm_irqcount=2Eh
>@@ -0,0 +1,10 @@
>+/* SPDX-License-Identifier: LGPL-2=2E1-or-later */
>+
>+#ifndef KVM_IRQCOUNT_H
>+#define KVM_IRQCOUNT_H
>+
>+void kvm_report_irq_delivered(int delivered);
>+void kvm_reset_irq_delivered(void);
>+int kvm_get_irq_delivered(void);
>+
>+#endif
>diff --git a/hw/i386/kvm/i8259=2Ec b/hw/i386/kvm/i8259=2Ec
>index d61bae4dc3=2E=2E3ca0e1ff03 100644
>--- a/hw/i386/kvm/i8259=2Ec
>+++ b/hw/i386/kvm/i8259=2Ec
>@@ -14,7 +14,7 @@
> #include "hw/isa/i8259_internal=2Eh"
> #include "hw/intc/i8259=2Eh"
> #include "qemu/module=2Eh"
>-#include "hw/i386/apic_internal=2Eh"
>+#include "hw/intc/kvm_irqcount=2Eh"
> #include "hw/irq=2Eh"
> #include "sysemu/kvm=2Eh"
> #include "qom/object=2Eh"
>@@ -117,7 +117,7 @@ static void kvm_pic_set_irq(void *opaque, int irq, in=
t level)
>=20
>     pic_stat_update_irq(irq, level);
>     delivered =3D kvm_set_irq(kvm_state, irq, level);
>-    apic_report_irq_delivered(delivered);
>+    kvm_report_irq_delivered(delivered);
> }
>=20
> static void kvm_pic_realize(DeviceState *dev, Error **errp)
>diff --git a/hw/i386/kvm/ioapic=2Ec b/hw/i386/kvm/ioapic=2Ec
>index ee7c8ef68b=2E=2E272e26b4a2 100644
>--- a/hw/i386/kvm/ioapic=2Ec
>+++ b/hw/i386/kvm/ioapic=2Ec
>@@ -15,7 +15,7 @@
> #include "hw/i386/x86=2Eh"
> #include "hw/qdev-properties=2Eh"
> #include "hw/i386/ioapic_internal=2Eh"
>-#include "hw/i386/apic_internal=2Eh"
>+#include "hw/intc/kvm_irqcount=2Eh"
> #include "sysemu/kvm=2Eh"
>=20
> /* PC Utility function */
>@@ -116,7 +116,7 @@ static void kvm_ioapic_set_irq(void *opaque, int irq,=
 int level)
>=20
>     ioapic_stat_update_irq(common, irq, level);
>     delivered =3D kvm_set_irq(kvm_state, s->kvm_gsi_base + irq, level);
>-    apic_report_irq_delivered(delivered);
>+    kvm_report_irq_delivered(delivered);
> }
>=20
> static void kvm_ioapic_realize(DeviceState *dev, Error **errp)
>diff --git a/hw/intc/apic=2Ec b/hw/intc/apic=2Ec
>index 3df11c34d6=2E=2E2d3e55f4e2 100644
>--- a/hw/intc/apic=2Ec
>+++ b/hw/intc/apic=2Ec
>@@ -22,6 +22,7 @@
> #include "hw/i386/apic=2Eh"
> #include "hw/i386/ioapic=2Eh"
> #include "hw/intc/i8259=2Eh"
>+#include "hw/intc/kvm_irqcount=2Eh"
> #include "hw/pci/msi=2Eh"
> #include "qemu/host-utils=2Eh"
> #include "sysemu/kvm=2Eh"
>@@ -399,7 +400,7 @@ void apic_poll_irq(DeviceState *dev)
>=20
> static void apic_set_irq(APICCommonState *s, int vector_num, int trigger=
_mode)
> {
>-    apic_report_irq_delivered(!apic_get_bit(s->irr, vector_num));
>+    kvm_report_irq_delivered(!apic_get_bit(s->irr, vector_num));
>=20
>     apic_set_bit(s->irr, vector_num);
>     if (trigger_mode)
>diff --git a/hw/intc/apic_common=2Ec b/hw/intc/apic_common=2Ec
>index 2a20982066=2E=2E4a34f03047 100644
>--- a/hw/intc/apic_common=2Ec
>+++ b/hw/intc/apic_common=2Ec
>@@ -25,6 +25,7 @@
> #include "qapi/visitor=2Eh"
> #include "hw/i386/apic=2Eh"
> #include "hw/i386/apic_internal=2Eh"
>+#include "hw/intc/kvm_irqcount=2Eh"
> #include "trace=2Eh"
> #include "hw/boards=2Eh"
> #include "sysemu/hax=2Eh"
>@@ -33,7 +34,6 @@
> #include "hw/sysbus=2Eh"
> #include "migration/vmstate=2Eh"
>=20
>-static int apic_irq_delivered;
> bool apic_report_tpr_access;
>=20
> void cpu_set_apic_base(DeviceState *dev, uint64_t val)
>@@ -122,32 +122,6 @@ void apic_handle_tpr_access_report(DeviceState *dev,=
 target_ulong ip,
>     vapic_report_tpr_access(s->vapic, CPU(s->cpu), ip, access);
> }
>=20
>-void apic_report_irq_delivered(int delivered)
>-{
>-    apic_irq_delivered +=3D delivered;
>-
>-    trace_apic_report_irq_delivered(apic_irq_delivered);
>-}
>-
>-void apic_reset_irq_delivered(void)
>-{
>-    /* Copy this into a local variable to encourage gcc to emit a plain
>-     * register for a sys/sdt=2Eh marker=2E  For details on this workaro=
und, see:
>-     * https://sourceware=2Eorg/bugzilla/show_bug=2Ecgi?id=3D13296
>-     */
>-    volatile int a_i_d =3D apic_irq_delivered;
>-    trace_apic_reset_irq_delivered(a_i_d);
>-
>-    apic_irq_delivered =3D 0;
>-}
>-
>-int apic_get_irq_delivered(void)
>-{
>-    trace_apic_get_irq_delivered(apic_irq_delivered);
>-
>-    return apic_irq_delivered;
>-}
>-
> void apic_deliver_nmi(DeviceState *dev)
> {
>     APICCommonState *s =3D APIC_COMMON(dev);
>@@ -272,7 +246,7 @@ static void apic_reset_common(DeviceState *dev)
>     s->apicbase =3D APIC_DEFAULT_ADDRESS | bsp | MSR_IA32_APICBASE_ENABL=
E;
>     s->id =3D s->initial_apic_id;
>=20
>-    apic_reset_irq_delivered();
>+    kvm_reset_irq_delivered();
>=20
>     s->vapic_paddr =3D 0;
>     info->vapic_base_update(s);
>diff --git a/hw/intc/kvm_irqcount=2Ec b/hw/intc/kvm_irqcount=2Ec
>new file mode 100644
>index 0000000000=2E=2E2ef8a83a7a
>--- /dev/null
>+++ b/hw/intc/kvm_irqcount=2Ec
>@@ -0,0 +1,49 @@
>+/*
>+ * KVM PIC functions for counting the delivered IRQs=2E
>+ *
>+ * This library is free software; you can redistribute it and/or
>+ * modify it under the terms of the GNU Lesser General Public
>+ * License as published by the Free Software Foundation; either
>+ * version 2=2E1 of the License, or (at your option) any later version=
=2E
>+ *
>+ * This library is distributed in the hope that it will be useful,
>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the GNU
>+ * Lesser General Public License for more details=2E
>+ *
>+ * You should have received a copy of the GNU Lesser General Public
>+ * License along with this library; if not, see <http://www=2Egnu=2Eorg/=
licenses/>
>+ */
>+
>+#include "qemu/osdep=2Eh"
>+#include "hw/intc/kvm_irqcount=2Eh"
>+#include "trace=2Eh"
>+
>+static int kvm_irq_delivered;
>+
>+void kvm_report_irq_delivered(int delivered)
>+{
>+    kvm_irq_delivered +=3D delivered;
>+
>+    trace_kvm_report_irq_delivered(kvm_irq_delivered);
>+}
>+
>+void kvm_reset_irq_delivered(void)
>+{
>+    /*
>+     * Copy this into a local variable to encourage gcc to emit a plain
>+     * register for a sys/sdt=2Eh marker=2E  For details on this workaro=
und, see:
>+     * https://sourceware=2Eorg/bugzilla/show_bug=2Ecgi?id=3D13296
>+     */
>+    volatile int k_i_d =3D kvm_irq_delivered;
>+    trace_kvm_reset_irq_delivered(k_i_d);
>+
>+    kvm_irq_delivered =3D 0;
>+}
>+
>+int kvm_get_irq_delivered(void)
>+{
>+    trace_kvm_get_irq_delivered(kvm_irq_delivered);
>+
>+    return kvm_irq_delivered;
>+}
>diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>index 1ebb412479=2E=2E947d68c257 100644
>--- a/hw/rtc/mc146818rtc=2Ec
>+++ b/hw/rtc/mc146818rtc=2Ec
>@@ -27,6 +27,7 @@
> #include "qemu/module=2Eh"
> #include "qemu/bcd=2Eh"
> #include "hw/acpi/acpi_aml_interface=2Eh"
>+#include "hw/intc/kvm_irqcount=2Eh"
> #include "hw/irq=2Eh"
> #include "hw/qdev-properties=2Eh"
> #include "hw/qdev-properties-system=2Eh"
>@@ -46,7 +47,6 @@
>=20
> #ifdef TARGET_I386
> #include "qapi/qapi-commands-misc-target=2Eh"
>-#include "hw/i386/apic=2Eh"
> #endif
>=20
> //#define DEBUG_CMOS
>@@ -124,9 +124,9 @@ void qmp_rtc_reset_reinjection(Error **errp)
>=20
> static bool rtc_policy_slew_deliver_irq(RTCState *s)
> {
>-    apic_reset_irq_delivered();
>+    kvm_reset_irq_delivered();
>     qemu_irq_raise(s->irq);
>-    return apic_get_irq_delivered();
>+    return kvm_get_irq_delivered();
> }
>=20
> static void rtc_coalesced_timer(void *opaque)
>diff --git a/hw/intc/meson=2Ebuild b/hw/intc/meson=2Ebuild
>index bcbf22ff51=2E=2Ecd9f1ee888 100644
>--- a/hw/intc/meson=2Ebuild
>+++ b/hw/intc/meson=2Ebuild
>@@ -25,6 +25,12 @@ softmmu_ss=2Eadd(when: 'CONFIG_XILINX', if_true: files=
('xilinx_intc=2Ec'))
> softmmu_ss=2Eadd(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp=
-ipi=2Ec'))
> softmmu_ss=2Eadd(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pm=
u-iomod-intc=2Ec'))
>=20
>+if config_all_devices=2Ehas_key('CONFIG_APIC') or \
>+   config_all_devices=2Ehas_key('CONFIG_I8259') or \
>+   config_all_devices=2Ehas_key('CONFIG_MC146818RTC')
>+    softmmu_ss=2Eadd(files('kvm_irqcount=2Ec'))
>+endif
>+
> specific_ss=2Eadd(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allw=
inner-a10-pic=2Ec'))
> specific_ss=2Eadd(when: 'CONFIG_APIC', if_true: files('apic=2Ec', 'apic_=
common=2Ec'))
> specific_ss=2Eadd(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpui=
f_common=2Ec'))
>diff --git a/hw/intc/trace-events b/hw/intc/trace-events
>index 6fbc2045e6=2E=2E50cadfb996 100644
>--- a/hw/intc/trace-events
>+++ b/hw/intc/trace-events
>@@ -10,10 +10,6 @@ pic_ioport_read(bool master, uint64_t addr, int val) "=
master %d addr 0x%"PRIx64"
> # apic_common=2Ec
> cpu_set_apic_base(uint64_t val) "0x%016"PRIx64
> cpu_get_apic_base(uint64_t val) "0x%016"PRIx64
>-# coalescing
>-apic_report_irq_delivered(int apic_irq_delivered) "coalescing %d"
>-apic_reset_irq_delivered(int apic_irq_delivered) "old coalescing %d"
>-apic_get_irq_delivered(int apic_irq_delivered) "returning coalescing %d"
>=20
> # apic=2Ec
> apic_local_deliver(int vector, uint32_t lvt) "vector %d delivery mode %d=
"
>@@ -30,6 +26,11 @@ ioapic_mem_read(uint8_t addr, uint8_t regsel, uint8_t =
size, uint32_t val) "ioapi
> ioapic_mem_write(uint8_t addr, uint8_t regsel, uint8_t size, uint32_t va=
l) "ioapic mem write addr 0x%"PRIx8" regsel: 0x%"PRIx8" size 0x%"PRIx8" val=
 0x%"PRIx32
> ioapic_set_irq(int vector, int level) "vector: %d level: %d"
>=20
>+# kvm_irqcount=2Ec
>+kvm_report_irq_delivered(int irq_delivered) "coalescing %d"
>+kvm_reset_irq_delivered(int irq_delivered) "old coalescing %d"
>+kvm_get_irq_delivered(int irq_delivered) "returning coalescing %d"
>+
> # slavio_intctl=2Ec
> slavio_intctl_mem_readl(uint32_t cpu, uint64_t addr, uint32_t ret) "read=
 cpu %d reg 0x%"PRIx64" =3D 0x%x"
> slavio_intctl_mem_writel(uint32_t cpu, uint64_t addr, uint32_t val) "wri=
te cpu %d reg 0x%"PRIx64" =3D 0x%x"

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

