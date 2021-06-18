Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE33AC7EA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:44:56 +0200 (CEST)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luB3X-0006Nl-9m
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luB2m-0005hZ-6N
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:44:08 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luB2k-0001Oq-IS
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:44:07 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so5418732wma.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UwH3qskGZa+I9zcwxn7f80kKVMYpm8ZJv0OL3WDjD5I=;
 b=fP2sUPGExFddBPR2obcNpmAc8W6IYVO8bIvzC5tTuUrCZJ+Uf+YbX/kBgqZhatzdr0
 m27eWbvO5GCXc+F6d8qHF/cWMK5QngPA6tF9IVXv05lcwrilkkKZKMhYTQV9Fj0z9B+i
 eKqWtgCfsvyI54jlLwc+jBqj65L/lVTcCqGJaArWbeBMOcN7LxDc7c7ENR+TWbAinsre
 WcbLeGgb2CyFfrMqeho22FSu8olp8MLPng2eTgNHhjzhSXqukFUT2PjYTWcp+vxAcGY6
 8AFDqu2rM5Z2vMbH0U0qf2203GSsYcAxKj9+pJ6OnpxzfoX/uSgrm5l06fvVjUzFmD5f
 +kUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UwH3qskGZa+I9zcwxn7f80kKVMYpm8ZJv0OL3WDjD5I=;
 b=aB+J1JrQW1bSo2Ga334szeH1oBTpyltjzanXtuJkaJxaPXYXMkxAUczY0trevUULug
 PMjfPkHrzZ82JBqaZsZMHm/6TYRujqtovzpngtjz6ZBsQxBUmhqn7mixGdll/K+ZTMlS
 PmGjxOOkB9bRlRGdKEq4ByBmpRz/1f+vwTZc2LSOCPCp7e2iSzeqw+i16l/XUufLLGhj
 6/Wz499RcxOPsGXNYO/NxBsPomr+Fr9QzJNKkJJ4vMsFaQsSFBNuifsAISjaDgQkhxxO
 5/VfV31Ebz8lnFqYyPjxHOAylstrg94I9UaY4G6oMC0o/byAJA1+mTf5QtRqBwYYn/7k
 PSOg==
X-Gm-Message-State: AOAM532UQdIUjPh9aRE2ECq6CNpsJJU7ituFO/0TU5uSX4BuJT11mtdj
 Tw2e00c0rlirui2iCXu8Y2Y=
X-Google-Smtp-Source: ABdhPJxIEflH2wge6oVssTO4gIi+vromoe6HYmeAICm62EpSLvUc+tBp74E94r5Llftsi9N8+AD9Pw==
X-Received: by 2002:a7b:ce0a:: with SMTP id m10mr2609735wmc.149.1624009444707; 
 Fri, 18 Jun 2021 02:44:04 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a9sm7890100wrv.37.2021.06.18.02.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 02:44:04 -0700 (PDT)
Subject: Re: [PATCH 7/9] target/mips: Remove microMIPS BPOSGE32 / BPOSGE64
 unuseful cases
To: qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-8-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <08ed8693-6332-bb6b-396e-1dd3f49c8235@amsat.org>
Date: Fri, 18 Jun 2021 11:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.254,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 7:43 PM, Philippe Mathieu-Daudé wrote:
> These switch cases for the microMIPS BPOSGE32 / BPOSGE64 opcodes have
> been added commit 3c824109da0 ("target-mips: microMIPS ASE support").
> More than 11 years later it is safe to assume there won't be added
> soon. The cases fall back to the default which generates a RESERVED
> INSTRUCTION, so it is safe to remove them.

I'll amend for clarity:

"Functionally speaking, the patch is a no-op."

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 47c7705f051..5d571d83c54 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -14077,8 +14077,6 @@ enum {
>      BGEZALS = 0x13,
>      BC2F = 0x14,
>      BC2T = 0x15,
> -    BPOSGE64 = 0x1a,
> -    BPOSGE32 = 0x1b,
>      /* These overlap and are distinguished by bit16 of the instruction */
>      BC1F = 0x1c,
>      BC1T = 0x1d,
> @@ -16122,10 +16120,6 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
>                  generate_exception_err(ctx, EXCP_CpU, 1);
>              }
>              break;
> -        case BPOSGE64:
> -        case BPOSGE32:
> -            /* MIPS DSP: not implemented */
> -            /* Fall through */
>          default:
>              MIPS_INVAL("pool32i");
>              gen_reserved_instruction(ctx);
> 

