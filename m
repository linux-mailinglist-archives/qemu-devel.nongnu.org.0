Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC265C2A5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 16:01:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCimI-0001pJ-8z; Tue, 03 Jan 2023 10:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCimG-0001ou-Io
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 10:00:32 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCimD-0005UM-Ve
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 10:00:31 -0500
Received: by mail-ej1-x62e.google.com with SMTP id fc4so74267684ejc.12
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 07:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbiYA4syIWhtRduZhclaU1L2tgKhv+rXny697X1aCUs=;
 b=NGBcWEJ60z4jAHr/GNrWWHcYaozJ4ix789xN/8inLaa0jHhLtY7g67jH54cKvgMQUd
 tCY9zn+Ewx/EvGIfhQfHI24cG54Qd4m9d1GFNfqF3tYKH17uSHKzX8ItuBY2w1gISsbI
 ldMqNqtHKeURkStBKIbs1cOFnXEXiJ4p2M/j2utlLcUYczkbJ6LKU0wZ38aNVOm1kVv8
 KGbYY8V15MbMUDgRhuoG86bOe2YXcUhlZ5CraB+5c5nZyhw3Kc2MyfTPaZRgjRkBsUId
 UFY3LJ3WS87NiZxkPFl0v5e+1Q8aF7NYcUWOvnwYwDH2G8nUgoyJTtLt+w9mo/MVi6Yy
 renA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbiYA4syIWhtRduZhclaU1L2tgKhv+rXny697X1aCUs=;
 b=73W2q4Plkt389UACwHAFEN0f/qtNNeBp2d8MaqtQf8QKVMxl0c7nwX0ugLB+Gbevm4
 5iESDFuAzeg8UiMs3hGX28cYedYLAVDftsDtYnJK0yzPDERvnu33V+6pa57jDWg76g9W
 15Q/557umnSVqpgb+cGJYk+IkBOOjnl2NlHckCM56/xRn1kTnWptqHNoVziY+52ff+Lq
 nyU3o6mcFhtmq5MAeCuBtHKXjOv7fg5CMNOPY3XDBCD6pvxQtih8DBTsVruRv3Wxev+8
 C8g74zCg1ahobeVbjkmpggB75XkX2+9OelBDSiB6VLWb3cpRQTWBxT5V1+w8OMaT/b76
 CiDw==
X-Gm-Message-State: AFqh2kqpDenx5LCKWkq3mgMtR4KfGXzGC/aXkZgpiH26QhvKtR5wS1y2
 Vq8ULPqylbwohNDvEc6R64s=
X-Google-Smtp-Source: AMrXdXu+CctIxDgJz9Gad0PoPYSOoCgBakqcElbnheU92TubV2WTmcN1YNgQ4Ilnk0EDDNqL0vvCOA==
X-Received: by 2002:a17:907:a803:b0:7c3:15cc:76d0 with SMTP id
 vo3-20020a170907a80300b007c315cc76d0mr45901128ejc.47.1672758026794; 
 Tue, 03 Jan 2023 07:00:26 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a19ed0dad62e58f0.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a19e:d0da:d62e:58f0])
 by smtp.gmail.com with ESMTPSA id
 kz5-20020a17090777c500b0084c62b7b7d8sm9683078ejc.187.2023.01.03.07.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 07:00:25 -0800 (PST)
Date: Tue, 03 Jan 2023 15:00:17 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_4/6=5D_hw/rtc/mc146818rtc=3A_Add_a_prope?=
 =?US-ASCII?Q?rty_for_the_availability_of_the_slew_tick_policy?=
In-Reply-To: <20230103084801.20437-5-thuth@redhat.com>
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-5-thuth@redhat.com>
Message-ID: <6EF09153-9E74-4F20-9662-B80C494106D8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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



Am 3=2E Januar 2023 08:47:59 UTC schrieb Thomas Huth <thuth@redhat=2Ecom>:
>We want to get rid of the "#ifdef TARGET_I386" statements in the mc146818
>code, so we need a different way to decide whether the slew tick policy
>is available or not=2E Introduce a new property "slew-tick-policy-availab=
le"
>which can be set by the machines that support this tick policy=2E
>
>Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>---
> include/hw/rtc/mc146818rtc=2Eh |  1 +
> hw/i386/pc_piix=2Ec            |  1 +
> hw/isa/lpc_ich9=2Ec            |  1 +
> hw/isa/piix3=2Ec               |  1 +
> hw/rtc/mc146818rtc=2Ec         | 16 ++++++++++------

IIUC you might also need to inline mc146818_rtc_init() in i386/microvm=2Ec=
 and activate the new property there as well=2E

Best regards,
Bernhard

> 5 files changed, 14 insertions(+), 6 deletions(-)
>
>diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818rtc=
=2Eh
>index 1db0fcee92=2E=2E54af63d091 100644
>--- a/include/hw/rtc/mc146818rtc=2Eh
>+++ b/include/hw/rtc/mc146818rtc=2Eh
>@@ -45,6 +45,7 @@ struct RTCState {
>     QEMUTimer *coalesced_timer;
>     Notifier clock_reset_notifier;
>     LostTickPolicy lost_tick_policy;
>+    bool slew_tick_policy_available;
>     Notifier suspend_notifier;
>     QLIST_ENTRY(RTCState) link;
> };
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index bc9ea8cdae=2E=2E382c6add3b 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -233,6 +233,7 @@ static void pc_init1(MachineState *machine,
>=20
>         rtc_state =3D isa_new(TYPE_MC146818_RTC);
>         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
>+        qdev_prop_set_bit(DEVICE(rtc_state), "slew-tick-policy-available=
", true);
>         isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
>=20
>         i8257_dma_init(isa_bus, 0);
>diff --git a/hw/isa/lpc_ich9=2Ec b/hw/isa/lpc_ich9=2Ec
>index 498175c1cc=2E=2Eaeab4d8549 100644
>--- a/hw/isa/lpc_ich9=2Ec
>+++ b/hw/isa/lpc_ich9=2Ec
>@@ -733,6 +733,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **er=
rp)
>=20
>     /* RTC */
>     qdev_prop_set_int32(DEVICE(&lpc->rtc), "base_year", 2000);
>+    qdev_prop_set_bit(DEVICE(&lpc->rtc), "slew-tick-policy-available", t=
rue);
>     if (!qdev_realize(DEVICE(&lpc->rtc), BUS(isa_bus), errp)) {
>         return;
>     }
>diff --git a/hw/isa/piix3=2Ec b/hw/isa/piix3=2Ec
>index c68e51ddad=2E=2E825b1cbee2 100644
>--- a/hw/isa/piix3=2Ec
>+++ b/hw/isa/piix3=2Ec
>@@ -316,6 +316,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error *=
*errp)
>=20
>     /* RTC */
>     qdev_prop_set_int32(DEVICE(&d->rtc), "base_year", 2000);
>+    qdev_prop_set_bit(DEVICE(&d->rtc), "slew-tick-policy-available", tru=
e);
>     if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
>         return;
>     }
>diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>index 947d68c257=2E=2E86381a74c3 100644
>--- a/hw/rtc/mc146818rtc=2Ec
>+++ b/hw/rtc/mc146818rtc=2Ec
>@@ -922,14 +922,16 @@ static void rtc_realizefn(DeviceState *dev, Error *=
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
>+#ifdef TARGET_I386
>+        if (s->slew_tick_policy_available) {
>+            s->coalesced_timer =3D timer_new_ns(rtc_clock, rtc_coalesced=
_timer, s);
>+            break;
>+        }
>+#endif
>+        /* fallthrough */
>     default:
>         error_setg(errp, "Invalid lost tick policy=2E");
>         return;
>@@ -989,6 +991,8 @@ static Property mc146818rtc_properties[] =3D {
>     DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
>     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
>                                lost_tick_policy, LOST_TICK_POLICY_DISCAR=
D),
>+    DEFINE_PROP_BOOL("slew-tick-policy-available", RTCState,
>+                     slew_tick_policy_available, false),
>     DEFINE_PROP_END_OF_LIST(),
> };
>=20

