Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36286EC216
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 21:43:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqfbu-0006tH-9d; Sun, 23 Apr 2023 15:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqfbs-0006st-TJ
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:42:56 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqfbr-0002Py-DG
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:42:56 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso23615005e9.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 12:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682278969; x=1684870969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W1xS84Dn4uvl/JO8QYD1ymthmpCSMK/OtwxLRKbPRh0=;
 b=nvD1MOA/CIdi9u5VCUccnZyXy/5yqkFWKbAFfhwAKSJAQTi7jjhuYQ+bWGZOf3V/OD
 LxTNo5hOIpBXPE9hf+ruu6+sb683oxRUx5y/57q4uGd3e0bvd0DAcu5THoqwoKTfGZ8o
 ibyI8084cqYHmiT38FkgTaEt5YeWUVyFZfgpclI8zQ2QeFNCpLbeFwOs5RQvW5O3axno
 tfw1JCmmIRTogtyImLMKig3sZrx7sAKs8BXMrFUyk3Ci6YFTIDxG8+7vxcTcRuuXDtuB
 682UfuUP8elFzeCCINP0oowDh3Tnj0N85B/dtg2ufilETKztiVtKYqPlHZ8A+IuWiJo/
 4Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682278969; x=1684870969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W1xS84Dn4uvl/JO8QYD1ymthmpCSMK/OtwxLRKbPRh0=;
 b=NDeBBng9rJLlQ/cBPqX2S4SxcFnOYKJsJQs6F/7pK3k2XTwFnBPn4jsgbB96/aFIRZ
 9K82ARcPuSCzBdMy+C0dgjSNPBeDWnJijZ0ie0d0YJnM8FUrmC/81x0YPLuFgI3PHAjC
 0Hbjo9aGZ3I5n0uId+wZR7/ssvyJv3BJ1zEKSpwnfjU4oFx8H8Kv4OEjUUVZr8VvJms/
 jCv10oJCLuxJfPK8o3vlYhhrhnQANmfMSLm+bRlXUy5384wa4nqgnGxk6L0XErmGnTm0
 GllkbHrtq34jES34kjzoSrxFIh10eshOG6yPmQ9EyPYAWNPITFdf9qAQWzZm+ZacW2J8
 49ew==
X-Gm-Message-State: AAQBX9cEytjrrOG1ys9AnEDNUeoyB5vLmtq9UDpKDw527cdDnou1w5nP
 o4SpEhMu4KJCRTArojRy4BhxUw==
X-Google-Smtp-Source: AKy350ZuzO71LMwwIlWW8PNtAZKsXFnZIVxF9+Q4X/531cn+0fOX6ekz1cslDCiXh3NW1LwEPHnwrg==
X-Received: by 2002:a1c:4c16:0:b0:3f1:9a5a:b444 with SMTP id
 z22-20020a1c4c16000000b003f19a5ab444mr3557435wmf.15.1682278968976; 
 Sun, 23 Apr 2023 12:42:48 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003ed2c0a0f37sm10334873wmj.35.2023.04.23.12.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:42:48 -0700 (PDT)
Message-ID: <97043d98-60f1-8820-8ae6-998b44e41528@linaro.org>
Date: Sun, 23 Apr 2023 20:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/8] cpu: Replace target_ulong with vaddr in
 tb_invalidate_phys_addr()
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, ale@rev.ng, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 qemu-devel@nongnu.org
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-8-anjo@rev.ng>
 <19f888bd-f0f4-2307-90c1-744f16ca77c2@linaro.org>
 <fe84e730-88e6-3b68-1929-758868757c68@linaro.org>
 <2c803abc-0f24-ecc6-fc14-56e674994829@linaro.org> <87jzy2e6i2.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87jzy2e6i2.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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

On 4/23/23 20:35, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 4/23/23 18:29, Philippe Mathieu-Daudé wrote:
>>> On 23/4/23 11:14, Richard Henderson wrote:
>>>> On 4/20/23 22:28, Anton Johansson wrote:
>>>>> -void tb_invalidate_phys_addr(target_ulong addr)
>>>>> +void tb_invalidate_phys_addr(vaddr addr)
>>>>
>>>> Hmm.  This isn't a virtual address, so 'vaddr' isn't right.
>>>> I'm sure we have something more appropriate.
>>> tb_page_addr_t?
>>
>> No, it isn't a ram_addr_t either (see exec-all.h).
>> Perhaps just uint64_t.
> 
> Surely hwaddr?

Duh.  Thanks,


r~


