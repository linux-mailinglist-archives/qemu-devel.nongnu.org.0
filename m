Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A1644DC5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 22:08:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2f9H-0000k3-Al; Tue, 06 Dec 2022 16:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1p2f9E-0000i2-Hx; Tue, 06 Dec 2022 16:06:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1p2f9C-0006g8-DX; Tue, 06 Dec 2022 16:06:40 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6Jop67001236; Tue, 6 Dec 2022 21:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EKmpGcx6bEogzRyKCJrIQ6y5Le2T/G3x5zPoHHBxFm8=;
 b=tdpItusUJR+2CT8hgRFsubBCe201GkXfXTrDaqhuAkewMJrpWgGgm8IDLi17yBpfVTev
 3zEWVCNXYqfRlbGb9AWIXJQXFpWmGH8Yt8mDvh0BrbnqcDJEJsL3+K6iY6nw+gTJSs5e
 PSJzbQIYtyweirGiZ8eeMZp2rMNktmER2TqHmrZ5+YorDXkzJujDyiOU7Wgnfu/rnzPB
 FUEoWcM7XWJeMgscJ4nHEm4ETHVWRxpt4ZsLGSOMA5At62GEQGEgSh1E6cXAcY3EKBao
 QCUX0X2M7H+AYFonwsdHQ9tC15fuFIQJBvwdBfhnmLTbIZeePwpGjy+kbND8YLQYMgu5 Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mac8mhpdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 21:06:28 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6KjcJ6000962;
 Tue, 6 Dec 2022 21:06:27 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mac8mhpd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 21:06:27 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B6DAhjc010128;
 Tue, 6 Dec 2022 21:06:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3m9m7r9e2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 21:06:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6L6MnF29425944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 21:06:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BA5320043;
 Tue,  6 Dec 2022 21:06:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0566120040;
 Tue,  6 Dec 2022 21:06:21 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.5.19]) by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  6 Dec 2022 21:06:20 +0000 (GMT)
Message-ID: <34e774fc372e41f352ccf03761a78eff22728f89.camel@linux.ibm.com>
Subject: Re: [PATCH v12 1/7] s390x/cpu topology: Creating CPU topology device
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Tue, 06 Dec 2022 22:06:20 +0100
In-Reply-To: <ffb9b474-e29d-c790-611e-549846b939e4@linux.ibm.com>
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-2-pmorel@linux.ibm.com>
 <92e30cf1f091329b2076195e9c159be16c13f7f9.camel@linux.ibm.com>
 <cb4abea1-b585-2753-12e9-6b75999d7d2e@linux.ibm.com>
 <3f6f1ab828c9608fabf7ad855098cd6cae1874c4.camel@linux.ibm.com>
 <ffb9b474-e29d-c790-611e-549846b939e4@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0Hgy3s7gJMllOhgqogKfWympMA5qP41p
X-Proofpoint-ORIG-GUID: AnjNGN7cCJJwzroB-MJPmvFU5FeqOB51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060177
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
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

On Tue, 2022-12-06 at 15:35 +0100, Pierre Morel wrote:
>=20
> On 12/6/22 14:35, Janis Schoetterl-Glausch wrote:
> > On Tue, 2022-12-06 at 11:32 +0100, Pierre Morel wrote:
> > >=20
> > > On 12/6/22 10:31, Janis Schoetterl-Glausch wrote:
> > > > On Tue, 2022-11-29 at 18:42 +0100, Pierre Morel wrote:
> > > > > We will need a Topology device to transfer the topology
> > > > > during migration and to implement machine reset.
> > > > >=20
> > > > > The device creation is fenced by s390_has_topology().
> > > > >=20
> > > > > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > > > > ---
> > > > >    include/hw/s390x/cpu-topology.h    | 44 +++++++++++++++
> > > > >    include/hw/s390x/s390-virtio-ccw.h |  1 +
> > > > >    hw/s390x/cpu-topology.c            | 87 ++++++++++++++++++++++=
++++++++
> > > > >    hw/s390x/s390-virtio-ccw.c         | 25 +++++++++
> > > > >    hw/s390x/meson.build               |  1 +
> > > > >    5 files changed, 158 insertions(+)
> > > > >    create mode 100644 include/hw/s390x/cpu-topology.h
> > > > >    create mode 100644 hw/s390x/cpu-topology.c
> > > >=20
[...]
> > > > >   =20
> > > > > +static DeviceState *s390_init_topology(MachineState *machine, Er=
ror **errp)
> > > > > +{
> > > > > +    DeviceState *dev;
> > > > > +
> > > > > +    dev =3D qdev_new(TYPE_S390_CPU_TOPOLOGY);
> > > > > +
> > > > > +    object_property_add_child(&machine->parent_obj,
> > > > > +                              TYPE_S390_CPU_TOPOLOGY, OBJECT(dev=
));
> > > >=20
> > > > Why set this property, and why on the machine parent?
> > >=20
> > > For what I understood setting the num_cores and num_sockets as
> > > properties of the CPU Topology object allows to have them better
> > > integrated in the QEMU object framework.
> >=20
> > That I understand.
> > >=20
> > > The topology is added to the S390CcwmachineState, it is the parent of
> > > the machine.
> >=20
> > But why? And is it added to the S390CcwMachineState, or its parent?
>=20
> it is added to the S390CcwMachineState.
> We receive the MachineState as the "machine" parameter here and it is=20
> added to the "machine->parent_obj" which is the S390CcwMachineState.

Oh, I was confused. &machine->parent_obj is just a cast of MachineState* to=
 Object*.
It's the very same object.
And what is the reason to add the topology as child property?
Just so it shows up in the qtree? Wouldn't it anyway under the sysbus?
>=20
>=20
>=20
> > >=20
> > >=20
> > > >=20
> > > > > +    object_property_set_int(OBJECT(dev), "num-cores",
> > > > > +                            machine->smp.cores * machine->smp.th=
reads, errp);
> > > > > +    object_property_set_int(OBJECT(dev), "num-sockets",
> > > > > +                            machine->smp.sockets, errp);
> > > > > +
> > > > > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), errp);
> > > >=20
> > > > I must admit that I haven't fully grokked qemu's memory management =
yet.
> > > > Is the topology devices now owned by the sysbus?
> > >=20
> > > Yes it is so we see it on the qtree with its properties.
> > >=20
> > >=20
> > > > If so, is it fine to have a pointer to it S390CcwMachineState?
> > >=20
> > > Why not?
> >=20
> > If it's owned by the sysbus and the object is not explicitly referenced
> > for the pointer, it might be deallocated and then you'd have a dangling=
 pointer.
>=20
> Why would it be deallocated ?

That's beside the point, if you transfer ownership, you have no control ove=
r when
the deallocation happens.
It's going to be fine in practice, but I don't think you should rely on it.
I think you could just do sysbus_realize instead of ..._and_unref,
but like I said, I haven't fully understood qemu memory management.
(It would also leak in a sense, but since the machine exists forever that s=
hould be fine)

> as long it is not unrealized it belongs to the sysbus doesn't it?
>=20
> Regards,
> Pierre
>=20


