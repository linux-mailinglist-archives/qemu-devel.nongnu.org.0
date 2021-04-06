Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0035568F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:25:29 +0200 (CEST)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTme0-0008Kv-F8
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lTmcY-0007nR-Fb
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:23:58 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lTmcW-000081-LW
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:23:58 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPXlM-1lH51A0a7G-00MdwN; Tue, 06 Apr 2021 16:23:50 +0200
Subject: Re: [PATCH] linux-user: strace now handles unshare syscall args
 correctly
To: Matus Kysel <mkysel@tachyum.com>
References: <20210406141113.922634-1-mkysel@tachyum.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0705f55b-8346-ddef-4d1d-4cfd232b15a4@vivier.eu>
Date: Tue, 6 Apr 2021 16:23:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406141113.922634-1-mkysel@tachyum.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iQj2Q1jMGAG1qalazWo6jcEmHU2n+qDWtmrT5AAR8n4Dv4OW3hl
 gYPjdXXazGFqEEXXgftZfMTOl9xRuIOEbqSayGkleKIsQObycYntxaHAUgV4wf1WIxzIdCX
 AUqqjvQdTP6Sh3hCp48g7Pn0AtbKB8fzb+PMxhWVSXLCnl4D2NdRhCltS4ZCmXXSCx9R5ee
 soAREWt+E/atxDmjLH1aA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kupQpRqJwFg=:oS3g/arEjJE4i+9Lr2TRiA
 dSDRCH0vi1XsRUaojBOzjm49CtynlPh4ZhQwmE14K6iqKl+KT9TJuFJE1XLKmf621kIACXVQI
 v2rfJXCYfuE7DwSH6eqGlre80zMF2G8iyVqgJSJZVtcCHMQu4V6sMdLXOUqg25zg7JkxiZgsl
 wFzkQVbm18Z6LGZxBukRWFXN6uiYu/IAb6p5BsEmtqqpl7yy4Ryfz7db9TMIdidYbMRCM76AG
 FvP3yjKBMCctv4WKK0G6jzPNLbl/l2YUrYZJ5D+nAI3W1s3HKcHCjVKKoJw1Y32ErmMUTcQmm
 BLterWfW2zmgkNO8p06WuPOkisDf1t2HO0we3lm2WK0vQjdkrDVsDu0hu2N5lS+8nCVv5TMxK
 iv+sx00jXTsz67O6cBimUuIIbWiAHyNdTzZQKxjjyEXxHjpYIHxDNnbWnKQVfT0iV/8KiPHyR
 GNUlTnS38j3C+O+1paWWT0Yqr8XtuavtnjOLj/rZ/NTa73XR+4FR
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

Le 06/04/2021 à 16:11, Matus Kysel a écrit :
> Syscall unshare did not have custom print function for strace, but it's argument is same as flags in clone syscall, so it can be easily implemented.
> 
> Signed-off-by: Matus Kysel <mkysel@tachyum.com>
> ---
>  linux-user/strace.c    | 12 ++++++++++++
>  linux-user/strace.list |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index e969121b6c..d48df8c1a9 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3467,6 +3467,18 @@ print_unlinkat(void *cpu_env, const struct syscallname *name,
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

While you are at it, you can also update the clone_flags list
(at least CLONE_NEWTIME and CLONE_NEWCGROUP are missing)

Thansk,
Laurent


