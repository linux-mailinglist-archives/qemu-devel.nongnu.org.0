Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1A64ECDD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Bft-00073D-Ha; Fri, 16 Dec 2022 09:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p6Bfm-00072G-Q1
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:26:50 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p6Bfj-0000r6-JY
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:26:49 -0500
Received: by mail-ed1-x535.google.com with SMTP id z92so3880794ede.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=giMKRsSShRMzXw0TmDtuxVs49Hsw8bb8qLZvpCo//+k=;
 b=T5Br/Zs8/nqrYb2330/7tbBry3W9DDlqpJZJ/mG0gXzOr4tafHThXhA9BjA07wxVcS
 azqE/ycaHlTg8Y2d3yiRosU3MBcLjbUDEJnb+CtuEoUiQFa3hc+kQnLfTrVAKHjrZBuf
 Vo4fD4VYbMXHbITlDwHhoxFtVprEFIRBjA9bA9pdVBn3ceFKLUXkzfgVGZX5qoPXogxu
 IrjcWcyY1JLL063zEDibkPtFwwm4NzXfshcjb8QkcFbGXX+/Us3DktHVWzIPW/OM9ZUL
 QAf+UEmO6mQy54eaUkAttuvJVLmMgITi7LIFClVVeLJDLXcz1sE0h+/qlgkbFz1q6kNO
 BQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=giMKRsSShRMzXw0TmDtuxVs49Hsw8bb8qLZvpCo//+k=;
 b=dYObECSA9Vi2Gv66zkqxYv2jeHbrqHY6vPqvVJAWZoLEaWT9Jy2a3x6I5tvaNZ2oIQ
 OLIa0Nc2sPiGftOARoO7ov+aX+wy1J3m8q4gGH5PxxE+xNe2SU/OgehxOogpiVbyiwOA
 2aiB6izU9u7cn3Ng6a/0CCdth09eLTsUU550jKJl2MgbF7Ty0bMbi3lLUPZwJbhM/y1B
 gPvG90EBxFvYnpKSYcXdx3Dfvm34WcQkrWctkzTGPtN1+qNys1vVF5wZNKLEnCfU4l6H
 gITz9gTwYmCO8bwQFY/dv8oaBnRVTMQyKTXge+wLk3qsrFhclGld+9OsLPPKXHFAZ3CP
 J/3Q==
X-Gm-Message-State: ANoB5pksoHRWxL6Y92BjgEKD7OTRbOBo71U69X+51gRiSAVWmQPRw42z
 uoAH1GcaZP4/bbEIRSLfFYY=
X-Google-Smtp-Source: AA0mqf7TbZD01Y4xAzbsk3OMaM9a+QGvw2Ynep+smuhgBEQbjmbrFcU9z3Yvdzx5mhodtLpuK0lHjA==
X-Received: by 2002:a05:6402:2212:b0:46d:7ed4:1f66 with SMTP id
 cq18-20020a056402221200b0046d7ed41f66mr26884844edb.3.1671200805916; 
 Fri, 16 Dec 2022 06:26:45 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-138-012.78.55.pool.telefonica.de.
 [78.55.138.12]) by smtp.gmail.com with ESMTPSA id
 d22-20020a056402401600b004585eba4baesm912929eda.80.2022.12.16.06.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 06:26:45 -0800 (PST)
Date: Fri, 16 Dec 2022 14:26:36 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_hw/rtc/mc146818rtc=3A_Ma?=
 =?US-ASCII?Q?ke_this_rtc_device_target_independent?=
In-Reply-To: <20221212075600.17408-1-thuth@redhat.com>
References: <20221212075600.17408-1-thuth@redhat.com>
Message-ID: <6D2F0907-4D76-4D06-9728-7F2D16A1873F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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



Am 12=2E Dezember 2022 07:56:00 UTC schrieb Thomas Huth <thuth@redhat=2Eco=
m>:
>The only reason for this code being target dependent is the apic-related
>code in rtc_policy_slew_deliver_irq()=2E Since these apic functions are r=
ather
>simple, we can easily move them into a new, separate file (apic_irqcount=
=2Ec)
>which will always be compiled and linked if either APIC or the mc146818 d=
evice
>are required=2E This way we can get rid of the #ifdef TARGET_I386 switche=
s in
>mc146818rtc=2Ec and declare it in the softmmu_ss instead of specific_ss, =
so
>that the code only gets compiled once for all targets=2E
>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>---
> v3: Move TYPE_APIC_COMMON from apic_internal=2Eh to apic=2Eh and use it
>
> include/hw/i386/apic=2Eh          |  2 ++
> include/hw/i386/apic_internal=2Eh |  2 --
> include/hw/rtc/mc146818rtc=2Eh    |  1 +
> hw/intc/apic_common=2Ec           | 27 -----------------
> hw/intc/apic_irqcount=2Ec         | 53 +++++++++++++++++++++++++++++++++
> hw/rtc/mc146818rtc=2Ec            | 25 +++++-----------
> hw/intc/meson=2Ebuild             |  6 +++-
> hw/rtc/meson=2Ebuild              |  3 +-
> 8 files changed, 69 insertions(+), 50 deletions(-)
> create mode 100644 hw/intc/apic_irqcount=2Ec
>
>diff --git a/include/hw/i386/apic=2Eh b/include/hw/i386/apic=2Eh
>index da1d2fe155=2E=2E24069fb961 100644
>--- a/include/hw/i386/apic=2Eh
>+++ b/include/hw/i386/apic=2Eh
>@@ -1,6 +1,7 @@
> #ifndef APIC_H
> #define APIC_H
>=20
>+#define TYPE_APIC_COMMON "apic-common"
>=20
> /* apic=2Ec */
> void apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_=
mode,
>@@ -9,6 +10,7 @@ int apic_accept_pic_intr(DeviceState *s);
> void apic_deliver_pic_intr(DeviceState *s, int level);
> void apic_deliver_nmi(DeviceState *d);
> int apic_get_interrupt(DeviceState *s);
>+void apic_report_irq_delivered(int delivered);
> void apic_reset_irq_delivered(void);
> int apic_get_irq_delivered(void);
> void cpu_set_apic_base(DeviceState *s, uint64_t val);
>diff --git a/include/hw/i386/apic_internal=2Eh b/include/hw/i386/apic_int=
ernal=2Eh
>index c175e7e718=2E=2Eff018f1778 100644
>--- a/include/hw/i386/apic_internal=2Eh
>+++ b/include/hw/i386/apic_internal=2Eh
>@@ -125,7 +125,6 @@
>=20
> typedef struct APICCommonState APICCommonState;
>=20
>-#define TYPE_APIC_COMMON "apic-common"
> typedef struct APICCommonClass APICCommonClass;
> DECLARE_OBJ_CHECKERS(APICCommonState, APICCommonClass,
>                      APIC_COMMON, TYPE_APIC_COMMON)
>@@ -199,7 +198,6 @@ typedef struct VAPICState {
>=20
> extern bool apic_report_tpr_access;
>=20
>-void apic_report_irq_delivered(int delivered);
> bool apic_next_timer(APICCommonState *s, int64_t current_time);
> void apic_enable_tpr_access_reporting(DeviceState *d, bool enable);
> void apic_enable_vapic(DeviceState *d, hwaddr paddr);
>diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818rtc=
=2Eh
>index 1db0fcee92=2E=2E45bcd6f040 100644
>--- a/include/hw/rtc/mc146818rtc=2Eh
>+++ b/include/hw/rtc/mc146818rtc=2Eh
>@@ -55,5 +55,6 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year=
,
>                              qemu_irq intercept_irq);
> void rtc_set_memory(ISADevice *dev, int addr, int val);
> int rtc_get_memory(ISADevice *dev, int addr);
>+void qmp_rtc_reset_reinjection(Error **errp);
>=20
> #endif /* HW_RTC_MC146818RTC_H */
>diff --git a/hw/intc/apic_common=2Ec b/hw/intc/apic_common=2Ec
>index 2a20982066=2E=2Eb0f85f9384 100644
>--- a/hw/intc/apic_common=2Ec
>+++ b/hw/intc/apic_common=2Ec
>@@ -33,7 +33,6 @@
> #include "hw/sysbus=2Eh"
> #include "migration/vmstate=2Eh"
>=20
>-static int apic_irq_delivered;
> bool apic_report_tpr_access;
>=20
> void cpu_set_apic_base(DeviceState *dev, uint64_t val)
>@@ -122,32 +121,6 @@ void apic_handle_tpr_access_report(DeviceState *dev,=
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
>diff --git a/hw/intc/apic_irqcount=2Ec b/hw/intc/apic_irqcount=2Ec
>new file mode 100644
>index 0000000000=2E=2E0aadef1cb5
>--- /dev/null
>+++ b/hw/intc/apic_irqcount=2Ec
>@@ -0,0 +1,53 @@
>+/*
>+ * APIC support - functions for counting the delivered IRQs=2E
>+ * (this code is in a separate file since it is used from the
>+ * mc146818rtc code on targets without APIC, too)
>+ *
>+ *  Copyright (c) 2011      Jan Kiszka, Siemens AG
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
>+#include "hw/i386/apic=2Eh"
>+#include "trace=2Eh"
>+
>+static int apic_irq_delivered;
>+
>+void apic_report_irq_delivered(int delivered)
>+{
>+    apic_irq_delivered +=3D delivered;
>+
>+    trace_apic_report_irq_delivered(apic_irq_delivered);
>+}
>+
>+void apic_reset_irq_delivered(void)
>+{
>+    /*
>+     * Copy this into a local variable to encourage gcc to emit a plain
>+     * register for a sys/sdt=2Eh marker=2E  For details on this workaro=
und, see:
>+     * https://sourceware=2Eorg/bugzilla/show_bug=2Ecgi?id=3D13296
>+     */
>+    volatile int a_i_d =3D apic_irq_delivered;
>+    trace_apic_reset_irq_delivered(a_i_d);
>+
>+    apic_irq_delivered =3D 0;
>+}
>+
>+int apic_get_irq_delivered(void)
>+{
>+    trace_apic_get_irq_delivered(apic_irq_delivered);
>+
>+    return apic_irq_delivered;
>+}
>diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>index 1ebb412479=2E=2Ed524dc02c2 100644
>--- a/hw/rtc/mc146818rtc=2Ec
>+++ b/hw/rtc/mc146818rtc=2Ec
>@@ -43,11 +43,7 @@
> #include "qapi/qapi-events-misc=2Eh"
> #include "qapi/visitor=2Eh"
> #include "hw/rtc/mc146818rtc_regs=2Eh"
>-
>-#ifdef TARGET_I386
>-#include "qapi/qapi-commands-misc-target=2Eh"
> #include "hw/i386/apic=2Eh"
>-#endif
>=20
> //#define DEBUG_CMOS
> //#define DEBUG_COALESCED
>@@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
> static QLIST_HEAD(, RTCState) rtc_devices =3D
>     QLIST_HEAD_INITIALIZER(rtc_devices);
>=20
>-#ifdef TARGET_I386
> void qmp_rtc_reset_reinjection(Error **errp)
> {
>     RTCState *s;
>@@ -145,13 +140,6 @@ static void rtc_coalesced_timer(void *opaque)
>=20
>     rtc_coalesced_timer_update(s);
> }
>-#else
>-static bool rtc_policy_slew_deliver_irq(RTCState *s)
>-{
>-    assert(0);
>-    return false;
>-}
>-#endif
>=20
> static uint32_t rtc_periodic_clock_ticks(RTCState *s)
> {
>@@ -922,14 +910,15 @@ static void rtc_realizefn(DeviceState *dev, Error *=
*errp)
>     rtc_set_date_from_host(isadev);
>=20
>     switch (s->lost_tick_policy) {
>-#ifdef TARGET_I386
>-    case LOST_TICK_POLICY_SLEW:
>-        s->coalesced_timer =3D
>-            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>-        break;
>-#endif
>     case LOST_TICK_POLICY_DISCARD:
>         break;
>+    case LOST_TICK_POLICY_SLEW:
>+        /* Slew tick policy is only available if the machine has an APIC=
 */
>+        if (object_resolve_path_type("", TYPE_APIC_COMMON, NULL) !=3D NU=
LL) {

This looks like an attempt to fish out x86 machines to preserve behavior=
=2E Does this also work for PIC-only x86 machines such as -M isapc?

Best regards,
Bernhard

>+            s->coalesced_timer =3D timer_new_ns(rtc_clock, rtc_coalesced=
_timer, s);
>+            break;
>+        }
>+        /* fallthrough */
>     default:
>         error_setg(errp, "Invalid lost tick policy=2E");
>         return;
>diff --git a/hw/intc/meson=2Ebuild b/hw/intc/meson=2Ebuild
>index bcbf22ff51=2E=2E036ad1936b 100644
>--- a/hw/intc/meson=2Ebuild
>+++ b/hw/intc/meson=2Ebuild
>@@ -25,8 +25,12 @@ softmmu_ss=2Eadd(when: 'CONFIG_XILINX', if_true: files=
('xilinx_intc=2Ec'))
> softmmu_ss=2Eadd(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp=
-ipi=2Ec'))
> softmmu_ss=2Eadd(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pm=
u-iomod-intc=2Ec'))
>=20
>-specific_ss=2Eadd(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allw=
inner-a10-pic=2Ec'))
>+if config_all_devices=2Ehas_key('CONFIG_APIC') or config_all_devices=2Eh=
as_key('CONFIG_MC146818RTC')
>+    softmmu_ss=2Eadd(files('apic_irqcount=2Ec'))
>+endif
> specific_ss=2Eadd(when: 'CONFIG_APIC', if_true: files('apic=2Ec', 'apic_=
common=2Ec'))
>+
>+specific_ss=2Eadd(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allw=
inner-a10-pic=2Ec'))
> specific_ss=2Eadd(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpui=
f_common=2Ec'))
> specific_ss=2Eadd(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv=
3_cpuif=2Ec'))
> specific_ss=2Eadd(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kv=
m=2Ec'))
>diff --git a/hw/rtc/meson=2Ebuild b/hw/rtc/meson=2Ebuild
>index dc33973384=2E=2E34a4d316fa 100644
>--- a/hw/rtc/meson=2Ebuild
>+++ b/hw/rtc/meson=2Ebuild
>@@ -13,5 +13,4 @@ softmmu_ss=2Eadd(when: 'CONFIG_ASPEED_SOC', if_true: fi=
les('aspeed_rtc=2Ec'))
> softmmu_ss=2Eadd(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_r=
tc=2Ec'))
> softmmu_ss=2Eadd(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc=2Ec')=
)
> softmmu_ss=2Eadd(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-=
rtc=2Ec'))
>-
>-specific_ss=2Eadd(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rt=
c=2Ec'))
>+softmmu_ss=2Eadd(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc=
=2Ec'))

