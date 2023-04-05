Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025006D8958
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:09:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkANg-0001VZ-SC; Wed, 05 Apr 2023 17:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pkANe-0001VA-Bx
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:09:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pkANc-00067A-RV
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FXPGbehwVEJ30r0OU4I/0l660aJJT+ZYIN1UDXyN4as=; b=O6BuwEltB4Oi0WdN6H3WOus2Yy
 ELBrr8CBDa+7vFhSh68BIFfRKm0apkIjicL8JzQcaHFv1ppGCyEA37O1OqlTHvW0o8jTEDSr4ryxW
 a7TPNtm6N3Ygg4ibGdk77jcEOuHSgfVXU1EY4WTUalf06Q5IvgWsG6b0/GZp1WUkfgG1JjMT+REmJ
 8xmv+hXowD4ZINzJXWkzgOzsgUbjyfI4XmHDp+/Y/rfX8VgtQPbVpCKGubgbwLM7PA4dh7wf+rjwd
 gZtaXrVVhGjy5IIq6YQhSCJn1H1t3mkUCa1iwY87OQz3INkHyGbfCVvxLhHdRdO3iIoLgs0gFs05k
 ALSxh1fipyvTiSE4bKsUmzcRqwRRSLvv372AjlHzPnLIokEs78hRURXbjtrF92TKwWWhnVF356eTq
 lWjtE7wd0RfA14USUQ0oBk4jKHOYnqvgqsNHjnp/Jb4omjlvsvRboSZW6y9aobabJTDJUhAqX2+oD
 2roAXU8LUTbS9LVfo6JdoKpseoFFdTISwY7AlWYKLwMx1vcwu6yZ8UIEJ+CeOdC5XHFUZnQxmLVIh
 qg+T0dDt0ygNhZwxIa+arvw3AvqeulvrYaRRC02Pn9hfC1AA7EgiIPbLzhNRQoFgyoql85GC1+Hd3
 kIlAOw0W1jPzmfwZG3btnxoHazda5h41elHHheFTM=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pkAMl-00039B-Tj; Wed, 05 Apr 2023 22:08:31 +0100
Message-ID: <36923eb7-9e6f-a4a7-7e2b-e14df9e63dcb@ilande.co.uk>
Date: Wed, 5 Apr 2023 22:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230405185922.2122668-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230405185922.2122668-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.1] target/sparc: Use tcg_gen_lookup_and_goto_ptr
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 05/04/2023 19:59, Richard Henderson wrote:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index 137bdc5159..47940fd85e 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -322,7 +322,7 @@ static void gen_goto_tb(DisasContext *s, int tb_num,
>           /* jump to another page: currently not optimized */
>           tcg_gen_movi_tl(cpu_pc, pc);
>           tcg_gen_movi_tl(cpu_npc, npc);
> -        tcg_gen_exit_tb(NULL, 0);
> +        tcg_gen_lookup_and_goto_ptr();
>       }
>   }
>   
> @@ -4153,7 +4153,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                   /* End TB to notice changed ASI.  */
>                                   save_state(dc);
>                                   gen_op_next_insn();
> -                                tcg_gen_exit_tb(NULL, 0);
> +                                tcg_gen_lookup_and_goto_ptr();
>                                   dc->base.is_jmp = DISAS_NORETURN;
>                                   break;
>                               case 0x6: /* V9 wrfprs */
> @@ -4162,7 +4162,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                   dc->fprs_dirty = 0;
>                                   save_state(dc);
>                                   gen_op_next_insn();
> -                                tcg_gen_exit_tb(NULL, 0);
> +                                tcg_gen_lookup_and_goto_ptr();
>                                   dc->base.is_jmp = DISAS_NORETURN;
>                                   break;
>                               case 0xf: /* V9 sir, nop if user */
> @@ -5661,7 +5661,7 @@ static void sparc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>                   tcg_gen_movi_tl(cpu_pc, dc->pc);
>               }
>               save_npc(dc);
> -            tcg_gen_exit_tb(NULL, 0);
> +            tcg_gen_lookup_and_goto_ptr();
>           }
>           break;

I can certainly give this an R-B, however I'm fairly sure I tried this a couple of 
years back and found that it introduced random hangs on qemu-system-sparc64 :/. Have 
you seen any issues in the relevant avocado tests with this patch applied?


ATB,

Mark.

