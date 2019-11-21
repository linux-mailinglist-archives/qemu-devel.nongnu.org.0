Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F9104AE0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 07:57:42 +0100 (CET)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXgPN-0008Ag-E5
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 01:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iXgOP-0007dp-NY
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 01:56:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iXgOO-0005nV-BP
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 01:56:41 -0500
Received: from 18.mo6.mail-out.ovh.net ([46.105.73.110]:34624)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iXgOO-0005m8-5B
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 01:56:40 -0500
Received: from player714.ha.ovh.net (unknown [10.108.54.74])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id DB96C1ED756
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 07:56:37 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id E2724C4B8049;
 Thu, 21 Nov 2019 06:56:32 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v5 14/23] ppc/spapr: Implement the XiveFabric
 interface
To: Greg Kurz <groug@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
 <20191115162436.30548-15-clg@kaod.org> <20191120185324.7f859d39@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f2adb826-d62b-e593-3fd0-ddcad3e53771@kaod.org>
Date: Thu, 21 Nov 2019 07:56:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120185324.7f859d39@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 3829467059694832467
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudehuddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.73.110
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/2019 18:53, Greg Kurz wrote:
> On Fri, 15 Nov 2019 17:24:27 +0100
> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
>> The CAM line matching sequence in the pseries machine does not change
>> much apart from the use of the new QOM interfaces. There is an extra
>> indirection because of the sPAPR IRQ backend of the machine. Only the
>> XIVE backend implements the new 'match_nvt' handler.
>>
>=20
> The changelog needs an update since you dropped the indirection you had
> in v4.

Indeed.

>=20
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/ppc/spapr.c | 36 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 94f9d27096af..a8f5850f65bb 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -4270,6 +4270,39 @@ static void spapr_pic_print_info(InterruptStats=
Provider *obj,
>>                     kvm_irqchip_in_kernel() ? "in-kernel" : "emulated"=
);
>>  }
>> =20
>> +static int spapr_xive_match_nvt(XiveFabric *xfb, uint8_t format,
>> +                                uint8_t nvt_blk, uint32_t nvt_idx,
>> +                                bool cam_ignore, uint8_t priority,
>> +                                uint32_t logic_serv, XiveTCTXMatch *m=
atch)
>> +{
>> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(xfb);
>> +    XivePresenter *xptr =3D XIVE_PRESENTER(spapr->xive);
>> +    XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
>> +    int count;
>> +
>=20
> As suggested by David, you should probably assert() that XIVE is in use
> for extra paran^Wsafety.

I don't see the need. The stack call is clear enough IMO. It can only be=20
reached from the XiveRouter.

Thanks,

C.=20

> With these fixed,
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
>> +    count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_igno=
re,
>> +                           priority, logic_serv, match);
>> +    if (count < 0) {
>> +        return count;
>> +    }
>> +
>> +    /*
>> +     * When we implement the save and restore of the thread interrupt
>> +     * contexts in the enter/exit CPU handlers of the machine and the
>> +     * escalations in QEMU, we should be able to handle non dispatche=
d
>> +     * vCPUs.
>> +     *
>> +     * Until this is done, the sPAPR machine should find at least one
>> +     * matching context always.
>> +     */
>> +    if (count =3D=3D 0) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVT %x/%x is not dispat=
ched\n",
>> +                      nvt_blk, nvt_idx);
>> +    }
>> +
>> +    return count;
>> +}
>> +
>>  int spapr_get_vcpu_id(PowerPCCPU *cpu)
>>  {
>>      return cpu->vcpu_id;
>> @@ -4366,6 +4399,7 @@ static void spapr_machine_class_init(ObjectClass=
 *oc, void *data)
>>      PPCVirtualHypervisorClass *vhc =3D PPC_VIRTUAL_HYPERVISOR_CLASS(o=
c);
>>      XICSFabricClass *xic =3D XICS_FABRIC_CLASS(oc);
>>      InterruptStatsProviderClass *ispc =3D INTERRUPT_STATS_PROVIDER_CL=
ASS(oc);
>> +    XiveFabricClass *xfc =3D XIVE_FABRIC_CLASS(oc);
>> =20
>>      mc->desc =3D "pSeries Logical Partition (PAPR compliant)";
>>      mc->ignore_boot_device_suffixes =3D true;
>> @@ -4442,6 +4476,7 @@ static void spapr_machine_class_init(ObjectClass=
 *oc, void *data)
>>      smc->linux_pci_probe =3D true;
>>      smc->smp_threads_vsmt =3D true;
>>      smc->nr_xirqs =3D SPAPR_NR_XIRQS;
>> +    xfc->match_nvt =3D spapr_xive_match_nvt;
>>  }
>> =20
>>  static const TypeInfo spapr_machine_info =3D {
>> @@ -4460,6 +4495,7 @@ static const TypeInfo spapr_machine_info =3D {
>>          { TYPE_PPC_VIRTUAL_HYPERVISOR },
>>          { TYPE_XICS_FABRIC },
>>          { TYPE_INTERRUPT_STATS_PROVIDER },
>> +        { TYPE_XIVE_FABRIC },
>>          { }
>>      },
>>  };
>=20


