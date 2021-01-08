Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182872EF05C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 11:03:35 +0100 (CET)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxocH-000609-Ke
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 05:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kxobV-0005Vb-8K
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:02:45 -0500
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:44402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kxobR-00016Z-SB
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:02:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 29DAB25322E;
 Fri,  8 Jan 2021 11:02:37 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 8 Jan 2021
 11:02:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001cb8c4923-4c5f-4027-856d-4c4d062e438e,
 4B30ABD194C75D8A324D43CE175BC731D3728792) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: What's the correct way to implement rfi and related instruction.
To: <luoyonggang@gmail.com>
References: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
 <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
 <CAE2XoE-Fc3Tc51uiDN70_6suHPwczdp9EcS_LirLK-txzgS+yw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ef0eb70c-5b56-9850-2ad3-f12591cd6b4b@kaod.org>
Date: Fri, 8 Jan 2021 11:02:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-Fc3Tc51uiDN70_6suHPwczdp9EcS_LirLK-txzgS+yw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2f8bccb2-270b-481c-8fa3-0272539bcc2a
X-Ovh-Tracer-Id: 3295509028327033638
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeejtdffhefggfejgfdthfeivdfgueffgffgheduheekffeiteeuvdeghfefiedvnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhuohihohhnghhgrghnghesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Monjalon <thomas@monjalon.net>, qemu-ppc@nongnu.org,
 qemu-level <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 5:21 AM, 罗勇刚(Yonggang Luo) wrote:
> 
> 
> On Fri, Jan 8, 2021 at 5:54 AM Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
>>
>> On 1/7/21 8:14 PM, 罗勇刚(Yonggang Luo) wrote:
>> > This is the first patch,:
>> > It's store MSR bits differntly for different rfi instructions:
>> > [Qemu-devel] [PATCH] target-ppc: fix RFI by clearing some bits of MSR
>> > https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html <https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html> <https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html <https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html>>
>> > Comes from  target-ppc: fix RFI by clearing some bits of MSR
>> > SHA-1: c3d420ead1aee9fcfd12be11cbdf6b1620134773
>> >  target-ppc/op_helper.c | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> > ```
>> > diff --git a/target-ppc/op_helper.c b/target-ppc/op_helper.c
>> > index 8f2ee986bb..3c3aa60bc3 100644
>> > --- a/target-ppc/op_helper.c
>> > +++ b/target-ppc/op_helper.c
>> > @@ -1646,20 +1646,20 @@ static inline void do_rfi(target_ulong nip, target_ulong msr,
>> >  void helper_rfi (void)
>> >  {
>> >      do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
>> > -           ~((target_ulong)0x0), 1);
>> > +           ~((target_ulong)0x783F0000), 1);
>> >  }
>> >  
>> >  #if defined(TARGET_PPC64)
>> >  void helper_rfid (void)
>> >  {
>> >      do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
>> > -           ~((target_ulong)0x0), 0);
>> > +           ~((target_ulong)0x783F0000), 0);
>> >  }
>> >  
>> >  void helper_hrfid (void)
>> >  {
>> >      do_rfi(env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
>> > -           ~((target_ulong)0x0), 0);
>> > +           ~((target_ulong)0x783F0000), 0);
>> >  }
>> >  #endif
>> >  #endif
>> > ```
>> >
>> > This is the second patch,:
>> > it's remove the parameter  `target_ulong msrm, int keep_msrh`
>> > Comes from ppc: Fix rfi/rfid/hrfi/... emulation
>> > SHA-1: a2e71b28e832346409efc795ecd1f0a2bcb705a3
>> > ```
>> >  target-ppc/excp_helper.c | 51 +++++++++++++++++++-----------------------------
>> >  1 file changed, 20 insertions(+), 31 deletions(-)
>> >
>> > diff --git a/target-ppc/excp_helper.c b/target-ppc/excp_helper.c
>> > index 30e960e30b..aa0b63f4b0 100644
>> > --- a/target-ppc/excp_helper.c
>> > +++ b/target-ppc/excp_helper.c
>> > @@ -922,25 +922,20 @@ void helper_store_msr(CPUPPCState *env, target_ulong val)
>> >      }
>> >  }
>> >  
>> > -static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr,
>> > -                          target_ulong msrm, int keep_msrh)
>> > +static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>> >  {
>> >      CPUState *cs = CPU(ppc_env_get_cpu(env));
>> >  
>> > +    /* MSR:POW cannot be set by any form of rfi */
>> > +    msr &= ~(1ULL << MSR_POW);
>> > +
>> >  #if defined(TARGET_PPC64)
>> > -    if (msr_is_64bit(env, msr)) {
>> > -        nip = (uint64_t)nip;
>> > -        msr &= (uint64_t)msrm;
>> > -    } else {
>> > +    /* Switching to 32-bit ? Crop the nip */
>> > +    if (!msr_is_64bit(env, msr)) {
>> >          nip = (uint32_t)nip;
>> > -        msr = (uint32_t)(msr & msrm);
>> > -        if (keep_msrh) {
>> > -            msr |= env->msr & ~((uint64_t)0xFFFFFFFF);
>> > -        }
>> >      }
>> >  #else
>> >      nip = (uint32_t)nip;
>> > -    msr &= (uint32_t)msrm;
>> >  #endif
>> >      /* XXX: beware: this is false if VLE is supported */
>> >      env->nip = nip & ~((target_ulong)0x00000003);
>> > @@ -959,26 +954,24 @@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr,
>> >  
>> >  void helper_rfi(CPUPPCState *env)
>> >  {
>> > -    if (env->excp_model == POWERPC_EXCP_BOOKE) {
>> > -        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
>> > -               ~((target_ulong)0), 0);
>> > -    } else {
>> > -        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
>> > -               ~((target_ulong)0x783F0000), 1);
>> > -    }
>> > +    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
>> >  }
>> >  
>> > +#define MSR_BOOK3S_MASK
>> >  #if defined(TARGET_PPC64)
>> >  void helper_rfid(CPUPPCState *env)
>> >  {
>> > -    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
>> > -           ~((target_ulong)0x783F0000), 0);
>> > +    /* The architeture defines a number of rules for which bits
>> > +     * can change but in practice, we handle this in hreg_store_msr()
>> > +     * which will be called by do_rfi(), so there is no need to filter
>> > +     * here
>> > +     */
>> > +    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1]);
>> >  }
>> >  
>> >  void helper_hrfid(CPUPPCState *env)
>> >  {
>> > -    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
>> > -           ~((target_ulong)0x783F0000), 0);
>> > +    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
>> >  }
>> >  #endif
>> >  
>> > @@ -986,28 +979,24 @@ void helper_hrfid(CPUPPCState *env)
>> >  /* Embedded PowerPC specific helpers */
>> >  void helper_40x_rfci(CPUPPCState *env)
>> >  {
>> > -    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3],
>> > -           ~((target_ulong)0xFFFF0000), 0);
>> > +    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3]);
>> >  }
>> >  
>> >  void helper_rfci(CPUPPCState *env)
>> >  {
>> > -    do_rfi(env, env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1],
>> > -           ~((target_ulong)0), 0);
>> > +    do_rfi(env, env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1]);
>> >  }
>> >  
>> >  void helper_rfdi(CPUPPCState *env)
>> >  {
>> >      /* FIXME: choose CSRR1 or DSRR1 based on cpu type */
>> > -    do_rfi(env, env->spr[SPR_BOOKE_DSRR0], env->spr[SPR_BOOKE_DSRR1],
>> > -           ~((target_ulong)0), 0);
>> > +    do_rfi(env, env->spr[SPR_BOOKE_DSRR0], env->spr[SPR_BOOKE_DSRR1]);
>> >  }
>> >  
>> >  void helper_rfmci(CPUPPCState *env)
>> >  {
>> >      /* FIXME: choose CSRR1 or MCSRR1 based on cpu type */
>> > -    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1],
>> > -           ~((target_ulong)0), 0);
>> > +    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1]);
>> >  }
>> >  #endif
>> >  
>> > @@ -1045,7 +1034,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
>> >  
>> >  void helper_rfsvc(CPUPPCState *env)
>> >  {
>> > -    do_rfi(env, env->lr, env->ctr, 0x0000FFFF, 0);
>> > +    do_rfi(env, env->lr, env->ctr & 0x0000FFFF);
>> >  }
>> >  
>> >  /* Embedded.Processor Control */
>> > ```
>> >
>> > And of cause, the second patch fixes some problem, but also cause new problem,
>> > how to implement these instruction properly?
>>
>> What are the new problems  ?
>
>
> Before this patch, VxWorks can working, but after this, VxWorks can not boot anymore.

I suppose you did a bisect to reach this patch. 

Which QEMU machine is impacted ? Which CPU ? What are the symptoms ? 

Did you try to run with -d exec or -d in_asm to identify the exact
instruction ? 

From there, you could try to revert partially the patch above to 
fix the problem. 

Thanks,

C.




