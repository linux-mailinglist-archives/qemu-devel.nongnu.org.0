Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C06FDB9D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:25:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgzP-0000UT-Ry; Wed, 10 May 2023 06:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgzN-0000Ma-9v
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:24:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgzL-0006Ip-My
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:24:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3075e802738so6239781f8f.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 03:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683714242; x=1686306242;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=btQlM+LMC0ws5kaEvQ0CfvqMXdiBoWiimh+kKUMWJ8I=;
 b=lmggdY7SWrwr/DlOq2cEAdA7dyR2m+XRzRcfGIc/5mY/mTuLQdxWDb8aL3TAvZh1jM
 JAHamjL84QG3EU8iMJTfYkAcIi3N5xnEY3wtaDpfQMnRazFF4Zvswh2vJirX86QYesjY
 otipf0m60I7LvFz2Aw/WF3qO4kk+lIwJAleQ1aAlU0qTMFzQOU0+EmEBKePgbu5x3w33
 fBeQvN9wSFgW8HmdSAFvxpbkRS6GVOfCwijnhn/sQpVGLxcjDQEP2PHqCmObCnj5BqjG
 4UPmoqgfDFQuInf6CJGM9zi2OGOJ7ABS2P4mO3xrnzw6CpxQQ9b/Fe3J6Ci3A+D9j8A3
 T3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683714242; x=1686306242;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=btQlM+LMC0ws5kaEvQ0CfvqMXdiBoWiimh+kKUMWJ8I=;
 b=P3fXDc+TUHLiC2SFFCL+mgH9JWevKl8jjHrXQY/XM4wXVrsynu02STskBROCrVIe1s
 leRFw8tFue9PRQIa+E7gt1Gzv4KpIWouki9mljmqcQVfL/34kq8Wg8w53j6mr7ZA78kz
 DSTJ76vE4HzbvHog9ZMBsUnWtu1eSGFOQ6n9oLwDKMQqGkGQbUxxD1Vd9piJ+CSOdKf+
 F/Qtzhz8KFQTIM/RrQPZBJDA2eogH9aKmexup4anYVwBgQ5H3xp/71mX32wh4eDBciNz
 WBP+LtljJFywg8MaXpeVZE1/nfaBwmuN6XYjSM2gs0OGFOt9iBDHKQmOZgfRXyE/+n5k
 Rdxg==
X-Gm-Message-State: AC+VfDzOHPfY9wOA9ejlFj2NDIfZPSzaGgHBGJsMKU2Y1UB9TLt3C7eb
 3XWcww8mUL6jusUaUGLABKNpxlAwN+grZ5DrZoHZTQ==
X-Google-Smtp-Source: ACHHUZ4/r5x8qf1XcPQ9jviyt70rBoq5Z6g1u7HJDkYWC9hDWNxl1WvPFV0rKegCXg8WBSH1/q5S3g==
X-Received: by 2002:adf:f5c6:0:b0:306:b3f8:690f with SMTP id
 k6-20020adff5c6000000b00306b3f8690fmr14096958wrp.36.1683714242083; 
 Wed, 10 May 2023 03:24:02 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g8-20020adff3c8000000b003078354f774sm15334620wrp.36.2023.05.10.03.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:24:01 -0700 (PDT)
Message-ID: <2d46a274-8234-a635-81ca-c79c2969cb7b@linaro.org>
Date: Wed, 10 May 2023 11:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH for-8.1] target/sparc: Use tcg_gen_lookup_and_goto_ptr
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk
References: <20230405185922.2122668-1-richard.henderson@linaro.org>
In-Reply-To: <20230405185922.2122668-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

r~

On 4/5/23 19:59, Richard Henderson wrote:
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
>   


