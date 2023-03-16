Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060DE6BD6D2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 18:16:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcrCM-0000VG-7T; Thu, 16 Mar 2023 13:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcrCA-0000R9-CQ; Thu, 16 Mar 2023 13:15:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcrC7-00065H-D5; Thu, 16 Mar 2023 13:15:17 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GGhtjD009909; Thu, 16 Mar 2023 17:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DYLiv2gSkW/J0JNNYBPgKBAfNcMO+RH9HPC2nCUi8a0=;
 b=YBBFXZilWpk17GdSxWZIpm0GSB4BlpwzRZp3q6/VV9I2xMjGnsrrHoZ82CDXeLhar28w
 rlxdTqMARoyShkMG50IoAcRKi9qZmAU5Ne9M748Mhzv1xehM/tjGImgqOetVFejcjIlC
 /yBnuXE/OVJpjrdK1KThUPWwaQp6iJa7wdheX0h9YZxqOgJf/ukCp55X2gjvGbyS0c4R
 NmnKmm+d/fc0LEEtkDI+XDbHTBpPa4Fef7IVn2awqv6vM4p9YrkbJ6J0UvVjuemVxfwC
 frLK1mOvCYOGpEoDdNDQs2DF7laqnpZDR3lRDhNLoudaXId+zsL0wcDMnwSs5nuRmmdn PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc6vs0yy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:15:12 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GGjYPF018952;
 Thu, 16 Mar 2023 17:15:11 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc6vs0yx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:15:11 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32G1qbYX007748;
 Thu, 16 Mar 2023 17:15:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pbsu7gtnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:15:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GHF77620316840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 17:15:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 281FD20043;
 Thu, 16 Mar 2023 17:15:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D88120040;
 Thu, 16 Mar 2023 17:15:06 +0000 (GMT)
Received: from [9.171.2.157] (unknown [9.171.2.157])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 17:15:06 +0000 (GMT)
Message-ID: <a2e12eb0c498958524888cfc539e8f30174b2faf.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] target/s390x: Fix R[NOX]SBG with T=1
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 16 Mar 2023 18:15:06 +0100
In-Reply-To: <9b5c4389-a9e3-00e1-11fa-b1a0c10cd312@linaro.org>
References: <20230315235642.118002-1-iii@linux.ibm.com>
 <20230315235642.118002-2-iii@linux.ibm.com>
 <9b5c4389-a9e3-00e1-11fa-b1a0c10cd312@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nr315t1RYwXf5skXN-cJchngA_VoT2zg
X-Proofpoint-ORIG-GUID: zIzeg8W38h2nvUXHtOOXBcWlcrJvUoFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303160133
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

On Thu, 2023-03-16 at 09:41 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> On 16/3/23 00:56, Ilya Leoshkevich wrote:
> > RXSBG usage in the "filetests" test from the wasmtime testsuite
> > makes
> > tcg_reg_alloc_op() attempt to temp_load() a TEMP_VAL_DEAD
> > temporary,
> > causing an assertion failure:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 0x01000a70:=C2=A0 ec14 b040 3057=C2=A0 rxsbg=
=C2=A0=C2=A0=C2=A0 %r1, %r4, 0xb0, 0x40,
> > 0x30
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 OP after optimization and liveness analysis:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ---- 0000000001000a70 0000000000000004 0=
000000000000006
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rotl_i64 tmp2,r4,$0x30=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dead: 1 2=C2=A0
> > pref=3D0xffff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and_i64 tmp2,tmp2,$0x800000000000ffff=C2=
=A0=C2=A0=C2=A0 dead: 1=C2=A0 pref=3D0xffff
> > =C2=A0=C2=A0=C2=A0=C2=A0 [xor_i64 tmp3,tmp3,tmp2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dead: 1 2=C2=A0
> > pref=3D0xffff]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and_i64 cc_dst,tmp3,$0x800000000000ffff=
=C2=A0 sync: 0=C2=A0 dead: 0 1
> > 2=C2=A0 pref=3D0xffff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov_i64 psw_addr,$0x1000a76=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sync: 0=
=C2=A0 dead: 0 1=C2=A0
> > pref=3D0xffff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov_i32 cc_op,$0x6=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sync: 0=C2=A0 dead: 0 1=C2=A0
> > pref=3D0xffff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 call lookup_tb_ptr,$0x6,$1,tmp8,env=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dead: 1=C2=A0 pref=3Dnone
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto_ptr tmp8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dead: 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_label $L0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit_tb $0x7fffe809d183
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 ../tcg/tcg.c:3865: tcg fatal error
> >=20
> > The reason is that tmp3 does not have an initial value, which
> > confuses
> > the register allocator. This also affects the correctness of the
> > results.
> >=20
> > Fix by assigning R1 to it.
> >=20
> > Fixes: d6c6372e186e ("target-s390: Implement R[NOX]SBG")
>=20
> Exposed by 3ac6f91bca..dd161de75f?

Bisect points to:

commit e2e641fa3d5e730f128562d6901dcc729c9bf8a0
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Sun Jan 29 14:09:00 2023 -1000

    tcg: Change default temp lifetime to TEMP_TB

I will mention this.

> 3ac6f91bca target/s390x: Drop tcg_temp_free from translate.c
> dd161de75f target/s390x: Remove g_out, g_out2, g_in1, g_in2
>=20
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > =C2=A0 target/s390x/tcg/translate.c | 3 +++
> > =C2=A0 1 file changed, 3 insertions(+)
> >=20
> > diff --git a/target/s390x/tcg/translate.c
> > b/target/s390x/tcg/translate.c
> > index 14c3896d529..6dd2f41ad08 100644
> > --- a/target/s390x/tcg/translate.c
> > +++ b/target/s390x/tcg/translate.c
> > @@ -3696,10 +3696,13 @@ static DisasJumpType op_rosbg(DisasContext
> > *s, DisasOps *o)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i4 =3D get_field(s, i4);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i5 =3D get_field(s, i5);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t mask;
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 tmp;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If this is a test-only form, arrange =
to discard the
> > result.=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i3 & 0x80) {
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_debug_as=
sert(o->out !=3D NULL); ?

Ok, I will add this.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp =3D o->out;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o->out =3D tcg_t=
emp_new_i64();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_gen_mov_i64(o->out, tmp=
);
>=20
> Something bugs me with this pattern but I can't say why yet :(

Please let me know once you come up with something.
I will do s/tmp/orig_out/ send a v3 in the meantime.

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i3 &=3D 63;


