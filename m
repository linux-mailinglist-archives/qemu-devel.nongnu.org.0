Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4509C612FF5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:47:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNdw-0003ET-ES; Mon, 31 Oct 2022 01:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNdt-00037w-9l
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:47:25 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNdr-0005we-P9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:47:24 -0400
Received: by mail-oi1-x230.google.com with SMTP id t62so1082087oib.12
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3W1rvyQPpSbPJX2VPrRv1DddGlzaenhjgRMwqz7q8HM=;
 b=T5bvNtnehdz54MUkPr8q5uJj4M4SNeoMrPdZYV1Nlncnm89Ux8Zz+PH5fDyRjA13dO
 EQF8LO2IRUUG6G74VKZk0CHoVWsm8LHkzthJbUOlI8yZfk7Yi/G9ZbL1YjTZzLJQh57n
 iwhWlxjTSi+z/NWFQfWGG08rliZj+rGWMvV8YuZBlWMuCy9GEb01PuOBiO+yJ4VGopAm
 3t3pF7mFegFDmK9OeggGk6WAAQpH4c+yv5r3JnB84E4SfmbYeWReUgV5NVOM/NqLQ0le
 x+gwU/zntMWbLwAHC8hKw0311tPRjhNCGNoJj06v7f8UXlN9lAEAdHfQ6HZN0OElxqfB
 T0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3W1rvyQPpSbPJX2VPrRv1DddGlzaenhjgRMwqz7q8HM=;
 b=CqJC/JObV1tdGC3Y4rhzHtz9grz8MZFTPE/dQsU2EHn81w6nSL0Q8oBHYoAIpzJ0QE
 11PahlzMV3hq0eg6By/aB64JGTv6dDU1uPWRN68UUwHIKf+LiD2YsKLyLMq6hvYcEQQe
 dVf/fKgQYXQBq0NUXFjKdV6SHmyECZSDhj+aWeGkc1L+G7RFoF+NQYhMcOZ9LHhmrNCv
 dPLdlZrdflZgG0UXv7ODElzb/lMmUevhGYSfdzoxEC9SwbOZ+qd6dcLfjFgsPM1U2UIE
 iWWIIq5Z36mhtcbNJuxwmTsPAINk85SV7FdK0VWo4JnYvApNQ01/OB6+5J5YHsRv404S
 zm0g==
X-Gm-Message-State: ACrzQf2XCN0bLBGYz2an5lcO1+TAnYO87Tyk8tvT8LFbD44Ii74yG8/6
 EgDPuQzgX87Bm5frle85uhpoKLMpxdsUtg==
X-Google-Smtp-Source: AMsMyM7mk+zInOLW0Po+HKSDqCU9iR996xar9JfQhMVkCa426ZSYI/qkrVqP56nYjZjm71BQCE9lpg==
X-Received: by 2002:a05:6808:3008:b0:350:fad2:458d with SMTP id
 ay8-20020a056808300800b00350fad2458dmr13639605oib.93.1667195242646; 
 Sun, 30 Oct 2022 22:47:22 -0700 (PDT)
Received: from [192.168.108.227] ([172.58.27.233])
 by smtp.gmail.com with ESMTPSA id
 y37-20020a9d22a8000000b0065c2c46077dsm2388783ota.67.2022.10.30.22.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 22:47:22 -0700 (PDT)
Message-ID: <a716d48a-ffde-d6d0-163a-42aef7bf2c8d@linaro.org>
Date: Mon, 31 Oct 2022 11:39:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/i386: Expand eflags updates inline
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20221027102615.253354-1-richard.henderson@linaro.org>
In-Reply-To: <20221027102615.253354-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 21:26, Richard Henderson wrote:
> The helpers for reset_rf, cli, sti, clac, stac are
> completely trivial; implement them inline.
> 
> Drop some nearby #if 0 code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h        |  5 -----
>   target/i386/tcg/cc_helper.c | 41 -------------------------------------
>   target/i386/tcg/translate.c | 30 ++++++++++++++++++++++-----
>   3 files changed, 25 insertions(+), 51 deletions(-)

Queuing to tcg-next, for convenience.


r~

