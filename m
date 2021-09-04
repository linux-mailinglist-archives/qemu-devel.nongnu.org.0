Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162FA400A70
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 11:25:46 +0200 (CEST)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMRvl-0004MO-4R
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 05:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRuC-0002yV-3D
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:24:08 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRuA-0000wP-Lb
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:24:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n5so2010658wro.12
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9ROmIcHB++v9m1K94VyqbfBOhP7DTNJJFVAaSSaRK8o=;
 b=wBu7hnSQavLF+ZeMhyEc8ABCJOqvTWCKDB9vRfGdQL/K4OMDwEHbDS24GhQ0YQEdHi
 jQBc85Wu97m6oe3Jc1y1Ubfe9QopMs7/UqufJqZRKkOxuBHbJFvCBSs/v4Gmikd8dJNZ
 9hVCtjcSsHFtYziK5MaT4Pbax3CDTYh7NA5TWwtfMrZ/YgqG7VS9hULUaS9TTfrDJBmE
 CayTqGYZgyo9hm45YTB7aVGzsaORrxPErKsroX6yxkVZmRfflw7wGWRk73z2d6oQOsv+
 vKxwE2qlBLNBsWiqYuvS7zgx4vH51xjbcgT7lcKM8rMsIJ5K24GskobTBbcJzpAih3WV
 L5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ROmIcHB++v9m1K94VyqbfBOhP7DTNJJFVAaSSaRK8o=;
 b=hrIX+nuUugci/J9XmjyY4I0JXIgD0Vw5U38W+Reb8xK5uHGslL1p1pUpEPu0i2+c9w
 tsQkeHMqFvi4rifO4+WRA5jiwNlj8OMJFtq8qqTSIarmtIIy8vvLELEZDxSossczztXj
 2ACGlu1VgnOicoET3AqRQdbGw91eMNxl8FmDlnpYzGJFuNoiix3t1I2h1HROO/Tbcz5P
 mx6qW5inkwc0VbKhffGRKfBFsq7Jmp9Kbnc1+laG36V/McJ7VQ0qVj/Z0g/wSjbA3+6p
 1hd0Wsz3b8XEv2Z2KWaeA2c4v62HTi6SStSLqjGhypgHAUbqtaGutB2ac8dLZxkIw6tC
 TF7w==
X-Gm-Message-State: AOAM530CNSvcgGgikwZ1bgt12VUjDKGDWUOgI1WBHj8LFLhgnDNwPQZD
 fNQPxHYiK5ys+hYC/QMdIpmjrQ==
X-Google-Smtp-Source: ABdhPJwWSv3UU1D0hv9PIaMfB1CP7ZO/CaF78cVTXjGBrIUJgczRnWyKrCA7TZgpGLH0TTynajTJXQ==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr3097785wrv.367.1630747444869; 
 Sat, 04 Sep 2021 02:24:04 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id n5sm1589288wmd.29.2021.09.04.02.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 02:24:04 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] memory: Extract mtree_info_as() from mtree_info()
To: David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210901161943.4174212-1-philmd@redhat.com>
 <20210901161943.4174212-3-philmd@redhat.com>
 <6623ad05-5e50-cadf-7486-22bfc41ff13e@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c4735d0-3b33-2829-719c-d365d11d99e5@linaro.org>
Date: Sat, 4 Sep 2021 11:23:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6623ad05-5e50-cadf-7486-22bfc41ff13e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 7:11 PM, David Hildenbrand wrote:
> On 01.09.21 18:19, Philippe Mathieu-Daudé wrote:
>> While mtree_info() handles both ASes and flatviews cases,
>> the two cases share basically no code. Split mtree_info_as()
>> out of mtree_info() to simplify.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   softmmu/memory.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 3eb6f52de67..5be7d5e7412 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -3284,18 +3284,12 @@ static void mtree_info_flatview(bool dispatch_tree, bool owner)
>>       g_hash_table_unref(views);
>>   }
>> -void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>> +static void mtree_info_as(bool dispatch_tree, bool owner, bool disabled)
>>   {
>>       MemoryRegionListHead ml_head;
>>       MemoryRegionList *ml, *ml2;
>>       AddressSpace *as;
>> -    if (flatview) {
>> -        mtree_info_flatview(dispatch_tree, owner);
>> -
>> -        return;
>> -    }
>> -
>>       QTAILQ_INIT(&ml_head);
>>       QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>> @@ -3316,6 +3310,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, 
>> bool disabled)
>>       }
>>   }
>> +void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>> +{
>> +    if (flatview) {
>> +        mtree_info_flatview(dispatch_tree, owner);
>> +    } else {
>> +        mtree_info_as(dispatch_tree, owner, disabled);
>> +    }
>> +}
>> +
>>   void memory_region_init_ram(MemoryRegion *mr,
>>                               Object *owner,
>>                               const char *name,
>>
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> I'd just have squashed that into #1.

Agreed, it seems like all part of one change.  Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

