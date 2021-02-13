Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1595331AE27
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 22:39:10 +0100 (CET)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB2d8-0006Ju-Sa
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 16:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB2cD-0005lq-Sm; Sat, 13 Feb 2021 16:38:09 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:60789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB2cC-0000yx-4I; Sat, 13 Feb 2021 16:38:09 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MnJdC-1lchqc22Zo-00jIAr; Sat, 13 Feb 2021 22:37:50 +0100
Subject: Re: [PATCH] linux-user/elfload: munmap proper address in
 pgd_find_hole_fallback
To: Vincent Fazio <vfazio@xes-inc.com>, qemu-devel@nongnu.org
References: <20210131061849.12615-1-vfazio@xes-inc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <baa1fb36-5c57-cf18-0446-f9851ebd1aed@vivier.eu>
Date: Sat, 13 Feb 2021 22:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210131061849.12615-1-vfazio@xes-inc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PLZYq3jfAbdB15+w4o+JMdBhhMbqSyHQAdPhRdireryeesEUF7D
 rKRuvwnlNBKXp//DkaQPgEBJxyLypbsLwNq6Du5eedhj4GmYGkaul3g+QKypiCwqzTh1QOH
 ALbbaZ1pUyYVKtyzIIPUKM2Zj9mQIHOMSMsG30+F3AbSls+J/U26bDWSRJo+XKANVozwbuP
 b3j/gU3S9K1BnGkMW1ekA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BJCS+lPiEWA=:sli0ci3ItkdXOzetVg8zgF
 QlrckuBaY1cc6m/dQaOq2CUjWGrefQZRFXI5s/Ab1GTTB6mxUsrcbKwpbe5PmD2S9w1k0wk/e
 L2nu1N2LJ6zeb+oCNvRhhKAKrwIraptINeOIlcV14UC5f5YFJY4WpgJQLMFNACJEyjVBVr8fQ
 b2LHF7bFrmVDxvvv1HWJCgZV7BjLM+6bZa6wZbmbyMPksOTLbghqgFXB5mLQwYv4M7diELjk3
 DoqFC14cJIGC6nfrNOw0Jbxbbb3E/7b4OfctSAPWwyFiT+pihylBNfA6TNB71OciUZCpQsZN5
 JsjkvXEtRWOcFzAeydK0JnlyZK7XiM0q03+AatQ+joQRJUvdJZMlK0EvYJJe+Jxo/2IOEkeGA
 eSjWZsF30M4AatqcEX6nSGI9PnZkhVwchpSrCFnTlDgXyWnjULRo2fWWSHnv1IDT9/rd6M050
 PKlV2dypNw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vincent Fazio <vfazio@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/01/2021 à 07:18, Vincent Fazio a écrit :
> From: Vincent Fazio <vfazio@gmail.com>

Please, use the same email address to send your patch.

> 
> Previously, if the build host's libc did not define MAP_FIXED_NOREPLACE
> or if the running kernel didn't support that flag, it was possible for
> pgd_find_hole_fallback to munmap an incorrect address which could lead to
> SIGSEGV if the range happened to overlap with the mapped address of the
> QEMU binary.
> 
>   mmap(0x1000, 22261224, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0) = 0x7f889d331000
>   munmap(0x1000, 22261224)                = 0
>   --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x84b817} ---
>   ++ killed by SIGSEGV +++
> 
> Now, always munmap the address returned by mmap.
> 
> Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fallback")
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  linux-user/elfload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index a64050713f..5f5f23d2e5 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2216,7 +2216,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
>              void * mmap_start = mmap((void *) align_start, guest_size,
>                                       PROT_NONE, flags, -1, 0);
>              if (mmap_start != MAP_FAILED) {
> -                munmap((void *) align_start, guest_size);
> +                munmap(mmap_start, guest_size);
>                  if (MAP_FIXED_NOREPLACE != 0 ||
>                      mmap_start == (void *) align_start) {
>                      return (uintptr_t) mmap_start + offset;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

CC: Alex

Thanks,
Laurent

