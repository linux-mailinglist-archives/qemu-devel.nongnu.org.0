Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA296BBC13
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:31:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVtA-0005Vu-Ny; Wed, 15 Mar 2023 14:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcVt7-0005Vi-Oc; Wed, 15 Mar 2023 14:30:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcVt5-0001KL-O8; Wed, 15 Mar 2023 14:30:13 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FHPDqG001701; Wed, 15 Mar 2023 18:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ni3luN4LY5k0v5z2pimGdBy4s9DF6Ule5vsePMIdF+o=;
 b=NJMhLNHK/Q0Rw8H5m1fJjRkjLFjQ46Lp5GE8bos3yH9THqsyZ3fwYoEhRh6FgqB18rcP
 AhNOojMuJoRhEM2Jtzj9D9g3AS3gYss0dURNNW6HZVXmfT84cDYncloDm+u+djCPkFyS
 BNJ7NbbCNegCOclw5OGMoDEiapLTFov2a/AJ1V1+d8+5cdOt2CTZo+si+pCHsKr/U9dV
 xyHHiFgNywWH9sfZfAgIyTkSsRoJH1/Lwkt6f2jZY72faCTHVvitqOoyu9HZlestsV/5
 2/bWO3I9TIUVkgdOLtCUXsmT5puMiAHCrNvFWHMbNKlioVvZj5y295esvti16VBUqj9c SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbjdchjfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 18:30:07 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FIQAnr009701;
 Wed, 15 Mar 2023 18:30:06 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbjdchjep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 18:30:06 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FGW7sN019754;
 Wed, 15 Mar 2023 18:30:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pb29srxhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 18:30:04 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FIU2AT328280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 18:30:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46D5F20040;
 Wed, 15 Mar 2023 18:30:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA8C520049;
 Wed, 15 Mar 2023 18:30:01 +0000 (GMT)
Received: from [9.171.20.11] (unknown [9.171.20.11])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 18:30:01 +0000 (GMT)
Message-ID: <1b4f2d623ec943e280fa1c3b6343edf960bb41e1.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tests/tcg/s390x: Add rxsbg.c
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Wed, 15 Mar 2023 19:30:01 +0100
In-Reply-To: <70ded204-a499-0c23-6949-42244fc5bfe9@redhat.com>
References: <20230314233443.324727-1-iii@linux.ibm.com>
 <20230314233443.324727-3-iii@linux.ibm.com>
 <70ded204-a499-0c23-6949-42244fc5bfe9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fp1za-jFIG9Rf1Eu594O5A69z1iZ2ZMM
X-Proofpoint-ORIG-GUID: -stC7d_CqtCZsg-ONTJsJDinTemLFix0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_09,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150151
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Wed, 2023-03-15 at 19:12 +0100, Thomas Huth wrote:
> On 15/03/2023 00.34, Ilya Leoshkevich wrote:
> > Add a small test for RXSBG with T=3D1 to prevent regressions.
> >=20
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > =C2=A0 tests/tcg/s390x/Makefile.target |=C2=A0 1 +
> > =C2=A0 tests/tcg/s390x/rxsbg.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 25 +++++++++++++++++++++++++
> > =C2=A0 2 files changed, 26 insertions(+)
> > =C2=A0 create mode 100644 tests/tcg/s390x/rxsbg.c
> >=20
> > diff --git a/tests/tcg/s390x/Makefile.target
> > b/tests/tcg/s390x/Makefile.target
> > index cf93b966862..b4d0d704534 100644
> > --- a/tests/tcg/s390x/Makefile.target
> > +++ b/tests/tcg/s390x/Makefile.target
> > @@ -29,6 +29,7 @@ TESTS+=3Dclst
> > =C2=A0 TESTS+=3Dlong-double
> > =C2=A0 TESTS+=3Dcdsg
> > =C2=A0 TESTS+=3Dchrl
> > +TESTS+=3Drxsbg
> > =C2=A0=20
> > =C2=A0 cdsg: CFLAGS+=3D-pthread
> > =C2=A0 cdsg: LDFLAGS+=3D-pthread
> > diff --git a/tests/tcg/s390x/rxsbg.c b/tests/tcg/s390x/rxsbg.c
> > new file mode 100644
> > index 00000000000..b7f35411899
> > --- /dev/null
> > +++ b/tests/tcg/s390x/rxsbg.c
> > @@ -0,0 +1,25 @@
> > +/*
> > + * Smoke test RXSBG instruction with T=3D1.
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +#include <assert.h>
> > +#include <stdlib.h>
> > +
> > +int main(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long r1, r2, cc;
> > +
> > +=C2=A0=C2=A0=C2=A0 r1 =3D 0xc8dc86a225a77bb4;
> > +=C2=A0=C2=A0=C2=A0 r2 =3D 0xd6aff24fa3e7320;
> > +=C2=A0=C2=A0=C2=A0 cc =3D 0;
> > +=C2=A0=C2=A0=C2=A0 asm("rxsbg %[r1],%[r2],177,43,228\n"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipm %[cc]"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : [cc] "+r" (cc)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : [r1] "r" (r1)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 , [r2] "r" (r2)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "cc");
> > +=C2=A0=C2=A0=C2=A0 cc =3D (cc >> 28) & 1;
> > +=C2=A0=C2=A0=C2=A0 assert(cc =3D=3D 1);
> > +
> > +=C2=A0=C2=A0=C2=A0 return EXIT_SUCCESS;
> > +}
>=20
> This also fails with Clang 15:
> tests/tcg/s390x/rxsbg.c:15:9: error: invalid operand for instruction
> =C2=A0=C2=A0=C2=A0=C2=A0 asm("rxsbg %[r1],%[r2],177,43,228\n"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> <inline asm>:1:23: note: instantiated into assembly here
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rxsbg %r1,%r2,177,43,228
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>=20
> =C2=A0 Thomas
>=20

This seems to be a clang bug. PoP says:

    Bit 1 of the I3 field and bits 0-1 of the I4 field (bits 17
    and 24-25 of the instruction) are reserved and should
    contain zeros; otherwise, the program may not oper-
    ate compatibly in the future. Bits 0-1 of the I5 field
    (bits 32-33 of the instruction) are ignored.

But LLVM has:

    imm32zx8:$I4, imm32zx6:$I5

which looks like a mixup (should be imm32zx6 + imm32zx8 IMHO).

I guess there is not much we can do about this at the moment, so I will
choose another constant for the test and send a v2.

