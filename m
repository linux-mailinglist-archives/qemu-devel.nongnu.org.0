Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340556B4FAE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:59:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah1J-0007S4-Vl; Fri, 10 Mar 2023 12:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pah1H-0007RQ-O6
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:59:07 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pah1F-0003UE-Qk
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:59:07 -0500
Received: by mail-pf1-x42d.google.com with SMTP id c10so4138633pfv.13
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 09:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kIQjnojWqKH45Bp/4zcQWFEmnDrl7qLSAucD5qtgmTg=;
 b=W3zZn5H93npBJj7aD3kcbeyEKs724K94ENr/GpXylXdh2nDGDl72J9eAHXPfbvw8i/
 zh26rqIMC/SXLFpQXeM/Cg98S8wZhYu8RWr/P44tkgtWBG2OUzo7ZJK7wrLTGTqMlhiL
 MGpNuNVLeNLJx+rt0ZvnDaB2gpAiLvPITSRmYrAS7fUsfDHi5U0OLNQ1JYDndMdQr7yS
 1MPRXg8Iqum6/KD5Z7uDXMElAx71SXmhLzVOl0yMffNWe5Vz48DJ1l49ykkaasg/Ftbz
 vSy6D8qFSGb6g8T4mKlBSIoTGMGB75N2coBtTvCDpauArQlJM3E2Ta2RipY7kG99vpfG
 XGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIQjnojWqKH45Bp/4zcQWFEmnDrl7qLSAucD5qtgmTg=;
 b=FxqCj8kzjTz5M4BaYnfkBnLKF+XR/f5yn9zAFKwL8hFSbOOv7+22D4wSviGhb4JwQT
 mb+XAO/qouvNyg+1RKPIBQx1gQtxbuUnkHIQ+lqoHx9gbdmkvBqmkUQK9gDWNxXUsrcW
 pJ4Gn4xJiWhtUzc1WS0jfpz7pJ0Du2HYGrlHm+XKEslfGZ291FyJmQxcCEGOekH36wdG
 eH2d/fUlc01FxasJUc58LFuE6Fa26FD0VHv7FZUfD+nzsa9NVjSN02tjd5UzTvWzj/Dy
 XeR8GyCUrjjztsYqcRlyva7sroMl9sz8mq/K8jKD/Rw6BlRadvywusVKUQOFEFxrkiRp
 KZ0w==
X-Gm-Message-State: AO0yUKUV0XPpnqGtj7fxlX0pOsMi62AfAPo22t630LxpiKL8kCJGGe56
 FSBJXZ/VH0xp+wb3C9YAj/hdpQ==
X-Google-Smtp-Source: AK7set+McK1RPe3GpBWu3P7MFEwQKjsLDWG7Oa1cAEE/O5XaEGzDSYcoeFxsRg7zC9IZ0s73C10b/g==
X-Received: by 2002:a62:844c:0:b0:5db:db1c:37f9 with SMTP id
 k73-20020a62844c000000b005dbdb1c37f9mr27032665pfd.10.1678471144160; 
 Fri, 10 Mar 2023 09:59:04 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a62b404000000b00592591d1634sm113723pfn.97.2023.03.10.09.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 09:59:03 -0800 (PST)
Message-ID: <10c75176-64b7-f35f-b035-c2a69801e0f2@linaro.org>
Date: Fri, 10 Mar 2023 09:59:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-8-alex.bennee@linaro.org>
 <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
 <766cc218-dcbc-b6bf-d172-bb4d4ad0b7e2@linaro.org> <87wn3olcbw.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87wn3olcbw.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 3/10/23 09:56, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 3/10/23 09:39, Richard Henderson wrote:
>>> +    /* Undo any setting in generated code. */
>>> +    plugin_gen_disable_mem_helpers();
>>
>> Oh!  And this is the wrong function.  Should be
>> qemu_plugin_disable_mem_helpers.
> 
> Did I miss a newer version of the patches?

No, I never posted one, since you already said you picked it up with the requested changes.


r~

