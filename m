Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1945C33CF79
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:15:35 +0100 (CET)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4rW-0004yV-2m
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4oX-000195-0Q
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:12:29 -0400
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4oU-0007Ik-SM
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:12:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id DC36D2505EB;
 Tue, 16 Mar 2021 09:12:23 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Mar
 2021 09:12:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003560f0903-1a1b-4714-8f58-105a98ecec48,
 F4745E3E32A08DF6AE8813652EB4480BB0CFD8A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 02/17] target/ppc: Move 601 hflags adjustment to
 hreg_compute_hflags
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b71e0994-ea56-6a84-5274-9a7c6c390b79@kaod.org>
Date: Tue, 16 Mar 2021 09:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210315184615.1985590-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 17204e2e-079a-4dc7-80b0-052647b81fa2
X-Ovh-Tracer-Id: 7522981704474594272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 7:46 PM, Richard Henderson wrote:
> Keep all hflags computation in one place, as this will be
> especially important later.
> 
> Introduce a new POWERPC_FLAG_HID0_LE bit to indicate when
> LE should be taken from HID0.  This appears to be set if
> and only if POWERPC_FLAG_RTC_CLK is set, but we're not
> short of bits and having both names will avoid confusion.
> 
> Note that this was the only user of hflags_nmsr, so we can
> perform a straight assignment rather than mask and set.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
> ---
>  target/ppc/cpu.h                |  2 ++
>  target/ppc/helper_regs.c        | 13 +++++++++++--
>  target/ppc/misc_helper.c        |  8 +++-----
>  target/ppc/translate_init.c.inc |  4 ++--
>  4 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e73416da68..061d2eed1b 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -581,6 +581,8 @@ enum {
>      POWERPC_FLAG_TM       = 0x00100000,
>      /* Has SCV (ISA 3.00)                                                    */
>      POWERPC_FLAG_SCV      = 0x00200000,
> +    /* Has HID0 for LE bit (601)                                             */
> +    POWERPC_FLAG_HID0_LE  = 0x00400000,
>  };
>  
>  /*****************************************************************************/
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 5e18232b84..95b9aca61f 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -96,8 +96,17 @@ void hreg_compute_hflags(CPUPPCState *env)
>      hflags_mask |= (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
>      hreg_compute_mem_idx(env);
>      env->hflags = env->msr & hflags_mask;
> -    /* Merge with hflags coming from other registers */
> -    env->hflags |= env->hflags_nmsr;
> +
> +    if (env->flags & POWERPC_FLAG_HID0_LE) {
> +        /*
> +         * Note that MSR_LE is not set in env->msr_mask for this cpu,
> +         * and so will never be set in msr or hflags at this point.
> +         */
> +        uint32_t le = extract32(env->spr[SPR_HID0], 3, 1);
> +        env->hflags |= le << MSR_LE;
> +        /* Retain for backward compatibility with migration. */
> +        env->hflags_nmsr = le << MSR_LE;
> +    }
>  }
>  
>  void cpu_interrupt_exittb(CPUState *cs)
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index 5d6e0de396..63e3147eb4 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -194,16 +194,14 @@ void helper_store_hid0_601(CPUPPCState *env, target_ulong val)
>      target_ulong hid0;
>  
>      hid0 = env->spr[SPR_HID0];
> +    env->spr[SPR_HID0] = (uint32_t)val;
> +
>      if ((val ^ hid0) & 0x00000008) {
>          /* Change current endianness */
> -        env->hflags &= ~(1 << MSR_LE);
> -        env->hflags_nmsr &= ~(1 << MSR_LE);
> -        env->hflags_nmsr |= (1 << MSR_LE) & (((val >> 3) & 1) << MSR_LE);
> -        env->hflags |= env->hflags_nmsr;
> +        hreg_compute_hflags(env);
>          qemu_log("%s: set endianness to %c => " TARGET_FMT_lx "\n", __func__,
>                   val & 0x8 ? 'l' : 'b', env->hflags);
>      }
> -    env->spr[SPR_HID0] = (uint32_t)val;
>  }
>  
>  void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong value)
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index c03a7c4f52..049d76cfd1 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -5441,7 +5441,7 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
>      pcc->excp_model = POWERPC_EXCP_601;
>      pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach = bfd_mach_ppc_601;
> -    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK;
> +    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
>  }
>  
>  #define POWERPC_MSRR_601v    (0x0000000000001040ULL)
> @@ -5485,7 +5485,7 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
>  #endif
>      pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach = bfd_mach_ppc_601;
> -    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK;
> +    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
>  }
>  
>  static void init_proc_602(CPUPPCState *env)
> 


