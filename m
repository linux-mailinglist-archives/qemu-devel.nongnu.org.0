Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836F6631E7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:54:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEz9A-0003VL-IN; Mon, 09 Jan 2023 15:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEz97-0003V9-QB
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:53:29 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEz95-0003aH-Rc
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:53:29 -0500
Received: by mail-ej1-x62d.google.com with SMTP id hw16so11456118ejc.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6CN5d6InxkbtHD4ozSf7YOwTNRGsYLNUWZ1vrPHjTo=;
 b=AT1UFHclJkJNzGXPCyVoyl4cwgnxCUSk55Jcp0BnOyViTtb2Q8SILQKm3xMpUzZK0O
 l4Tz7JgdTvLixoskFAFTCaRzKgyw3vhSyb8sbzX/TU3l80Q/E83jRtqVbBNUCf7QSDC0
 F/YzdP8zMMulWqpWBBdurDki6rNhAQTVBoN2LQ/j2RapnJxEDQ+rEcGB51CMO3h2b8sF
 uurRKTVKtB+hTcaxLLIO6FSRt+y3dSFOfc8jW3y3LEGlsH9JCSDBHnCkjCgF2qlwd3KB
 1euCSjKO3564k8vW5EU/H77gaZmxVL8zHaqtGXqXgBXmz5kN/xahvJt1IHCppHUmt29x
 B+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6CN5d6InxkbtHD4ozSf7YOwTNRGsYLNUWZ1vrPHjTo=;
 b=E2vkmK/hvJRU2gg3lBE82qFB2yPrZTO8poL9NSxlJ/5DGz4dG+jddJ0PlAVR/fiMde
 qryPypfzj0aewvzhhtAt5ix316BFezQOMgMSbX7CTd1uZJckovDWIUNbKlEVzh+mwh6n
 rJFEBvt0XWMroFiXtWuWbmop34Vyulb72tAJ5uhdIukr87t8BDzjNCJ69hdF2Aw4hvdL
 xSwy9ZhyoE0+2PG2eItaKPqY3v+hPpGkMCGXso4gE/bNte/J/sB5YyYCT5/DxfxxNypZ
 uLaIlt+jv76DvsYuUaoXeT6yQQsvmUWKEuwPx3j5nUTcouak0m45XnWupHFfLedXiHfX
 wIXg==
X-Gm-Message-State: AFqh2kpj+/bdeFWJkDAOvJGcHjgEH4EeL7JjjZx+afBsFvtzrOiY909a
 6XSTw4XB+W02g1hH+g9v2Ng=
X-Google-Smtp-Source: AMrXdXv4+oaUn8qO1zqjPFnXyc0q4UNamKRp2FjDWzpf0T2/1P/HFkv8NGUZzbcjZKB1Ers3zu+Ung==
X-Received: by 2002:a17:906:3f86:b0:7c1:765:9cfc with SMTP id
 b6-20020a1709063f8600b007c107659cfcmr59051967ejj.34.1673297606070; 
 Mon, 09 Jan 2023 12:53:26 -0800 (PST)
Received: from [127.0.0.1] (ip-185-104-138-30.ptr.icomera.net.
 [185.104.138.30]) by smtp.gmail.com with ESMTPSA id
 ti11-20020a170907c20b00b007c10bb5b4b8sm4099302ejc.224.2023.01.09.12.53.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Jan 2023 12:53:25 -0800 (PST)
Date: Mon, 09 Jan 2023 20:53:23 +0000
From: B <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_4/6=5D_hw/rtc/mc146818rtc=3A_Add_a_prope?=
 =?US-ASCII?Q?rty_for_the_availability_of_the_slew_tick_policy?=
In-Reply-To: <045df8de-c9c4-b68c-29f6-1893724574e4@redhat.com>
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-5-thuth@redhat.com>
 <1bd2f34b-2364-1ce7-a3f4-946e76594344@ilande.co.uk>
 <045df8de-c9c4-b68c-29f6-1893724574e4@redhat.com>
Message-ID: <2B09B877-6814-467D-8102-CF10A3CB9466@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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



Am 9=2E Januar 2023 20:12:29 UTC schrieb Thomas Huth <thuth@redhat=2Ecom>:
>On 04/01/2023 09=2E55, Mark Cave-Ayland wrote:
>> On 03/01/2023 08:47, Thomas Huth wrote:
>>=20
>>> We want to get rid of the "#ifdef TARGET_I386" statements in the mc146=
818
>>> code, so we need a different way to decide whether the slew tick polic=
y
>>> is available or not=2E Introduce a new property "slew-tick-policy-avai=
lable"
>>> which can be set by the machines that support this tick policy=2E
>>>=20
>>> Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>>> ---
>>> =C2=A0 include/hw/rtc/mc146818rtc=2Eh |=C2=A0 1 +
>>> =C2=A0 hw/i386/pc_piix=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 hw/isa/lpc_ich9=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 hw/isa/piix3=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 hw/rtc/mc146818rtc=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 ++++++++++------
>>> =C2=A0 5 files changed, 14 insertions(+), 6 deletions(-)
>>>=20
>>> diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818r=
tc=2Eh
>>> index 1db0fcee92=2E=2E54af63d091 100644
>>> --- a/include/hw/rtc/mc146818rtc=2Eh
>>> +++ b/include/hw/rtc/mc146818rtc=2Eh
>>> @@ -45,6 +45,7 @@ struct RTCState {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QEMUTimer *coalesced_timer;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Notifier clock_reset_notifier;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LostTickPolicy lost_tick_policy;
>>> +=C2=A0=C2=A0=C2=A0 bool slew_tick_policy_available;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Notifier suspend_notifier;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QLIST_ENTRY(RTCState) link;
>>> =C2=A0 };
>>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>>> index bc9ea8cdae=2E=2E382c6add3b 100644
>>> --- a/hw/i386/pc_piix=2Ec
>>> +++ b/hw/i386/pc_piix=2Ec
>>> @@ -233,6 +233,7 @@ static void pc_init1(MachineState *machine,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc_state =3D i=
sa_new(TYPE_MC146818_RTC);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_prop_set_i=
nt32(DEVICE(rtc_state), "base_year", 2000);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_prop_set_bit(DEVICE(r=
tc_state), "slew-tick-policy-available", true);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa_realize_and=
_unref(rtc_state, isa_bus, &error_fatal);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i8257_dma_init(=
isa_bus, 0);
>>> diff --git a/hw/isa/lpc_ich9=2Ec b/hw/isa/lpc_ich9=2Ec
>>> index 498175c1cc=2E=2Eaeab4d8549 100644
>>> --- a/hw/isa/lpc_ich9=2Ec
>>> +++ b/hw/isa/lpc_ich9=2Ec
>>> @@ -733,6 +733,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error *=
*errp)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* RTC */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_prop_set_int32(DEVICE(&lpc->rtc), =
"base_year", 2000);
>>> +=C2=A0=C2=A0=C2=A0 qdev_prop_set_bit(DEVICE(&lpc->rtc), "slew-tick-po=
licy-available", true);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!qdev_realize(DEVICE(&lpc->rtc), BU=
S(isa_bus), errp)) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> diff --git a/hw/isa/piix3=2Ec b/hw/isa/piix3=2Ec
>>> index c68e51ddad=2E=2E825b1cbee2 100644
>>> --- a/hw/isa/piix3=2Ec
>>> +++ b/hw/isa/piix3=2Ec
>>> @@ -316,6 +316,7 @@ static void pci_piix3_realize(PCIDevice *dev, Erro=
r **errp)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* RTC */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_prop_set_int32(DEVICE(&d->rtc), "b=
ase_year", 2000);
>>> +=C2=A0=C2=A0=C2=A0 qdev_prop_set_bit(DEVICE(&d->rtc), "slew-tick-poli=
cy-available", true);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!qdev_realize(DEVICE(&d->rtc), BUS(=
isa_bus), errp)) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>>> index 947d68c257=2E=2E86381a74c3 100644
>>> --- a/hw/rtc/mc146818rtc=2Ec
>>> +++ b/hw/rtc/mc146818rtc=2Ec
>>> @@ -922,14 +922,16 @@ static void rtc_realizefn(DeviceState *dev, Erro=
r **errp)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc_set_date_from_host(isadev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (s->lost_tick_policy) {
>>> -#ifdef TARGET_I386
>>> -=C2=A0=C2=A0=C2=A0 case LOST_TICK_POLICY_SLEW:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->coalesced_timer =3D
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti=
mer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> -#endif
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case LOST_TICK_POLICY_DISCARD:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> +=C2=A0=C2=A0=C2=A0 case LOST_TICK_POLICY_SLEW:
>>> +#ifdef TARGET_I386
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (s->slew_tick_policy_av=
ailable) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s-=
>coalesced_timer =3D timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +#endif
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* fallthrough */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp=
, "Invalid lost tick policy=2E");
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> @@ -989,6 +991,8 @@ static Property mc146818rtc_properties[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("irq", RTCState, isai=
rq, RTC_ISA_IRQ),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_LOSTTICKPOLICY("lost_tick_p=
olicy", RTCState,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lost_tick_policy, LOST_TIC=
K_POLICY_DISCARD),
>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("slew-tick-policy-available", RTC=
State,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slew_tick_policy_availa=
ble, false),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
>>> =C2=A0 };
>>=20
>> My first thought when looking at the new "slew-tick-policy-available" p=
roperty introduced above was that it seems to overlap with the "lost_tick_p=
olicy" property defined just above it using DEFINE_PROP_LOSTTICKPOLICY()=2E
>
>You've got a point here =2E=2E=2E it's a little bit ugly that we have two=
 user-visible properties for the lost tick policy now=2E=2E=2E

Indeed!

>> This made me wonder if a better approach here would be to move the logi=
c that determines if LOST_TICK_POLICY_SLEW is available into the "lost_tick=
_policy" property setter defined at https://gitlab=2Ecom/qemu-project/qemu/=
-/blob/master/hw/core/qdev-properties-system=2Ec#L558=2E=20
>> If you look at the code directly below the link above you can see how s=
et_blocksize() overrides the =2Eset function for qdev_prop_blocksize to pro=
vide additional validation, which is similar to what we are trying to do he=
re=2E
>>=20
>> I think it may be possible to come up with a similar solution for qdev_=
prop_losttickpolicy which makes use of the logic you suggested before i=2Ee=
=2E
>>=20
>>  =C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());
>>=20
>>  =C2=A0=C2=A0=C2=A0 if (!object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHI=
NE)) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =2E=2E=2E=2E
>>  =C2=A0=C2=A0=C2=A0 }
>>=20
>> which can then emit a suitable warning or return an error accordingly=
=2E A quick glance at hw/core/qdev-properties-system=2Ec suggests there are=
 a number of similar examples showing how this could be done=2E
>
>Thanks, I like that idea! I'll give it a try!

Does the microvm need consideration as well?

Best regards,
Bernhard
>
> Thomas
>

