Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79422AFA9B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 22:39:21 +0100 (CET)
Received: from localhost ([::1]:58160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcxpo-0007GM-Qd
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 16:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxo3-0005zP-ER
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:37:31 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:41779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxo1-0005Zo-8E
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:37:31 -0500
Received: from [192.168.100.1] ([82.252.148.166]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MxDgm-1kNbiA2Stc-00xcfu; Wed, 11 Nov 2020 22:37:26 +0100
Subject: Re: [PATCH] linux-user: Prevent crash in epoll_ctl
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <a244fa67-dace-abdb-995a-3198bd80fee8@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9d19a93a-7fa9-6f71-7373-3ca13f5e973c@vivier.eu>
Date: Wed, 11 Nov 2020 22:37:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a244fa67-dace-abdb-995a-3198bd80fee8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OgIxUux9dBVbeKGwW/l6BcprYyJjloK/0H1QaARmSDXSEiU3Hp5
 1SvcwyuogvHWMlWfl3UfmEp6YCcVUcNLe2n9iYbvgjYq4mSGTMu/XGW+uJDgCDuaWBND9vx
 UmNMuWiWaUcoHGXC9EF7puxIL3Nt5Y7l5t0sXEVhaYhbMw4PMqTj17bhUxvaAj8gR/5oJld
 UPtQ1xZYu7u/KBfP20HfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vj/8wo/H25w=:Fj4843QHt2gvCneKrsfJWg
 vscaBb0SnTNxD1m4molF68/gBj/al39DsTkU4X+gGKlAToGzJw8oDvQ7cgbqtqEV05JKPTkha
 lnWwdlqts9Hjs6/kN+SqKHVj7McPHyqeR7mILWPEXGLTrFogL0OSnLsAFh7MfBf2MQl7S3JA5
 NLDLTca2WdLZnc39E5HXwCSBfkI4Svbgt3GeZmmtZ7C+ASXPkZxPn/juYxPVw+R8CoDDwDdlD
 kvJMfrTz0yQpBKenouA3M0777yeHFjGe2/h99qzUZ310ptpATW79uzyVG+wg3Azpanadnrch+
 /QWWSR9sAnCAJbCgcZRXsvVYN8rfSzcztAR50ff4rfvPwDiISC/Q3xffvZqkrP796W+ZFEB2i
 CnlDUn8KmJTc1e1EdkCe6ET38D1JFNwsdB6bc9fYbM4voF4xgOQ8OAOIpcMkwt1GkuS+jqaAa
 JOhx1OidQw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 16:37:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

Le 17/04/2020 à 17:34, LemonBoy a écrit :
> From 894bb5172705e46a3a04c93b4962c0f0cafee814 Mon Sep 17 00:00:00 2001
> From: Giuseppe Musacchio <thatlemon@gmail.com>
> Date: Fri, 17 Apr 2020 17:25:07 +0200
> Subject: [PATCH] linux-user: Prevent crash in epoll_ctl
> 
> The `event` parameter is ignored by the kernel if `op` is EPOLL_CTL_DEL,
> do the same and avoid returning EFAULT if garbage is passed instead of a
> valid pointer.
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  linux-user/syscall.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 674f70e70a..a51ff43f9b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -12020,17 +12020,25 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          struct epoll_event ep;
>          struct epoll_event *epp = 0;
>          if (arg4) {
> -            struct target_epoll_event *target_ep;
> -            if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
> -                return -TARGET_EFAULT;
> +            if (arg2 != EPOLL_CTL_DEL) {
> +                struct target_epoll_event *target_ep;
> +                if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                ep.events = tswap32(target_ep->events);
> +                /*
> +                 * The epoll_data_t union is just opaque data to the kernel,
> +                 * so we transfer all 64 bits across and need not worry what
> +                 * actual data type it is.
> +                 */
> +                ep.data.u64 = tswap64(target_ep->data.u64);
> +                unlock_user_struct(target_ep, arg4, 0);
>              }
> -            ep.events = tswap32(target_ep->events);
> -            /* The epoll_data_t union is just opaque data to the kernel,
> -             * so we transfer all 64 bits across and need not worry what
> -             * actual data type it is.
> +            /*
> +             * before kernel 2.6.9, EPOLL_CTL_DEL operation required a
> +             * non-null pointer, even though this argument is ignored.
> +             *
>               */
> -            ep.data.u64 = tswap64(target_ep->data.u64);
> -            unlock_user_struct(target_ep, arg4, 0);
>              epp = &ep;
>          }
>          return get_errno(epoll_ctl(arg1, arg2, arg3, epp));
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent


