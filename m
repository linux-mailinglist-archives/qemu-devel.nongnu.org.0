Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD5659EB0
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 00:47:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBP4r-0006N6-5J; Fri, 30 Dec 2022 18:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pBP4p-0006Mv-1l
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 18:46:15 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pBP4c-0006BW-6M
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 18:46:04 -0500
Received: by mail-ej1-x629.google.com with SMTP id ud5so54234652ejc.4
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfpMdfMdUH58dEA4qPTKu/UXAZgI71eQvCgF/kUFOlM=;
 b=PoZrhH9M9UITEVI79a3WnG/NCx9vo/JHnTMgSUaKwN/eQfvul5lTBRWPdca98uzwx6
 vH6MKDrUe3gz8p2A2jfhcMOutOk7hYtTn9m2WIHeOVRaVQdAd8wZEruBbE8WExdSJ+Yi
 xuXswLIMnl6G6/v+inkLJMcYRcofb+sJTDPkVfyh9kiYjlIVRJ/VdxDGsf1RPKigT52A
 +2xY8+SV69Olq66JlmfZZu5cjb1A6Dpx/4a6+lF6xt9yqk/mqTw66NqIs7fZFf2ls/fp
 wTFkSZ8U17XxphsJu7Wzy1X9wmNQCuCTjA0Xan+R1E4HBDgRv1db2zCiFE6i2kNFNZaY
 ZSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfpMdfMdUH58dEA4qPTKu/UXAZgI71eQvCgF/kUFOlM=;
 b=PyY/rEDoqd2/gLZCNJLnTRxLqxsmPjfJui6Gmff0Z/Ew36pCa2PhQHAOkaVEWocE+S
 lVirjisOXdbKGo5XMvOWTSIRJcA0ZmZ7hiox1sJO5lKSxyuqEGyTHStFS8+wyVUrrFlA
 s9LWmxotP+LFBGBpyx7Vx0POJBDipIO9MIN9CV3CDSHhGOKtXesoXevzJHkQHwmhazFm
 U8JzHtdhAp7ibRGZ4df4dUiz076NR7f3XOhiRpVvVDP2Hwqx69/e7d4I8r9+ibpygcW3
 EzExrqz4DEr/6hn5gh8iP562pjYegIHPyamMdrf/25w+C0jdnxGNYRZsIA1iN4HTYzE0
 jy6w==
X-Gm-Message-State: AFqh2kqpfIHFjjyFPPh1evJPkA+pxwo4jtZpBFRYaDWE/DQCJSWkxa3x
 c/3VJEm1qNCrAheKCAPSb1Y=
X-Google-Smtp-Source: AMrXdXuxel1uXHemYO1WXPhlP8Rrsg7+s+sNVtsbkNt7yhZtlZuyCg5eblgcLDTjPtYIpSoiIhz0OQ==
X-Received: by 2002:a17:906:79d2:b0:7ae:987d:d7f9 with SMTP id
 m18-20020a17090679d200b007ae987dd7f9mr25675991ejo.17.1672443959445; 
 Fri, 30 Dec 2022 15:45:59 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20011ce16f9da9a67a4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:11ce:16f9:da9a:67a4])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a1709064b5a00b007c09da0d773sm10212708ejv.100.2022.12.30.15.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 15:45:59 -0800 (PST)
Date: Fri, 30 Dec 2022 23:45:51 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_hw/rtc/mc146818rtc=3A_Ma?=
 =?US-ASCII?Q?ke_this_rtc_device_target_independent?=
In-Reply-To: <20221229105848.147509-1-thuth@redhat.com>
References: <20221229105848.147509-1-thuth@redhat.com>
Message-ID: <52276B51-B29A-47BD-B5A6-EA2E7A3E69CC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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



Am 29=2E Dezember 2022 10:58:48 UTC schrieb Thomas Huth <thuth@redhat=2Eco=
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
> v4: Check for QEMU_ARCH_I386 instead of looking for an APIC

Can we find a more appropriate name for the helpers than "apic" then? If t=
he slew tick policy is a workaround for (x86-) KVM I propose to do s/apic/k=
vm/ while still compiling for every target=2E

>
> include/hw/i386/apic=2Eh          |  1 +
> include/hw/i386/apic_internal=2Eh |  1 -
> include/hw/rtc/mc146818rtc=2Eh    |  1 +
> hw/intc/apic_common=2Ec           | 27 -----------------
> hw/intc/apic_irqcount=2Ec         | 53 +++++++++++++++++++++++++++++++++
> hw/rtc/mc146818rtc=2Ec            | 26 +++++-----------
> hw/intc/meson=2Ebuild             |  6 +++-
> hw/rtc/meson=2Ebuild              |  3 +-
> 8 files changed, 69 insertions(+), 49 deletions(-)
> create mode 100644 hw/intc/apic_irqcount=2Ec
>
>diff --git a/include/hw/i386/apic=2Eh b/include/hw/i386/apic=2Eh
>index da1d2fe155=2E=2E96b9939425 100644
>--- a/include/hw/i386/apic=2Eh
>+++ b/include/hw/i386/apic=2Eh
>@@ -9,6 +9,7 @@ int apic_accept_pic_intr(DeviceState *s);
> void apic_deliver_pic_intr(DeviceState *s, int level);
> void apic_deliver_nmi(DeviceState *d);
> int apic_get_interrupt(DeviceState *s);
>+void apic_report_irq_delivered(int delivered);
> void apic_reset_irq_delivered(void);
> int apic_get_irq_delivered(void);
> void cpu_set_apic_base(DeviceState *s, uint64_t val);
>diff --git a/include/hw/i386/apic_internal=2Eh b/include/hw/i386/apic_int=
ernal=2Eh
>index c175e7e718=2E=2Ee61ad04769 100644
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
>index 1ebb412479=2E=2E5477ff6dbb 100644
>--- a/hw/rtc/mc146818rtc=2Ec
>+++ b/hw/rtc/mc146818rtc=2Ec
>@@ -31,6 +31,7 @@
> #include "hw/qdev-properties=2Eh"
> #include "hw/qdev-properties-system=2Eh"
> #include "qemu/timer=2Eh"
>+#include "sysemu/arch_init=2Eh"
> #include "sysemu/sysemu=2Eh"
> #include "sysemu/replay=2Eh"
> #include "sysemu/reset=2Eh"
>@@ -43,11 +44,7 @@
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
>@@ -112,7 +109,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
> static QLIST_HEAD(, RTCState) rtc_devices =3D
>     QLIST_HEAD_INITIALIZER(rtc_devices);
>=20
>-#ifdef TARGET_I386
> void qmp_rtc_reset_reinjection(Error **errp)
> {
>     RTCState *s;
>@@ -145,13 +141,6 @@ static void rtc_coalesced_timer(void *opaque)
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
>@@ -922,14 +911,15 @@ static void rtc_realizefn(DeviceState *dev, Error *=
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
>+        /* Slew tick policy is only available on x86 */
>+        if (arch_type =3D=3D QEMU_ARCH_I386) {

This reflects the intention much better than before, which is nice=2E

How does `arch_type` play together with qemu-system-all? IIUC it should be=
 possible to load all arch backends simultaneously while `arch_type` is an =
external symbol defined by each arch backend differently=2E So this seems t=
o conflict=2E

Can we just add a property such as "slew-tick-policy-available" instead? I=
t should default to false and all x86 machines would need to opt in explici=
tly=2E We could even error out in rtc_realize() if an attempt is made to en=
able the workaround although not available=2E

I still wonder if the slew tick policy is a workaround specific for x86-KV=
M=2E If so, we might only set the property to true if KVM is enabled=2E

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

