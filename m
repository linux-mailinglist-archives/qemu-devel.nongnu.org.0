Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854506FA4DD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:04:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvxiU-00023y-0w; Mon, 08 May 2023 06:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvxi4-0001fr-1F
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:03:13 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvxhy-0003z9-94
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:03:11 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9619095f479so683267366b.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683540183; x=1686132183;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VvWCQjr5tSxYzn7N8yKObQDzC0YUASVVBrI08afApL8=;
 b=mTYW+VT83B0sRHlwU6HxccgQipB5C5Wsb92yo6SxARgxTCFiIgQ1EMfg4kHggQL8Ey
 PCrNiRC/GTuA/vp5aSehfbew2Fkg4+XZX43igjjaYPTzh2wghl0+efQV1jWmXfz8Ro7U
 VCn4vlUccnxuhtlhkElBQdpuqEJ2zq6+qif3nZAtd6sYLdqCZbcXOm6xM/PdfkHReZPd
 6qeabiCMbK7iQuxCjq7DsRbIhRIiwtZLd+f6Pt+MtzARsrgTdbc1WKH5Xcy/MPXm1enP
 WyRTvcuNfdjZkj+uw1LYtKzKnheMloSZHkSLvEgE4nZ7AO17cPy0smMeUTPIZrsX+B90
 BqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683540183; x=1686132183;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VvWCQjr5tSxYzn7N8yKObQDzC0YUASVVBrI08afApL8=;
 b=kMxUc9SirtMq0sNo2XolkobiWNCag3icUAqKsSJv8gJkInI43s+MgZkLKEybKepfMq
 87bkoY0CsWh1UoKj4FnTsx3U2ympBGa7ZkIGDfmmssfRVPxSMnnallzHZARuO3YaEoz5
 cKhJJazNWrtFbibzKYfZp03/Th58JCFgtW9WCqdtwmJDsEfxWHH5/DlAR0qmJUtB8WP9
 5Pjr/WJAI0eE5pg8R9cfTuGJE6VEnwuJadIG5c0wu89rywkvOVcpC2e5VYOTDUFSZqos
 P9JufWF3LZe639dB2llfev7Xl4Md2vkf7B7sd8mtPjzTp0Rwd3JHjM64JsuThXh8Dik0
 Z64A==
X-Gm-Message-State: AC+VfDxZMcsBFvxRJoSAh5pHQO1mFO2Q+fr7xVFo6D909vawb5hq97T8
 AqeuOxWH0TyyBacW341s0efRog==
X-Google-Smtp-Source: ACHHUZ4We/DO5dEz8nw7UDQY74z3Pat8axMfjC+GOgg27vVpCz9zmmI2us8UCQExqThBT246qEv3HA==
X-Received: by 2002:a17:907:2684:b0:94e:75f8:668 with SMTP id
 bn4-20020a170907268400b0094e75f80668mr7815275ejc.56.1683540183151; 
 Mon, 08 May 2023 03:03:03 -0700 (PDT)
Received: from [192.168.110.227] ([91.223.100.33])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a1709065dd800b0094f44bdf7acsm4766398ejv.57.2023.05.08.03.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:03:02 -0700 (PDT)
Message-ID: <bde2c98e-f087-44aa-4164-9a24d5d8e9c7@linaro.org>
Date: Mon, 8 May 2023 11:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-4-richard.henderson@linaro.org>
 <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
 <45cba357-ba20-399a-27e6-5e99741179d0@linaro.org>
 <CAFEAcA9h6myNpkgmamxLHp_8We97eyGQpDb4PKPnwqL8rRzSTQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9h6myNpkgmamxLHp_8We97eyGQpDb4PKPnwqL8rRzSTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.964,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/7/23 11:09, Peter Maydell wrote:
> On Fri, 5 May 2023 at 19:57, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/4/23 16:02, Peter Maydell wrote:
>>> On Wed, 3 May 2023 at 08:15, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> Instead of playing with offsetof in various places, use
>>>> MMUAccessType to index an array.  This is easily defined
>>>> instead of the previous dummy padding array in the union.
>>>>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>
>>>> @@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>>>        if (prot & PAGE_WRITE) {
>>>>            tlb_addr = tlb_addr_write(tlbe);
>>>>            if (!tlb_hit(tlb_addr, addr)) {
>>>> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>>>> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
>>>> +                                addr & TARGET_PAGE_MASK)) {
>>>>                    tlb_fill(env_cpu(env), addr, size,
>>>>                             MMU_DATA_STORE, mmu_idx, retaddr);
>>>>                    index = tlb_index(env, mmu_idx, addr);
>>>> @@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>>>        } else /* if (prot & PAGE_READ) */ {
>>>>            tlb_addr = tlbe->addr_read;
>>
>> read
>>
>>>>            if (!tlb_hit(tlb_addr, addr)) {
>>>> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>>
>> write
>>
>>>> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
>>>> +                                addr & TARGET_PAGE_MASK)) {
>>>
>>> This was previously looking at addr_write, but now we pass
>>> MMU_DATA_LOAD ?
>>
>> This is the read portion of the read+write check.  The write portion is above in the
>> previous hunk.  So this is an existing error, fixed here, and I hadn't noticed.
> 
> Yeah, I wondered if it was a pre-existing bug. We should split out
> the bug fix.

https://patchew.org/QEMU/20230505204049.352469-1-richard.henderson@linaro.org/

r~


