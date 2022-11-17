Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA062D17D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 04:15:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovVM2-0001Qn-Oa; Wed, 16 Nov 2022 22:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovVM0-0001Qf-Ho
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 22:14:16 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovVLy-0002Km-Uy
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 22:14:16 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 130so800763pgc.5
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 19:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ihfMyiGgJJkGJ72yJjJgY8V4niCivsbbsl9xuOuJSeI=;
 b=ellyNcCl5PimG8Qzji4RfIPrjFMt48CJAn+JXK6blu121PaD9NjtAI8SuKv2i2LZTK
 LqOlUurvpbVpsnq2+MLkMyMPrh562nMz5/dMnNJaAPXQlDmZokW2LGNXWFBuvpVrxshf
 cqDQCs8NYFhUEPDmKwWJK9YH/mkq04zzuCZnEQkfsTo1VJT1Cs1mxMlA/rYVne13B1Jg
 NwHlaN9y8I1KAvaCmZelJGLRZ99wUTWiT7ZD5WJiMP0wv52sGKNd0jXAxBSyJJzU1yqj
 ojJbqoE2EMJbrDN1XvsTTF12wtwetmT45/N8rD833/gREzhf/+Z5IKXeK1JWhy4U/L8y
 7vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ihfMyiGgJJkGJ72yJjJgY8V4niCivsbbsl9xuOuJSeI=;
 b=iCqNlNs48A5UnEWL+bmVbTqhb3FCXpiLOO7Tb6Db9xck4ZVgAtrxEvsWYQ8Q6FANUr
 x+vWufN+uNIJTmegSaYLumNbMW1AkBTh9xExL7z4m0kFmtP+u+hyWxGMcPa+eGR1IaGm
 +Hl4qJipWqhHzZkImfRtVBYbiMMz+vjmpONC0ZsVxCw1EC2evTO598iCnyEkS+UQL/IK
 7iq0HqfTV/1KGQym2P2vlIyx0jPVypL5KI9vP2OyqqOGZBdMDB08wgFICO6zuNnA9Slx
 /srdsw0zDCBPmjA1zwd0MuOhAw1vFzUJ8JbQquyZupVtq88p2IIoVT73jJaBrg+bfKr6
 BL4g==
X-Gm-Message-State: ANoB5pko2oTODhTrX3YgJTvFL/QZ3SQxlHbt8BdzjSsMxkDhMVFfeX7n
 4bdDOctaiyH7kqk0GoLMJlfH1A==
X-Google-Smtp-Source: AA0mqf57f1GLThYT0w4VdkLEltIMMdNpQcoyZwkT8cD6pHHRUEPdTttfqc5jHDAR+Q8XfjjMPDPFDQ==
X-Received: by 2002:aa7:824f:0:b0:56e:8ed7:569f with SMTP id
 e15-20020aa7824f000000b0056e8ed7569fmr1092861pfn.19.1668654853321; 
 Wed, 16 Nov 2022 19:14:13 -0800 (PST)
Received: from [192.168.20.156] (104-4-29-185.lightspeed.irvnca.sbcglobal.net.
 [104.4.29.185]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b00172f6726d8esm12997629pli.277.2022.11.16.19.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 19:14:12 -0800 (PST)
Message-ID: <9fa748c0-975a-09d9-4f09-942f18cc1a31@linaro.org>
Date: Wed, 16 Nov 2022 19:14:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/arm: Limit LPA2 effective output address when
 TCR.DS == 0
To: Ard Biesheuvel <ardb@kernel.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221116170316.259695-1-ardb@kernel.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221116170316.259695-1-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 11/16/22 09:03, Ard Biesheuvel wrote:
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 3745ac9723474332..9a6277d862fac229 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1222,6 +1222,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>           ps = MIN(ps, param.ps);
>           assert(ps < ARRAY_SIZE(pamax_map));
>           outputsize = pamax_map[ps];
> +
> +        /*
> +         * With LPA2, the effective output address (OA) size is at most 48 bits
> +         * unless TCR.DS == 1
> +         */
> +        if (!param.ds && param.gran != Gran64K) {
> +            outputsize = MIN(outputsize, 48);
> +        }

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I thought about moving this back into aa64_va_parameters, similar to how we bound tsz, but 
since this is the only use of param.ps, this placement is as good as any.


r~




