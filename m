Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2196BE781
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 12:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd7qs-0001OU-JO; Fri, 17 Mar 2023 07:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pd7qp-0001O0-IY; Fri, 17 Mar 2023 07:02:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pd7qn-0000xA-Jp; Fri, 17 Mar 2023 07:02:23 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32HAoXKK005672; Fri, 17 Mar 2023 11:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lfheVAlfdJjBcsWMm59AMtD5uwi+wFZNzDbvBXKjXLw=;
 b=eIN/5M+p6rgYsyJKbhXi7Gbu5wTXJg/u9nwgkyZnA3MrD483QrQ1wuJR9dGhWH2BF10K
 Q3/3DXmzc6GMUFfAgORLlql1jW+LWOy9fjSWuH7s9IfbdwM/MGE1b6Nfa1HLTL9LyajT
 9LzexqBiS0tM2U/lxF9D/axfsoGbh4iLa0h4U16/7G4RokBsn+Txl6mbI3MqPVgbM6bi
 GMa+fXmZD60A4ozbyFJiDwQ5SezypXWBmvvKOLqnnJvVp9QxRFb3qujIECKEglRDJuDr
 qQW3e6ylHTG0CQxNYususMMIryASYuPwoilWNshG3EvMfwN5qnksDgaSNN7sYhyVxTYy 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcptdg7n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Mar 2023 11:02:18 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32HAq0Uo008387;
 Fri, 17 Mar 2023 11:02:17 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcptdg7mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Mar 2023 11:02:17 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GIdd76028849;
 Fri, 17 Mar 2023 11:02:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pbsyxsne0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Mar 2023 11:02:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32HB2DbO26345968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Mar 2023 11:02:13 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CC392004D;
 Fri, 17 Mar 2023 11:02:13 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F3782004F;
 Fri, 17 Mar 2023 11:02:13 +0000 (GMT)
Received: from [9.171.2.157] (unknown [9.171.2.157])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 17 Mar 2023 11:02:13 +0000 (GMT)
Message-ID: <b60eab8dde6cb3f762d5d39015345bed970552dc.camel@linux.ibm.com>
Subject: Re: [PATCH v4 12/12] tests/tcg/s390x: Test unaligned accesses
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 17 Mar 2023 12:02:12 +0100
In-Reply-To: <c7e9b213-bcf6-1f11-6c12-e62666a9def5@redhat.com>
References: <20230316164428.275147-1-iii@linux.ibm.com>
 <20230316164428.275147-13-iii@linux.ibm.com>
 <41989f42-bca7-759f-8942-8b295d9f48eb@redhat.com>
 <c7e9b213-bcf6-1f11-6c12-e62666a9def5@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rMVSAzZGzqcREhD15LHLVba3JImWMaZm
X-Proofpoint-ORIG-GUID: TJ5XHvoeecdBok8QF-H55oBZDvahg4pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_06,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Fri, 2023-03-17 at 12:00 +0100, Thomas Huth wrote:
> On 17/03/2023 11.54, Thomas Huth wrote:
> > On 16/03/2023 17.44, Ilya Leoshkevich wrote:
> > > Add a number of small test that check whether accessing unaligned
> > > addresses in various ways leads to a specification exception.
> > >=20
> > > Run these test both in softmmu and user configurations; expect a
> > > PGM
> > > in one case and SIGILL in the other.
> > >=20
> > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > ---
> > ...
> > > diff --git a/tests/tcg/s390x/Makefile.softmmu-target=20
> > > b/tests/tcg/s390x/Makefile.softmmu-target
> > > index 725b6c598db..6d8bf299b28 100644
> > > --- a/tests/tcg/s390x/Makefile.softmmu-target
> > > +++ b/tests/tcg/s390x/Makefile.softmmu-target
> > > @@ -1,11 +1,20 @@
> > > =C2=A0 S390X_SRC=3D$(SRC_PATH)/tests/tcg/s390x
> > > =C2=A0 VPATH+=3D$(S390X_SRC)
> > > =C2=A0 QEMU_OPTS=3D-action panic=3Dexit-failure -kernel
> > > +LINK_SCRIPT=3D$(S390X_SRC)/softmmu.ld
> > > +LDFLAGS=3D-nostdlib -static -Wl,-T$(LINK_SCRIPT)
> > > -%: %.S
> > > -=C2=A0=C2=A0=C2=A0 $(CC) -march=3Dz13 -m64 -nostdlib -static -Wl,-Tt=
ext=3D0 \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wl,--build-id=3Dnone $< =
-o $@
> > > +%.o: %.S
> > > +=C2=A0=C2=A0=C2=A0 $(CC) -march=3Dz13 -m64 -c $< -o $@
> > > +
> > > +%: %.o $(LINK_SCRIPT)
> > > +=C2=A0=C2=A0=C2=A0 $(CC) $< -o $@ $(LDFLAGS)
> > > =C2=A0 TESTS +=3D unaligned-lowcore
> > > =C2=A0 TESTS +=3D bal
> > > =C2=A0 TESTS +=3D sam
> > > +
> > > +include $(S390X_SRC)/pgm-specification.mak
> > > +$(PGM_SPECIFICATION_TESTS): pgm-specification-softmmu.o
> > > +$(PGM_SPECIFICATION_TESTS): LDFLAGS+=3Dpgm-specification-softmmu.o
> > > +TESTS +=3D $(PGM_SPECIFICATION_TESTS)
> > > diff --git a/tests/tcg/s390x/Makefile.target=20
> > > b/tests/tcg/s390x/Makefile.target
> > > index cf93b966862..1002ab79886 100644
> > > --- a/tests/tcg/s390x/Makefile.target
> > > +++ b/tests/tcg/s390x/Makefile.target
> > > @@ -2,6 +2,9 @@ S390X_SRC=3D$(SRC_PATH)/tests/tcg/s390x
> > > =C2=A0 VPATH+=3D$(S390X_SRC)
> > > =C2=A0 CFLAGS+=3D-march=3DzEC12 -m64
> > > +%.o: %.c
> > > +=C2=A0=C2=A0=C2=A0 $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
> > > +
> > > =C2=A0 config-cc.mak: Makefile
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(quiet-@)( \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call cc-opti=
on,-march=3Dz14, CROSS_CC_HAS_Z14); \
> > > @@ -33,6 +36,11 @@ TESTS+=3Dchrl
> > > =C2=A0 cdsg: CFLAGS+=3D-pthread
> > > =C2=A0 cdsg: LDFLAGS+=3D-pthread
> > > +include $(S390X_SRC)/pgm-specification.mak
> > > +$(PGM_SPECIFICATION_TESTS): pgm-specification-user.o
> > > +$(PGM_SPECIFICATION_TESTS): LDFLAGS+=3Dpgm-specification-user.o
> > > +TESTS +=3D $(PGM_SPECIFICATION_TESTS)
> > ...
> > > diff --git a/tests/tcg/s390x/softmmu.ld
> > > b/tests/tcg/s390x/softmmu.ld
> > > new file mode 100644
> > > index 00000000000..ea944eaa3cb
> > > --- /dev/null
> > > +++ b/tests/tcg/s390x/softmmu.ld
> > > @@ -0,0 +1,20 @@
> > > +/*
> > > + * Linker script for the softmmu test kernels.
> > > + *
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + */
> > > +
> > > +ENTRY(_start)
> > > +
> > > +SECTIONS {
> > > +=C2=A0=C2=A0=C2=A0 . =3D 0;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 .text : {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.head)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.text)
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /DISCARD/ : {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(*)
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +}
> >=20
> > I just gave it a try, and while it's basically working, I see a lot
> > of these=20
> > messages in the console:
> >=20
> > /usr/bin/ld: warning: .note.gnu.build-id section discarded, --
> > build-id ignored
> >=20
> > I think you should either pass --build-id=3Dnone to the linker, or
> > add a=20
> > .note.gnu.build-id section to the linker script?
>=20
> This seems to work:
>=20
> diff --git a/tests/tcg/s390x/Makefile.softmmu-target
> b/tests/tcg/s390x/Makefile.softmmu-target
> --- a/tests/tcg/s390x/Makefile.softmmu-target
> +++ b/tests/tcg/s390x/Makefile.softmmu-target
> @@ -2,7 +2,7 @@ S390X_SRC=3D$(SRC_PATH)/tests/tcg/s390x
> =C2=A0 VPATH+=3D$(S390X_SRC)
> =C2=A0 QEMU_OPTS=3D-action panic=3Dexit-failure -kernel
> =C2=A0 LINK_SCRIPT=3D$(S390X_SRC)/softmmu.ld
> -LDFLAGS=3D-nostdlib -static -Wl,-T$(LINK_SCRIPT)
> +LDFLAGS=3D-nostdlib -static -Wl,-T$(LINK_SCRIPT) -Wl,--build-id=3Dnone
> =C2=A0=20
> =C2=A0 %.o: %.S
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) -march=3Dz13 -m64 =
-c $< -o $@
>=20
> I'll squash that in ... no need to resend.
>=20
> =C2=A0 Thomas

Thanks! The Makefile used to have this, but I thought that the linker
script would replace this (since it /DISCARD/s the build id), and I did
not notice the warnings.

Your diff looks good to me.

