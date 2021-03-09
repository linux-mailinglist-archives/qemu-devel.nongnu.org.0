Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE533288E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:27:32 +0100 (CET)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdKd-00042U-Cv
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJdIL-0001yD-AT
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:25:10 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:36728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJdIJ-00058D-IT
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:25:09 -0500
Received: by mail-oi1-x231.google.com with SMTP id o22so5348339oic.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CMRVDLAMG54DgSzJx/lpb5yO3lnYPAejo8w0RZyNzJU=;
 b=o2Xa/20s29lNZf4K8hBk1NgilBeXhu5SdMv6U/rCQj9cFspy0lzVJi1Mi/4dfGGQqe
 AOPHcgA5tI7ZZhZYL3IBn/QrFBBoZe6YdzYlS3BPmVWitAypb7sy3UozLh0VzQNC5Oda
 1R1JVu6vIjxSJvPXTB+8yjUVN9MdWjXpdQHePhmTMZNB4C3AECOL7vi/TyUINREbTUuI
 tzA7XSqfuJBA//FfLcqX/EaheaRspxk4tLu8/qH+puGeGE2AlpiVo6TcUm35LuvqICci
 +Y06+s0tS0zjOdOCk9KgI5kINRWcFgLx28ANWPR2/UKilFi9vNwr6zqqbfru/h3503AI
 MK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CMRVDLAMG54DgSzJx/lpb5yO3lnYPAejo8w0RZyNzJU=;
 b=n5fBpqahsKbXX7adLSpGQ3nke1kSNwPlbmx+XHj8b5Ex9Gdk3nvhnAIpvRFhpF716O
 GWgzl7RNtLX81hm55cqZQLXu8pZSukPYXcGproeNmwVipsTgBkqmXX2cbYAoA8u6Tjb8
 heMQJaGz3OhhQUoyUmon8ZhfhmQuL779nqmBq8GflYz4us92CYupRuM868P9aXbA4iUf
 kTcAbrLxygiMRO+RBHR3PtOtivOYIUq4Vc0XpnnjhYpSm06GnNGJyw/+UZ4o/lnROMBh
 nXDYot63RHFNFq9L5PhHIutY4HkFR7APZSlz4beia0ZyOy/ZeX3OFsBdkHx/aSApp+ss
 aIXw==
X-Gm-Message-State: AOAM53181S7oPw6uN7i5/ihd4abHot7JBuTBwI3Y3vGv+CJxtfw1Bz8B
 9rftlpKftLZhL4FheGeMFytD9g==
X-Google-Smtp-Source: ABdhPJwNbVCx0+2ZEz9bidU0LpZvG7+WhMBKjFDtZV2zUB403ubdTY9x7TcZsQSNWxRWhk7DEMAv4g==
X-Received: by 2002:a54:409a:: with SMTP id i26mr3159492oii.41.1615299905656; 
 Tue, 09 Mar 2021 06:25:05 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r22sm3377906otg.4.2021.03.09.06.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:25:05 -0800 (PST)
Subject: Re: [RFC PATCH 11/42] target/mips/tx79: Move PCPYH opcode to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-12-f4bug@amsat.org>
 <fdb4b0c2-f2f7-4355-c3ce-7729f108f87e@linaro.org>
 <ea4efce2-3f14-60e9-e4dc-13c9c07b6180@amsat.org>
 <f965bcf5-511e-b950-1474-93c24f931886@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb10d218-9315-32d1-59e7-bc5355918c4f@linaro.org>
Date: Tue, 9 Mar 2021 06:25:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f965bcf5-511e-b950-1474-93c24f931886@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 3:57 AM, Philippe Mathieu-Daudé wrote:
> On 3/8/21 11:48 AM, Philippe Mathieu-Daudé wrote:
>> On 2/15/21 5:26 PM, Richard Henderson wrote:
>>> On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
>>>> +    if (a->rt == 0) {
>>>> +        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
>>>> +        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
>>>> +        return true;
>>>> +    }
>>>
>>> Is there a good reason not to use gen_load_gpr?
>>
>> I suppose you meant gen_store_gpr*().
> 
> Double checking, we check for $rt, not $rd, right?

I think I meant gen_load_gpr on rt.


r~

