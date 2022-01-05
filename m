Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41D485154
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:44:47 +0100 (CET)
Received: from localhost ([::1]:56986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53mf-0007ix-U2
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53T1-0000RM-Gk
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:27 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:33025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Sx-0007Vb-Ev
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:27 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMnnm-1mmI7t2PC8-00ImvX; Wed, 05 Jan 2022 11:24:21 +0100
Message-ID: <0684f756-e69a-6a23-068f-5cf29730e6c2@vivier.eu>
Date: Wed, 5 Jan 2022 11:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/7] linux-user/nios2: Fix EA vs PC confusion
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-6-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UgYT/ucKVmD3bJWsMCKEKLsfN0TvMcenLcGT2genxI4Za3W2JZ8
 jUx5ZR9Y54+7IN7elJ0Xco7HSTQr5g6VaKOgMfxEPD07qIGxn1geLdGte6UW8HoGP7O6J7m
 O+usxw1H5L5nfbVA/3kQcAzpWiodvkbAkF76dnjA2LmRzRszOj9vtEacC3bcGiqnA6RGaxw
 Jp1cYBJ5cf22BVdCtBxjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dVpFCTFsbB8=:WhMh3kP5OFHEq0ZGtV/g3p
 wweTtjbL5iKiRfaNyUOJ13PSLKcqZQ4FHdXg7xTXhsujNZ6pZH2OvSoqLk2lJ3ePXlHZ2xvmI
 paXepVGX0RvurE5BHrsOqr80wkRolE6VE+1VarnLRZTExUcFxc+IA+s3RPtvyT8+N07uJWO7p
 Wudlipxg4aWnywRgx0D3aG6ETSdX1GpwuadtqNxc8WLYZI/+qn+COMihYMs3z6QVhwfquD3z5
 fux8h18ZtnO/HcBwONm5KTFz1cW/5zX/BPJezxmlZorwVbP7GOSDTCOG9anNGeJAR94+U3+SF
 c+Qz8OgdmGKAgRMSN/Z653+UJI7Yq9nmggmV5eQ4aMo3UK/2FjViLFMz/9NIZFCFprPW41mXd
 cagS0vFbgVhobTao47HE+j/oE360rwWaYghPwsudAbs1Cb7lqed0Gt8Ht6N5LF1P5bUQcPbta
 gj3A68dJAH5bJGGGpgTwdPWyV4bfPRDmMEQ05WNk1aLgwDWB+HKY8jxjC/6lHn5kMiDp6j4mJ
 xQXypNOmvzjfARtBNyz0ErvYBdeWL4Guu/mUyoGWgYy6/7rnnSAFN2Jipzn09pdKgklgXMgvA
 ff26RQd98XkKD1HZxexHJGJ+ydU8MCu0sjVhHSay/FzS2c9nLl7skwO3RTXYv2pA2iEDZ0Stg
 +f5vTNJqyfmuvKBqlXcG2ZBPQhl0YJ0o1pCvshA1jqoQIlr3EG7fA4iOeCawO2MPPETw=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> The real kernel will talk about the user PC as EA,
> because that's where the hardware will have copied it,
> and where it expects to put it to then use ERET.
> But qemu does not emulate all of the exception stuff
> while emulating user-only.  Manipulate PC directly.
> 
> This fixes signal entry and return, and eliminates
> some slight confusion from target_cpu_copy_regs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/nios2/cpu_loop.c | 5 +----
>   linux-user/nios2/signal.c   | 6 +++---
>   2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index de0fc63e21..1e93ef34e6 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -155,9 +155,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>       env->regs[R_SP] = regs->sp;
>       env->regs[R_GP] = regs->gp;
>       env->regs[CR_ESTATUS] = regs->estatus;
> -    env->regs[R_EA] = regs->ea;
> -    /* TODO: unsigned long  orig_r7; */
> -
> -    /* Emulate eret when starting thread. */
>       env->regs[R_PC] = regs->ea;
> +    /* TODO: unsigned long  orig_r7; */
>   }
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index adbffe32e3..20b65aa06e 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -73,7 +73,7 @@ static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
>       __put_user(env->regs[R_RA], &gregs[23]);
>       __put_user(env->regs[R_FP], &gregs[24]);
>       __put_user(env->regs[R_GP], &gregs[25]);
> -    __put_user(env->regs[R_EA], &gregs[27]);
> +    __put_user(env->regs[R_PC], &gregs[27]);
>       __put_user(env->regs[R_SP], &gregs[28]);
>   }
>   
> @@ -122,7 +122,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
>       __get_user(env->regs[R_GP], &gregs[25]);
>       /* Not really necessary no user settable bits */
>       __get_user(temp, &gregs[26]);
> -    __get_user(env->regs[R_EA], &gregs[27]);
> +    __get_user(env->regs[R_PC], &gregs[27]);
>   
>       __get_user(env->regs[R_RA], &gregs[23]);
>       __get_user(env->regs[R_SP], &gregs[28]);
> @@ -181,7 +181,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       env->regs[4] = sig;
>       env->regs[5] = frame_addr + offsetof(struct target_rt_sigframe, info);
>       env->regs[6] = frame_addr + offsetof(struct target_rt_sigframe, uc);
> -    env->regs[R_EA] = ka->_sa_handler;
> +    env->regs[R_PC] = ka->_sa_handler;
>   
>       unlock_user_struct(frame, frame_addr, 1);
>   }

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


