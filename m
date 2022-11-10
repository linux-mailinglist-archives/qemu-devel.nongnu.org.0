Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C6623B73
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:45:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0Ms-0005fx-TD; Thu, 10 Nov 2022 00:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Mo-0005cw-Os
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:44:46 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Mn-0004xS-9r
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:44:46 -0500
Received: by mail-pf1-x431.google.com with SMTP id k15so949387pfg.2
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QNa6LIfLiz4YfalJHxTzZ5HDO6DWf6I0joCsVY5xBF0=;
 b=IQlMhyRWxp/Ndc3NnkUTjXXW12knKqn7ePN7z5pSZxX5TChG7FIqRuSXCHifyPmNIP
 FjEfnsFQt0LuJHzbXwodEJunGCdyn9UsvKxD4onNctkAjSaFMjC7ngRokwNeKkJH1L2m
 tesJFS3HsgNknLe0QFSSTnx/DHhpx+EdjEVrKNpX5t6npS3SEvVgreCJe3nYV1wSELgT
 SwfW1/m2ogDwz8EyzWGndIff8GXPJENGRsu9x/lFehV3tJ/flxwD1pC4j9gwDbwZZK3+
 CEXnF74HS30wRDMpD2hbk565Egn6wC2EEs1sb9BNjSgojwtrXWq9SNosrKXU3z96zOOV
 ZmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QNa6LIfLiz4YfalJHxTzZ5HDO6DWf6I0joCsVY5xBF0=;
 b=WQlrYjLe7SR5gI45h8CDQHwtFlyEPbkR0YkQUYUWgxm7pE/hQXafFTHZnkJGbpAbEa
 o7i5Y0ibsnC9bc331eU5H8qw51X7OH2BXnyw4QQTw1bhlI1oJwIbxDP8sc5Cbyyuw/Om
 Dst/+qr9dg0cc6UuM1SYTw+N4mgugqtlQ5fnmbKJZsXyGVrcO/GWt5WtROkFKsQPpSdq
 JTIslhRrJ1LO/fClbU+Qb7klfus+ToEMws3MyrD1Dp2bznfHxgE5PFwdyKVRR29mIYh5
 SLFVmbUBTjd7cWkczWoBrSrdgUEsWYdn1iEmraPD7Mhvx0PO3b0emLeES6qW1DwjeX9X
 tjEA==
X-Gm-Message-State: ACrzQf2+mDv2vNbu72ERGTNEmqno3ZvlRybK9ZSnVUp3vyPqbhaqo8rs
 qwCKBSmbtSN+bnCZ8bPoqKQhg3zhPWZ17T54
X-Google-Smtp-Source: AMsMyM7Z8PT7R5hm/1XQTQHlyqjmGnJWByn66AVOybZw0nqYTNcdNxIqv4bsrNW9rwKJC0a5iRw6aw==
X-Received: by 2002:a63:251:0:b0:46e:9da8:1f93 with SMTP id
 78-20020a630251000000b0046e9da81f93mr53948309pgc.490.1668059083484; 
 Wed, 09 Nov 2022 21:44:43 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 v2-20020aa799c2000000b00561dcfa700asm9220358pfi.107.2022.11.09.21.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:44:42 -0800 (PST)
Message-ID: <cb81eead-0913-b454-803d-882c24cb6322@linaro.org>
Date: Thu, 10 Nov 2022 16:44:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 9/9] hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_KVM_ARM_ITS device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

