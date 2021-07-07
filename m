Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EAA3BE08E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:27:01 +0200 (CEST)
Received: from localhost ([::1]:35938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wL6-00032v-2F
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wJl-0002B4-M8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:25:38 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wJg-0005Lk-Fq
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:25:37 -0400
Received: by mail-pf1-x430.google.com with SMTP id 17so712740pfz.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z62utcjqBVlP06CGi/1FmtsCn7WgwyZGzXx/c2PyE2U=;
 b=zQdwvugInjEC+Y1dfdR8Kg2+D+fwGFYaMjflJHkV5a89SH2ir5VSA45UInExxkNY3g
 WIHHlaRrRpT8hqdTVSTGZZb0Tc/DCnThDz73usUdnwiRDe+wxusRNwtc6VUIZh37OmbI
 7CuS5GCR2rAxzvpXrLevk3mV0SMOK6/9RmS8UcU8fNxWUJs9mvW1hiIGxsnssSm6L0t7
 TcoF0UFUn2/ZWNLcHWfrmk2VHKEL/BjgJxbfWQs6hgKYI3x8wdVUFQlgPx/8Qm+cBEiv
 stLjsy8AvlyofpIFvY+3fFH2OY+LS3afUDBLK+fvmUfRE9r5WvOJaqegCudO8F1EeqLR
 wRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z62utcjqBVlP06CGi/1FmtsCn7WgwyZGzXx/c2PyE2U=;
 b=WGbCaSoOi1LRpZlwAfX/pLk39htAe8iiAyImUwrm5/UZdACVnQDO3Wa1zFrgSIdX/4
 zOC93CqZugaqpRidCxqBUZB5Kqhu6YOv1wwP0sHHAxgsbFaqC9YKXDZ/tzKBZF0ezx5L
 58G3F2Kla4DsIEwKqIzUNFJu8UtKLUMg62fEVTDQKmbgMa+Q4Ea//n5dGJLnZDkKxusK
 50YL7y/H3h8J4ODCR9qb91YgUYcDO02VYD+f3mYPqnF/lWpWXivW/+QswlkXVM2Xd8D3
 /XE0ypHr0brfG5lcrzXSWHq11AT4bS5NoF8zdKjYdcXdYY8RFQo4pEva+AReZ+uFNrZ9
 KSIA==
X-Gm-Message-State: AOAM532xWISF6QtQKb+SeXiw5TT+UiGhssw0rLk4+gJ8cRJDFBqcAPzk
 oBJT417EGlQZ0sL+J5KZ/58Wzw==
X-Google-Smtp-Source: ABdhPJxAfAQV4wXuK3doUBO3o2YA2b+QNZ+AH4X6EzmnCcZIpdtzgIgWLACZjrDWp/GgXDn3j5ikRw==
X-Received: by 2002:a62:3813:0:b029:312:6fd4:13d1 with SMTP id
 f19-20020a6238130000b02903126fd413d1mr22715118pfa.76.1625621130859; 
 Tue, 06 Jul 2021 18:25:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p20sm20690773pgi.94.2021.07.06.18.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:25:30 -0700 (PDT)
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
 <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
 <CAFEAcA9n-3-0V4==-j5-vBFsMHtHmXtkctxsyYEVWi-obipRBw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <137e8616-f4d9-9824-56aa-b20f8c784305@linaro.org>
Date: Tue, 6 Jul 2021 18:25:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9n-3-0V4==-j5-vBFsMHtHmXtkctxsyYEVWi-obipRBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 4:45 AM, Peter Maydell wrote:
> On Fri, 2 Jul 2021 at 12:02, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Peter,
>>
>> On 7/2/21 12:40 PM, Peter Maydell wrote:
>>> Currently the pl061_read() and pl061_write() functions handle offsets
>>> using a combination of three if() statements and a switch().  Clean
>>> this up to use just a switch, using case ranges.
>>>
>>> This requires that instead of catching accesses to the luminary-only
>>> registers on a stock PL061 via a check on s->rsvd_start we use
>>> an "is this luminary?" check in the cases for each luminary-only
>>> register.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>   hw/gpio/pl061.c | 106 ++++++++++++++++++++++++++++++++++++------------
>>>   1 file changed, 81 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
>>> index a6ace88895d..0f5d12e6d5a 100644
>>> --- a/hw/gpio/pl061.c
>>> +++ b/hw/gpio/pl061.c
>>> @@ -55,7 +55,6 @@ struct PL061State {
>>>       qemu_irq irq;
>>>       qemu_irq out[N_GPIOS];
>>>       const unsigned char *id;
>>> -    uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
>>>   };
>>>
>>>   static const VMStateDescription vmstate_pl061 = {
>>> @@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
>>>   {
>>>       PL061State *s = (PL061State *)opaque;
>>>
>>> -    if (offset < 0x400) {
>>> -        return s->data & (offset >> 2);
>>> -    }
>>> -    if (offset >= s->rsvd_start && offset <= 0xfcc) {
>>> -        goto err_out;
>>> -    }
>>> -    if (offset >= 0xfd0 && offset < 0x1000) {
>>> -        return s->id[(offset - 0xfd0) >> 2];
>>> -    }
>>>       switch (offset) {
>>> +    case 0x0 ... 0x3fc: /* Data */
>>> +        return s->data & (offset >> 2);
>>
>> Don't we need to set pl061_ops.impl.min/max_access_size = 4
>> to keep the same logic?
> 
> I think the hardware intends to permit accesses of any width, but only
> at 4-byte boundaries. There is a slight behaviour change here:
> accesses to 0x3fd, 0x3fe, 0x3ff now fall into the default case (ie error)
> rather than being treated like 0x3fc, and similarly accesses to 0xfdd,
> 0xfde, 0xfdf are errors rather than treated like 0xfdc. But I think
> that it's probably more correct to consider those to be errors.
> 
> (We could explicitly check and goto err_out if (offset & 3)
> right at the top, I suppose.)

Perhaps just better to retain current behaviour with this patch by extending the case to 
the ends.  If you want to check oddness of offset, use a separate patch.


r~

