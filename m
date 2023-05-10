Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9056FD87E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:47:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweWw-0007yO-4J; Wed, 10 May 2023 03:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pweWr-0007y8-DE
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:46:29 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pweWp-0000Kv-Tl
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:46:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f49bf0223cso3187605e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683704786; x=1686296786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=APWDyFpqrNxlCbyGdx6dX5Oo4YgR4sdPKSODaMbhTrQ=;
 b=NsT1W6YnvkKgbkit8O9n16U7F0zJixdeSqm7g7mi4uEnmPYa2YBak1SZcpr3AsNooK
 +/hsQIdQ+2mJjwDx0IOhdoAQ+Uf+ouQqJQ1+/lD1BpW/KcdfSlkjoQzjxniSIyWhMRJZ
 KxkIYkW9fZsNqvKjDrfSdd1Nfemax3/NtEJzwrgOf/r707KXP6LoAjsJtNJqSpLsf6Jt
 EM0CPea9DzenpU3F2MvXAMZ5K1dcyIurHca7OqeN4NKskB/rbKuW0cb1R3zbged/WwK1
 imVkruzgp/Iv7Qc/QyM91CqApH0I/c1HJZjZ95Ybye5SWb7szKdxxhJdLltNp2o8/b5k
 gm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704786; x=1686296786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=APWDyFpqrNxlCbyGdx6dX5Oo4YgR4sdPKSODaMbhTrQ=;
 b=DXIv2qvO0i/UZqOxurfz+tcmOvPqW9c2OZg7HIEfUUiLmoAb1/FWDC6ZkaZo/qNSOv
 mkDYhMjh+Nzpb1xuBQPfLHbXzFMe6vSdsRUiQ9Xep13L+eAHultaSJFUOqy+uNWFsgee
 V8BjJkO6mUcprn6HTangXLRkBrmcQT5Lhr0JhwrsDVIJHkucldZGsvv2p2j03vfg1ehb
 AI/4vb3/YxJx3HGNW0psfIYD4XL6oxYMH+PdsQKgK8HRTnbA3AvmTIemcnN/L3DCiUhn
 vMk3vm5ffWxhxsr25UBZm8mTW5Aj/bO/oDu4Xc6iFJbpco/L0nZN8D5spxCoGxP3+tPR
 PtsA==
X-Gm-Message-State: AC+VfDyGd0Idgi5lqZ4UjfUlFzYpIYmg1VLx1irRiLcy1afs6WC6lK2H
 /kOFAub4yheFTUPm0C3OJqSMXw==
X-Google-Smtp-Source: ACHHUZ7MyxGHu5ukRFMox7+28f1mml4i+Uq8EPhqQTTXG7DqaejgEmpezkCmLT+OsDYX5zjOSmc1pg==
X-Received: by 2002:a1c:750a:0:b0:3f1:72fb:461a with SMTP id
 o10-20020a1c750a000000b003f172fb461amr10910797wmc.2.1683704785785; 
 Wed, 10 May 2023 00:46:25 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b003f429d59e37sm4823911wma.34.2023.05.10.00.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:46:25 -0700 (PDT)
Message-ID: <48f35197-1890-cfce-3535-9a8522f50523@linaro.org>
Date: Wed, 10 May 2023 08:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] disas: Move disas.c into the target-independent
 source set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, philmd@linaro.org
References: <20230509163326.121090-1-richard.henderson@linaro.org>
 <20230509163326.121090-6-richard.henderson@linaro.org>
 <b62ab9a2-fad5-313f-518c-29626b0d57c3@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b62ab9a2-fad5-313f-518c-29626b0d57c3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/10/23 07:53, Thomas Huth wrote:
> On 09/05/2023 18.33, Richard Henderson wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> By using target_words_bigendian() instead of an ifdef,
>> we can build this code once.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> [rth: Type change done in a separate patch]
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> ...
>> diff --git a/disas/meson.build b/disas/meson.build
>> index f40230c58f..2ae44691fa 100644
>> --- a/disas/meson.build
>> +++ b/disas/meson.build
>> @@ -13,4 +13,5 @@ common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
>>   common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
>>   softmmu_ss.add(files('disas-mon.c'))
>> -specific_ss.add(files('disas.c'), capstone)
>> +common_ss.add(files('disas.c'), capstone)
> 
> I guess you could drop the "capstone" here now since it is already added to common_ss now 
> three lines earlier.

I have a memory that it's required to get the include path for <capstone.h> for 
"disas/capstone.h", for use by the target's cpu_set_disas_info.  Otherwise only common_ss 
files have access to the include path.

But I'll double-check.


r~


