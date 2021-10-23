Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D19438247
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 09:53:56 +0200 (CEST)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meBql-0008R2-8F
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 03:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBXh-0007w3-8A; Sat, 23 Oct 2021 03:34:13 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:50606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBXb-0005e7-Oq; Sat, 23 Oct 2021 03:34:11 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 03D9F9963C;
 Sat, 23 Oct 2021 07:34:06 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HbtJF6GLVz3DyQ;
 Sat, 23 Oct 2021 07:34:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id B7CD0A7BD;
 Sat, 23 Oct 2021 07:34:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f179.google.com with SMTP id d15so6697791qkj.10;
 Sat, 23 Oct 2021 00:34:05 -0700 (PDT)
X-Gm-Message-State: AOAM531j+e45wQZMH/+2o7x0MoF2NHidR5C7lVYyzNZazBuHZeK1fOv/
 olIebSJ6staFsD7ZiTuNJQGst7h5oht2p4rx1Rs=
X-Google-Smtp-Source: ABdhPJzl8JNK/zhoWo6Xa64blPWPmDlhnN2Ci9xUzAfh87+SFeOqqbiAZZZ7vcxJ7ahmDYfGE9zc2KuinJXTJswliZM=
X-Received: by 2002:a05:620a:424f:: with SMTP id
 w15mr3808896qko.258.1634974445425; 
 Sat, 23 Oct 2021 00:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-10-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-10-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 23 Oct 2021 02:33:54 -0500
X-Gmail-Original-Message-ID: <CACNAnaHL4uySkKewBMcDDcC+5qqAJQ1HXqsCSKc_W46cOTvg8Q@mail.gmail.com>
Message-ID: <CACNAnaHL4uySkKewBMcDDcC+5qqAJQ1HXqsCSKc_W46cOTvg8Q@mail.gmail.com>
Subject: Re: [PATCH 09/24] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Stacey Son <sson@freebsd.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Implement the system call dispatch. This implements all three kinds of
> system call: direct and the two indirect variants. It handles all the
> special cases for thumb as well.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

s/Klye/Kyle/

> ---
>  bsd-user/arm/target_arch_cpu.h | 95 ++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index 62d6ee89b6..bc2eb05cfe 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -39,6 +39,7 @@ static inline void target_cpu_loop(CPUARMState *env)
>  {
>      int trapnr;
>      target_siginfo_t info;
> +    unsigned int n;
>      CPUState *cs = env_cpu(env);
>
>      for (;;) {
> @@ -57,6 +58,100 @@ static inline void target_cpu_loop(CPUARMState *env)
>                  queue_signal(env, info.si_signo, &info);
>              }
>              break;
> +        case EXCP_SWI:
> +        case EXCP_BKPT:
> +            {
> +                env->eabi = 1; /* FreeBSD is eabi only now */
> +                /*
> +                 * system call
> +                 * See arm/arm/trap.c cpu_fetch_syscall_args()
> +                 */
> +                if (trapnr == EXCP_BKPT) {
> +                    if (env->thumb) {
> +                        env->regs[15] += 2;
> +                    } else {
> +                        env->regs[15] += 4;
> +                    }
> +                }
> +                n = env->regs[7];
> +                if (bsd_type == target_freebsd) {
> +                    int ret;
> +                    abi_ulong params = get_sp_from_cpustate(env);
> +                    int32_t syscall_nr = n;
> +                    int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
> +
> +                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
> +                    if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> +                        syscall_nr = env->regs[0];
> +                        arg1 = env->regs[1];
> +                        arg2 = env->regs[2];
> +                        arg3 = env->regs[3];
> +                        get_user_s32(arg4, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg5, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg6, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg7, params);
> +                        arg8 = 0;
> +                    } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
> +                        syscall_nr = env->regs[0];
> +                        arg1 = env->regs[2];
> +                        arg2 = env->regs[3];
> +                        get_user_s32(arg3, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg4, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg5, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg6, params);
> +                        arg7 = 0;
> +                        arg8 = 0;
> +                    } else {
> +                        arg1 = env->regs[0];
> +                        arg2 = env->regs[1];
> +                        arg3 = env->regs[2];
> +                        arg4 = env->regs[3];
> +                        get_user_s32(arg5, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg6, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg7, params);
> +                        params += sizeof(int32_t);
> +                        get_user_s32(arg8, params);
> +                    }
> +                    ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
> +                            arg4, arg5, arg6, arg7, arg8);
> +                    /*
> +                     * Compare to arm/arm/vm_machdep.c
> +                     * cpu_set_syscall_retval()
> +                     */
> +                    if (-TARGET_EJUSTRETURN == ret) {
> +                        /*
> +                         * Returning from a successful sigreturn syscall.
> +                         * Avoid clobbering register state.
> +                         */
> +                        break;
> +                    }
> +                    if (-TARGET_ERESTART == ret) {
> +                        env->regs[15] -= env->thumb ? 2 : 4;
> +                        break;
> +                    }
> +                    if ((unsigned int)ret >= (unsigned int)(-515)) {
> +                        ret = -ret;
> +                        cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
> +                        env->regs[0] = ret;
> +                    } else {
> +                        cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
> +                        env->regs[0] = ret; /* XXX need to handle lseek()? */
> +                        /* env->regs[1] = 0; */
> +                    }
> +                } else {
> +                    fprintf(stderr, "qemu: bsd_type (= %d) syscall "
> +                            "not supported\n", bsd_type);
> +                }
> +            }
> +            break;
>          case EXCP_INTERRUPT:
>              /* just indicate that signals should be handled asap */
>              break;
> --
> 2.32.0
>

Modulo typo:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

