Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAD26A0DC5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:21:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEKU-0007eW-BX; Thu, 23 Feb 2023 11:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEKP-0007dz-E3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:20:17 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEKN-0002Pj-PN
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:20:17 -0500
Received: by mail-pj1-x102a.google.com with SMTP id pt11so14230262pjb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0N5/W6qgvMoVVcxzs8tB9yIJh7BwUfPEU4dj5oWBadw=;
 b=DwWWbTpYX1G0SlJMqvby8SNZchNdzF/+9kjp70Ris5tcBl69MWdpoagEDqWVdvcIdf
 qBZIbrBhwoS/6KrD0R2gNKZZ6B0dYoOti62AFY7AWwitvdHd3UO0kxm0BBhgBTyr+CbR
 e6IybjxrNJbP+heBClCupDAqnBHfrrsMC88JJvX7qpkgiHaff5F1czDXLTa5MsY6zzNl
 NeejVoUBVUafDG++8CQZMzruOHqOja85O4cenJlLckGLXn8ru6vmC6DE7AIi1slCNC9B
 kAZxf6XZx7LXtZZTZtkoYZU5nGen9c40hJ+NEjJ4iZJMb18Xs45QbLyWmTP1cdErfkeI
 ykrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0N5/W6qgvMoVVcxzs8tB9yIJh7BwUfPEU4dj5oWBadw=;
 b=wCEz00OHjYR434eUQDBhub13dPRJFei/vRGc32c0i2AVGy4byIP1w8QENX+DKb7jB0
 WSk7HpXH8TkM/HC9GDN7EdlYKh0/M9utApjF8gykfJSKXZYD/UGUyCQXY+p6joLfJTIn
 MkCcIze+gtXG9cOU4H7yBg4KTZfY9G2FM97HwGRynOGGlwcdyiKQ7RjTrjCWQMjpjPqD
 myqcvIrqVJe7aD1n7DnXQO21nS/UH/RvE/4j/8AYZhaiIB38wpc/YMQ2hW7XgzWXGgVK
 l/I0ss1JzSuQACxS4Tc5RMWvyCSZQ25wiyaOnrI4nrlSi2pJSvwowVQ4iOhNyW3jxFsP
 yEcw==
X-Gm-Message-State: AO0yUKXSAA8DHQbFriEldfEXWBrVahKR4+7xNp/s4qPOu3EzFSKw7z6v
 65TFfGyjzDNVWe8DCp5p4CVwuQ==
X-Google-Smtp-Source: AK7set/ceBngj26fMTqFUR+L0MtP17LxypzTtmfOA23JVTZI85FHbK+ISC0g8gpRRD2pdVS9CExeDw==
X-Received: by 2002:a17:902:f644:b0:19a:b588:6fe2 with SMTP id
 m4-20020a170902f64400b0019ab5886fe2mr12599955plg.13.1677169213693; 
 Thu, 23 Feb 2023 08:20:13 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a7-20020a170902b58700b0019abd4ddbf2sm5381629pls.179.2023.02.23.08.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 08:20:13 -0800 (PST)
Message-ID: <d08b115f-ecf3-c71f-ab10-d7b221a262e2@linaro.org>
Date: Thu, 23 Feb 2023 06:20:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 04/19] target/arm: Use tcg_gen_qemu_st_i128 for STZG,
 STZ2G
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-5-richard.henderson@linaro.org>
 <CAFEAcA9RGYhU3wryevfPQcn1xKSQk6MVaCgfhGpPUXq=L5=_LA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9RGYhU3wryevfPQcn1xKSQk6MVaCgfhGpPUXq=L5=_LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 05:24, Peter Maydell wrote:
> On Thu, 16 Feb 2023 at 03:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This fixes a bug in that these two insns should have been using atomic
>> 16-byte stores, since MTE is ARMv8.5 and LSE2 is mandatory from ARMv8.4.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
>> index a981de62d4..04974f9ebb 100644
>> --- a/tests/tcg/aarch64/mte-7.c
>> +++ b/tests/tcg/aarch64/mte-7.c
>> @@ -19,8 +19,7 @@ int main(int ac, char **av)
>>       p = (void *)((unsigned long)p | (1ul << 56));
>>
>>       /* Store tag in sequential granules. */
>> -    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
>> -    asm("stg %0, [%0]" : : "r"(p + 0x1000));
>> +    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));
> 
> Why did we need to change the test program ?

It gives us a test of the stz2g insn.  We still have other instances of stg in the testsuite.


r~


