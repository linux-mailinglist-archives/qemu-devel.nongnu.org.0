Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C42DCF67
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:20:05 +0100 (CET)
Received: from localhost ([::1]:38366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqOC-000453-QZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpqNA-0003O0-Op
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:19:00 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:38959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpqN5-0003wZ-4e
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:19:00 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MybX9-1jtTXx06aD-00z0GL; Thu, 17 Dec 2020 11:18:32 +0100
Subject: Re: [PATCH 1/4] linux-user/mips64: Restore setup_frame() for o32 ABI
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <61685704-c22e-b1ee-cf7d-5f92a397d2b9@vivier.eu>
Date: Thu, 17 Dec 2020 11:18:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119161710.1985083-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3groLGuM3OIWshRLE2NcXbcL1/YLiOUGhCOt3B3H6RO7Q69yNz4
 Ac6Od49EKRxIDXaAx8qo91+E+gUdhumz5h/SXd2eRG8t5NRy2+VBNgPNX3QnJGrsgTlgFV7
 Gi+Vydkez7YPRGW8MTTG3Ux4zLW+HDReUkG0MMyhF8CZHSUNC7Jhykiy79mBAWsIpYES0f9
 GpIhurMrzm3VyhqeiiN0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FNysP64iO5I=:QzYwS1GlTHQzUx7CygZXB+
 hst3vasCCy8w30y1FYPwJ5Pv0of+dql3HeLhB1I+fucfJVd6vK6sntlKVAsAzT7JSaQ7PJBSK
 dP9Ag4hLxSAUmm0qyJ/3n+5wkAlZlRqyzLKpFeaOM1n6LcHF0WiWjqXmCx9ZouFxCF6pAN0z6
 zF3d1mkSqCaSbhHNKG4Gj1OjdspnWkSIpBzxGasUWOIOXkMug0rz6O/Lg/LmqWgMEv7CpQGbK
 z6GHRdoE7FaaHwIENpnXcbM/bZ0P4/D9g/v6wdqrd3n6/F7KZ5e/KkKly3p5DQaVMz2otyn47
 qkB2nKJhHaupdlVtDijrZpkzFaZDQacA0eCfZDPr6rg9KXXJ74zkF7rYVwqp0RdXVXLn3EVBq
 Fe2ONVlwEBhmYPBOoQ8+jnuQIGSngDxd9/XxxvzLgdUjCeVAfoHy/vIO8tslqzpy4qOo0hLd1
 gTqquxuobg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/11/2020 à 17:17, Philippe Mathieu-Daudé a écrit :
> 64-bit MIPS targets lost setup_frame() during the refactor in commit
> 8949bef18b9. Restore it declaring TARGET_ARCH_HAS_SETUP_FRAME, to be
> able to build the o32 ABI target.
> 
> Fixes: 8949bef18b9 ("linux-user: move mips/mips64 signal.c parts to mips directory")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/mips64/target_signal.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
> index 799f7a668cd..f1f0ed7f706 100644
> --- a/linux-user/mips64/target_signal.h
> +++ b/linux-user/mips64/target_signal.h
> @@ -67,4 +67,8 @@ typedef struct target_sigaltstack {
>  #define TARGET_MINSIGSTKSZ    2048
>  #define TARGET_SIGSTKSZ       8192
>  
> +#if defined(TARGET_ABI_MIPSO32)
> +/* compare linux/arch/mips/kernel/signal.c:setup_frame() */
> +#define TARGET_ARCH_HAS_SETUP_FRAME
> +#endif
>  #endif /* MIPS64_TARGET_SIGNAL_H */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

