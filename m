Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C336DADA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:08:55 +0200 (CEST)
Received: from localhost ([::1]:39266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblo6-0002Rg-IJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblky-0007OX-Ha
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:05:40 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblkv-0007Ha-RJ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:05:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso9286793pjn.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XQnoNzQSb/reSlret35ypzUXdizbnO081fMDAoEZRDg=;
 b=IsiuP6pL9sETCUempwqN9PGTSoCmxMm8t6h2tl5tXisbSOKxfgMnJLW2mzFBOO/bfs
 sp8TjZlYRBUGrPHIwmM+gFTndjdJguhAc2XT919XOWui+HIxQTo0HIeOCPZ45orxEcNn
 7XcqNHaf4aa2jULBiqqY4essplTUaVX7NQz7Vt/RzUKJ+O/GrzQM1nHvzhy2Omtw7M1d
 EOsV61d33MlK2all1iFf7ag/dhgrabky++Cf+AlAGX3GPoqTGasm/4dyfgpN8Zj1wSZd
 5TZbkbVgsIZc+ly+oM6J0WvFMni7VDpklaP0YRaa52CJwvO1yNyw3goY+kV+PU/Z4zvs
 i3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XQnoNzQSb/reSlret35ypzUXdizbnO081fMDAoEZRDg=;
 b=bfh8LHX5Z/T9c2cck6zLI5WH5j/jNNgTMCcRZgLu0vPKMS1scdmbxwYQsxkfUBQdhV
 PE1i7qx2URBZpIQJoU9YnAqXOUxuM2fX81eHnCMzcMViT1LUd11wlQWDG2N1By+bSzBQ
 9/SBLaPo/uIR1XSnzc7Vvw6zGXblY3JOBfhrrRMI5lTbctbCtdaB7DiIpqzL3RIAKuAz
 phHB9HEFehUXMk6yScy/5YgjMWdUJrYFX2w2Yuu7y08EV5/k38Z4DGuZMnpp/sjiur3X
 rRaMZMru3JOpghKR68BWIKtJXlv6fAJNxEWePI+nyZUThmZBojjpJPxdr8N+Ld9QlTx/
 LuTA==
X-Gm-Message-State: AOAM5313bqYc9TL3lS+tM/z9GQs8dsTBhSt4c8uAHpYmbtRgTtSzBsIG
 XxaBLryYg/wv0bnj/D9aQcvW9g==
X-Google-Smtp-Source: ABdhPJy6uS9vt5EyN0X5uwMm5eOZAL2MDd88ORHlNjUJN/eWqwmUtgSirqvXh59ex/yqUcXiAa/SHw==
X-Received: by 2002:a17:90a:352:: with SMTP id
 18mr32521711pjf.223.1619622336132; 
 Wed, 28 Apr 2021 08:05:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 16sm5334763pjk.15.2021.04.28.08.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 08:05:35 -0700 (PDT)
Subject: Re: [PATCH v2 04/15] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-5-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <905b2240-82b9-cdaf-922a-0d334a7288a7@linaro.org>
Date: Wed, 28 Apr 2021 08:05:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427171649.364699-5-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 10:16 AM, Luis Pires wrote:
> -static inline void gen_stop_exception(DisasContext *ctx)
> +static inline void gen_end_tb_exception(DisasContext *ctx, uint32_t excp)
>   {
> -    gen_update_nip(ctx, ctx->base.pc_next);
> -    ctx->exception = POWERPC_EXCP_STOP;
> +    /* No need to update nip for SYNC/BRANCH, as execution flow will change */
> +    if ((excp != POWERPC_EXCP_SYNC) &&
> +        (excp != POWERPC_EXCP_BRANCH))
> +    {
> +        gen_update_nip(ctx, ctx->base.pc_next);
> +    }
> +    ctx->exception = excp;
> +    ctx->base.is_jmp = DISAS_NORETURN;
>   }

Hmm.  You didn't actually raise the exception, so you can't set DISAS_NORETURN 
that way.  It looks like you should be using gen_exception_nip().

And as side notes: (1) no need for extra parentheses, (2) brace is misplaced.


r~

