Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C126A720A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 18:28:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXQEv-0001tY-5M; Wed, 01 Mar 2023 12:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pXQEs-0001tM-KB
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:27:38 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pXQEq-0004rh-LG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:27:38 -0500
Received: by mail-wr1-x431.google.com with SMTP id r18so14067829wrx.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 09:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=26xMs/klBSNVrhH8XDXZw8SFTcsQRLIWprFYnXrYlBs=;
 b=OU0Mff2kY3wbcFAW65HBewTAIUQCGW/6n6gQ5xsb0W5Tqj+pJh0KXaabxVLOGrUD83
 HmsRU4jWvTEFfkfHKW8Wteom/CmMoVucftPNBqtxk6QRgysh4tAzhoIAH7ceCnIEzBeJ
 qSorp6ZRvE37nuojq2wwmk05jqTUaunSxIAmZniAi+RfJI278Kxmclg76y7/mo0QX+lN
 rVqYBrw13mO/PUTMkACQ+HbDRW8ZeXUxN9oip4vYS6IShRxOmyY+QXoocWg6dVC3X2Or
 odxYa2iUgUnbk/FZKjJNAuvaPDsDnxCBN/fXj2cxZgfEZHB9w1gP08v1JsYgSCfR7Na2
 qTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26xMs/klBSNVrhH8XDXZw8SFTcsQRLIWprFYnXrYlBs=;
 b=Xr1UjvN8GiriPd/jJ+0bF44HIsKD+zig0I/7Tyj4vRKD6L6UGRW9BA8ECxJ5gYRb93
 ANC9sx61e1R7yoj/qiL0JE9eDpPFt6tXq3d0yklWaf13vJ/EwAwda88fKyNQOkSLIzAO
 tEkEX1CNESuftLEZfn07oqJpBRNJ1t8bYF1BdAgL6IFU+iKrH6mjq+RlVePrn14vaDl7
 ze1tkUvZE9PpEMSn6PR/+HLKXppUT+UX7gK4B//stgMXhApZocGExDxkageY3cfKmHGm
 4qKMXNYEup8QJzrrqpGcP/F+TGBINiRbdD5Cue+udeAh5eBCMwP+LBDIOfRsSJFebKd5
 evpw==
X-Gm-Message-State: AO0yUKVPuIGsqROtyPxQYyrS+SUEJp9vmCcYmZKEQ41vPlVsULYxOeyw
 +HEBWnjsvcXlnl+CvCJpmXDqhA==
X-Google-Smtp-Source: AK7set/ewhojH+iTi7hm/oB26VxdlWDl3/Jo5slhDcNwP34uQPugNmZLT3lV+Y0JrudIwP8NZvU5Ww==
X-Received: by 2002:a05:6000:1367:b0:2c7:f56:2892 with SMTP id
 q7-20020a056000136700b002c70f562892mr5515641wrz.40.1677691654316; 
 Wed, 01 Mar 2023 09:27:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:e4ad:e73b:9747:ba29?
 ([2a01:e0a:5cc:caa0:e4ad:e73b:9747:ba29])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adff209000000b002c3e3ee7d1asm13592120wro.79.2023.03.01.09.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 09:27:33 -0800 (PST)
Message-ID: <d07200b8-eeb4-0dcf-2a0e-779c989d9392@linaro.org>
Date: Wed, 1 Mar 2023 18:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] util/cacheflush: fix cache on windows-arm64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-2-pierrick.bouvier@linaro.org>
 <c9bb01bb-4763-0ab4-11ab-34025c586004@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <c9bb01bb-4763-0ab4-11ab-34025c586004@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/16/23 20:42, Richard Henderson wrote:
> On 2/16/23 03:49, Pierrick Bouvier wrote:
>> ctr_el0 access is privileged on this platform and fails as an illegal
>> instruction.
>>
>> Windows does not offer a way to flush data cache from userspace, and
>> only FlushInstructionCache is available in Windows API.
>>
>> The generic implementation of flush_idcache_range uses,
>> __builtin___clear_cache, which already use the FlushInstructionCache
>> function. So we rely on that.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> This is reasonable for now.  I'll note that gcc does not yet support windows for aarch64,
> and I would guess this would be fixed for libgcc at such time as.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 

For completeness, and after asking to Microsoft,
FlushInstructionCache does DCache-Clean-to-PoU + 
ICache-Invalidate-to-PoU, which is equivalent to calling dccvau + icivau.

Thus, it's doing the right thing.

Pierrick

> 
> r~
> 
> 
>> ---
>>    util/cacheflush.c | 10 +++++++---
>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/util/cacheflush.c b/util/cacheflush.c
>> index 2c2c73e085..0a0acd70fa 100644
>> --- a/util/cacheflush.c
>> +++ b/util/cacheflush.c
>> @@ -121,8 +121,10 @@ static void sys_cache_info(int *isize, int *dsize)
>>    static bool have_coherent_icache;
>>    #endif
>>    
>> -#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
>> -/* Apple does not expose CTR_EL0, so we must use system interfaces. */
>> +#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
>> +/* Apple does not expose CTR_EL0, so we must use system interfaces.
>> + * Windows neither, but we use a generic implementation of flush_idcache_range
>> + * in this case. */
>>    static uint64_t save_ctr_el0;
>>    static void arch_cache_info(int *isize, int *dsize)
>>    {
>> @@ -225,7 +227,9 @@ static void __attribute__((constructor)) init_cache_info(void)
>>    
>>    /* Caches are coherent and do not require flushing; symbol inline. */
>>    
>> -#elif defined(__aarch64__)
>> +#elif defined(__aarch64__) && !defined(CONFIG_WIN32)
>> +/* For Windows, we use generic implementation of flush_idcache_range, that
>> + * performs a call to FlushInstructionCache, through __builtin___clear_cache */
>>    
>>    #ifdef CONFIG_DARWIN
>>    /* Apple does not expose CTR_EL0, so we must use system interfaces. */
> 

