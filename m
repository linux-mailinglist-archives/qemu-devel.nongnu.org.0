Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD0232020
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 16:13:52 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0mq7-000369-P7
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 10:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k0mok-0001sa-C5
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 10:12:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51837
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k0moh-0007j3-F1
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 10:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596031942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4K2PYbh56+H98+KzbVF2TraRLsMvRA+0Y6yS8P9YG78=;
 b=gt0X+2ARIK/CGXMUG3fRdiGzfOqDpLoiR++Dg32kCUgMYKnji8q7Eft1K/5b+SFeTOY12o
 0NW0B+H2DufEWDUyYDjx/1OTdcA981828lSQM+z+kwQP2tWpq2IQ+onSi+f9cIgTwVk55C
 3prrKkwYx3paK6HTojvjNCd7Sm3zm3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-r_4nS9KWNDyBOdQ4YHxrmg-1; Wed, 29 Jul 2020 10:12:19 -0400
X-MC-Unique: r_4nS9KWNDyBOdQ4YHxrmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D671DE1;
 Wed, 29 Jul 2020 14:12:17 +0000 (UTC)
Received: from localhost (unknown [10.40.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D959B6FEC6;
 Wed, 29 Jul 2020 14:12:15 +0000 (UTC)
Date: Wed, 29 Jul 2020 16:12:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v2 1/3] hw/i386: Initialize topo_ids from
 CpuInstanceProperties
Message-ID: <20200729161213.3daa3933@redhat.com>
In-Reply-To: <5df170bd-ea91-8347-a2cf-7ac234248197@amd.com>
References: <159362436285.36204.986406297373871949.stgit@naples-babu.amd.com>
 <159362466108.36204.3751851750959980962.stgit@naples-babu.amd.com>
 <20200713110822.5495e1c6@redhat.com>
 <78809d9f-a491-8c99-3f35-7f012c7d75bf@amd.com>
 <20200713181740.16a357a6@redhat.com>
 <47dc6238-bb71-d679-f58a-f574eb36d572@amd.com>
 <20200713193221.27674630@redhat.com>
 <4003b476-afdb-74a1-4f9f-1387aae6c4e8@amd.com>
 <20200724190518.0f7a2b6b@redhat.com>
 <5b32c961-4fd0-8b8c-4475-eafff2ae48a9@amd.com>
 <20200727191416.2bf6e34a@redhat.com>
 <5df170bd-ea91-8347-a2cf-7ac234248197@amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 09:17:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Jul 2020 18:59:42 -0500
Babu Moger <babu.moger@amd.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov <imammedo@redhat.com>
> > Sent: Monday, July 27, 2020 12:14 PM
> > To: Moger, Babu <Babu.Moger@amd.com>
> > Cc: qemu-devel@nongnu.org; pbonzini@redhat.com; ehabkost@redhat.com;
> > rth@twiddle.net
> > Subject: Re: [PATCH v2 1/3] hw/i386: Initialize topo_ids from
> > CpuInstanceProperties
> >=20
> > On Mon, 27 Jul 2020 10:49:08 -0500
> > Babu Moger <babu.moger@amd.com> wrote:
> >  =20
> > > > -----Original Message-----
> > > > From: Igor Mammedov <imammedo@redhat.com>
> > > > Sent: Friday, July 24, 2020 12:05 PM
> > > > To: Moger, Babu <Babu.Moger@amd.com>
> > > > Cc: qemu-devel@nongnu.org; pbonzini@redhat.com; =20
> > ehabkost@redhat.com; =20
> > > > rth@twiddle.net
> > > > Subject: Re: [PATCH v2 1/3] hw/i386: Initialize topo_ids from
> > > > CpuInstanceProperties
> > > >
> > > > On Mon, 13 Jul 2020 14:30:29 -0500
> > > > Babu Moger <babu.moger@amd.com> wrote:
> > > > =20
> > > > > > -----Original Message-----
> > > > > > From: Igor Mammedov <imammedo@redhat.com>
> > > > > > Sent: Monday, July 13, 2020 12:32 PM
> > > > > > To: Moger, Babu <Babu.Moger@amd.com>
> > > > > > Cc: pbonzini@redhat.com; rth@twiddle.net; ehabkost@redhat.com;
> > > > > > qemu- devel@nongnu.org
> > > > > > Subject: Re: [PATCH v2 1/3] hw/i386: Initialize topo_ids from
> > > > > > CpuInstanceProperties
> > > > > >
> > > > > > On Mon, 13 Jul 2020 11:43:33 -0500 Babu Moger
> > > > > > <babu.moger@amd.com> wrote:
> > > > > > =20
> > > > > > > On 7/13/20 11:17 AM, Igor Mammedov wrote: =20
> > > > > > > > On Mon, 13 Jul 2020 10:02:22 -0500 Babu Moger
> > > > > > > > <babu.moger@amd.com> wrote:
> > > > > > > > =20
> > > > > > > >>> -----Original Message-----
> > > > > > > >>> From: Igor Mammedov <imammedo@redhat.com>
> > > > > > > >>> Sent: Monday, July 13, 2020 4:08 AM
> > > > > > > >>> To: Moger, Babu <Babu.Moger@amd.com>
> > > > > > > >>> Cc: pbonzini@redhat.com; rth@twiddle.net;
> > > > > > > >>> ehabkost@redhat.com;
> > > > > > > >>> qemu- devel@nongnu.org
> > > > > > > >>> Subject: Re: [PATCH v2 1/3] hw/i386: Initialize topo_ids
> > > > > > > >>> from CpuInstanceProperties =20
> > > > > > > > [...] =20
> > > > > > > >>>> +
> > > > > > > >>>> +/*
> > > > > > > >>>> + * Initialize topo_ids from CpuInstanceProperties
> > > > > > > >>>> + * node_id in CpuInstanceProperties(or in CPU device) i=
s
> > > > > > > >>>> +a sequential
> > > > > > > >>>> + * number, but while building the topology =20
> > > > > > > >>> =20
> > > > > > > >>>> we need to separate it for
> > > > > > > >>>> + * each socket(mod nodes_per_pkg). =20
> > > > > > > >>> could you clarify a bit more on why this is necessary? =
=20
> > > > > > > >>
> > > > > > > >> If you have two sockets and 4 numa nodes, node_id in
> > > > > > > >> CpuInstanceProperties will be number sequentially as 0, 1,=
 2, 3.
> > > > > > > >> But in EPYC topology, it will be  0, 1, 0, 1( Basically mo=
d
> > > > > > > >> % number of nodes =20
> > > > > > per socket). =20
> > > > > > > >
> > > > > > > > I'm confused, let's suppose we have 2 EPYC sockets with 2
> > > > > > > > nodes per socket so APIC id woulbe be composed like:
> > > > > > > >
> > > > > > > >  1st socket
> > > > > > > >    pkg_id(0) | node_id(0)
> > > > > > > >    pkg_id(0) | node_id(1)
> > > > > > > >
> > > > > > > >  2nd socket
> > > > > > > >    pkg_id(1) | node_id(0)
> > > > > > > >    pkg_id(1) | node_id(1)
> > > > > > > >
> > > > > > > > if that's the case, then EPYC's node_id here doesn't look
> > > > > > > > like a NUMA node in the sense it's usually used (above
> > > > > > > > config would have 4 different memory controllers =3D> 4 con=
ventional =20
> > NUMA nodes). =20
> > > > > > >
> > > > > > > EPIC model uses combination of socket id and node id to
> > > > > > > identify the numa nodes. So, it internally uses all the infor=
mation. =20
> > > > > >
> > > > > > well with above values, EPYC's node_id doesn't look like it's
> > > > > > specifying a machine numa node, but rather a node index within
> > > > > > single socket. In which case, it doesn't make much sense callin=
g
> > > > > > it NUMA node_id, it's rather some index within a socket. (it
> > > > > > starts looking like terminology is all mixed up)
> > > > > >
> > > > > > If you have access to a milti-socket EPYC machine, can you dump
> > > > > > and post here its apic ids, pls? =20
> > > > >
> > > > > Here is the output from my EPYC machine with 2 sockets and totall=
y
> > > > > 8 nodes(SMT disabled). The cpus 0-31 are in socket 0 and  cpus
> > > > > 32-63 in socket 1.
> > > > >
> > > > > # lscpu
> > > > > Architecture:        x86_64
> > > > > CPU op-mode(s):      32-bit, 64-bit
> > > > > Byte Order:          Little Endian
> > > > > CPU(s):              64
> > > > > On-line CPU(s) list: 0-63
> > > > > Thread(s) per core:  1
> > > > > Core(s) per socket:  32
> > > > > Socket(s):           2
> > > > > NUMA node(s):        8
> > > > > Vendor ID:           AuthenticAMD
> > > > > CPU family:          23
> > > > > Model:               1
> > > > > Model name:          AMD Eng Sample: 1S1901A4VIHF5_30/19_N
> > > > > Stepping:            2
> > > > > CPU MHz:             2379.233
> > > > > CPU max MHz:         1900.0000
> > > > > CPU min MHz:         1200.0000
> > > > > BogoMIPS:            3792.81
> > > > > Virtualization:      AMD-V
> > > > > L1d cache:           32K
> > > > > L1i cache:           64K
> > > > > L2 cache:            512K
> > > > > L3 cache:            8192K
> > > > > NUMA node0 CPU(s):   0-7
> > > > > NUMA node1 CPU(s):   8-15
> > > > > NUMA node2 CPU(s):   16-23
> > > > > NUMA node3 CPU(s):   24-31
> > > > > NUMA node4 CPU(s):   32-39
> > > > > NUMA node5 CPU(s):   40-47
> > > > > NUMA node6 CPU(s):   48-55
> > > > > NUMA node7 CPU(s):   56-63
> > > > >
> > > > > Here is the output of #cpuid  -l 0x8000001e  -r =20
> > > >
> > > >
> > > > (1) =20
> > > > > You may want to refer
> > > > > =20
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
. =20
> > > > > =20
> > > > =20
> > amd.com%2Fsystem%2Ffiles%2FTechDocs%2F54945_3.03_ppr_ZP_B2_pub.zip& =20
> > > > amp =20
> > > > > =20
> > > > =20
> > ;data=3D02%7C01%7Cbabu.moger%40amd.com%7Ceacf7e8facbc4ae2eee808d82 =20
> > > > ff3ca9 =20
> > > > > =20
> > > > =20
> > 0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6373120714103223 =20
> > > > 35&amp; =20
> > > > > =20
> > > > =20
> > sdata=3D%2Fdr93YVlwSq82%2FwRh2NU21Zkw4HJ%2B%2FVVYxAkhCCKJ4w%3D&a =20
> > > > mp;reser =20
> > > > > ved=3D0 (section 2.1.12.2.1.3 ApicId Enumeration Requirements).
> > > > > Note that this is a general guideline. We tried to generalize in
> > > > > qemu as much as possible. It is bit complex. =20
> > > >
> > > >
> > > > =20
> > > > > CPU 0:
> > > > >    0x8000001e 0x00: eax=3D0x00000000 ebx=3D0x00000100 ecx=3D0x000=
00300
> > > > > edx=3D0x00000000 =20
> > > > [...] =20
> > > > > CPU 63:
> > > > >    0x8000001e 0x00: eax=3D0x0000007e ebx=3D0x0000011f ecx=3D0x000=
00307
> > > > > edx=3D0x00000000
> > > > > =20
> > > > > > =20
> > > > > > > =20
> > > > > > > >
> > > > > > > > I wonder if linux guest actually uses node_id encoded in
> > > > > > > > apic id for configuring/checking numa structures, or it jus=
t
> > > > > > > > uses whatever ACPI SRAT table provided.
> > > > > > > > =20
> > > > > > > >>>> + */
> > > > > > > >>>> +static inline void x86_init_topo_ids(X86CPUTopoInfo =20
> > *topo_info, =20
> > > > > > > >>>> +                                     CpuInstancePropert=
ies props,
> > > > > > > >>>> +                                     X86CPUTopoIDs *top=
o_ids) {
> > > > > > > >>>> +    topo_ids->smt_id =3D props.has_thread_id ? props.th=
read_id : 0;
> > > > > > > >>>> +    topo_ids->core_id =3D props.has_core_id ? props.cor=
e_id : 0;
> > > > > > > >>>> +    topo_ids->die_id =3D props.has_die_id ? props.die_i=
d : 0;
> > > > > > > >>>> +    topo_ids->node_id =3D props.has_node_id ?
> > > > > > > >>>> +                        props.node_id %
> > > > > > > >>>> +MAX(topo_info->nodes_per_pkg, 1) : 0; =20
> > > >
> > > > It looks like I was wrong pushing system wide NUMA node-id into API=
C
> > > > ID (choosen naming is confusing a bit), per [1] mentioned above, EP=
YC's =20
> > node-id is: =20
> > > >
> > > > =E2=80=A2 ApicId[6] =3D Socket ID.
> > > > * ApicId[5:4]=3D Node ID.
> > > > =E2=80=A2 ApicId[3] =3D Logical CCX L3 complex ID =E2=80=A2 ApicId[=
2:0]=3D (SMT) ?
> > > > {LogicalCoreID[1:0],ThreadId} : {1'b0,LogicalCoreID[1:0]}
> > > >
> > > > which is can hold only 0-3 values, and defined as:
> > > >
> > > > "A node, is an integrated circuit device that includes one to 8
> > > > cores (one or two Core Complexes)."
> > > >
> > > > spec also mentions it indirectly as die-id if one looks at
> > > > CPUID_Fn8000001E_EBX [Core Identifiers] (Core::X86::Cpuid::CoreId) =
...
> > > >   CoreId =3D ({2'b0, DieId[1:0], LogicalComplexId[0],
> > > > LogicalThreadId[2:0]} >> SMT
> > > >
> > > > and in
> > > > (2)
> > > > CPUID_Fn8000001E_ECX [Node Identifiers] (Core::X86::Cpuid::NodeId) =
...
> > > >   {5'b00000,1'b[SOCKET_ID],2'b[DIE_ID]}
> > > >
> > > > Question is why we did not reuse topo_ids->die_id instead of adding
> > > > confusing topo_ids->node_id in the first place? =20
> > >
> > > Initially, I thought about it. But Intel uses die_id differently than=
 AMD.
> > > So, did not want complicate things.
> > > If we take that route then we need to re-arrange the numa code as we
> > > need to numa information to calculate the die id. So, did not want to
> > > mix up things.
> > > =20
> > > >
> > > > Also looking APIC ID and SRAT table provided here,
> > > > CPUID_Fn8000001E_ECX corresponds to NUMA node id (i.e. what -numa i=
n
> > > > QEMU used for) and Node ID embeded into ApicId[5:4] is basically di=
e-id.
> > > >
> > > > Difference between die-id implemented in QEMU and EPYC's die id
> > > > (topo_ids- =20
> > > > >node_id) is that the former doesn't require numa config (maybe it
> > > > >should, but =20
> > > > ship'salready sailed) and gets number of dies from '-smp dies=3DX' =
CLI
> > > > option, while for EPYC we calculate topo_ids->node_id implicitly
> > > > from number of numa nodes and sockets, which implicitly requires
> > > > that machine 'must' be configured with -numa options.
> > > >
> > > > Maybe we should drop this implicit calculation along with
> > > > topo_ids->node_id and reuse '-smp dies=3DX' plus extra checks for E=
PYC
> > > > to ask for -numa if there is more than 1 die and if we need to be
> > > > really strict, add checks for limit of dies/cores within socket/die
> > > > according to spec[2] so encoded APIC ID and CPUID_8000001E match th=
e =20
> > spec. =20
> > >
> > > There will be complications when user configures with both die_id and
> > > numa_id. It will complicate things further. I will have to look
> > > closely at the code if it is feasible. =20
> >=20
> > it's worth a try.
> > conseptionally die_id in intel/amd is the same. Most likely intel has a=
 dedicated
> > memory controller on each die so it still should form a NUMA node. But =
that
> > aspect probably was ignored while implementing it in QEMU so ping of
> > configuring QEMU right is on user's shoulders (there is no checks whats=
oever if
> > cpu belonging to specific die is on right NUMA node). =20
>=20
> So you are suggesting to use die_id to build the topology for EPYC. Also
> initialize die_id based on the numa information. Re-arrange the numa code
> to make sure we have all the information before we build the topology. An=
d
> then remove the node_id inside X86CPUTopoIDs. Is that the plan?
reusing die_id might simplify logic and at very least we won't have 2 very =
similar
fields to deal with. With die_id it should be conditional on EPYC.

Regardless of using die_id, we should

(1) error out if tolopolgy will require more than 1 numa node and no numa c=
onfig was provided.
(2) for 1 NUMA node use autonuma to create 1 node implicitly, that requres =
converting
static MachineClass::auto_enable_numa into an instance specific value, i.e.=
 moving it
into MachineState, so that we can change it at runtime depending on CPU typ=
e.
(3) use NUMA id from CPU::node-id for CPUID_8000001E and have a checks that=
 will ensure
    that used value is possible to fit in CPUID leaf.

   =20


> > What AMD has implemented on top of that in CPU hw, is to expose NUMA no=
de
> > id in CPUID_8000001E. I don't know why it was done as usually it's ACPI=
 tables
> > that describe relations between nodes so for OS this info almost useles=
s (I'd
> > guess it's faster to use CPUID instead of fetching pre-cpu variable but=
 that's
> > pretty much it from OS point of view)
> >  =20
> > > =20
> > > >
> > > >
> > > > =20
> > > > > > > >>>> +    topo_ids->pkg_id =3D props.has_socket_id ? props.so=
cket_id :
> > > > > > > >>>> +0; }
> > > > > > > >>>>  /*
> > > > > > > >>>>   * Make APIC ID for the CPU 'cpu_index'
> > > > > > > >>>>   *
> > > > > > > >>>> =20
> > > > > > > >> =20
> > > > > > > > =20
> > > > > > > =20
> > > > >
> > > > > =20
> > > =20
>=20
>=20


