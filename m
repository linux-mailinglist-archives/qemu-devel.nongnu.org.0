Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10233AFA9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:14:26 +0100 (CET)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkEz-00030v-8T
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLkDm-0002Zm-Em
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:13:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLkDk-0000Rl-8z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:13:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id l12so8363076wry.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jcv49GdD4PUOasaNqY8pJqFRxWw6IxkP+Rfm7zaY388=;
 b=cscy/Z/p+VjQNiQG1p2frvZbW1QuiErDmLaH02JWCKK8sV+7kXL4335VVgkDsuo/Xt
 C7Wk9MCyxlCOdKKT1UELrWyTLbKSvbnwR1ZO3alZnrSrP7xcvmAsZkdU5IAmv+dEK05N
 Du/EEWqQZikdl2B9c2jY8+geIW39rsnc5NdOGaM2j5t1cDIzyPTBlBVwPNf7/FRojh+7
 PMaCNkdIXqwuAtje8l8X+ZD1QcVZ3fzaIEy7UkeqMNFvyXSCfJ8oqCC6+lXATxlwD/W+
 YH4403teG+a/TTuByZIdBn5NHcij+9JEbTLgW9getEkruVyh/Hc/VIYt0JZLgzRj1UUa
 hCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jcv49GdD4PUOasaNqY8pJqFRxWw6IxkP+Rfm7zaY388=;
 b=fZwSd9EawRpRKWWsEUXIqwu+NI/6YR7kHoonVAlIUuYSbLwfsckeR+pbv6KSxNYMKu
 8NKusEgTqWQJNXReorMU4woEwowMx7ZFs5afYKQUULyY/IQaHY3th6VN8XeDpiW4omFL
 slfb4mgGj8FzN/XPyn8lVnTHuwevdVR33dRFjGociOBTa7+pAQsJz+0W6/O2Dl7aZJJ3
 QdrHygnq4h28aFWhyhyyANaDZsQFaAsISFCAZE73Xy6LXgCllLVhenhyMQONvuE6ye0p
 Uwoy9pGgUESSIBy/wMd18+97uDVM4S9eZWCjSXaEu3/d5qePCUnQsTBJe09fx5kIhC4j
 aIgg==
X-Gm-Message-State: AOAM53150xLNNXZbx7N+422sOToZKcuI9NWLSmuSGnDVcJT0OUQy99il
 DjP3TUN60Wt/bbWV2FH1ts8=
X-Google-Smtp-Source: ABdhPJxYNLvuWJeXhEiHu584uqd+ycY6Xc9vjC8WAse4msOw5ZsbSh4vT1ogxAESxwpdL9q2yMuSag==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr26807114wrc.271.1615803186770; 
 Mon, 15 Mar 2021 03:13:06 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s23sm11388756wmc.29.2021.03.15.03.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 03:13:06 -0700 (PDT)
Subject: Re: [RFC PATCH 4/8] qtest/fuzz: Restrict CPU I/O instructions
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-5-f4bug@amsat.org>
 <1f96a4af-dd90-c67d-adcf-d3e67e2867b5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <17d49b66-0e52-1440-8b13-33b896194469@amsat.org>
Date: Mon, 15 Mar 2021 11:13:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1f96a4af-dd90-c67d-adcf-d3e67e2867b5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 6:14 AM, Thomas Huth wrote:
> On 15/03/2021 00.29, Philippe Mathieu-Daudé wrote:
>> Restrict CPU I/O instructions to architectures providing
>> I/O bus.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tests/qtest/fuzz/generic_fuzz.c   | 16 ++++++++++------
>>   tests/qtest/fuzz/qtest_wrappers.c |  4 ++++
>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/qtest/fuzz/generic_fuzz.c
>> b/tests/qtest/fuzz/generic_fuzz.c
>> index ee8c17a04c4..3e0089f4a63 100644
>> --- a/tests/qtest/fuzz/generic_fuzz.c
>> +++ b/tests/qtest/fuzz/generic_fuzz.c
>> @@ -304,6 +304,13 @@ static bool get_io_address(address_range *result,
>> AddressSpace *as,
>>       return cb_info.found;
>>   }
>>   +static bool get_mmio_address(address_range *result,
>> +                             uint8_t index, uint32_t offset)
>> +{
>> +    return get_io_address(result, &address_space_memory, index, offset);
>> +}
>> +
>> +#ifdef TARGET_HAS_IOPORT
> 
> Sorry, but the qtests are generic code, I don't think we should
> introduce target specific ifdefs here...?
My view is if you want to generically access an I/O bus, you need
to do it via its address space, not the CPU architecture-specific
interface.

I.e., if an I/O bus is exposed by the PCI function of a south bridge,
if you use the correct PCI AS view you can run your test on any
architecture providing a PCI bus, not only X86.

So yes you are right, and the current code is abusing it. Yes it is
fixable but is it worthwhile? Apparently nobody cared, so probably
not worthwhile. Let's disregard this series for now.

Regards,

Phil.

