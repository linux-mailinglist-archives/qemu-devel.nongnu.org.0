Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C92DD030
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:14:19 +0100 (CET)
Received: from localhost ([::1]:60136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprEg-0002ki-Df
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprDh-0002IE-2G
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:13:17 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:38797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprDf-0006s3-9p
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:13:16 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mlvr3-1kOjsS3M9r-00izbr; Thu, 17 Dec 2020 12:13:11 +0100
Subject: Re: [PATCH] linux-user: Implement copy_file_range
To: Andreas Schwab <schwab@suse.de>, qemu-devel@nongnu.org
References: <mvm361eer3n.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <245c836a-3d06-ef97-383d-95d36ec9d8ff@vivier.eu>
Date: Thu, 17 Dec 2020 12:13:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <mvm361eer3n.fsf@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PZuq9Mj+ilbbSteYmCosY/MN9qeD1dJII8FDINzw0YXpf9q2KG5
 zrtZZ2dnLkHf6DFUq250RWYe5WIxVrP0f/8MTPEGpDV/3a/8/PaIGVAY5I2ChSW+3pxHu34
 Is3QLss8mh4Znb5I9NWh7d+X5EMbe+w7m+ZSUDcrXDXdp43//UT9OiMDj/mgBRgfqYq5+BM
 aeniMTEayNH49KDDFPdOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iHkoYJ2Cxec=:lXxzUE1uA5UvWFParlvi/B
 ewrKL/eTWi2R18XwLuchF90pkPNfEb1dvvw3kxIpeq6xTpSDtQLgUsjmK55oZAqeScibiiYYQ
 XNV149QFXG9HEK4wxMF3AAfeS4qqHulEaK3M+/kaBPDyaleAqnQOtRei8CDQEzlU9RxNn0PD1
 lmcn/8vkr66t9r296RZgCY8XmTNvXSQZu1SaxsMjzSwMLwAEwtlhsqo1UbXsX9qXfKsobyx1Y
 Sw3MfKsxQ17GdeL0KKIfpb3EXgwUSas87v1Y4IB5hq3xOHBEHAOW39x8N73m0K/uhN0fCDHQd
 ehvfQtNAABHRxWI8fiiqFRsUUq4ymWdPq+MkDF/iEuYZP11IFmeC40nmOtngYp9oKEZ2dTDxE
 dHg70XEDu4KvO5Nqxdr9dYKLiI+PMtXXeGxC3b/FLCok5lPrLT9L9IlSpmyCdzG1zPHOzvebl
 SmZ8gUDmDg==
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/11/2020 à 12:45, Andreas Schwab a écrit :
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/syscall.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 3160a9ba06..c3373af4c7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -813,6 +813,12 @@ safe_syscall5(int, mq_timedsend, int, mqdes, const char *, msg_ptr,
>  safe_syscall5(int, mq_timedreceive, int, mqdes, char *, msg_ptr,
>                size_t, len, unsigned *, prio, const struct timespec *, timeout)
>  #endif
> +#if defined(TARGET_NR_copy_file_range) && defined(__NR_copy_file_range)
> +safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
> +              int, outfd, loff_t *, poutoff, size_t, length,
> +              unsigned int, flags)
> +#endif
> +
>  /* We do ioctl like this rather than via safe_syscall3 to preserve the
>   * "third argument might be integer or pointer or not present" behaviour of
>   * the libc function.
> @@ -13057,6 +13063,40 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return get_errno(membarrier(arg1, arg2));
>  #endif
>  
> +#if defined(TARGET_NR_copy_file_range) && defined(__NR_copy_file_range)
> +    case TARGET_NR_copy_file_range:
> +        {
> +            loff_t inoff, outoff;
> +            loff_t *pinoff = NULL, *poutoff = NULL;
> +
> +            if (arg2) {
> +                if (get_user_u64(inoff, arg2)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                pinoff = &inoff;
> +            }
> +            if (arg4) {
> +                if (get_user_u64(outoff, arg4)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                poutoff = &outoff;
> +            }
> +            ret = get_errno(safe_copy_file_range(arg1, pinoff, arg3, poutoff,
> +                                                 arg5, arg6));
> +            if (arg2) {
> +                if (put_user_u64(inoff, arg2)) {
> +                    return -TARGET_EFAULT;
> +                }
> +            }
> +            if (arg4) {
> +                if (put_user_u64(outoff, arg4)) {
> +                    return -TARGET_EFAULT;
> +                }
> +            }
> +        }
> +        return ret;
> +#endif
> +
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>          return -TARGET_ENOSYS;
> 

Applied to my branch linux-user-for-6.0, modified not to copy back offset when there is an error.

Thanks,
Laurent

