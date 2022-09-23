Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBE65E8519
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 23:45:17 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqTy-00048Z-8i
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 17:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqSr-0002Ld-7G
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:44:05 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:56401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqSp-0005pk-JU
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:44:04 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MVvCl-1ojrM40SGL-00RmtW; Fri, 23 Sep 2022 23:44:01 +0200
Message-ID: <fd15dad2-6371-9de2-c769-5d0eb580b5e4@vivier.eu>
Date: Fri, 23 Sep 2022 23:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: fix readlinkat handling with magic exe symlink
Content-Language: fr
To: Jameson Nash <vtjnash@gmail.com>, qemu-devel@nongnu.org
References: <20220808190727.875155-1-vtjnash@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220808190727.875155-1-vtjnash@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2wJyI+3EJh+3u07f/dTltz0Njd/HJBmdXxB4t8c+0NmqdH8ifEZ
 8mKX5Kg6f3grDkZaqeBPt8dJjxGHeBq7+M2i520AxKSjBr0tH+KzI+QHMDEnnM06q9pNnRf
 gOtiaC9947sygzV89FDhMNg26syMwwtvQ5EUPY0MMWt41iwtVmFLGoU6RyBYeDjq7pO38h+
 h9QZBSZchCm18dAHFF8Jw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GwRbllIa6m4=:3d6oyQHweLe+PCOZwcE0s0
 WlyItuwl7muYe8y5Vf9htaG9rPQoDWNqwYGstsHEHq6L6cG6Xhtof5z8sOgWcKUh5MoB9iR45
 eXnPba7uQ0p/AEDUe/+PJdm2VbhualMXWzeoQ/Dnk+1D5AagZWjzAl0ihMyIjm90shqBHITEW
 +8Jsc0Ky1SZ1GPnmzyQcup5xIXXPuxhA04FcYrAot1IV7F29jdhvtlcQfUEfRYbW8z0vxPxrL
 3Jh0tDrkL2FucdEJKA35A2SxWoMiW02GxwWGwf7eelVWPrLAWSCefdc+eBjwsWQdwoiHxnBwv
 urT9OeBFzAsnGpBw8eC5J+ajLMYc/aeWvELzSn/of88ZoY8KpXP033vFiOaDZoBJyAxpuFALM
 CMoXkqi3ABqbWJgncU9sAVOydaVumuo9KKRg+S5kBn+bj3/ACTUP2JGquhPf0GWnRNUwrD8EM
 LHzOu/257/slCoNsgoFsHfcXtmtl17BxTr3XJk9ws2CTFDhtlG0jO1a4hOpYBX5FzXhDm4kxd
 RoCQK/Oihn21MN7Pe2dxhEiFFXbRPNKpfz/yHbwUs3ZY/97ca8rHbLxiPQi3/AtSL2C8vvliM
 fBifXwMcmbFZq3j1KRAMQRhmEYWDB+V3ovFu77CVADvWswszhwXRYZCfKt0ge/cQeTzxn5nJC
 uN43I5VyoD6Eczln2O82UAcR2dGsA5uAoK2gasat8tKGEDZno2Q+HYnXDIVnF13ER3NUiWCwe
 leP1rlaYdSqHnmusfnUup6EK+cJtYfA3JXlCJKsNPaPa9dY+pVZLFW4zTSymCMnRBa7kiUJCi
 Ubj6vwU
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 08/08/2022 à 21:07, Jameson Nash a écrit :
> Exactly the same as f17f4989fa193fa8279474c5462289a3cfe69aea before was
> for readlink. I suppose this was simply missed at the time.
> 
> Signed-off-by: Jameson Nash <vtjnash@gmail.com>
> ---
>   linux-user/syscall.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ef53feb5ab..6ef4e42b21 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9894,11 +9894,22 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
>               if (!p || !p2) {
>                   ret = -TARGET_EFAULT;
> +            } else if (!arg4) {
> +                /* Short circuit this for the magic exe check. */
> +                ret = -TARGET_EINVAL;
>               } else if (is_proc_myself((const char *)p, "exe")) {
>                   char real[PATH_MAX], *temp;
>                   temp = realpath(exec_path, real);
> -                ret = temp == NULL ? get_errno(-1) : strlen(real) ;
> -                snprintf((char *)p2, arg4, "%s", real);
> +                /* Return value is # of bytes that we wrote to the buffer. */
> +                if (temp == NULL) {
> +                    ret = get_errno(-1);
> +                } else {
> +                    /* Don't worry about sign mismatch as earlier mapping
> +                     * logic would have thrown a bad address error. */
> +                    ret = MIN(strlen(real), arg4);
> +                    /* We cannot NUL terminate the string. */
> +                    memcpy(p2, real, ret);
> +                }
>               } else {
>                   ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
>               }

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


