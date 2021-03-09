Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8862332D04
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:15:59 +0100 (CET)
Received: from localhost ([::1]:49740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfxe-0005qs-KG
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1lJf2O-0004Qb-Jn
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:16:52 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:41740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1lJf27-00016o-6v
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:16:34 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id 43C7EA00ED; Tue,  9 Mar 2021 17:09:46 +0100 (CET)
Date: Tue, 9 Mar 2021 17:09:46 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and
 base vt82c686b_isa on it
In-Reply-To: <YEebhGGvGeWpK5+x@work-vm>
Message-ID: <alpine.LMD.2.03.2103091704270.23841@eik.bme.hu>
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
 <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
 <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
 <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
 <YEGDLehnK3Vhp56s@yekko.fritz.box> <YEebhGGvGeWpK5+x@work-vm>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
 BOUNDARY="1117279078-734201382-1615306186=:23841"
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1117279078-734201382-1615306186=:23841
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 9 Mar 2021, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
>> On Thu, Mar 04, 2021 at 11:42:10PM +0100, Philippe Mathieu-Daud=E9 wrote=
:
>>> On 3/4/21 9:16 PM, BALATON Zoltan wrote:
>>>> On Thu, 4 Mar 2021, Philippe Mathieu-Daud=E9 wrote:
>>>>> On 3/2/21 10:11 PM, BALATON Zoltan wrote:
>>>>>> To allow reusing ISA bridge emulation for vt8231_isa move the device
>>>>>> state of vt82c686b_isa emulation in an abstract via_isa class.
>>>>>>
>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>> ---
>>>>>> =A0hw/isa/vt82c686.c=A0=A0=A0=A0=A0=A0=A0 | 70 +++++++++++++++++++++=
+------------------
>>>>>> =A0include/hw/pci/pci_ids.h |=A0 2 +-
>>>>>> =A02 files changed, 40 insertions(+), 32 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>>> index 72234bc4d1..5137f97f37 100644
>>>>>> --- a/hw/isa/vt82c686.c
>>>>>> +++ b/hw/isa/vt82c686.c
>>>>>> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info =3D =
{
>>>>>> =A0};
>>>>>>
>>>>>>
>>>>>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
>>>>>> +#define TYPE_VIA_ISA "via-isa"
>>>>>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
>>>>>>
>>>>>> -struct VT82C686BISAState {
>>>>>> +struct ViaISAState {
>>>>>> =A0=A0=A0=A0 PCIDevice dev;
>>>>>> =A0=A0=A0=A0 qemu_irq cpu_intr;
>>>>>> =A0=A0=A0=A0 ViaSuperIOState *via_sio;
>>>>>> =A0};
>>>>>>
>>>>>> +static const VMStateDescription vmstate_via =3D {
>>>>>> +=A0=A0=A0 .name =3D "via-isa",
>>>>>
>>>>> You changed the migration stream name, so I think we have
>>>>> a problem with migration... No clue how to do that properly.
>>>>
>>>> I don't think these machines support migration or state description of
>>>> vt86c686b was not missing something before these patches that would ma=
ke
>>>> it not work anyway so I did not worry about this too much. I doubt
>>>> anybody wants to migrate a fuloong2e machine so this should not be a
>>>> problem in practice but maybe you can mention it in the release notes =
if
>>>> you think that would be necessary.
>>>
>>> Maybe just add in the description:
>>>
>>>  This change breaks migration back compatibility, but
>>>  this is not an issue for the Fuloong2E machine.
>>
>> Hrm.  If migration was never supported, why is there a vmstate
>> description there at all though?
>>
>> That said, I don't think breaking compat is a problem: that's only an
>> issue where we actually have versioned machine types, which covers
>> only pc, pseries, arm virt and a very few others.  I don't think this
>> device was used on any of them.
>
> Except 'vt82c686b-usb-uhci' is a generic PCI device that anyone can
> instantiate, so it's not actually Fuloong specific.

This is the isa bridge part of vt82c686b which should not be used anywhere=
=20
else than fuloong2e and should not change the usb part.

That the usb-uhci part of this chip appears in the PCI device list may be=
=20
a bug as that's not much useful without the rest of the superio chip but=20
fixing that is beyond this patch I think. There's no reason one would want=
=20
to use vt82c686-usb device on a machine without the vt82c686 chip instead=
=20
or another uhci device matching the hardware of that machine.

I've updated the commit message as Philippe suggested.

Regards,
BALATON Zoltan

> Dave
>
>> --
>> David Gibson=09=09=09| I'll have my music baroque, and my code
>> david AT gibson.dropbear.id.au=09| minimalist, thank you.  NOT _the_ _ot=
her_
>> =09=09=09=09| _way_ _around_!
>> http://www.ozlabs.org/~dgibson
>
>
> --=20
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>
--1117279078-734201382-1615306186=:23841--

