Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC045AD65
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 21:28:05 +0100 (CET)
Received: from localhost ([::1]:46578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpcOZ-0007xR-KC
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 15:28:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mpcMm-0006Bw-Kd; Tue, 23 Nov 2021 15:26:14 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:33241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mpcMi-00025k-SS; Tue, 23 Nov 2021 15:26:12 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CB55D1BF205;
 Tue, 23 Nov 2021 20:26:01 +0000 (UTC)
Message-ID: <2c310930-5a29-791a-dc42-fd649081c1d9@tribudubois.net>
Date: Tue, 23 Nov 2021 21:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH for-6.2] Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211119163419.557623-1-peter.maydell@linaro.org>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
In-Reply-To: <20211119163419.557623-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.201; envelope-from=jcd@tribudubois.net;
 helo=relay8-d.mail.gandi.net
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.515,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/11/2021 à 17:34, Peter Maydell a écrit :
> This reverts commit 9fcd15b9193e819b6cc2fd0a45e3506148812bb4.
>
> This change turns out to cause regressions, for instance on the
> imx6ul boards as described here:
> https://lore.kernel.org/qemu-devel/c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net/
>
> The primary cause of that regression is that the guest code running
> at EL3 expects SMCs (not related to PSCI) to do what they would if
> our PSCI emulation was not present at all, but after this change
> they instead set a value in R0/X0 and continue.
>
> We could fix that by a refactoring that allowed us to only turn on
> the PSCI emulation if we weren't booting the guest at EL3, but there
> is a more tangled problem with the highbank board, which:
>   (1) wants to enable PSCI emulation
>   (2) has a bit of guest code that it wants to run at EL3 and
>       to perform SMC calls that trap to the monitor vector table:
>       this is the boot stub code that is written to memory by
>       arm_write_secure_board_setup_dummy_smc() and which the
>       highbank board enables by setting bootinfo->secure_board_setup
>
> We can't satisfy both of those and also have the PSCI emulation
> handle all SMC instruction executions regardless of function
> identifier value.
>
> This is too tricky to try to sort out before 6.2 is released;
> revert this commit so we can take the time to get it right in
> the 7.0 release.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Jean-Christophe: could you confirm that reverting this fixes the
> regressions you had on the imx boards ?

Hello Peter,

With this patch, things are back to "normal".

Thanks.

JC

>
>   target/arm/psci.c | 35 +++++++++++++++++++++++++++++------
>   1 file changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/psci.c b/target/arm/psci.c
> index b279c0b9a45..6709e280133 100644
> --- a/target/arm/psci.c
> +++ b/target/arm/psci.c
> @@ -27,13 +27,15 @@
>   
>   bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
>   {
> -    /*
> -     * Return true if the exception type matches the configured PSCI conduit.
> -     * This is called before the SMC/HVC instruction is executed, to decide
> -     * whether we should treat it as a PSCI call or with the architecturally
> +    /* Return true if the r0/x0 value indicates a PSCI call and
> +     * the exception type matches the configured PSCI conduit. This is
> +     * called before the SMC/HVC instruction is executed, to decide whether
> +     * we should treat it as a PSCI call or with the architecturally
>        * defined behaviour for an SMC or HVC (which might be UNDEF or trap
>        * to EL2 or to EL3).
>        */
> +    CPUARMState *env = &cpu->env;
> +    uint64_t param = is_a64(env) ? env->xregs[0] : env->regs[0];
>   
>       switch (excp_type) {
>       case EXCP_HVC:
> @@ -50,7 +52,27 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
>           return false;
>       }
>   
> -    return true;
> +    switch (param) {
> +    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
> +    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
> +    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
> +    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
> +    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
> +    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
> +    case QEMU_PSCI_0_1_FN_CPU_ON:
> +    case QEMU_PSCI_0_2_FN_CPU_ON:
> +    case QEMU_PSCI_0_2_FN64_CPU_ON:
> +    case QEMU_PSCI_0_1_FN_CPU_OFF:
> +    case QEMU_PSCI_0_2_FN_CPU_OFF:
> +    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
> +    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
> +    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
> +    case QEMU_PSCI_0_1_FN_MIGRATE:
> +    case QEMU_PSCI_0_2_FN_MIGRATE:
> +        return true;
> +    default:
> +        return false;
> +    }
>   }
>   
>   void arm_handle_psci_call(ARMCPU *cpu)
> @@ -172,9 +194,10 @@ void arm_handle_psci_call(ARMCPU *cpu)
>           break;
>       case QEMU_PSCI_0_1_FN_MIGRATE:
>       case QEMU_PSCI_0_2_FN_MIGRATE:
> -    default:
>           ret = QEMU_PSCI_RET_NOT_SUPPORTED;
>           break;
> +    default:
> +        g_assert_not_reached();
>       }
>   
>   err:



