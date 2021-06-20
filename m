Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB23ADEF7
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:07:06 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luy6L-0003es-Uc
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luy5K-0002td-8I
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:06:02 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:34531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luy5G-0007Yh-Is
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:06:02 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mc0Er-1lHmBP1G1P-00dagw; Sun, 20 Jun 2021 16:05:56 +0200
Subject: Re: [PATCH v2 05/11] linux-user: Implement pivot_root
To: YAMAMOTO Takashi <yamamoto@midokura.com>, qemu-devel@nongnu.org
References: <20210531055019.10149-1-yamamoto@midokura.com>
 <20210531055019.10149-6-yamamoto@midokura.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9550f9cd-cea1-ea7d-7ef2-fa8a6db4c91f@vivier.eu>
Date: Sun, 20 Jun 2021 16:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210531055019.10149-6-yamamoto@midokura.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pSYIThKH/W7YTY8uA5GJhbN80Q1Uy+hmH0YVeKi3hIJF4YTpWWY
 sMvlAA37lRgQN9iJ6bRqdL30SfZ1heT1ICNl0qrWDxaQHsJe4YOlPshvKqse5w6jBtq3gYa
 OUWPuf/v3j5mzg1cRwOOvpYcQbNhBJ2wV2mTT2R+8hOTSfATBgiZ2ii7Q/ebKKxLu3bh583
 IfoikuEv2TF+SBqft7+vg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Vo1HzEdTbc=:9wLDpAq9Y2N9wQkoRcTm8B
 N6ZNzjBT5Tv/4V9MoInY9cZ8H/BNlDrrW3vXUkqqtM5WtavbdgfeuBxBSSVDyjNBYy9coewK7
 w2MpIyMohJmp7PrnUzZfHNapa90cvYcxaxPN9RlQfwPm1Sa7Y7Gt/DOXvN4s1GZrkBBH4fnwo
 HNoyaaeEWNkwQOefXB2TmJhi68VS40pW+RapUVr4yLQUiETMBs0CTT9quvwwNJyoGT5X10SWS
 aP9nqu+JBusIQJbdPeUy4RUJhxk2qi5sABHnQhWeYp4yuxBHQlyNUnk5hR+BL+OESViSXkzsR
 IYdlw90qYRjk270ub+vHrn3mn0MBUpvIdCa6/ymsGgwhZ/PK7cpOxDZbQWmBclvFdcnrOBURV
 5tJYqmoU+zku/WX07z3ImC5C2cMCYBJA3gNKw8xovxc0wZhOClpqf0RlmwyuxhY7jlTAVRC8t
 TGATwHeq9xWx0S1PUXUh763biIw3foCMpudS3JCkmq1AdvhSIsLHP5PD6rrNWS1koYQBoGUUr
 UECkLfrxLCGmuYE8kGdeBI=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 31/05/2021 à 07:50, YAMAMOTO Takashi a écrit :
> Used by runc.
> 
> Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> ---
>  linux-user/syscall.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2947e79dc0..51144c6d29 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8254,6 +8254,10 @@ static int host_to_target_cpu_mask(const unsigned long *host_mask,
>      return 0;
>  }
>  
> +#if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
> +_syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
> +#endif
> +
>  /* This is an internal helper for do_syscall so that it is easier
>   * to have a single return point, so that actions, such as logging
>   * of syscall results, can be performed.
> @@ -13222,6 +13226,23 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return ret;
>  #endif
>  
> +#if defined(TARGET_NR_pivot_root)
> +    case TARGET_NR_pivot_root:
> +        {
> +            void *p2;
> +            p = lock_user_string(arg1); /* new_root */
> +            p2 = lock_user_string(arg2); /* put_old */
> +            if (!p || !p2) {
> +                ret = -TARGET_EFAULT;
> +            } else {
> +                ret = get_errno(pivot_root(p, p2));
> +            }
> +            unlock_user(p2, arg2, 0);
> +            unlock_user(p, arg1, 0);
> +        }
> +        return ret;
> +#endif
> +
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>          return -TARGET_ENOSYS;
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


