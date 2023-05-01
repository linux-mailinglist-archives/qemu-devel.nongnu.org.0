Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EBE6F3327
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:49:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVlF-0003mP-Al; Mon, 01 May 2023 11:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVlD-0003lv-6b
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:48:19 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVlB-0000ih-IG
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:48:18 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mdf3x-1qSIPe1quf-00ZfLN; Mon, 01 May 2023 17:48:15 +0200
Message-ID: <c847739a-6a9a-82ea-93c8-c77d09f21953@vivier.eu>
Date: Mon, 1 May 2023 17:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] linux-user: Don't require PROT_READ for mincore
Content-Language: fr
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230422100314.1650-1-thomas@t-8ch.de>
 <20230422100314.1650-3-thomas@t-8ch.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230422100314.1650-3-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A5SNWCUrpUxPJn+6ypeVA/vvKnPvyFBUpwJ7iGDtoXIgm5QgfEr
 UQ7aS0y8YvXmR2ek0CKlbi0aMqRz1CJ95fhqHTj6YNfQRRehxIJNFAgH6YAHCuB7gLh2ytq
 Jh6hT8j6o5Emtfx223lIqrJq8imDFj9fsxRp6QsqobRUnXCIvWv3IHpB5LO1gWlRF6x0bwi
 DUpCaZ52DO47NirXrnqmQ==
UI-OutboundReport: notjunk:1;M01:P0:LHZzAsCRsto=;N5KnrqZumHxRhobFHWVleEbY4cQ
 fJYMiAtzVv+ZJttq1NSFsIMf1HZP9A4WEVQSkkyqZtMm3gc4CA4aOTJ925mWUT0S+d8inRkPw
 ISaCFs1+bt3FI8xJDBNoh1eTV1fmF9GtXmOaydrZymgYei8N2tk1uNXWUHbvQZ0Uyj0TSmXi2
 SwtGbcFrurieCoEpzPTxNzj/5z0A3dUbA4aM36w2grPtb0IHJBJ6kgCq2CIPfsJ3pncxapD1B
 V/txi//0bln0/Xadi36KutzjY5MZLq8oY5+aZJMZn56Z3X0BxyHrjEDptnqFNypCK7FrkumWj
 6Ib1WCe0wGV/evF7sOPbCZX8wCqfEz111gLlY762oR7h1wR/Qe83w1uy5HKFdhwz8+r4deQM3
 TFwTumx0q1gPPzLKSKEi1k/wgtj8OXSVws8mB2ddx5+39BIltUeQVHyeCz53A0iX+wlRv6gcQ
 T735W3BUShJcCHTC5kNG/0Weanrrv5mw4HAVCPcl3WANBx98SGd5dTPQIGDdFQaNxR6GC7Xd6
 HirIIqj+v7HA05qaQlWhCu4C7byhz5zlfwVOuN7k5kdAoOkXywLrq7sm39WQJoq3/fDkK0Rxz
 4n0AwQEHTweXBCpp+wiO3kUJXQ9nMx5XU7imIF4BBlVv6/LucykGteJ+doBP9LFBv7GLFRK+A
 WOeTAKSKUc7tlTIuXirlzxJLEMtodAsMJDoxD3thDQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/04/2023 à 12:03, Thomas Weißschuh a écrit :
> The kernel does not require PROT_READ for addresses passed to mincore.
> For example the fincore(1) tool from util-linux uses PROT_NONE and
> currently does not work under qemu-user.
> 
> Example (with fincore(1) from util-linux 2.38):
> 
> $ fincore /proc/self/exe
> RES PAGES  SIZE FILE
> 24K     6 22.1K /proc/self/exe
> 
> $ qemu-x86_64 /usr/bin/fincore /proc/self/exe
> fincore: failed to do mincore: /proc/self/exe: Cannot allocate memory
> 
> With this patch:
> 
> $ ./build/qemu-x86_64 /usr/bin/fincore /proc/self/exe
> RES PAGES  SIZE FILE
> 24K     6 22.1K /proc/self/exe
> 
> Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> ---
>   linux-user/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98c8..5ec848b459f7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11897,7 +11897,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   #ifdef TARGET_NR_mincore
>       case TARGET_NR_mincore:
>           {
> -            void *a = lock_user(VERIFY_READ, arg1, arg2, 0);
> +            void *a = lock_user(VERIFY_NONE, arg1, arg2, 0);
>               if (!a) {
>                   return -TARGET_ENOMEM;
>               }

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


