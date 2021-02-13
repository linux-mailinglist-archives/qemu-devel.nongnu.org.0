Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483531AE66
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:01:39 +0100 (CET)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB3v0-0003Lp-2x
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3ss-0002Lf-UK; Sat, 13 Feb 2021 17:59:26 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3sr-000062-8f; Sat, 13 Feb 2021 17:59:26 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N30VJ-1lsKa20DBF-013N3r; Sat, 13 Feb 2021 23:59:19 +0100
Subject: Re: [PATCH] linux-user: Add support for pivot_root syscall
To: David Leonard <David.Leonard@digi.com>, qemu-trivial@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
References: <alpine.DEB.2.22.394.2010121712560.2113823@davidl>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1ff5917b-1a93-9115-2ed8-c333a35f2e44@vivier.eu>
Date: Sat, 13 Feb 2021 23:59:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2010121712560.2113823@davidl>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pVY0C0zkN4JLyo71bo6CkQZIZ0nxStkzZTpS4APEmKNxmnbD23Y
 t5A6s7+fUYDjHILxTt2i2iKGP6PpX7LJpFNSQHI3h65U3fa01J3ftYUR0qJ9vDm6Nob8UyD
 aWU7zM/RzWkPJPYrPwWDe4TIGtOpWUt5+HMa77vtDRWuRj/tQ42aZ9nDPgjmqaU8/n8FaaI
 YaiGw3eFCeH+IRe6RKcYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h/tROLFvYGM=:4tbvr9kv/4bInD6M8bF8gr
 IppQhZ4bakLNPmK4Sp1/Pj7PVkDn49MoxcxYGOQYsTZQa2k3R+DjuISuODqvUbVXjnUcjrd+j
 jV1S30rrmeDP3mDNOp01h9WF3WtgKLSzCrbKiV8kb+HyvCNpQHw+1Mw5ONCX1tP7rCpBxxBHr
 /0H7VxmJxcrpNeVlhjcRdrn2sEBZfX5x8N3SYOwTHiUIF/7DU17AQX7TiYy8JJaLp5B3ssXMi
 5RWASiS6N6gFZjCHmPn1mW+YtcpFJU7aUe+vPuSWFP6BEXYPdcmbJhQliLBTSsAijGNeZhmVy
 7AboMVodkZ+U5jicdXvgPWwj3t0LFYskM/XjMcwEerox9D95rzaiSwNCjr0KYVMJMQzZE/Euh
 PF2vLkTfyvRMhjEFd63ueyZPYeuUVgBad8JVtfqh7CpmpvVdS61y8zExqhmXa4FNZJ6JtHg5z
 1efm2WsmHw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 12/10/2020 à 09:14, David Leonard a écrit :
> 
> Tested on Ubuntu 20.04 x86_64 against arm-linux-gnueabi toolchain.
> 
> Signed-off-by: David Leonard <David.Leonard@digi.com>
> ---
>  linux-user/syscall.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 897d20c076..8143c8c280 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -345,6 +345,10 @@ _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
>            unsigned long, idx1, unsigned long, idx2)
>  #endif
> 
> +#if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
> +_syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
> +#endif
> +
>  /*
>   * It is assumed that struct statx is architecture independent.
>   */
> @@ -8834,6 +8838,22 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          ret = get_errno(umount2(p, arg2));
>          unlock_user(p, arg1, 0);
>          return ret;
> +#endif
> +#if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
> +    case TARGET_NR_pivot_root:
> +        {
> +            void *p2;
> +            p  = lock_user_string(arg1);
> +            p2 = lock_user_string(arg2);
> +            if (!p || !p2) {
> +                ret = -TARGET_EFAULT;
> +            } else {
> +                ret = get_errno(pivot_root(p, p2));
> +            }
> +            unlock_user(p2, arg2, 0);
> +            unlock_user(p, arg1, 0);
> +        }
> +        return ret;
>  #endif
>      case TARGET_NR_ioctl:
>          return do_ioctl(arg1, arg2, arg3);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Please, re-send you patch to qemu-devel@nongnu.org

Thanks,
Laurent

