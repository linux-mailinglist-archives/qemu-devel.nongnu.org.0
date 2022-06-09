Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B187544BAA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:23:59 +0200 (CEST)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHCg-0003eh-6R
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1nzF1q-0002qV-BX
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:04:40 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54598
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1nzF1l-0006TO-Au
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1654769067; bh=3OLv9ajUJF2r2a+QtBQDGJalmUgE6SwNkMAn26kdcb8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BavuailqgOmBDb5uPqPfPESqilEz4CepnZwoqXB8MpA8U139WiaLrXyqe4kxfWTty
 bNPrYV45v9Dus17PXtq+R+MDjqSVrHd1o53JFjHTD3x9F2VpwQ3kjQodtmvVZvt6JT
 HviSWLDUwpX95vWSt6pHcBw1rHUTLk/t4t/Wkuhw=
Received: from [100.100.57.190] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7642560691;
 Thu,  9 Jun 2022 18:04:27 +0800 (CST)
Message-ID: <3b6bb5a5-7da1-00d4-a3ee-8595fe6ea769@xen0n.name>
Date: Thu, 9 Jun 2022 18:04:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:103.0)
 Gecko/20100101 Thunderbird/103.0a1
Subject: Re: [PATCH v15 4/9] linux-user: Add LoongArch syscall support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-5-gaosong@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20220609024209.2406188-5-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/6/9 10:42, Song Gao wrote:
> We should disable '__BITS_PER_LONG' at [1] before run gensyscalls.sh
>
>   [1] arch/loongarch/include/uapi/asm/bitsperlong.h

I'm not sure why this is necessary, is this for building on 32-bit where 
__BITS_PER_LONG are (incorrectly) reflecting the host bitness?

If this is the case, arch/riscv uses the same trick (they are defining 
__BITS_PER_LONG as (__SIZEOF_POINTER__ * 8), which is essentially the 
same), so they should fail without the hack described here as well. I 
don't know if something else could be tweaked to get rid of this hack 
(currently unable to investigate deeper for you, taking a break 
reviewing this in the middle of my day job).

>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/loongarch64/syscall_nr.h     | 312 ++++++++++++++++++++++++
>   linux-user/loongarch64/target_syscall.h |  48 ++++
>   linux-user/syscall_defs.h               |  12 +-
>   scripts/gensyscalls.sh                  |   1 +
>   4 files changed, 368 insertions(+), 5 deletions(-)
>   create mode 100644 linux-user/loongarch64/syscall_nr.h
>   create mode 100644 linux-user/loongarch64/target_syscall.h
>
> [snip]
>
> diff --git a/linux-user/loongarch64/target_syscall.h b/linux-user/loongarch64/target_syscall.h
> new file mode 100644
> index 0000000000..8b5de52124
> --- /dev/null
> +++ b/linux-user/loongarch64/target_syscall.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef LOONGARCH_TARGET_SYSCALL_H
> +#define LOONGARCH_TARGET_SYSCALL_H
> +
> +#include "qemu/units.h"
> +
> +/*
> + * this struct defines the way the registers are stored on the
> + * stack during a system call.
> + */
> +
> +struct target_pt_regs {
> +    /* Saved main processor registers. */
> +    target_ulong regs[32];
> +
> +    /* Saved special registers. */
> +    struct {
> +        target_ulong era;
> +        target_ulong badv;
> +        target_ulong crmd;
> +        target_ulong prmd;
> +        target_ulong euen;
> +        target_ulong ecfg;
> +        target_ulong estat;
> +    } csr;
> +    target_ulong orig_a0;
> +    target_ulong __last[0];
> +};
> +
> +#define UNAME_MACHINE "loongarch64"
> +#define UNAME_MINIMUM_RELEASE "5.19.0"
> +
> +#define TARGET_MCL_CURRENT 1
> +#define TARGET_MCL_FUTURE  2
> +#define TARGET_MCL_ONFAULT 4
> +
> +#define TARGET_FORCE_SHMLBA
> +
> +static inline abi_ulong target_shmlba(CPULoongArchState *env)
> +{
> +    return 64 * KiB;
> +}
> +
> +#endif
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 4587b62ac9..b5b9a02816 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -74,7 +74,7 @@
>       || defined(TARGET_M68K) || defined(TARGET_CRIS) \
>       || defined(TARGET_S390X) || defined(TARGET_OPENRISC) \
>       || defined(TARGET_NIOS2) || defined(TARGET_RISCV) \
> -    || defined(TARGET_XTENSA)
> +    || defined(TARGET_XTENSA) || defined(TARGET_LOONGARCH64)
>   
>   #define TARGET_IOC_SIZEBITS	14
>   #define TARGET_IOC_DIRBITS	2
> @@ -2084,8 +2084,9 @@ struct target_stat64  {
>       abi_ulong __unused5;
>   };
>   
> -#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) \
> -        || defined(TARGET_RISCV) || defined(TARGET_HEXAGON)
> +#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) || \
> +      defined(TARGET_RISCV) || defined(TARGET_HEXAGON) || \
> +      defined(TARGET_LOONGARCH64)
>   
>   /* These are the asm-generic versions of the stat and stat64 structures */
The finalized LoongArch system call interface doesn't include stat, 
fstat or newfstatat. So do we still have to pull in the definitions for 
stat structures?
>   
> @@ -2113,7 +2114,7 @@ struct target_stat {
>       unsigned int __unused5;
>   };
>   
> -#if !defined(TARGET_RISCV64)
> +#if !defined(TARGET_RISCV64) && !defined(TARGET_LOONGARCH64)
>   #define TARGET_HAS_STRUCT_STAT64
>   struct target_stat64 {
>       uint64_t st_dev;
Similarly here.
> @@ -2258,7 +2259,8 @@ struct target_statfs64 {
>   };
>   #elif (defined(TARGET_PPC64) || defined(TARGET_X86_64) || \
>          defined(TARGET_SPARC64) || defined(TARGET_AARCH64) || \
> -       defined(TARGET_RISCV)) && !defined(TARGET_ABI32)
> +       defined(TARGET_RISCV) || defined(TARGET_LOONGARCH64)) && \
> +       !defined(TARGET_ABI32)
>   struct target_statfs {
>   	abi_long f_type;
>   	abi_long f_bsize;
> diff --git a/scripts/gensyscalls.sh b/scripts/gensyscalls.sh
> index 8fb450e3c9..b69e1938ab 100755
> --- a/scripts/gensyscalls.sh
> +++ b/scripts/gensyscalls.sh
> @@ -99,4 +99,5 @@ generate_syscall_nr openrisc 32 "$output/linux-user/openrisc/syscall_nr.h"
>   generate_syscall_nr riscv 32 "$output/linux-user/riscv/syscall32_nr.h"
>   generate_syscall_nr riscv 64 "$output/linux-user/riscv/syscall64_nr.h"
>   generate_syscall_nr hexagon 32 "$output/linux-user/hexagon/syscall_nr.h"
> +generate_syscall_nr loongarch 64 "$output/linux-user/loongarch64/syscall_nr.h"
>   rm -fr "$TMP"

