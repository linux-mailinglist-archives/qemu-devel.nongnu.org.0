Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328F6ECCC4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:14:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqw0Q-0003xG-Ju; Mon, 24 Apr 2023 09:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pqw0M-0003wa-JC; Mon, 24 Apr 2023 09:13:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pqw0K-0006wi-63; Mon, 24 Apr 2023 09:13:17 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OD8JaW020145; Mon, 24 Apr 2023 13:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PQyPaW4HMnuTZ53SMo+R/5cSe5e72eYwy8jRU16EnfQ=;
 b=PgMWBSIfBj8PmmKaXrfMFNl2+fuVu2RODQosm+6Cd1EPxy5s4dVhdFMpovaolA8/xi7o
 mgl9yl3ckz56RIizRdSpS3Va70+6GPVbIqtb/0gxLFbPJDoKdR9DA41z9jbyG+KMzBY4
 vFZdZTaOUYiPw/mkfXBwRMf2Tgx4LDmQVeKw9us0yLzBOQC4cIazS/9jqQh0TVWLxaKI
 APpxtAlHHUvAoIl87JQIElHRE1yoaUq7jBW1Ac6+NEFToTHN/0tdjvKUyOdw/e4a9onS
 ozkOE8HaKQP09GwovOMyBkxy7NauuYzb9KYc979acX9eC/gFUzRj6SwcXh+gPm3qs7KW Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q44sh5yt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 13:13:10 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OD8gKX021848;
 Mon, 24 Apr 2023 13:11:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q44sh5x95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 13:11:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33NLZCue029192;
 Mon, 24 Apr 2023 13:10:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q46ug14ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 13:10:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33ODArgG8782348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 13:10:53 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CA3D20040;
 Mon, 24 Apr 2023 13:10:53 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF11A20043;
 Mon, 24 Apr 2023 13:10:52 +0000 (GMT)
Received: from [9.171.51.2] (unknown [9.171.51.2])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 13:10:52 +0000 (GMT)
Message-ID: <8ac8caff924ea18b86d6a026296c4250abe1af28.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] tests/tcg: Make the QEMU headers available to
 the tests
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2023 15:10:51 +0200
In-Reply-To: <87fs8pa0wi.fsf@linaro.org>
References: <20230424114533.1937153-1-iii@linux.ibm.com>
 <20230424114533.1937153-2-iii@linux.ibm.com> <87fs8pa0wi.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a8xoTHwxbqQVRk5gxeRxizNu07ghEs-r
X-Proofpoint-ORIG-GUID: DImttfyZA6FGDNuedratkmjzEf6Xh2jV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 mlxlogscore=623
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304240118
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 2023-04-24 at 14:00 +0100, Alex Benn=C3=A9e wrote:
>=20
> Ilya Leoshkevich <iii@linux.ibm.com> writes:
>=20
> > The QEMU headers contain macros and functions that are useful in
> > the
> > test context. Add them to tests' include path. Also provide a
> > header
> > similar to "qemu/osdep.h" for use in the freestanding environment.
> >=20
> > Tests that include <sys/auxv.h> get QEMU's copy of <elf.h>, which
> > does
> > not work without <stdint.h>. Make use of the new header in these
> > tests
> > in order to fix this.
> >=20
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > =C2=A0tests/include/qemu/testdep.h=C2=A0=C2=A0 | 14 ++++++++++++++
> > =C2=A0tests/tcg/Makefile.target=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4=
 ++--
> > =C2=A0tests/tcg/aarch64/sve-ioctls.c |=C2=A0 1 +
> > =C2=A0tests/tcg/aarch64/sysregs.c=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A04 files changed, 18 insertions(+), 2 deletions(-)
> > =C2=A0create mode 100644 tests/include/qemu/testdep.h
> >=20
> > diff --git a/tests/include/qemu/testdep.h
> > b/tests/include/qemu/testdep.h
> > new file mode 100644
> > index 00000000000..ddf7c543bf4
> > --- /dev/null
> > +++ b/tests/include/qemu/testdep.h
> > @@ -0,0 +1,14 @@
> > +/*
> > + * Common dependencies for QEMU tests.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +#ifndef QEMU_TESTDEP_H
> > +#define QEMU_TESTDEP_H
> > +
> > +#include <stdint.h>
> > +#include "qemu/compiler.h"
> > +
> > +#define g_assert_not_reached __builtin_trap
> > +
> > +#endif
> > diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> > index 8318caf9247..5474395e693 100644
> > --- a/tests/tcg/Makefile.target
> > +++ b/tests/tcg/Makefile.target
> > @@ -85,8 +85,8 @@ TESTS=3D
> > =C2=A0# additional tests which may re-use existing binaries
> > =C2=A0EXTRA_TESTS=3D
> > =C2=A0
> > -# Start with a blank slate, the build targets get to add stuff
> > first
> > -CFLAGS=3D
> > +# Start with the minimal build flags, the build targets will
> > extend them
> > +CFLAGS=3D-I$(SRC_PATH)/include -I$(SRC_PATH)/tests/include
> > =C2=A0LDFLAGS=3D
>=20
> Hmm I'm not so sure about this. The tests are deliberately minimal in
> terms of their dependencies because its hard enough getting a plain
> cross-compiler to work. Is there really much benefit to allowing
> this?
> What happens when a user includes another header which relies on
> functionality from one of the many libraries QEMU itself links to?

I don't think this will work at all, because the idea here is to allow
using the code in the freestanding tests. However, at least bswap.h
seems to work just fine. Of course, there is now additional maintenance
overhead to keep it this way, but I would argue it's better than
making a copy.

[...]
>=20

