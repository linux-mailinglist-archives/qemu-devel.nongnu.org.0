Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9F623B71
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:44:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0Lv-0004XI-DI; Thu, 10 Nov 2022 00:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Lt-0004Uv-PN
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:43:49 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Ls-0004mp-9j
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:43:49 -0500
Received: by mail-pf1-x429.google.com with SMTP id q9so932703pfg.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Thz4Ngy3S8VYM2mgThal9nsNpB8gea6dYvHlcLfBjZ4=;
 b=u/NhTN7IHXFXzhzQYfRjFJxe6O72p5UvUVLb0hUbVnnCPC+o38eGZFMjSRjdXFtP/D
 UJDNBJmvfi7R2LAJY0FLjVgs/ldKYjNSbbIHyCM466OWou7skj5jQdzwAFJniNvo93cF
 z0Hl3g65iwbp3AWlOMbo0gm8E3CWMOssDf1XFY+RKfKBmz327AUG5TINiVhMdThfiZvk
 xYrj0dVdDOa9hERURbuYbgeNEE3N36etFtnNP8ytXwqXvGx7JKvWb9apraL+rXCy2vk1
 XhT/fz+vWF5UYxH+5JSLrLxNi2pGXOfENzUzomcVMUncP7MrG788NdN9qFx3M0Zg3oaQ
 1ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Thz4Ngy3S8VYM2mgThal9nsNpB8gea6dYvHlcLfBjZ4=;
 b=1bl2WiGft/5uBFEc6SHT0vwae/jaDXp87ycbEf9QoRrddIEjCwYau80aNVAJOsWdtq
 9rGcs31CyBEeP47S9/zuZXTnSRLMnGAAa6J+ZcWRyvW1+i3828A7eHmER73qSeSKsdrU
 5MZldUB70hnXs9Bg8OLtEzX7iCcsPYVNA4JPHwhXecgVXEGyetpsvmf5L8r41Aa80r1u
 KIHkXaj6sI+8XZYgT3lP5qYbTf5Am9IGMJm6JqPjrNcbDEBKsyrnGJ/ONa4HnTdf6X3H
 TqaLmfQYEUafVb5DHlmsXUul6yd+9ElAzXjxiTtZLUD+NTvANUwT/DJrCMt9MBTKIn38
 yZNQ==
X-Gm-Message-State: ACrzQf1LhLKYIAdxO1gC5avmxV7Kj6o79LL8vavv8yUuC91oFpDIj+kK
 j5ZJGloEcg/DQcmMsZmASYNJVA==
X-Google-Smtp-Source: AMsMyM4o0dQtKlsDM6cwUB6Z/04Tadl9DZ1aiP2JbZUKJR9+MWi5LHCbflScUd6qr2LCFTbKASCbEw==
X-Received: by 2002:a63:481c:0:b0:439:db5:f817 with SMTP id
 v28-20020a63481c000000b004390db5f817mr1885595pga.310.1668059026863; 
 Wed, 09 Nov 2022 21:43:46 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001783f964fe3sm10107501pln.113.2022.11.09.21.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:43:46 -0800 (PST)
Message-ID: <1f4e1554-8db3-7ddf-52b7-370f1bc8b7dc@linaro.org>
Date: Thu, 10 Nov 2022 16:43:41 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 7/9] hw/intc: Convert TYPE_ARM_GICV3_ITS_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
> Convert the TYPE_ARM_GICV3_ITS_COMMON parent class to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

