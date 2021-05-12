Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E937BBA8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:18:56 +0200 (CEST)
Received: from localhost ([::1]:33208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmtD-0002IE-SF
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lgmq5-0006A2-KM
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:15:41 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:55479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lgmq1-0001hX-Cp
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:15:41 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MOzjW-1lsvtu2J0W-00PN1o; Wed, 12 May 2021 13:15:30 +0200
Subject: Re: [PATCH] linux-user: Add strace support for printing arguments of
 llseek
To: Kito Cheng <kito.cheng@sifive.com>, qemu-devel@nongnu.org,
 kito.cheng@gmail.com
References: <20210512101358.122781-1-kito.cheng@sifive.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b53d7a06-cc01-3ee4-4278-722ae2d363e1@vivier.eu>
Date: Wed, 12 May 2021 13:15:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512101358.122781-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QXUtp4Xtk6q7eIjp1zFDkTGWh0knwlcPqseH5x0a0JTSYw6BhxV
 rl81JoqTmbOob0zWqA8Kzzv0VugPTyijs2NqpJiATIR3rG440H5BTqnIyf0VCrnScLqizmB
 kgR7QWlqSktahWMO50KeiZWkufu5Yp4JtrsEc/sB0ICHPsJiQ5NMbkGlf4mURL+O5Do0WbK
 J4eVqdA/w+qDZcwsuXcUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nbfrPUvsSqY=:iv96QBv/GYPS/I2KD48f53
 k5S5rIUq9SWcUVA2zRWVkiAmKPmafNDoHzhLCpgzcQiTR4HA75PGH6g4OkxC5uu0d8z5q5TjS
 kM3ppF1OYx6DidHclAwleyS5q3wJzr4pLKtZnJ4QWMWLXxgr08m83DHCVnUv7n66qZM1adQn0
 FLdpIlhC4mNLydnwu4s6siYJLUu2FQr0Vki2c8Myqa/1cxAO4iKnfrl8BVqMLoUhu/AXBu4OV
 dQz6ZVGr1w7r0XoDyO5SAZNU77La5lwDzzRTo+kjoIx6riaex/xITJxwzqcdYERP/QDxx0WLH
 3H+V8UUUgDA5bxLPkBH45s6ITCMzKGkeb/ZRWyzFrah/TIDIUNkeZOgiDB99IGut9TjonSULI
 WbwyZoXWgnFMvsnuHAJKk1l+Wm5igfR/76JfMm7tYJ6uo1LCLSFY0nP527TbK0BxHOjDevjBP
 6qH4IJnfiaYwhmGlv1KXeOOIF3I5Bv4Lli6cFQF7MF9YvnbE1xgnAUK4J1bI/gSmmnbMkQiKU
 IftY/T1mG+qlC32r9WYj3k=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 12/05/2021 à 12:13, Kito Cheng a écrit :
> Some target are using llseek instead of _llseek like riscv,
> nios2, hexagon, and openrisc.
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  linux-user/strace.c    | 3 ++-
>  linux-user/strace.list | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index e969121b6c..4ebf85b063 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -2335,7 +2335,7 @@ print_linkat(void *cpu_env, const struct syscallname *name,
>  }
>  #endif
>  
> -#ifdef TARGET_NR__llseek
> +#if defined(TARGET_NR__llseek) || defined(TARGET_NR_llseek)
>  static void
>  print__llseek(void *cpu_env, const struct syscallname *name,
>                abi_long arg0, abi_long arg1, abi_long arg2,
> @@ -2355,6 +2355,7 @@ print__llseek(void *cpu_env, const struct syscallname *name,
>      qemu_log("%s", whence);
>      print_syscall_epilogue(name);
>  }
> +#define print_llseek print__llseek
>  #endif
>  
>  #ifdef TARGET_NR_lseek
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 084048ab96..46e1410836 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -511,6 +511,9 @@
>  #ifdef TARGET_NR__llseek
>  { TARGET_NR__llseek, "_llseek" , NULL, print__llseek, NULL },
>  #endif
> +#ifdef TARGET_NR_llseek
> +{ TARGET_NR_llseek, "llseek" , NULL, print_llseek, NULL },
> +#endif
>  #ifdef TARGET_NR_lock
>  { TARGET_NR_lock, "lock" , NULL, NULL, NULL },
>  #endif
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

