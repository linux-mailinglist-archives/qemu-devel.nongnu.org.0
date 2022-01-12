Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE748BDF3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 05:47:19 +0100 (CET)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7VXa-0002KA-8l
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 23:47:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VWI-0000u0-HT; Tue, 11 Jan 2022 23:45:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26350
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VWE-0004SK-SW; Tue, 11 Jan 2022 23:45:58 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C2uuq6022102; 
 Wed, 12 Jan 2022 04:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=8QRQK0Ahfkbk1YI/EL0GUM8ml3pFpEzsIrSLigAvdGQ=;
 b=l0lUu3c1K1MgEqlMiqLhd1KrAorZoEEBcjamLobPu2M3TJwj3EqNj1mnkR+OR+yDrPxB
 anfp6ez19dzpUHzDeSXw/jIyR4Y8IyFIq4hQt+ReEy4f8t0vnkMwUjjRjCaVNS+amtEy
 F3/Tc5dDtbx0qznXskjPhYQIOg8pzXagSiLyAmGj/g8SnIOk9TjH7Vcpfe5FwKCxDsqY
 v2WdhsaI5NP7gsRQ4VoV7NhSxD20RpaqnPPMBMgCoTJKyi5FedV/J4N8Atrk8WCjUfp8
 7kKKm4MEAaEUEJOBIMINJ/WqXpLdm4xweSMcFx7HVTeqdiAokIaU3Jb7gx1DQ9RA9KrX rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhpnc9du9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:45:53 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20C4UPTV030960;
 Wed, 12 Jan 2022 04:45:52 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhpnc9dtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:45:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C4g05q000366;
 Wed, 12 Jan 2022 04:45:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vj5j4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:45:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C4jmc741222404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 04:45:48 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B8BFA4055;
 Wed, 12 Jan 2022 04:45:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EE53A404D;
 Wed, 12 Jan 2022 04:45:48 +0000 (GMT)
Received: from [9.171.78.41] (unknown [9.171.78.41])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 04:45:48 +0000 (GMT)
Message-ID: <af39e8f0122a891fe7c80ff3b37cc812c4d11966.camel@linux.ibm.com>
Subject: Re: [PATCH] target/s390x: Fix 32-bit shifts
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Thomas
 Huth <thuth@redhat.com>
Date: Wed, 12 Jan 2022 05:45:47 +0100
In-Reply-To: <64e683e1-64ca-205e-0f09-0817c97a7e1c@redhat.com>
References: <20220110185918.219154-1-iii@linux.ibm.com>
 <64e683e1-64ca-205e-0f09-0817c97a7e1c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IdG539P0NJapR4fuHPTbMXCD7zoaeUpw
X-Proofpoint-GUID: 0TIgwgSMn6eftLouFRTaCJqhgr3b9IdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_01,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120024
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-01-11 at 15:22 +0100, David Hildenbrand wrote:
> On 10.01.22 19:59, Ilya Leoshkevich wrote:
> > Both 32- and 64-bit shifts use lowest 6 address bits. The current
> > code
> > special-cases 32-bit shifts to use only 5 bits, which is not
> > correct.
> > 
> 
> I assume for 32-bit shifts, we could only shift by 31, not by 32 or
> bigger. So it's impossible to zero out a 32bit register using a shift
> right now.

Thanks for having a detailed look!

That's my understanding of the problem as well.

> Let's take a look at the details:
> 
> * RLL: IMHO it doesn't matter if we rotate by an additional 32bit,
> the
>        result is the same. Not broken.
> * SLA/SLAK: the numerical part is 31-bit, we don't care about
> shifting
>             any more, the result for the numerical part is the same
> (0).
>             Not broken.
> * SLL/SLAK: Is broken because we cannot shift by > 31 and create
>             a 0 result. Broken.
> * SRA/SRAK: Same as SLA/SLAK. Not broken.
> * SRL/SRLK: Same as SLL/SLAK, broken.
> * SLDA/SLDL ... should not be broken because they are 64 bit shifts.
> 
> So AFAIKS, only SLL/SLAK and SRL/SRLK needs fixing to be able to
> shift > 32.

I think others (except rotation) are affected too, because they cannot
distinguish between shifting by 0 and 32 bits.

> The issue with this patch is that I think it degrades CC computation.
> For 32bit, we could now get a shift < 64, and I think at least
> cc_calc_sla_32() is not prepared for that.

Ouch, that's now broken indeed. I've fixed it in v2 and added a test.

> > Fix by merging sh32 and sh64.
> > 
> > Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  target/s390x/tcg/insn-data.def  | 36 ++++++++++++++++-------------
> > ----
> >  target/s390x/tcg/translate.c    | 10 ++-------
> >  tests/tcg/s390x/Makefile.target |  1 +
> >  tests/tcg/s390x/sll.c           | 25 +++++++++++++++++++++++
> >  4 files changed, 46 insertions(+), 26 deletions(-)
> >  create mode 100644 tests/tcg/s390x/sll.c
> > 
> > diff --git a/target/s390x/tcg/insn-data.def
> > b/target/s390x/tcg/insn-data.def
> > index f0af458aee..348a15be72 100644
> > --- a/target/s390x/tcg/insn-data.def
> > +++ b/target/s390x/tcg/insn-data.def
> > @@ -747,8 +747,8 @@
> >      C(0xb9e1, POPCNT,  RRE,   PC,  0, r2_o, r1, 0, popcnt, nz64)
> >  
> >  /* ROTATE LEFT SINGLE LOGICAL */
> > -    C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh32, new, r1_32, rll32,
> > 0)
> > -    C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh64, r1, 0, rll64, 0)
> > +    C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh, new, r1_32, rll32, 0)
> > +    C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh, r1, 0, rll64, 0)
> >  
> >  /* ROTATE THEN INSERT SELECTED BITS */
> >      C(0xec55, RISBG,   RIE_f, GIE, 0, r2, r1, 0, risbg, s64)
> > @@ -784,29 +784,29 @@
> >      C(0x0400, SPM,     RR_a,  Z,   r1, 0, 0, 0, spm, 0)
> >  
> >  /* SHIFT LEFT SINGLE */
> > -    D(0x8b00, SLA,     RS_a,  Z,   r1, sh32, new, r1_32, sla, 0,
> > 31)
> > -    D(0xebdd, SLAK,    RSY_a, DO,  r3, sh32, new, r1_32, sla, 0,
> > 31)
> > -    D(0xeb0b, SLAG,    RSY_a, Z,   r3, sh64, r1, 0, sla, 0, 63)
> > +    D(0x8b00, SLA,     RS_a,  Z,   r1, sh, new, r1_32, sla, 0, 31)
> > +    D(0xebdd, SLAK,    RSY_a, DO,  r3, sh, new, r1_32, sla, 0, 31)
> > +    D(0xeb0b, SLAG,    RSY_a, Z,   r3, sh, r1, 0, sla, 0, 63)
> >  /* SHIFT LEFT SINGLE LOGICAL */
> > -    C(0x8900, SLL,     RS_a,  Z,   r1_o, sh32, new, r1_32, sll, 0)
> > -    C(0xebdf, SLLK,    RSY_a, DO,  r3_o, sh32, new, r1_32, sll, 0)
> > -    C(0xeb0d, SLLG,    RSY_a, Z,   r3_o, sh64, r1, 0, sll, 0)
> > +    C(0x8900, SLL,     RS_a,  Z,   r1_o, sh, new, r1_32, sll, 0)
> > +    C(0xebdf, SLLK,    RSY_a, DO,  r3_o, sh, new, r1_32, sll, 0)
> > +    C(0xeb0d, SLLG,    RSY_a, Z,   r3_o, sh, r1, 0, sll, 0)
> >  /* SHIFT RIGHT SINGLE */
> > -    C(0x8a00, SRA,     RS_a,  Z,   r1_32s, sh32, new, r1_32, sra,
> > s32)
> > -    C(0xebdc, SRAK,    RSY_a, DO,  r3_32s, sh32, new, r1_32, sra,
> > s32)
> > -    C(0xeb0a, SRAG,    RSY_a, Z,   r3_o, sh64, r1, 0, sra, s64)
> > +    C(0x8a00, SRA,     RS_a,  Z,   r1_32s, sh, new, r1_32, sra,
> > s32)
> > +    C(0xebdc, SRAK,    RSY_a, DO,  r3_32s, sh, new, r1_32, sra,
> > s32)
> > +    C(0xeb0a, SRAG,    RSY_a, Z,   r3_o, sh, r1, 0, sra, s64)
> >  /* SHIFT RIGHT SINGLE LOGICAL */
> > -    C(0x8800, SRL,     RS_a,  Z,   r1_32u, sh32, new, r1_32, srl,
> > 0)
> > -    C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh32, new, r1_32, srl,
> > 0)
> > -    C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh64, r1, 0, srl, 0)
> > +    C(0x8800, SRL,     RS_a,  Z,   r1_32u, sh, new, r1_32, srl, 0)
> > +    C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh, new, r1_32, srl, 0)
> > +    C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh, r1, 0, srl, 0)
> >  /* SHIFT LEFT DOUBLE */
> > -    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla,
> > 0, 31)
> > +    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sla,
> > 0, 31)
> 
> I'm confused. Is the 31 correct here? We're operating on a 64 bit
> value
> and the sign bit shouldn't be in the middle ... but maybe I am
> missing
> something/

Right, that's a bug. Fixed in v2.

> >  /* SHIFT LEFT DOUBLE LOGICAL */
> > -    C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sll,
> > 0)
> > +    C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sll,
> > 0)
> >  /* SHIFT RIGHT DOUBLE */
> > -    C(0x8e00, SRDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sra,
> > s64)
> > +    C(0x8e00, SRDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sra,
> > s64)
> >  /* SHIFT RIGHT DOUBLE LOGICAL */
> > -    C(0x8c00, SRDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, srl,
> > 0)
> > +    C(0x8c00, SRDL,    RS_a,  Z,   r1_D32, sh, new, r1_D32, srl,
> > 0)
> >  
> >  /* SQUARE ROOT */
> >      F(0xb314, SQEBR,   RRE,   Z,   0, e2, new, e1, sqeb, 0,
> > IF_BFP)
> > diff --git a/target/s390x/tcg/translate.c
> > b/target/s390x/tcg/translate.c
> > index f180853e7a..89e14b8f29 100644
> > --- a/target/s390x/tcg/translate.c
> > +++ b/target/s390x/tcg/translate.c
> > @@ -5922,17 +5922,11 @@ static void in2_ri2(DisasContext *s,
> > DisasOps *o)
> >  }
> >  #define SPEC_in2_ri2 0
> >  
> > -static void in2_sh32(DisasContext *s, DisasOps *o)
> > -{
> > -    help_l2_shift(s, o, 31);
> > -}
> > -#define SPEC_in2_sh32 0
> > -
> > -static void in2_sh64(DisasContext *s, DisasOps *o)
> > +static void in2_sh(DisasContext *s, DisasOps *o)
> >  {
> >      help_l2_shift(s, o, 63);
> 
> If we go down that path, we should better inline help_l2_shift().

I still think we need to do that, so inlined in v2.

> >  }
> > -#define SPEC_in2_sh64 0
> > +#define SPEC_in2_sh 0
> >  
> >  static void in2_m2_8u(DisasContext *s, DisasOps *o)
> >  {
> > diff --git a/tests/tcg/s390x/Makefile.target
> > b/tests/tcg/s390x/Makefile.target
> > index cc64dd32d2..4212bab014 100644
> > --- a/tests/tcg/s390x/Makefile.target
> > +++ b/tests/tcg/s390x/Makefile.target
> > @@ -9,6 +9,7 @@ TESTS+=exrl-trtr
> >  TESTS+=pack
> >  TESTS+=mvo
> >  TESTS+=mvc
> > +TESTS+=sll
> >  TESTS+=trap
> >  TESTS+=signals-s390x
> >  
> > diff --git a/tests/tcg/s390x/sll.c b/tests/tcg/s390x/sll.c
> > new file mode 100644
> > index 0000000000..aba2a94676
> > --- /dev/null
> > +++ b/tests/tcg/s390x/sll.c
> > @@ -0,0 +1,25 @@
> > +#include <stdint.h>
> > +#include <unistd.h>
> > +
> > +int main(void)
> > +{
> > +    uint64_t op1 = 0xb90281a3105939dfull;
> > +    uint64_t op2 = 0xb5e4df7e082e4c5eull;
> > +    uint64_t cc = 0xffffffffffffffffull;
> > +
> > +    asm("sll\t%[op1],0xd04(%[op2])"
> > +        "\n\tipm\t%[cc]"
> 
> Let's make this human-readable :)
> 
> asm("    sll %[op1],0xd04(%[op2])\n"
>     "    ipm %[cc]"
> 
> Should we bettr use "asm volatile"?

I don't think we need volatile here - assuming the compiler is sane,
it should see that asm outputs are used and should not throw it away.

> > +        : [op1] "+r" (op1),
> > +          [cc] "+r" (cc)
> > +        : [op2] "r" (op2)
> > +        : "cc");
> > +    if (op1 != 0xb90281a300000000ull) {
> > +        write(1, "bad result\n", 11);
> > +        return 1;
> > +    }
> > +    if (cc != 0xffffffff10ffffffull) {
> > +        write(1, "bad cc\n", 7);
> > +        return 1;
> > +    }
> > +    return 0;
> > +}
> 
> Can we split out the test into a separate patch?

Ok.

Best regards,
Ilya

