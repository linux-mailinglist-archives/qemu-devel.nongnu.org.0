Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FBF308245
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:14:49 +0100 (CET)
Received: from localhost ([::1]:48656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5HR1-0005E5-SO
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5HQE-0004nS-Hf
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 19:13:58 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5HQC-0004aw-Q8
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 19:13:58 -0500
Received: by mail-pg1-x536.google.com with SMTP id o16so5430749pgg.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 16:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nYncgofx76HdpLmofPOmy74zIpIOXoy36K4mFliTzPQ=;
 b=DzXOyPwkYR2ysbjx0x4iI5JvctEQFy/Kh3HCzgeCOTrxAzciyqJC0TOz9IP3Ranbol
 OLh60sVQuqGAq2TA2VjF1m27hXiwwXMuw28CZI8fc8c0IA5o1sloG5hncMxixiWlfFQi
 R8bo2Zd9T7sxRxPGoSlfel083GkgBUJLCZVFgdEavq8pW2fIvtGpVVI3E0qeqNsZQoIl
 SbRqj2Ce9cqFI/oHFa50h67zK7cwAIiiF6efJnq5l7uwDRVZKvn84RTjgVcGiQcAoaEC
 chznYlhtqHtFqP6ZSvBE9ilPa9O46NseDyrymThwKYmHxDGtd6JUEtp+FU1olZWswg7n
 sxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nYncgofx76HdpLmofPOmy74zIpIOXoy36K4mFliTzPQ=;
 b=Fu/uAHxc2DhmedbvuTGmGekoPezi+NLo3C0SouZ09b6M/0ImVbW/Xz6wI7iuytcer+
 VZVn864B9WUpnS6I0Nu6lSTqdiFF6V9HsDoaItHysYnMt3Z8l50S8fD7xNoLGKil1z/T
 3Um7OQSMwf9FZ+xPffLDeEszf0X3EF4MQG63dnvnF7SW6Ps2m3CBR9Fbiv+mT2V49JdX
 vK/S0STSZt+dAyuHKdkqAil+Ks0FcE8TzZFje4CfBgB8rUG/is2Zm0uQ0zv8dTWj6uiO
 a+yZZjsvE+1LyU0YXP1jv+YJd1qW8wjFpIEp95W6p3yEk0CF7LcCaQYyrrOp2dgDysTa
 86QA==
X-Gm-Message-State: AOAM5315IiYhWI7h1n76AqupMa5b9494oaO9ltlJyoilUNiuCtfJQNfz
 ilSf4+zoDQCVdbTz2T/LJ9OSy8uOJvBQpEEI
X-Google-Smtp-Source: ABdhPJzEeajjbAMxMAvt8D8ofLRJb+shL6RW79glB7IuWnY7hRycPNr4GhavL6gENU0qeahK2vlf7A==
X-Received: by 2002:a63:4e08:: with SMTP id c8mr1811013pgb.87.1611879234807;
 Thu, 28 Jan 2021 16:13:54 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id o1sm6680295pgq.1.2021.01.28.16.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 16:13:54 -0800 (PST)
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
 <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
 <9a51a203-f6a8-686f-7859-475537b3607a@suse.de> <878s8dujj5.fsf@linaro.org>
 <40ed971e-a4fe-77c5-94b9-28691874ee32@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0943e736-6847-4b6a-8433-f28f4692a299@linaro.org>
Date: Thu, 28 Jan 2021 14:13:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40ed971e-a4fe-77c5-94b9-28691874ee32@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 6:29 AM, Philippe Mathieu-Daudé wrote:
> On 1/28/21 5:08 PM, Alex Bennée wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> On 1/28/21 2:03 PM, Philippe Mathieu-Daudé wrote:
>>>> On 1/28/21 10:28 AM, Claudio Fontana wrote:
>> <snip>
>>>>> +
>>>>> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>>>>> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
>>>>> +typedef struct AccelCPUClass AccelCPUClass;
>>>>> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>>>>> +
>>>>> +typedef struct AccelCPUClass {
>>>>> +    /*< private >*/
>>>>> +    ObjectClass parent_class;
>>>>> +    /*< public >*/
>>>>> +
>>>>> +    void (*cpu_class_init)(CPUClass *cc);
>>>>> +    void (*cpu_instance_init)(CPUState *cpu);
>>>>> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
>>>>
>>>> If we want callers to check errp, better have the prototype return
>>>> a boolean.
>>>
>>> Good point, the whole errp thing is worth revisiting in the series,
>>> there are many cases (which are basically reproduced in the refactoring from existing code),
>>> where errp is passed but is really unused.
>>>
>>> I am constantly internally debating whether to remove the parameter altogether, or to keep it in there.
>>>
>>> What would you suggest?
>>
>> I think it really depends on if we can expect the realizefn to usefully
>> return an error message that can be read and understood by the user. I
>> guess this comes down to how much user config is going to be checked at
>> the point we realize the CPU?
> 
> cpu_realize() is were various feature checks are, isn't it?
> 
>   -cpu mycpu,feat1=on,feat2=off
>   CPU 'mycpu' can not disable feature 'feat2' because of REASON.

Yes.  And while changing the return type of realize is probably a good idea, it
should be a separate patch.


r~

