Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D866E751
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 20:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHs6O-00067U-Am; Tue, 17 Jan 2023 14:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pHs6I-000677-Sp; Tue, 17 Jan 2023 14:58:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pHs6G-0003W5-Ij; Tue, 17 Jan 2023 14:58:30 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HJQFI0002556; Tue, 17 Jan 2023 19:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Apa+RLI5AIUlbQGPDiuO1LW7cPjZPExNp+EC46G6sRQ=;
 b=K55NvgHxkKzCmRh9NAaeHlx9ZXQ6oSmULSEAlgdueeMD+cfBxtjAsSbYZUOGLPIFzyU0
 SltjT0BOd3w5bB2rEpE0yDO71DIK4Zcs4SisrJMNaHZWyMm/OXgYcTP0MMxl3R/QWFyf
 H3+8XXVVD/9umq2ukcQJpnHuVZdW35Ax33Q+6AyMq+dK1A5mU1XKTAtQyU6M2XTuxVny
 mI4gqzvUM+5tDD86431UOdiY77ssTQAefU2E2TYSgXs9vH8YD3ICx7LaWyLJxu43/oLE
 vnRPBgHDEBaNvEzA2Lko67aM+zhY6jtfUf1bslYNBby9jyjWtE7DXsWV6NUfgQVpgweY pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n61ty8kfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 19:58:22 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HJUNpd015511;
 Tue, 17 Jan 2023 19:58:22 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n61ty8kf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 19:58:21 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HAwjps016548;
 Tue, 17 Jan 2023 19:58:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n3m16k5gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 19:58:19 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30HJwF9O47317394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 19:58:15 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 894252004B;
 Tue, 17 Jan 2023 19:58:15 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2381C20040;
 Tue, 17 Jan 2023 19:58:15 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.180.94]) by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 19:58:15 +0000 (GMT)
Message-ID: <0103e627a835013e00a9c55d46348e76b94366e9.camel@linux.ibm.com>
Subject: Re: [PATCH v14 04/11] s390x/sclp: reporting the maximum nested
 topology entries
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Tue, 17 Jan 2023 20:58:15 +0100
In-Reply-To: <22aff83d-4379-e4f0-9826-33f986ddeec7@linux.ibm.com>
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-5-pmorel@linux.ibm.com>
 <e65bce5b-977c-ed19-9562-3af8ee8e9fba@redhat.com>
 <22aff83d-4379-e4f0-9826-33f986ddeec7@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OJ7MDHxD0Koil2ixbWftLc8OOaXFBM_G
X-Proofpoint-GUID: 9GAHTua5RR4KG8xd242-hY5X4l3q0p7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_10,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170156
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

On Tue, 2023-01-17 at 18:36 +0100, Pierre Morel wrote:
>=20
> On 1/11/23 09:57, Thomas Huth wrote:
> > On 05/01/2023 15.53, Pierre Morel wrote:
> > > The maximum nested topology entries is used by the guest to know
> > > how many nested topology are available on the machine.
> > >=20
> > > Currently, SCLP READ SCP INFO reports MNEST =3D 0, which is the
> > > equivalent of reporting the default value of 2.
> > > Let's use the default SCLP value of 2 and increase this value in the
> > > future patches implementing higher levels.
> >=20
> > I'm confused ... so does a SCLP value of 2 mean a MNEST level of 4 ?
>=20
> Sorry, I forgot to change this.
> MNEST =3D 0 means no MNEST support and only socket is supported so it is=
=20
> like MNEST =3D 2.
> MNEST !=3D 0 set the maximum nested level and correct values may be 2,3 o=
r 4.
> But this setting to 4 should already have been done in previous patch=20
> where we introduced the books and drawers.

I think setting it to 4 here is fine/preferable, since 2 is the default unl=
ess
you tell the guest that more are available, which you do in this patch.
It's only the commit description that is confusing.

>=20
> I change the commit message with:
> ---
> s390x/sclp: reporting the maximum nested topology entries
>=20
> The maximum nested topology entries is used by the guest to know
> how many nested topology are available on the machine.
>=20
> Let's return this information to the guest.
> ---
>=20
> >=20
> > > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > > ---
> > > =C2=A0 include/hw/s390x/sclp.h | 5 +++--
> > > =C2=A0 hw/s390x/sclp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 4 ++++
> > > =C2=A0 2 files changed, 7 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
> > > index 712fd68123..4ce852473c 100644
> > > --- a/include/hw/s390x/sclp.h
> > > +++ b/include/hw/s390x/sclp.h
> > > @@ -112,12 +112,13 @@ typedef struct CPUEntry {
> > > =C2=A0 } QEMU_PACKED CPUEntry;
> > > =C2=A0 #define SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET=C2=A0=C2=A0=C2=A0=
=C2=A0 128
> > > -#define SCLP_READ_SCP_INFO_MNEST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
> > > +#define SCLP_READ_SCP_INFO_MNEST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4
> >=20
> > ... since you update it to 4 here.
>=20
> Yes, in fact this should be set in the previous patch already to 4.
> So I will do that.
>=20
> >=20
> > > =C2=A0 typedef struct ReadInfo {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SCCBHeader h;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t rnmax;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t rnsize;
> > > -=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 _reserved1[16 - 11];=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* 11-15 */
> > > +=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 _reserved1[15 - 11];=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* 11-14 */
> > > +=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 stsi_parm;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 15-16 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t entries_cpu;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 16=
-17 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t offset_cpu;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 18-19 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 _reserved2[24 - 20];=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 20-23 */
> > > diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> > > index eff74479f4..07e3cb4cac 100644
> > > --- a/hw/s390x/sclp.c
> > > +++ b/hw/s390x/sclp.c
> > > @@ -20,6 +20,7 @@
> > > =C2=A0 #include "hw/s390x/event-facility.h"
> > > =C2=A0 #include "hw/s390x/s390-pci-bus.h"
> > > =C2=A0 #include "hw/s390x/ipl.h"
> > > +#include "hw/s390x/cpu-topology.h"
> > > =C2=A0 static inline SCLPDevice *get_sclp_device(void)
> > > =C2=A0 {
> > > @@ -125,6 +126,9 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB=
=20
> > > *sccb)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* CPU information */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prepare_cpu_entries(machine, entries_s=
tart, &cpu_count);
> > > +=C2=A0=C2=A0=C2=A0 if (s390_has_topology()) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read_info->stsi_parm =3D =
SCLP_READ_SCP_INFO_MNEST;
> >=20
> > This seems to be in contradiction to what you've said in the commit=20
> > description - you set it to 4 and not to 2.
>=20
> Yes, I change the commit message.
>=20
> Thanks.
>=20
> Regards,
> Pierre
>=20


