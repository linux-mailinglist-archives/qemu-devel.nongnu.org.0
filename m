Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ACB644A30
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 18:19:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2bZr-0003Em-NV; Tue, 06 Dec 2022 12:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2bZp-0003Ed-5A
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 12:17:53 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2bZn-0000S8-Km
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 12:17:52 -0500
Received: by mail-oi1-x231.google.com with SMTP id r11so11959067oie.13
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 09:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V+TMoAicTh73a3t0knS0EF1dCoKePXHH/YCSaha1U+U=;
 b=hXEk18v8DTcLCGytJnDFJ3y17Je6z/yFW301v34HYFvMqs9eUSxJBn2ZxOQuTs/0N0
 jPZMqkwMZWihWLHcHhN+SYVvkaVxvi0hwSUstRr0u235vp3rOSaO71vDGlbkReKh6f6y
 h24D3F+EkpJpK2ybFYg4977lPuyith6oG6WN87Xsg/m+nWyabQS7s9qMEgJFzx3SAqDy
 fqHmvHwMb9Ahaiklw+IFnV8noU6GUrR8OoybtDLgsRyCscm7/uw/Gn1UrjhO+Musvbt9
 FvzCozeik4yz5e0sw5Hsm97+8lwSXD80K98F3Fg5K6e4G6m74qjJIeA6q1yvhj62GwQo
 FEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V+TMoAicTh73a3t0knS0EF1dCoKePXHH/YCSaha1U+U=;
 b=mgtQkuRe5Zyhf8t2x1HckuT0AqMmFXxepVTHws7ld63CUr+i8Y7Q8Yt5+AHhlXKQOV
 A8Xbp1XqrNV9ai+9tCLedMNZEMqM4NQNm/4uiiO2SAcE46QQsep7+XgCZxpz53Tywgpt
 6ql5pGHOohlC1iLP+euj7gdP4MpzijMPoApJD6pzDIkerIvSalCXNRH9Y3kzuZlYUWJL
 aAOfsE99LHc5tVZ1zK0hIUcnBjZVda+a5HaKnK3J1e5Foiv3vrY7czf1RCsBdxNdtXYb
 9tyzyzYxGb5kwNhF8jCfeNIC2tOjZzgtBCIFr6jy1lDtPOf+7sQ7dTS6BZiVGYpZ4JMp
 KKPg==
X-Gm-Message-State: ANoB5pn7hBWnO5TO1esGi4/771FYRq2chwieRol/9e2GhBZ4zcSRUwh1
 iDyaayg9j1/dketAhKu3NlKAkQ==
X-Google-Smtp-Source: AA0mqf53/vQ2F2MGTTbmImC0nBLWPHJceQIgTkZ5X7P6pIkKll0fG8DmBgbq7qf1fAEFCe8V6ivWGg==
X-Received: by 2002:aca:df41:0:b0:35c:4c52:9c71 with SMTP id
 w62-20020acadf41000000b0035c4c529c71mr4094213oig.106.1670347070240; 
 Tue, 06 Dec 2022 09:17:50 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:e319:9475:a359:f17a?
 ([2806:102e:18:70b5:e319:9475:a359:f17a])
 by smtp.gmail.com with ESMTPSA id
 u33-20020a05687100a100b0013ae39d0575sm11029599oaa.15.2022.12.06.09.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 09:17:49 -0800 (PST)
Message-ID: <d8f31ca7-70d0-946c-e475-0e29e0d3665d@linaro.org>
Date: Tue, 6 Dec 2022 11:17:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
 <5d1a9740-df5c-fa6e-8c67-1dcd7174df66@suse.de>
 <34f8c636-6963-8974-39e7-497167c5119a@suse.de>
 <3cee55bd-9ab6-ffaa-9abc-877f60f8f036@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3cee55bd-9ab6-ffaa-9abc-877f60f8f036@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 12/6/22 11:09, Philippe Mathieu-Daudé wrote:
> On 6/12/22 16:38, Claudio Fontana wrote:
>> On 12/6/22 15:53, Claudio Fontana wrote:
>>> On 5/17/21 13:11, Philippe Mathieu-Daudé wrote:
>>>> Guard declarations within hwaddr.h against inclusion
>>>> from user-mode emulation.
>>>>
>>>> To make it clearer this header is sysemu specific,
>>>> move it to the sysemu/ directory.
>>>
>>> Hi Philippe,
>>>
>>> do we need include/exec/sysemu/... .h
>>>
>>> as opposed to just use the existing
>>>
>>> include/sysemu/
>>>
>>> ?
>>
>> ...and I would if anything go include/sysemu/exec/ not include/exec/sysemu ,
>>
>> to highlight first that it is part of the sysemu build, when trying to reason about what 
>> gets built for sysemu vs anything else.
> 
> While refreshing this series I moved these files directly in include/sysemu/. Do you think 
> the exec/ subdirectory {help|meaning}ful?

I don't think exec/ is particularly meaningful.


r~

