Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745F4000E2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:59:10 +0200 (CEST)
Received: from localhost ([::1]:54380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9in-0001iN-Hf
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9hp-0000r6-9h
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:58:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9hn-0005bg-Lc
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:58:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id t15so8387442wrg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=w+nA8CYw202ilVLnTMkA3NdoO8LNl+MwuwzqtYbJyeM=;
 b=ZfQmFXGTknfPkIn78LmYXgoM5yAb7MvUuj7iviUjmFjP3pum5mWLdxIJiG5+hexRAQ
 odJTkQum3FesYjExpo3n/HjPH/otmDk4yLPBYq2ALzSek5PDGScl31ncY98ymO0XXT9y
 Y8MS5whLpLgwhOJCKP/TnUtNpYhbuEza17iMo7vzpSc/z9+Nhkz7HsDDHnHpjC7xicfc
 F0PgzmRbxbNEsMKnuh1/VyMG2/973x3s1Nab42ucFmrbKn5raHu+BJ4CEjuMx9e3Qbz3
 /qy4ZrcJj1Y/UrpDb+PNE2AeOQAbUtr0Ib4OMp5zg4cu2A3gRIpyuov5lvL0csSrsnLC
 OVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+nA8CYw202ilVLnTMkA3NdoO8LNl+MwuwzqtYbJyeM=;
 b=RO7CU5kdBuC0lOVdqD5tB+zft2UTlZZvsYnnE0sOHYDQbsTyDU1sY9WSTiwo8h+WRG
 xoWq1ObYEfqjd8WiXGcYxv3I2hPcKXnOEA71sqa5RMfZlsehH/gCTiv7rk/AiPjVgLdD
 0PRt71VmCjYCNs9tRM28nAt0/xbff7b0UiccnYBNQehQIz9gzcpGle7Y+eaUsP0GIHq3
 JH4f68R4/1WACgdCEZHgjU7OB16XDz3cjrGA5tRC33Lhp4ShEXw4i3GmxyLdezgsCrEf
 RunAoOq2v0/GeQEZAbufYRDDpKcnmGfsf49XvHIMgybNzfQrytYrHVXJeN+Rp5/ZgYKR
 M9kQ==
X-Gm-Message-State: AOAM5327ng6waI1IAZd0fOn8hPRXsOrBZz+3wIACxzu2ZjGpsX3wUkVT
 D6fWehgJQVaEygXZFzgtce1ZBt6EYNw9fChu3K4=
X-Google-Smtp-Source: ABdhPJwvR3bIIl+OkxuqVp5UsxHmcTuzDAYFKFpkpw9ZtXY/ctp7ckSBSkV6P9GFTNsDyxD4FNYZbg==
X-Received: by 2002:adf:d184:: with SMTP id v4mr4340093wrc.229.1630677485507; 
 Fri, 03 Sep 2021 06:58:05 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d7sm4793884wrs.39.2021.09.03.06.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:58:05 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
Date: Fri, 3 Sep 2021 15:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Our current codegen for MVE always calls out to helper functions,
> because some byte lanes might be predicated. The common case is
> that in fact there is no predication active and all lanes should
> be updated together, so we can produce better code by detecting
> that and using the TCG generic vector infrastructure.
> 
> Add a TB flag that is set when we can guarantee that there
> is no active MVE predication, and a bool in the DisasContext.
> Subsequent patches will use this flag to generate improved
> code for some instructions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Another of those awkward-to-review patches where the interesting
> question is "did I miss anywhere where we set v7m.vpr to non-0
> or v7m.ltpsize to non-4 while in the middle of a TB ?" ...
> 
> I've left the TB flag as non-cached because there seemed to
> be an irritatingly large set of places where we'd have to do
> an hflags recomputation.

Indeed, non-cached seems like the right option.

> +static bool mve_no_predication(CPUARMState *env)
> +{
> +    /*
> +     * Return true if there is definitely no predication of MVE
> +     * instructions for any reason. (Returning false even if there
> +     * isn't any predication is OK; generated code will just be
> +     * a little worse.)
> +     * We do not account here for partial insn execution due to
> +     * ECI bits as those are already in the TB flags elsewhere.
> +     */

I think you should go ahead and include that here, as it makes the test self-contained, 
and avoids you having to do this:

> +        dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED) && dc->eci == 0;



> +    /* VLLDM or VLSTM helpers might have updated vpr or ltpsize */
> +    s->mve_no_pred = false;

For a moment I was thinking that this was ok, just finish the rest of the TB and resync 
naturally, letting the end of the TB use the helpers.  But then I thought about goto_tb. 
If you have this potentially variable condition, you can't chain the links between this TB 
and the next.

I think you need to go ahead and end the TB and resync immediately.
Just set dc->base.is_jmp = DISAS_UPDATE_NOCHAIN instead.


r~

