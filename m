Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A46BD785
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 18:51:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcrk6-0003pb-5y; Thu, 16 Mar 2023 13:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pcrjx-0003oq-Tf; Thu, 16 Mar 2023 13:50:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pcrju-0004bq-V7; Thu, 16 Mar 2023 13:50:13 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GHCMXA022781; Thu, 16 Mar 2023 17:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KoygIkRcxgzjvSdLK3lx+evv+G1JnBqBiaQcdUpXcvk=;
 b=a3lPaX1P4QQU1L6ygH8V6YyezQzgPilJoq2guAXgPmkUu+hskvREG5KK+1RrEWHahAhc
 odmoqRwMW/MA+bBVYVct2zyQzMCpfmgsImgS3x8uGITTJClAT33xcaKOxDFfWWZIOq0c
 6b3uDkSWUfYJ+MwTIS4Fe7mcPXTrBuvrlKJ4LE8yyMF56TPFfISgb8s2XBoSKJkLOXNo
 e9ay2+QXkgsjvq2ZlP3CzjYDymdx/GTcpkRiPsBMBL0QnURMmAAHwC29e8AedruBtbj2
 IOjugUlmRrnXDGjblIuqUGo/trZZj+6Kia8jHAu3vk1YfyMwsldexYfyVwOXDx+OpeYz +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc7a4h2du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:50:06 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GHa8cp020165;
 Thu, 16 Mar 2023 17:50:05 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc7a4h2ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:50:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GEuwAL015019;
 Thu, 16 Mar 2023 17:50:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pbsf3h2wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:50:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GHo0lf19137204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 17:50:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C05F22004F;
 Thu, 16 Mar 2023 17:50:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E2B120040;
 Thu, 16 Mar 2023 17:50:00 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.178.56]) by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 17:50:00 +0000 (GMT)
Message-ID: <5289dc2f8cc7c1b2ee3b6693b54b3b98746b4d0b.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] tests/tcg/s390x: Add ex-relative-long.c
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 16 Mar 2023 18:50:00 +0100
In-Reply-To: <20230315001117.337128-3-iii@linux.ibm.com>
References: <20230315001117.337128-1-iii@linux.ibm.com>
 <20230315001117.337128-3-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kWeN7j8hS4ozcCNxxaJTXJ11p_D1oXdb
X-Proofpoint-ORIG-GUID: 4L0bqp2FTDTwlShBjaslPiCpzRmkiYIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_11,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160135
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

On Wed, 2023-03-15 at 01:11 +0100, Ilya Leoshkevich wrote:
> > Test EXECUTE and EXECUTE RELATIVE LONG with relative long instructions
> > as targets.
> >=20
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

Some comments below.

> > ---
> >  tests/tcg/s390x/Makefile.target    |   1 +
> >  tests/tcg/s390x/ex-relative-long.c | 159 +++++++++++++++++++++++++++++
> >  2 files changed, 160 insertions(+)
> >  create mode 100644 tests/tcg/s390x/ex-relative-long.c
> >=20
> > diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile=
.target
> > index cf93b966862..90bc48227db 100644
> > --- a/tests/tcg/s390x/Makefile.target
> > +++ b/tests/tcg/s390x/Makefile.target
> > @@ -29,6 +29,7 @@ TESTS+=3Dclst
> >  TESTS+=3Dlong-double
> >  TESTS+=3Dcdsg
> >  TESTS+=3Dchrl
> > +TESTS+=3Dex-relative-long
> > =20
> >  cdsg: CFLAGS+=3D-pthread
> >  cdsg: LDFLAGS+=3D-pthread
> > diff --git a/tests/tcg/s390x/ex-relative-long.c b/tests/tcg/s390x/ex-re=
lative-long.c
> > new file mode 100644
> > index 00000000000..4caa8c1b962
> > --- /dev/null
> > +++ b/tests/tcg/s390x/ex-relative-long.c
> > @@ -0,0 +1,159 @@
> > +/* Check EXECUTE with relative long instructions as targets. */
> > +#include <stdlib.h>
> > +#include <stdio.h>
> > +
> > +struct test {
> > +    const char *name;
> > +    long (*func)(long reg, long *cc);
> > +    long exp_reg;
> > +    long exp_mem;
> > +    long exp_cc;
> > +};
> > +
> > +/*
> > + * Each test sets the MEM_IDXth element of the mem array to MEM and us=
es a
> > + * single relative long instruction on it. The other elements remain z=
ero.
> > + * This is in order to prevent stumbling upon MEM in random memory in =
case
> > + * there is an off-by-a-small-value bug.
> > + *
> > + * Note that while gcc supports the ZL constraint for relative long op=
erands,
> > + * clang doesn't, so the assembly code accesses mem[MEM_IDX] using MEM=
_ASM.
> > + */
> > +long mem[0x1000];

This could be static, no?

> > +#define MEM_IDX 0x800
> > +#define MEM_ASM "mem+0x800*8"
> > +
> > +/* Initial %r2 value. */
> > +#define REG 0x1234567887654321
> > +
> > +/* Initial mem[MEM_IDX] value. */
> > +#define MEM 0xfedcba9889abcdef
> > +
> > +/* Initial cc value. */
> > +#define CC 0
> > +
> > +/* Relative long instructions and their expected effects. */
> > +#define FOR_EACH_INSN(F)                                              =
         \

You could define some macros and then calculate a bunch of values in the ta=
ble, i.e.
#define SL(v) ((long)(v))
#define UL(v) ((unsigned long)(v))
#define SI(v, i) ((int)(v >> ((1 - i) * 32)))
#define UI(v, i) ((unsigned int)(v >> ((1 - i) * 32)))
#define SH(v, i) ((short)(v >> ((3 - i) * 16)))
#define UH(v, i) ((unsigned short)(v >> ((3 - i) * 16)))
#define CMP(f, s) ((f) =3D=3D (s) ? 0 : ((f) < (s) ? 1 : 2 ))

F(cgfrl,  REG,                 MEM,                CMP(SL(REG), SI(MEM, 0))

But everything checks out, so no need.

> > +    F(cgfrl,  REG,                 MEM,                2)             =
         \
> > +    F(cghrl,  REG,                 MEM,                2)             =
         \
> > +    F(cgrl,   REG,                 MEM,                2)             =
         \
> > +    F(chrl,   REG,                 MEM,                1)             =
         \
> > +    F(clgfrl, REG,                 MEM,                2)             =
         \
> > +    F(clghrl, REG,                 MEM,                2)             =
         \
> > +    F(clgrl,  REG,                 MEM,                1)             =
         \
> > +    F(clhrl,  REG,                 MEM,                2)             =
         \
> > +    F(clrl,   REG,                 MEM,                1)             =
         \
> > +    F(crl,    REG,                 MEM,                1)             =
         \
> > +    F(larl,   (long)&mem[MEM_IDX], MEM,                CC)            =
         \
> > +    F(lgfrl,  0xfffffffffedcba98,  MEM,                CC)            =
         \
> > +    F(lghrl,  0xfffffffffffffedc,  MEM,                CC)            =
         \
> > +    F(lgrl,   MEM,                 MEM,                CC)            =
         \
> > +    F(lhrl,   0x12345678fffffedc,  MEM,                CC)            =
         \
> > +    F(llghrl, 0x000000000000fedc,  MEM,                CC)            =
         \
> > +    F(llhrl,  0x123456780000fedc,  MEM,                CC)            =
         \
> > +    F(lrl,    0x12345678fedcba98,  MEM,                CC)            =
         \
> > +    F(stgrl,  REG,                 REG,                CC)            =
         \
> > +    F(sthrl,  REG,                 0x4321ba9889abcdef, CC)            =
         \
> > +    F(strl,   REG,                 0x8765432189abcdef, CC)
> > +
> > +/* Test functions. */
> > +#define DEFINE_EX_TEST(insn, exp_reg, exp_mem, exp_cc)                =
         \
> > +    static long test_ex_ ## insn(long reg, long *cc)                  =
         \
> > +    {                                                                 =
         \
> > +        register long reg_val asm("r2");                              =
         \
> > +        long cc_val, mask, target;                                    =
         \
> > +                                                                      =
         \
> > +        reg_val =3D reg;                                              =
           \
> > +        asm("xgr %[cc_val],%[cc_val]\n"  /* initial cc */             =
         \

This confused me for a bit because it's not about cc_val at all.
Maybe do "cr %%r0,%%r0\n" instead?
Could also push it down before the ex, since that's where the change we car=
e about
takes place.

> > +            "lghi %[mask],0x20\n"        /* make target use %r2 */    =
         \
> > +            "larl %[target],0f\n"                                     =
         \
> > +            "ex %[mask],0(%[target])\n"                               =
         \
> > +            "jg 1f\n"                                                 =
         \
> > +            "0: " #insn " %%r0," MEM_ASM "\n"                         =
         \
> > +            "1: ipm %[cc_val]\n"                                      =
         \
> > +            : [cc_val] "=3D&r" (cc_val)                               =
           \
> > +            , [mask] "=3D&r" (mask)                                   =
           \
> > +            , [target] "=3D&r" (target)                               =
           \
> > +            , [reg_val] "+&r" (reg_val)                               =
         \
> > +            : : "cc", "memory");                                      =
         \
> > +        reg =3D reg_val;                                              =
           \

What is the point of this assignment?

> > +        *cc =3D (cc_val >> 28) & 3;                                   =
           \
> > +                                                                      =
         \
> > +        return reg_val;                                               =
         \
> > +    }
> > +
> > +#define DEFINE_EXRL_TEST(insn, exp_reg, exp_mem, exp_cc)              =
         \
> > +    static long test_exrl_ ## insn(long reg, long *cc)                =
         \
> > +    {                                                                 =
         \
> > +        register long reg_val asm("r2");                              =
         \
> > +        long cc_val, mask;                                            =
         \
> > +                                                                      =
         \
> > +        reg_val =3D reg;                                              =
           \
> > +        asm("xgr %[cc_val],%[cc_val]\n"  /* initial cc */             =
         \
> > +            "lghi %[mask],0x20\n"        /* make target use %r2 */    =
         \
> > +            "exrl %[mask],0f\n"                                       =
         \
> > +            "jg 1f\n"                                                 =
         \
> > +            "0: " #insn " %%r0," MEM_ASM "\n"                         =
         \
> > +            "1: ipm %[cc_val]\n"                                      =
         \
> > +            : [cc_val] "=3D&r" (cc_val)                               =
           \
> > +            , [mask] "=3D&r" (mask)                                   =
           \
> > +            , [reg_val] "+&r" (reg_val)                               =
         \
> > +            : : "cc", "memory");                                      =
         \
> > +        reg =3D reg_val;                                              =
           \
> > +        *cc =3D (cc_val >> 28) & 3;                                   =
           \
> > +                                                                      =
         \
> > +        return reg_val;                                               =
         \
> > +    }
> > +
> > +FOR_EACH_INSN(DEFINE_EX_TEST)
> > +FOR_EACH_INSN(DEFINE_EXRL_TEST)
> > +
> > +/* Test definitions. */
> > +#define REGISTER_EX_EXRL_TEST(ex_insn, insn, _exp_reg, _exp_mem, _exp_=
cc)      \
> > +    {                                                                 =
         \
> > +        .name =3D #ex_insn " " #insn,                                 =
           \
> > +        .func =3D test_ ## ex_insn ## _ ## insn,                      =
           \
> > +        .exp_reg =3D (long)(_exp_reg),                                =
           \
> > +        .exp_mem =3D (long)(_exp_mem),                                =
           \
> > +        .exp_cc =3D (long)(_exp_cc),                                  =
           \

You don't need the casts, do you?

> > +    },
> > +
> > +#define REGISTER_EX_TEST(insn, exp_reg, exp_mem, exp_cc)              =
         \
> > +    REGISTER_EX_EXRL_TEST(ex, insn, exp_reg, exp_mem, exp_cc)
> > +
> > +#define REGISTER_EXRL_TEST(insn, exp_reg, exp_mem, exp_cc)            =
         \
> > +    REGISTER_EX_EXRL_TEST(exrl, insn, exp_reg, exp_mem, exp_cc)
> > +
> > +static const struct test tests[] =3D {
> > +    FOR_EACH_INSN(REGISTER_EX_TEST)
> > +    FOR_EACH_INSN(REGISTER_EXRL_TEST)
> > +};
> > +
> > +/* Loop over all tests and run them. */
> > +int main(void)
> > +{
> > +    const struct test *test;
> > +    int ret =3D EXIT_SUCCESS;
> > +    long reg, cc;
> > +    size_t i;
> > +
> > +    for (i =3D 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
> > +        test =3D &tests[i];
> > +        mem[MEM_IDX] =3D MEM;
> > +        cc =3D -1;
> > +        reg =3D test->func(REG, &cc);
> > +#define ASSERT_EQ(expected, actual) do {                              =
         \
> > +    if (expected !=3D actual) {                                       =
           \
> > +        fprintf(stderr, "%s: " #expected " (0x%lx) !=3D " #actual " (0=
x%lx)\n",  \
> > +                test->name, expected, actual);                        =
         \
> > +        ret =3D EXIT_FAILURE;                                         =
           \
> > +    }                                                                 =
         \
> > +} while (0)
> > +        ASSERT_EQ(test->exp_reg, reg);
> > +        ASSERT_EQ(test->exp_mem, mem[MEM_IDX]);
> > +        ASSERT_EQ(test->exp_cc, cc);
> > +#undef ASSERT_EQ
> > +    }
> > +
> > +    return ret;
> > +}



