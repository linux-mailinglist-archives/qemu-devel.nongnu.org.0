Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FA698682
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOjZ-0000kr-61; Wed, 15 Feb 2023 15:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOjW-0000j3-Ds
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:50:30 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOjT-0001sN-QH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:50:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 g6-20020a05600c310600b003e1f6dff952so2619407wmo.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PqOHqJLw7qrdWJg+ABWmBEkjvNU+voG3Scna8EdNREY=;
 b=NYxA/9OE3qb+1hqfNODmOf5iaB2nJC+/rAAt8fmfB2PzNRbyEY1I6ojn0QmAcDG4g3
 zsk/1jEq5yP5EE1UjlKh5OY0gmX8kC9hYjGE+pXCrZuFKUIYLOjoLxVfbbqsD3w9slWK
 EZGSERMtFlSKzM0Ql9ta843dBBnBc0RZXoWza0td7druZ4AxF/cuMdiiIW8UXQSZ2ZCW
 NKNwkVWT64T5hUbM9FKyhUpGUAf2yvPuMsb+UcfrJk1HFeEmmk56lIIAQa7LVp0VHxEb
 ilquBkTiJ2MlaJjkXwLavV8e05OZ/y5GLCDd/bFkuUtd4yLc4ulh6vJvSZm4RP3zgKvy
 doQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PqOHqJLw7qrdWJg+ABWmBEkjvNU+voG3Scna8EdNREY=;
 b=iy51XTg21LCzn1YlvJGA5vijh8L7eeXQYtLR/SPOwvz5B/CdzBs9QLrbvtj+/2ANEV
 cn22sCsguzgi2qEXQQL2xze8viP4uZGU7jenm8cxU0z7mXIu3+Jj9K2M9Yr9uXlf2B0E
 BFj1sPDmxF9fMcTDUoeHqeeIG1TtWj6sSZUeJKItKrv7aQNMG+W0YwpBHDwk84RXVMiQ
 NNwEQkEdiaxt7hpun1pbUPRXcxSuGP1ox3wsClKbSqsK9sjHNYsUGoybyEoxW/wQqeTC
 pq8JF6X33wDAzQb8+kijFwHcVv+M/3J+y5W0A9DVUtIqqUFopEjIUBbLMbV1RrYz31S3
 qV0A==
X-Gm-Message-State: AO0yUKXrOmZd90JeR6Y91esh/Hs+peTYHSuNlOlwyEjFpQr+e/uIHJ0g
 z0TDnvJ8TD28fWmJXUrQ1kprWUrVvkqYAOt4
X-Google-Smtp-Source: AK7set98+c6ueCb4wefH/CgNPEjMHjtNKIWZr/zXtXtIhG/pF77yzOHGgBztURyHBXGcGwO0Ky2hsQ==
X-Received: by 2002:a05:600c:1609:b0:3e1:f8b3:60bd with SMTP id
 m9-20020a05600c160900b003e1f8b360bdmr2858212wmn.27.1676494226296; 
 Wed, 15 Feb 2023 12:50:26 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a7bc009000000b003dc4a47605fsm3263821wmb.8.2023.02.15.12.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:50:25 -0800 (PST)
Message-ID: <92e0e4dd-0aee-7d12-06b5-eb087766e087@linaro.org>
Date: Wed, 15 Feb 2023 21:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/3] target/mips: fix JALS32/J32 instruction handling for
 microMIPS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
 <20230215084754.3816747-2-marcin.nowakowski@fungible.com>
 <645427aa-2630-a2be-9f1a-bee60a2d2885@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <645427aa-2630-a2be-9f1a-bee60a2d2885@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15/2/23 21:21, Richard Henderson wrote:
> On 2/14/23 22:47, Marcin Nowakowski wrote:
>> @@ -4860,6 +4860,7 @@ static void gen_compute_branch(DisasContext 
>> *ctx, uint32_t opc,
>>       target_ulong btgt = -1;
>>       int blink = 0;
>>       int bcond_compute = 0;
>> +    int jal_mask = 0;
> 
> Better to limit the scope of the variable to the block below.
> 
>> @@ -4917,6 +4918,11 @@ static void gen_compute_branch(DisasContext 
>> *ctx, uint32_t opc,
>>           break;
>>       case OPC_J:
>>       case OPC_JAL:
>> +        /* Jump to immediate */
>> +        jal_mask = ctx->hflags & MIPS_HFLAG_M16 ? 0xF8000000 : 
>> 0xF0000000;
>> +        btgt = ((ctx->base.pc_next + insn_bytes) & jal_mask) |
>> +            (uint32_t)offset;
> 
> Ideally we wouldn't have one huge helper function, and could pass down 
> the mask from the translator.  But that's on-going cleanup.

Yes, this is the approach taken in decodetree conversion.

I hope to rebase / respin incorporating Jiaxun patches some day...

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~


