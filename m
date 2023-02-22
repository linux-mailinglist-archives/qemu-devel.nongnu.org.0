Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE969EEC2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 07:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUicq-0000uT-GC; Wed, 22 Feb 2023 01:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUicn-0000pX-Ez
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 01:29:09 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUick-0000pK-RR
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 01:29:08 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso7436959pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 22:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rj/y3eIoU1hEVWsjwSLtQER821zoXnemNcBYxuhWE8Q=;
 b=e5yifcEulkpd7BQj8X5Y6cDNjLIzlxDdYKUH3um5LdvIHsJ1mQEx4THIfLyeGTunIj
 ncMJ6ODxJrOTDFX9MbrTuwm026iVEvV+VDAP4Fg9uY/SNWM3VDM6XqE94aWWO1QhsT1q
 qZ4CukvgfgI8+J0LA+skch2uPsDi7TEfYo7PrdDimsORYxzu01blRwt8nclLIEtvLqD+
 fVy+M1Zm9gwIIVYaqlbKL3FvX1TAqYzcqtMvAYYe8CQ+q0EDyUDEDO2N1IP3ujvntzLx
 CoVEVoIgFyDOW3gf93v3WVjWauJ6tnDjnBlE4y+CmoDw/Rp5M45DxZjLi7UbfwAVCAyP
 y4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rj/y3eIoU1hEVWsjwSLtQER821zoXnemNcBYxuhWE8Q=;
 b=unCjfTzY/cfUQp1vn2SFalBF6IcETwpx9MX97l+pyXh+10W0yzTfRcIAWwEuVQDlAx
 RjET3H36kl9US77CYsiL8kns3KyDy0COA36P5vZo5jiCj5edozOaN1zA6odcCD1hrCqB
 ZRGpSjVrTTzVYHwaffl3P5y9OXnfVQQpBu7wrucZsHfjeD3gd/JCqR86cbC3zSOs8354
 6BNggMjG/GIOb7CQGxl3cXSzCQrtZIasEXhixbSTfu+aaXkdohC+eYqRgrcbpNsx2AEA
 rhFgw98JM1TtDybwZza9dAevqBkl8LxH2PEGCDq5rA6PGNSweSbdOKepFNvFxeX1IoCo
 PCcg==
X-Gm-Message-State: AO0yUKVg5QyNZajHveQBgoK5YjGFOczg2ammMo+ucuGI14X8sX7T6NJG
 q4kwXZHAFneXKSKkL0RHTlN/xg==
X-Google-Smtp-Source: AK7set/qFeCvR9vioJuDAew1rMQ38VKmeBuSvNoFYG8WDtJ5Qkx+f/AGBhVFPyPzju1U51CBjeGvtQ==
X-Received: by 2002:a05:6a20:244c:b0:c7:4367:ae5a with SMTP id
 t12-20020a056a20244c00b000c74367ae5amr8012965pzc.18.1677047345020; 
 Tue, 21 Feb 2023 22:29:05 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 bf18-20020a17090b0b1200b002341c0ff245sm3373154pjb.19.2023.02.21.22.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 22:29:04 -0800 (PST)
Message-ID: <b0ed61bd-5146-c142-8ad0-2df61632b42e@linaro.org>
Date: Tue, 21 Feb 2023 20:29:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-4-philmd@linaro.org>
 <f0eb7a7c-8505-ee8d-af5f-259c2627958b@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f0eb7a7c-8505-ee8d-af5f-259c2627958b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 18:06, Thomas Huth wrote:
>>   int postcopy_wake_shared(struct PostCopyFD *pcfd,
>>                            uint64_t client_addr,
>>                            RAMBlock *rb)
>>   {
>> -    assert(0);
>> -    return -1;
>> +    g_assert_not_reached();
>>   }
>>   #endif
> 
> If we ever reconsider to allow compiling with G_DISABLE_ASSERT again,

... and we shouldn't [1] ...

> this will fail to compile since the return is missing now, so this is kind of ugly ... would it make sense to replace this with g_assert_true(0) instead? Or use abort() directly?

With g_assert_true(0), definitely not.
That is a testing-only item which can be disabled at runtime.

With abort(), no, since g_assert_not_reached() prints file:line.
Indeed, I was suggesting the opposite -- to replace abort() without error_report() with 
g_assert_not_reached().


r~


[1] Allowing G_DISABLE_ASSERT and/or NDEBUG would only require that we invent 
qemu-specific replacements with either (1) do exactly the same thing or, (2) interact with 
__builtin_unreachable() or __builtin_trap(), so that we tell the compiler exactly what's 
going on with the expressions and flow control.


