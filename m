Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F52EE802
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:55:08 +0100 (CET)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdFK-0005sr-UN
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kxdEU-0005Dt-NX; Thu, 07 Jan 2021 16:54:14 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:47505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kxdES-00025n-9p; Thu, 07 Jan 2021 16:54:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DDCD779ACA30;
 Thu,  7 Jan 2021 22:54:06 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 7 Jan 2021
 22:54:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006a612f5fa-4629-47c8-9583-6cd833526e74,
 0E3940376814BA772487E0EA7B8E742872013C52) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: What's the correct way to implement rfi and related instruction.
To: <luoyonggang@gmail.com>, qemu-level <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, Thomas
 Monjalon <thomas@monjalon.net>, <agraf@suse.de>, Aurelien Jarno
 <aurelien@aurel32.net>
References: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
Date: Thu, 7 Jan 2021 22:54:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d9b18162-fc17-43e4-ba9e-850636e5e120
X-Ovh-Tracer-Id: 9438981871420214121
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdegfedgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeejtdffhefggfejgfdthfeivdfgueffgffgheduheekffeiteeuvdeghfefiedvnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehluhhohihonhhgghgrnhhgsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 8:14 PM, 罗勇刚(Yonggang Luo) wrote:
> This is the first patch,:
> It's store MSR bits differntly for different rfi instructions:
> [Qemu-devel] [PATCH] target-ppc: fix RFI by clearing some bits of MSR
> https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html <https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html>
> Comes from  target-ppc: fix RFI by clearing some bits of MSR
> SHA-1: c3d420ead1aee9fcfd12be11cbdf6b1620134773
>  target-ppc/op_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> ```
> diff --git a/target-ppc/op_helper.c b/target-ppc/op_helper.c
> index 8f2ee986bb..3c3aa60bc3 100644
> --- a/target-ppc/op_helper.c
> +++ b/target-ppc/op_helper.c
> @@ -1646,20 +1646,20 @@ static inline void do_rfi(target_ulong nip, target_ulong msr,
>  void helper_rfi (void)
>  {
>      do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> -           ~((target_ulong)0x0), 1);
> +           ~((target_ulong)0x783F0000), 1);
>  }
>  
>  #if defined(TARGET_PPC64)
>  void helper_rfid (void)
>  {
>      do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> -           ~((target_ulong)0x0), 0);
> +           ~((target_ulong)0x783F0000), 0);
>  }
>  
>  void helper_hrfid (void)
>  {
>      do_rfi(env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
> -           ~((target_ulong)0x0), 0);
> +           ~((target_ulong)0x783F0000), 0);
>  }
>  #endif
>  #endif
> ```
> 
> This is the second patch,:
> it's remove the parameter  `target_ulong msrm, int keep_msrh`
> Comes from ppc: Fix rfi/rfid/hrfi/... emulation
> SHA-1: a2e71b28e832346409efc795ecd1f0a2bcb705a3
> ```
>  target-ppc/excp_helper.c | 51 +++++++++++++++++++-----------------------------
>  1 file changed, 20 insertions(+), 31 deletions(-)
> 
> diff --git a/target-ppc/excp_helper.c b/target-ppc/excp_helper.c
> index 30e960e30b..aa0b63f4b0 100644
> --- a/target-ppc/excp_helper.c
> +++ b/target-ppc/excp_helper.c
> @@ -922,25 +922,20 @@ void helper_store_msr(CPUPPCState *env, target_ulong val)
>      }
>  }
>  
> -static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr,
> -                          target_ulong msrm, int keep_msrh)
> +static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>  {
>      CPUState *cs = CPU(ppc_env_get_cpu(env));
>  
> +    /* MSR:POW cannot be set by any form of rfi */
> +    msr &= ~(1ULL << MSR_POW);
> +
>  #if defined(TARGET_PPC64)
> -    if (msr_is_64bit(env, msr)) {
> -        nip = (uint64_t)nip;
> -        msr &= (uint64_t)msrm;
> -    } else {
> +    /* Switching to 32-bit ? Crop the nip */
> +    if (!msr_is_64bit(env, msr)) {
>          nip = (uint32_t)nip;
> -        msr = (uint32_t)(msr & msrm);
> -        if (keep_msrh) {
> -            msr |= env->msr & ~((uint64_t)0xFFFFFFFF);
> -        }
>      }
>  #else
>      nip = (uint32_t)nip;
> -    msr &= (uint32_t)msrm;
>  #endif
>      /* XXX: beware: this is false if VLE is supported */
>      env->nip = nip & ~((target_ulong)0x00000003);
> @@ -959,26 +954,24 @@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr,
>  
>  void helper_rfi(CPUPPCState *env)
>  {
> -    if (env->excp_model == POWERPC_EXCP_BOOKE) {
> -        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> -               ~((target_ulong)0), 0);
> -    } else {
> -        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> -               ~((target_ulong)0x783F0000), 1);
> -    }
> +    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
>  }
>  
> +#define MSR_BOOK3S_MASK
>  #if defined(TARGET_PPC64)
>  void helper_rfid(CPUPPCState *env)
>  {
> -    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> -           ~((target_ulong)0x783F0000), 0);
> +    /* The architeture defines a number of rules for which bits
> +     * can change but in practice, we handle this in hreg_store_msr()
> +     * which will be called by do_rfi(), so there is no need to filter
> +     * here
> +     */
> +    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1]);
>  }
>  
>  void helper_hrfid(CPUPPCState *env)
>  {
> -    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
> -           ~((target_ulong)0x783F0000), 0);
> +    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
>  }
>  #endif
>  
> @@ -986,28 +979,24 @@ void helper_hrfid(CPUPPCState *env)
>  /* Embedded PowerPC specific helpers */
>  void helper_40x_rfci(CPUPPCState *env)
>  {
> -    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3],
> -           ~((target_ulong)0xFFFF0000), 0);
> +    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3]);
>  }
>  
>  void helper_rfci(CPUPPCState *env)
>  {
> -    do_rfi(env, env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1],
> -           ~((target_ulong)0), 0);
> +    do_rfi(env, env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1]);
>  }
>  
>  void helper_rfdi(CPUPPCState *env)
>  {
>      /* FIXME: choose CSRR1 or DSRR1 based on cpu type */
> -    do_rfi(env, env->spr[SPR_BOOKE_DSRR0], env->spr[SPR_BOOKE_DSRR1],
> -           ~((target_ulong)0), 0);
> +    do_rfi(env, env->spr[SPR_BOOKE_DSRR0], env->spr[SPR_BOOKE_DSRR1]);
>  }
>  
>  void helper_rfmci(CPUPPCState *env)
>  {
>      /* FIXME: choose CSRR1 or MCSRR1 based on cpu type */
> -    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1],
> -           ~((target_ulong)0), 0);
> +    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1]);
>  }
>  #endif
>  
> @@ -1045,7 +1034,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
>  
>  void helper_rfsvc(CPUPPCState *env)
>  {
> -    do_rfi(env, env->lr, env->ctr, 0x0000FFFF, 0);
> +    do_rfi(env, env->lr, env->ctr & 0x0000FFFF);
>  }
>  
>  /* Embedded.Processor Control */
> ```
> 
> And of cause, the second patch fixes some problem, but also cause new problem, 
> how to implement these instruction properly?

What are the new problems  ? 

C.

> 
> 
> 
> --
>          此致
> 礼
> 罗勇刚
> Yours
>     sincerely,
> Yonggang Luo


