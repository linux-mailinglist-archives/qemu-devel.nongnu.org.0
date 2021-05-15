Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C8381AC8
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:37:25 +0200 (CEST)
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li06G-0002WA-3c
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1li04i-0001lA-Ge
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:35:48 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:44363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1li04g-00054x-Hj
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:35:48 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2m7Q-1lL5PN3QVQ-0139Au; Sat, 15 May 2021 21:35:41 +0200
Subject: Re: [PATCH v2] linux-user: strace now handles unshare syscall args
 correctly
To: Matus Kysel <mkysel@tachyum.com>
References: <20210406144203.1020598-1-mkysel@tachyum.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <117b1ef0-6d9a-62c4-6340-99e873de46b9@vivier.eu>
Date: Sat, 15 May 2021 21:35:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406144203.1020598-1-mkysel@tachyum.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8FruhCoLPpEKv1wQoJ48kzxISSMKcZ3uV29Rrsm0edCJ+jpzLx7
 tokFoGcrtDlFakAe5EL0ZxPk1SE1QY4zQ+OclFKeCGREvCFQDgWxAYtw34ucgYK4UyOzU+E
 Gjrz5Gf2Qp9JcBvPJl9IU6Z74BFdRRLIyTkqtLT0zf0LMc669FWGw04kxFvnSbhAQ6eMIHV
 OAtWc0f5pwsZLTEXVx6zA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m4WeVi9lq0E=:eBefkbfFbi/F3+6uSwSfLO
 VDxZzuYCGp6UDrhQXpTaxbIBBlIMALKXVHzJD9g7+i3muYQ+0AnDruoJ8cyK0ntEJOadcK4nU
 osPUdBfZvPYMS0uHTFJlupx3B+ST4VQHz5IC+3+adceJItzqnor1/41M2RBMik2yNgjV3oxku
 CLyhjoehUUpHLMMKh1I+4hpZDbVkDQAoLIGNdSi9Yz124Bm/TS9pXeEx1JK9fi45w6ezo+muB
 UMsPCnczK9iaozs6t/VxAaPRbKeBfgIU5s5G0I48G345NgX2KiOjleEiWuKBiJ5MAOGlPCGjp
 K52IVUMRIxZnVP17hoYlTzLmOIWRxpYEJj/YSSnyqj+joKCiNoMfZKqO/OjAxdRM004lvw+Bq
 aPta4xoF5jJeCuQw0E5XZneat0vj+3/Dd7Me1pyYg32Q8J1h561/S2alGtREqEjtaze+ghC/Q
 cJvER2Y/huVUCxy7rHeHivjkDAKX+xGqfwkEl7unml3Q+javEkoKlR3tg0vuaKwg4c+ABw0MN
 5WwRybLCdXodwYH3XRgCV0=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


