Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C104E38E8DB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:39:27 +0200 (CEST)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBjq-0003eg-FO
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llBWI-0007ta-B1
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:25:26 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llBWF-00011c-G3
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:25:26 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 27so18911323pgy.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W4ncQTlkrLjNIVCwQEXh7F+UiLInbe/9+tKjf7zK1NE=;
 b=xws2pm3nF0QVgQayXTwMvVRlR/gOEH0WYb0rWVWQHQWTK1p7ZthGKrlFP++QCmACIf
 D0m4hp7OxFJI4d0HrcVViEvyafE78twk3ZsJSp9weZAK9ASjxzg9Qayqa/aI57dk7wsq
 MdtOcVSj/Q7p1xPHKBtnIuKJ2vxWr8KhFYoFmjMARPwdjhXkKY9IJaTaglDZpZa3AJeM
 Bu//w/InT5xTzSyCFjiMW5Z5XOyO2WyvVNWegtJkYj82K5w7zeqdiol2WtlN8hdj2gPa
 8990CqjnrNdnTmRH/UbM3d2h9eC6iY4ias7zRrSmvLf7af0sDTrU3/ISTVjSIhL2gMcL
 398g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W4ncQTlkrLjNIVCwQEXh7F+UiLInbe/9+tKjf7zK1NE=;
 b=BsK3v2pr6Sa2GxGUo8BhKk66Ev5D5nBZipeKtx1SFdLKjLjR1m8KqDYGXIl2exo7Ro
 WLz+qu4BqRchSUH8PggsC2o/JYWVSJnj7o/p+c4RnHiF8fNb/UmrnS3887gzY2A9nQhI
 PHTYk+2p2QRSFwx+HT2Anf4v1ekgWGVVV9Q0HuPV0n2PlgyUPRT+84T6BNSw8JTI5awV
 Uou7cCj7TWPkXbbBMchJ74Uwq6XlWzJ1oY/gYZ8SzFah2qgPHP7kNTI1vSuz6mY0BX+k
 9n6uUOo95ssr6Ct8wxs5DUFKkOtFuwdswCpzmd91tztMFw9zhBFxr+qjBRcEOJuVJmyC
 kEPw==
X-Gm-Message-State: AOAM532WgdvKJQ5PE/4dFgZSw4+SC3K6QitXrM186YqOZHcRfNn+KaLb
 8IpRumZGIqaJL6JB+OjraBG73Q==
X-Google-Smtp-Source: ABdhPJwK8okGhUglxBjvRN//AsKbyXRfrpDQegQyBz614IREtWaAclgNYoAFIpPpt+lwp6ZTYcoZqw==
X-Received: by 2002:a05:6a00:d4f:b029:2dd:3ce4:9c69 with SMTP id
 n15-20020a056a000d4fb02902dd3ce49c69mr24748304pfv.65.1621866321983; 
 Mon, 24 May 2021 07:25:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y76sm9556833pfb.74.2021.05.24.07.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 07:25:21 -0700 (PDT)
Subject: Re: [PATCH 6/6] hw/arm: Model TCMs in the SSE-300, not the AN547
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2d77c52-c816-3c40-d1e0-c71141c6663b@linaro.org>
Date: Mon, 24 May 2021 07:25:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 12:08 PM, Peter Maydell wrote:
> The SSE-300 has an ITCM at 0x0000_0000 and a DTCM at 0x2000_0000.
> Currently we model these in the AN547 board, but this is conceptually
> wrong, because they are a part of the SSE-300 itself. Move the
> modelling of the TCMs out of mps2-tz.c into sse300.c.
> 
> This has no guest-visible effects.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/armsse.h |  2 ++
>   hw/arm/armsse.c         | 19 +++++++++++++++++++
>   hw/arm/mps2-tz.c        | 12 ------------
>   3 files changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

