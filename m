Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E7553978
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 20:23:43 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3iXO-0008Mn-2H
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 14:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3iVL-00077N-Ep
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:21:35 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3iVJ-0001eO-8s
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:21:35 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTzve-1oC4VL1Prm-00Qzhx; Tue, 21 Jun 2022 20:21:25 +0200
Message-ID: <ba304f26-e7cb-a74f-fbd3-f410452681e5@vivier.eu>
Date: Tue, 21 Jun 2022 20:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] linux-user: Add partial support for MADV_DONTNEED
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Simon Hausmann <Simon.Hausmann@qt.io>, Chris Fallin <chris@cfallin.org>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20220621144205.158452-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220621144205.158452-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1gkRmIP9F+cgoiCtRH3nqax6rHpeqUx/7kaXijzVo/qrBL3L98k
 c+TKpgblC4/h2UCk2f0Qetu2Tswzo0mk5lVpPhdVW6NP9tOb2njp01NenNDJGlEWSBGHl7f
 jkpyEwdoTbhhHtrZPvL+WEeSlG2rn8bn73Tf1kxi/i3hAPLUzvotj2inSwOGpIcIAGIGiik
 MGvVV0qAiQGBJ+z9SxK+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OhEoyIGGmWs=:+TwaO0VlRdNL6xkXUrXCTB
 GS+5hHT4MfkLsBLGI3QTK1570z8muoQBlekMuUbNjaF4hAVEVQgsRYjOhlp+udR/cQduz1baM
 pn1a2g/qo+DvStBhbi8s2bs/eRFs06t+sod/8w6HmgewuqfgvTnqG4GRNibGL8VJLO7BxbAVC
 jH9c4lRwC7NKqxKKrm86su8Tum2J64xLltAog1igkwp14/2/bq1am8LTaPhdqPlu9vGZ0wyeN
 2Lzhalwq/aMcEh3QLapjvZ3SFcE64vPYmX3TmzYpCFF1ykREUAoxRhMXK+E4k5Zs9MQWDYkAq
 RImr6feX7SmSAzpVI3Mp51xax1ZZixEMkJ5pQaQyBjGtBz9XLhWfC+U3ADUFcTDZZt7SE/zTa
 Qv5hzFYDorFpLgMdxMs2fuzrldi/GUgxOnWMoGfyGaLrqevts6w9IMZGel7Rctbw+OcHEuea2
 9OfSa4UEETlfyD/8+czyohqA/THhwizmTv3T8dRV+o3jF+/PgnH8gbH/CLClbPtmOT4R7tuhx
 ueucpgaB+NmoljGuwYHzzlpezqEBg+7afMMJjOR/91qamp4SoptNgBif9kucOXk28BMY7mxaL
 4iP0JzBNAhXYQ03wYjxytXWh98Ru4gzhvruCVtP4Gfc8NFe/f+Dr6gc4zal3OG2cMQelJql9v
 k6AV1DjivBoNZ38o9Vy3HNO4VjDQos5bLuHrCp0A6dAzaEPbYBLLZIavE7mSbEinoan7+55mx
 smdq36sX/Wkvkiz2IImhbeelK9H+mgwzbbRbQg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 21/06/2022 à 16:42, Ilya Leoshkevich a écrit :
> Currently QEMU ignores madvise(MADV_DONTNEED), which break apps that
> rely on this for zeroing out memory [1]. Improve the situation by doing
> a passthrough when the range in question is a host-page-aligned
> anonymous mapping.
> 
> This is based on the patches from Simon Hausmann [2] and Chris Fallin
> [3]. The structure is taken from Simon's patch. The PAGE_MAP_ANONYMOUS
> bits are superseded by commit 26bab757d41b ("linux-user: Introduce
> PAGE_ANON"). In the end the patch acts like the one from Chris: we
> either pass-through the entire syscall, or do nothing, since doing this
> only partially would not help the affected applications much. Finally,
> add some extra checks to match the behavior of the Linux kernel [4].
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/326
> [2] https://patchew.org/QEMU/20180827084037.25316-1-simon.hausmann@qt.io/
> [3] https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/ci/qemu-madvise.patch
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/madvise.c?h=v5.19-rc3#n1368
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg03572.html
> v1 -> v2:
> * Make get_errno() extern.
> * Simplify errno handling (Laurent).
> 
>   linux-user/mmap.c           | 64 +++++++++++++++++++++++++++++++++++++
>   linux-user/syscall.c        |  8 ++---
>   linux-user/user-internals.h |  1 +
>   linux-user/user-mmap.h      |  1 +
>   4 files changed, 68 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 48e1373796..4e7a6be6ee 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -835,3 +835,67 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>       mmap_unlock();
>       return new_addr;
>   }
> +
> +static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
> +{
> +    ulong addr;
> +
> +    if ((start | end) & ~qemu_host_page_mask) {
> +        return false;
> +    }
> +
> +    for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
> +        if (!(page_get_flags(addr) & PAGE_ANON)) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
> +{
> +    abi_ulong len, end;
> +    int ret = 0;
> +
> +    if (start & ~TARGET_PAGE_MASK) {
> +        return -TARGET_EINVAL;
> +    }
> +    len = TARGET_PAGE_ALIGN(len_in);
> +
> +    if (len_in && !len) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    end = start + len;
> +    if (end < start) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    if (end == start) {
> +        return 0;
> +    }
> +
> +    if (!guest_range_valid_untagged(start, len)) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    /*
> +     * A straight passthrough may not be safe because qemu sometimes turns
> +     * private file-backed mappings into anonymous mappings.
> +     *
> +     * This is a hint, so ignoring and returning success is ok.
> +     *
> +     * This breaks MADV_DONTNEED, completely implementing which is quite
> +     * complicated. However, there is one low-hanging fruit: host-page-aligned
> +     * anonymous mappings. In this case passthrough is safe, so do it.
> +     */
> +    mmap_lock();
> +    if ((advice & MADV_DONTNEED) &&
> +        can_passthrough_madv_dontneed(start, end)) {
> +        ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
> +    }
> +    mmap_unlock();
> +
> +    return ret;
> +}
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f55cdebee5..8f68f255c0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -538,7 +538,7 @@ static inline int target_to_host_errno(int target_errno)
>       }
>   }
>   
> -static inline abi_long get_errno(abi_long ret)
> +abi_long get_errno(abi_long ret)
>   {
>       if (ret == -1)
>           return -host_to_target_errno(errno);
> @@ -11807,11 +11807,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   
>   #ifdef TARGET_NR_madvise
>       case TARGET_NR_madvise:
> -        /* A straight passthrough may not be safe because qemu sometimes
> -           turns private file-backed mappings into anonymous mappings.
> -           This will break MADV_DONTNEED.
> -           This is a hint, so ignoring and returning success is ok.  */
> -        return 0;
> +        return target_madvise(arg1, arg2, arg3);
>   #endif
>   #ifdef TARGET_NR_fcntl64
>       case TARGET_NR_fcntl64:
> diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
> index 6175ce53db..0280e76add 100644
> --- a/linux-user/user-internals.h
> +++ b/linux-user/user-internals.h
> @@ -65,6 +65,7 @@ abi_long do_syscall(CPUArchState *cpu_env, int num, abi_long arg1,
>                       abi_long arg8);
>   extern __thread CPUState *thread_cpu;
>   G_NORETURN void cpu_loop(CPUArchState *env);
> +abi_long get_errno(abi_long ret);
>   const char *target_strerror(int err);
>   int get_osversion(void);
>   void init_qemu_uname_release(void);
> diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
> index d1dec99c02..480ce1c114 100644
> --- a/linux-user/user-mmap.h
> +++ b/linux-user/user-mmap.h
> @@ -25,6 +25,7 @@ int target_munmap(abi_ulong start, abi_ulong len);
>   abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>                          abi_ulong new_size, unsigned long flags,
>                          abi_ulong new_addr);
> +abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice);
>   extern unsigned long last_brk;
>   extern abi_ulong mmap_next_start;
>   abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


