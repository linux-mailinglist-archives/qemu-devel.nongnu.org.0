Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE42DD0A1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:43:52 +0100 (CET)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprhH-0005YU-PT
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprXc-0003Jh-Ri
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:33:52 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprXa-0005vG-PG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:33:52 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M4aA4-1kqPlq13zy-001iUh; Thu, 17 Dec 2020 12:33:48 +0100
Subject: Re: [PATCH v2 4/4] linux-user/sparc: Handle tstate in
 sparc64_get/set_context()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201106152738.26026-1-peter.maydell@linaro.org>
 <20201106152738.26026-5-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <32ad45b3-ff2b-5bd4-af20-dfd04d8325c6@vivier.eu>
Date: Thu, 17 Dec 2020 12:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201106152738.26026-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IkKtv3Q8vFjMvN4pxrY1b0uJRq2z/M5wmQ/x5CB+n6zMOmJHs1p
 BmHQM6lThmSPO1m40hTmPcN5JGPEhp3NU2TLnrqNzYk9cjfdqH2O1IfBvEthxaHaKLDomeI
 cBqvf9b+37d+LogNdmBx9dHXdM22btGhFV3UtnqdeG32d+AkJVVPrLkuiC6+sh3Q17pJGiv
 t6Yj1KpJSJKrbCGvOycxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OG36SqO7Thg=:B2GvOqbtwoJgyKFNXRkpgS
 xTGvAJnkKmcHOTPFc4lkRGprKvmTFgSVO+4/e8IQ9Njpjlr+6TKqYdK3Wp0jKzQgChP1OJwYo
 lY8x3KGiV6LceXzIvhhVr4KoQaVxm4o+i744H4FaCDCNpPfcwA931AW1zU3s3Pl8QmAt2EtQs
 ziCWP56WpDrozICoykn7PVYC9m6R9x/Irsk+OOERZO7bu+ySAaQ7ArXtPxJGMLTw4OVcQ2qnC
 C0uzeDDSNjlLeD9XYS3KbLM7q0k2LaGm68jVI/4B5xakFB1y4s+4maV3VcvAlmwvzbG53v7Li
 aAlGHW4j77RJAfe9LDba4p7rcDqX8hmj80c2S0JI59MxA1f2wwHQptA5EB+sMl1xMlRSSgql6
 GUCrSVIBw8YMR0lttGCkU390rfMn+ldo99NM1A43glcewg0tE67QxnJQvH2NZ
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
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
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/11/2020 à 16:27, Peter Maydell a écrit :
> Correctly implement save/restore of the tstate field in
> sparc64_get_context() and sparc64_set_context():
>  * Don't use the CWP value from the guest in set_context
>  * Construct and save a tstate value rather than leaving
>    it as zero in get_context
> 
> To do this we factor out the "calculate TSTATE value from CPU state"
> code from sparc_cpu_do_interrupt() into its own sparc64_tstate()
> function; that in turn requires us to move some of the function
> prototypes out from inside a CPU_NO_IO_DEFS ifdef guard.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/sparc/cpu.h          | 24 ++++++++++++++++++++----
>  linux-user/sparc/signal.c   |  7 +++----
>  target/sparc/int64_helper.c |  5 +----
>  3 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index 277254732b9..4b2290650be 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -608,10 +608,6 @@ target_ulong cpu_get_psr(CPUSPARCState *env1);
>  void cpu_put_psr(CPUSPARCState *env1, target_ulong val);
>  void cpu_put_psr_raw(CPUSPARCState *env1, target_ulong val);
>  #ifdef TARGET_SPARC64
> -target_ulong cpu_get_ccr(CPUSPARCState *env1);
> -void cpu_put_ccr(CPUSPARCState *env1, target_ulong val);
> -target_ulong cpu_get_cwp64(CPUSPARCState *env1);
> -void cpu_put_cwp64(CPUSPARCState *env1, int cwp);
>  void cpu_change_pstate(CPUSPARCState *env1, uint32_t new_pstate);
>  void cpu_gl_switch_gregs(CPUSPARCState *env, uint32_t new_gl);
>  #endif
> @@ -829,4 +825,24 @@ static inline bool tb_am_enabled(int tb_flags)
>  #endif
>  }
>  
> +#ifdef TARGET_SPARC64
> +/* win_helper.c */
> +target_ulong cpu_get_ccr(CPUSPARCState *env1);
> +void cpu_put_ccr(CPUSPARCState *env1, target_ulong val);
> +target_ulong cpu_get_cwp64(CPUSPARCState *env1);
> +void cpu_put_cwp64(CPUSPARCState *env1, int cwp);
> +
> +static inline uint64_t sparc64_tstate(CPUSPARCState *env)
> +{
> +    uint64_t tstate = (cpu_get_ccr(env) << 32) |
> +        ((env->asi & 0xff) << 24) | ((env->pstate & 0xf3f) << 8) |
> +        cpu_get_cwp64(env);
> +
> +    if (env->def.features & CPU_FEATURE_GL) {
> +        tstate |= (env->gl & 7ULL) << 40;
> +    }
> +    return tstate;
> +}
> +#endif
> +
>  #endif
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index ed32c7abd17..a6c7c7664a2 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -438,9 +438,9 @@ void sparc64_set_context(CPUSPARCState *env)
>      env->npc = npc;
>      __get_user(env->y, &((*grp)[SPARC_MC_Y]));
>      __get_user(tstate, &((*grp)[SPARC_MC_TSTATE]));
> +    /* Honour TSTATE_ASI, TSTATE_ICC and TSTATE_XCC only */
>      env->asi = (tstate >> 24) & 0xff;
> -    cpu_put_ccr(env, tstate >> 32);
> -    cpu_put_cwp64(env, tstate & 0x1f);
> +    cpu_put_ccr(env, (tstate >> 32) & 0xff);
>      __get_user(env->gregs[1], (&(*grp)[SPARC_MC_G1]));
>      __get_user(env->gregs[2], (&(*grp)[SPARC_MC_G2]));
>      __get_user(env->gregs[3], (&(*grp)[SPARC_MC_G3]));
> @@ -557,8 +557,7 @@ void sparc64_get_context(CPUSPARCState *env)
>          }
>      }
>  
> -    /* XXX: tstate must be saved properly */
> -    //    __put_user(env->tstate, &((*grp)[SPARC_MC_TSTATE]));
> +    __put_user(sparc64_tstate(env), &((*grp)[SPARC_MC_TSTATE]));
>      __put_user(env->pc, &((*grp)[SPARC_MC_PC]));
>      __put_user(env->npc, &((*grp)[SPARC_MC_NPC]));
>      __put_user(env->y, &((*grp)[SPARC_MC_Y]));
> diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
> index f3e7f32de61..735668f5006 100644
> --- a/target/sparc/int64_helper.c
> +++ b/target/sparc/int64_helper.c
> @@ -131,9 +131,7 @@ void sparc_cpu_do_interrupt(CPUState *cs)
>      }
>      tsptr = cpu_tsptr(env);
>  
> -    tsptr->tstate = (cpu_get_ccr(env) << 32) |
> -        ((env->asi & 0xff) << 24) | ((env->pstate & 0xf3f) << 8) |
> -        cpu_get_cwp64(env);
> +    tsptr->tstate = sparc64_tstate(env);
>      tsptr->tpc = env->pc;
>      tsptr->tnpc = env->npc;
>      tsptr->tt = intno;
> @@ -148,7 +146,6 @@ void sparc_cpu_do_interrupt(CPUState *cs)
>      }
>  
>      if (env->def.features & CPU_FEATURE_GL) {
> -        tsptr->tstate |= (env->gl & 7ULL) << 40;
>          cpu_gl_switch_gregs(env, env->gl + 1);
>          env->gl++;
>      }
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


