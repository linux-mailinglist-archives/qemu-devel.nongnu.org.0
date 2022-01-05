Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BB48512F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:34:29 +0100 (CET)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53ci-0000xD-S6
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:34:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Sa-0000Hg-HO
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:00 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:59631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53SY-0007TI-Ll
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:00 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M3lgL-1n5KZY1wjz-000s3W; Wed, 05 Jan 2022 11:23:51 +0100
Message-ID: <df922ec0-f469-b716-fec8-fb40421cb026@vivier.eu>
Date: Wed, 5 Jan 2022 11:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/7] linux-user/nios2: Fixes for signal frame setup
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p4KkH9YtLJIiaGhHtr2IswE4c9aU8n7G1eQ0A/wONyT/KNtAbyf
 51rIamX9TP1iPKDD/desWISF1+UcVrFzQ8QVUSgVgDJwl8Qz480WzTj4/CrIOEbQUpvjDju
 eUK91z0C7Cz0Ci3qvlg86ssEa8lo7cnsN6g6o/omdfHZ7NaMfO9LjnjWcAFdlw8MpZvqXye
 8HqIitddjLlEvmbDGTA/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+YxaQ8yibFs=:T5bt8PEOUs7fb7VPNQpCD4
 +iRr7T6FKsf/dTilaazyOxgAavLYrEzASEPtHTbtFZtqlpKZa0ap8u01JDevfAE5hPDYjOGel
 9xQncg5Jm9B8y1pxyJWr4Rx8uYyYjj//kMKbLTVztaFmdMgWn2Pj+dVvphzrc4TIep55BRdhN
 uM5RpRh5l4gMJJvgldv1dWlrwqQBLAN2szzZcfKFTCV3QIoKUYtBwYU4tPd7jGE8HpkSyOFUD
 DGYiRf2JJCGDTMndZ8p0Jcafhcx6IXy8DRWtvLDVfSkR2R+rC0Vvajglr/yIL/YotrNDib9NX
 aKMMRqcnUn2dmXb5CGyb4Gb4sH0SwC7s7oRr7KY0zKlIhuM0Xlk0U97iMHGsIx/ihts/kqJwa
 5xHJPG/e3411akS8g53Wfo6Cn7TqJdsHNGdLZw+jiOQosnijiklTeTGl6S8yHZyqmmphv1epq
 lfmjjqORsW5IsJeYfp1O2a6aS0+wjpLgjI4b9WNUatB+edGk3qiY4+zt4iePBfh/dkWWuaBQ8
 wUz1315FGrmkrOoyBkGBx9yGe10taQ6eaoI94AfUSnJr1kWh+1OF7lxHlfzrIdR7ndiPfGl79
 E5WwZwIPJytJp0h4+wd6EusEoBA71TZAnjbvVMVhUXUU6VA7BFbEmmhj1bYeCtAUPwlCvx433
 mOQHbgziFsAG0zoi2iSgBWQ+KNOZh/u7/F4vfUSWsLMBnlaE/AhGxkDjKT0f+mKESSLM=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> Do not confuse host and guest addresses.  Lock and unlock
> the target_rt_sigframe structure in setup_rt_sigframe.
> 
> Since rt_setup_ucontext always returns 0, drop the return
> value entirely.  This eliminates the only write to the err
> variable in setup_rt_sigframe.
> 
> Always copy the siginfo structure.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/nios2/signal.c | 49 ++++++++++++++++-----------------------
>   1 file changed, 20 insertions(+), 29 deletions(-)
> 
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index a77e8a40f4..adbffe32e3 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -42,7 +42,7 @@ struct target_rt_sigframe {
>       struct target_ucontext uc;
>   };
>   
> -static int rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
> +static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
>   {
>       unsigned long *gregs = uc->tuc_mcontext.gregs;
>   
> @@ -75,8 +75,6 @@ static int rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
>       __put_user(env->regs[R_GP], &gregs[25]);
>       __put_user(env->regs[R_EA], &gregs[27]);
>       __put_user(env->regs[R_SP], &gregs[28]);
> -
> -    return 0;
>   }
>   
>   static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
> @@ -135,8 +133,8 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
>       return 0;
>   }
>   
> -static void *get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
> -                          size_t frame_size)
> +static abi_ptr get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
> +                            size_t frame_size)
>   {
>       unsigned long usp;
>   
> @@ -144,7 +142,7 @@ static void *get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
>       usp = target_sigsp(get_sp_from_cpustate(env), ka);
>   
>       /* Verify, is it 32 or 64 bit aligned */
> -    return (void *)((usp - frame_size) & -8UL);
> +    return (usp - frame_size) & -8;
>   }
>   
>   void setup_rt_frame(int sig, struct target_sigaction *ka,
> @@ -153,26 +151,25 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>                       CPUNios2State *env)
>   {
>       struct target_rt_sigframe *frame;
> -    int i, err = 0;
> +    abi_ptr frame_addr;
> +    int i;
>   
> -    frame = get_sigframe(ka, env, sizeof(*frame));
> -
> -    if (ka->sa_flags & SA_SIGINFO) {
> -        tswap_siginfo(&frame->info, info);
> +    frame_addr = get_sigframe(ka, env, sizeof(*frame));
> +    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
> +        force_sigsegv(sig);
> +        return;
>       }
>   
> +    tswap_siginfo(&frame->info, info);
> +
>       /* Create the ucontext.  */
>       __put_user(0, &frame->uc.tuc_flags);
>       __put_user(0, &frame->uc.tuc_link);
>       target_save_altstack(&frame->uc.tuc_stack, env);
> -    err |= rt_setup_ucontext(&frame->uc, env);
> +    rt_setup_ucontext(&frame->uc, env);
>       for (i = 0; i < TARGET_NSIG_WORDS; i++) {
>           __put_user((abi_ulong)set->sig[i],
> -            (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
> -    }
> -
> -    if (err) {
> -        goto give_sigsegv;
> +                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
>       }
>   
>       /* Set up to return from userspace; jump to fixed address sigreturn
> @@ -180,19 +177,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       env->regs[R_RA] = (unsigned long) (0x1044);
>   
>       /* Set up registers for signal handler */
> -    env->regs[R_SP] = (unsigned long) frame;
> -    env->regs[4] = (unsigned long) sig;
> -    env->regs[5] = (unsigned long) &frame->info;
> -    env->regs[6] = (unsigned long) &frame->uc;
> -    env->regs[R_EA] = (unsigned long) ka->_sa_handler;
> -    return;
> +    env->regs[R_SP] = frame_addr;
> +    env->regs[4] = sig;
> +    env->regs[5] = frame_addr + offsetof(struct target_rt_sigframe, info);
> +    env->regs[6] = frame_addr + offsetof(struct target_rt_sigframe, uc);
> +    env->regs[R_EA] = ka->_sa_handler;
>   
> -give_sigsegv:
> -    if (sig == TARGET_SIGSEGV) {
> -        ka->_sa_handler = TARGET_SIG_DFL;
> -    }
> -    force_sigsegv(sig);
> -    return;
> +    unlock_user_struct(frame, frame_addr, 1);
>   }
>   
>   long do_sigreturn(CPUNios2State *env)


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

