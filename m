Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6F30004D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:31:23 +0100 (CET)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tis-0003z0-IW
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2tgP-0002zt-Kx
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:28:49 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2tgO-0006sN-9A
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:28:49 -0500
Received: by mail-ej1-x633.google.com with SMTP id a10so6913908ejg.10
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vvTBd1ZwQmJ1el6zUiZNzfn0KM9vNZmOQAnCe97ewdg=;
 b=Y7EhFvKA+iO2+wiRPQCrtTRRjwtJyPE45TqZFw7fK1egFBU0U6ixiYz4dyfTtk0pq6
 FykcC400XVvD7bOWc/1TXjOYubo7wRObPL8RbZZvQ44A8jRhc4VAxvjtk5eiRwFnvIPj
 h6cVojBVUysvqBA2D290ld5/PnDlazkF+DD9PnHHqovgqXNKnLMjMjOf9bDayOt04vqO
 g1M7ZSSFGurbKPDvMQuEJY3m04y1UxOKh7Zgv1DfgnGl7nsDYzXe578GFlO3rf99p00M
 mTVLcxGhIOZjN1W9+zyTWc70FvEhRE27bsEUzGQulRVb8zVpfmTymZMCybJ7TtwX0UI5
 L8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vvTBd1ZwQmJ1el6zUiZNzfn0KM9vNZmOQAnCe97ewdg=;
 b=B5s9Tqt7gh5K7kxXLPIAAWRUsxuZ3ecsv0jlY3EB+R63dd0CAeeB5wsc7Ii2t7vyXd
 eTZ3y/fC/PCPysM1xBnNAY7gdHIBF4JAqUEKVAF4NSFj2O0e4+C1raaowLeTGo/j2Aha
 +VaDPshEXKqv74BKDAxEjoB+wmcLU45Ja/U3WAIXRqOJvKi1ztlNdaITOcB8b6bHFN+L
 zbZYn1O/t9PGpx39+v4F30/i8hjAdvji6SS8XHgpKdNkZuDLCJgP90xPPGqf/c4I7Swd
 /0LGUip2JLn0zZNJ6dbHgMPjywuErMjMEM6wG0tvJIQSrJsZjuX8IroaqFm97n5kwc3c
 LQSw==
X-Gm-Message-State: AOAM5315In6m5gwoC+vXurkeyFIFQSYyO2731Ec8nxbqPTQKfrcQDW9c
 z65Ruy8I2HLSp0juG3yfvHigzLqAUuE=
X-Google-Smtp-Source: ABdhPJxvu83H3x4nUAFXRds1k+lafPiIglte8QYPLiovvn5aUHWV9qEWW/7mcgwSiNDqSUDWkMmlQA==
X-Received: by 2002:a17:906:409:: with SMTP id d9mr2438094eja.70.1611311327082; 
 Fri, 22 Jan 2021 02:28:47 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s2sm161845edx.77.2021.01.22.02.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 02:28:46 -0800 (PST)
Subject: Re: [RFC PATCH] linux-user/mmap: Return EFAULT for invalid addresses
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
 <d4ea76d141067563c24aacc99dab9aa753cd55a2.camel@linuxfoundation.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5b84c555-04ec-f85e-b90d-4cbaf0f7c355@amsat.org>
Date: Fri, 22 Jan 2021 11:28:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d4ea76d141067563c24aacc99dab9aa753cd55a2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing maintainer

On 1/22/21 10:37 AM, Richard Purdie wrote:
> On Fri, 2021-01-08 at 17:46 +0000, Richard Purdie wrote:
>> When using qemu-i386 to run gobject introspection parts of a webkitgtk 
>> build using musl as libc on a 64 bit host, it sits in an infinite loop 
>> of mremap calls of ever decreasing/increasing addresses.
>>
>> I suspect something in the musl memory allocation code loops indefinitely
>> if it only sees ENOMEM and only exits when it hits EFAULT.
>>
>> According to the docs, trying to mremap outside the address space
>> can/should return EFAULT and changing this allows the build to succeed.
>>
>> There was previous discussion of this as it used to work before qemu 2.11
>> and we've carried hacks to work around it since, this appears to be a
>> better fix of the real issue?
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>>
>> Index: qemu-5.2.0/linux-user/mmap.c
>> ===================================================================
>> --- qemu-5.2.0.orig/linux-user/mmap.c
>> +++ qemu-5.2.0/linux-user/mmap.c
>> @@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
>>           !guest_range_valid(new_addr, new_size)) ||
>>          ((flags & MREMAP_MAYMOVE) == 0 &&
>>           !guest_range_valid(old_addr, new_size))) {
>> -        errno = ENOMEM;
>> +        errno = EFAULT;
>>          return -1;
>>      }
> 
> Any comments on this? I believe its a valid issue that needs fixing and
> multiple distros appear to be carrying fixes in this area related to
> this.
> 
> Cheers,
> 
> Richard
> 
> 


