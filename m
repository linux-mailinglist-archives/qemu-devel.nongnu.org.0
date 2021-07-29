Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBC13DAB13
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:38:45 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Avb-0007aM-Nz
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Aue-000685-OZ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:37:44 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Auc-0002RL-W0
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:37:44 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso17087108pjb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 11:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jWBtxi28pBx+pW2AmheHZD29zgdoF0bdi1z+Lgmni4A=;
 b=tMacxjjj0RxaPAFFM6QEBRdkVfxc/k7D14uWPeMREEdeQRDxQ1VVfailg4II6M7Wh9
 XDJZ5GrKkRsp3aNCdSSO/PPE8OXE7nGhaXXqZZFjpMFb570EaGjXw7g4FxbSXPQpP1NU
 K71YtmjGSqIx5KTc4xuBOVV21X6xNjd9sn++t2CZJa/qxJO8YoNcYgbEJgC5EpWiYeeC
 bvgplp6qfCqbFw1KCIJkbchw1w+jOkQrrc5lAIRK56DtHzDfw/cQqnQB2esaUTsomQX+
 qcx8ejEMAw+1OVfix8nCfkb1UsyPz3Gvrnao4j2mVrDHo4e7tEhTzDZgOhrHCcFzkz4L
 3uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jWBtxi28pBx+pW2AmheHZD29zgdoF0bdi1z+Lgmni4A=;
 b=HwaQo/Cy/JPPxf/KHFQNKn+JHGyDzm9Pamzlz5EDrjOPSAPp+h9m+3HGD3LmhkvZE+
 IkO4yw4EPgmdvC5gNWVff3sZmjnH3hEDq5u96GkBf6pYQSgCXhRvdbwruzrk4lF4FCAx
 uQDEbks9SK42zdNA/6TxyM0hXwuOC6ioRA4gwD9ChlQ0f0g6wLevub1S2KcRdWBbtMG9
 wcB4jw2uO1jWxVFSyoHmjkU9IcX4DojVUX35JeK70aRSXd443n69XIEJhcSwoA7sq6R7
 eSeE46Rl4XaQlR1b5cmqb51d/DljDMLeuB0zhMaCC4+YGu4ZEtW04SXpS0F1f5nM1c9Z
 cwUw==
X-Gm-Message-State: AOAM5308j5hFY97Xijuad8mXxDGqom8mgpIL0MIpXtHVqSeO9p5q7/Qz
 M3umS1lkuUznzSSGVtOe56I22sV01OBP0g==
X-Google-Smtp-Source: ABdhPJzrkuN4VFyP/wHlBd0GpYs95eoev79xm1/NJN3ceYRdq2/hPDBwIgr7zBzEOHIbzNPV/nPyeQ==
X-Received: by 2002:a62:1d46:0:b029:3a9:eb67:c0c0 with SMTP id
 d67-20020a621d460000b02903a9eb67c0c0mr2835935pfd.60.1627583861191; 
 Thu, 29 Jul 2021 11:37:41 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id w4sm2508787pfj.42.2021.07.29.11.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 11:37:38 -0700 (PDT)
Subject: Re: [PATCH for-6.1? 23/43] accel/tcg: Remove double bswap for
 helper_atomic_sto_*_mmu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-24-richard.henderson@linaro.org>
 <1da8d060-4e79-e128-0700-ae6ae17f302b@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98da42e3-f678-e201-3720-695c6989ec56@linaro.org>
Date: Thu, 29 Jul 2021 08:37:35 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1da8d060-4e79-e128-0700-ae6ae17f302b@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 7/28/21 8:29 PM, Philippe Mathieu-Daudé wrote:
> On 7/29/21 2:46 AM, Richard Henderson wrote:
>> This crept in as either a cut-and-paste error, or rebase error.
>>
>> Fixes: cfec388518d
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/atomic_template.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
>> index 4427fab6df..4230ff2957 100644
>> --- a/accel/tcg/atomic_template.h
>> +++ b/accel/tcg/atomic_template.h
>> @@ -251,7 +251,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
>>                                            PAGE_WRITE, retaddr);
>>       uint16_t info = atomic_trace_st_pre(env, addr, oi);
>>   
>> -    val = BSWAP(val);
>>       val = BSWAP(val);
>>       atomic16_set(haddr, val);
>>       ATOMIC_MMU_CLEANUP;
> 
> Why not merge this for 6.1? Because old bug, no regression?

Probably should.


r~

