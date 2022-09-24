Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31DC5E8FB0
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:35:04 +0200 (CEST)
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocBrc-0007YM-3y
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBpK-0005C2-31
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:32:42 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBpI-0003YO-6p
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:32:41 -0400
Received: by mail-qk1-x72c.google.com with SMTP id g2so2084945qkk.1
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5pF6IUHghOTeutu8LD0vxwDH+SYVVn7MC0kUnvRcONE=;
 b=MWyAF06E6IhmboCRe6tw6FKAuShSEJfUkgDsP4ywOz0A3h9W+ljKRhIh6Kn6cvc9cP
 GUKvjIzdcZthtplOC6ImIEajaysTCgB7XNeRZghQbLMnK5o0MrG+zmsmI4xr6D2Tw8w3
 kQxLWohlDMWCzCl/B6SLrAmY2mItEiM0mCQzMLw+joEhOWDOZCBB8vCrS+5TJPW1t2Xw
 v7qrJa2IjzeaJN90RncOz2pAA4PKx7CEPxT0nzOdZx44NT02RBMc8Tuu2Kh7n4zqHlMX
 S9fgMhXzdm6re62UsM+EjLysEjHTBg07iRwevCi4NoPHrywuKechcD/P8uImi6BIRUBw
 kfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5pF6IUHghOTeutu8LD0vxwDH+SYVVn7MC0kUnvRcONE=;
 b=slp8lZcGo5EzCVOCaM9gFx8AVfRDG11g5NGk54VTaVnzBnxP037Taf24y1iXaki7k2
 /ctjZ3ahlScoAsbd8K/0KwuAJlUG4BWv5tbxcB7jjUmsnxF6EwwoIA2FVfWnOUMKu0+J
 DQfpB7a/Poter2tEfmmdi4xU69/8oG9K7s5uP6jR3AYwyMOqCjsOOdeCzb5R4XoV14a5
 4z/RN0wHylIRPY9bgEcD70u3h0jAXJpIcrOC8UqsuosQfU86VWOh3DLx4JP4DL6+cRVJ
 TA24Jw6JVGKPbJ7qfDQV8HHaFH4GmlRLGPq0lwZSf3yuhYlrzTtnvqMNNW/+13BSeaAI
 8PWw==
X-Gm-Message-State: ACrzQf1/xvY0Wm3QyxpZH/n6grVD+ZdDPYG61UAnZAu5jdXxsWX+CcLK
 gIIlNaTEhqJinB5ZvXjzRNKhTg==
X-Google-Smtp-Source: AMsMyM5HIfH8iWEuZ81LjkebcItNn1+F8YbXn7BEe/V4N+tdl9W8ON8Tbh+KQq94IZK0ESA9n0ZQLw==
X-Received: by 2002:a37:e10e:0:b0:6cd:f114:6a85 with SMTP id
 c14-20020a37e10e000000b006cdf1146a85mr9918444qkm.77.1664051558960; 
 Sat, 24 Sep 2022 13:32:38 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 bp36-20020a05620a45a400b006bb78d095c5sm8595961qkb.79.2022.09.24.13.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:32:38 -0700 (PDT)
Message-ID: <3f544c0d-6060-7add-7d52-3f8fdb265823@linaro.org>
Date: Sat, 24 Sep 2022 20:32:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 20/37] target/i386: reimplement 0x0f 0xd8-0xdf,
 0xe8-0xef, 0xf8-0xff, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-21-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-21-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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

On 9/20/22 17:24, Paolo Bonzini wrote:
> These are more simple integer instructions present in both MMX and SSE/AVX,
> with no holes that were later occupied by newer instructions.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 28 ++++++++++++++++++++++++++++
>   target/i386/tcg/emit.c.inc       | 32 ++++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |  4 +++-
>   3 files changed, 63 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

