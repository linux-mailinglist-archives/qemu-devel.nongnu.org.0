Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B55E8D55
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:31:40 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6Bv-000116-SU
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc69o-0007Kh-IE
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:29:29 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc69j-00022H-MW
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:29:28 -0400
Received: by mail-qt1-x829.google.com with SMTP id w2so1684338qtv.9
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5flDDN51qxTXqUaDGsajQHNFi2M/wKhkBjxZ/2uxO4g=;
 b=t08uUaHypQ9krTtsg2CW9IOx7yTm612XcceBBHRBsBrsaYvQqLbkx8vozqdLEYWKXY
 L4Jwgp44kqYNsuoKVByiINtIojxmfeJrfidcufMGjT3NVIA4dyyofgteA1HKmLx/NpGH
 Z3sTdySS90DwiMfDc8cpPIlCEazonQwhP4RErO2j/M4HxMeg49liCKGH+s1wRE92emOd
 DcSABOcnDaJUp14CzDkHeXAroBnU/cS26YbJrCTcqncrbOkdp5QIax2w48On+5TcvIjU
 khZUmoQ8/GBPzd0OTPVcxhGyDHRG85lvsts9jJ/e0w0HBHNpUkwQnZty06aJPy7U5vSH
 AuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5flDDN51qxTXqUaDGsajQHNFi2M/wKhkBjxZ/2uxO4g=;
 b=1e70kaCCrWcmRjs15ry7K80mFMnrQcEb4SBD54oOoUgq+1rYZIYvMNK7+B5TOuFT/M
 gkn8RyEVwRCLjxq4MJhV+XrdbD0HR8GoHWuSIn8aW2cDb60g4ocjtJkF0Kcpo3vzwZlz
 6e1aCw5EMu36zJHdsd5ej5/t3oaezlcCEsT+5ZOiFMndMjvm7wN13YG8T7gFxHnt7ANr
 TTUN7bQ9xPKguPDEdB+g/8wldI7wjkL1ZXi0PXgcwnuakHinnNNfjA9MhtY1sBXc4gVk
 +T/2TI8r5mbwTRL3dGj1wZ1hjvFRBxjZ7MgzNuXnB/hErIjfBPtxOxaFErCHY7ElI5kh
 htow==
X-Gm-Message-State: ACrzQf3hguWRe8TFqjvFD06fimFBINUodJFTVEaRMe/tm7kIAqMcZ6oq
 FLz0doImrXrBCr1gW6OL6scBFwd+tQjxNuTA
X-Google-Smtp-Source: AMsMyM5l9yWtC1qatLmQr3JXAbuu/vZG5/eIKQetTHTpVksdtW74xS+NoFvH7n1PaPsAJj05WjomZA==
X-Received: by 2002:ac8:7f0a:0:b0:35c:e943:cde7 with SMTP id
 f10-20020ac87f0a000000b0035ce943cde7mr11466591qtk.158.1664029762691; 
 Sat, 24 Sep 2022 07:29:22 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 o26-20020ac8555a000000b0035ce8965045sm7453098qtr.42.2022.09.24.07.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:29:21 -0700 (PDT)
Message-ID: <73732519-297a-2916-86b2-8ba2bf4c5548@linaro.org>
Date: Sat, 24 Sep 2022 14:29:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/12] target/ppc: Move VPRTYB[WDQ] to decodetree and use
 gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-6-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-6-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> +    /* MO_32 is 2, so 2 iteractions for MO_32 and 3 for MO_64 */
> +    for (i = 0; i < vece; i++) {
> +        tcg_gen_shri_vec(vece, tmp, b, (4 << (vece - i)));
> +        tcg_gen_xor_vec(vece, b, tmp, b);
> +    }
> +    tcg_gen_dupi_vec(vece, tmp, 1);
> +    tcg_gen_and_vec(vece, t, b, tmp);

tcg_constant_vec_matching.  With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Also, could implement the .fni4 and .fni8 functions.

