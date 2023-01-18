Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D08671B43
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:56:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI71Z-0000te-RO; Wed, 18 Jan 2023 06:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pI71V-0000sh-EL; Wed, 18 Jan 2023 06:54:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pI71T-0003ej-IG; Wed, 18 Jan 2023 06:54:33 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30I9dfQZ009044; Wed, 18 Jan 2023 11:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OeeXRPElEVOc+QB2cqhaK7Z6Dsgk1TA52g6zq23E4wY=;
 b=Q1EHDjzdW0vS5HMBvPUqY4HQKcgw3dIIQRkhj8cnmLNBf7ZCcL1yWy2GZD7zrD6OYMYK
 8qWKMKa3qtoBHsoVAzRwEP01+zNTdHjna+/sHFVzbTqK+B2F7CX6Pj+ZL7bNqyoz3xnB
 s+NobE+Oeryb0m7M0PGVEskJRCfZJADR6SssN2chktATZhu1Q78TdSlt6eAWrdTMFiux
 6dNLg1hNA/thpk9TWKzhWMIt3fPoWCHcekaQOnBGQid217XtxvOcyCcYD4AVh/Yhqwcv
 Sbyj8aGXKEs7pimdRMgaojqzzOB18ffDAhzxzX7kz00P6LJuBE5DqVYGdFk7Rxmhk9HB Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6bu0ek90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 11:54:22 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30IBjsMl026639;
 Wed, 18 Jan 2023 11:54:21 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6bu0ek85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 11:54:21 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30I6V0eR013172;
 Wed, 18 Jan 2023 11:54:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3n3knfbtje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 11:54:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30IBsF2920382052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Jan 2023 11:54:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6183C20043;
 Wed, 18 Jan 2023 11:54:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9766C2004B;
 Wed, 18 Jan 2023 11:54:13 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.152.224.238])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 18 Jan 2023 11:54:13 +0000 (GMT)
Message-ID: <61a19c4397897283754ceedfd8673c63ef1c369b.camel@linux.ibm.com>
Subject: Re: [PATCH v14 03/11] target/s390x/cpu topology: handle STSI(15)
 and build the SYSIB
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-s390x@nongnu.org, frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Date: Wed, 18 Jan 2023 12:54:13 +0100
In-Reply-To: <9bf4841b-57a6-b08d-3d39-cd79ad0036e3@redhat.com>
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-4-pmorel@linux.ibm.com>
 <5cf19913-b2d7-d72d-4332-27aa484f72e4@redhat.com>
 <01782d4e-4c84-f958-b427-ff294f6c3c3f@linux.ibm.com>
 <9bf4841b-57a6-b08d-3d39-cd79ad0036e3@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _qPzN6SMSpk4ID8ntyw5DgXBDVV6QYdT
X-Proofpoint-ORIG-GUID: vW75gtXlurtmAUdVjSB-jfXHM2Gni4kn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_04,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180096
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

On Wed, 2023-01-18 at 11:26 +0100, Thomas Huth wrote:
> On 17/01/2023 17.56, Pierre Morel wrote:
> >=20
> >=20
> > On 1/10/23 15:29, Thomas Huth wrote:
> > > On 05/01/2023 15.53, Pierre Morel wrote:
> > > > On interception of STSI(15.1.x) the System Information Block
> > > > (SYSIB) is built from the list of pre-ordered topology entries.
> > > >=20
> > > > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > > > ---
> ...
> > > > +typedef struct SysIBTl_container {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t nl;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t reserved[6];
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t id;
> > > > +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_container;
> > > > +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) !=3D 8);
> > > > +
> > > > +/* CPU type Topology List Entry */
> > > > +typedef struct SysIBTl_cpu {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t nl;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t reserved0[3];
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t reserved1:5;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t dedicated:1;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t polarity:2;
> > >=20
> > > Hmmm, yet another bitfield...
> >=20
> > Yes, this is the firmware interface.
> > If it makes problem I can use masks and logic arithmetic
>=20
> It depends ... if we are sure that this will ever only be used with KVM o=
n=20
> real s390x hardware, then bitfields are OK. If we think that this is=20
> something that could be implemented in TCG, too, I'd scratch the bitfield=
s=20
> and use logic arithmetic instead...

Is there something like linux' bitfield.h in qemu?
In this case it's only two fields, and not too complicated, but I imagine i=
t could
get quite ugly to do it manually in other cases.
>=20
> I'm not too experienced with this CPU topology stuff, but it sounds like =
it=20
> could be implemented in TCG without too much efforts one day, too, so I'd=
=20
> rather go with the logic arithmetic immediately instead if it is not too=
=20
> annoying for you right now.
>=20
> > > > diff --git a/target/s390x/kvm/cpu_topology.c=20
> > > > b/target/s390x/kvm/cpu_topology.c
> > > > new file mode 100644
> > > > index 0000000000..3831a3264c
> > > > --- /dev/null
> > > > +++ b/target/s390x/kvm/cpu_topology.c
> > > > @@ -0,0 +1,136 @@
> > > > +/*
> > > > + * QEMU S390x CPU Topology
> > > > + *
> > > > + * Copyright IBM Corp. 2022
> > >=20
> > > Happy new year?
> >=20
> > So after Nina's comment what do I do?
> > let it be 22 because I started last year or update because what is impo=
rtant=20
> > is when it comes into mainline?
>=20
> Honestly, I don't have a really good clue either... But keeping 2022 is=
=20
> certainly fine for me, too.
>=20
>   Thomas
>=20


