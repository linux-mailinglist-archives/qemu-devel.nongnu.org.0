Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D969147C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:34:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGQO-0007Dd-RX; Thu, 09 Feb 2023 18:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pQGQN-00079l-1P
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:33:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pQGQK-0006Ug-MP
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:33:54 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319NXZpQ032309; Thu, 9 Feb 2023 23:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qrGoWsc1iohu99knMVKEeH26blpxToUhvoUHQSTGgis=;
 b=Y/3cQxcro4I0d9WrkJ8E7ifEPsdKGNDqXKU1nMXKkpDBE2t9z1b1s4aC+f31i8wnJoWe
 v4aXmjMhnTmk4GPMsGpWhUIeRa/B67DdtyFoaUMTcY6a0RHV6Lun4zk6mlSsgyYItVuH
 zsrE8+kW0ah5vKu+Lp3bTmsgxwR9g59IIR97dqVfiVKwHw5MZukVCcw2qI3L9hgJTFmh
 vrgj6EVpxXmt7Hl25fSe2Fk7sD9ZKGL27QjSeD6cw+zRPFjfNZjKwy+7Ls/b9N7C3hCI
 rZDYvroExmcorXT90Gjx7L/2luBZAP1j7rjgzJ4MrNDHTeugBLm5t09qPPVXdG78POgz bg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnam28052-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 23:33:49 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319E3NC5026561;
 Thu, 9 Feb 2023 23:33:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3nhf06vu52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 23:33:47 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 319NXiAD42860880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Feb 2023 23:33:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7EBF20043;
 Thu,  9 Feb 2023 23:33:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7227A20040;
 Thu,  9 Feb 2023 23:33:44 +0000 (GMT)
Received: from [9.171.74.186] (unknown [9.171.74.186])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  9 Feb 2023 23:33:44 +0000 (GMT)
Message-ID: <694693aeffdf74cd30aa46aa925a67616c2ee169.camel@linux.ibm.com>
Subject: Re: Linker failures trying to build static qemu-user binary
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Date: Fri, 10 Feb 2023 00:33:44 +0100
In-Reply-To: <CAFEAcA-Le_YbaYn6i15EesDMan+OF0S7uteanSXrWYK37HbdvQ@mail.gmail.com>
References: <f71df8f625e4110b84b6c4fefd9e95619b3ab92e.camel@physik.fu-berlin.de>
 <CAFEAcA-Le_YbaYn6i15EesDMan+OF0S7uteanSXrWYK37HbdvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: doCRjvuuyVUgWC1SGlfsHsor_KaeVirl
X-Proofpoint-ORIG-GUID: doCRjvuuyVUgWC1SGlfsHsor_KaeVirl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090212
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

On Thu, 2023-02-09 at 14:14 +0000, Peter Maydell wrote:
> On Thu, 9 Feb 2023 at 13:54, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> >=20
> > Hi!
> >=20
> > I usually build a static qemu-user binary from the git source using
> > the following
> > configure line:
> >=20
> > export ARCH=3Dm68k && ./configure --target-list=3D$ARCH-linux-user --
> > static --disable-rdma \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --disable-pie --disable-syste=
m --disable-xen --
> > disable-pvrdma \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --disable-libssh --disable-we=
rror --disable-
> > glusterfs
> >=20
> > However, that stopped working some time ago with the linker error
> > below.
> >=20
> > Does anyone know how to fix this?
>=20
> The "Using getpwuid in statically linked applications" etc warnings
> are expected, so we can ignore those; this is the key error:
>=20
> > /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-
> > client.o): in function `__libdwfl_debuginfod_init':
> > (.text.startup+0x17): undefined reference to `dlopen'
> > /usr/bin/ld: (.text.startup+0x32): undefined reference to `dlsym'
> > /usr/bin/ld: (.text.startup+0x4b): undefined reference to `dlsym'
> > /usr/bin/ld: (.text.startup+0x64): undefined reference to `dlsym'
> > /usr/bin/ld: (.text.startup+0x7d): undefined reference to `dlsym'
> > /usr/bin/ld: (.text.startup+0xdc): undefined reference to `dlclose'
> > collect2: error: ld returned 1 exit status
>=20
> We use pkg-config to find out what the libdw library needs on
> the compiler/linker command line to link successfully, so
> maybe your distro's pkg-config info isn't right. What does
> "pkg-config --static --libs libdw" say ? If libdw needs libdl
> then it ought to list it in that output, I think. IME pkg-config
> information is often incorrect for static linking, though.
> I guess this one happened to work previously because glibc didn't
> actually mandate linking with '-ldl', and now on your system it
> apparently does. On my system pkg-config says
> -ldw -lbz2 -llzma -pthread -lpthread -lelf -lz
> which looks like it's missing -ldl, but the link succeeds anyway,
> presumably because the symbols are provided by the main glibc .a.
>=20
> On the other hand, if libdw wants to use dlopen/dlsym then
> I wonder if we should just suppress it for static linking:
> on my (Ubuntu 22.04) ld warns:
> /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o):
> in function `__libdwfl_debuginfod_init':
> (.text.startup+0x1b): warning: Using 'dlopen' in statically linked
> applications requires at runtime the shared libraries from the glibc
> version used for linking
>=20
> so whatever libdw is trying to do will likely not work in most
> statically-linked situations anyway.
>=20
> I've cc'd the author of the commit that added the libdw
> dependency.
>=20
> thanks
> -- PMM

Hi,

libdw uses dlopen() and friends for debuginfod integration, which QEMU
does not currently use. So in principle --extra-ldflags=3D"-ldl"
should be safe.

That said, the functionality provided by libdw is needed for analyzing
performance of JITed code, which is mostly useful to developers and
researchers. Therefore, in order to avoid unpleasant surprises for
people who don't need this, I will send a patch that disables libdw
for static builds.

Best regards,
Ilya

