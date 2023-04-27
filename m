Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D856F6F04AD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:04:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przPS-0001nu-LX; Thu, 27 Apr 2023 07:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przPR-0001nB-0g
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:03:33 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przPN-0006X5-BL
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:03:32 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5058181d58dso14688663a12.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 04:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682593406; x=1685185406;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TpGhvTUuIWhDb4oOqwYEB8icaEpGkf3AS2qf5pv6Ew8=;
 b=GHRmSlMMhO+BZ8IVnx988XyhokIk2Y131x6clok7OuoaRRF+wjH2lu/zQg0kQwl28N
 J9ow0RzrIaH7Vk4etYHRlXmM0DI0MHCwOAe6x4S3JH/5jEC8BfJcrXt8fyyAERpT1KrX
 1VRk+D87DBTvpXyeSVYaff+7tlLo9+AB/p4ebw/2DIh4NX1SaAD4MhYek33zeSczne/W
 aAFUOf7CvQC+sfUqzO6rBONmnHMTcXxXc0PK4RK8L4oUbY2NozvQ20lGrK40WqZIJcI8
 GWi4mGZI61TmDqCDvfCiXYTKYFq95ha5HIYGQAbTRydtOjIiFdM03ZaBGgSduDg65VIX
 79UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682593406; x=1685185406;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TpGhvTUuIWhDb4oOqwYEB8icaEpGkf3AS2qf5pv6Ew8=;
 b=hul3eWndDDvFTqHuqquIGzC8HsGQFq9SSzNJkPSt8yhWUEbh4b1Zsg54xNILUpfTO5
 CEjKAGNntjk3nvtfxZ0yvVboJ5CRkgoIiWD9Ap9efaSYkptYv572DjbauNrx3uMMX8ci
 Auc8xcLN4Wge/zTpYFTZcKivSPZVPD8eMScnn4UUa8KN+kTd0TUKwN7mAAmpn642pKEj
 2tR3Q32Ah1UB2wf2zGuMbBLR8u41PvyRnPceGCV8TkeH5vxAuNNPzif6GDn3q95pPSHX
 93xUqscU9AwnTqiH+lzGfvvVwUVuqTF+DA4P0f9yf1g4+jlroEXhfhb5OrcOaHdJvNHa
 7i4g==
X-Gm-Message-State: AC+VfDzDEgp2fiJAX/Oqq3NRvAxDcqoplP77zxfDa7etsSN9rdBabjjT
 sEM6cvDvmMT92G8yv+yUt3qz9A==
X-Google-Smtp-Source: ACHHUZ7kgoaVVhG4hwvW4Q32FU0QpD6OVWgDKUtPY2o6uasymLqSvBaKpjp3NJCNTE6nf55wFBz86A==
X-Received: by 2002:a05:6402:206:b0:506:7386:88d7 with SMTP id
 t6-20020a056402020600b00506738688d7mr1219850edv.11.1682593405935; 
 Thu, 27 Apr 2023 04:03:25 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 ho17-20020a1709070e9100b0094edfbd475csm9279243ejc.127.2023.04.27.04.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 04:03:25 -0700 (PDT)
Message-ID: <64c1bf5b-d465-c1bc-7546-bc6ebd68a641@linaro.org>
Date: Thu, 27 Apr 2023 12:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 17/21] Hexagon (target/hexagon) Move new_value to
 DisasContext
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-8-tsimpson@quicinc.com>
 <b695d0e6-7b8f-e335-bfb0-5475b342410e@linaro.org>
In-Reply-To: <b695d0e6-7b8f-e335-bfb0-5475b342410e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/27/23 12:01, Richard Henderson wrote:
> On 4/26/23 01:42, Taylor Simpson wrote:
>> +    for (i = 0; i < TOTAL_PER_THREAD_REGS; i++) {
>> +        ctx->new_value[i] = NULL;
>> +    }
> 
> Perhaps
> 
>    memset(ctx->new_value, 0, sizeof(ctx->new_value));
> 
> Though probably the compiler would make that transformation.
> Or perhaps
> 
> -    DisasContext ctx;
> +    DisasContext ctx = { 0 };
> 
> in gen_intermediate_code, and eliminate other 0 init in gen_start_packet?

Duh, start packet is called more than once per TB.


r~

