Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E407C68D4DA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPLZN-0002YW-Ji; Tue, 07 Feb 2023 05:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pPLZ1-0002Tm-Sr; Tue, 07 Feb 2023 05:51:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pPLYz-0002e5-As; Tue, 07 Feb 2023 05:51:03 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317AUe51013734; Tue, 7 Feb 2023 10:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CEbkWBEa4rd0ArzSkT+7ZuFO58cLmR1Oo2Thujmj/LE=;
 b=D1XoCA5g2HYu/ALpUb0G5N1Dq5naqz1Dy8ov0VyKgVvyB8MoDmILQXMpg2oQgrIK8fAV
 zIf0kwERNSTLj6JqGMavHlIRlNto4+rbM9QhdIvuCFvKGJZ+79ez4gWAskksicmuBMLT
 +s3Ehf9zXlGWSxupp/jc1NFOwu9Y9HzjYxI+/IPggyUpb/rdu/0ZVLqotTCsdlFw7fPM
 FGzwAEvHjE3zh1JXdTBLC6qyxadpoCw9Ig3VeH5ugetqlQarH7vKlAmywktwgHcyh0Gq
 CYWiz0F6g7LbUwXxobfX71z8dKrWfU4j4b6KQe64gXk2y7lcpMJ3hRaHTR6Rb9K7cTE5 Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkmy28e7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 10:50:50 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317AVofd018113;
 Tue, 7 Feb 2023 10:50:50 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkmy28e6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 10:50:50 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3175b4dO010414;
 Tue, 7 Feb 2023 10:50:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3nhf06tfwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 10:50:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 317AoiDm41484558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Feb 2023 10:50:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63CF320040;
 Tue,  7 Feb 2023 10:50:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 007CE2004B;
 Tue,  7 Feb 2023 10:50:44 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.169.160])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  7 Feb 2023 10:50:43 +0000 (GMT)
Message-ID: <669fea20042a31d009b5f3d9371bcf88f32d5d49.camel@linux.ibm.com>
Subject: Re: [PATCH v15 05/11] s390x/cpu topology: resetting the
 Topology-Change-Report
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Tue, 07 Feb 2023 11:50:43 +0100
In-Reply-To: <f4732cd4-67bb-a2a3-0048-3a2118b52fc1@linux.ibm.com>
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-6-pmorel@linux.ibm.com>
 <3215597a6916932c26fdbe1dd8daf2fc0c1c1ab5.camel@linux.ibm.com>
 <f4732cd4-67bb-a2a3-0048-3a2118b52fc1@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C5wO0xi20SHltC2M7mHBViFsvlnoGyKR
X-Proofpoint-GUID: 3wCmX86K_JOzmnW7fh59pqWdyD5QiImr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070094
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Tue, 2023-02-07 at 10:24 +0100, Pierre Morel wrote:
>=20
> On 2/6/23 18:52, Nina Schoetterl-Glausch wrote:
> > On Wed, 2023-02-01 at 14:20 +0100, Pierre Morel wrote:
> > > During a subsystem reset the Topology-Change-Report is cleared
> > > by the machine.
> > > Let's ask KVM to clear the Modified Topology Change Report (MTCR)
> > > bit of the SCA in the case of a subsystem reset.
> > >=20
> > > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > > ---
> > >   include/hw/s390x/cpu-topology.h |  1 +
> > >   target/s390x/cpu.h              |  1 +
> > >   target/s390x/kvm/kvm_s390x.h    |  1 +
> > >   hw/s390x/cpu-topology.c         | 12 ++++++++++++
> > >   hw/s390x/s390-virtio-ccw.c      |  3 +++
> > >   target/s390x/cpu-sysemu.c       | 13 +++++++++++++
> > >   target/s390x/kvm/kvm.c          | 17 +++++++++++++++++
> > >   7 files changed, 48 insertions(+)
> > >=20
> > > diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-t=
opology.h
> > > index 1ae7e7c5e3..60e0b9fbfa 100644
> > > --- a/include/hw/s390x/cpu-topology.h
> > > +++ b/include/hw/s390x/cpu-topology.h
> > > @@ -66,5 +66,6 @@ static inline void s390_topology_set_cpu(MachineSta=
te *ms,
> > >  =20
> > >   extern S390Topology s390_topology;
> > >   int s390_socket_nb(S390CPU *cpu);
> > > +void s390_topology_reset(void);
> > >  =20
> > >   #endif
> > > diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> > > index e1f6925856..848314d2a9 100644
> > > --- a/target/s390x/cpu.h
> > > +++ b/target/s390x/cpu.h
> > > @@ -641,6 +641,7 @@ typedef struct SysIBTl_cpu {
> > >   QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) !=3D 16);
> > >  =20
> > >   void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t=
 ar);
> > > +void s390_cpu_topology_reset(void);
> >=20
> > How about you call this s390_cpu_topology_reset_modified, so it's symme=
tric
> > with the function you define in the next patch. You could also drop the=
 "cpu"
> > from the name.
>=20
> I am not sure about this, Thomas already gave his R-B on this patch so I=
=20
> prefer to stay on the original name, unless he says it is a good idea to=
=20
> change.
> Also in cpu-sysemu.c most of the function are tagged with _cpu_

IMO, renaming a function would be a small enough change to keep an R-b.
>=20
> >=20
> > Or maybe even better, you only define a function for setting the modifi=
ed state,
> > but make it take a bool argument. This way you also get rid of some cod=
e duplication
> > and it wouldn't harm readability IMO.
>=20
> There is already a single function kvm_s390_topology_set_mtcr(attr) to=
=20
> set the "modified state"

Yes, but that is for KVM only and doesn't do error handling.
So you need at least one function on top of that. What I'm suggesting is to
only have one function instead of two because it gets rid of some code.
>=20
> >=20
> > >  =20
> > >   /* MMU defines */
> > >   #define ASCE_ORIGIN           (~0xfffULL) /* segment table origin  =
           */
> > > diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390=
x.h
> > > index f9785564d0..649dae5948 100644
> > > --- a/target/s390x/kvm/kvm_s390x.h
> > > +++ b/target/s390x/kvm/kvm_s390x.h
> > > @@ -47,5 +47,6 @@ void kvm_s390_crypto_reset(void);
> > >   void kvm_s390_restart_interrupt(S390CPU *cpu);
> > >   void kvm_s390_stop_interrupt(S390CPU *cpu);
> > >   void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
> > > +int kvm_s390_topology_set_mtcr(uint64_t attr);
> > >  =20
> > >   #endif /* KVM_S390X_H */
> > > diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> > > index a80a1ebf22..cf63f3dd01 100644
> > > --- a/hw/s390x/cpu-topology.c
> > > +++ b/hw/s390x/cpu-topology.c
> > > @@ -85,6 +85,18 @@ static void s390_topology_init(MachineState *ms)
> > >       QTAILQ_INSERT_HEAD(&s390_topology.list, entry, next);
> > >   }
> > >  =20
> > > +/**
> > > + * s390_topology_reset:
> > > + *
> > > + * Generic reset for CPU topology, calls s390_topology_reset()
> > > + * s390_topology_reset() to reset the kernel Modified Topology
> > > + * change record.
> > > + */
> > > +void s390_topology_reset(void)
> > > +{
> >=20
> > I'm wondering if you shouldn't move the reset changes you do in the nex=
t patch
> > into this one. I don't see what they have to do with PTF emulation.
>=20
> Here in this patch we do not intercept PTF and we have only an=20
> horizontal polarity.
> So we do not need to reset the polarity for all the vCPUs, we only need=
=20
> it when we have vertical polarity.

Well, with the PTF patch you don't get vertical polarity either, because yo=
u
only enable the topology with patch 7.
And since it's about resetting, it fits better in this patch IMO.
>=20
> Regards,
> Pierre
>=20


