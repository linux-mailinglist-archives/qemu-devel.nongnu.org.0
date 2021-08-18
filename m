Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78D3F0A80
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 19:49:13 +0200 (CEST)
Received: from localhost ([::1]:39596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGPgd-0001Zm-U1
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 13:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPf5-0000Wu-91
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:47:35 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPf0-0002Ke-Pn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:47:34 -0400
Received: by mail-pf1-x42f.google.com with SMTP id t42so330111pfg.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 10:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SWFb8lXcvxeR+Bkb/tbN+II76Lr3L0/87zgptJzCpDg=;
 b=tws6Sud94iKmAmtoT9ovfATdk+0HbiFBAzjI5IWrFxZ3FT6xOoWy4AGHeLHvP7zAIh
 FVv+FekyHjF+0qRXqWVw3wfnOrF93GWbh0dEIE57rzZpALRcND5r2R9ak4XjAOTPNVeo
 9UZCwuP5j952PrJVVp7j6eM/t/yeoseTGPB9ykekF47Kc6hnry0EmW7B3+q53vSwoujq
 PbTk7aZl6Db1TM67AN4YzzLAd2zetjcnqcNngIDX9Hw0WFt5d1V52XYkpA/g2M9tkFrS
 MFtUAIGqJlk5UXZj4ycThVPCkk/n0QrSqq8HIXMsl+u2Ud3FEZvDVXrSBT3LwrnQnn3p
 QmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWFb8lXcvxeR+Bkb/tbN+II76Lr3L0/87zgptJzCpDg=;
 b=qn0On37pfiOOtQQ3F5PhDziWYLN/deBtIxuRBPZ9lClv7I2RRx1lrLxnVh7qmVuHSI
 afj/AMk94hlZklld04RhnONGQ3pAFwiFrUJTkLOo70UxspBPfHDkWgCjr4lH8R1tB6VV
 lrIIjQnN2ctrzemZ7L+d4OZzUKxiWmDbPLQFiLoGbK9hGpG6q6IcA8al8W0gxeh57gbG
 vNrpuxb9/AZPILY0FWEfc+gKWfiAOBdSEdN25Pf/5e4X6sjo/atv4mwFlXeF7jH43cUE
 efknZXhxBEZI9fggfD26hFgrZuJ/N8ywABvufFXxsx3rUs43Ikmfjl1/IpFZftQHrRQn
 gTYg==
X-Gm-Message-State: AOAM5316NTyTGTlIc8tT/UBw+KWrhiMq/UBMtaLTmTJe61Da+SfAhp6d
 FwX2XNFVJPK7l0/i459cugpzop7TLktmkQ==
X-Google-Smtp-Source: ABdhPJwCNYAfVnoV6nHZ9LNnPmqYwMH11VYfGvYRnqEe3VAu1ONLkV74I71cC1djtgDxkaOTTTlCGQ==
X-Received: by 2002:aa7:8206:0:b029:3c6:2846:3f9f with SMTP id
 k6-20020aa782060000b02903c628463f9fmr10888873pfi.30.1629308849124; 
 Wed, 18 Aug 2021 10:47:29 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id b5sm442161pjq.2.2021.08.18.10.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:47:28 -0700 (PDT)
Subject: Re: [PATCH v2 20/55] accel/tcg: Report unaligned atomics for user-only
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-21-richard.henderson@linaro.org>
 <d6cdd362-016a-cf05-e444-ce5cd813957c@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <516c8bb6-3ed3-0ccf-9c02-366bdc018d88@linaro.org>
Date: Wed, 18 Aug 2021 07:47:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d6cdd362-016a-cf05-e444-ce5cd813957c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 10:51 PM, Philippe Mathieu-Daudé wrote:
>> -    void *ret = g2h(env_cpu(env), addr);
>> +
>> +    ret = g2h(env_cpu(env), addr);
>>       set_helper_retaddr(retaddr);
>>       return ret;
> 
> Can't we simply do:
> 
>         return g2h(env_cpu(env), addr);
> 
> ?

I think the idea was to narrow the range of instructions in which helper_retaddr is set, 
because {set,clear}_helper_retaddr contain barriers.  I didn't give it more thought this 
time around, just kept the ordering.

r~


