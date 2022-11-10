Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C297623B6A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:42:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0KU-00017H-Gr; Thu, 10 Nov 2022 00:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0KG-00015M-FZ
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:42:10 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0KD-0004JU-Sp
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:42:07 -0500
Received: by mail-pl1-x633.google.com with SMTP id u6so611070plq.12
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fuxbTPvtL2sntyBOEOkBLOWRJnJr1VVluAEm8zejlb4=;
 b=J7aE4yNau9K0a1f/y2YpStjvyAWJTs9AGxSbGudfF+3P9FZ0BSqWlCdon5YZQIU8B4
 RcuyPJteBEVsCYtj0ITo6y6eIL6YHEsc2qeTRup0uFDbVUpsAl0fmGofACdpqsMNn8oV
 exr2lTw6yYGjn3D6IbXjh7kLHCZWpGicZvAF1YLju2sXebMAttmn2UDNthDCeK9WhrRS
 mbbZendV9QyET3O72N95M8fFNUVwD6W+yQQxq04dj2UBzhQZlo3uP9zzS7t4Fs6xm5gq
 P69jSh2KHSxDZi+h762SPlE0+u8WR7qSDmj1LfNmkGD/q/kXt4wqw7q9mBecsI6cXRDV
 gtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fuxbTPvtL2sntyBOEOkBLOWRJnJr1VVluAEm8zejlb4=;
 b=llxmF9JzDjrZBYdZPUgqJadltiapiD3BUTW7+AF41/bczb5QOdTFivpBtKtPmqVLA7
 itkXvA7apAsEYwDe+Wz+rZnozKDltyTkdx4UczN8a7wigHem1iE6cqxaAtzS8IKlr4wE
 ZLyOdK2/eXv1Rn6lpILjM68LdpMpiGlIGR0eIYpuDXLun0DpoTInGbtj2Pgq8JftiqHV
 pPNAxSnHKFT1rCfBiSVkO6xJ6S9Y53bA5n+6V6UihkXjqi3Iyzi0JmrwAa/AHUamiLyk
 07BWEgzafA11b7QoXCgOZRhA0qkfMtuYcJ/MJLiplx/RDR791laUIjPufPv8fOl75C1e
 sedA==
X-Gm-Message-State: ACrzQf1SnXSS05nKNoI6bJdfJW9NKgE95YLsVKUT76zqxLfJjmo4SbJu
 wrjASKsZxstF7FJPLWQD4zRJlQ==
X-Google-Smtp-Source: AMsMyM7rHSM+qHR52z41QSD2Lz//YXyFCLbW6hRt3ZG00nQEcV5Jka2p7hVa1oaG/Y+xww72qFFHiA==
X-Received: by 2002:a17:90a:3e85:b0:213:36b6:fa16 with SMTP id
 k5-20020a17090a3e8500b0021336b6fa16mr63823171pjc.56.1668058923796; 
 Wed, 09 Nov 2022 21:42:03 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902dacf00b00179e1f08634sm10182458plx.222.2022.11.09.21.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:42:03 -0800 (PST)
Message-ID: <2a7de80e-5bf2-0054-c9fc-9d89b923346e@linaro.org>
Date: Thu, 10 Nov 2022 16:41:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 3/9] hw/intc: Convert TYPE_ARM_GIC_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Convert the TYPE_ARM_GIC_COMMON device to 3-phase reset.  This is a
> simple no-behaviour-change conversion.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gic_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

