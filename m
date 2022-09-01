Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E435A9261
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:49:38 +0200 (CEST)
Received: from localhost ([::1]:37116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTftI-0002Xu-N8
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfCt-0008PJ-Ds
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:05:52 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfCr-0005kJ-4q
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:05:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so922473wmb.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=D59met/+7NtmeNAmteNmflGNA2qXvQzBjDX7IszSRFk=;
 b=rYyx0XohwpSIy2dT2otOkbhRDtbUvGR30zfV2lg3TYoD+RzAkZ+6WmMi5+JbelVYYK
 ggSoEbh9zcaGItwKMNXE/mByGWKXSDZ+eBLKa7a1zpvrSXZJ0DP8TZoF10x3EvLE2f2E
 /DootEup9zWbzq4ajCcXt3SkorGNbrw18wD62fWVp/BhA2vy+wWyuIXPgO7JE8FoLXFa
 6vt0M+6biYWT42sVbmI/0DH4t+5ZogeuhfPx8hMuesu58dbqCE3mrTjKgFMs1zAf78EB
 LUlyGw+O0wtXpI04K3oEEwiaEYVLSo0aFRklyfEK2novfFWjd/QO/0k/8cgADcBvqwCL
 3mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=D59met/+7NtmeNAmteNmflGNA2qXvQzBjDX7IszSRFk=;
 b=pC/QoUYPrSQHoGXCL5k9NJNYTayiaNYOsUirbeDBpDiLmvre//8O0VFj3/GzA5GmGE
 Zz/Rh/9n6WEXzS5MlqKwSzDJacEXhRtAMM60gWBHnVoPA0nylpVVqMunOxoywbHl1ezJ
 g5Bl3nBHZiuuuuj8y+PAzXww4p/3NuF6yDjc15eyoECER6wzWUQsMNijH71ch5OWZSSq
 Rr/D6iZVCbD4p2cs9IjOGlgEfPuZuA14lhdlN5S6lrlu0njKmD8rbe39mppDPuA9QFzj
 nqX7a7IcQXRdBYwmNgcbnwxU7BKQpSTEPy8wXRWYugLeHhFlgJDz3gDBAqD/bZ0Y/6AH
 z+jw==
X-Gm-Message-State: ACgBeo2/+31lRokYnNOX8/DasYwDZ5d3LGYiv46JpBSLnb7cM2FJqGAd
 ANNumdwAAGjVswCV3TzxsrfZEw==
X-Google-Smtp-Source: AA6agR4I5mKiCEvezgLyuX7dKdVlhMtU3zQn3Pg210t/ZcD5Urn02f8M8rZVW397eBWxfqtIf6voNw==
X-Received: by 2002:a05:600c:1554:b0:3a6:23d7:1669 with SMTP id
 f20-20020a05600c155400b003a623d71669mr4389185wmg.70.1662019543521; 
 Thu, 01 Sep 2022 01:05:43 -0700 (PDT)
Received: from [192.168.45.227] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b003a60ff7c082sm4894884wmg.15.2022.09.01.01.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:05:42 -0700 (PDT)
Message-ID: <a283b714-abfe-c859-0f30-cdaa144f084f@linaro.org>
Date: Thu, 1 Sep 2022 09:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/23] i386: check SSE table flags instead of
 hardcoding opcodes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220901074842.57424-1-pbonzini@redhat.com>
 <20220901074842.57424-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220901074842.57424-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

On 9/1/22 08:48, Paolo Bonzini wrote:
> Put more flags to work to avoid hardcoding lists of opcodes.  The op7 case
> for SSE_OPF_CMP is included for homogeneity and because AVX needs it, but
> it is never used by SSE or MMX.
> 
> Extracted from a patch by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 75 +++++++++++++++----------------------
>   1 file changed, 31 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

