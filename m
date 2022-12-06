Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F060644FBC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 00:40:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2hWR-0000dK-DC; Tue, 06 Dec 2022 18:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p2hWO-0000Yh-U3
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 18:38:44 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p2hWL-0007vS-0j
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 18:38:43 -0500
Received: by mail-ed1-x531.google.com with SMTP id s5so22555696edc.12
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 15:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1r36hXQRsIarn/+55gXwsPeAjGvsw8ROaIlrcLGwDCw=;
 b=he0Sy0OVygTo16tYoeddSRDr/6XbhKrz44gB0JckN0hfAfQMI/ArmltcCys8fqGEHh
 EWOePRhrKZxDsBqtSkANIaEsr2RuOfWdjH3uxWYlGFegFYTt0YE/a94peZnIAFenwQfG
 1+oeu0UH/mC24A1nufB8F/s/CJsaW5l91u9h5Rro7WPPNh0cfCJEkBXzxfaNA/2S6SHu
 E62voHgjCxjUzFeM+9c1SDL0jiBREEQrTJO8/9+Y9AVhPDbviswaVBeeLekbwZ0SNNEf
 my+SEm9e/woVILKWgSCMreFt8Lk7YceBeyBbJ5U4KW1ZsHT1Z3fQ2O20ekrzlntJFsz2
 yTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1r36hXQRsIarn/+55gXwsPeAjGvsw8ROaIlrcLGwDCw=;
 b=ZA07GiMANBxP0BzRnbcNRI9euR8NNEW2wkb8Why/kgei+i6No9U5kW1ZBHmfVleknU
 Wz0p1C0+Oh5Mkcbf+1ntKhB3cpcNWs+XdtIC/BjPsvU+8WkIiGMkkzh7zXTo6TJ5OIfD
 kzIOLcAZcFfuBQYLDCf18G4CjO376CwqAlBgNs2WuE6qoAk7I7ghbnbx/UGecA5A6/nf
 SYpAS6uRFGhIF45ofa2BKayRPQM1h6kMndEc68i8wtnm+OMThVI8CNNyAMaBtAgUGBdP
 DvgCs6lHIPlINzau03eioixtwVg7wXpuCrT9Zr8XOAbnSfw5RyVX9AkV3brX1ss3cYJf
 qwBA==
X-Gm-Message-State: ANoB5pm9whhKykpqG6UW2axIYaZvC7o1C5A7Lipoc3frGLdkpSPMSqhy
 Kaj+XaqonONQSzq0yfn+AVQeSmvj4oQ=
X-Google-Smtp-Source: AA0mqf642UefFQ7yMyjU3Svz6aKX3lQH6yQTwau0ZgzX68/qaW1cVwA7PxZcPj6ZMdxr08xPoit4NA==
X-Received: by 2002:aa7:d1c3:0:b0:46c:edb5:afea with SMTP id
 g3-20020aa7d1c3000000b0046cedb5afeamr6828008edp.315.1670369917870; 
 Tue, 06 Dec 2022 15:38:37 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-075-031.78.54.pool.telefonica.de.
 [78.54.75.31]) by smtp.gmail.com with ESMTPSA id
 l18-20020a1709060cd200b00782539a02absm7812826ejh.194.2022.12.06.15.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 15:38:37 -0800 (PST)
Date: Tue, 06 Dec 2022 23:38:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-8=2E0=5D_hw/rtc/mc146818rtc=3A?=
 =?US-ASCII?Q?_Make_this_rtc_device_target_independent?=
In-Reply-To: <20221206200641.339116-1-thuth@redhat.com>
References: <20221206200641.339116-1-thuth@redhat.com>
Message-ID: <5365BEF1-658C-412D-8A95-C5E1A9A5AB7E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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



Am 6=2E Dezember 2022 20:06:41 UTC schrieb Thomas Huth <thuth@redhat=2Ecom=
>:
>The only code that is really, really target dependent is the apic-related
>code in rtc_policy_slew_deliver_irq()=2E By moving this code into the hw/=
i386/
>folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
>function as parameter to mc146818_rtc_init(), we can make the RTC complet=
ely
>target-independent=2E
>
>Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>---
> include/hw/rtc/mc146818rtc=2Eh |  7 +++++--
> hw/alpha/dp264=2Ec             |  2 +-
> hw/hppa/machine=2Ec            |  2 +-
> hw/i386/microvm=2Ec            |  3 ++-
> hw/i386/pc=2Ec                 | 10 +++++++++-
> hw/mips/jazz=2Ec               |  2 +-
> hw/ppc/pnv=2Ec                 |  2 +-
> hw/rtc/mc146818rtc=2Ec         | 34 +++++++++++-----------------------
> hw/rtc/meson=2Ebuild           |  3 +--
> 9 files changed, 32 insertions(+), 33 deletions(-)
>
>diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818rtc=
=2Eh
>index 1db0fcee92=2E=2Ec687953cc4 100644
>--- a/include/hw/rtc/mc146818rtc=2Eh
>+++ b/include/hw/rtc/mc146818rtc=2Eh
>@@ -46,14 +46,17 @@ struct RTCState {
>     Notifier clock_reset_notifier;
>     LostTickPolicy lost_tick_policy;
>     Notifier suspend_notifier;
>+    bool (*policy_slew_deliver_irq)(RTCState *s);
>     QLIST_ENTRY(RTCState) link;
> };
>=20
> #define RTC_ISA_IRQ 8
>=20
>-ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>-                             qemu_irq intercept_irq);
>+ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq interc=
ept_irq,
>+                             bool (*policy_slew_deliver_irq)(RTCState *s=
));
> void rtc_set_memory(ISADevice *dev, int addr, int val);
> int rtc_get_memory(ISADevice *dev, int addr);
>+bool rtc_apic_policy_slew_deliver_irq(RTCState *s);
>+void qmp_rtc_reset_reinjection(Error **errp);
>=20
> #endif /* HW_RTC_MC146818RTC_H */
>diff --git a/hw/alpha/dp264=2Ec b/hw/alpha/dp264=2Ec
>index c502c8c62a=2E=2E8723942b52 100644
>--- a/hw/alpha/dp264=2Ec
>+++ b/hw/alpha/dp264=2Ec
>@@ -118,7 +118,7 @@ static void clipper_init(MachineState *machine)
>     qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
>=20
>     /* Since we have an SRM-compatible PALcode, use the SRM epoch=2E  */
>-    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
>+    mc146818_rtc_init(isa_bus, 1900, rtc_irq, NULL);
>=20
>     /* VGA setup=2E  Don't bother loading the bios=2E  */
>     pci_vga_init(pci_bus);
>diff --git a/hw/hppa/machine=2Ec b/hw/hppa/machine=2Ec
>index de1cc7ab71=2E=2E311031714a 100644
>--- a/hw/hppa/machine=2Ec
>+++ b/hw/hppa/machine=2Ec
>@@ -232,7 +232,7 @@ static void machine_hppa_init(MachineState *machine)
>     assert(isa_bus);
>=20
>     /* Realtime clock, used by firmware for PDC_TOD call=2E */
>-    mc146818_rtc_init(isa_bus, 2000, NULL);
>+    mc146818_rtc_init(isa_bus, 2000, NULL, NULL);
>=20
>     /* Serial ports: Lasi and Dino use a 7=2E272727 MHz clock=2E */
>     serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
>diff --git a/hw/i386/microvm=2Ec b/hw/i386/microvm=2Ec
>index 170a331e3f=2E=2Ed0ed4dca50 100644
>--- a/hw/i386/microvm=2Ec
>+++ b/hw/i386/microvm=2Ec
>@@ -267,7 +267,8 @@ static void microvm_devices_init(MicrovmMachineState =
*mms)
>=20
>     if (mms->rtc =3D=3D ON_OFF_AUTO_ON ||
>         (mms->rtc =3D=3D ON_OFF_AUTO_AUTO && !kvm_enabled())) {
>-        rtc_state =3D mc146818_rtc_init(isa_bus, 2000, NULL);
>+        rtc_state =3D mc146818_rtc_init(isa_bus, 2000, NULL,
>+                                      rtc_apic_policy_slew_deliver_irq);
>         microvm_set_rtc(mms, rtc_state);
>     }
>=20
>diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>index 546b703cb4=2E=2E650e7bc199 100644
>--- a/hw/i386/pc=2Ec
>+++ b/hw/i386/pc=2Ec
>@@ -1244,6 +1244,13 @@ static void pc_superio_init(ISABus *isa_bus, bool =
create_fdctrl,
>     g_free(a20_line);
> }
>=20
>+bool rtc_apic_policy_slew_deliver_irq(RTCState *s)
>+{
>+    apic_reset_irq_delivered();
>+    qemu_irq_raise(s->irq);
>+    return apic_get_irq_delivered();
>+}
>+
> void pc_basic_device_init(struct PCMachineState *pcms,
>                           ISABus *isa_bus, qemu_irq *gsi,
>                           ISADevice **rtc_state,
>@@ -1299,7 +1306,8 @@ void pc_basic_device_init(struct PCMachineState *pc=
ms,
>         pit_alt_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>         rtc_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>     }
>-    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>+    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq,
>+                                   rtc_apic_policy_slew_deliver_irq);

In my PIIX consolidation series [1] I'm instantiating the RTC in the south=
 bridges since embedding the struct in the host device is the preferred new=
 way=2E In the end there is one initialization shared by both PIIX3 and -4=
=2E While PIIX3 (PC) will require rtc_apic_policy_slew_deliver_irq, PIIX4 (=
Malta) won't=2E Furthermore, my goal ist to reuse PIIX4 in the PC machine t=
o eliminate today's Frankenstein PIIX4 ACPI controller=2E Any idea how to s=
olve this?

Thanks,
Bernhard

[1] https://patchew=2Eorg/QEMU/20221204190553=2E3274-1-shentey@gmail=2Ecom=
/

>=20
>     qemu_register_boot_set(pc_boot_set, *rtc_state);
>=20
>diff --git a/hw/mips/jazz=2Ec b/hw/mips/jazz=2Ec
>index 6aefe9a61b=2E=2E50fbd57b23 100644
>--- a/hw/mips/jazz=2Ec
>+++ b/hw/mips/jazz=2Ec
>@@ -356,7 +356,7 @@ static void mips_jazz_init(MachineState *machine,
>     fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), 0x80003000, fds);
>=20
>     /* Real time clock */
>-    mc146818_rtc_init(isa_bus, 1980, NULL);
>+    mc146818_rtc_init(isa_bus, 1980, NULL, NULL);
>     memory_region_init_io(rtc, NULL, &rtc_ops, NULL, "rtc", 0x1000);
>     memory_region_add_subregion(address_space, 0x80004000, rtc);
>=20
>diff --git a/hw/ppc/pnv=2Ec b/hw/ppc/pnv=2Ec
>index 3d01e26f84=2E=2Ec5482554b7 100644
>--- a/hw/ppc/pnv=2Ec
>+++ b/hw/ppc/pnv=2Ec
>@@ -992,7 +992,7 @@ static void pnv_init(MachineState *machine)
>     serial_hds_isa_init(pnv->isa_bus, 0, MAX_ISA_SERIAL_PORTS);
>=20
>     /* Create an RTC ISA device too */
>-    mc146818_rtc_init(pnv->isa_bus, 2000, NULL);
>+    mc146818_rtc_init(pnv->isa_bus, 2000, NULL, NULL);
>=20
>     /*
>      * Create the machine BMC simulator and the IPMI BT device for
>diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>index 1ebb412479=2E=2E9543ae0279 100644
>--- a/hw/rtc/mc146818rtc=2Ec
>+++ b/hw/rtc/mc146818rtc=2Ec
>@@ -44,11 +44,6 @@
> #include "qapi/visitor=2Eh"
> #include "hw/rtc/mc146818rtc_regs=2Eh"
>=20
>-#ifdef TARGET_I386
>-#include "qapi/qapi-commands-misc-target=2Eh"
>-#include "hw/i386/apic=2Eh"
>-#endif
>-
> //#define DEBUG_CMOS
> //#define DEBUG_COALESCED
>=20
>@@ -112,7 +107,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
> static QLIST_HEAD(, RTCState) rtc_devices =3D
>     QLIST_HEAD_INITIALIZER(rtc_devices);
>=20
>-#ifdef TARGET_I386
> void qmp_rtc_reset_reinjection(Error **errp)
> {
>     RTCState *s;
>@@ -124,9 +118,8 @@ void qmp_rtc_reset_reinjection(Error **errp)
>=20
> static bool rtc_policy_slew_deliver_irq(RTCState *s)
> {
>-    apic_reset_irq_delivered();
>-    qemu_irq_raise(s->irq);
>-    return apic_get_irq_delivered();
>+    assert(s->policy_slew_deliver_irq);
>+    return s->policy_slew_deliver_irq(s);
> }
>=20
> static void rtc_coalesced_timer(void *opaque)
>@@ -145,13 +138,6 @@ static void rtc_coalesced_timer(void *opaque)
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
>@@ -922,14 +908,14 @@ static void rtc_realizefn(DeviceState *dev, Error *=
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
>+        if (s->policy_slew_deliver_irq) {
>+            s->coalesced_timer =3D timer_new_ns(rtc_clock, rtc_coalesced=
_timer, s);
>+            break;
>+        }
>+        /* fallthrough */
>     default:
>         error_setg(errp, "Invalid lost tick policy=2E");
>         return;
>@@ -960,7 +946,8 @@ static void rtc_realizefn(DeviceState *dev, Error **e=
rrp)
>     QLIST_INSERT_HEAD(&rtc_devices, s, link);
> }
>=20
>-ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq interc=
ept_irq)
>+ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq interc=
ept_irq,
>+                             bool (*policy_slew_deliver_irq)(RTCState *s=
))
> {
>     DeviceState *dev;
>     ISADevice *isadev;
>@@ -969,6 +956,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_ye=
ar, qemu_irq intercept_irq)
>     isadev =3D isa_new(TYPE_MC146818_RTC);
>     dev =3D DEVICE(isadev);
>     s =3D MC146818_RTC(isadev);
>+    s->policy_slew_deliver_irq =3D policy_slew_deliver_irq;
>     qdev_prop_set_int32(dev, "base_year", base_year);
>     isa_realize_and_unref(isadev, bus, &error_fatal);
>     if (intercept_irq) {
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

