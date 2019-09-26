Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01FBEC47
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 09:03:52 +0200 (CEST)
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDNoc-0000Xc-5f
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 03:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iDNnZ-0008O0-6A
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:02:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iDNnX-0000al-G9
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:02:45 -0400
Received: from 15.mo4.mail-out.ovh.net ([91.121.62.11]:37727)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iDNnV-0000XS-JB
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:02:42 -0400
Received: from player734.ha.ovh.net (unknown [10.108.54.72])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id DFF672089A3
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 09:02:32 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id B048CA2EB3E8;
 Thu, 26 Sep 2019 07:02:21 +0000 (UTC)
Subject: Re: [PATCH 09/20] spapr: Clarify and fix handling of nr_irqs
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190925064534.19155-1-david@gibson.dropbear.id.au>
 <20190925064534.19155-10-david@gibson.dropbear.id.au>
 <55d983fb-3fd9-7442-cdd7-c2dcdb4a0ea9@kaod.org>
 <20190926010324.GQ17405@umbus>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6db79e16-4a79-4cc4-409a-be3d7ea39cda@kaod.org>
Date: Thu, 26 Sep 2019 09:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190926010324.GQ17405@umbus>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Ovh-Tracer-Id: 7099924814524877784
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.121.62.11
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
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/09/2019 03:03, David Gibson wrote:
> On Wed, Sep 25, 2019 at 09:05:34AM +0200, C=E9dric Le Goater wrote:
>> On 25/09/2019 08:45, David Gibson wrote:
>>> Both the XICS and XIVE interrupt backends have a "nr-irqs" property, =
but
>>> it means slightly different things.  For XICS (or, strictly, the ICS)=
 it
>>> indicates the number of "real" external IRQs.  Those start at XICS_IR=
Q_BASE
>>> (0x1000) and don't include the special IPI vector.  For XIVE, however=
, it
>>> includes the whole IRQ space, including XIVE's many IPI vectors.
>>>
>>> The spapr code currently doesn't handle this sensibly, with the nr_ir=
qs
>>> value in SpaprIrq having different meanings depending on the backend.
>>> We fix this by renaming nr_irqs to nr_xirqs and making it always indi=
cate
>>> just the number of external irqs, adjusting the value we pass to XIVE
>>> accordingly.  We also use move to using common constants in most of t=
he
>>> irq configurations, to make it clearer that the IRQ space looks the s=
ame
>>> to the guest (and emulated devices), even if the backend is different=
.
>>>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>
>> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
>>
>> one comment below,
>>
>>> ---
>>>  hw/ppc/spapr_irq.c         | 48 +++++++++++++++---------------------=
--
>>>  include/hw/ppc/spapr_irq.h | 19 +++++++++------
>>>  2 files changed, 31 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
>>> index 8c26fa2d1e..5190a33e08 100644
>>> --- a/hw/ppc/spapr_irq.c
>>> +++ b/hw/ppc/spapr_irq.c
>>> @@ -92,7 +92,7 @@ static void spapr_irq_init_kvm(SpaprMachineState *s=
papr,
>>>   * XICS IRQ backend.
>>>   */
>>> =20
>>> -static void spapr_irq_init_xics(SpaprMachineState *spapr, int nr_irq=
s,
>>> +static void spapr_irq_init_xics(SpaprMachineState *spapr, int nr_xir=
qs,
>>>                                  Error **errp)
>>>  {
>>>      Object *obj;
>>> @@ -102,7 +102,7 @@ static void spapr_irq_init_xics(SpaprMachineState=
 *spapr, int nr_irqs,
>>>      object_property_add_child(OBJECT(spapr), "ics", obj, &error_abor=
t);
>>>      object_property_add_const_link(obj, ICS_PROP_XICS, OBJECT(spapr)=
,
>>>                                     &error_fatal);
>>> -    object_property_set_int(obj, nr_irqs, "nr-irqs",  &error_fatal);
>>> +    object_property_set_int(obj, nr_xirqs, "nr-irqs",  &error_fatal)=
;
>>>      object_property_set_bool(obj, true, "realized", &local_err);
>>>      if (local_err) {
>>>          error_propagate(errp, local_err);
>>> @@ -234,13 +234,9 @@ static void spapr_irq_init_kvm_xics(SpaprMachine=
State *spapr, Error **errp)
>>>      }
>>>  }
>>> =20
>>> -#define SPAPR_IRQ_XICS_NR_IRQS     0x1000
>>> -#define SPAPR_IRQ_XICS_NR_MSIS     \
>>> -    (XICS_IRQ_BASE + SPAPR_IRQ_XICS_NR_IRQS - SPAPR_IRQ_MSI)
>>> -
>>>  SpaprIrq spapr_irq_xics =3D {
>>> -    .nr_irqs     =3D SPAPR_IRQ_XICS_NR_IRQS,
>>> -    .nr_msis     =3D SPAPR_IRQ_XICS_NR_MSIS,
>>> +    .nr_xirqs    =3D SPAPR_NR_XIRQS,
>>> +    .nr_msis     =3D SPAPR_NR_MSIS,
>>>      .ov5         =3D SPAPR_OV5_XIVE_LEGACY,
>>> =20
>>>      .init        =3D spapr_irq_init_xics,
>>> @@ -260,7 +256,7 @@ SpaprIrq spapr_irq_xics =3D {
>>>  /*
>>>   * XIVE IRQ backend.
>>>   */
>>> -static void spapr_irq_init_xive(SpaprMachineState *spapr, int nr_irq=
s,
>>> +static void spapr_irq_init_xive(SpaprMachineState *spapr, int nr_xir=
qs,
>>>                                  Error **errp)
>>>  {
>>>      uint32_t nr_servers =3D spapr_max_server_number(spapr);
>>> @@ -268,7 +264,7 @@ static void spapr_irq_init_xive(SpaprMachineState=
 *spapr, int nr_irqs,
>>>      int i;
>>> =20
>>>      dev =3D qdev_create(NULL, TYPE_SPAPR_XIVE);
>>> -    qdev_prop_set_uint32(dev, "nr-irqs", nr_irqs);
>>> +    qdev_prop_set_uint32(dev, "nr-irqs", nr_xirqs + SPAPR_XIRQ_BASE)=
;
>>>      /*
>>>       * 8 XIVE END structures per CPU. One for each available priorit=
y
>>>       */
>>> @@ -308,7 +304,7 @@ static qemu_irq spapr_qirq_xive(SpaprMachineState=
 *spapr, int irq)
>>>  {
>>>      SpaprXive *xive =3D spapr->xive;
>>> =20
>>> -    if (irq >=3D xive->nr_irqs) {
>>> +    if ((irq < SPAPR_XIRQ_BASE) || (irq >=3D xive->nr_irqs)) {
>>
>> So IPIs cannot be pulsed ? I think that is OK in QEMU.
>=20
> They can be pulsed, they just can't be retrieved via the spapr_qirq()
> interface.  Since that interface basically exists for the spapr root
> devices (VIO and PHBs) to find the qemu_irqs to wire themselves up to,
> I think that's fine.
>=20
> If we discover some reason we need to grab IPI qirqs by global number
> then we can revisit this.

Not from QEMU I think. This is fine.

C.=20

>=20
> I'll add a comment to clarify this in the later patch where I unify
> the qirq implementations.
>=20
>> XIVE unifies all the interrupts at the controller level. Any one can t=
rigger=20
>> an interrupt with a store on the associate ESB page.
>=20
> Absolutely, and nothing's stopping them.
>>
>>>          return NULL;
>>>      }
>>> =20
>>> @@ -409,12 +405,9 @@ static void spapr_irq_init_kvm_xive(SpaprMachine=
State *spapr, Error **errp)
>>>   * with XICS.
>>>   */
>>> =20
>>> -#define SPAPR_IRQ_XIVE_NR_IRQS     0x2000
>>> -#define SPAPR_IRQ_XIVE_NR_MSIS     (SPAPR_IRQ_XIVE_NR_IRQS - SPAPR_I=
RQ_MSI)
>>> -
>>>  SpaprIrq spapr_irq_xive =3D {
>>> -    .nr_irqs     =3D SPAPR_IRQ_XIVE_NR_IRQS,
>>> -    .nr_msis     =3D SPAPR_IRQ_XIVE_NR_MSIS,
>>> +    .nr_xirqs    =3D SPAPR_NR_XIRQS,
>>> +    .nr_msis     =3D SPAPR_NR_MSIS,
>>>      .ov5         =3D SPAPR_OV5_XIVE_EXPLOIT,
>>> =20
>>>      .init        =3D spapr_irq_init_xive,
>>> @@ -450,18 +443,18 @@ static SpaprIrq *spapr_irq_current(SpaprMachine=
State *spapr)
>>>          &spapr_irq_xive : &spapr_irq_xics;
>>>  }
>>> =20
>>> -static void spapr_irq_init_dual(SpaprMachineState *spapr, int nr_irq=
s,
>>> +static void spapr_irq_init_dual(SpaprMachineState *spapr, int nr_xir=
qs,
>>>                                  Error **errp)
>>>  {
>>>      Error *local_err =3D NULL;
>>> =20
>>> -    spapr_irq_xics.init(spapr, spapr_irq_xics.nr_irqs, &local_err);
>>> +    spapr_irq_xics.init(spapr, spapr_irq_xics.nr_xirqs, &local_err);
>>>      if (local_err) {
>>>          error_propagate(errp, local_err);
>>>          return;
>>>      }
>>> =20
>>> -    spapr_irq_xive.init(spapr, spapr_irq_xive.nr_irqs, &local_err);
>>> +    spapr_irq_xive.init(spapr, spapr_irq_xive.nr_xirqs, &local_err);
>>>      if (local_err) {
>>>          error_propagate(errp, local_err);
>>>          return;
>>> @@ -586,12 +579,9 @@ static const char *spapr_irq_get_nodename_dual(S=
paprMachineState *spapr)
>>>  /*
>>>   * Define values in sync with the XIVE and XICS backend
>>>   */
>>> -#define SPAPR_IRQ_DUAL_NR_IRQS     0x2000
>>> -#define SPAPR_IRQ_DUAL_NR_MSIS     (SPAPR_IRQ_DUAL_NR_IRQS - SPAPR_I=
RQ_MSI)
>>> -
>>>  SpaprIrq spapr_irq_dual =3D {
>>> -    .nr_irqs     =3D SPAPR_IRQ_DUAL_NR_IRQS,
>>> -    .nr_msis     =3D SPAPR_IRQ_DUAL_NR_MSIS,
>>> +    .nr_xirqs    =3D SPAPR_NR_XIRQS,
>>> +    .nr_msis     =3D SPAPR_NR_MSIS,
>>>      .ov5         =3D SPAPR_OV5_XIVE_BOTH,
>>> =20
>>>      .init        =3D spapr_irq_init_dual,
>>> @@ -693,10 +683,10 @@ void spapr_irq_init(SpaprMachineState *spapr, E=
rror **errp)
>>>          spapr_irq_msi_init(spapr, spapr->irq->nr_msis);
>>>      }
>>> =20
>>> -    spapr->irq->init(spapr, spapr->irq->nr_irqs, errp);
>>> +    spapr->irq->init(spapr, spapr->irq->nr_xirqs, errp);
>>> =20
>>>      spapr->qirqs =3D qemu_allocate_irqs(spapr->irq->set_irq, spapr,
>>> -                                      spapr->irq->nr_irqs);
>>> +                                      spapr->irq->nr_xirqs + SPAPR_X=
IRQ_BASE);
>>>  }
>>> =20
>>>  int spapr_irq_claim(SpaprMachineState *spapr, int irq, bool lsi, Err=
or **errp)
>>> @@ -804,11 +794,11 @@ int spapr_irq_find(SpaprMachineState *spapr, in=
t num, bool align, Error **errp)
>>>      return first + ics->offset;
>>>  }
>>> =20
>>> -#define SPAPR_IRQ_XICS_LEGACY_NR_IRQS     0x400
>>> +#define SPAPR_IRQ_XICS_LEGACY_NR_XIRQS     0x400
>>> =20
>>>  SpaprIrq spapr_irq_xics_legacy =3D {
>>> -    .nr_irqs     =3D SPAPR_IRQ_XICS_LEGACY_NR_IRQS,
>>> -    .nr_msis     =3D SPAPR_IRQ_XICS_LEGACY_NR_IRQS,
>>> +    .nr_xirqs    =3D SPAPR_IRQ_XICS_LEGACY_NR_XIRQS,
>>> +    .nr_msis     =3D SPAPR_IRQ_XICS_LEGACY_NR_XIRQS,
>>>      .ov5         =3D SPAPR_OV5_XIVE_LEGACY,
>>> =20
>>>      .init        =3D spapr_irq_init_xics,
>>> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
>>> index 5db305165c..a8f9a2ab11 100644
>>> --- a/include/hw/ppc/spapr_irq.h
>>> +++ b/include/hw/ppc/spapr_irq.h
>>> @@ -16,13 +16,18 @@
>>>   * IRQ range offsets per device type
>>>   */
>>>  #define SPAPR_IRQ_IPI        0x0
>>> -#define SPAPR_IRQ_EPOW       0x1000  /* XICS_IRQ_BASE offset */
>>> -#define SPAPR_IRQ_HOTPLUG    0x1001
>>> -#define SPAPR_IRQ_VIO        0x1100  /* 256 VIO devices */
>>> -#define SPAPR_IRQ_PCI_LSI    0x1200  /* 32+ PHBs devices */
>>> =20
>>> -#define SPAPR_IRQ_MSI        0x1300  /* Offset of the dynamic range =
covered
>>> -                                      * by the bitmap allocator */
>>> +#define SPAPR_XIRQ_BASE      XICS_IRQ_BASE /* 0x1000 */
>>> +#define SPAPR_IRQ_EPOW       (SPAPR_XIRQ_BASE + 0x0000)
>>> +#define SPAPR_IRQ_HOTPLUG    (SPAPR_XIRQ_BASE + 0x0001)
>>> +#define SPAPR_IRQ_VIO        (SPAPR_XIRQ_BASE + 0x0100)  /* 256 VIO =
devices */
>>> +#define SPAPR_IRQ_PCI_LSI    (SPAPR_XIRQ_BASE + 0x0200)  /* 32+ PHBs=
 devices */
>>> +
>>> +/* Offset of the dynamic range covered by the bitmap allocator */
>>> +#define SPAPR_IRQ_MSI        (SPAPR_XIRQ_BASE + 0x0300)
>>> +
>>> +#define SPAPR_NR_XIRQS       0x1000
>>> +#define SPAPR_NR_MSIS        (SPAPR_XIRQ_BASE + SPAPR_NR_XIRQS - SPA=
PR_IRQ_MSI)
>>> =20
>>>  typedef struct SpaprMachineState SpaprMachineState;
>>> =20
>>> @@ -32,7 +37,7 @@ int spapr_irq_msi_alloc(SpaprMachineState *spapr, u=
int32_t num, bool align,
>>>  void spapr_irq_msi_free(SpaprMachineState *spapr, int irq, uint32_t =
num);
>>> =20
>>>  typedef struct SpaprIrq {
>>> -    uint32_t    nr_irqs;
>>> +    uint32_t    nr_xirqs;
>>>      uint32_t    nr_msis;
>>>      uint8_t     ov5;
>>> =20
>>>
>>
>=20


