Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD365EEB9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:27:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRCW-0008Lj-7J; Thu, 05 Jan 2023 09:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pDRCU-0008LX-Bb; Thu, 05 Jan 2023 09:26:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pDRCS-0000gs-PE; Thu, 05 Jan 2023 09:26:34 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305EG9C1000976; Thu, 5 Jan 2023 14:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=S0nQ0tlahTJbHYwH30b/zmIXRXJpnOyOiLM17qGNbVw=;
 b=D0Rz3P9lGdSg2zsDSdjnvB0UGHvDtRppmx5IacxuEsWcC2j01b5xRswrx564/lzUZkaj
 S0HyLzyCihllBVCKJw61ReBpk2d7k7WJmwjwEU+eO6mXcSnfVPtXb5hZRqFiLx2kclEP
 ojhN79ki65Gvkj8XokwiUbMtl6zlSkB/UzRjuP0QV3MN2F/Ys6kf0xpWFM9LKGmvzA6V
 g+crREBfMKj+RoWo+7qhLt+36VuKvpVLR+ilLOhJ1pPIF0lUaN68j4p81krmOd0oVW99
 9rL03iPK5qDv0pWsar8UZ5PBDbKE67hHEOHzwh3b6aNGRee1qGP6sJ/SxdzW3AiRGTNS mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx05s07wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:26:23 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305EGMgC001709;
 Thu, 5 Jan 2023 14:26:23 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx05s07vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:26:23 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3051kSOm024684;
 Thu, 5 Jan 2023 14:26:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6d1bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:26:21 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305EQHxS46793020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 14:26:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7BFB20040;
 Thu,  5 Jan 2023 14:26:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 430C920043;
 Thu,  5 Jan 2023 14:26:17 +0000 (GMT)
Received: from p-imbrenda (unknown [9.171.26.82])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
 Thu,  5 Jan 2023 14:26:17 +0000 (GMT)
Date: Thu, 5 Jan 2023 14:58:23 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, qemu-s390x@nongnu.org, 
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH 2/5] s390x/pv: Implement CGS check handler
Message-ID: <20230105145823.6a7345e6@p-imbrenda>
In-Reply-To: <61d70e15-770b-7f62-54aa-3cc0ac3b3a35@redhat.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-3-clg@kaod.org>
 <61d70e15-770b-7f62-54aa-3cc0ac3b3a35@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jDTmrAzibFgmIE3cLd7yAIWVjA19rd9X
X-Proofpoint-ORIG-GUID: 5g0XPmuQeGdTz4Zaalnd5lGQqW5o5vgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050111
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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

On Thu, 5 Jan 2023 12:42:54 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 04/01/2023 12.51, C=C3=A9dric Le Goater wrote:
> > From: C=C3=A9dric Le Goater <clg@redhat.com>
> >=20
> > When a protected VM is started with the maximum number of CPUs (248),
> > the service call providing information on the CPUs requires more
> > buffer space than allocated and QEMU disgracefully aborts :
> >=20
> >      LOADPARM=3D[........]
> >      Using virtio-blk.
> >      Using SCSI scheme.
> >      ..................................................................=
.................
> >      qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long
> >=20
> > Implement a test for this limitation in the ConfidentialGuestSupportCla=
ss
> > check handler and provide some valid information to the user before the
> > machine starts.
> >=20
> > Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> > ---
> >   hw/s390x/pv.c | 23 +++++++++++++++++++++++
> >   1 file changed, 23 insertions(+)
> >=20
> > diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> > index 8dfe92d8df..3a7ec70634 100644
> > --- a/hw/s390x/pv.c
> > +++ b/hw/s390x/pv.c
> > @@ -266,6 +266,26 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs=
, Error **errp)
> >       return 0;
> >   }
> >  =20
> > +static bool s390_pv_check_cpus(Error **errp)
> > +{
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> > +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> > +    uint32_t pv_max_cpus =3D mc->max_cpus - 1; =20
>=20
> Not sure whether "mc->max_cpus - 1" is the right approach here. I think i=
t=20
> would be better to calculate the amount of CPUs that we can support.
>=20
> So AFAIK the problem is that SCLP information that is gathered during=20
> read_SCP_info() in hw/s390x/sclp.c. If protected virtualization is enable=
d,=20
> everything has to fit in one page (i.e. 4096 bytes) there.
>=20
> So we have space for
>=20
>   (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry)
>=20
> CPUs.
>=20
> With S390_FEAT_EXTENDED_LENGTH_SCCB enabled, offset_cpu is 144 (see struc=
t=20
> ReadInfo in sclp.h), otherwise it is 128.
>=20
> That means, with S390_FEAT_EXTENDED_LENGTH_SCCB we can have a maximum of:
>=20
>   (4096 - 144) / 16 =3D 247 CPUs
>=20
> which is what you were trying to check with the mc->max_cpus - 1 here.
>=20
> But with "-cpu els=3Doff", it sounds like we could fit all 248 also with=
=20
> protected VMs? Could you please give it a try?
>=20
> Anyway, instead of using "pv_max_cpus =3D mc->max_cpus - 1" I'd suggest t=
o use=20
> something like this instead:
>=20
>   int offset_cpu =3D s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
>                       offsetof(ReadInfo, entries) :
>                       SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
>   pv_max_cpus =3D (TARGET_PAGE_SIZE - offset_cpu) /sizeof(CPUEntry);

I agree with Thomas here

>=20
>    Thomas
>=20
>=20


