Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D655C1EBB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 12:14:41 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEshU-0003LZ-06
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 06:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iEsgR-0002mN-Vy
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 06:13:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iEsgO-00059n-Hj
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 06:13:33 -0400
Received: from 19.mo4.mail-out.ovh.net ([87.98.179.66]:52402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iEsgO-000597-BK
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 06:13:32 -0400
Received: from player762.ha.ovh.net (unknown [10.109.143.238])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id BA2F92093D4
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 12:13:29 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 2EF40A61F950;
 Mon, 30 Sep 2019 10:13:18 +0000 (UTC)
Subject: Re: [PATCH v2 21/33] spapr, xics, xive: Move cpu_intc_create from
 SpaprIrq to SpaprInterruptController
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
 <20190927055028.11493-22-david@gibson.dropbear.id.au>
 <20190927121649.5b9f3db7@bahia.lan> <20190930014904.GB11105@umbus.fritz.box>
 <adb67721-5c4e-50ac-f459-a48570a45d6e@kaod.org>
 <20190930061445.GG11105@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <75672a0f-6bae-406c-0f0c-d23cc58c9c9f@kaod.org>
Date: Mon, 30 Sep 2019 12:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190930061445.GG11105@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Ovh-Tracer-Id: 15368815205646961433
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgedvgddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.179.66
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2019 08:14, David Gibson wrote:
> On Mon, Sep 30, 2019 at 07:28:45AM +0200, C=E9dric Le Goater wrote:
>> On 30/09/2019 03:49, David Gibson wrote:
>>> On Fri, Sep 27, 2019 at 12:16:49PM +0200, Greg Kurz wrote:
>>>> On Fri, 27 Sep 2019 15:50:16 +1000
>>>> David Gibson <david@gibson.dropbear.id.au> wrote:
>>>>
>>>>> This method essentially represents code which belongs to the interr=
upt
>>>>> controller, but needs to be called on all possible intcs, rather th=
an
>>>>> just the currently active one.  The "dual" version therefore calls
>>>>> into the xics and xive versions confusingly.
>>>>>
>>>>> Handle this more directly, by making it instead a method on the int=
c
>>>>> backend, and always calling it on every backend that exists.
>>>>>
>>>>> While we're there, streamline the error reporting a bit.
>>>>>
>>>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>> [snip]
>>>>> @@ -525,6 +469,30 @@ static void spapr_irq_check(SpaprMachineState =
*spapr, Error **errp)
>>>>>  /*
>>>>>   * sPAPR IRQ frontend routines for devices
>>>>>   */
>>>>> +int spapr_irq_cpu_intc_create(SpaprMachineState *spapr,
>>>>> +                              PowerPCCPU *cpu, Error **errp)
>>>>> +{
>>>>> +    if (spapr->xive) {
>>>>> +        SpaprInterruptController *intc =3D SPAPR_INTC(spapr->xive)=
;
>>>>> +        SpaprInterruptControllerClass *sicc =3D SPAPR_INTC_GET_CLA=
SS(intc);
>>>>> +
>>>>> +        if (sicc->cpu_intc_create(intc, cpu, errp) < 0) {
>>>>> +            return -1;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    if (spapr->ics) {
>>>>> +        SpaprInterruptController *intc =3D SPAPR_INTC(spapr->ics);
>>>>> +        SpaprInterruptControllerClass *sicc =3D SPAPR_INTC_GET_CLA=
SS(intc);
>>>>> +
>>>>> +        if (sicc->cpu_intc_create(intc, cpu, errp) < 0) {
>>>>> +            return -1;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>
>>>> Instead of these hooks, what about open-coding spapr_xive_cpu_intc_c=
reate()
>>>> and xics_spapr_cpu_intc_create() directly here, like you already did=
 for the
>>>> ICS and the XIVE objects in spapr_irq_init() ?
>>>
>>> I'd prefer not to.  The idea is I want to treat this as basically:
>>>
>>> 	foreach_possible_intc(intc)
>>> 		intc::cpu_intc_create(...)
>>>
>>> If I find time I might indeed replace the explicit ics and xive
>>> pointers with just an array of SpaprInterruptController *.
>>
>> Or you could use object_child_foreach() and check for the type. If we =
had
>> a helper object_child_foreach_type(), we could use it elsewhere.
>=20
> I thought about that, but I don't think it quite works.  The
> complication is that the xics device is made explicitly a child of the
> machine, but the xive device has mmio, so it's a SusBusDevice sitting
> on the root bus instead.

PnvXscom works fine with Devices and SysBusDevices.

C.=20


