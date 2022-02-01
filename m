Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C24A64D4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:19:00 +0100 (CET)
Received: from localhost ([::1]:59616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyg6-0005RF-S8
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:18:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw5W-0002cj-BT
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:33:02 -0500
Received: from [2610:1c1:1:606c::19:2] (port=63560 helo=mx2.freebsd.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw5R-0008VF-FX
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:32:59 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 075D47E4B2
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:32:56 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9TM6KVJz4clP
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:32:55 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vpKzLDoKjrOwV34NZPrjvbISM55jwnWIkr2+uUXFlkk=;
 b=Ea5scJ3nNJJ9m7dBSgL8kjbQ5mNh7NQMnnZ+z/oc+UinlvhV+GAMYAm48JtZLxZx9Bbu8L
 HwEQWcNtalU32/ZDBDbtV3dzEucodxEKCIgMHobpGZsOLGddD3Lt8HeImCl3JMgYHQTvF4
 VVlVmNsQnTD/bmxeQa8jRRw+XkDDV0Kyo4V/+uuFxhBzCUCH5GcP2uHYmigyI3tq4zg8Bg
 EiC/ovTCXiamUqKKcP6Mws3MDnF6QXy89yUnn0cZhuv5UW2kDIRu/YMRGe4ZgEyDQgpJiE
 I0W99+ktw4rfwt5UQGyeqZoXJRwNJkO2T55QM1dFX0G0ZNrvZPT9IMg6Rackkw==
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id B1FCD2ED5F
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:32:55 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f169.google.com with SMTP id bs32so4202203qkb.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:32:55 -0800 (PST)
X-Gm-Message-State: AOAM533AOkQZYHTAYsLxDnhycM12SHEzwPGoj84tanTezUcoU54ztjaF
 NaboIGdLcf5meVzfRHjB1krtD0JG9TOi/RTqNx4=
X-Google-Smtp-Source: ABdhPJyKuyzEhFnqyk1wHzONcjc3OFdz897cW8+fktgr/bjIDcNB0IgXDKIgQKCyiUBxemrXhYmPSu5NdJFCo3BrEto=
X-Received: by 2002:a05:620a:2891:: with SMTP id
 j17mr17230237qkp.350.1643733175231; 
 Tue, 01 Feb 2022 08:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-6-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-6-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:32:44 -0600
X-Gmail-Original-Message-ID: <CACNAnaGV9goBpHOXyppD9ZLDK7KTB=HYhS5JUegF_Waebe_0Nw@mail.gmail.com>
Message-ID: <CACNAnaGV9goBpHOXyppD9ZLDK7KTB=HYhS5JUegF_Waebe_0Nw@mail.gmail.com>
Subject: Re: [PATCH 05/22] bsd-user/arm/target_arch_cpu.h: Only support
 FreeBSD sys calls
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vpKzLDoKjrOwV34NZPrjvbISM55jwnWIkr2+uUXFlkk=;
 b=iL6ImO4Mq1KjWA4pb1ZmeYWIMI94L0tZGCjkACAX6706dK+oaZrIk7ZmM9Q4VMAxXHf4fQ
 cU1rZ7m2+1CG2UevYh/SvTultnTUcoWhrw55Dkg/vfu9wOmv7bXjdDki6BCdQZBBeh+jd+
 rsXdOOVyWX9pLe+jXSY1Wli0p99Rfwosk+mHE5YY+IFMscXOUXkk3Z2KYpkiS2cmRXPimz
 +p6PypFx6Ke+II3Hck9oqvLdAW64uFuLIAIi3dU1Y8KinNxZ9gYQGg0XGEfcU59bxLdqpm
 iyGbibKscQpFYPMiye3AdO98tFddY227g9AEC27A8ezowy+8f8a7cieDZLuUuA==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733175; a=rsa-sha256; cv=none;
 b=MkcnP/Ihj3zp5RgkP5VgtLvgQY6AWFvaqq5nfpREN4DGhG8FvsimJ8xhq4j4B7QEQbpyhg
 7lEUnJRripsPaQpUl8KNBhsZWa9q44GLP3JSLXG+aU6YNP/1FzfrjNvDI4II4ufUAuyCFS
 +lejOCsgiaJ1lZ/7/JZSjokYD2lW13C9a0R4WU4bGs3YboYhSoHG3pp5BOjbJFHEj6tCg5
 C5CnBmZs4pda/3Em7x/fpKiF37/Ggnp3rNSBumbo0qBFNKzc3INYmD4RmtlqZsvfCJhVDf
 8xXXpMvxA9qAHHHeIqi3k9qpZ1+h17qcDsY0uwRIDzzD1U1IVObnDa13BeRBxA==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2610:1c1:1:606c::19:2
 (failed)
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:14 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Since we don't build on OpenBSD, only do FreeBSD system calls here. In
> the future, we'll need to move this to some place like
> bsd-user/freebsd/arm/mumble.h, but until then just leave this
> inline. This reflects changes to the upstream.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 139 ++++++++++++++++-----------------
>  1 file changed, 66 insertions(+), 73 deletions(-)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index b087db48fa4..afb7814a8d1 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -40,7 +40,6 @@ static inline void target_cpu_init(CPUARMState *env,
>  static inline void target_cpu_loop(CPUARMState *env)
>  {
>      int trapnr, si_signo, si_code;
> -    unsigned int n;
>      CPUState *cs = env_cpu(env);
>
>      for (;;) {
> @@ -66,82 +65,76 @@ static inline void target_cpu_loop(CPUARMState *env)
>              break;
>          case EXCP_SWI:
>              {
> -                n = env->regs[7];
> -                if (bsd_type == target_freebsd) {
> -                    int ret;
> -                    abi_ulong params = get_sp_from_cpustate(env);
> -                    int32_t syscall_nr = n;
> -                    int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
> +                int ret;
> +                abi_ulong params = get_sp_from_cpustate(env);
> +                int32_t syscall_nr = env->regs[7];
> +                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
>
> -                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
> -                    if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> -                        syscall_nr = env->regs[0];
> -                        arg1 = env->regs[1];
> -                        arg2 = env->regs[2];
> -                        arg3 = env->regs[3];
> -                        get_user_s32(arg4, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg5, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg6, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg7, params);
> -                        arg8 = 0;
> -                    } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
> -                        syscall_nr = env->regs[0];
> -                        arg1 = env->regs[2];
> -                        arg2 = env->regs[3];
> -                        get_user_s32(arg3, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg4, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg5, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg6, params);
> -                        arg7 = 0;
> -                        arg8 = 0;
> -                    } else {
> -                        arg1 = env->regs[0];
> -                        arg2 = env->regs[1];
> -                        arg3 = env->regs[2];
> -                        arg4 = env->regs[3];
> -                        get_user_s32(arg5, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg6, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg7, params);
> -                        params += sizeof(int32_t);
> -                        get_user_s32(arg8, params);
> -                    }
> -                    ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
> -                            arg4, arg5, arg6, arg7, arg8);
> +                /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
> +                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> +                    syscall_nr = env->regs[0];
> +                    arg1 = env->regs[1];
> +                    arg2 = env->regs[2];
> +                    arg3 = env->regs[3];
> +                    get_user_s32(arg4, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg5, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg6, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg7, params);
> +                    arg8 = 0;
> +                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
> +                    syscall_nr = env->regs[0];
> +                    arg1 = env->regs[2];
> +                    arg2 = env->regs[3];
> +                    get_user_s32(arg3, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg4, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg5, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg6, params);
> +                    arg7 = 0;
> +                    arg8 = 0;
> +                } else {
> +                    arg1 = env->regs[0];
> +                    arg2 = env->regs[1];
> +                    arg3 = env->regs[2];
> +                    arg4 = env->regs[3];
> +                    get_user_s32(arg5, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg6, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg7, params);
> +                    params += sizeof(int32_t);
> +                    get_user_s32(arg8, params);
> +                }
> +                ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
> +                                         arg4, arg5, arg6, arg7, arg8);
> +                /*
> +                 * Compare to arm/arm/vm_machdep.c
> +                 * cpu_set_syscall_retval()
> +                 */
> +                if (-TARGET_EJUSTRETURN == ret) {
>                      /*
> -                     * Compare to arm/arm/vm_machdep.c
> -                     * cpu_set_syscall_retval()
> +                     * Returning from a successful sigreturn syscall.
> +                     * Avoid clobbering register state.
>                       */
> -                    if (-TARGET_EJUSTRETURN == ret) {
> -                        /*
> -                         * Returning from a successful sigreturn syscall.
> -                         * Avoid clobbering register state.
> -                         */
> -                        break;
> -                    }
> -                    if (-TARGET_ERESTART == ret) {
> -                        env->regs[15] -= env->thumb ? 2 : 4;
> -                        break;
> -                    }
> -                    if ((unsigned int)ret >= (unsigned int)(-515)) {
> -                        ret = -ret;
> -                        cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
> -                        env->regs[0] = ret;
> -                    } else {
> -                        cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
> -                        env->regs[0] = ret; /* XXX need to handle lseek()? */
> -                        /* env->regs[1] = 0; */
> -                    }
> +                    break;
> +                }
> +                if (-TARGET_ERESTART == ret) {
> +                    env->regs[15] -= env->thumb ? 2 : 4;
> +                    break;
> +                }
> +                if ((unsigned int)ret >= (unsigned int)(-515)) {
> +                    ret = -ret;
> +                    cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
> +                    env->regs[0] = ret;
>                  } else {
> -                    fprintf(stderr, "qemu: bsd_type (= %d) syscall "
> -                            "not supported\n", bsd_type);
> +                    cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
> +                    env->regs[0] = ret; /* XXX need to handle lseek()? */
> +                    /* env->regs[1] = 0; */
>                  }
>              }
>              break;
>

We should probably fix the lseek() situation sooner rather than later, but:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

