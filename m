Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D211F665757
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:24:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXLH-0001Lx-Ae; Wed, 11 Jan 2023 04:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pFXL5-0001Lc-1O; Wed, 11 Jan 2023 04:24:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pFXL2-0004LY-KP; Wed, 11 Jan 2023 04:24:06 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30B9EPC8021832; Wed, 11 Jan 2023 09:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=E9JOs5wTJgVbUx7bKAV9QB+s5RJHr80wzTN9j+E8Mvc=;
 b=HCjeljqNKUdbCZr0MPFDA1vO6M68RbV4sn/EmL7p+1cfurEfIw1WxlPeq7PXkq1jvcam
 nXgMqAwuHopfCtFtS1/AnppRF9jB0TFRbtBn7h/5iy/4WaCR7OI3VpQGHAxB+mnBRal5
 uJziR78v9fOeZbomtWpviIVX6SY/E2cbqfWhtuPKGzBXmboD+ZHVvfkDB37rqCappjk5
 7xVPf/9jCeICcxi079ObsSa1yQBe0M/srmZFGX8dBfBeA7uWoAvdM1XG7Pp7KCoZP0eP
 ksEbgD5qajDN03l3W2ke+KGsgqoVXTTmpE/0J89jngGtgVB/k0V6Y7cpgzLz/LDkgt6F bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1ta9r724-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 09:23:57 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30B9EeBL023022;
 Wed, 11 Jan 2023 09:23:57 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1ta9r715-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 09:23:56 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30B171Yh022367;
 Wed, 11 Jan 2023 09:23:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3n1k5u8dmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 09:23:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30B9No2G37486920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 09:23:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BA6120049;
 Wed, 11 Jan 2023 09:23:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3F8E20043;
 Wed, 11 Jan 2023 09:23:49 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.147.253])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 09:23:49 +0000 (GMT)
Message-ID: <5ffce2206fa60ed659613e928b55585cd69436a9.camel@linux.ibm.com>
Subject: Re: [PATCH v14 02/11] s390x/cpu topology: add topology entries on
 CPU hotplug
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Wed, 11 Jan 2023 10:23:49 +0100
In-Reply-To: <5c8a22bb-5a35-d71e-9e5a-39675fa04e66@redhat.com>
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-3-pmorel@linux.ibm.com>
 <5c8a22bb-5a35-d71e-9e5a-39675fa04e66@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F3MTd-0YGJFrUqRVm_uCO24qfQgZZVxJ
X-Proofpoint-ORIG-GUID: qR438zUYVoGiy50glpQkNgcGcudmyPAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_04,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110068
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Tue, 2023-01-10 at 14:00 +0100, Thomas Huth wrote:
> On 05/01/2023 15.53, Pierre Morel wrote:
> > The topology information are attributes of the CPU and are
> > specified during the CPU device creation.
> >=20
> > On hot plug, we gather the topology information on the core,
> > creates a list of topology entries, each entry contains a single
> > core mask of each core with identical topology and finaly we
> > orders the list in topological order.
> > The topological order is, from higher to lower priority:
> > - physical topology
> >      - drawer
> >      - book
> >      - socket
> >      - core origin, offset in 64bit increment from core 0.
> > - modifier attributes
> >      - CPU type
> >      - polarization entitlement
> >      - dedication
> >=20
> > The possibility to insert a CPU in a mask is dependent on the
> > number of cores allowed in a socket, a book or a drawer, the
> > checking is done during the hot plug of the CPU to have an
> > immediate answer.
> >=20
> > If the complete topology is not specified, the core is added
> > in the physical topology based on its core ID and it gets
> > defaults values for the modifier attributes.
> >=20
> > This way, starting QEMU without specifying the topology can
> > still get some adventage of the CPU topology.
>=20
> s/adventage/advantage/
>=20
> > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > ---
> >   include/hw/s390x/cpu-topology.h |  48 ++++++
> >   hw/s390x/cpu-topology.c         | 293 +++++++++++++++++++++++++++++++=
+
> >   hw/s390x/s390-virtio-ccw.c      |  10 ++
> >   hw/s390x/meson.build            |   1 +
> >   4 files changed, 352 insertions(+)
> >   create mode 100644 hw/s390x/cpu-topology.c
> >=20
> > diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-top=
ology.h
> > index d945b57fc3..b3fd752d8d 100644
> > --- a/include/hw/s390x/cpu-topology.h
> > +++ b/include/hw/s390x/cpu-topology.h
> >=20
[...]

> > +typedef struct S390Topology {
> > +    QTAILQ_HEAD(, S390TopologyEntry) list;
> > +    uint8_t *sockets;
>=20
> So this "uint8_t" basically is a hidden limit of a maximum of 256 sockets=
=20
> that can be used for per book? Do we check that limit somewhere? (I looke=
d=20
> for it, but I didn't spot such a check)

S390_MAX_CPUS < 256. Might be a good idea to have a build time assert for t=
hat.
And one cannot have more sockets that maxcpus.
>=20
> > +    CpuTopology *smp;
> > +} S390Topology;
> > +
> > +#ifdef CONFIG_KVM
> > +bool s390_has_topology(void);
> > +void s390_topology_set_cpu(MachineState *ms, S390CPU *cpu, Error **err=
p);
> > +#else
> > +static inline bool s390_has_topology(void)
> > +{
> > +       return false;
> > +}
> > +static inline void s390_topology_set_cpu(MachineState *ms,
> > +                                         S390CPU *cpu,
> > +                                         Error **errp) {}
> > +#endif
> > +extern S390Topology s390_topology;
> > +
> >   #endif
> > diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> > new file mode 100644
> > index 0000000000..438055c612
> > --- /dev/null
> > +++ b/hw/s390x/cpu-topology.c
> > @@ -0,0 +1,293 @@
> > +/*
> > + * CPU Topology
> > + *
> > + * Copyright IBM Corp. 2022
>=20
> Want to update to 2023 now?

It's the year of first publication, and I'd guess this is a derivative work=
 of what
was published to the mailing list last year.
>=20


