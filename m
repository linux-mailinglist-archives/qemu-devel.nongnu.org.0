Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256FF314533
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:03:11 +0100 (CET)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9HQs-0000vn-6n
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9F71-0006ez-0D
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:34:31 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9F6z-0003ex-4l
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:34:30 -0500
Received: by mail-pg1-x529.google.com with SMTP id j5so2391375pgb.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 14:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B3ycbnVqO5qmpQR0+kxdOZc1+K23PTet73ziktMTo8g=;
 b=jVvZMz3iWPboc5tLiQD9LbEE1VzgDrQX6vbfMNuBs2e2yxRUVoTgr4KzI0Oazc7nwS
 gbsJZWk0cNGF52uK1aNymTCoDzeE0JTI36Nyl9cNjjezOrxfw4uEBnzthHV/fjDMYvJj
 qQ1SlTWBS1N4PdZEsM7NZo8rR5+Qb7JczyXme5jZgLkRga38eIR39L22qVkOFqqtP7Ee
 NjzjN5cujGqgRL4dlACK8uNudHOOofiyO//dvZqOsUIL9Uu2AFe+WNPWVXIZBPbmqIa7
 6z0RyykNiU3eniI0qjyCfKYZBqchHqxBQv26QqkzxWAAQZ2kCyORzNgOy2qvyA9NJ63d
 7RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3ycbnVqO5qmpQR0+kxdOZc1+K23PTet73ziktMTo8g=;
 b=A+KPYcX9RPSe95iy+CJq4l21q9jaRew6giPRXu1ZGl2HdVoCrZMzYJpK6+JSiZtmdo
 7GvLiGw8l516cHZcusNnohUTSAtN9xvN/EweiMWpj15ipQiHpVpoa2AoJZqTEFHwglSm
 nrpz136wzjpdQH5sa9q6sAoOoAdrnHSP+IOO4TMKKaj55ouaIHUQwQTtkUfN4bVJPZvv
 WZykilMeMrRUWu8g8SGlS4KfarvfBoQCJciOtJxYQxjmpVhbJJmJowyuKvbLJpz6/1Tr
 /Ro6uUccuxbSz2C1EenggywDRQeC31yRU3Dc7tAztkADMKIXqFobHz3gSK/vTygaeBxh
 n+sA==
X-Gm-Message-State: AOAM532TryPQhmk9L9pYo6C6sL55xDIaZLuuWNKCqLnpwrWATpg6KfU0
 CHkUuAlC8eyFU6obhD6jrlO/VA==
X-Google-Smtp-Source: ABdhPJxrc0yntA8EvrHBZp80AedKIhBtVd/LCkesfnJRwyzPW15LWX4o3kvC5kXXwI5b+oLhZP9lPg==
X-Received: by 2002:a63:c84a:: with SMTP id l10mr19111782pgi.159.1612823667575; 
 Mon, 08 Feb 2021 14:34:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 r15sm20717845pgh.39.2021.02.08.14.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 14:34:26 -0800 (PST)
Subject: Re: [RFC PATCH v2 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-6-f4bug@amsat.org> <87im73aqsq.fsf@linaro.org>
 <83c71866-2e28-2edb-d79d-f4f96bb765a1@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e79856a7-f437-df71-f557-b2ace11ffb3e@linaro.org>
Date: Mon, 8 Feb 2021 14:34:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83c71866-2e28-2edb-d79d-f4f96bb765a1@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 5:52 AM, Philippe Mathieu-Daudé wrote:
> On 2/8/21 9:42 AM, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> Refactor debug code as tlb_assert_iotlb_entry_for_ptr_present() helper.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> What this code does is out of my league, but refactoring it allow
>>> keeping tlb_addr_write() local to accel/tcg/cputlb.c in the next
>>> patch.
>>
>> The assertion that the table entry is current is just a simple
>> housekeeping one. The details of how the MTE implementation uses
>> (abuses?) the iotlb entries requires a closer reading of the code.
>>
>>> ---
>>>  include/exec/exec-all.h |  9 +++++++++
>>>  accel/tcg/cputlb.c      | 14 ++++++++++++++
>>>  target/arm/mte_helper.c | 11 ++---------
>>>  target/arm/sve_helper.c | 10 ++--------
>>>  4 files changed, 27 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index f933c74c446..c5e8e355b7f 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -296,6 +296,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>>>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>>>                    hwaddr paddr, int prot,
>>>                    int mmu_idx, target_ulong size);
>>> +
>>> +/*
>>> + * Find the iotlbentry for ptr.  This *must* be present in the TLB
>>> + * because we just found the mapping.
>>> + */
>>> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
>>> +                                            uint64_t ptr,
>>> +                                            MMUAccessType ptr_access,
>>> +                                            uintptr_t index);
>>
>> Probably worth making this an empty inline for the non CONFIG_DEBUG_TCG
>> case so we can eliminate the call to an empty function.
> 
> But then we can't make tlb_addr_write() static (next patch) and
> we still have to include "tcg/tcg.h" for the TCG_OVERSIZED_GUEST
> definition...

Certainly you can, though it's not especially pretty:

#ifdef CONFIG_DEBUG_TCG
void tlb_assert_iotlb_entry_for_ptr_present
      (CPUArchState *env, int ptr_mmu_idx,
       uint64_t ptr, MMUAccessType ptr_access,
       uintptr_t index);
#else
static inline void
tlb_assert_iotlb_entry_for_ptr_present
      (CPUArchState *env, int ptr_mmu_idx,
       uint64_t ptr, MMUAccessType ptr_access,
       uintptr_t index)
{ }
#endif


r~

