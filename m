Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52531AD9E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 19:58:18 +0100 (CET)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB07V-0001I9-7g
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 13:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB06j-0000sU-32
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 13:57:29 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:54387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB06h-0002NU-Db
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 13:57:28 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MoNu2-1ldjE33Dlw-00onhy; Sat, 13 Feb 2021 19:57:15 +0100
Subject: Re: [PATCH] linux-user: signal: Support TARGET_SS_AUTODISARM
To: chengang@emindsoft.com.cn, riku.voipio@iki.fi
References: <20201008042501.16857-1-chengang@emindsoft.com.cn>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <59689321-7aa0-2581-afcc-5aa7b55f47cf@vivier.eu>
Date: Sat, 13 Feb 2021 19:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201008042501.16857-1-chengang@emindsoft.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GsK5WI7Lp5ONuQOTsZay9vWWGeROR3G1Wb/5wKtrFrgBjHn+Mhb
 889W/KXdoW/kmLkgoc1osGnmegmZJqXISdZ850eBdWZ1DVxWRry+n+owueoDMU6eAvvEU0e
 dSak+gbjOU05KyHYBmjofXBs5QeYkHaf95aPWDJsq/zSsrrcxKYcfMxZAd6AcGgmhExLiLF
 wZfyfkJi1Ij4RxfQ0AyNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RJD4SQhaWbc=:xjv4n0qHyCogqcUYL6ZE3R
 500qKlUz03gT0n1QMd4D+4PxXnIoATALPZ7cOajbPrQFmOua3fgOXbTr5CdGeulnJUI4lLcCX
 VC9Q0MAyP7O5okfvsZlFnclKbo/Z8JCmazPHbfU3QhyMkbL9xQKk/krtuzaDcq/oUo7TAlxT/
 ZwdQm6vcGGs3lq5+bRRguvoiRiW1LiiIFPHbztKnzwTanLD6YjSEy9BlDPxlIW+BnE0h6y9vT
 ifj7YMDR8IxkCCp0rbaIvUoYSZBrCU/Br5UfZizjxXg2UKV/jeIJ7C/lUaIG8fGGwYb+R7s/b
 GVdsNnJJ5XLklYbOIzAV2NxrFsarAmyyQzlxYlU2lnUv4pEpv3rCJum/xpqEkW22Xsmh8ACAw
 cVNlezG2Lnii1IyyzrS1sMg6dO4MJr3Hr8t9VVo5EzwUnaunBzRv2EXxpLyml
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/10/2020 à 06:25, chengang@emindsoft.com.cn a écrit :
> From: Chen Gang <chengang@emindsoft.com.cn>
> 
> Microsoft sqlserver 2017 x86_64 uses it. The implementation references
> from the linux kernel.
> 
> Signed-off-by: Chen Gang <chengang@emindsoft.com.cn>
> ---
>  linux-user/generic/signal.h |  6 ++++++
>  linux-user/signal.c         | 23 ++++++++++++++++++-----
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
> index e1083f8fba..943bc1a1e2 100644
> --- a/linux-user/generic/signal.h
> +++ b/linux-user/generic/signal.h
> @@ -54,4 +54,10 @@
>  #define TARGET_SIG_BLOCK          0    /* for blocking signals */
>  #define TARGET_SIG_UNBLOCK        1    /* for unblocking signals */
>  #define TARGET_SIG_SETMASK        2    /* for setting the signal mask */
> +
> +/* bit-flags */
> +#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> +/* mask for all SS_xxx flags */
> +#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
> +
>  #endif

This part should be moved to the other patch:

  linux-user: target: signal: Support TARGET_SS_AUTODISARM

> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 8cf51ffecd..b5f04ae160 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -263,6 +263,10 @@ int on_sig_stack(unsigned long sp)
>  {
>      TaskState *ts = (TaskState *)thread_cpu->opaque;
>  
> +    if (ts->sigaltstack_used.ss_flags & TARGET_SS_AUTODISARM) {
> +        return 0;
> +    }
> +
>      return (sp - ts->sigaltstack_used.ss_sp
>              < ts->sigaltstack_used.ss_size);
>  }
> @@ -293,8 +297,13 @@ void target_save_altstack(target_stack_t *uss, CPUArchState *env)
>      TaskState *ts = (TaskState *)thread_cpu->opaque;
>  
>      __put_user(ts->sigaltstack_used.ss_sp, &uss->ss_sp);
> -    __put_user(sas_ss_flags(get_sp_from_cpustate(env)), &uss->ss_flags);
> +    __put_user(ts->sigaltstack_used.ss_flags, &uss->ss_flags);

Could you explain why you remove sas_ss_flags() and get_sp_from_cpustate(env)?

>      __put_user(ts->sigaltstack_used.ss_size, &uss->ss_size);
> +    if (ts->sigaltstack_used.ss_flags & TARGET_SS_AUTODISARM) {
> +        ts->sigaltstack_used.ss_sp = 0;
> +        ts->sigaltstack_used.ss_size = 0;
> +        ts->sigaltstack_used.ss_flags = TARGET_SS_DISABLE;
> +    }
>  }
>  
>  /* siginfo conversion */
> @@ -768,7 +777,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
>      {
>          __put_user(ts->sigaltstack_used.ss_sp, &oss.ss_sp);
>          __put_user(ts->sigaltstack_used.ss_size, &oss.ss_size);
> -        __put_user(sas_ss_flags(sp), &oss.ss_flags);
> +        __put_user(ts->sigaltstack_used.ss_flags, &oss.ss_flags);

Ditto

Thanks,
Laurent

