Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD73D4CC4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 11:01:57 +0200 (CEST)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7a1D-0003Ha-Qh
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 05:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m7a04-0002Yi-KP
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 05:00:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43648
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m7a02-0002eA-HK
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 05:00:44 -0400
Received: from host86-145-86-143.range86-145.btcentralplus.com
 ([86.145.86.143] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m7Zzm-0004mi-7W; Sun, 25 Jul 2021 10:00:30 +0100
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210724134902.7785-1-peter.maydell@linaro.org>
 <20210724134902.7785-2-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <e3c72904-7d45-3c72-375d-04cea0b62d0d@ilande.co.uk>
Date: Sun, 25 Jul 2021 10:00:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210724134902.7785-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.143
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-6.2 1/2] target/sparc: Drop use of gen_io_end()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.058,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/07/2021 14:49, Peter Maydell wrote:

> The gen_io_end() function is obsolete (as documented in
> docs/devel/tcg-icount.rst). Where an instruction is an I/O
> operation, the translator frontend should call gen_io_start()
> before generating the code which does the I/O, and then
> end the TB immediately after this insn.
> 
> Remove the calls to gen_io_end() in the SPARC frontend,
> and ensure that the insns which were calling it end the
> TB if they didn't do so already.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/sparc/translate.c | 25 ++++++++++---------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index 11de5a49631..bb70ba17deb 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -3401,7 +3401,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                           tcg_temp_free_i32(r_const);
>                           gen_store_gpr(dc, rd, cpu_dst);
>                           if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -                            gen_io_end();
> +                            /* I/O operations in icount mode must end the TB */
> +                            dc->base.is_jmp = DISAS_EXIT;
>                           }
>                       }
>                       break;
> @@ -3454,7 +3455,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                           tcg_temp_free_i32(r_const);
>                           gen_store_gpr(dc, rd, cpu_dst);
>                           if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -                            gen_io_end();
> +                            /* I/O operations in icount mode must end the TB */
> +                            dc->base.is_jmp = DISAS_EXIT;
>                           }
>                       }
>                       break;
> @@ -3588,7 +3590,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                           tcg_temp_free_ptr(r_tickptr);
>                           tcg_temp_free_i32(r_const);
>                           if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -                            gen_io_end();
> +                            /* I/O operations in icount mode must end the TB */
> +                            dc->base.is_jmp = DISAS_EXIT;
>                           }
>                       }
>                       break;
> @@ -4582,7 +4585,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                   }
>                                   gen_helper_wrpstate(cpu_env, cpu_tmp0);
>                                   if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -                                    gen_io_end();
> +                                    /* I/O ops in icount mode must end the TB */
> +                                    dc->base.is_jmp = DISAS_EXIT;
>                                   }
>                                   dc->npc = DYNAMIC_PC;
>                                   break;
> @@ -4598,7 +4602,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                   }
>                                   gen_helper_wrpil(cpu_env, cpu_tmp0);
>                                   if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -                                    gen_io_end();
> +                                    /* I/O ops in icount mode must end the TB */
> +                                    dc->base.is_jmp = DISAS_EXIT;
>                                   }
>                                   break;
>                               case 9: // cwp
> @@ -4697,10 +4702,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                       gen_helper_tick_set_limit(r_tickptr,
>                                                                 cpu_hstick_cmpr);
>                                       tcg_temp_free_ptr(r_tickptr);
> -                                    if (tb_cflags(dc->base.tb) &
> -                                           CF_USE_ICOUNT) {
> -                                        gen_io_end();
> -                                    }
>                                       /* End TB to handle timer interrupt */
>                                       dc->base.is_jmp = DISAS_EXIT;
>                                   }
> @@ -5327,9 +5328,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                   gen_io_start();
>                               }
>                               gen_helper_done(cpu_env);
> -                            if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -                                gen_io_end();
> -                            }
>                               goto jmp_insn;
>                           case 1:
>                               if (!supervisor(dc))
> @@ -5340,9 +5338,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                   gen_io_start();
>                               }
>                               gen_helper_retry(cpu_env);
> -                            if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -                                gen_io_end();
> -                            }
>                               goto jmp_insn;
>                           default:
>                               goto illegal_insn;
> 

Thanks Peter, this is something that has been in the back of my mind as a TODO for a 
while but I haven't managed to get around to it. From what I can see the conversion 
looks good so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

