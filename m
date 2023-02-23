Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0B6A12F3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:47:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKLL-0006K2-45; Thu, 23 Feb 2023 17:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVKLI-0006J3-9t
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:45:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVKLG-000666-29
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:45:36 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NKYJP3032160; Thu, 23 Feb 2023 22:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Is2VR/hpznL6aw54eQF4blOBS2Wr0rbO4cTjqpOZn0g=;
 b=euWutCoQYYxxN8tsWCZe3kdwtRd9cDvnwWHTWHZR2bDA3/m4wpa5hwbDWOUC9K8XuGTM
 S0HzENAoe1GXL61dPgjc8Cue5GTMEGA9kr4qMREPJDXnuF2TOsGvfPUGf9fFpW27KUsX
 obV0ozsFI8SXPr0CAu1ctaolCRPXnMPjeOED5p5q2Nx5Y4X5txmDSyR2CKv97tFOBN8U
 vdr76oN/8YEkskZp30uVpiWiIGIW/9q63cgpVcldC93p/Hxya9HgoR6uuWK211qA8/9o
 WUJv9d1giHLDLazUAyZWI4lB5g89kR5rdQURVepssV5OHW6NkN7v+T5oK+GhlWae+ZGz hQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxenmbx3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 22:45:29 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31N75I9r001634;
 Thu, 23 Feb 2023 22:45:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3ntpa65fnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 22:45:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31NMjPZX29491470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 22:45:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1011D2005A;
 Thu, 23 Feb 2023 22:45:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9726F20063;
 Thu, 23 Feb 2023 22:45:24 +0000 (GMT)
Received: from [9.179.17.238] (unknown [9.179.17.238])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Feb 2023 22:45:24 +0000 (GMT)
Message-ID: <c372cbd88605a19f4d5840cf5d7719f7a8165adb.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] linux-user: Fix unaligned memory access in
 prlimit64 syscall
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Date: Thu, 23 Feb 2023 23:45:24 +0100
In-Reply-To: <f4d837ce-1a2a-9e7d-4499-76820d6fdc36@linaro.org>
References: <20230223215834.166055-1-iii@linux.ibm.com>
 <20230223215834.166055-2-iii@linux.ibm.com>
 <f4d837ce-1a2a-9e7d-4499-76820d6fdc36@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TVKhd0QsAwTbFXv1ajtMry45N6xp4Jpp
X-Proofpoint-GUID: TVKhd0QsAwTbFXv1ajtMry45N6xp4Jpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230187
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

On Thu, 2023-02-23 at 12:31 -1000, Richard Henderson wrote:
> On 2/23/23 11:58, Ilya Leoshkevich wrote:
> > 32-bit guests may enforce only 4-byte alignment for
> > target_rlimit64,
> > whereas 64-bit hosts normally require the 8-byte one. Therefore
> > accessing this struct directly is UB.
> >=20
> > Fix by adding a local copy.
> >=20
> > Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
> > Reported-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > =C2=A0 linux-user/syscall.c | 12 +++++++-----
> > =C2=A0 1 file changed, 7 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index a6c426d73cf..8ae7696d8f1 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -12876,7 +12876,7 @@ static abi_long do_syscall1(CPUArchState
> > *cpu_env, int num, abi_long arg1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_NR_prlimit64:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* args: pid, re=
source number, ptr to new rlimit, ptr to
> > old rlimit */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct target_rlimit64 *tar=
get_rnew, *target_rold;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct target_rlimit64 *tar=
get_rnew, *target_rold, tmp;
>=20
> The bug is that target_rlimit64 uses uint64_t (64-bit host
> alignment), when it should be=20
> using abi_ullong (64-bit target alignment).=C2=A0 There are quite a numbe=
r
> of these sorts of=20
> bugs in linux-user.
>=20
>=20
> r~

Thanks, this helps.

I thought that unaligned accesses were illegal no matter what, e.g., on
sparc64, but turns out the compiler is actually smart enough to handle
them:

#include <stdint.h>
typedef uint64_t abi_ullong __attribute__((aligned(4)));
abi_ullong load(abi_ullong *x) { return *x; }

produces

load:
	save	%sp, -176, %sp
	lduw	[%i0], %g1
	lduw	[%i0+4], %i0
	sllx	%g1, 32, %g1
	return	%i7+8
	 or	%o0, %g1, %o0

instead of just

load:
	save	%sp, -176, %sp
	return	%i7+8
	 ldx	[%o0], %o0

I'll send a v2.

Best regards,
Ilya

