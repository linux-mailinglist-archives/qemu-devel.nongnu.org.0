Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F731B867
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:53:30 +0100 (CET)
Received: from localhost ([::1]:33384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcRU-0007qg-RD
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lBcPo-0006G6-Cn
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:51:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:55940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lBcPm-0003gC-IK
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:51:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E1A3AD29;
 Mon, 15 Feb 2021 11:51:41 +0000 (UTC)
Subject: Re: [RFC v18 08/15] i386: split smm helper (softmmu)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-9-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b6b053ef-998e-08ef-4354-27cdcfb331e9@suse.de>
Date: Mon, 15 Feb 2021 12:51:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210212123622.15834-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 1:36 PM, Claudio Fontana wrote:
> smm is only really useful for softmmu, split in two modules
> around the CONFIG_USER_ONLY, in order to remove the ifdef
> and use the build system instead.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/helper.h                       |  4 ++++
>  target/i386/tcg/seg_helper.c               |  2 ++
>  target/i386/tcg/{ => softmmu}/smm_helper.c | 19 ++-----------------
>  target/i386/tcg/translate.c                |  2 ++
>  target/i386/tcg/meson.build                |  1 -
>  target/i386/tcg/softmmu/meson.build        |  1 +
>  6 files changed, 11 insertions(+), 18 deletions(-)
>  rename target/i386/tcg/{ => softmmu}/smm_helper.c (98%)
> 
> diff --git a/target/i386/helper.h b/target/i386/helper.h
> index c2ae2f7e61..8ffda4cdc6 100644
> --- a/target/i386/helper.h
> +++ b/target/i386/helper.h
> @@ -70,7 +70,11 @@ DEF_HELPER_1(clac, void, env)
>  DEF_HELPER_1(stac, void, env)
>  DEF_HELPER_3(boundw, void, env, tl, int)
>  DEF_HELPER_3(boundl, void, env, tl, int)
> +
> +#ifndef CONFIG_USER_ONLY
>  DEF_HELPER_1(rsm, void, env)
> +#endif /* !CONFIG_USER_ONLY */
> +
>  DEF_HELPER_2(into, void, env, int)
>  DEF_HELPER_2(cmpxchg8b_unlocked, void, env, tl)
>  DEF_HELPER_2(cmpxchg8b, void, env, tl)
> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index 180d47f0e9..f0cb1bffe7 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -1351,7 +1351,9 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>      case CPU_INTERRUPT_SMI:
>          cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
>          cs->interrupt_request &= ~CPU_INTERRUPT_SMI;
> +#ifndef CONFIG_USER_ONLY
>          do_smm_enter(cpu);
> +#endif
>          break;
>      case CPU_INTERRUPT_NMI:
>          cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
> diff --git a/target/i386/tcg/smm_helper.c b/target/i386/tcg/softmmu/smm_helper.c
> similarity index 98%
> rename from target/i386/tcg/smm_helper.c
> rename to target/i386/tcg/softmmu/smm_helper.c
> index 62d027abd3..ee53b26629 100644
> --- a/target/i386/tcg/smm_helper.c
> +++ b/target/i386/tcg/softmmu/smm_helper.c
> @@ -1,5 +1,5 @@
>  /*
> - *  x86 SMM helpers
> + *  x86 SMM helpers (softmmu-only)
>   *
>   *  Copyright (c) 2003 Fabrice Bellard
>   *
> @@ -18,27 +18,14 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "exec/helper-proto.h"
>  #include "exec/log.h"
> -#include "helper-tcg.h"
> +#include "tcg/helper-tcg.h"
>  
>  
>  /* SMM support */
>  
> -#if defined(CONFIG_USER_ONLY)
> -
> -void do_smm_enter(X86CPU *cpu)
> -{
> -}
> -
> -void helper_rsm(CPUX86State *env)
> -{
> -}
> -
> -#else
> -
>  #ifdef TARGET_X86_64
>  #define SMM_REVISION_ID 0x00020064
>  #else
> @@ -330,5 +317,3 @@ void helper_rsm(CPUX86State *env)
>      qemu_log_mask(CPU_LOG_INT, "SMM: after RSM\n");
>      log_cpu_state_mask(CPU_LOG_INT, CPU(cpu), CPU_DUMP_CCOP);
>  }
> -
> -#endif /* !CONFIG_USER_ONLY */
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index af1faf9342..5075ac4830 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -8321,7 +8321,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>              goto illegal_op;
>          gen_update_cc_op(s);
>          gen_jmp_im(s, s->pc - s->cs_base);
> +#ifndef CONFIG_USER_ONLY
>          gen_helper_rsm(cpu_env);
> +#endif /* CONFIG_USER_ONLY */
>          gen_eob(s);
>          break;

Hello Alex,

this is something I wanted to bring in the foreground:

while before we were generating an empty helper call for CONFIG_USER_ONLY,
now we are not generating anything.



>      case 0x1b8: /* SSE4.2 popcnt */
> diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
> index 68fa0c3187..ec5daa1edc 100644
> --- a/target/i386/tcg/meson.build
> +++ b/target/i386/tcg/meson.build
> @@ -8,7 +8,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'misc_helper.c',
>    'mpx_helper.c',
>    'seg_helper.c',
> -  'smm_helper.c',
>    'svm_helper.c',
>    'tcg-cpu.c',
>    'translate.c'), if_false: files('tcg-stub.c'))
> diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
> index 4ab30cc32e..35ba16dc3d 100644
> --- a/target/i386/tcg/softmmu/meson.build
> +++ b/target/i386/tcg/softmmu/meson.build
> @@ -1,3 +1,4 @@
>  i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
>    'tcg-cpu.c',
> +  'smm_helper.c',
>  ))
> 


