Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481E6A4285
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:21:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdRT-0007im-59; Mon, 27 Feb 2023 08:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pWdRQ-0007gW-HN; Mon, 27 Feb 2023 08:21:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pWdRO-0004tt-0o; Mon, 27 Feb 2023 08:21:20 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RCp6rV015539; Mon, 27 Feb 2023 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0dQyWyKFFypT3sBoHpxT8vqxBKgb1B8es9OdRG2qFoc=;
 b=qfZr44ZrxZc9iiHE8hAMR/irihThCNhWBZ+ukQdG2MtiS8Xv1m9gQXYjsuRxcwFKDP7G
 o18Ke35efP3UFDOI+fYBYRqdNUmZkBiLLBCKF5MulT++t+SkpAtyoHGrv0E2bsiydeEr
 Iqh1hMZ7nsAuV3/lV/7lmtV2xupf4gaP0q7c0x5aX6idULbv9Aqm68dTUUYXQpr+If3w
 0gRI1lQU/Q8dtLScJ79ZjLEvOMscdEv2RutXAFqbahehTCXCSrdbwb9d+qCeBvyHCxZZ
 IvgWHJ/UyYC39jAzM1NsWJhDqupT8CxFGp8TeCr4tO889BaYsj/kk2I6LrsZnBNxdJxZ Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p0vvqgsqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 13:21:14 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31RDEsCV031312;
 Mon, 27 Feb 2023 13:21:14 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p0vvqgsp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 13:21:14 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31R2jg12030383;
 Mon, 27 Feb 2023 13:21:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3nybbysfg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 13:21:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31RDL87259507068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 13:21:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BDE72004B;
 Mon, 27 Feb 2023 13:21:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0DB120040;
 Mon, 27 Feb 2023 13:21:07 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.148.35]) by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Feb 2023 13:21:07 +0000 (GMT)
Message-ID: <01fa83156fa7452b0e45fe9df8d799b1f3589295.camel@linux.ibm.com>
Subject: Re: [PATCH v16 03/11] target/s390x/cpu topology: handle STSI(15)
 and build the SYSIB
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Mon, 27 Feb 2023 14:21:07 +0100
In-Reply-To: <20230222142105.84700-4-pmorel@linux.ibm.com>
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aYv3Ucynyd3eI4nttDC8qHClN6gY8l1Q
X-Proofpoint-GUID: By2CxkTmW7QiEwWXa3Qba-l3r8Rch0Xf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_10,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302270102
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 2023-02-22 at 15:20 +0100, Pierre Morel wrote:
> On interception of STSI(15.1.x) the System Information Block
> (SYSIB) is built from the list of pre-ordered topology entries.
>=20
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  include/hw/s390x/cpu-topology.h |  21 +++
>  include/hw/s390x/sclp.h         |   1 +
>  target/s390x/cpu.h              |  72 ++++++++
>  hw/s390x/cpu-topology.c         |  14 +-
>  target/s390x/kvm/cpu_topology.c | 312 ++++++++++++++++++++++++++++++++
>  target/s390x/kvm/kvm.c          |   5 +-
>  target/s390x/kvm/meson.build    |   3 +-
>  7 files changed, 425 insertions(+), 3 deletions(-)
>  create mode 100644 target/s390x/kvm/cpu_topology.c
>=20
> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topol=
ogy.h
> index fa7f885a9f..8dc42d2942 100644
> --- a/include/hw/s390x/cpu-topology.h
> +++ b/include/hw/s390x/cpu-topology.h
> @@ -16,8 +16,29 @@
> =20
>  #define S390_TOPOLOGY_CPU_IFL   0x03
> =20
> +typedef union s390_topology_id {
> +    uint64_t id;
> +    struct {
> +        uint8_t level5;

You could rename this to sentinel, since that's the only use case and
if there ever is another level the sentinel implementation might need
to be changed anyway.

> +        uint8_t drawer;
> +        uint8_t book;
> +        uint8_t socket;
> +        uint8_t dedicated;
> +        uint8_t entitlement;
> +        uint8_t type;
> +        uint8_t origin;
> +    };
> +} s390_topology_id;
> +
>=20
[...]

> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index d654267a71..c899f4e04b 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -560,6 +560,25 @@ typedef struct SysIB_322 {
>=20
[...]
> =20
> +/*
> + * CPU Topology List provided by STSI with fc=3D15 provides a list
> + * of two different Topology List Entries (TLE) types to specify
> + * the topology hierarchy.
> + *
> + * - Container Topology List Entry
> + *   Defines a container to contain other Topology List Entries
> + *   of any type, nested containers or CPU.
> + * - CPU Topology List Entry
> + *   Specifies the CPUs position, type, entitlement and polarization
> + *   of the CPUs contained in the last Container TLE.
> + *
> + * There can be theoretically up to five levels of containers, QEMU
> + * uses only three levels, the drawer's, book's and socket's level.
> + *
> + * A container of with a nesting level (NL) greater than 1 can only

s/of//

> + * contain another container of nesting level NL-1.
> + *
> + * A container of nesting level 1 (socket), contains as many CPU TLE
> + * as needed to describe the position and qualities of all CPUs inside
> + * the container.
> + * The qualities of a CPU are polarization, entitlement and type.
> + *
> + * The CPU TLE defines the position of the CPUs of identical qualities
> + * using a 64bits mask which first bit has its offset defined by
> + * the CPU address orgin field of the CPU TLE like in:
> + * CPU address =3D origin * 64 + bit position within the mask
> + *
> + */
> +/* Container type Topology List Entry */
> +typedef struct SysIBTl_container {
> +        uint8_t nl;
> +        uint8_t reserved[6];
> +        uint8_t id;
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_container;
> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) !=3D 8);
> +
[...]
> +
> +/**
> + * s390_topology_from_cpu:
> + * @cpu: The S390CPU
> + *
> + * Initialize the topology id from the CPU environment.
> + */
> +static s390_topology_id s390_topology_from_cpu(S390CPU *cpu)
> +{
> +    s390_topology_id topology_id =3D {0};
> +
> +    topology_id.drawer =3D cpu->env.drawer_id;
> +    topology_id.book =3D cpu->env.book_id;
> +    topology_id.socket =3D cpu->env.socket_id;
> +    topology_id.origin =3D cpu->env.core_id / 64;
> +    topology_id.type =3D S390_TOPOLOGY_CPU_IFL;
> +    topology_id.dedicated =3D cpu->env.dedicated;
> +
> +    if (s390_topology.polarization =3D=3D S390_CPU_POLARIZATION_VERTICAL=
) {
> +        /*
> +         * Vertical polarization with dedicated CPU implies
> +         * vertical high entitlement.
> +         */
> +        if (topology_id.dedicated) {
> +            topology_id.entitlement =3D S390_CPU_ENTITLEMENT_HIGH;
> +        } else {
> +            topology_id.entitlement =3D cpu->env.entitlement;
> +        }

I don't see why you need this if, it should already be correct.

> +    }

I'd suggest the following:
* rename entitlement in s390_topology_id back to polarization, but keep ent=
itlement everywhere else.
* remove horizontal/none from CpuS390Entitlement, this way the user cannot =
set it,
	and it doesn't show up in the output of query-cpus-fast.
* this is where you convert between the two, so:
	if horizontal, id.polarization =3D 0,
	otherwise id.polarization =3D entitlement + 1, or a switch case.
* in patch 6 in s390_topology_set_cpus_entitlement you don't set the entitl=
ement if the polarization
	is horizontal, which is ok because of the conversion above.

> +
> +    return topology_id;
> +}
> +
>=20
[...]


