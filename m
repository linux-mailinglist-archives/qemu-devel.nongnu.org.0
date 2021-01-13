Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A602F4D37
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:36:49 +0100 (CET)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhGS-0001sk-DW
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kzh0B-0007C6-Pp
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:19:59 -0500
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:47711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kzh09-0000np-O0
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:19:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 950352275A4;
 Wed, 13 Jan 2021 15:19:43 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 13 Jan
 2021 15:19:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0023663f81f-6b16-4ba3-8110-13f1b6800503,
 69814ACA4A0B6466BFE1559A3F030A21FAE98BAC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: What's the correct way to implement rfi and related instruction.
To: <luoyonggang@gmail.com>
References: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
 <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
 <CAE2XoE-Fc3Tc51uiDN70_6suHPwczdp9EcS_LirLK-txzgS+yw@mail.gmail.com>
 <ef0eb70c-5b56-9850-2ad3-f12591cd6b4b@kaod.org>
 <CAE2XoE-VAMPYwNcGYK_3fqKgy138VOx6JaaSHD+bvz-fkH_jZA@mail.gmail.com>
 <96e02d87-3326-748d-9c97-de910b5b1533@kaod.org>
 <CAE2XoE-QDj2=o-WZBFh8R2cDxqRLGvDVC6kt0q0xap_R7pB0Rg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0ad3cf87-7850-97a0-baf2-044547a0e575@kaod.org>
Date: Wed, 13 Jan 2021 15:19:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-QDj2=o-WZBFh8R2cDxqRLGvDVC6kt0q0xap_R7pB0Rg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 02229049-0c20-4718-9e76-c2dc486b2d47
X-Ovh-Tracer-Id: 107804916197591913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeektedvveeltddvheehleegleefgeekveeuvdegjefhgeevffeiieekhffgfefggfenucffohhmrghinhepnhigphdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehluhhohihonhhgghgrnhhgsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-level <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Thomas Monjalon <thomas@monjalon.net>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 2:52 PM, 罗勇刚(Yonggang Luo) wrote:
> 
> 
> On Tue, Jan 12, 2021 at 5:23 PM Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
>>
>> > QEMU 5.2.x, an e300 based machine ppc603 are impacted.
>> > Here is my fix, narrowed down to  MSR_TGPR and  MSR_ILE
>> > ```
>> > From 42ce41671f1e6c4dd44e6fb481bbda9df09320bd Mon Sep 17 00:00:00 2001
>> > From: Yonggang Luo <luoyonggang@gmail.com <mailto:luoyonggang@gmail.com> <mailto:luoyonggang@gmail.com <mailto:luoyonggang@gmail.com>>>
>> > Date: Sun, 10 Jan 2021 00:08:00 -0800
>> > Subject: [PATCH] ppc: Fix rfi/rfid/hrfi/... emulation again
>> >
>> > This revert part mask bits for ppc603/ppc4x that disabled in  a2e71b28e832346409efc795ecd1f0a2bcb705a3.
>> > Remove redundant macro MSR_BOOK3S_MASK.
>> > Fixes boot VxWorks on e300
>> >
>> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com <mailto:luoyonggang@gmail.com> <mailto:luoyonggang@gmail.com <mailto:luoyonggang@gmail.com>>>
>> > ---
>> >  target/ppc/excp_helper.c | 5 +++--
>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> > index 1c48b9fdf6..df70c5a4e8 100644
>> > --- a/target/ppc/excp_helper.c
>> > +++ b/target/ppc/excp_helper.c
>> > @@ -1156,8 +1156,10 @@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>> >  {
>> >      CPUState *cs = env_cpu(env);
>> >  
>> > -    /* MSR:POW cannot be set by any form of rfi */
>> > +    /* MSR:POW,TGPR,ILE cannot be set by any form of rfi */
>> >      msr &= ~(1ULL << MSR_POW);
>> > +    msr &= ~(1ULL << MSR_TGPR);
>>
>> Indeed. The e300 user manual says that TGPR is cleared by rfi. We should
>> add a per-cpu family mask and not a global setting.
> Refer to https://www.nxp.com/docs/en/reference-manual/e300coreRM.pdf <https://www.nxp.com/docs/en/reference-manual/e300coreRM.pdf>
> 
> `Table 2-4. MSR Bit Settings`
> 
> ```
>   Temporary GPR remapping (implementation-specific) 0 Normal operation 1 TGPR mode. GPR0–GPR3 are remapped to TGPR0–TGPR3 for use by TLB miss routines. The contents of GPR0–GPR3 remain unchanged while MSR[TGPR] = 1. Attempts to use GPR4–GPR31 with MSR[TGPR] = 1 yield undefined results. Temporarily replaces TGPR0–TGPR3 with GPR0–GPR3 for use by TLB miss routines. The TGPR bit is set when either an instruction TLB miss, data read miss, or data write miss interrupt is taken. The TGPR bit is cleared by an rfi instruction.  
> ```
>   
>>
>> > +    msr &= ~(1ULL << MSR_ILE);
>>
>> that's curious. I am still trying to understand that part. May be this is
>> due to the lack of HID2 modeling which contains a "True little-endian" bit.
> 
> Don't understand this part, I am running VxWorks 6.9 on MPC8349EA
> https://www.nxp.com/docs/en/reference-manual/MPC8349EARM.pdf <https://www.nxp.com/docs/en/reference-manual/MPC8349EARM.pdf>
> 
> Didn't got any idea about why  MSR_ILE are set
> 
>>
>> Is your image Little endian ?
>>
> Big Endian vxworks image.


Can you share the image ? and the QEMU command line ?

Thanks,

C. 

