Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9877230448A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:13:20 +0100 (CET)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ru3-0001l6-MO
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4Rrl-0000O2-Td
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:10:57 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4Rrk-00076T-6k
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:10:57 -0500
Received: by mail-pj1-x102d.google.com with SMTP id g15so2600137pjd.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 09:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ugh5R04K55nASwcE5f02HiwZDz8uqE+EUVZkb2KWqDQ=;
 b=Yl3wA9qPwapXzt79TxVfRAg5mUSnA3xpLkwPJ0nJEHLxCiBcAnkITbWW9y+jHTfhkC
 6cgwhe3lCHxFyz7nS2Q/Q5qUF02AmUtBW2E6CeZtoqqw2DgFa/f/3PP5H2nuueo4Mq4u
 hSOq64Huna7QS4xJdXyUKTVNeLy4hvu1sOL8AWCA1iHRiGCdfApGSdH74yimcjn+Qw17
 IPu8EUs3QfWF+kkQGB4c5NMDjghIiTrZKy7cR+iAudACIWD5PcMtPaZufuoSHFdgHRvB
 eXsIeOazVM8yhxkp2HxeyILLyD+JkSpLTDzKimQtqYyq7j28Cx+Z3Gt/htLH8AkpamHx
 EA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ugh5R04K55nASwcE5f02HiwZDz8uqE+EUVZkb2KWqDQ=;
 b=aZlWxJR8BJmArQEzQtgJpArKAtFdNZ1hUz5HQ4TFxeOZ8ieHSuRsrRLLiJ3Cxz/XpF
 RKnlwvki52vzchZxoRtJpVW30lEWxcWB/SGEtmJcdjz9OcAam2UHHn8KG4/yCJeusLQi
 OxAgiU/+qaZPDlSuAeP+d1LUXE2lXaLDjQYvIdwDs034Tc+TxYUTTfnXvhVhbkRgrNgi
 jUAepcdBkBQcXhdRxS53be3ZTpuZgc2clbVyJ+Efb/xOl7nFdd7ae6UXPpUekHk+JXeR
 NIyDDypIplIvr3XXGDJwXnkejRFIr3T9rv7GIf43JbYkdvAwjiO6RJt6zbWqp5ri9ENo
 hYZw==
X-Gm-Message-State: AOAM531fYiF6ke8q+6kjAkP8KfDNF8CNkxmS3cAbEd2cfzScsYV9uEht
 HaddOTW9mv1KFluke/d3/gpMBQ==
X-Google-Smtp-Source: ABdhPJwIqj0WEIZYNdg59Tfuyzc3o8P6xF6X3pu2jXbHRelfbZqXkO3xKvGufxYtOiDMAVPTywQ3Cg==
X-Received: by 2002:a17:902:b986:b029:df:e5d6:cd71 with SMTP id
 i6-20020a170902b986b02900dfe5d6cd71mr7214714pls.42.1611681054520; 
 Tue, 26 Jan 2021 09:10:54 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id j5sm2848494pjf.47.2021.01.26.09.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 09:10:53 -0800 (PST)
Subject: Re: [PATCH v3 11/21] exec: Add support for TARGET_TAGGED_ADDRESSES
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-12-richard.henderson@linaro.org>
 <CAFEAcA_ALYdVn5YLBTN57D8a2ut3C5kt0bVb9faZEQe_-rxmPQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fee363da-f185-7d84-a43a-0983e5ae6c9c@linaro.org>
Date: Tue, 26 Jan 2021 07:10:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ALYdVn5YLBTN57D8a2ut3C5kt0bVb9faZEQe_-rxmPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 4:13 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 22:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The AArch64 Linux ABI has always enabled TBI, but has historically
>> required that pointer tags be removed before a syscall.  This has
>> changed in the lead-up to ARMv8.5-MTE, in a way that affects the
>> ABI generically and not specifically to MTE.
>>
>> This patch allows the target to indicate that (1) there are tags
>> and (2) whether or not they should be taken into account at the
>> syscall level.
>>
>> Adjust g2h, guest_addr_valid, and guest_range_valid to ignore
>> pointer tags, similar to how TIF_TAGGED_ADDR alters __range_ok
>> in the arm64 kernel source.
>>
>> The prctl syscall is not not yet updated, so this change by itself
>> has no visible effect.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/exec/cpu_ldst.h | 20 +++++++++++++++++---
>>  1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
>> index e62f4fba00..1df9b93e59 100644
>> --- a/include/exec/cpu_ldst.h
>> +++ b/include/exec/cpu_ldst.h
>> @@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
>>  #define TARGET_ABI_FMT_ptr "%"PRIx64
>>  #endif
>>
>> +static inline abi_ptr untagged_addr(abi_ptr x)
>> +{
>> +#ifdef TARGET_TAGGED_ADDRESSES
>> +    if (current_cpu) {
>> +        return cpu_untagged_addr(current_cpu, x);
>> +    }
>> +#endif
>> +    return x;
>> +}
> 
> The current_cpu global is a nasty hack and I don't like seeing
> new usages of it. In particular, it's very difficult to
> analyse in what places this will get called when current_cpu is
> NULL and whether it's always OK to not clean the tag in that
> situation.

Well, that'll be a really lot of changes to add cpu/env as an argument to
get_user et al.

Let's see how easily coccinelle can fix em all up for me...


r~

