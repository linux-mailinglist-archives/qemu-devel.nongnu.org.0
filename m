Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675DA5E85D8
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:24:55 +0200 (CEST)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obr6M-0003aE-H4
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqac-0000j3-5y
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:52:06 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:36211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqaa-0007F7-4h
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:52:05 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MOAmt-1ovzzk0ud7-00ObXJ; Fri, 23 Sep 2022 23:51:53 +0200
Message-ID: <cf267181-4bdf-6027-c9a3-8f8e60c5dee8@vivier.eu>
Date: Fri, 23 Sep 2022 23:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 4/5] linux-user: Passthrough MADV_DONTNEED for certain
 file mappings
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220906000839.1672934-1-iii@linux.ibm.com>
 <20220906000839.1672934-5-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220906000839.1672934-5-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:44z1BgJ1brFuwad00ig5iCDkF/KAQSNRHTdAqeAOol/khtUCNed
 IAU4PjUHxsAD7k/GVitQvADAEjgVpp4ZsmBLMq5fFSKoH23qhS96hUa8jFmdHYO0Z8gIPxv
 zxSvGPfAq21pFtWayyJHAmYdp5CABKJhpYS97OdaL0lFxIWsxJJsQJiTozWyCZ/NzchDCdZ
 dc4MmlAIDL9NC9GrQJaLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E5vpPuwUFp8=:XUH07qfpb5SIl+EIYTZYyd
 OBLKzoqFw33ej57ntD9afOaG6QW7YcjBW6Lay4l2vIN9H0NlJDANJEWJEsQ9OVL2NfSDa6uv5
 Hg3x+NrKRW1g5oK9QrEEHbNnFM5/MfuVS8JfX67VMo8XN2+yWi9Ks8QqjrbVcFCIT0NieKAij
 LW4ScUGYzwv30latTsJD2V2FBC/BcQqnZGgnmN0Xp9l2hPS8/YUAaoutfr5+v2EJzpXKD5rqJ
 WPj40tbBSuFNa0gbyvGL8gFXjBpGcaikhL5Mkl6+DsQna4CNHzkOffmzSJsyqtorKhzHZ3WxA
 we5LEn/9co0JAoq9cEBSYzfmOr8VC1DYwsi4F/fh0mDvIjEopXWTlIU29UaRy1CV42yL6/Woc
 /4MV0mB4E9HC/3Zr9zqGkmwXke64gLF4Qzuh/z5YpbstDGrE6X5JZmziE4f5U2ESmrAy41N7l
 V3gE5Z2KK7FYKPgpKMLzd4a/d8yKwGf3c+fKM8lBCWQAyQVg81blwDR4Gi49a7iQHFBGUX3tY
 TFcaZVjzvPG1jwoQMrlrZ3tpMIvYIo4ZXlhX16N3vCZ9gvCmdq3xiIn2SODCmCqKESxHs8N0C
 vT1MqkFGtFtUu9Hpna9/cpMs7hRm9O71ek6JJFwuxPhI6fbBbpxgEDULkVVIg5lqVsQUSgpbp
 pVNNU8uq5vYdPQcFm5caigKVPa7NPLri3wUG4Hyqj66ieuGrRLrU+PlPv6p95/pX2xJsjBQHp
 l0SIQkYd0bij48C79zsI4hKhZ6ZQ+RQphJwgn0eaEEl7DC8Fqr0Sa5rjAGQI7uyIpm7vZhn6T
 6kw1Fg9
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/09/2022 à 02:08, Ilya Leoshkevich a écrit :
> This is a follow-up for commit 892a4f6a750a ("linux-user: Add partial
> support for MADV_DONTNEED"), which added passthrough for anonymous
> mappings. File mappings can be handled in a similar manner.
> 
> In order to do that, mark pages, for which mmap() was passed through,
> with PAGE_PASSTHROUGH, and then allow madvise() passthrough for these
> pages. Drop the explicit PAGE_ANON check, since anonymous mappings are
> expected to have PAGE_PASSTHROUGH anyway.
> 
> Add PAGE_PASSTHROUGH to PAGE_STICKY in order to keep it on mprotect().
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20220725125043.43048-1-iii@linux.ibm.com>
> ---
>   accel/tcg/translate-all.c |  2 +-
>   include/exec/cpu-all.h    |  6 ++++++
>   linux-user/mmap.c         | 27 ++++++++++++++++++++++-----
>   3 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index b83161a081..a47cf38e38 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2263,7 +2263,7 @@ int page_get_flags(target_ulong address)
>   #ifndef PAGE_TARGET_STICKY
>   #define PAGE_TARGET_STICKY  0
>   #endif
> -#define PAGE_STICKY  (PAGE_ANON | PAGE_TARGET_STICKY)
> +#define PAGE_STICKY  (PAGE_ANON | PAGE_PASSTHROUGH | PAGE_TARGET_STICKY)
>   
>   /* Modify the flags of a page and invalidate the code if necessary.
>      The flag PAGE_WRITE_ORG is positioned automatically depending
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 491629b9ba..16b7df41bf 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -262,6 +262,12 @@ extern const TargetPageBits target_page;
>   #define PAGE_TARGET_1  0x0200
>   #define PAGE_TARGET_2  0x0400
>   
> +/*
> + * For linux-user, indicates that the page is mapped with the same semantics
> + * in both guest and host.
> + */
> +#define PAGE_PASSTHROUGH 0x0800
> +
>   #if defined(CONFIG_USER_ONLY)
>   void page_dump(FILE *f);
>   
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index a5f1ab129c..3a0f67619a 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -425,7 +425,8 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
>   abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>                        int flags, int fd, abi_ulong offset)
>   {
> -    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
> +    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len,
> +              passthrough_start = -1, passthrough_end = -1;
>       int page_flags, host_prot;
>   
>       mmap_lock();
> @@ -538,6 +539,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>               host_start += offset - host_offset;
>           }
>           start = h2g(host_start);
> +        passthrough_start = start;
> +        passthrough_end = start + len;
>       } else {
>           if (start & ~TARGET_PAGE_MASK) {
>               errno = EINVAL;
> @@ -620,6 +623,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>                        host_prot, flags, fd, offset1);
>               if (p == MAP_FAILED)
>                   goto fail;
> +            passthrough_start = real_start;
> +            passthrough_end = real_end;
>           }
>       }
>    the_end1:
> @@ -627,7 +632,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>           page_flags |= PAGE_ANON;
>       }
>       page_flags |= PAGE_RESET;
> -    page_set_flags(start, start + len, page_flags);
> +    if (passthrough_start == passthrough_end) {
> +        page_set_flags(start, start + len, page_flags);
> +    } else {
> +        if (start < passthrough_start) {
> +            page_set_flags(start, passthrough_start, page_flags);
> +        }
> +        page_set_flags(passthrough_start, passthrough_end,
> +                       page_flags | PAGE_PASSTHROUGH);
> +        if (passthrough_end < start + len) {
> +            page_set_flags(passthrough_end, start + len, page_flags);
> +        }
> +    }
>    the_end:
>       trace_target_mmap_complete(start);
>       if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
> @@ -846,7 +862,7 @@ static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
>       }
>   
>       for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
> -        if (!(page_get_flags(addr) & PAGE_ANON)) {
> +        if (!(page_get_flags(addr) & PAGE_PASSTHROUGH)) {
>               return false;
>           }
>       }
> @@ -888,8 +904,9 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>        * This is a hint, so ignoring and returning success is ok.
>        *
>        * This breaks MADV_DONTNEED, completely implementing which is quite
> -     * complicated. However, there is one low-hanging fruit: host-page-aligned
> -     * anonymous mappings. In this case passthrough is safe, so do it.
> +     * complicated. However, there is one low-hanging fruit: mappings that are
> +     * known to have the same semantics in the host and the guest. In this case
> +     * passthrough is safe, so do it.
>        */
>       mmap_lock();
>       if (advice == TARGET_MADV_DONTNEED &&
Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


