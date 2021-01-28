Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F6430757C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:06:52 +0100 (CET)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l564Z-0003ko-GY
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l562P-0002XB-RE
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:04:40 -0500
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:60031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l562N-00050D-J0
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:04:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.97])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 9127325E92C;
 Thu, 28 Jan 2021 13:04:30 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 13:04:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002681a401f-d4b9-486c-82af-52dd653f7205,
 12ABEFCAB104A9A3990DEAE01579FEA45C2F0BE3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 28 Jan 2021 13:04:28 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 4/7] ppc/pnv: Simplify pnv_bmc_create()
Message-ID: <20210128130428.62b9adde@bahia.lan>
In-Reply-To: <9ea1ce11-15ba-3eea-f7a4-b036a9db841f@kaod.org>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-5-clg@kaod.org>
 <CACPK8Xfw-E8TetGdfDYpMZChFbY7cQNGLX8_xh390A-vanS--w@mail.gmail.com>
 <9ea1ce11-15ba-3eea-f7a4-b036a9db841f@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c8be2e09-d400-46d6-9365-ae665a2ee0f6
X-Ovh-Tracer-Id: 12127630850401606051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.33.25; envelope-from=groug@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 08:46:01 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 1/28/21 1:46 AM, Joel Stanley wrote:
> > On Tue, 26 Jan 2021 at 17:14, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >>
> >> and reuse pnv_bmc_set_pnor() to share the setting of the PNOR.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>  hw/ppc/pnv_bmc.c | 7 +------
> >>  1 file changed, 1 insertion(+), 6 deletions(-)
> >>
> >> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> >> index 67ebb16c4d5f..86d16b493539 100644
> >> --- a/hw/ppc/pnv_bmc.c
> >> +++ b/hw/ppc/pnv_bmc.c
> >> @@ -260,13 +260,8 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> >>      Object *obj;
> >>
> >>      obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
> >> -    object_ref(OBJECT(pnor));
> >> -    object_property_add_const_link(obj, "pnor", OBJECT(pnor));
> >=20
> > I assume it's ok to move the link set to after the realise of the BMC o=
bject?
> =20
>=20
> When 2 objects need to be linked, one has to be realized first.=20

Realize isn't a QOM concept in the first place...

> I suppose this is why it is allowed but I am not expert in that area.=20
>=20

... so no surprise object_property_add_const_link() doesn't care
about it.

> Greg  ?
>=20

What is important though is that a property with a given name
can only be added *once* to an object during its lifetime.
Doing the contrary is a bug and QEMU aborts. So, with this
in mind, it seems to me that adding QOM properties to a
device object should only be done from some init path
that is only called once.

> That was the case already when defining a "ipmi-bmc-sim" device on the=20
> command line.=20
>=20

Yeah and the property is added during machine reset... which
is typically a path that can be taken several times during
the machine lifetime. The potential crash is avoided because
pnv_reset() doesn't call pnv_bmc_set_pnor() if pnv->bmc is
already set, but this is a fragile workaround...

A QOM link doesn't look like the correct way to model the BMC
accesses to the PNOR. Since the only user is hiomap_cmd(),
it seems you could reach the same result with a pointer to
the PNOR object being passed to ipmi_sim_register_netfn()
and later passed to hiomap_cmd().

> C.=20
>=20
>=20
> >>      qdev_realize(DEVICE(obj), NULL, &error_fatal);
> >> -
> >> -    /* Install the HIOMAP protocol handlers to access the PNOR */
> >> -    ipmi_sim_register_netfn(IPMI_BMC_SIMULATOR(obj), IPMI_NETFN_OEM,
> >> -                            &hiomap_netfn);
> >> +    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> >>
> >>      return IPMI_BMC(obj);
> >>  }
> >> --
> >> 2.26.2
> >>
> >>
>=20


