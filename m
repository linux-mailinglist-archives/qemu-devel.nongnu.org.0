Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6256C5E8D4B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:24:09 +0200 (CEST)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc64e-0003ce-73
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc5zO-0005IQ-Vt
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:18:47 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc5zN-0000am-IR
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:18:42 -0400
Received: by mail-qk1-x734.google.com with SMTP id g2so1752696qkk.1
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=9jFP2w9HwZINcJL1Gdtup6WUY1Jn57KpAgIuVpEFqp0=;
 b=AK3dFpYY+N6tJBSuwM+EnjjBwF0kH4RLcv4HVBvObw95O6kdyIdxQ1PA5CEkk1ZHHW
 yQEsxtMDw5BqPIRnxQzCMGk8wGCDZf4jc3tXXFZzIpAxqenhsAqgQ8tUEyMPYUStZMTb
 WbBeeGuk3Yv4aAT2rwkdU9az4DSO4UpuvnlKtGzAnT2eku5Z6VMQCXxlPn/eARUHC1Ds
 yGAgKCEc3FbwDNNMVhbzFbtHR103RlpMK/1k8A+bllGko0AJQf+RlrbpzP8GbEaT8Wm2
 +a8gmKaBYb+9HGU2X7z/XVl+bSw9vlgRy/cOig/Nw9VnWwKBWw98ZDMI4myqTjvZYeZ5
 JWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9jFP2w9HwZINcJL1Gdtup6WUY1Jn57KpAgIuVpEFqp0=;
 b=s3fh0m9jErcygKTUdHqXW8jA0vfPau2X/zkHQBhtNRtM6o2dTvqV12ytYi2qW5rsjw
 IOCpFHAaWYYedyAByj565JHiiYUWzWUHrsIrBI8HDv2puP1Z/uYyiBhlH3sOiZ8oXGn9
 V0S5n47PFVpD8VhLBItygkYMCzgQsmaY4ScGF/ck2Le9Fj3+2vvJUK0OOC5evsyiuvt7
 IIR+uzX3Y7L1P4O8dr7P2BboGLNTwCXgGUJPG9/Qp7AZZ9qyQKKgLXKX9bIoJysX2equ
 uyq0xB2JFt8RgMfkW9Xs1R021KLLTRlkArNGBvKNUAU17WLIUPKvS+3RI3sJEqoXEZdW
 nBEw==
X-Gm-Message-State: ACrzQf0hm/KHbsp9HnMh2jA60PfluGTDt2n80gMjeASftEjNyWBApgSw
 c8LTXG4FVYYicCUaJwR+K3G23Q==
X-Google-Smtp-Source: AMsMyM4IRKFOqHro5eVJAra85SgKkWCqKHh7uUTWEK+KagjZ1LkjZ37Tvoy5Hj8IhDdcSnIh2p5coQ==
X-Received: by 2002:a37:691:0:b0:6cf:532a:6f4c with SMTP id
 139-20020a370691000000b006cf532a6f4cmr9007859qkg.89.1664029120632; 
 Sat, 24 Sep 2022 07:18:40 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 d8-20020ac85348000000b003445b83de67sm7355357qto.3.2022.09.24.07.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:18:40 -0700 (PDT)
Message-ID: <d75d39f4-7659-ed3d-5cd4-2692fb64929e@linaro.org>
Date: Sat, 24 Sep 2022 14:18:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/12] target/ppc: Move V(ADD|SUB)CUW to decodetree and
 use gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-4-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/23/22 21:47, Lucas Mateus Castro(alqotel) wrote:
> +static void gen_VADDCUW(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> +{
> +    tcg_gen_not_vec(vece, a, a);
> +    tcg_gen_cmp_vec(TCG_COND_LTU, vece, t, a, b);
> +    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(t, vece, 1));
> +}

I wondered about negate instead of masking the low bit, but either works.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

