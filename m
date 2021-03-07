Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8803303DE
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 19:21:48 +0100 (CET)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIy2E-0004Sl-Hi
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 13:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIy17-0003pW-RW
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:20:37 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:49943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIy16-0005UT-07
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:20:37 -0500
Received: from [192.168.100.1] ([82.252.159.174]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MZT2u-1lE6pr1oqU-00WZ4D; Sun, 07 Mar 2021 19:20:33 +0100
Subject: Re: [PATCH] target/m68k: implement rtr instruction
To: qemu-devel@nongnu.org
References: <20210307180730.471165-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2b772041-1ef1-2a55-811a-413b69b93aec@vivier.eu>
Date: Sun, 7 Mar 2021 19:20:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307180730.471165-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Cfvcv54TQ0xSXIgFKZXPtICAZuZQZQJenNrbamBp9NENRFZVKaN
 tdz9kVNPTWSM/S8/n7V6ZkEIBMnkO/rCZXZGxtrFfUoLKv649eRTjl/gDgii7ChOx0+5737
 0mM7jwk2upjRmirVc4GsraHp+eNIfdkh8c0JWs52Cj0bZOh0UU2Nkj83H8Ss0g7LLR+R23o
 WEwgC4tofQE2+SuSB4Bxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fy7aOK2Bixs=:hr+eqNVGa+iwiazqZLhvAj
 kJxewSyqXIltnW5iueSZmelGBNQxOGct99r2UbqcXQ9j+bU//tMpqS35CgHzJp5KxqPBX68cQ
 Q5qgkAWAdcUsVYE3JlNqbRdNODVW/B3VcCwzV5SxDUJyocmkD8L7m0uGhzjZYz/JnLAZYoB/2
 5IelFoavR3wqwOkQ0vkhLN1U/yBAfaX+1kX3j2qMzxIpYfFt2M/RKhNb7/HfJZas1JxBs8dFi
 YrvzqofZGZtSE/xg8LU+KHTw6ITTUQApjsdM04XX5yrI0K0V6J4d1raHbjC6RKCRknGmorpkK
 w4RikRl5ylwFb7kehJiEg8fzFU9hVd/vAP2GZjjsgcUvIE4DWtm/9ZONMzyWSxD//XseDhoqP
 UxqbLY7FkXKeVljozwntuGWOOLBM6JUFxTDz+2s0UnmI6pTCWxd2NaRjTf69MdZJUFUyzygY0
 CgnONVWzFA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/03/2021 à 19:07, Laurent Vivier a écrit :
> This is needed to boot MacOS ROM.
> 
> Pull the condition code and the program counter from the stack.
> 
> Operation:
> 
>     (SP) -> CCR
>     SP + 2 -> SP
>     (SP) -> PC
>     (SP + 4) - > SP

This is in fact:

    SP + 4 -> SP

> 
> This operation is not privileged.
> 
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/m68k/translate.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index ac936ebe8f14..e6942955713c 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2969,6 +2969,20 @@ DISAS_INSN(rtd)
>      gen_jmp(s, tmp);
>  }
>  
> +DISAS_INSN(rtr)
> +{
> +    TCGv tmp;
> +    TCGv ccr;
> +
> +    ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
> +    gen_set_sr(s, ccr, true);
> +    tcg_temp_free(ccr);
> +    tcg_gen_addi_i32(QREG_SP, QREG_SP, 2);
> +    tmp = gen_load(s, OS_LONG, QREG_SP, 0, IS_USER(s));
> +    tcg_gen_addi_i32(QREG_SP, QREG_SP, 4);
> +    gen_jmp(s, tmp);
> +}
> +
>  DISAS_INSN(rts)
>  {
>      TCGv tmp;
> @@ -6015,6 +6029,7 @@ void register_m68k_insns (CPUM68KState *env)
>      BASE(nop,       4e71, ffff);
>      INSN(rtd,       4e74, ffff, RTD);
>      BASE(rts,       4e75, ffff);
> +    INSN(rtr,       4e77, ffff, M68000);
>      BASE(jump,      4e80, ffc0);
>      BASE(jump,      4ec0, ffc0);
>      INSN(addsubq,   5000, f080, M68000);
> 


