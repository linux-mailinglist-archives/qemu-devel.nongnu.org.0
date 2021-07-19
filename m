Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF9C3CD0FB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:36:14 +0200 (CEST)
Received: from localhost ([::1]:58578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Ph7-0004nv-4M
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5Pg4-0003eF-PF
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:35:08 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5Pg3-00053e-At
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:35:08 -0400
Received: by mail-wr1-x435.google.com with SMTP id t5so21148515wrw.12
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ukpnUg7nBL/qulzgYr8D1xarKn+XGQBrbsZ2iPxGUwY=;
 b=dUbTGmh2FgKGrl1AsAqPVzp6IdW9ca6bIMejNvVecYIFe6rnzKVhQoTuolupEc3DTw
 BId96TJOkrCR1mi00ko62F0XVz/K0I47pURYkT4OjG04cHIOklMMVmX5ku+ZvgsY4nGB
 xc6mhvEaXkZDSlfl/OTwuy+Eg24E9dfVTXS0HRzeB2wXwQjzYnXVC0cCNV+W1GHVkRIj
 qXb4qrsGGSSES5kNOFK9H1gAxG2741kfyyXGv3h4VGzvCA8Bn8aPYrRnfVklDpqlqRJx
 uvOJeAFWdxv23R/kTEPIuf4o5Kxu3bwQ46fnJbz24wkkhPYhQQgXfnor6bhox0hmp2gU
 PQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ukpnUg7nBL/qulzgYr8D1xarKn+XGQBrbsZ2iPxGUwY=;
 b=HWZDBoCKl/tsiN0e8ox/GT4B220UivM/Au5FzPtmKsKPVxftcZh8t6k7AuWcz40rZI
 Pb6/xiPcoZjZ81SdvIa0YR+KlN2xw7a7OpL8Zhcg2fv2Zapjlqj/gAierFed3tf7D2rD
 ZLJprkHhFaDvS5jiGDfZRY7/Z6MqPPtBvUOVFkY0vCa4zsuRziLfGfNjCA07ZaKVv9ME
 yOx4Zku5k9TW8GZ7lk4WqwAU/APHN7qn5PsuzBrcxQ1CtJO4seSU9a3iqn9mHz2lpDEh
 tmH/FraJRwSZ10i5ZeZV6cnLDm75xho2zzOKHCgKsdsBj5iU1uNd8Cgi27IcbJxqYr1q
 4qSQ==
X-Gm-Message-State: AOAM531OTTLIkhynLUnzCsUTSIrEUozyR35rkKRgEMieoBKWPBF/SmN2
 m13SCOLOW/XCX4t78dzsJWI=
X-Google-Smtp-Source: ABdhPJwzhKHCi8Jmxvy3NbNlv7uKZ5RTVy2R0SM8sCKD9SGMIO5YbfJU1BQi/RUGd5sqfTYaaJx3bg==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr28729500wrw.326.1626687305940; 
 Mon, 19 Jul 2021 02:35:05 -0700 (PDT)
Received: from [192.168.1.33] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id f26sm16009323wmc.29.2021.07.19.02.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 02:35:05 -0700 (PDT)
Subject: Re: [PATCH v3 08/13] target/avr: Advance pc in avr_tr_breakpoint_check
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <29cbd5d8-ea19-4707-a209-461c66f54341@amsat.org>
Date: Mon, 19 Jul 2021 11:35:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717221851.2124573-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.07,
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 12:18 AM, Richard Henderson wrote:
> Since 0b00b0c1e05b, tb->size must not be zero.
> Advance pc so that the breakpoint covers the insn at the bp.
> 

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/489

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index 8237a03c23..d768063d65 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -2950,6 +2950,7 @@ static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>  
>      gen_breakpoint(ctx);
> +    ctx->base.pc_next += 2; /* advance by minimum insn len so tb->size != 0 */
>      return true;
>  }
>  
> 

