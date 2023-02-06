Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B6D68BA40
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 11:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOyoD-0000UD-Eq; Mon, 06 Feb 2023 05:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pOyo3-0000Op-40; Mon, 06 Feb 2023 05:33:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pOyo0-0003H1-3b; Mon, 06 Feb 2023 05:33:02 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3169pxji027503; Mon, 6 Feb 2023 10:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yKmK+3zWKbqSU+/DHIPtBhVrfkeWbWVx+EApuwUD+ik=;
 b=hZxLx7VRauLSqjBYHV+vh2jIkb/eNe2G9kGrvRMdDu7l+b6nSgGIVRPJRHq1QuTpHP+0
 bIvMVmBBei/DnDDJEyY4f/2Ow+nKM6IVgwJsOwkU0sW/rI8PNNxxKChY+8iNBZWjZwkW
 4i0bABoCv1+UAevgNUSdmiQMI7sDptBiKv7wxZUaJCKp7mnhUgd0G00A5SeprExKZTP5
 Kw8/jhIBov3qT1LlWXcg2mytZ7gQB0hvNyHIx6s2JnoziuFOk7NU6fd8UqWS32Vb3OIj
 1qFBfabgj6yIQlzHcnQZ0vVqqBmUN8XOx0tx98UbvoMnvVfYI43hf8xkIsCgq+bjuf7G dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3njwf7c186-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 10:32:47 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 316AOfLt008993;
 Mon, 6 Feb 2023 10:32:46 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3njwf7c15t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 10:32:46 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3167LmBA007037;
 Mon, 6 Feb 2023 10:32:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3nhf06skyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 10:32:34 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 316AWVr252429144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Feb 2023 10:32:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4033120043;
 Mon,  6 Feb 2023 10:32:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C27412004B;
 Mon,  6 Feb 2023 10:32:30 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.196.55]) by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Feb 2023 10:32:30 +0000 (GMT)
Message-ID: <cca30b6e2abc683087ea6b262740a6b0ac1ab65d.camel@linux.ibm.com>
Subject: Re: [PATCH v15 03/11] target/s390x/cpu topology: handle STSI(15)
 and build the SYSIB
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Mon, 06 Feb 2023 11:32:30 +0100
In-Reply-To: <91372a70-660e-8b30-4062-ccbb50226c99@linux.ibm.com>
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-4-pmorel@linux.ibm.com>
 <7785ea2cb7530647fcc38321d81745ce16f8055f.camel@linux.ibm.com>
 <91372a70-660e-8b30-4062-ccbb50226c99@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: skdU2jfPlFSrw49SGmxvtaVSsGWxVXbp
X-Proofpoint-GUID: S_ykraNaaRabc-Y1eUU36rWs8FZiBcjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_05,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=767
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060091
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

On Mon, 2023-02-06 at 11:06 +0100, Pierre Morel wrote:
>=20
> On 2/3/23 18:36, Nina Schoetterl-Glausch wrote:
> > On Wed, 2023-02-01 at 14:20 +0100, Pierre Morel wrote:
> > > > On interception of STSI(15.1.x) the System Information Block
> > > > (SYSIB) is built from the list of pre-ordered topology entries.
> > > >=20
> > > > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > > > ---
> > > >   include/hw/s390x/cpu-topology.h |  22 +++
> > > >   include/hw/s390x/sclp.h         |   1 +
> > > >   target/s390x/cpu.h              |  72 +++++++
> > > >   hw/s390x/cpu-topology.c         |  10 +
> > > >   target/s390x/kvm/cpu_topology.c | 335 +++++++++++++++++++++++++++=
+++++
> > > >   target/s390x/kvm/kvm.c          |   5 +-
> > > >   target/s390x/kvm/meson.build    |   3 +-
> > > >   7 files changed, 446 insertions(+), 2 deletions(-)
> > > >   create mode 100644 target/s390x/kvm/cpu_topology.c
> > > >=20
[...]
> >=20
> > > > + */
> > > > +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_=
t ar)
> > > > +{
> > > > +    SysIB sysib =3D {0};
> > > > +    int len;
> > > > +
> > > > +    if (!s390_has_topology() || sel2 < 2 || sel2 > SCLP_READ_SCP_I=
NFO_MNEST) {
> > > > +        setcc(cpu, 3);
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    s390_order_tle();
> > > > +
> > > > +    len =3D setup_stsi(&sysib.sysib_151x, sel2);
> > > > +
> > > > +    if (len < 0) {
> >=20
> > I stumbled a bit over this, maybe rename len to r.
>=20
> Why ? it is the length used to fill the length field of the SYSIB.

Well a negative length doesn't make sense, that's what confused me for a bi=
t.
It's the error value of course, I proposed renaming it to the more generic =
r return value,
to signify that the return value isn't exactly the length.

You're solution of using 0 is fine with me, too.
>=20
> May be it would be clearer if we give back the length to write and 0 on=
=20
> error then we have here:
>=20
> 	if (!len) {
> 		setcc(cpu, 3);
> 		return;
> 	}
>=20
> >=20
> > > > +        setcc(cpu, 3);
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    sysib.sysib_151x.length =3D cpu_to_be16(len);
> > > > +    s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, len);
> > > > +    setcc(cpu, 0);
> > > > +
> > > > +    s390_free_tle();
> > > > +}
>=20
> Thanks for the comments.
> If there are only comments and cosmetic changes will I get your RB if I=
=20
> change them according to your wishes?

Usually I review the whole series and then comment, this time sent feedback=
 early,
so the review isn't as deep. Probably easiest to give you the R-b for v16.
My impression is that the series is close to final.
>=20
> Regards,
> Pierre
>=20


