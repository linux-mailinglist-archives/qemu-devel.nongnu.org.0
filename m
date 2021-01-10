Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B52F0915
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 19:41:23 +0100 (CET)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyfeV-0002K3-0g
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 13:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyfbv-0001sh-Qf
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 13:38:43 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyfbu-0002Jy-CF
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 13:38:43 -0500
Received: by mail-pl1-x632.google.com with SMTP id t6so8339690plq.1
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FO/HyCvLsxofLpoWFNpy0PrFoKfOdbv8M9gG/dRNdy4=;
 b=qy8xxY1apgDNBgzybRmj3P0vS5jvV6j0PZfd/wUGi4crNT3oSBnIsW5fmpybd854rW
 nwRfnGu625cKxeiaS1nptIN3vD/pNB6SWrwYIaec5GUn1H4zd23fMTJ6fJlSiAr/zTlY
 mPpWir0oHo+l9tUWD8ZlY9RsY6Is/t+Zj/NwhZ6N3PwHQFZdOjeFIx0VCPw25qvuICPa
 89KCgryRIJN1IXyzmP/CNOP/gDOw8L6NpZ/kUUogzcBl6aOPeWACj3PfIAKQ5+a5KXcf
 9nXhGUJSG9iMjhTLIbeGFts+4WucHKXm/s47bmIg1gFKxjNwINZZjqikwmzpkt6qFJDM
 p+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FO/HyCvLsxofLpoWFNpy0PrFoKfOdbv8M9gG/dRNdy4=;
 b=WUeWXE/JUyTyvFB6MNeRC00w5u8Ag6zNCHSP42/7afaQtlpv3hRFu/5CqoOnLEleGz
 5Qr9l9eu8q00C6QRvq96CdtizkBOfUGqy6QkWabEM5PTToGPN1tk85Xn/mt1MVHCJXxL
 laSf8QhwsW3i7G7buyD5VYHVIk8Fz7sal7ry1G+vqIYDkzuYAngeGIpR4LtiS+QWWZM4
 NElrRoQB/NFRAmN3OhPvvMAztjOsVUwbmJ5KjOUE17v7oYGrDU/EdeFv+Tah3T5Bfesy
 g40zBfq6eYHceSA8LfaZ9vpzDiaWwOs6qgy7GO0sdGfQquIiCEzXgDAhfZZ2jVEqi0f6
 7Q3A==
X-Gm-Message-State: AOAM532ys8mUT1B7wlHP7fkaM6mJCLKh+MuhNYlnkJtUVxoUxC0a8e2z
 Fko8kehuxU8aj8nY8b+TFqiyLg==
X-Google-Smtp-Source: ABdhPJwZLQD9hukSWh//3veL8M3jkcTMFqkOaPsW8aI9+eUefI5OOXvHW0bBt/bKR0hfVaxhsOaVOA==
X-Received: by 2002:a17:90a:708b:: with SMTP id
 g11mr13700180pjk.23.1610303920910; 
 Sun, 10 Jan 2021 10:38:40 -0800 (PST)
Received: from [10.25.18.117] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id y16sm16774308pfb.83.2021.01.10.10.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 10:38:40 -0800 (PST)
Subject: Re: [PATCH] hvf: guard xgetbv call.
To: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hill Ma <maahiuzeon@gmail.com>
References: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
 <X/lDozXFWfR4AZAU@SPB-NB-133.local>
 <CAFEAcA9bMbPFj=xFiHgDVg1X14kZOt0Bre-uH0fcjJzsaSk0qA@mail.gmail.com>
 <X/pccrqIQ9/N57j6@SPB-NB-133.local>
 <8da22f7f-7379-cffe-5fdd-94fd5ddece32@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a24ae1a-8114-a840-b6bf-ae3a301f6232@linaro.org>
Date: Sun, 10 Jan 2021 08:38:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8da22f7f-7379-cffe-5fdd-94fd5ddece32@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.012,
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
Cc: John Arbuckle <programmingkidx@gmail.com>,
 Richard Henderson <rth@twiddle.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/21 8:34 AM, Richard Henderson wrote:
> On 1/9/21 3:46 PM, Roman Bolshakov wrote:
>> +static int xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
>>  {
>> -    uint32_t eax, edx;
>> +    uint32_t xcrl, xcrh;
>>
>> -    __asm__ volatile ("xgetbv"
>> -                      : "=a" (eax), "=d" (edx)
>> -                      : "c" (xcr));
>> +    if (cpuid_ecx && CPUID_EXT_OSXSAVE) {
>> +        /* The xgetbv instruction is not available to older versions of
>> +         * the assembler, so we encode the instruction manually.
>> +         */
>> +        asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (idx));
>>
>> -    return (((uint64_t)edx) << 32) | eax;
>> +        *xcr = (((uint64_t)xcrh) << 32) | xcrl;
>> +        return 0;
>> +    }
>> +
>> +    return 1;
>>  }
> 
> Not to bikeshed too much, but this looks like it should return bool, and true
> on success, not the other way around.

Also, if we're going to put this some place common, forcing the caller to do
the cpuid that feeds this, then we should probably make all of the startup
cpuid stuff common as well.

Note that we'd probably have to use constructor priorities to get that right
for util/bufferiszero.c.


r~

