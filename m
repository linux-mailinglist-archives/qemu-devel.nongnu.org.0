Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682273ADEF5
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:03:26 +0200 (CEST)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luy2m-0001uj-WB
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luy1c-00012h-NM
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:02:12 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:47725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luy1a-0006SX-RH
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:02:12 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7bJ5-1lvo1r2Mij-0083C8; Sun, 20 Jun 2021 16:02:06 +0200
Subject: Re: [PATCH v2 05/11] linux-user: Implement pivot_root
To: YAMAMOTO Takashi <yamamoto@midokura.com>, qemu-devel@nongnu.org
References: <20210531055019.10149-1-yamamoto@midokura.com>
 <20210531055019.10149-6-yamamoto@midokura.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <94ed3cf3-f73f-951b-d64a-d8d2a693d6ea@vivier.eu>
Date: Sun, 20 Jun 2021 16:02:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210531055019.10149-6-yamamoto@midokura.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/7YuJKiEIpjyiHKiFMpWVk+TsY9bhI88aBJfQkaq+EjH0vOsbyU
 0AcyZYOk6VzgBe5b7mG1jp+4qvYSCpwrZnDt6NQNKzBSPB8mAGxQGA9hw/qIKFHB7R2psu6
 c2iKnUAzyxFOpjPHyNxcONG0cb715zBW3TiejHaG/ghCqu20aF09+f8vCJy1heGWPINQFcz
 FMX9X2ctRDKkXoP7Yv0ow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KX5thkK/OOY=:GiAFaM2PSGl+pWKP9J/dnh
 ZbWIuQbT9Mnjt4TWdgrXOzrA0IZ9mghrrSAyNBgOpw0M8khbvLhRanaWnYFM3Jch8QRDjoGfc
 oQtewrPEtMFdem1ADpzIH0vwowIByD08F6sQF0599pDMcBGQ/fAiMsiATJOFkNbCBm8d185Tb
 amUiS4ldV0GL7piVz7H6GoWvJ48rK2vD1U7q89aBb/ZIoV0FLvgCdse4ILMHj3JcdiZgQc1dK
 1hn5D6/wQvsDprs6WZNk7PgdQsl4AwnvLoq97yc+fRr7LE2nMNxYlear5rM6NZMQhlEcKXuvI
 AzOgI3+d94YDCEFyV6dj63ccCGiBq+2WDPqb3LiHsSckQ6/+nQtLjtrMHVzEe7N6tI2JesrXS
 MmOJARsTeBPkKz1JUHLWmhsgaiTs5FzolKBWjN8dTgJCnd1787qhtwtFHFJaR1amTBIXae6jp
 A92aoKcJYP7moBDCdaworcqaaeNMc2G7jMPozOBiEKFRuQ0LNB/eXQ3TKcSeWyV+RWEYN/mDA
 nkB56kc88GgCMcER1qIakE=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

