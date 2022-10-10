Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A535E5FA457
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:51:48 +0200 (CEST)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyoV-00028Q-DO
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyUz-0004sA-KI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:31:59 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyUx-0006gg-Oo
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:31:37 -0400
Received: by mail-pf1-x432.google.com with SMTP id h13so10147373pfr.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+w55l5I2G6+CDwxjgZhVJm7/qI66ZNF7lfcvKTXmSTc=;
 b=LxIXA2/updTA645eXrdjderjZKCLrWMCSG3QHIxIxJlctUpKBnGD7vKl4kXBu5fvSz
 ymLKLshyqa3r61TLCPXNlFDvKTOtOTLjBeaqdk9xGhiHA0OaaO9AwwLdWSOKLTNJZpDt
 0sjk67Yd06Jm/JpysNVWjQsSdUQ/SoRLPZ+4kCF04DgNeVWq/Hq9cATvjOaimWxMzoEA
 Hju4+fZZx97Ca0gY+A621YTDKiwBulidJxzwyGl0gnZaTwhDp+A7Ge0ILUGIAmkmoIc6
 fH9nJ2VeOZ1J3P6ZzTeghmo/98a6NQi70rfNMfFIsgccTTCtjJ2v/isnYsbAH50VtYgQ
 O4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+w55l5I2G6+CDwxjgZhVJm7/qI66ZNF7lfcvKTXmSTc=;
 b=Ta+vxX4+Zh5nE37qTCElMJ8H1g/VjeEcWvBG/t1hAOCijSA/1GJIpzZSqumYOFsIrP
 lzFxF3yrDJOwzKx/J5CwusRvZaCKGxVyjdgc18G8FPifLtTwpRFEQBRqpS+rEXA7EoHK
 ai5XmmyRLtZPwiiaXsdS1wI2LubRiWurIs12qG/HBxE0nJqhGKNjM5kRCDbC+F/4s/Ds
 xJwr34kiHk1MdxeDNuleR8mnzddr6ZBGVHko8Un/c8L2ItKBC6G+ptnEfzy6o08ZCBtw
 f+yYjpwCGcruKdBZZWoW5TGHRqwb6k93LE4sAZ+ddKm5/Ka2j+TmKeo04PZDeRoCek2S
 lImg==
X-Gm-Message-State: ACrzQf1wGJqMTqtvfOr5WbA7K5v3kOPOzCTnJSm+oPdFa0ftX/LmSueI
 GaImDIOTNScy/VGXImkbJKqJQg==
X-Google-Smtp-Source: AMsMyM4wlqGo/88w8AG5HpbELJ2Dy1rpO/yWJ6GMdyAwi8kZEhOjjoWUjPFMZPSnOdS9YrDhAISm8A==
X-Received: by 2002:a63:5d50:0:b0:45f:f5c7:de9b with SMTP id
 o16-20020a635d50000000b0045ff5c7de9bmr12565225pgm.10.1665430294229; 
 Mon, 10 Oct 2022 12:31:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 w65-20020a626244000000b00562235244c0sm7294261pfb.6.2022.10.10.12.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 12:31:33 -0700 (PDT)
Message-ID: <29d2fa57-b980-3c52-3154-0921b93e1998@linaro.org>
Date: Mon, 10 Oct 2022 12:31:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 11/12] target/ppc: Moved XSTSTDC[QDS]P to decodetree
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
 <20221010191356.83659-12-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221010191356.83659-12-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/22 12:13, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Moved XSTSTDCSP, XSTSTDCDP and XSTSTDCQP to decodetree and moved some of
> its decoding away from the helper as previously the DCMX, XB and BF were
> calculated in the helper with the help of cpu_env, now that part was
> moved to the decodetree with the rest.
> 
> xvtstdcsp:
> rept    loop    master             patch
> 8       12500   1,85393600         1,94683600 (+5.0%)
> 25      4000    1,78779800         1,92479000 (+7.7%)
> 100     1000    2,12775000         2,28895500 (+7.6%)
> 500     200     2,99655300         3,23102900 (+7.8%)
> 2500    40      6,89082200         7,44827500 (+8.1%)
> 8000    12     17,50585500        18,95152100 (+8.3%)
> 
> xvtstdcdp:
> rept    loop    master             patch
> 8       12500   1,39043100         1,33539800 (-4.0%)
> 25      4000    1,35731800         1,37347800 (+1.2%)
> 100     1000    1,51514800         1,56053000 (+3.0%)
> 500     200     2,21014400         2,47906000 (+12.2%)
> 2500    40      5,39488200         6,68766700 (+24.0%)
> 8000    12     13,98623900        18,17661900 (+30.0%)
> 
> xvtstdcdp:
> rept    loop    master             patch
> 8       12500   1,35123800         1,34455800 (-0.5%)
> 25      4000    1,36441200         1,36759600 (+0.2%)
> 100     1000    1,49763500         1,54138400 (+2.9%)
> 500     200     2,19020200         2,46196400 (+12.4%)
> 2500    40      5,39265700         6,68147900 (+23.9%)
> 8000    12     14,04163600        18,19669600 (+29.6%)
> 
> As some values are now decoded outside the helper and passed to it as an
> argument the number of arguments of the helper increased, the number
> of TCGop needed to load the arguments increased. I suspect that's why
> the slow-down in the tests with a high REPT but low LOOP.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 114 +++++++++-------------------
>   target/ppc/helper.h                 |   6 +-
>   target/ppc/insn32.decode            |   6 ++
>   target/ppc/translate/vsx-impl.c.inc |  20 ++++-
>   target/ppc/translate/vsx-ops.c.inc  |   4 -
>   5 files changed, 60 insertions(+), 90 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

