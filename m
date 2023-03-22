Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B496C4AA0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexdI-00045m-RW; Wed, 22 Mar 2023 08:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pexdE-00045T-Fy
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:31:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pexdC-0007tl-5x
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:31:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso23488103pjb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679488313;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f3ayiBM5rUJ0MeHLoF62+55G0D7h5oe/c80Vxhc4uJ4=;
 b=Hp3lEHWizs1zIZ/8LBQEtgMZCTNGx6/J2/Cj01uKewH4DJgwlPCyp31gGBbZPtEHZf
 gsjmYKE5J1xfDgh3mJxgyWNaxWKohiDBj+Ukty+6D5RrcfRPzFZ/vd7j59VR+JMUIUHr
 m5/wHCIdhkdz9GANDGErNj4nkbSsq5gGxkiiBuvHfkkYHSxMVPah0id935OI0i+VADBe
 omSBZ1gXv0I3Ip2w3oHeLPCn18+BA+SZO7xiS8g4nP3hdTwj7YeAB6d6q2NuQy4LRY9O
 cTdrcAKUrwvHH1gyw5wbe56qdjhfV7bqEXV4xlXUOxKj9mSbQf2QLySgj7f2mxIWbHiK
 T1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679488313;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f3ayiBM5rUJ0MeHLoF62+55G0D7h5oe/c80Vxhc4uJ4=;
 b=DhgFhCY9a0jlOxFyK1Al1jWug6YAnwRwvTbpUf+4YZP6zg9/osoKj7n+/BzxZloSLm
 rFbKYgARL0xmNrrwIXm0rj1WfgvZwbdmEyLcswmdvWU+4Pp2S9tk1QgURbsl34jTF+5u
 hI0YMOKM4ZKLM5MiX1wgbvRmhleHPGYI/HOMXnI8XABoe0+UxIuem8ZMsfMQOFv2F0B8
 g2M/ryFhqACqGl9Q8lI6U+sndJYRUnjS0rwzmIr/cfaTHRmhWHTZ8SqLAbpmrUX7z1cY
 NKKzlOgrvm+zWzZsrBKKGUlTGpdL4FD/tvZYlmU43D6ZDElFkOZJRo6tRxqXd7xQ5352
 hFGQ==
X-Gm-Message-State: AO0yUKWbT7ArdEXzhp/BA+GEWd+4/lw6z97opeaOJGjP+n5pVk5hNmai
 tKWOLqZaivzGBwhrm8U3HYsIYA==
X-Google-Smtp-Source: AK7set+o4Xlyddz44z7AaH7Ex2h8XnLI1Q7TadTfY0NS6ypgXhPqtvtd1TrpRH2G9VFY+1IX3eu4ww==
X-Received: by 2002:a17:90b:3b82:b0:233:e305:f617 with SMTP id
 pc2-20020a17090b3b8200b00233e305f617mr3356956pjb.32.1679488312673; 
 Wed, 22 Mar 2023 05:31:52 -0700 (PDT)
Received: from [192.168.7.32] (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 u62-20020a17090a51c400b00233afe09177sm13166547pjh.8.2023.03.22.05.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 05:31:52 -0700 (PDT)
Message-ID: <0717dc3c-5372-01ff-2fb9-531daa7e0ef3@linaro.org>
Date: Wed, 22 Mar 2023 05:31:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/loongarch: Enables plugins to get instruction codes
To: =?UTF-8?B?6LCt5byY5rO9?= <tanhongze@loongson.cn>, qemu-devel@nongnu.org
References: <29262b57.2c2b7.187085217c7.Coremail.tanhongze@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <29262b57.2c2b7.187085217c7.Coremail.tanhongze@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/22/23 00:56, 谭弘泽 wrote:
> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index f443b5822f..21d86077f4 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -177,7 +177,7 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, 
> CPUState *cs)
>       CPULoongArchState *env = cs->env_ptr;
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
> 
> -    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> +    ctx->opcode = translator_ldl(env, &ctx->base, ctx->base.pc_next);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

