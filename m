Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F15E8D63
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:41:26 +0200 (CEST)
Received: from localhost ([::1]:42162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6LN-0006YS-Fh
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6Ft-0001qi-6s
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:35:46 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:35332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6Fr-0002tq-Ie
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:35:44 -0400
Received: by mail-qk1-x729.google.com with SMTP id u28so1764063qku.2
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mGT4dSW64S8O7TTk0b9/ba1TeRuW4tQeQMvF/FZLUfI=;
 b=PoeLVPOfp+QtMTbDn6UQT0/qX47E254eaDmC/ZCzKyQn4vLhWvYU7STJKHbiB9G/Yp
 6O2ybbnWT+NYiJCThVhgl7CCOf5WoZEI/lK/xjahpHsnMeaqTHCypfFVLDvS0ZngHNoi
 JzSUbub2M02aHsN1j310TPvootFPZaUTbFmi3TJBqPhbAE2yNxfUYkBsftC8SftgbJFZ
 1Gojv5U5e+xoGqrj/SEm8ZbOwe71+6r4AGEcKpfQDgDO/gCUnpiksd9ATv8iQ1gg26ll
 J0NBX4wMHEyyhWa6ouyfOq0DQEoL4rbg3XlSJ/PPHV6fDIf3Kcph5xUYLzo4Gm3XVWSF
 UtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mGT4dSW64S8O7TTk0b9/ba1TeRuW4tQeQMvF/FZLUfI=;
 b=DkfafZdRUqQ1K3z/B2z5aMfty/iewyTa1J7x3ZV2fdf9AMtbp8+KVI6tELIXIN4t5z
 ySk3lBKkN5MZ7PyZHcj8mfsKFZcZ5KevxeVLMP49ofDGffehGHQpfEylh7rmIVSfKmnU
 evvOk4Zy8UcFGLqfzObCL6yABaHX4KuPahsV7RdOBJQqfiK6ARUTLuQibhIaMp7GUmYP
 eDyGF4B0coH62isxuOVkwFTuSh9xpf4NYpM4yE5dwNbHg4QJ0SQTULFnZX4fmbKt56IB
 +QfqyqBNdRG5ra2cSIvKeHUt3YLoOm7+p1iC3iS5p3YU/XxJQd/03F/KvRtFLz7VQ3ug
 KKgQ==
X-Gm-Message-State: ACrzQf2aEq6e3IIh9czPeZOffr4soeIunLiaxpAX1b4gu90kOnRd+k5E
 MhIIrdKRN+802OrpOo3kYoCJGQ==
X-Google-Smtp-Source: AMsMyM7YGKPdjv2kxU/HSLgmyr4z1/YgfB4Yo7nw/ja4NOmcoNr8itbJLCTc7B+/+2jv30qF6q+kfA==
X-Received: by 2002:a05:620a:1a96:b0:6cd:f115:62dd with SMTP id
 bl22-20020a05620a1a9600b006cdf11562ddmr9077003qkb.286.1664030141415; 
 Sat, 24 Sep 2022 07:35:41 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 d21-20020ac86155000000b0035cebb79aaesm7595429qtm.18.2022.09.24.07.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:35:40 -0700 (PDT)
Message-ID: <3c43d9b9-7578-c861-b25f-23cfbdfa15b3@linaro.org>
Date: Sat, 24 Sep 2022 14:35:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/12] target/ppc: Move VAVG[SU][BHW] to decodetree and
 use gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-7-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-7-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
> +    TCGv_vec one = tcg_temp_new_vec_matching(t);
> +    tcg_gen_dupi_vec(vece, one, 1);
> +    tcg_gen_or_vec(vece, tmp, a, b);
> +    tcg_gen_and_vec(vece, tmp, tmp, one);

tcg_constant_vec_matching.  With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

