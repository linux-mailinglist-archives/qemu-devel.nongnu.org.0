Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670103AE5AA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:11:25 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFxk-0004t1-Fw
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lvFwN-0003sY-M1
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:09:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52788
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lvFwL-0000UZ-RP
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:09:59 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lvFw4-0008mU-As; Mon, 21 Jun 2021 10:09:44 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-24-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <d26f1fa7-d258-ec78-eea1-22e1fb6da61a@ilande.co.uk>
Date: Mon, 21 Jun 2021 10:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621013439.1791385-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 23/26] target/sparc: Use translator_use_goto_tb
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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

On 21/06/2021 02:34, Richard Henderson wrote:

> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index 4bfa3179f8..fb0c242606 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -339,23 +339,14 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
>       }
>   }
>   
> -static inline bool use_goto_tb(DisasContext *s, target_ulong pc,
> -                               target_ulong npc)
> +static bool use_goto_tb(DisasContext *s, target_ulong pc, target_ulong npc)
>   {
> -    if (unlikely(s->base.singlestep_enabled || singlestep)) {
> -        return false;
> -    }
> -
> -#ifndef CONFIG_USER_ONLY
> -    return (pc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) &&
> -           (npc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK);
> -#else
> -    return true;
> -#endif
> +    return translator_use_goto_tb(&s->base, pc) &&
> +           translator_use_goto_tb(&s->base, npc);
>   }
>   
> -static inline void gen_goto_tb(DisasContext *s, int tb_num,
> -                               target_ulong pc, target_ulong npc)
> +static void gen_goto_tb(DisasContext *s, int tb_num,
> +                        target_ulong pc, target_ulong npc)
>   {
>       if (use_goto_tb(s, pc, npc))  {
>           /* jump to same page: we can use a direct jump */

Is it still worth keeping the unlikely() hint around the single-step check? I see it 
isn't included in your translator_use_goto_tb() implementation in patch 1.

I'll trust that you know better than me the effect of removing the inline, so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

