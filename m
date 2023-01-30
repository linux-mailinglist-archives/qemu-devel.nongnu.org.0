Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89FD680E14
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTfC-0007XO-Lh; Mon, 30 Jan 2023 07:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMTez-0007Mm-Pd
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:53:28 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMTey-0008Tw-26
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:53:21 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MgNlH-1oizIs02N5-00hwcG; Mon, 30 Jan 2023 13:53:13 +0100
Message-ID: <0dd3092b-cc5b-a4fb-08fb-06169e0e6ee0@vivier.eu>
Date: Mon, 30 Jan 2023 13:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Add emulation for MADV_WIPEONFORK and
 MADV_KEEPONFORK in madvise()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Vitaly Buka <vitalybuka@google.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y5iwTaydU7i66K/i@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y5iwTaydU7i66K/i@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/9pPLQ+iX2NlbVyWwHtxleXUuOiGxXf1lm/YuPADwvUNode3Le/
 TeY2KqP/suEPZ8ita6fEUIJUyyahs4e8lKTCFt7UN2Q/nzl4LxqFqVmDcrpDjDBcNV6kH9D
 kZwoVZECR4iSPfyVYr1/bOd8xuQPOfHC5OGIw6KXv3uDWzDcXgyDw0mO75tW2mtyoK3qJzU
 rmba97NIMGQIT2I4xrZdw==
UI-OutboundReport: notjunk:1;M01:P0:LhZCO6QjjSg=;sPAddn5ODISog8Z/OHbjsG9sQwk
 5CazZmhNhU6pmTbO/a9m92GnZU9DSFQMhQbF7uyf+RSuHONkLyuR26990o48Tb7htKFZIv04u
 uGy6ISOHMw9xMFP80ALAn+kSLTDYdScwssKTeIdEr+Pa4nWvQmMTNSOVw5PVJppd0xqM+wW4p
 TwncExXziggzIkLYKt8xYvF08hrDu9HwjTqbnghYZ/Szm//xzVgh2Rjq2wHULsdwOuKLt1nQr
 sk/Dh/kmJ2waIlb6CWK67RQeGJ0167mMpfnDReiUbxdzF21duoIWilj7PJfhv6EAGBjpWG9lK
 VBBw3spuC/sSvpbhdi74jOQWWarMaj+cDLdIpSqlaswWRG5smMsehO9fQSey6T3WDcFo6gvlk
 9BcGnu2t/6fkhiEcCSJD3JwEWrtsP7qT5TgOCP7OZBoaqWXhPO9cH36uijBuxXOFsK86hmtAu
 gssnP3CyC5tHFptAf1NakFHpsIh/Y9d7gtwRubEIZitphBrH7Bqbw3D76qVggdoTXVFMJfE29
 FDF2F808VhZGzS5fkYQHJmHuVYzLxyKrmZg7mZrOA75mCGXsDFHKTaNTZM70DmJhEQRmBJg9/
 Uxc57EMR/xntaCIEzi4xiSSgcIaXWOfGKBeObCfd0wPT0HQjj97NFRbLT8Udw9TKR5sNEH4QW
 dFNRza8VjC+9Rkn4EfPzO/JHIm5NhxD6YYZ0JApqLQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

Le 13/12/2022 à 18:03, Helge Deller a écrit :
> Both parameters have a different value on the parisc platform, so first
> translate the target value into a host value for usage in the native
> madvise() syscall.
> 
> Those parameters are often used by security sensitive applications (e.g.
> tor browser, boringssl, ...) which expect the call to return a proper
> return code on failure, so return -EINVAL if qemu fails to forward the
> syscall to the host OS.
> 
> While touching this code, enhance the comments about MADV_DONTNEED.
> 
> Tested with testcase of tor browser when running hppa-linux guest on
> x86-64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> v2: based on feedback from Ilya Leoshkevich <iii@linux.ibm.com>
> - rename can_passthrough_madv_dontneed() to can_passthrough_madvise()
> - rephrase the comment about MADV_DONTNEED
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 10f5079331..28135c9e6a 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -857,7 +857,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>       return new_addr;
>   }
> 
> -static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
> +static bool can_passthrough_madvise(abi_ulong start, abi_ulong end)
>   {
>       ulong addr;
> 
> @@ -901,23 +901,53 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>           return -TARGET_EINVAL;
>       }
> 
> +    /* Translate for some architectures which have different MADV_xxx values */
> +    switch (advice) {
> +    case TARGET_MADV_DONTNEED:      /* alpha */
> +        advice = MADV_DONTNEED;
> +        break;
> +    case TARGET_MADV_WIPEONFORK:    /* parisc */
> +        advice = MADV_WIPEONFORK;
> +        break;
> +    case TARGET_MADV_KEEPONFORK:    /* parisc */
> +        advice = MADV_KEEPONFORK;
> +        break;
> +    /* we do not care about the other MADV_xxx values yet */
> +    }
> +
>       /*
> -     * A straight passthrough may not be safe because qemu sometimes turns
> -     * private file-backed mappings into anonymous mappings.
> +     * Most advice values are hints, so ignoring and returning success is ok.
> +     *
> +     * However, some advice values such as MADV_DONTNEED, MADV_WIPEONFORK and
> +     * MADV_KEEPONFORK are not hints and need to be emulated.
>        *
> -     * This is a hint, so ignoring and returning success is ok.
> +     * A straight passthrough for those may not be safe because qemu sometimes
> +     * turns private file-backed mappings into anonymous mappings.
> +     * can_passthrough_madvise() helps to check if a passthrough is possible by
> +     * comparing mappings that are known to have the same semantics in the host
> +     * and the guest. In this case passthrough is safe.
>        *
> -     * This breaks MADV_DONTNEED, completely implementing which is quite
> -     * complicated. However, there is one low-hanging fruit: mappings that are
> -     * known to have the same semantics in the host and the guest. In this case
> -     * passthrough is safe, so do it.
> +     * We pass through MADV_WIPEONFORK and MADV_KEEPONFORK if possible and
> +     * return failure if not.
> +     *
> +     * MADV_DONTNEED is passed through as well, if possible.
> +     * If passthrough isn't possible, we nevertheless (wrongly!) return
> +     * success, which is broken but some userspace programs fail to work
> +     * otherwise. Completely implementing such emulation is quite complicated
> +     * though.
>        */
>       mmap_lock();
> -    if (advice == TARGET_MADV_DONTNEED &&
> -        can_passthrough_madv_dontneed(start, end)) {
> -        ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
> -        if (ret == 0) {
> -            page_reset_target_data(start, start + len);
> +    switch (advice) {
> +    case MADV_WIPEONFORK:
> +    case MADV_KEEPONFORK:
> +        ret = -EINVAL;
> +        /* fall through */
> +    case MADV_DONTNEED:
> +        if (can_passthrough_madvise(start, end)) {
> +            ret = get_errno(madvise(g2h_untagged(start), len, advice));
> +            if ((advice == MADV_DONTNEED) && (ret == 0)) {
> +                page_reset_target_data(start, start + len);
> +            }
>           }
>       }
>       mmap_unlock();
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


