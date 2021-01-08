Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1A2EFB7B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:58:01 +0100 (CET)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0hk-0004OS-Bc
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ky0bY-0005XR-0N; Fri, 08 Jan 2021 17:51:36 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ky0bW-0007iB-1l; Fri, 08 Jan 2021 17:51:35 -0500
Received: by mail-ot1-x330.google.com with SMTP id j12so11258681ota.7;
 Fri, 08 Jan 2021 14:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xxog+FWQtdXGGn49vblXgZfPwsZtGQA7X+cL+q1/iHI=;
 b=lStJJRf6Cvaqs6KOgr4gl2kSyp1o3U9h+W2Q07eVXwqnmdDv+VgyjeM8FuxU3+aZH2
 V92eTOCypX/+Rq1MbBkFb/6zYPuVcjrGEFOeKIIPygZLLxMA++BnwFOY8/5zca/BxFs4
 dJ2scRGf8SmtiQuf6b8y+38pIToWj/b6l2WOEGb/668lH0ntnTR+HwvlKGAAeBl7LZ8g
 T2FNrmpYvI4JFXFHQQHOj6vRxxmY8VgHS5aCdmLc7jK+rYb6yklaQG4xh2k5lJw8tBom
 vxAqkJ0Kldm22nXq6Yz7CYO7YQPhu9s4YzhhF45TqyiQalULRObPNPjWPOw3CJ2CIRVW
 tRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Xxog+FWQtdXGGn49vblXgZfPwsZtGQA7X+cL+q1/iHI=;
 b=ORYIxsYzg/0PwxZKJn6rciu0U86HXzylbC43HsknkjNUu4xtYRGE3WjEVZEOOc0dqM
 d4FxvImESmQmCsrxqn/UuQSQuFeq0JU8okNoEEyDKhS1YWzIZabMGEmLWpIAE9SupLv8
 QZt4c1h3DWuBJxWIX+/HRHHrJ2s+7xuGBXZkcFW+agOi1R0CsL/5kz9v1p56juTvwn1f
 EHc2x6vt9YN2GjCw3ixrKnlqMi/PZm69Ouo1S6xWsAJvwfalBNoG1CxUb5e3/hFiH+gH
 EQuQiIb3neY8GxcNutA13TO7zoRf90YFqI8+Oh6bTJky1wbqtt1YzR2UNExfVHSElrej
 uPfA==
X-Gm-Message-State: AOAM532UUPnnDOgnS/oF5P2OMTl/00lnUjcF5cqmp7J+7rAkGFaFBDXF
 2H88EMggGSbZXfQ6392zLPqr+8qe3pU=
X-Google-Smtp-Source: ABdhPJyw4+ELUDoJjo1g0SRLXPco9S+mNLK8trDg32zxCSeTO9VCf7wmU1JbKChtHAvAf1jbcTHhTQ==
X-Received: by 2002:a9d:224:: with SMTP id 33mr4285248otb.98.1610146291833;
 Fri, 08 Jan 2021 14:51:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h26sm2093072ots.9.2021.01.08.14.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 14:51:30 -0800 (PST)
Subject: Re: [PATCH] target/arm: Don't decode insns in the XScale/iWMMXt space
 as cp insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210108195157.32067-1-peter.maydell@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5ba8cd70-c4a1-5543-660b-61c0bc998705@roeck-us.net>
Date: Fri, 8 Jan 2021 14:51:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108195157.32067-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.241,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 11:51 AM, Peter Maydell wrote:
> In commit cd8be50e58f63413c0 we converted the A32 coprocessor
> insns to decodetree. This accidentally broke XScale/iWMMXt insns,
> because it moved the handling of "cp insns which are handled
> by looking up the cp register in the hashtable" from after the
> call to the legacy disas_xscale_insn() decode to before it,
> with the result that all XScale/iWMMXt insns now UNDEF.
> 
> Update valid_cp() so that it knows that on XScale cp 0 and 1
> are not standard coprocessor instructions; this will cause
> the decodetree trans_ functions to ignore them, so that
> execution will correctly get through to the legacy decode again.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> With this Guenter's test image now successfully boots
> and shuts down again.
> ---

Thanks a lot for the fix!

Tested-by: Guenter Roeck <linux@roeck-us.net>

>  target/arm/translate.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index f5acd32e76a..528b93dffa2 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -5282,7 +5282,14 @@ static bool valid_cp(DisasContext *s, int cp)
>       * only cp14 and cp15 are valid, and other values aren't considered
>       * to be in the coprocessor-instruction space at all. v8M still
>       * permits coprocessors 0..7.
> +     * For XScale, we must not decode the XScale cp0, cp1 space as
> +     * a standard coprocessor insn, because we want to fall through to
> +     * the legacy disas_xscale_insn() decoder after decodetree is done.
>       */
> +    if (arm_dc_feature(s, ARM_FEATURE_XSCALE) && (cp == 0 || cp == 1)) {
> +        return false;
> +    }
> +
>      if (arm_dc_feature(s, ARM_FEATURE_V8) &&
>          !arm_dc_feature(s, ARM_FEATURE_M)) {
>          return cp >= 14;
> 


