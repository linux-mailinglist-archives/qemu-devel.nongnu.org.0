Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586834DCAE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 01:56:56 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR1kd-0002fQ-BB
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 19:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lR1je-00028N-IH
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 19:55:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lR1jb-0004ys-W5
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 19:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617062151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7YgIem/m7xcmjl1s1NefsGkDRjQ1m5iaYL/IuPrKhU=;
 b=fTLWt+bukT4lnp4erDCCNRBeDzv+W2dU61R9k7MKWUer2Ugg6wtdpdGaPNdvJyTvBK0yUa
 fhNj3WRIEAEEgf6/35YzrI+VEo0+1qaHw0FK9eyopLFl1p/waFmpnZaYmDUXrmBf+9tfNR
 Pia2DxlNox0u1aA6kH3FJoeXCHOqVnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-BBi7EDarMdatBf4W-S0Imw-1; Mon, 29 Mar 2021 19:55:47 -0400
X-MC-Unique: BBi7EDarMdatBf4W-S0Imw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4362C6B9C4;
 Mon, 29 Mar 2021 23:55:46 +0000 (UTC)
Received: from localhost (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE9585D9F0;
 Mon, 29 Mar 2021 23:55:42 +0000 (UTC)
Date: Tue, 30 Mar 2021 01:55:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
Message-ID: <20210330015540.6fde17ea@redhat.com>
In-Reply-To: <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
 <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
 <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Mar 2021 15:32:37 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 3/29/21 12:32 PM, C=C3=A9dric Le Goater wrote:
> > On 3/29/21 6:20 AM, David Gibson wrote: =20
> >> On Thu, Mar 25, 2021 at 09:56:04AM +0100, C=C3=A9dric Le Goater wrote:=
 =20
> >>> On 3/25/21 3:10 AM, David Gibson wrote: =20
> >>>> On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza wr=
ote: =20
> >>>>>
> >>>>>
> >>>>> On 3/22/21 10:03 PM, David Gibson wrote: =20
> >>>>>> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza =
wrote: =20
> >>>>>>> Kernel commit 4bce545903fa ("powerpc/topology: Update
> >>>>>>> topology_core_cpumask") cause a regression in the pseries machine=
 when
> >>>>>>> defining certain SMP topologies [1]. The reasoning behind the cha=
nge is
> >>>>>>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updat=
ing
> >>>>>>> cpu_core_mask"). In short, cpu_core_mask logic was causing troubl=
es with
> >>>>>>> large VMs with lots of CPUs and was changed by cpu_cpu_mask becau=
se, as
> >>>>>>> far as the kernel understanding of SMP topologies goes, both mask=
s are
> >>>>>>> equivalent.
> >>>>>>>
> >>>>>>> Further discussions in the kernel mailing list [2] shown that the
> >>>>>>> powerpc kernel always considered that the number of sockets were =
equal
> >>>>>>> to the number of NUMA nodes. The claim is that it doesn't make se=
nse,
> >>>>>>> for Power hardware at least, 2+ sockets being in the same NUMA no=
de. The
> >>>>>>> immediate conclusion is that all SMP topologies the pseries machi=
ne were
> >>>>>>> supplying to the kernel, with more than one socket in the same NU=
MA node
> >>>>>>> as in [1], happened to be correctly represented in the kernel by
> >>>>>>> accident during all these years.
> >>>>>>>
> >>>>>>> There's a case to be made for virtual topologies being detached f=
rom
> >>>>>>> hardware constraints, allowing maximum flexibility to users. At t=
he same
> >>>>>>> time, this freedom can't result in unrealistic hardware represent=
ations
> >>>>>>> being emulated. If the real hardware and the pseries kernel don't
> >>>>>>> support multiple chips/sockets in the same NUMA node, neither sho=
uld we.
> >>>>>>>
> >>>>>>> Starting in 6.0.0, all sockets must match an unique NUMA node in =
the
> >>>>>>> pseries machine. qtest changes were made to adapt to this new
> >>>>>>> condition. =20
> >>>>>>
> >>>>>> Oof.  I really don't like this idea.  It means a bunch of fiddly w=
ork
> >>>>>> for users to match these up, for no real gain.  I'm also concerned
> >>>>>> that this will require follow on changes in libvirt to not make th=
is a
> >>>>>> really cryptic and irritating point of failure. =20
> >>>>>
> >>>>> Haven't though about required Libvirt changes, although I can say t=
hat there
> >>>>> will be some amount to be mande and it will probably annoy existing=
 users
> >>>>> (everyone that has a multiple socket per NUMA node topology).
> >>>>>
> >>>>> There is not much we can do from the QEMU layer aside from what I'v=
e proposed
> >>>>> here. The other alternative is to keep interacting with the kernel =
folks to
> >>>>> see if there is a way to keep our use case untouched. =20
> >>>>
> >>>> Right.  Well.. not necessarily untouched, but I'm hoping for more
> >>>> replies from C=C3=A9dric to my objections and mpe's.  Even with sock=
ets
> >>>> being a kinda meaningless concept in PAPR, I don't think tying it to
> >>>> NUMA nodes makes sense. =20
> >>>
> >>> I did a couple of replies in different email threads but maybe not
> >>> to all. I felt it was going nowhere :/ Couple of thoughts, =20
> >>
> >> I think I saw some of those, but maybe not all.
> >> =20
> >>> Shouldn't we get rid of the socket concept, die also, under pseries
> >>> since they don't exist under PAPR ? We only have numa nodes, cores,
> >>> threads AFAICT. =20
> >>
> >> Theoretically, yes.  I'm not sure it's really practical, though, since
> >> AFAICT, both qemu and the kernel have the notion of sockets (though
> >> not dies) built into generic code. =20
> >=20
> > Yes. But, AFAICT, these topology notions have not reached "arch/powerpc=
"
> > and PPC Linux only has a NUMA node id, on pseries and powernv.
> >  =20
> >> It does mean that one possible approach here - maybe the best one - is
> >> to simply declare that sockets are meaningless under, so we simply
> >> don't expect what the guest kernel reports to match what's given to
> >> qemu.
> >>
> >> It'd be nice to avoid that if we can: in a sense it's just cosmetic,
> >> but it is likely to surprise and confuse people.
> >> =20
> >>> Should we diverged from PAPR and add extra DT properties "qemu,..." ?
> >>> There are a couple of places where Linux checks for the underlying
> >>> hypervisor already.
> >>> =20
> >>>>> This also means that
> >>>>> 'ibm,chip-id' will probably remain in use since it's the only place=
 where
> >>>>> we inform cores per socket information to the kernel. =20
> >>>>
> >>>> Well.. unless we can find some other sensible way to convey that
> >>>> information.  I haven't given up hope for that yet. =20
> >>>
> >>> Well, we could start by fixing the value in QEMU. It is broken
> >>> today. =20
> >>
> >> Fixing what value, exactly? =20
> >=20
> > The value of the "ibm,chip-id" since we are keeping the property under
> > QEMU. =20
>=20
> David, I believe this has to do with the discussing we had last Friday.
>=20
> I mentioned that the ibm,chip-id property is being calculated in a way th=
at
> promotes the same ibm,chip-id in CPUs that belongs to different NUMA node=
s,
> e.g.:
>=20
> -smp 4,cores=3D4,maxcpus=3D8,threads=3D1 \
> -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=3Dram-node0 \
> -numa node,nodeid=3D1,cpus=3D2-3,cpus=3D6-7,memdev=3Dram-node1

just heads up, 'cpus=3D' is going away (deprecation patch got lost during 6=
.0
but I plan on pushing it during 6.1 devel window),
you can use '-numa cpus,node-id=3Da,core-id=3Db' instead

>=20
>=20
> $ dtc -I dtb -O dts fdt.dtb | grep -B2 ibm,chip-id
> =09=09=09ibm,associativity =3D <0x05 0x00 0x00 0x00 0x00 0x00>;
> =09=09=09ibm,pft-size =3D <0x00 0x19>;
> =09=09=09ibm,chip-id =3D <0x00>;
> --
> =09=09=09ibm,associativity =3D <0x05 0x00 0x00 0x00 0x00 0x01>;
> =09=09=09ibm,pft-size =3D <0x00 0x19>;
> =09=09=09ibm,chip-id =3D <0x00>;
> --
> =09=09=09ibm,associativity =3D <0x05 0x01 0x01 0x01 0x01 0x02>;
> =09=09=09ibm,pft-size =3D <0x00 0x19>;
> =09=09=09ibm,chip-id =3D <0x00>;
> --
> =09=09=09ibm,associativity =3D <0x05 0x01 0x01 0x01 0x01 0x03>;
> =09=09=09ibm,pft-size =3D <0x00 0x19>;
> =09=09=09ibm,chip-id =3D <0x00>;
>=20
> We assign ibm,chip-id=3D0x0 to CPUs 0-3, but CPUs 2-3 are located in a di=
fferent
> NUMA node than 0-1. This would mean that the same socket would belong to
> different NUMA nodes at the same time.
>=20
> I believe this is what Cedric wants to be addressed. Given that the prope=
rty is
> called after the OPAL property ibm,chip-id, the kernel expects that the p=
roperty
> will have the same semantics as in OPAL.
>=20
>=20
>=20
> Thanks,
>=20
>=20
> DHB
>=20
>=20
>=20
>=20
> >  =20
> >>> This is all coming from some work we did last year to evaluate our HW
> >>> (mostly for XIVE) on 2s, 4s, 16s systems on baremetal, KVM and PowerV=
M.
> >>> We saw some real problems because Linux did not have a clear view of =
the
> >>> topology. See the figures here :
> >>>
> >>> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210303174857=
.1760393-9-clg@kaod.org/
> >>>
> >>> The node id is a key parameter for system resource management, memory
> >>> allocation, interrupt affinity, etc. Linux scales much better if used
> >>> correctly. =20
> >>
> >> Well, sure.  And we have all the ibm,associativity stuff to convey the
> >> node ids to the guest (which has its own problems, but not that are
> >> relevant here).  What's throwing me is why getting node IDs correct
> >> has anything to do with socket numbers. =20
> >=20
> >  =20
>=20


