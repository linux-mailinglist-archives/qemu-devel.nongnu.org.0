Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255CB5A2BD2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:00:07 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbkc-0007YR-4y
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRbhk-0002X8-GO
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:57:08 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRbhi-0004JD-LX
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:57:08 -0400
Received: by mail-pj1-x1033.google.com with SMTP id hf17so2025000pjb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=irv813brwFgS6BkL31lBC8qQEKmldFki90IhvNFkHwo=;
 b=ZNxQduYOTmzGstuH8SEBzBy7az/ZIGVt1DalgBE0s/m5g/JH3jDwxaBguk8y44CSMC
 8zKKM12rJ8q97gU56NHJ726A1HnDyK21uOXkab1zGcpCiq06GV3NhcmBopES/VjEBylv
 6XeT9w8E8v1hhkeJgY/9Mm2itjtJvEUoxYSt892jTkqtTRq3qxiat1Av155YObOSDpgh
 STVVRd57nJzGPjBTYbPBjJoDGRj4LqaUQVNhOEiY9BG1lfzY0AYr4DIBQQgDtpPAtyCa
 sE6qljUKJq43h71ZhJpe/vCorXk4lnVqP9ndznikLEvqnupNpNhFPwBns26C+CZN+vaJ
 id8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=irv813brwFgS6BkL31lBC8qQEKmldFki90IhvNFkHwo=;
 b=j1+xG9aM4z12fgaNLF/RYdPlXLQHVSVku+IB2Xa8bWuIdvj4knHOqDsMAWCdtfIrKV
 Dd/kzjqRGlC+QKzXgA8rR8HVAqSYto9IMtZabpxYZ6lM5TecKXm+k6gA9tGB5ZvSNjRc
 faNQ5VJMc1Y+66bThe/byI1jhzKFpvITgTJO5enw2DX+SRGfMPDEiH0jCE2aDDhxsjdB
 wvPiEP8B2fhxlk6Qw4cEbUlvhjyPMu+q7Tl80jwiCDy+auT6M4bSCjaoymI7N2+UTe1Q
 6AsHkWon2shGcH4j6aYqln1F3Z0DoSH4x8U/G0wYE9/ukINw0Y66RHs1oCvv0KkE9dYn
 4O/A==
X-Gm-Message-State: ACgBeo34GF7eYeuVRCS9110bUTICvgpTinyYn8QT4+H72wcHvMEdkjEQ
 3gIl4yYnvAs8rcVJQfYAzzqdPA==
X-Google-Smtp-Source: AA6agR7YYWsM+irjBOOKk8rGW37GuWDZJINbOBQ/gwEmZu6AV3q7DJbuqoPP3ydelTPT5nwNSfEOcA==
X-Received: by 2002:a17:903:2410:b0:171:4bbc:2526 with SMTP id
 e16-20020a170903241000b001714bbc2526mr4219839plo.62.1661529425306; 
 Fri, 26 Aug 2022 08:57:05 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a170902c40d00b001743ba85d39sm1753094plk.110.2022.08.26.08.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 08:57:04 -0700 (PDT)
Message-ID: <84690d10-6004-9a81-3c68-917e981d9b2a@linaro.org>
Date: Fri, 26 Aug 2022 08:57:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 17/18] i386: AVX pclmulqdq prep
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-18-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-18-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 8/25/22 15:14, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Make the pclmulqdq helper AVX ready
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-21-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 29 ++++++++++++++++++++++-------
>   1 file changed, 22 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

