Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184FB6AE25E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:28:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYI6-0002pa-Uk; Tue, 07 Mar 2023 09:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZYI4-0002hP-9n
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:27:44 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZYI2-0006Zu-Em
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:27:44 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPGBR-1pwJnN1baP-00PcwR; Tue, 07 Mar 2023 15:27:40 +0100
Message-ID: <81ed9998-832b-34f3-2fe5-9677310d303a@vivier.eu>
Date: Tue, 7 Mar 2023 15:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] linux-user: Fix brk() to release pages
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20221223101626.19215-1-deller@gmx.de> <Y6YXrFe9r95MKqno@p100>
 <Y6gId80ek49TK1xB@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y6gId80ek49TK1xB@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BNVujMhxEe2o7S11eIfOsFaI8hWeyEIVbVck+fdF1Dno/IQ6gPQ
 yp6sTXP1Ool26ZV5WsGyyW6yJfImqTcq8jXTe56YQ9JrwYVzwHZ6F0YSM+4LTYnJnCshNFC
 QxtA+ryL5yoRgbYaJhukRwF/mFI03sMxfKBQXU0Sn2M5KJnGLtuP037cdzhOs3OJ6SQXJxD
 dp/XJWCVl/NDWiO+RUG7w==
UI-OutboundReport: notjunk:1;M01:P0:jlZVw+scE+8=;8A0TuIdB2yBW8QUIOg6njViiIWv
 ELynnCB7pvPiDUSB6mRY2TT+s2V1JWcK97hm872dxdL7IQ2YrjWPfNFH+v73WNyiqkU8NUZjt
 LlD+YwN4KfeuyJllqIB7HvE8Bi9WliXQDeu0Bt8+ZNgepGhasAStDifc4VW8Q22ornD1PTjhC
 /i8Yv16PXvP95rWeESnKxDaVYVSBAzfIfvOkS5O4MPTtxFlfMhy14larDpr4EP4LJ/mPKL1MS
 fVd0UZBfGnTz+bkJXe1UsxraDF6IzlwKwGAF3IbYMX0frWaCebUPXfxLLcoFQnQroIzRFSphm
 DFwEvP1lGZjR+THqMb9qBCBr/HtYJdV4uWErYiOU54YitQ9f9DkosKZepOCOXt+p6VFvNYciU
 PrLysiO6kNNebmRvlNyvRt0RtZTSvndA9bmER6ve+NoTxyuxsCcDATbj39Fr92pztP96LK3C3
 klR3blfDYVqoE31y+yChVWvj5eEmlQmpxpIR5+jcV0ksfQ3eo3iUUlSw6YQb94/3UCtHJesp+
 Zn5wzhU/V5eSHuKOxixT+n+obkylTWloEuJLDqCSeLn0mLafw4cDvUIoY0VvlFswLPkBcRIaM
 VIKhj+fpxos3bOZCtjFR94XU39Hd32FwcYEU8NL+waDc14IU9Rq6J2j79gNZsxf9A56QlLMMx
 m6ipAcCOaD3f4ON/KKLf/52QMhILZtdLqSCHHkhqDQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 25/12/2022 à 09:23, Helge Deller a écrit :
> The current brk() implementation does not de-allocate pages if a lower
> address is given compared to earlier brk() calls.
> But according to the manpage, brk() shall deallocate memory in this case
> and currently it breaks a real-world application, specifically building
> the debian gcl package in qemu-user.
> 
> Fix this issue by reworking the qemu brk() implementation.
> 
> Tested with the C-code testcase included in qemu commit 4d1de87c750, and
> by building debian package of gcl in a hppa-linux guest on a x86-64
> host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> v3:
> - Fixed one bug where page aligned address was returned instead
>    of requested address.
> - Dropped debug info which is partly outdated now
> - Reduced number of changed lines in diff compared to v2 to make
>    diff easier readable
> - Fixed changelog of v2
> v2:
> - Fixed return value of brk(). The v1 version wrongly page-aligned
>    the provided address, while userspace expects an unmodified
>    address returned.
> 
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 4fee882cd7..7d28802aa6 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -838,49 +838,52 @@ static inline int host_to_target_sock_type(int host_type)
>   }
> 
>   static abi_ulong target_brk;
> -static abi_ulong target_original_brk;
>   static abi_ulong brk_page;
> 
>   void target_set_brk(abi_ulong new_brk)
>   {
> -    target_original_brk = target_brk = HOST_PAGE_ALIGN(new_brk);
> +    target_brk = new_brk;
>       brk_page = HOST_PAGE_ALIGN(target_brk);
>   }
> 
> -//#define DEBUGF_BRK(message, args...) do { fprintf(stderr, (message), ## args); } while (0)
> -#define DEBUGF_BRK(message, args...)
> -
>   /* do_brk() must return target values and target errnos. */
> -abi_long do_brk(abi_ulong new_brk)
> +abi_long do_brk(abi_ulong brk_val)
>   {
>       abi_long mapped_addr;
>       abi_ulong new_alloc_size;
> +    abi_ulong new_brk, new_host_brk_page;
> 
>       /* brk pointers are always untagged */
> 
> -    DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);
> -
> -    if (!new_brk) {
> -        DEBUGF_BRK(TARGET_ABI_FMT_lx " (!new_brk)\n", target_brk);
> +    /* return old brk value if brk_val unchanged or zero */
> +    if (!brk_val || brk_val == target_brk) {
>           return target_brk;
>       }
> -    if (new_brk < target_original_brk) {
> -        DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk < target_original_brk)\n",
> -                   target_brk);
> +
> +    new_brk = TARGET_PAGE_ALIGN(brk_val);
> +    new_host_brk_page = HOST_PAGE_ALIGN(brk_val);
> +
> +    /* brk_val and old target_brk might be on the same page */
> +    if (new_brk == TARGET_PAGE_ALIGN(target_brk)) {
> +        if (brk_val > target_brk) {
> +            /* empty remaining bytes in (possibly larger) host page */
> +            memset(g2h_untagged(target_brk), 0, new_host_brk_page - target_brk);
> +        }
> +        target_brk = brk_val;
>           return target_brk;
>       }
> 
> -    /* If the new brk is less than the highest page reserved to the
> -     * target heap allocation, set it and we're almost done...  */
> -    if (new_brk <= brk_page) {
> -        /* Heap contents are initialized to zero, as for anonymous
> -         * mapped pages.  */
> -        if (new_brk > target_brk) {
> -            memset(g2h_untagged(target_brk), 0, new_brk - target_brk);
> -        }
> -	target_brk = new_brk;
> -        DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk <= brk_page)\n", target_brk);
> -	return target_brk;
> +    /* Release heap if necesary */
> +    if (new_brk < target_brk) {
> +        /* empty remaining bytes in (possibly larger) host page */
> +        memset(g2h_untagged(brk_val), 0, new_host_brk_page - brk_val);
> +
> +        /* free unused host pages and set new brk_page */
> +        target_munmap(new_host_brk_page, brk_page - new_host_brk_page);
> +        brk_page = new_host_brk_page;
> +
> +        target_brk = brk_val;
> +        return target_brk;
>       }
> 
>       /* We need to allocate more memory after the brk... Note that
> @@ -889,10 +892,14 @@ abi_long do_brk(abi_ulong new_brk)
>        * itself); instead we treat "mapped but at wrong address" as
>        * a failure and unmap again.
>        */
> -    new_alloc_size = HOST_PAGE_ALIGN(new_brk - brk_page);
> -    mapped_addr = get_errno(target_mmap(brk_page, new_alloc_size,
> +    new_alloc_size = new_host_brk_page - brk_page;
> +    if (new_alloc_size) {
> +        mapped_addr = get_errno(target_mmap(brk_page, new_alloc_size,
>                                           PROT_READ|PROT_WRITE,
>                                           MAP_ANON|MAP_PRIVATE, 0, 0));
> +    } else {
> +        mapped_addr = brk_page;
> +    }
> 
>       if (mapped_addr == brk_page) {
>           /* Heap contents are initialized to zero, as for anonymous
> @@ -904,10 +911,8 @@ abi_long do_brk(abi_ulong new_brk)
>            * then shrunken).  */
>           memset(g2h_untagged(target_brk), 0, brk_page - target_brk);
> 
> -        target_brk = new_brk;
> -        brk_page = HOST_PAGE_ALIGN(target_brk);
> -        DEBUGF_BRK(TARGET_ABI_FMT_lx " (mapped_addr == brk_page)\n",
> -            target_brk);
> +        target_brk = brk_val;
> +        brk_page = new_host_brk_page;
>           return target_brk;
>       } else if (mapped_addr != -1) {
>           /* Mapped but at wrong address, meaning there wasn't actually
> @@ -915,10 +920,6 @@ abi_long do_brk(abi_ulong new_brk)
>            */
>           target_munmap(mapped_addr, new_alloc_size);
>           mapped_addr = -1;
> -        DEBUGF_BRK(TARGET_ABI_FMT_lx " (mapped_addr != -1)\n", target_brk);
> -    }
> -    else {
> -        DEBUGF_BRK(TARGET_ABI_FMT_lx " (otherwise)\n", target_brk);
>       }
> 
>   #if defined(TARGET_ALPHA)
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


