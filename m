Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0387E2AD00F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 07:55:12 +0100 (CET)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcNYd-00006k-3W
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 01:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcNXS-0007jO-Gp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:53:58 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:59741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcNXN-0007WS-8O
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:53:56 -0500
Received: from [192.168.100.1] ([82.252.154.198]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MRSdf-1kzoCZ2EwX-00NNwg; Tue, 10 Nov 2020 07:53:50 +0100
Subject: Re: [PATCH for-5.2 2/3] linux-user/sparc: Correct set/get_context
 handling of fp and i7
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201105212314.9628-1-peter.maydell@linaro.org>
 <20201105212314.9628-3-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c60ef6af-2456-e5a0-e793-3f0ff30d357a@vivier.eu>
Date: Tue, 10 Nov 2020 07:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105212314.9628-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bcbrye/b6BDl1kZBxjIur4O/A4nhTFk/3bMADEBBOxr7YKjeaNx
 tOjKQESYjvzrmt0txqgQFGvhcMlcWLnvbf4J8U5ZSc1gXobVpit0ADhBqrFdBRTUfc8WaYr
 Aen/+ZIDc9Lg/xeZN7T4lUDEO6PRWDqKE1Z/X7K/Ax1/XbjHYXoWn/CESdS0/3XZPd9E0WM
 y+ofXmB87251+wpCDxE8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:crJ66xQf9rM=:M645J5PQwd2TdQWu4ePAyD
 hYrBxJIfGtwJpvY44usxGuGiEbSfCqtn51YDbCYgd/cZ52ppxYCTuOf2e98mGfm7oewYNT5R3
 hikmiLZ5YbJYfPgjWduNyOBpVDpR7BTpIu44iVZTy0LuXH7R4OlhBtlzftOl1Gyw6FiAgrfBV
 3JMd2HPG3AVLApjyezN+jTj1ZYr+vkOcG42bL7oKwOy/eKMfnI+33FprViYBSlXqyQB8HAisk
 OnV7Db6hjQI9l2fxYkAaqRE6SO4PmOHCau66XljvFzo2Rf1SttZMZ3PPPV4S0MFb07DGyirYv
 rj1A0bWj1OKaO8qJkXdrAmAnKixSWHlMhl8Ko6pzXDCtcAdxUHWpVKGru6HSML+2dJ4fLfKqR
 fJW5i/93cCm6qcTKEOK77984v4tYABZkBgAXY21DJCFyFH4OXTwHMgsyqzu844xIBvEw97ZsY
 OsS1/FfyUA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:53:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/11/2020 à 22:23, Peter Maydell a écrit :
> Because QEMU's user-mode emulation just directly accesses guest CPU
> state, for SPARC the guest register window state is not the same in
> the sparc64_get_context() and sparc64_set_context() functions as it
> is for the real kernel's versions of those functions.  Specifically,
> for the kernel it has saved the user space state such that the O*
> registers go into a pt_regs struct as UREG_I*, and the I* registers
> have been spilled onto the userspace stack.  For QEMU, we haven't
> done that, so the guest's O* registers are still in WREG_O* and the
> I* registers in WREG_I*.
> 
> The code was already accessing the O* registers correctly for QEMU,
> but had copied the kernel code for accessing the I* registers off the
> userspace stack.  Replace this with direct accesses to fp and i7 in
> the CPU state, and add a comment explaining why we differ from the
> kernel code here.
> 
> This fix is sufficient to get bash to a shell prompt.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm really pretty unsure about our handling of SPARC register
> windows here. This fix works, but should we instead be
> ensuring that the flush_windows() call cpu_loop() does
> before handling this trap has written the I* regs to the
> stack ???
> ---
>  linux-user/sparc/signal.c | 47 ++++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 25 deletions(-)
> 
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index 57ea1593bfc..c315704b389 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -403,7 +403,6 @@ void sparc64_set_context(CPUSPARCState *env)
>      struct target_ucontext *ucp;
>      target_mc_gregset_t *grp;
>      abi_ulong pc, npc, tstate;
> -    abi_ulong fp, i7, w_addr;
>      unsigned int i;
>  
>      ucp_addr = env->regwptr[WREG_O0];
> @@ -447,6 +446,15 @@ void sparc64_set_context(CPUSPARCState *env)
>      __get_user(env->gregs[5], (&(*grp)[SPARC_MC_G5]));
>      __get_user(env->gregs[6], (&(*grp)[SPARC_MC_G6]));
>      __get_user(env->gregs[7], (&(*grp)[SPARC_MC_G7]));
> +
> +    /*
> +     * Note that unlike the kernel, we didn't need to mess with the
> +     * guest register window state to save it into a pt_regs to run
> +     * the kernel. So for us the guest's O regs are still in WREG_O*
> +     * (unlike the kernel which has put them in UREG_I* in a pt_regs)
> +     * and the fp and i7 are still in WREG_I6 and WREG_I7 and don't
> +     * need to be written back to userspace memory.
> +     */
>      __get_user(env->regwptr[WREG_O0], (&(*grp)[SPARC_MC_O0]));
>      __get_user(env->regwptr[WREG_O1], (&(*grp)[SPARC_MC_O1]));
>      __get_user(env->regwptr[WREG_O2], (&(*grp)[SPARC_MC_O2]));
> @@ -456,18 +464,9 @@ void sparc64_set_context(CPUSPARCState *env)
>      __get_user(env->regwptr[WREG_O6], (&(*grp)[SPARC_MC_O6]));
>      __get_user(env->regwptr[WREG_O7], (&(*grp)[SPARC_MC_O7]));
>  
> -    __get_user(fp, &(ucp->tuc_mcontext.mc_fp));
> -    __get_user(i7, &(ucp->tuc_mcontext.mc_i7));
> +    __get_user(env->regwptr[WREG_FP], &(ucp->tuc_mcontext.mc_fp));
> +    __get_user(env->regwptr[WREG_I7], &(ucp->tuc_mcontext.mc_i7));
>  
> -    w_addr = TARGET_STACK_BIAS + env->regwptr[WREG_O6];
> -    if (put_user(fp, w_addr + offsetof(struct target_reg_window, ins[6]),
> -                 abi_ulong) != 0) {
> -        goto do_sigsegv;
> -    }
> -    if (put_user(i7, w_addr + offsetof(struct target_reg_window, ins[7]),
> -                 abi_ulong) != 0) {
> -        goto do_sigsegv;
> -    }
>      /* FIXME this does not match how the kernel handles the FPU in
>       * its sparc64_set_context implementation. In particular the FPU
>       * is only restored if fenab is non-zero in:
> @@ -501,7 +500,6 @@ void sparc64_get_context(CPUSPARCState *env)
>      struct target_ucontext *ucp;
>      target_mc_gregset_t *grp;
>      target_mcontext_t *mcp;
> -    abi_ulong fp, i7, w_addr;
>      int err;
>      unsigned int i;
>      target_sigset_t target_set;
> @@ -553,6 +551,15 @@ void sparc64_get_context(CPUSPARCState *env)
>      __put_user(env->gregs[5], &((*grp)[SPARC_MC_G5]));
>      __put_user(env->gregs[6], &((*grp)[SPARC_MC_G6]));
>      __put_user(env->gregs[7], &((*grp)[SPARC_MC_G7]));
> +
> +    /*
> +     * Note that unlike the kernel, we didn't need to mess with the
> +     * guest register window state to save it into a pt_regs to run
> +     * the kernel. So for us the guest's O regs are still in WREG_O*
> +     * (unlike the kernel which has put them in UREG_I* in a pt_regs)
> +     * and the fp and i7 are still in WREG_I6 and WREG_I7 and don't
> +     * need to be fished out of userspace memory.
> +     */
>      __put_user(env->regwptr[WREG_O0], &((*grp)[SPARC_MC_O0]));
>      __put_user(env->regwptr[WREG_O1], &((*grp)[SPARC_MC_O1]));
>      __put_user(env->regwptr[WREG_O2], &((*grp)[SPARC_MC_O2]));
> @@ -562,18 +569,8 @@ void sparc64_get_context(CPUSPARCState *env)
>      __put_user(env->regwptr[WREG_O6], &((*grp)[SPARC_MC_O6]));
>      __put_user(env->regwptr[WREG_O7], &((*grp)[SPARC_MC_O7]));
>  
> -    w_addr = TARGET_STACK_BIAS + env->regwptr[WREG_O6];
> -    fp = i7 = 0;
> -    if (get_user(fp, w_addr + offsetof(struct target_reg_window, ins[6]),
> -                 abi_ulong) != 0) {
> -        goto do_sigsegv;
> -    }
> -    if (get_user(i7, w_addr + offsetof(struct target_reg_window, ins[7]),
> -                 abi_ulong) != 0) {
> -        goto do_sigsegv;
> -    }
> -    __put_user(fp, &(mcp->mc_fp));
> -    __put_user(i7, &(mcp->mc_i7));
> +    __put_user(env->regwptr[WREG_FP], &(mcp->mc_fp));
> +    __put_user(env->regwptr[WREG_I7], &(mcp->mc_i7));
>  
>      {
>          uint32_t *dst = ucp->tuc_mcontext.mc_fpregs.mcfpu_fregs.sregs;
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent


