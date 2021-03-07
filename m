Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ECB330437
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 20:21:26 +0100 (CET)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIyxt-0001KM-Ci
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 14:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIyvc-0000ru-PY
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 14:19:00 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44082
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIyvb-0005Gy-5J
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 14:19:00 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIyvV-0004wn-Vx; Sun, 07 Mar 2021 19:18:57 +0000
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307182210.473111-1-laurent@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <10e2920f-cbd9-947f-c116-54bb2fe551aa@ilande.co.uk>
Date: Sun, 7 Mar 2021 19:18:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307182210.473111-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2] target/m68k: implement rtr instruction
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 07/03/2021 18:22, Laurent Vivier wrote:

> This is needed to boot MacOS ROM.
> 
> Pull the condition code and the program counter from the stack.
> 
> Operation:
> 
>      (SP) -> CCR
>      SP + 2 -> SP
>      (SP) -> PC
>      SP + 4 - > SP
> 
> This operation is not privileged.
> 
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> 
> Notes:
>      v2: update comment
>          SP + 4 -> SP
> 
>   target/m68k/translate.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index ac936ebe8f14..e6942955713c 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2969,6 +2969,20 @@ DISAS_INSN(rtd)
>       gen_jmp(s, tmp);
>   }
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
>   DISAS_INSN(rts)
>   {
>       TCGv tmp;
> @@ -6015,6 +6029,7 @@ void register_m68k_insns (CPUM68KState *env)
>       BASE(nop,       4e71, ffff);
>       INSN(rtd,       4e74, ffff, RTD);
>       BASE(rts,       4e75, ffff);
> +    INSN(rtr,       4e77, ffff, M68000);
>       BASE(jump,      4e80, ffc0);
>       BASE(jump,      4ec0, ffc0);
>       INSN(addsubq,   5000, f080, M68000);

Solves the issue for me, so:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

I also have a couple of other target/m68k patches from my experimental branch which 
are probably worth adding to an m68k PR. Let me go dig them out...


ATB,

Mark.

