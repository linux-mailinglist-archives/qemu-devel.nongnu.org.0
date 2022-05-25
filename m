Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C425345F4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:44:46 +0200 (CEST)
Received: from localhost ([::1]:55440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntyo9-0003dU-Rn
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyn4-0002uI-Ju
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:43:38 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyn2-000741-Un
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:43:38 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MC2wN-1nzjQZ27LB-00COLh; Wed, 25 May 2022 23:43:34 +0200
Message-ID: <09812c8c-32a7-f3bb-e853-592aa8b929d6@vivier.eu>
Date: Wed, 25 May 2022 23:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 11/17] target/m68k: Implement TPF in terms of TRAPcc
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-12-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8TN+qefsLWnN24fU5buS8c466MRGrJVyKmyUBGf+azCt80CHmqT
 TWxJXl7uoAirZTAw+la3It+1WKEgnujH+i+gcW0atVe3RHwCPL6V6xZxEDM2KABIQESLPB3
 vPfo3wBTFJBnEjPo0J4PUZ1dY0zT/KEcwCJ5HSfj0ig6RPxZTWhCNVTBRNgrtI7wA3ghpqn
 zEzC/pFDzWBESu6Zx3TSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mLCXoewqs3E=:hB3IZo/ZZGH6RxYBxKjjTF
 uyb+c+8D/EBPluy7n7+Q6o59zr+e0SEmXWpFeD9A2Qi0cE0JPOEiIXD1oL/TuTarVZmBEgSop
 Od/LVDsF1BGdSiRSEMbjDq+GyUzVr/OypEpi4zwYqNVOtW/lJQsv6EOFXYmQqTtmM2HqihHA0
 kGenZkudBParuhW1t7ns/C5zYPLLwNWBumjfl0CgQLsuLarpF52yRPW9sWtNkH7mcVultqnIE
 +f7gC5p1XHxI86x+31i7xrPIfb9zHRYYyob0BqSdHCdoCep1qmStamYabIBTdTSKA5z8zoEjd
 15At5JU1N/oT/8ZnKWdIa5LrEOm9NnBNSr9hCObP5AZKZyRgR3jMHYwWuVictv0rh6xCvG74s
 j4m4phyUU5l7jWdrX9qz0EY4HUsmfxz1u1xK0+N5vsQL03pZ8T8Xtoo3SeEY6GD0OBiWndLrE
 qEZ6COrAhkjRtv5EcDDVbOWE09ePceT9+hxCb9Rtyl+0c6XDvmdimr7/SjjZsiBA9R7tUuoLA
 qsorIA96107Fi3uhUhYvySpAw0lFdhPkhgyHScXCMqKUaI/5cjdH+pkHao00bnnAlYGSfZ1zS
 zOQmR3sh0xOD7ic7/2x/rGOp4t0qCjhYFi0e8KoHhnd/JLJ+yduZB+J3tEM4bF7dge6OukQBE
 tjIIIJzDzJIu4awZ+ZvnixySZSx9odQfAkmJFJ5VRtjHTt+wDU9id+af/WNz71e7/e4J6XdrA
 h/4gUtNGMq0Y7/yAGm6nxdyPH2W5G5DbE6NI+g==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> TPF stands for "trap false", and is a long-form nop for ColdFire.
> Re-use the immediate consumption code from trapcc; the insn will
> already expand to a nop because of the TCG_COND_NEVER test
> within do_trapcc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index c4fe8abc03..bb5ed1b7b1 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -3075,22 +3075,6 @@ DISAS_INSN(addsubq)
>       tcg_temp_free(dest);
>   }
>   
> -DISAS_INSN(tpf)
> -{
> -    switch (insn & 7) {
> -    case 2: /* One extension word.  */
> -        s->pc += 2;
> -        break;
> -    case 3: /* Two extension words.  */
> -        s->pc += 4;
> -        break;
> -    case 4: /* No extension words.  */
> -        break;
> -    default:
> -        disas_undef(env, s, insn);
> -    }
> -}
> -
>   DISAS_INSN(branch)
>   {
>       int32_t offset;
> @@ -6099,7 +6083,7 @@ void register_m68k_insns (CPUM68KState *env)
>       INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
>       INSN(dbcc,      50c8, f0f8, M68000);
>       INSN(trapcc,    50f8, f0f8, TRAPCC);
> -    INSN(tpf,       51f8, fff8, CF_ISA_A);
> +    INSN(trapcc,    51f8, fff8, CF_ISA_A); /* TPF (trapf) */
>   
>       /* Branch instructions.  */
>       BASE(branch,    6000, f000);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

