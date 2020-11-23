Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604702C02F6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:08:35 +0100 (CET)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8lt-0001YN-V0
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kh8kz-00011t-4j
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:07:37 -0500
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:33076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kh8kw-0000en-Qw
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:07:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 7721B213BDA;
 Mon, 23 Nov 2020 11:07:31 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 11:07:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003d55827ce-aae8-412c-bee8-ff660215ecbe,
 7563B3C8582C4E5C569F12427BEE2CF3FAD9DE82) smtp.auth=groug@kaod.org
Date: Mon, 23 Nov 2020 11:07:29 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 0/8] spapr: Address the confusion between IPI
 numbers and vCPU ids
Message-ID: <20201123110729.19954272@bahia.lan>
In-Reply-To: <97e23014-efa1-4ea3-95dc-1686ef097cf5@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <97e23014-efa1-4ea3-95dc-1686ef097cf5@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 44b1a213-6c19-4460-9fc3-e4eeb2b23721
X-Ovh-Tracer-Id: 9935785206211582432
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqheftdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtieevueekgefgudeigeegledvjeekuedtuedvvdejvefffeetheehhefhkeduhfenucffohhmrghinhepqhgvmhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 09:04:42 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/20/20 6:46 PM, Greg Kurz wrote:
> > A regression was recently fixed in the sPAPR XIVE code for QEMU 5.2
> > RC3 [1]. It boiled down to a confusion between IPI numbers and vCPU
> > ids, which happen to be numerically equal in general, but are really
> > different entities that can diverge in some setups. When this happens,
> > we end up misconfiguring XIVE in a way that is almost fatal for the
> > guest.
> >=20
> > The confusion comes from XICS which has historically assumed equality
> > between interrupt server numbers and vCPU ids, as mentionned in a
> > comment back from 2011 in the linux kernel icp_native_init_one_node()
> > function:
> >=20
> >     /* This code does the theorically broken assumption that the interr=
upt
> >      * server numbers are the same as the hard CPU numbers.
> >      * This happens to be the case so far but we are playing with fire.=
..
> >      * should be fixed one of these days. -BenH.
> >      */
> >=20
> > This assumption crept into QEMU through the "ibm,interrupt-server-range=
s"
> > property of the "interrupt-controller" node in the DT. This property
> > contains ranges of consecutive vCPU ids defined as (first id, # of ids).
> > In the case of QEMU, we define a single range starting from 0 up to the
> > highest vCPU id, as returned by spapr_max_server_number(). This has
> > always been associated to the "nr_servers" wording when naming variables
> > or function arguments. When XIVE got added, we introduced an sPAPR IRQ
> > abstraction to be able to control several interrupt controller backends.
> > The sPAPR IRQ base class provides a dt() handler used to populate the
> > "interrupt-controller" node in the DT. This handler takes an "nr_server"
> > argument inherited from XICS and we ended up using it to populate the
> > "ibm,xive-lisn-ranges" property used with XIVE, which has completely
> > different semantics. It contain ranges of interrupt numbers that the
> > guest can use for any purpose. Since one obvious purpose is IPI, its
> > first range should just be able to accomodate all possible vCPUs.
>=20
> To clarify, PAPR says it is a requirement :
>=20
>   "The first range will contain at least one per possible thread in the=20
>    partition."
>=20
> The regression showed that we were not initializing correctly this range=
=20
> in QEMU/KVM. I an not even sure it had the correct size either since
> we were anyhow initializing 4096 IPIs.
>=20

The bad thing was that each online vCPU would reset it's IPI in
KVM using a bogus IPI number (the vCPU id), and thus doesn't reset
the interrupt the guest is really going to use for the IPI.

> > In the case of QEMU, we define a single range starting from 0 up
> > to "nr_server" but we should rather size it to the number of vCPUs
> > actually (ie. smp.max_cpus).
>=20
> ah. And so spapr_max_server_number(spapr) is crap ? This is starting
> to be complex to follow :/
> =20

No. spapr_max_server_number(spapr) gives the highest vCPU id that
we end over to KVM in order to optimize VP id allocation in the HW.
But it definitely has nothing to do with "ibm,xive-lisn-ranges".

David suggested in some other mail that we could maybe pass
both spapr_max_server_number(spapr) and smp.max_cpus to the
activate() handler.

> > This series aims at getting rid of the "nr_server" argument in the
> > sPAPR IC handlers. Since both the highest possible vCPU id and the
> > maximum number of vCPUs are invariants for XICS and XIVE respectively,
>=20
> What XIVE cares about is the number of possible IPIs and the number
> of vCPUs since we deduced from that the number of event queue=20
> descriptors, which is another XIVE structure.
>=20
> > let's make them device properties to be configured by the machine when
> > it creates the interrupt controllers and use them where needed.
> >=20
> > This doesn't cause any visible change to setups using the default
> > VSMT machine settings. This changes "ibm,xive-lisn-ranges" for
> > setups that mess with VSMT, but this is acceptable since linux
> > only allocates one interrupt per vCPU and the higher part of the
> > range was never used.
>=20
> This range is only used for vCPUs.=20
>=20
> C.
>=20
> > [1] https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D6d24795ee7e3199d1=
99d3c415312c93382ad1807
> >=20
> > Greg Kurz (8):
> >   spapr/xive: Turn some sanity checks into assertions
> >   spapr/xive: Introduce spapr_xive_nr_ends()
> >   spapr/xive: Add "nr-servers" property
> >   spapr/xive: Add "nr-ipis" property
> >   spapr/xics: Drop unused argument to xics_kvm_has_broken_disconnect()
> >   spapr/xics: Add "nr-servers" property
> >   spapr: Drop "nr_servers" argument of the sPAPR IC activate() operation
> >   spapr: Drop "nr_servers" argument of the sPAPR IC dt() operation
> >=20
> >  include/hw/ppc/spapr.h      |  4 +--
> >  include/hw/ppc/spapr_irq.h  |  9 ++---
> >  include/hw/ppc/spapr_xive.h | 25 ++++++++++++-
> >  include/hw/ppc/xics_spapr.h | 23 +++++++++---
> >  hw/intc/spapr_xive.c        | 72 ++++++++++++++++++++++---------------
> >  hw/intc/spapr_xive_kvm.c    |  4 +--
> >  hw/intc/xics_kvm.c          |  4 +--
> >  hw/intc/xics_spapr.c        | 45 ++++++++++++++---------
> >  hw/ppc/spapr.c              |  7 ++--
> >  hw/ppc/spapr_irq.c          | 27 +++++++-------
> >  10 files changed, 141 insertions(+), 79 deletions(-)
> >=20
>=20


