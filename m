Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ABF6A18A2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:21:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUG9-0007P0-7g; Fri, 24 Feb 2023 04:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVUFi-0007Lw-4L
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:20:32 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVUFg-0006wn-F9
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:20:29 -0500
Received: by mail-oi1-x229.google.com with SMTP id bl7so15502664oib.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00Xr2EdjkRhObpPpA6kTsrcisThtK3nb/77zsX5i1e0=;
 b=o8xtKlVLX6M7TGnItUeWmCItt+E1ap2Sd1xOTdDW7C5UPQnUVTN9siOnTUj/2WBl/A
 wlfPgIqF4j2x+MRxiEeAndlSv9wL9+RVtIk5gi9kweCOWk9t3gESPi1SPVfFwlx4D0mb
 PTbo+bLMa4FHf6M7P9V8/zlJRK8AUVQeAAnnw9NDQ27qFo+Zo81T6gkB2TVoSVoV2fpo
 uecOF94KkQbLOxpkYpRv/SADa1SUYUjmPyH26L4qJrtGVZRxdB1DAJ7I5BgOeaqyYTfR
 agCY8B+jW8i2rjJNZG0C3JHAvj4S0T4YgcP9D1cJA371vW6e7YrX/0s533wAyYT+EPyF
 XkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00Xr2EdjkRhObpPpA6kTsrcisThtK3nb/77zsX5i1e0=;
 b=goNxOHjNLRx/qsBIj2ZHSarhrmpl/2MwGjxIqZFYJ/5t5FjPBNroxQAQC/mRF6ZL/Z
 de10fHiuT83eeN9//4efd13YfZcZvtT/+5jxVMhcT21C//I7wAogQBpBTnqsyrQbtT/q
 v6HIcrPJZeXrm6hpkHIJ5fG03GkfYYpX/yvM2dA22nVzUiqVs3IWleZEbkYyNaNxXvqF
 sivpsqUWnsnNNEM2ZWWcYDah/hdnayRnYs/9J/fVVBh1p2M3huqy0Vm2xkZRZ0n8soa0
 H85N/KpUqD3pDR2Ym1J6fDgyKrK/SjgbrvJbb0w4U6JdHbwp1/k94lsTZa+YdziAr8Tq
 5iZQ==
X-Gm-Message-State: AO0yUKW72LdGRt52nuPpiney5OdGeDJznCrGELIG/4U19FYDGR0dSeUZ
 WK5BfTDTKjWVE2GTj1+mZ7MXIA==
X-Google-Smtp-Source: AK7set+PC2bTesAoA5Z0Z4a12cc0rrsCvQ7jcp9OETTXpSLgwLkft/hPLoYL2ehzHYpPKLhhKzmizg==
X-Received: by 2002:a05:6808:6397:b0:378:375d:edc9 with SMTP id
 ec23-20020a056808639700b00378375dedc9mr3531013oib.45.1677230427081; 
 Fri, 24 Feb 2023 01:20:27 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a4ac609000000b004c60069d1fbsm3529160ooq.11.2023.02.24.01.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 01:20:26 -0800 (PST)
Message-ID: <ebd64364-0a1f-055f-91c3-acf90327cf4b@ventanamicro.com>
Date: Fri, 24 Feb 2023 06:20:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-2-dbarboza@ventanamicro.com>
 <78a0f5a5-c2da-c016-1f15-981cf80bf676@linaro.org>
 <d27b10d7-a98e-0f81-6e63-ee13cdcbaff5@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <d27b10d7-a98e-0f81-6e63-ee13cdcbaff5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 2/23/23 21:23, Richard Henderson wrote:
> On 2/23/23 14:19, Richard Henderson wrote:
>> On 2/23/23 13:44, Daniel Henrique Barboza wrote:
>>> +    if (unlikely(flags & TLB_NOTDIRTY)) {
>>> +        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
>>
>> That '1' should be 'size'.  Fixed locally.
> 
> Hmph, well, that matches the interface, but it's only used to figure out how many pages to process, so any len that doesn't cross a page boundary (which we have checked) is equal bar the tracepoint.

I didn't touch that '1' because I figured it might not be related with how
'size' was going to be handled and any value > 0 would suffice.


Thanks,


Daniel



> 
> 
> r~
> 

