Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B065041BFC4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 09:20:03 +0200 (CEST)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVTso-0005ez-QS
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 03:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVTqr-0004Kf-K4
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 03:18:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57098
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVTqp-0004kI-81
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 03:18:00 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVTqb-0003re-Dt; Wed, 29 Sep 2021 08:17:49 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210928020039.184412-1-richard.henderson@linaro.org>
 <20210928020039.184412-24-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <066b5a08-ea92-58e2-5c64-f3c536c110af@ilande.co.uk>
Date: Wed, 29 Sep 2021 08:17:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928020039.184412-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 23/25] linux-user/sparc: Implement setup_sigtramp
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/09/2021 03:00, Richard Henderson wrote:

> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sparc/target_signal.h |  4 ++++
>   linux-user/sparc/signal.c        | 40 +++++++++++++++++++++-----------
>   2 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
> index 34f9a12519..e661ddd6ab 100644
> --- a/linux-user/sparc/target_signal.h
> +++ b/linux-user/sparc/target_signal.h
> @@ -69,6 +69,10 @@ typedef struct target_sigaltstack {
>   
>   #ifdef TARGET_ABI32
>   #define TARGET_ARCH_HAS_SETUP_FRAME
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> +#else
> +/* For sparc64, use of KA_RESTORER is mandatory. */
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
>   #endif
>   
>   /* bit-flags */
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index 3bc023d281..23e1e761de 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -242,6 +242,12 @@ static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
>   }
>   
>   #ifdef TARGET_ARCH_HAS_SETUP_FRAME
> +static void install_sigtramp(uint32_t *tramp, int syscall)
> +{
> +    __put_user(0x82102000u + syscall, &tramp[0]); /* mov syscall, %g1 */
> +    __put_user(0x91d02010u, &tramp[1]);           /* t 0x10 */
> +}
> +
>   void setup_frame(int sig, struct target_sigaction *ka,
>                    target_sigset_t *set, CPUSPARCState *env)
>   {
> @@ -291,13 +297,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
>       if (ka->ka_restorer) {
>           env->regwptr[WREG_O7] = ka->ka_restorer;
>       } else {
> -        env->regwptr[WREG_O7] = sf_addr +
> -                offsetof(struct target_signal_frame, insns) - 2 * 4;
> -
> -        /* mov __NR_sigreturn, %g1 */
> -        __put_user(0x821020d8u, &sf->insns[0]);
> -        /* t 0x10 */
> -        __put_user(0x91d02010u, &sf->insns[1]);
> +        /* Not used, but retain for ABI compatibility. */
> +        install_sigtramp(sf->insns, TARGET_NR_sigreturn);
> +        env->regwptr[WREG_O7] = default_sigreturn;
>       }
>       unlock_user(sf, sf_addr, sf_size);
>   }
> @@ -358,13 +360,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       if (ka->ka_restorer) {
>           env->regwptr[WREG_O7] = ka->ka_restorer;
>       } else {
> -        env->regwptr[WREG_O7] =
> -            sf_addr + offsetof(struct target_rt_signal_frame, insns) - 2 * 4;
> -
> -        /* mov __NR_rt_sigreturn, %g1 */
> -        __put_user(0x82102065u, &sf->insns[0]);
> -        /* t 0x10 */
> -        __put_user(0x91d02010u, &sf->insns[1]);
> +        /* Not used, but retain for ABI compatibility. */
> +        install_sigtramp(sf->insns, TARGET_NR_rt_sigreturn);
> +        env->regwptr[WREG_O7] = default_rt_sigreturn;
>       }
>   #else
>       env->regwptr[WREG_O7] = ka->ka_restorer;
> @@ -775,4 +773,18 @@ do_sigsegv:
>       unlock_user_struct(ucp, ucp_addr, 1);
>       force_sig(TARGET_SIGSEGV);
>   }
> +#else
> +void setup_sigtramp(abi_ulong sigtramp_page)
> +{
> +    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
> +    assert(tramp != NULL);
> +
> +    default_sigreturn = sigtramp_page;
> +    install_sigtramp(tramp, TARGET_NR_sigreturn);
> +
> +    default_rt_sigreturn = sigtramp_page + 8;
> +    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
> +
> +    unlock_user(tramp, sigtramp_page, 2 * 8);
> +}
>   #endif

This is certainly outside of my knowledge domain, however if it works in your tests 
then happy to give:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

