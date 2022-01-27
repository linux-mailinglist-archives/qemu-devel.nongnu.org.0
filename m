Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F249649E3E0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:52:26 +0100 (CET)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5CL-00080U-QJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:52:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nD59u-00065Z-TD; Thu, 27 Jan 2022 08:49:54 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:45283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nD59s-00071k-HW; Thu, 27 Jan 2022 08:49:54 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Ml6du-1mYE113PQK-00lWRf; Thu, 27 Jan 2022 14:49:31 +0100
Message-ID: <4e110850-a303-d0a4-158b-6186367aa739@vivier.eu>
Date: Thu, 27 Jan 2022 14:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: fr
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>, qemu-devel@nongnu.org
References: <87y236lpwb.fsf@depni.sinp.msu.ru>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/alpha: Fix target rlimits for alpha and
 rearrange for clarity
In-Reply-To: <87y236lpwb.fsf@depni.sinp.msu.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YlyaTxdLBpF//PibthjhqWPQWY7WFPxyMhazuAvyUWGcYNLsL+P
 xan8VwEmKi1qFkf4h28ZJuzTldQJUDoFFE8SC59s1BODgqftzPAMMEChduJF41eUB7V0auS
 YLlY5lnAPrM6CDiwUFeEs2cTMvExGMUoZdpdSSkGVWRYMsC+BZMW4KmmT8vfV8DkaLuV42r
 0BgKt0Ir1sSZ+TtG3hAsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OTiKTavedYY=:X+19Uobf9q07hsclR53HOZ
 JIgkxBEouxxCvbjxgHZ61vwWAfF1kwWBfXfz4x5gw0eSPzAK81MY5TbKH2Gr+KNkZVABY6XAF
 XrvXbgwd5af4Xw/B13xgo81BGT2fK64djKLmYcD1KIaqUzG+moxzHjlZ6OnU5qCy1FK2LmCxc
 T2gku2exbQ8QNfS3rbM67B3Z2/E929kReWpb3UsneLnNenwmCJT9O5GmlVV5h+vGOWu7DV67S
 LEIIvn8zJgbKokA/pHf0q5yzf8TJjlJCXCXVohgBa2BWLIehqZJOy3553rmw+S1AtWnoYhXbq
 MoLrQiamwzkMrNSdCOFHtCQU8ssaby3CR6+j0K/uGgt/132AURFrT7STp3wECkn1uaNR7McN2
 5wriGpkHBSruZTKWXXKAaShPoU1jCfKVmuUhCF6+5qqVFtpoiC0m8pXPWH17+XmxZOeN9vWUF
 D7UXgjqhJOjJOvkUVMtwV63hkc1rB5MI4CWlPbC833c1walBhSH3gdyzVpkX2q8W0OItC/mvY
 zHtGo3vSFmjHEEBhZLhCBplNgImhqudCJYNFhLWZ5wiR8EFipE/rxE3zMQBzlTCwezCdy6k+k
 kRuLCvVMC/bz8fAhn7p95aqXYIjXnif7iLEvh9Pt30YlBLWuVtNwSz8CxaNwoMxyUeHMd1cyQ
 rhIDXvRQMDc0a6dmgG4SAfu0nh+JIngcvLWe1nHAgWJEGKTnY1K/yZ7XfnaZt+tx6yVU=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/01/2022 à 12:32, Serge Belyshev a écrit :
> Alpha uses different values of some TARGET_RLIMIT_* constants, which were
> missing and caused bugs like #577, fixed thus.  Also rearranged all three
> (alpha, mips and sparc) that differ from everyone else for clarity.
> 
> Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/577
> ---
>   linux-user/syscall_defs.h | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index f23f0a2178..3fcabaeae3 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -730,44 +730,41 @@ struct target_rlimit {
>   #define TARGET_RLIM_INFINITY	((abi_ulong)-1)
>   #endif
>   
> -#if defined(TARGET_MIPS)
>   #define TARGET_RLIMIT_CPU		0
>   #define TARGET_RLIMIT_FSIZE		1
>   #define TARGET_RLIMIT_DATA		2
>   #define TARGET_RLIMIT_STACK		3
>   #define TARGET_RLIMIT_CORE		4
> +#if defined(TARGET_MIPS)
> +#define TARGET_RLIMIT_NOFILE		5
> +#define TARGET_RLIMIT_AS		6
>   #define TARGET_RLIMIT_RSS		7
>   #define TARGET_RLIMIT_NPROC		8
> -#define TARGET_RLIMIT_NOFILE		5
>   #define TARGET_RLIMIT_MEMLOCK		9
> -#define TARGET_RLIMIT_AS		6
> -#define TARGET_RLIMIT_LOCKS		10
> -#define TARGET_RLIMIT_SIGPENDING	11
> -#define TARGET_RLIMIT_MSGQUEUE		12
> -#define TARGET_RLIMIT_NICE		13
> -#define TARGET_RLIMIT_RTPRIO		14
> -#else
> -#define TARGET_RLIMIT_CPU		0
> -#define TARGET_RLIMIT_FSIZE		1
> -#define TARGET_RLIMIT_DATA		2
> -#define TARGET_RLIMIT_STACK		3
> -#define TARGET_RLIMIT_CORE		4
> +#elif defined(TARGET_ALPHA)
> +#define TARGET_RLIMIT_RSS		5
> +#define TARGET_RLIMIT_NOFILE		6
> +#define TARGET_RLIMIT_AS		7
> +#define TARGET_RLIMIT_NPROC		8
> +#define TARGET_RLIMIT_MEMLOCK		9
> +#elif defined(TARGET_SPARC)
>   #define TARGET_RLIMIT_RSS		5
> -#if defined(TARGET_SPARC)
>   #define TARGET_RLIMIT_NOFILE		6
>   #define TARGET_RLIMIT_NPROC		7
> +#define TARGET_RLIMIT_MEMLOCK		8
> +#define TARGET_RLIMIT_AS		9
>   #else
> +#define TARGET_RLIMIT_RSS		5
>   #define TARGET_RLIMIT_NPROC		6
>   #define TARGET_RLIMIT_NOFILE		7
> -#endif
>   #define TARGET_RLIMIT_MEMLOCK		8
>   #define TARGET_RLIMIT_AS		9
> +#endif
>   #define TARGET_RLIMIT_LOCKS		10
>   #define TARGET_RLIMIT_SIGPENDING	11
>   #define TARGET_RLIMIT_MSGQUEUE		12
>   #define TARGET_RLIMIT_NICE		13
>   #define TARGET_RLIMIT_RTPRIO		14
> -#endif
>   
>   struct target_pollfd {
>       int fd;           /* file descriptor */

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

perhaps you could also add RLIMIT_RTTIME (15) and update target_to_host_resource()?

The next step would be to move the generic definitions to a new file in 
linux-user/generic/target_resource.h and the specific ones to linux-user/alpha, linux-user/mips and 
linux-user/sparc.

Thanks,
Laurent

