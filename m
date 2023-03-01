Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45236A759F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTSQ-00005k-5d; Wed, 01 Mar 2023 15:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXTSO-00005U-0s; Wed, 01 Mar 2023 15:53:48 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXTSL-0002yL-GL; Wed, 01 Mar 2023 15:53:47 -0500
Received: by mail-ed1-x534.google.com with SMTP id da10so59335418edb.3;
 Wed, 01 Mar 2023 12:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677704022;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=37N6RdufKIdCTpO6Ve/gJk3knFNpKE6bFiTzpKezZms=;
 b=c8xnvG4G8Zn5/jjJ/j92Sipvn0lggHaR/5stOpMity4Ip+y+aim9CbuN1AJzJtC/qT
 IzyWBw9MXAmZrwAs+TmEwcqJ8M1OrAHcSQboicnEjkFl6r8CpFoVLeGPx+hVAEzafJcP
 VlqdltUhyKj+Ocw0xIILDKxgiQwS4GuNn5q2jATOaIfkmZL+2P8NnUp2I9L6gADKw1dT
 N2K6e9J1+Xt44dWvvZkkDKXO/ACQER+EiyQsCdW30wTQ5E38tttr/V8Sp9H9VSsNNZm+
 XX2ZUEWChmPk+X/afrFRtrGR7WronUs3YHVeukMM8xKIPcOmkA40dBcOufs4v/bHA0x9
 TFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677704022;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37N6RdufKIdCTpO6Ve/gJk3knFNpKE6bFiTzpKezZms=;
 b=mFkQ5JU/jEi+4Nr0aN00f9LlEbZZ3YXwfOHFUl4FWcIC36EfJfUEZbHPxTCRqugqfj
 8hUm0fBCaLNCDgD2Ctw0s7+kKjkjYLpQK1C2AOqT8JG+AGrZa36gxEybmrltwCzYBcdR
 khIocPO3QKGlwDfnKAJm57IsD7A++I08npt3Bq5MazNV9MwRRoUmIyGpQ+rfYcJHMo3E
 BixDw0rFiFpIG0cMajRWECbhgQu7nxwO+doG8P2Zl6VC78VjB3ZVml3g/G2gl2G/8boC
 qsQDd7nkDBCtIDk6V/3hDACLKFPdAEe+pUV8rUyaU8Yh1PbVKXtUHivqNLhTEnR/Fr13
 zYrQ==
X-Gm-Message-State: AO0yUKUONSHHN2AETcN4NzkDcMfOlbuTn0oatAHGd+AirzTPCRRDzsfO
 mi3g879W+Dsc3lxdx6LsIHk=
X-Google-Smtp-Source: AK7set9YrDdbUgzXMxc7jUX/2a9Df9T4JJVQ21e+paNLf1P9R5wBaN86O4zhGpjwRl9EV9QLwnfRAQ==
X-Received: by 2002:a17:906:3754:b0:877:5938:6f6d with SMTP id
 e20-20020a170906375400b0087759386f6dmr7332177ejc.56.1677704022122; 
 Wed, 01 Mar 2023 12:53:42 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-188-068-061.77.188.pool.telefonica.de.
 [77.188.68.61]) by smtp.gmail.com with ESMTPSA id
 uz25-20020a170907119900b008eb89a435c9sm6104311ejb.164.2023.03.01.12.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 12:53:41 -0800 (PST)
Date: Wed, 01 Mar 2023 20:53:37 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@linaro.org
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <39fb6771-7c81-ffe5-7d18-2950f258a837@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
 <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
 <8AA6E5E4-6E9F-427D-9F65-D79D4FEEC1A0@gmail.com>
 <7df4771f-e6ab-af3d-3e82-98cb1c4dfce0@eik.bme.hu>
 <14710BE7-AD6F-452E-A3F5-3E9B08F95FD3@gmail.com>
 <5840b499-1bae-1e2d-d0bd-e3c8e388299a@ilande.co.uk>
 <39fb6771-7c81-ffe5-7d18-2950f258a837@eik.bme.hu>
Message-ID: <CFC10F0E-E083-4641-9CF9-6014C9E1472C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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



Am 1=2E M=C3=A4rz 2023 19:24:20 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>On Wed, 1 Mar 2023, Mark Cave-Ayland wrote:
>> On 23/02/2023 09:13, Bernhard Beschow wrote:
>>> Am 22=2E Februar 2023 23:00:02 UTC schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>>> Am 22=2E Februar 2023 21:12:01 UTC schrieb BALATON Zoltan <balaton@e=
ik=2Ebme=2Ehu>:
>>>>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>>>>> Am 22=2E Februar 2023 19:25:16 UTC schrieb BALATON Zoltan <balaton=
@eik=2Ebme=2Ehu>:
>>>>>>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>>>>>>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail=
=2Ecom> wrote:
>>>>>>>>>> I've had a closer look at your series and I think it can be sim=
plified:
>>>>>>>>>> Patch 2 can be implemented quite straight-forward like I propos=
ed in a
>>>>>>>>>> private mail: https://github=2Ecom/shentok/qemu/commit/via-priq=
-routing=2E
>>>>>>>>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interr=
upt routing"
>>>>>>>>>> working, one can expose the PCI interrupts with a single line l=
ike you do
>>>>>>>>>> in patch 2=2E With this, patch 1 "hw/isa/vt82c686: Implement in=
terrupt
>>>>>>>>>> routing in via_isa_set_irq" isn't needed any longer and can be =
omitted=2E
>>>>>>>>>>=20
>>>>>>>>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq()=
 can be
>>>>>>>>>> used instead=2E pci_set_irq() internally takes care of all the =
ISA interrupt
>>>>>>>>>> level tracking patch 1 attempted to address=2E
>>>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> Here is a proof of concept branch to demonstrate that the simpli=
fication
>>>>>>>>> actually works: https://github=2Ecom/shentok/qemu/commits/pegaso=
s2 (Tested
>>>>>>>>> with MorphOS with and without pegasos2=2Erom)=2E
>>>>>>>>=20
>>>>>>>> Does this only work because both the via-ac97 and the PCI interru=
pts are mapped to the same ISA IRQ and you've only tested sound? The guest =
could configure each device to use a different IRQ, also mapping them so th=
ey share one ISA interrupt=2E What happens if multiple devices are mapped t=
o IRQ 9 (which is the case on pegasos2 where PCI cards, ac97 and USB all sh=
are this IRQ) and more than one such device wants to raise an interrupt at =
the same time? If you ack the ac97 interrupt but a PCI network card or the =
USB part still wants to get the CPUs attention the ISA IRQ should remain ra=
ised until all devices are serviced=2E
>>>>>>>=20
>>>>>>> pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should han=
dle
>>>>>>> exactly that case very well=2E
>>>>>>>=20
>>>>>>>> I don't see a way to track the status of all devices in a single =
qemu_irq which can only be up or down so we need something to store the sta=
te of each source=2E
>>>>>>>=20
>>>>>>> pci_set_irq() causes pci_bus_change_irq_level() to be called=2E
>>>>>>> pci_bus_change_irq_level() tracks the sum of all irq levels of all
>>>>>>> devices attached to a particular pin in irq_count=2E Have a look a=
t
>>>>>>> pci_bus_change_irq_level() and you will understand better=2E
>>>>>>=20
>>>>>> I'm aware of that, we're using that in sam460ex which connects all =
PCI interrupt lines to a single IRQ and Peter explored and explained it in =
a comment there when that was discovered=2E First we had a patch with or-ir=
q but due to this behaviot that's not needed for PCI interrupts=2E But the =
VT8132 could change what ISA IRQ you route the sub functions to=2E
>>>>>=20
>>>>> That depends on the sub function if you can do that=2E And if so, th=
en it depends on whether the function is still in PCI mode (see below)=2E
>>>>>=20
>>>>>> It happens that on pegasos2 by default all of those are routed to I=
RQ9 except IDE
>>>>>=20
>>>>> All *PCI* interrupts are routed to IRQ9 while IDE legacy interrupts =
are routed to the compatible ISA IRQs=2E Note that the IDE function must on=
ly trigger the ISA IRQs if it is in legacy mode while it must only trigger =
the PCI IRQ in non-legacy mode=2E See https://www=2Ebswd=2Ecom/pciide=2Epdf=
 for more details on this particular topic=2E
>>>>=20
>>>> The docs say so but based on what guests that work on real hardware d=
o it does not work that way=2E Look up previous discussion on this on the l=
ist from around the time Mark changed via-ide about 4-5 years ago=2E That s=
eries was a result of his review of my proposed changes and gave resuled in=
 an alternative appdroach=2E On pegasos2 (and probably also on fuloong2e ba=
sed on same later findings, see patches to that, I can try to find these la=
ter if you can't find them) via-ide *always* uses IRQ 14/15 and the native =
mode only switches register addresses from legacy io ports to PCI io space =
so you can set it in with BAR regs but the IRQs don't change despite what t=
he docs say=2E There are some hacks in Linux kernel and other guests to acc=
ount for this but the comments for the reason are wrong in Linux, they say =
IDE is always in legacy mode but in fact if has a half-native mode which is=
 what I called it where io addresses are set with BARs but IRQs are still t=
he legacy ISA ones=2E You can find some references in previous discussion=
=2E Probably searching for via-ide half-native mode might find it=2E
>>>>=20
>>>>>> but what if a guest changes ac97 to use a different interrupt? Then=
 it's not a PCI interrupt any more so you can't use pci_set_irq in via=3Dac=
97=2E
>>>>>=20
>>>>> How would it do that? AFAICS there is no dedicated register to confi=
gure which IRQ to use=2E This means that it can only trigger an interrupt v=
ia its PCI intx pin which is subject to the PCI -> ISA IRQ router=2E
>>>>=20
>>>> The VIA functions can use their PCI_INTERRUPT_LINE (0x3c) registers t=
o set their ISA IRQ according to the docs (and unlike IDE in other function=
s like USB and sound this probably also works) and the PIRQA-D pins can be =
mapped to ISA IRQs by the 0x55-0x57 config registers of the isa bridge (fun=
ction0)=2E This is what I implemented in via_isa_set_irq() in this series=
=2E
>>>>=20
>>>>>> There are only 4 PCI INT lines but the VIA components can be routed=
 to 13 or 14 ISA IRQs=2E
>>>>>=20
>>>>> Pure PCI components are only able to trigger one of the four PCI int=
x pins they are *hardwired* to=2E
>>>>=20
>>>> This is true for PCI cards which can only use the 4 pins the slot the=
y are in is wired to=2E These come in through the PIRQA-D pins and they are=
 routed with the funstion 0 0x55-0x57 config registers=2E But I'm not sure =
about the internal functions=2E
>>>>=20
>>>>> Each component has only one pin=2E Which ISA IRQ gets triggered thro=
ugh that pin can be selected from 13 or 14 ISA IRQs as you say by means of =
the three configuration registers of the PCI -> ISA IRQ router=2E
>>>>=20
>>>> So you say that internal functions are also wired to the same 4 lines=
 like normal PCI cards?
>>>=20
>>> Yes=2E
>>>=20
>>>> Then how can you route them to different interrupts setting their con=
fig reg 0x3c independent of function0 0x55-0x57 regs?
>>>=20
>>> 0x3c isn't supposed to be interpretet by hardware, and in general hard=
ware can't: 0x3c is standardized for every PCI function which includes stan=
dalone PCI devices in particular=2E Standalone PCI devices don't have acces=
s to an IRQ router=2E So if they don't, how could they possibly configure t=
he IRQ they are triggering?
>>>=20
>>> 0x3c is only information to the OS (populated by the BIOS)=2E It meril=
y indicates that the PCI device needs attention when the IRQ configured in =
0x3c is raised=2E See comment 4 in https://community=2Eosr=2Ecom/discussion=
/30399/read-only-pci-interrupt-line-register for another explanation=2E
>>>=20
>>> Even though the south bridge contains an interrupt router doesn't mean=
 that its PCI functions can configure their IRQ through their 0x3c register=
s=2E That would change the semantics of standardized PCI registers which is=
 surely not permitted by the standard=2E Instead, the PCI IRQs are configur=
ed through the device-specific 0x55-0x57 regs=2E
>>>=20
>>> I see that 0x3c is also used for the USB functions=2E They used to tri=
gger the raw ISA IRQs before your series which seems wrong=2E I think 0x3c =
usage needs to be cleaned up in the VIA model=2E Otherwise this will likely=
 cause problems elsewhere=2E
>>>=20
>>>>=20
>>>>>> How do you keep track of that with only the PCI bus interrupts?
>>>>>=20
>>>>> Devices that operate in ISA mode such as the IDE function shall have=
 their own, dedicated ISA IRQs assigned by the guest=2E Otherwise this caus=
es a classic interrupt conflict, just like in the olden ISA days=2E If the =
function operates in PCI mode, it must not trigger the ISA IRQs, regardless=
 of whether they are assigned or not=2E
>>>>=20
>>>> This does not match with guests which clearly expect to get ISA IRQ9 =
for PCI cards and USB and sound which is where these are routed within the =
VIA bridge as the firmware programs it=2E
>>>=20
>>> What I meant was that a component able to operate in native/legacy/mix=
ed mode such as IDE must not use both PCI and legacy ISA interrupts at the =
same time=2E Multiple PCI functions may of course share interrupts=2E
>>>=20
>>>>=20
>>>>> There is also the power management function whose ACPI interrupt (SC=
I) can be routed by means of a dedicated register=2E Again, a guest must ma=
ke sure here to not configure interrupt conflicts=2E
>>>>>=20
>>>>>> I don't get your approach=2E
>>>>>=20
>>>>> I hope that I could help you get a better understanding=2E The linke=
d =2Epdf is good and comprehensive reading material=2E
>>>>=20
>>>> I'm not sure the via-ide confirms to that doc but it's also not any m=
ore a problem with via-ide now=2E That was discussed to death back then and=
 "fixed" to work for the cases we want it to work with=2E We probably never=
 agreed on how this really works but at least what we ended up with works w=
ith guests that run on real hardware=2E I'm OK with also making these cases=
 work that we want now such as network and sound card under AmigaOS and sou=
nd under MorphOS (as long as you don't use USB) on pegasos2=2E This series =
does that so unless it breaks something that worked before I condider this =
moving forward and we can always improve adn fix it later=2E I'm not saying=
 I'm not interested in your improvements just that let's that not hold this=
 back now as we can fix and improve it later but otherwise users will have =
to wait until September to be able to use it=2E I know a few who want this =
and getting this out as it is would allow more people to test it and report=
 problems so unless there are clearly wrong parts I'm OK with less than per=
fect but working solution as long as it's not too messy=2E
>>>=20
>>> Patch 1 really seems like duplicating PCI code that already exists in =
QEMU=2E This is not needed and we should avoid that=2E
>>>=20
>>> Moreover, usage of the IRQ line register (0x3c) for interrupt routing =
should be switched to using the 0x55-0x57 regs to be PCI compliant=2E
>>>=20
>>> Thanks to your great work to make via-ac97 work we can confirm that bo=
th IRQ routing implementations basically work for now=2E Let's work out a s=
olution that relies on existing code, sticks to the standard and hopefully =
works for i386 and MIPS, too=2E
>>=20
>> FWIW this analysis seems correct to me based upon my experience with ol=
der PCs and reading the various specifications=2E
>
>Have you read the VT82C686B and VT8231 spces which this is about?

Yes, I did=2E

For the USB function it specifies the interrupt line register (offset 0x3c=
) as follows:

  7-4 Reserved=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2Ealways reads 0
  3-0 USB Interrupt Routing=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2Edefault =3D 16h

However, 0x16 doesn't fit into four bits=2E Not even 16 (decimal) would fi=
t because the biggest representable value is 15, i=2Ee=2E 0xf=2E

This makes me wonder if the datasheet is a reliable source describing thes=
e regiserts in the first place=2E

Best regards,
Bernhard

> Other specs may not apply to these chips, they should confirm to their o=
wn docs=2E (But sometimes they may even fail to do that like in case of the=
 IDE part=2E)
>
>Regards,
>BALATON Zoltan

