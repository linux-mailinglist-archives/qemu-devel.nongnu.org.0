Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75D3D15D1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 20:02:46 +0200 (CEST)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GYP-0000G5-65
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 14:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GVy-0006la-Rd
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:00:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GVx-0000KX-1a
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:00:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so30632wms.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pjuJUq7orgr8I3mMFnjcPiIp5jzj6F6zHvPdEJD58C4=;
 b=IhV6R6EbqEz5fWVZ3eMxQ8x1dyNqxf266YQi1b/gmrnquHV3qkymjJWfWeZsVefphe
 7iRCr2H9JZS7xiZ48v4ym8jZv0w5Y+no/25q/9PN9jI2P6M93rnAPt7tmnss/gC4tQgf
 0sW2etYOHqnAw+e9qaTLxJnbHbQ7sd4fpM3qGTGd5KLKtt1isLX9vc5vSV8BvtQ0XNQN
 4vQlHPe6t6u0hxw/87kzKK7LPL1oeayKY7OqvvlwThHM/mhugpcK5UmEIFnxOHi5Jm/t
 He7oZkTxbcy+0dDjH2j/rd/C1oEVTWJnsfbngr+Nt2LKpxQy79kCsRzj0N5rp1BCsOcw
 xd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pjuJUq7orgr8I3mMFnjcPiIp5jzj6F6zHvPdEJD58C4=;
 b=UepsmFaD5omA1iYPQVcQ9qXztUvYTswlVpUJe7qJLksQvP3K+scEsksg2v2xZTtLhp
 2FTnQJ9lSkxqhWijz4jsNCtmOEIG+vTs/6tjWSs+u13jCN6RfTTy579E1xbnn7MUyfjn
 R97e9zTEO5ar3tdZCVtaCeK4swJw8geMXnGlKFB1rUodSteBalZIrkizGYMhzqlmcQBU
 BCtSvQYxFjdx5zOSIgM8qchtS+9uW+VVapwM829/VAcfYlJqRcHFzuLMzxfu39n7Pjcp
 e5tjCUWq1qo/qHhFlvnEjqJzSOm6kw/qu4mGL4bWJ0HLdjIFGAuaem0eXNlu6AUx8VVn
 ZS2g==
X-Gm-Message-State: AOAM530dWIMp+Fe7yL5nJ9MYvbHmp7W6+uCf9dtYTQLNllMnl0DzWXN0
 OU6EdjnAWhQBK0HWDjoqS84=
X-Google-Smtp-Source: ABdhPJznVpPswsKZ13yPNLzbPKAJmLKqELW9TGWbISNCqrzZfZtD0SP7+xCl+IZHtl55NssEGkXaVw==
X-Received: by 2002:a05:600c:b42:: with SMTP id
 k2mr5449127wmr.45.1626890411215; 
 Wed, 21 Jul 2021 11:00:11 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z7sm14439968wrt.94.2021.07.21.11.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 11:00:10 -0700 (PDT)
Subject: Re: [PATCH for-6.2 03/23] target/avr: Drop checks for
 singlestep_enabled
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
 <20210721064155.645508-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f54d0645-5dad-4f7e-e804-9b926524ffa1@amsat.org>
Date: Wed, 21 Jul 2021 20:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721064155.645508-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Michael/Alex/Pavel

On 7/21/21 8:41 AM, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index 1111e08b83..0403470dd8 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -1089,11 +1089,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>          tcg_gen_exit_tb(tb, n);
>      } else {
>          tcg_gen_movi_i32(cpu_pc, dest);
> -        if (ctx->base.singlestep_enabled) {
> -            gen_helper_debug(cpu_env);
> -        } else {
> -            tcg_gen_lookup_and_goto_ptr();
> -        }
> +        tcg_gen_lookup_and_goto_ptr();
>      }
>      ctx->base.is_jmp = DISAS_NORETURN;
>  }
> @@ -3011,17 +3007,10 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>          tcg_gen_movi_tl(cpu_pc, ctx->npc);
>          /* fall through */
>      case DISAS_LOOKUP:
> -        if (!ctx->base.singlestep_enabled) {
> -            tcg_gen_lookup_and_goto_ptr();
> -            break;
> -        }
> -        /* fall through */
> +        tcg_gen_lookup_and_goto_ptr();
> +        break;
>      case DISAS_EXIT:
> -        if (ctx->base.singlestep_enabled) {
> -            gen_helper_debug(cpu_env);
> -        } else {
> -            tcg_gen_exit_tb(NULL, 0);
> -        }
> +        tcg_gen_exit_tb(NULL, 0);
>          break;
>      default:
>          g_assert_not_reached();
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Not related to this patch, but looking at the last
gen_helper_debug() use:

/*
 *  The BREAK instruction is used by the On-chip Debug system, and is
 *  normally not used in the application software. When the BREAK
instruction is
 *  executed, the AVR CPU is set in the Stopped Mode. This gives the On-chip
 *  Debugger access to internal resources.  If any Lock bits are set, or
either
 *  the JTAGEN or OCDEN Fuses are unprogrammed, the CPU will treat the BREAK
 *  instruction as a NOP and will not enter the Stopped mode.  This
instruction
 *  is not available in all devices. Refer to the device specific
instruction
 *  set summary.
 */
static bool trans_BREAK(DisasContext *ctx, arg_BREAK *a)
{
    if (!avr_have_feature(ctx, AVR_FEATURE_BREAK)) {
        return true;
    }

#ifdef BREAKPOINT_ON_BREAK
    tcg_gen_movi_tl(cpu_pc, ctx->npc - 1);
    gen_helper_debug(cpu_env);
    ctx->base.is_jmp = DISAS_EXIT;
#else
    /* NOP */
#endif

    return true;
}

Shouldn't we have a generic 'bool gdbstub_is_attached()' in
"exec/gdbstub.h", then use it in replay_gdb_attached() and
trans_BREAK() instead of this BREAKPOINT_ON_BREAK build-time
definitions?

