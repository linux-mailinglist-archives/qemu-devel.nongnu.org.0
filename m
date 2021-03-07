Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481643303F0
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 19:30:46 +0100 (CET)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIyAv-0006sO-BH
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 13:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lIy9g-0006QP-Ch
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:29:28 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:16971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lIy9d-0007m1-91
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:29:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5E5867456E3;
 Sun,  7 Mar 2021 19:29:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2CA167456B4; Sun,  7 Mar 2021 19:29:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2B0A77456B7;
 Sun,  7 Mar 2021 19:29:16 +0100 (CET)
Date: Sun, 7 Mar 2021 19:29:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] target/m68k: implement rtr instruction
In-Reply-To: <20210307182210.473111-1-laurent@vivier.eu>
Message-ID: <9d56c4f0-ea97-e5bb-8630-bcb2f6d7d5b5@eik.bme.hu>
References: <20210307182210.473111-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 7 Mar 2021, Laurent Vivier wrote:
> This is needed to boot MacOS ROM.
>
> Pull the condition code and the program counter from the stack.
>
> Operation:
>
>    (SP) -> CCR
>    SP + 2 -> SP
>    (SP) -> PC
>    SP + 4 - > SP

Doesn't look like the commit message was fixed, there's still a space 
there.

Regards,
BALATON Zoltan

> This operation is not privileged.
>
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>
> Notes:
>    v2: update comment
>        SP + 4 -> SP
>
> target/m68k/translate.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index ac936ebe8f14..e6942955713c 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2969,6 +2969,20 @@ DISAS_INSN(rtd)
>     gen_jmp(s, tmp);
> }
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
> DISAS_INSN(rts)
> {
>     TCGv tmp;
> @@ -6015,6 +6029,7 @@ void register_m68k_insns (CPUM68KState *env)
>     BASE(nop,       4e71, ffff);
>     INSN(rtd,       4e74, ffff, RTD);
>     BASE(rts,       4e75, ffff);
> +    INSN(rtr,       4e77, ffff, M68000);
>     BASE(jump,      4e80, ffc0);
>     BASE(jump,      4ec0, ffc0);
>     INSN(addsubq,   5000, f080, M68000);
>

