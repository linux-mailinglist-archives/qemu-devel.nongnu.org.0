Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B25B6BC4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:38:37 +0200 (CEST)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3JM-00064T-VH
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3EY-0002V9-24
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:33:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3EW-0006dD-Gu
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:33:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id j26so8918377wms.0
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=E8/HD26dvjSDJU2ZStSvqo1dDlOgb4hlv+a+sVh+ucQ=;
 b=dhlxRdEI44tglcBvP0lB9pBvg+WQS0yLEPLHSpCjFsKNCcptvJE7njUyRUC3mJSq0g
 Mafw8IdSnpmm9B0qhAQNF+CNJs7YCVoz0FUm2TKKqUXugZnWZcSEnyY2A8xD1pM7jAOX
 nXknWzVJiZ2JlN/4BkjrylqLIgPrpCkecWP/g9mNclxpIjzKBYkoTd4tXrrLI8nUHAeI
 m52gYDy/0HE/z1eJM1oHm9/0+WyoK4qW9KfhEgwtypjI+ark1b5t2Qy+CVIXs8hWP3Ch
 DtNIwnr96PBU5OMBOJjErts0p9uAaTJIOJIK269QAA8FkhjWGK0ACHlCLiJWMx6ZCZfK
 aCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=E8/HD26dvjSDJU2ZStSvqo1dDlOgb4hlv+a+sVh+ucQ=;
 b=PCisa6MLI/ozN7eBdVjFBrhekRRMUdenLqzjNmlOZ6mxraao94vtyHVIih7IlzOBQi
 xKg3ivpPWqAU+TaHc1LUXUM52l0mw8XgWobg9Xyj2TP2m++QwW/wLTOhfLJJum3hFFHK
 sP0pR7E8ndCHD2dMxOJwUmD7/vJ6dGAvXq8cJMYX0aDff1dQJWXyRQbqEmJnUzubisX6
 cHqZslp7v7eK5iCflyA5uhNYuAywzL1lGJIyodrm/icPTdTzhFKNFAnJMahokRyrQxMj
 2XoviI9zxcvHhGzMIKm9x9wGprfgHuPe///L/oJIE3BpCdhFKeM159Wa0a6ff1nEw0U3
 mt8w==
X-Gm-Message-State: ACgBeo2egZ+oYUSrJGbJoIqnMtIs6+vZeEz9bTE19xVLHCJ0gxiP49Ll
 LYgP8DdD1FI6xBsJTkGo2UeCBQ==
X-Google-Smtp-Source: AA6agR4xZGvnsLoTst+yifLsvEOyvCXlJZihrW4Q8MetwmBNeeWPLww2jR2y9YNxkdK40iD2ExC8fw==
X-Received: by 2002:a05:600c:5122:b0:3b4:768d:f491 with SMTP id
 o34-20020a05600c512200b003b4768df491mr2001295wms.68.1663065214746; 
 Tue, 13 Sep 2022 03:33:34 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 ay8-20020a05600c1e0800b003b491f99a25sm4776398wmb.22.2022.09.13.03.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:33:34 -0700 (PDT)
Message-ID: <dc5369f0-2cc6-fd83-8352-c14c5bb32679@linaro.org>
Date: Tue, 13 Sep 2022 11:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 35/37] tests/tcg: extend SSE tests to AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-36-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-36-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> Extracted from a patch by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   tests/tcg/i386/Makefile.target |   2 +-
>   tests/tcg/i386/test-avx.c      | 201 ++++++++++++++++++---------------
>   tests/tcg/i386/test-avx.py     |   3 +-
>   3 files changed, 112 insertions(+), 94 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

