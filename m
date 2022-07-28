Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA1584702
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 22:27:51 +0200 (CEST)
Received: from localhost ([::1]:47670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHA6o-0006iv-5D
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 16:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHA45-0004cO-JQ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 16:25:01 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHA44-000270-0c
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 16:25:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o14-20020a17090a4b4e00b001f2f2b61be5so3269550pjl.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AWfyfXG0clLB30RO72afhGky9uZ0UKn5sAaCFqZ0W6Q=;
 b=ZXWQX6ufTp0anoK9BVOLm3IKblRA9IFZg96Xi5X7PCQufYbvpmrI5jkR0K7B/GjXly
 +lvwqtylTJbt1fRivPOwOyElDDbC8Mll4NLqr/8dw/CRbJu0B6SpzGoT0yi3Yw1vLb/I
 XtGjgZra8h3Fg6rsouGjr+aIWI7AgC3sUYlF4+Gdxl+PF9o+yuLlGbBHC2BtDiCmm923
 5H+Qnij+QJMVWiMcrLfS5hLLSyZm0qAGO7I6qRaKQ2m3TO685k5STNM7PCrs1gThhiPM
 wxXMIzP3qAqismb/s0E0Ehi71/BpL82jA84irEGgj9P2PQetN/e/wLYzSqo8litltsoS
 iKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AWfyfXG0clLB30RO72afhGky9uZ0UKn5sAaCFqZ0W6Q=;
 b=i8dnkhBNn/9u92tW4j2rf60/qOIDMclUItpUwikOW3DUbRMeohT6JAzxri/0EiyChI
 Qf7+kQwJY5c6LYE+yXEKoddVw5nsOjUQF9i7vnLSkXC4TCDvvk7cTMurdPpVtFkHzDzB
 CrzI8/BROppr+dUZnpy7V7qSXKH4URPqnjh8JOVScTQH2bhMKjvszELhfu7D7Me3fj5k
 p7XAz1pHqiUpGNe8TwQl2RQwe7QWjM33QVJrIdtAd/MA0w+9a1KwQjvYHv2Xky8X1OJD
 HT3IJoSeHzJUc74Qjju+1RZaWl6u19i/TVS2umnLoPvQ6lgJzXb6BRIT08jWI2Lo1B0i
 PzDA==
X-Gm-Message-State: ACgBeo3RMHiLeApOIYjQEOxW1txeJw4aLdf7jjigDZeI6PmkRmxEffgm
 PXJbZAJtbDjx6kZh0U+c5hh6+w==
X-Google-Smtp-Source: AA6agR7EG4Q2El3vFtdz/pT3m56vcu8GDF9LJACR8bUc5ai3PJHc+uAlPbehlYFdGA0wWhKpDOzMMQ==
X-Received: by 2002:a17:90a:2948:b0:1f3:1b42:a810 with SMTP id
 x8-20020a17090a294800b001f31b42a810mr404190pjf.203.1659039898237; 
 Thu, 28 Jul 2022 13:24:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:d1a3:8e57:d847:7607?
 ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b0016d3a354cffsm1731343plm.89.2022.07.28.13.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 13:24:57 -0700 (PDT)
Message-ID: <3290dbf5-c87b-2dad-598e-cb2cad04bde4@linaro.org>
Date: Thu, 28 Jul 2022 13:24:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Hexagon (tests/tcg/hexagon) add compiler options to
 EXTRA_CFLAGS
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220726191757.30104-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220726191757.30104-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/26/22 12:17, Taylor Simpson wrote:
> The cross_cc_cflags_hexagon in configure are not getting passed to
> the Hexagon cross compiler.  Set EXTRA_CFLAGS in
> tests/tcg/hexagon/Makefile.target.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/Makefile.target | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
> index 23b9870534..627bf58fe6 100644
> --- a/tests/tcg/hexagon/Makefile.target
> +++ b/tests/tcg/hexagon/Makefile.target
> @@ -20,6 +20,7 @@ EXTRA_RUNS =
>   
>   CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
>   CFLAGS += -fno-unroll-loops
> +EXTRA_CFLAGS += -mv67 -O2
>   
>   HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
>   VPATH += $(HEX_SRC)


