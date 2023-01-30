Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96A680E0E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:52:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTeE-0006V6-0V; Mon, 30 Jan 2023 07:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMTe7-0006Qt-Ih
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:52:27 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMTe5-0008K1-4C
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:52:27 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDQqk-1pTaf13gZS-00AYtO; Mon, 30 Jan 2023 13:52:18 +0100
Message-ID: <48b2576b-815e-a942-6001-604ae51b9545@vivier.eu>
Date: Mon, 30 Jan 2023 13:52:17 +0100
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
X-Provags-ID: V03:K1:eaQ3qnbVFongLzClrdF6Nd2xrX5FBCBHYw/GCcHkHqBCcfDdnLB
 W7BXaZoV9yabfdRrVtJxsTBPJL69bmCmmqeeWNWvEGTBvyG2zItFVJdjLfmFP4eyj60qdaK
 aPg6/WlRLp2kDUV3W8ZXYldxpcEYyfqW01EcM+HBTTCWG9Zh1D2dkwQS3itJcCHnkY1AxuP
 vX8SICJkWTbQowJh5G5Hw==
UI-OutboundReport: notjunk:1;M01:P0:S5jvCVjqgN0=;bJnjihWO3cGiywNRi58Yy387PUU
 K/q/ABvlbD1RRWDD7kFT2XTOTlYeCP5nK4fEYWTkrfuSPewxSEbbwYLg1Pse2TvjeO3v2PdXb
 Y2NIcR29OCQLEpx5C6tp/52HmUTrLWSEpGwQtXF0EGEp8rRWL+ABMvhALEQ5veimOWUchjBvU
 g0i/oI5kh6u3fPORT2LLbvUpNnjtmM626TabOwRfL7L4nORIHamEoGaQaHIbfqZFVJoJB1mLk
 GVaxP6S78HUZgF8yfKuvN7ptkK+Rvk3shBdjufQZQluGWjV2Q6fIWvcypR4HtGjajh24eqEoQ
 vnYbNLpR4I1kmnIny1FIMgXDvaTxweUNPqBkhDrfx0qtxvlMqIdWWHOo/0gQ9GnnO3y/+G2xX
 qUJ8OEBopZXpIH0jsUOaRqOqc3XD1BE1j9idu3q29hbZB4vuqzv3+ALulJuMvx6IXh4DMEuip
 dMe7qVsyT6myiAkpH5OA4vymYlCGr0/399OgRfmy/nXlJKiNRBG7tU2Y4C9gAe8x9owyOkLRy
 LXT7iJ3vAXt8eJfiZeBU38qPbN6gOD6KHpWwifvXwnTvFCys7uDGGar8YDSO6FyBgzUBQXn6Z
 CR0KFPCHYd0ytggagiuGw32ite9fQbFG4yWoVl/mk4KfG/v3OlVQXtJFghZj6ZymLgEo3z4EP
 jmWqYHTXx3wj6Mhu6LkRqN46N5Q4ilhizN6vu4mB6g==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


