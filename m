Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B282B3556F8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:48:35 +0200 (CEST)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTn0M-00073L-N3
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lTmy5-0005lY-5x
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:46:13 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:46473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lTmy3-0004pK-D4
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:46:12 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MK3eC-1l9NUu351K-00LVVU; Tue, 06 Apr 2021 16:46:06 +0200
Subject: Re: [PATCH v2] linux-user: strace now handles unshare syscall args
 correctly
To: Matus Kysel <mkysel@tachyum.com>
References: <20210406144203.1020598-1-mkysel@tachyum.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a5930034-94bc-80e9-0bee-d2f33cb8f6fc@vivier.eu>
Date: Tue, 6 Apr 2021 16:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406144203.1020598-1-mkysel@tachyum.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:655ucsW/sdcUEZWCEIXPi/gxR/OTlsb4zIhAoHcwk39i/6203le
 u0H7g8GAlAAk4lnr1xoCqxEBILZsjvMZAQo1v400i9v9zpYrkDYZEKNKnAKlSbIGuX+e8pb
 GParRfhycwFjlG2vueZha2p3Tyzw5PGW//Zijzjs4+D5X8FmkNDQFckYAx/0dpD+M/B9UNl
 e9D3LrrfZ7eFQP6hiBw8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JKD52o91dfM=:54GVswMmhIOMhe57VR4bih
 7AmqzWGRdYnYJZtTJOR3fLn/JyY+XF9t/STpXbX/f2fXOh0AGUKpZmCc4PBtnuFhLKtEINmeT
 YwObaMhzuvd1130rID+iLbLsE55nFtLMHEanEV/KFrprvPR+XUA693VPDWxdtaVL7zNNECV/2
 F+nrUobincBqTtiuRyn16yk0DmtmRb5JCapbPE06QUgs43IqD/Q+iWNuX7BpdtHVfygzHvsSm
 I0qwgcwLgEqqAptqlHgNcB1H6AStFgsmFn9sFSTyLqCu9Hpw51cwjIHWDlHckqSdeUyBw6SPk
 sYYKp44g4dTOUVxp5YsYYR7kkFTflfwJfcRn5dDhU3VdxCBDXrkKwEFTTxnfgy0wz5ybR9W6j
 RoBHvW4jGdodwkq3gYo74JmMRgcmnm8dbOiQUleYU/PPwl7sA2rhaOVp9r4IKaNNattIh8qu0
 sjZb0IogaAH3gb+dGjCYqY6a1D+Zrxty8RYw5KpjtjhuC+imQ71s
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/04/2021 à 16:42, Matus Kysel a écrit :
> Syscall unshare did not have custom print function for strace, but it's argument is same as flags in clone syscall, so it can be easily implemented.
> Also updated missing flags from clone_flags.
> 
> Signed-off-by: Matus Kysel <mkysel@tachyum.com>
> ---
>  linux-user/strace.c    | 18 ++++++++++++++++++
>  linux-user/strace.list |  2 +-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index e969121b6c..1cadb6d50f 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1109,6 +1109,12 @@ UNUSED static struct flags clone_flags[] = {
>  #if defined(CLONE_NEWNET)
>      FLAG_GENERIC(CLONE_NEWNET),
>  #endif
> +#if defined(CLONE_NEWCGROUP)
> +    FLAG_GENERIC(CLONE_NEWCGROUP),
> +#endif
> +#if defined(CLONE_NEWTIME)
> +    FLAG_GENERIC(CLONE_NEWTIME),
> +#endif
>  #if defined(CLONE_IO)
>      FLAG_GENERIC(CLONE_IO),
>  #endif
> @@ -3467,6 +3473,18 @@ print_unlinkat(void *cpu_env, const struct syscallname *name,
>  }
>  #endif
> 
> +#ifdef TARGET_NR_unshare
> +static void
> +print_unshare(void *cpu_env, const struct syscallname *name,
> +              abi_long arg0, abi_long arg1, abi_long arg2,
> +              abi_long arg3, abi_long arg4, abi_long arg5)
> +{
> +    print_syscall_prologue(name);
> +    print_flags(clone_flags, arg0, 1);
> +    print_syscall_epilogue(name);
> +}
> +#endif
> +
>  #ifdef TARGET_NR_utime
>  static void
>  print_utime(void *cpu_env, const struct syscallname *name,
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 084048ab96..3b7c15578c 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1573,7 +1573,7 @@
>  { TARGET_NR_unlinkat, "unlinkat" , NULL, print_unlinkat, NULL },
>  #endif
>  #ifdef TARGET_NR_unshare
> -{ TARGET_NR_unshare, "unshare" , NULL, NULL, NULL },
> +{ TARGET_NR_unshare, "unshare" , NULL, print_unshare, NULL },
>  #endif
>  #ifdef TARGET_NR_userfaultfd
>  { TARGET_NR_userfaultfd, "userfaultfd" , NULL, NULL, NULL },
> --
> 2.25.1
> 
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

